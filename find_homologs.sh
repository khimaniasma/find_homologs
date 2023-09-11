#!/bin/bash

tblastn -query $1 -subject $2 -outfmt '6 std qlen' -out $3
awk -F"\t" '{if ($3>30 && $4>(0.9*$13)) > $3) print}' > $3 
wc -l
