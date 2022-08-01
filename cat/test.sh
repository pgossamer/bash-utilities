#!/bin/bash

cat test_file_2.txt >> orig_cat.txt
./s21_cat test_file_2.txt >> s21_cat.txt
diff orig_cat.txt s21_cat.txt
echo SUCCES TEST NO FLAG

cat -b test_file_2.txt >> orig_cat.txt
./s21_cat -b test_file_2.txt >> s21_cat.txt
diff orig_cat.txt s21_cat.txt
echo SUCCES TEST -b FLAG

cat -b test_file_1.txt test_file_2.txt >> orig_cat.txt
./s21_cat -b test_file_1.txt test_file_2.txt >> s21_cat.txt
diff orig_cat.txt s21_cat.txt
echo SUCCES TEST -b FLAG AND TWO FILES

cat -e test_file_2.txt >> orig_cat.txt
./s21_cat -e test_file_2.txt >> s21_cat.txt
diff orig_cat.txt s21_cat.txt
echo SUCCES TEST -e FLAG

cat -n test_file_2.txt >> orig_cat.txt
./s21_cat -n test_file_2.txt >> s21_cat.txt
diff orig_cat.txt s21_cat.txt
echo SUCCES TEST -n FLAG

cat -s test_file_2.txt >> orig_cat.txt
./s21_cat -s test_file_2.txt >> s21_cat.txt
diff orig_cat.txt s21_cat.txt
echo SUCCES TEST -s FLAG

cat -t test_file_2.txt >> orig_cat.txt
./s21_cat -t test_file_2.txt >> s21_cat.txt
diff orig_cat.txt s21_cat.txt
echo SUCCES TEST -t FLAG

cat -v test_file_2.txt >> orig_cat.txt
./s21_cat -v test_file_2.txt >> s21_cat.txt
diff orig_cat.txt s21_cat.txt
echo SUCCES TEST -v FLAG

cat -benst test_file_2.txt >> orig_cat.txt
./s21_cat -benst test_file_2.txt >> s21_cat.txt
diff orig_cat.txt s21_cat.txt
echo SUCCES TEST -benst FLAG
