#!/bin/bash

cmp -l a08e01a.x a08e01b.x | gawk '{printf "%08X %02X %02X\n", $1-1, strtonum(0$2), strtonum(0$3)}'
