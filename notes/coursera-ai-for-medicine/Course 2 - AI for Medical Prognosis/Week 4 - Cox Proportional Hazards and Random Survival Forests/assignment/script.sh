#!/bin/bash

tar -cvzf R.tar.gz R

cat nih.tar.gz.* > nih.tar.gz
wait
tar -xzvf nih.tar.gz nih
