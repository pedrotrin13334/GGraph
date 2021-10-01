#!/bin/bash
filename='code_pieces_list'
>"GGraph.gi"
>"GGraph.gd"
while read line; do
# reading each line
file_gi="${line}/${line}.gi"
file_gd="${line}/${line}.gd"
cat $file_gi >> "GGraph.gi"
cat $file_gd >> "GGraph.gd"
echo $line
done < $filename
