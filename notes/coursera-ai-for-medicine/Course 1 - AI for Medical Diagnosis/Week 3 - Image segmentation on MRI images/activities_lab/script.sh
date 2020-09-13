#!/bin/bash

#tar cvzf - dir/ | split --bytes=200MB - sda1.backup.tar.gz.

cat nih.tar.gz.* > nih.tar.gz
wait
tar -xzvf nih.tar.gz nih
