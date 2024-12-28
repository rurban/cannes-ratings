#!/bin/sh
parallel ./dump.sh $@ ::: $(cat dirs.txt)
