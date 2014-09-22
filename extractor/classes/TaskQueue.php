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
 * Description of TaskQueue
 *
 * @author Adirelle <adirelle@gmail.com>
 */
class TaskQueue implements Countable
{
    /**
     *
     * @var callable[]
     */
    private $queue = [];

    /**
     *
     * @var int
     */
    private $completed = 0;

    /**
     *
     * @param callable $callback
     * @param array $args
     * @return \TaskQueue
     */
    public function enqueue(callable $callback, array $args = [])
    {
        $this->queue[] = [$callback, $args];
        return $this;
    }

    /**
     *
     * @return boolean
     */
    public function process()
    {
        if(null === $task = array_shift($this->queue)) {
            return false;
        }
        list($callback, $args) = $task;
        call_user_func_array($callback, $args);
        $this->completed++;
        return true;
    }

    /**
     *
     * @return int
     */
    public function getCompleted()
    {
        return $this->completed;
    }

    /**
     *
     * @return int
     */
    public function count()
    {
        return count($this->queue);
    }

}
