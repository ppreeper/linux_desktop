#!/bin/bash
find . -type f -name "*mkv" -exec cpy2mp4 "{}" \;
find . -type f -name "*mkv.mp4" -exec rename "s/mkv.mp4/mp4/" "{}" \;
find . -type f -name "*mkv" -exec rm "{}" \;
