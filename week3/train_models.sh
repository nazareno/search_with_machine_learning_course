#.fasttext supervised -input ./toy-dataset.train -output result/toy-model-noautotune  -minn 2 -maxn 5 -wordNgrams 2 -dim 200

~/fastText-0.9.2/fasttext supervised -input train.data -output no-hps

for k in 1 3 5; do 
    ~/fastText-0.9.2/fasttext test no-hps.bin test.data $k
done

MODEL_NAME=subwords
~/fastText-0.9.2/fasttext supervised -input train.data -output $MODEL_NAME -minn 2 -maxn 5 -wordNgrams 2 -dim 200
for k in 1 3 5; do 
    ~/fastText-0.9.2/fasttext test $MODEL_NAME.bin test.data $k
done

MODEL_NAME=lr_epochs
~/fastText-0.9.2/fasttext supervised -input train.data -output $MODEL_NAME -lr 0.5 -epoch 10
for k in 1 3 5; do 
    ~/fastText-0.9.2/fasttext test $MODEL_NAME.bin test.data $k
done