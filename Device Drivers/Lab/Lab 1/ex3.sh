#!/bin/bash

for url in $@
do
    time wget -O ex3_downloads/$url.html $url
done

