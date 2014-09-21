<?php

/*
LibItemBuffs-1.0 extractor - Extract buffs provided by items from wowhead.com.
Copyright (C) 2013 Adirelle (adirelle@gmail.com)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

namespace Http;

use React\Dns\Resolver\Factory as DnsFactory;
use React\EventLoop\LoopInterface;
use React\HttpClient\Client;
use React\HttpClient\Factory as ClientFactory;
use React\HttpClient\Response;
use React\Promise\Deferred;
use React\Promise\PromiseInterface;

/**
 * Description of BasicClient
 *
 * @author Adirelle <adirelle@gmail.com>
 */
class BasicClient extends AbstractClient
{
    /**
     *
     * @var Client
     */
    private $client;

    /**
     * @var string
     */
    private $userAgent;

    /**
     *
     * @param Client $client
     * @param LoopInterface $loop
     * @param string $userAgent
     */
    public function __construct(Client $client, LoopInterface $loop = null, $userAgent = null)
    {
        parent::__construct($loop);
        $this->client = $client;
        $this->userAgent = $userAgent;
    }

    /**
     *
     * @param string $url
     * @return PromiseInterface
     */
    public function get($url)
    {
        $deferred = new Deferred();

        $locations = [ $url ];

        $request = $this->client->request("GET", $url, $this->userAgent ? ['User-Agent' => $this->userAgent] : []);
        $request->on('headers-written', function() use($url, $deferred) {
            $deferred->progress("Request sent for $url");
        });
        $request->on('response', function(Response $response) use($url, $deferred, &$locations) {
            switch(intval($response->getCode())) {
                case 200:
                    $deferred->progress("Receiving response for $url");
                    $deferred->resolve($response);
                    return;

                case 302:
                    $headers = $response->getHeaders();
                    if(!isset($headers['Location'])) {
                        break;
                    }
                    $location = $headers['Location'];
                    $circular = in_array($location, $locations);
                    $locations[] = $location;
                    if($circular) {
                        return $deferred->reject(new \RuntimeException(sprintf("Circular forwarding: %s", implode(' -> ', $locations))));
                    }
                    $this
                        ->get($location)
                        ->then(
                            [$deferred, 'resolve'],
                            [$deferred, 'reject'],
                            [$deferred, 'progress']
                        );
                    return;
            }

            $deferred->reject(new \RuntimeException(sprintf("%s: %d %s", $url, $response->getCode(), $response->getReasonPhrase())));
        });
        $request->on('error', [$deferred, 'reject']);

        $request->end();

        return $deferred->promise();
    }

    /**
     *
     * @param string $dnsServer
     * @param LoopInterface $loop
     * @return ClientInterface
     */
    static public function create($dnsServer, LoopInterface $loop)
    {
        $resolver = (new DnsFactory())->createCached($dnsServer, $loop);
        $client = (new ClientFactory())->create($loop, $resolver);
        return new static($client, $loop);
    }
}
