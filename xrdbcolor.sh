#!/bin/bash

xrdb -query | grep color$1: | tr "\t" "\n" | grep "#"
