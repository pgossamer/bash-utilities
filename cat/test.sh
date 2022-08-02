#!/bin/bash

cat test_file_2.txt >> orig_cat.txt
./_cat test_file_2.txt >> _cat.txt
diff orig_cat.txt _cat.txt
echo SUCCES TEST NO FLAG

cat -b test_file_2.txt >> orig_cat.txt
./_cat -b test_file_2.txt >> _cat.txt
diff orig_cat.txt _cat.txt
echo SUCCES TEST -b FLAG

cat -b test_file_1.txt test_file_2.txt >> orig_cat.txt
./_cat -b test_file_1.txt test_file_2.txt >> _cat.txt
diff orig_cat.txt _cat.txt
echo SUCCES TEST -b FLAG AND TWO FILES

cat -e test_file_2.txt >> orig_cat.txt
./_cat -e test_file_2.txt >> _cat.txt
diff orig_cat.txt _cat.txt
echo SUCCES TEST -e FLAG

cat -n test_file_2.txt >> orig_cat.txt
./_cat -n test_file_2.txt >> _cat.txt
diff orig_cat.txt _cat.txt
echo SUCCES TEST -n FLAG

cat -s test_file_2.txt >> orig_cat.txt
./_cat -s test_file_2.txt >> _cat.txt
diff orig_cat.txt _cat.txt
echo SUCCES TEST -s FLAG

cat -t test_file_2.txt >> orig_cat.txt
./_cat -t test_file_2.txt >> _cat.txt
diff orig_cat.txt _cat.txt
echo SUCCES TEST -t FLAG

cat -v test_file_2.txt >> orig_cat.txt
./_cat -v test_file_2.txt >> _cat.txt
diff orig_cat.txt _cat.txt
echo SUCCES TEST -v FLAG

cat -benst test_file_2.txt >> orig_cat.txt
./_cat -benst test_file_2.txt >> _cat.txt
diff orig_cat.txt _cat.txt
echo SUCCES TEST -benst FLAG
