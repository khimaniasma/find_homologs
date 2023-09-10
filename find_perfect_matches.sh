blastn -query $1 -subject $2 -task blastn-short -outfmt '6 sseq' -perc_identity 100 -out $3

# length of query sequence
qseq_length=$(awk '/^>/ {next} {qseq = qseq $0} END {print length(qseq)}' $1)

# create output file of same length as subject sequence
awk -F"\t" '{if ($3 == '"$qseq_length"') print}' "$3" > "${3}_samelength"

# count number of perfect matches 
perf_matches=$(cat "${3}_samelength" | wc -l)

echo $perf_matches