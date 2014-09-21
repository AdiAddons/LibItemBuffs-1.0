<?php

/*
 * LibItemBuffs-1.0 extractor - Extract buffs provided by items from wowhead.com.
 * Copyright (C) 2013 Adirelle (adirelle@gmail.com)
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

namespace Http;

use Exception;
use React\EventLoop\LoopInterface;
use React\Promise\Deferred;
use React\Promise\PromiseInterface;
use React\Stream\ReadableStreamInterface;

/**
 * Description of QueuingClient
 *
 * @author Adirelle <adirelle@gmail.com>
 */
class QueuingClient extends AbstractClient
{
    /**
     *
     * @var ClientInterface
     */
    private $inner;

    /**
     *
     * @var int
     */
    private $maxRunning;

    /**
     *
     * @var int
     */
    private $running = 0;

    /**
     *
     * @var array
     */
    private $queue = [];

    /**
     *
     * @param ClientInterface $inner
     * @param int $maxRunning
     * @param LoopInterface $loop
     */
    public function __construct(ClientInterface $inner, $maxRunning = 5, LoopInterface $loop = null)
    {
        parent::__construct($loop);
        $this->inner = $inner;
        $this->maxRunning = $maxRunning;
    }

    /**
     *
     * @param string $url
     * @return PromiseInterface
     */
    public function get($url)
    {
        if($this->running < $this->maxRunning) {
            return $this->start($url);
        }
        $deferred = new Deferred();
        $this->queue[$url] = $deferred;
        return $deferred->promise();
    }

    /**
     *
     * @return PromiseInterface
     */
    private function startNext()
    {
        if($this->running >= $this->maxRunning || empty($this->queue)) {
            return;
        }
        list($url, $deferred) = each($this->queue);
        unset($this->queue[$url]);
        return $this->start($url)
            ->then(
                [$deferred, 'resolve'],
                [$deferred, 'reject'],
                [$deferred, 'progress']
            );
    }

    /**
     *
     * @param string $url
     * @return PromiseInterface
     */
    private function start($url)
    {
        $this->running++;
        return $this->inner->get($url)
            ->then(
                function(ReadableStreamInterface $stream) use($url) {
                    $stream->on('end', function() use($url) {
                        $this->running--;
                        $this->startNext();
                    });
                    return $stream;
                },
                function(Exception $error) {
                    $this->running--;
                    $this->startNext();
                    throw $error;
                }
            );
    }
}
