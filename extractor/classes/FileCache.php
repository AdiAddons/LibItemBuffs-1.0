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

/**
 * Description of FileCache
 *
 * @author Adirelle <adirelle@gmail.com>
 */
class FileCache
{
    /**
     *
     * @var string
     */
    private $path;

    /**
     *
     * @param string $path
     * @throws \RuntimeException
     */
    public function __construct($path)
    {
        if(!is_dir($path)) {
            if(!mkdir($path, 0777, true)) {
                throw new \RuntimeException(sprintf("Cache path is not a directory and cannot be created: %s", $path));
            }
        } elseif(!is_writable($path)) {
            throw new \RuntimeException(sprintf("Cannot write in cache diretory: %s", $path));
        }
        $this->path = $path;
    }

    /**
     *
     * @param string $key
     * @param string $content
     */
    public function store($key, $content)
    {
        $path = $this->getFilePath($key);
        $parent = dirname($path);
        if(!is_dir($parent)) {
            mkdir($parent, 0777, true);
        }
        file_put_contents($path, $content);
    }

    /**
     *
     * @param string $key
     * @return string|null
     */
    public function fetch($key)
    {
        $path = $this->getFilePath($key);
        return file_exists($path) ? file_get_contents($path) : null;
    }

    /**
     *
     * @param string $key
     * @return string
     */
    protected function getFilePath($key)
    {
        $hash = sha1($key);
        return $this->path.DIRECTORY_SEPARATOR.substr($hash, 0, 1).DIRECTORY_SEPARATOR.substr($hash, 1, 1).DIRECTORY_SEPARATOR.substr($hash, 2);
    }

}
