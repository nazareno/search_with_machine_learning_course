shuf /workspace/datasets/labeled_query_data.txt > tmp.ttt
head -n 50000 tmp.ttt > train.data
tail -n 10000 tmp.ttt > test.data
rm tmp.ttt
