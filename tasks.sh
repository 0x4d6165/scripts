#!/usr/bin/env bash
today="$(task list due:today | grep tasks | awk '{print $1;}')"
total="$(task list | grep tasks | awk '{print $1;}')"
echo "Tasks: $today/$total"
