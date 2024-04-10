#!/bin/sh

$1 | diff - $2 || exit 1

echo "All OK!"
