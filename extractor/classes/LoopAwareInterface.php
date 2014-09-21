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

use React\EventLoop\LoopInterface;

/**
 *
 * @author Adirelle <adirelle@gmail.com>
 */
interface LoopAwareInterface
{
    /**
     *
     * @param LoopInterface $loop
     * @return self
     */
    public function setLoop(LoopInterface $loop);

    /**
     * @return LoopInterface
     */
    public function getLoop();
}
