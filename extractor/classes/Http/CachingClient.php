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

use React\EventLoop\LoopInterface;
use React\Stream\ReadableStreamInterface;
use React\Stream\Stream;
use SplFileInfo;

/**
 * Description of CachingClient
 *
 * @author Adirelle <adirelle@gmail.com>
 */
class CachingClient extends AbstractClient
{
    /**
     *
     * @var ClientInterface
     */
    private $inner;

    /**
     *
     * @var string
     */
    private $cachePath;

    /**
     *
     * @param ClientInterface $inner
     * @param type $cachePath
     * @param LoopInterface $loop
     */
    public function __construct(ClientInterface $inner, $cachePath, LoopInterface $loop = null)
    {
        parent::__construct($loop);
        $this->inner = $inner;
        $this->cachePath = $cachePath;
    }

    /**
     *
     * @param type $url
     * @returm \React\Promise\PromiseInterface
     */
    public function get($url)
    {
        $file = $this->getCacheFile($url);

        if($file->isFile() && $file->getSize() > 0) {
            $stream = new Stream(fopen($file->getPathname(), "rb"), $this->getLoop());
            return \React\Promise\resolve($stream);
        }

        return $this->inner->get($url)
            ->then(
                function(ReadableStreamInterface $stream) use($url, $file) {
                    if(!$file->getPathInfo()->isDir()) {
                        mkdir($file->getPath(), 0777, true);
                    }
                    $path = $file->getPathname();
                    $unlink = function() use($path) { unlink($path); };
                    $output = new Stream(fopen($path, "wb"), $this->getLoop());
                    $stream->on('error', $unlink);
                    $stream->pipe($output)->on('error', $unlink);
                    return $stream;
                }
            );
    }

    /**
     *
     * @param string $url
     * @return SplFileInfo
     */
    private function getCacheFile($url)
    {
        $hash = sha1($url);
        $n1 = substr($hash, 0, 1);
        $n2 = substr($hash, 1, 1);
        $fname = substr($hash, 2);
        return new SplFileInfo("{$this->cachePath}/$n1/$n2/$fname");
    }
}
