#!/bin/bash

grep e test_file_1.txt >> orig_grepi
./s21_grep e test_file_1.txt >> s21_grepi
diff orig_grepi s21_grepi

grep e *.txt >> orig_grepi
./s21_grep e *.txt >> s21_grepi
diff orig_grepi s21_grepi

grep e test_file_1.txt test_file_2.txt >> orig_grepi
./s21_grep e test_file_1.txt test_file_2.txt >> s21_grepi
diff orig_grepi s21_grepi

grep exam test_file_1.txt >> orig_grepi
./s21_grep exam test_file_1.txt >> s21_grepi
diff orig_grepi s21_grepi

grep reflect test_file_1.txt test_file_2.txt >> orig_grepi
./s21_grep reflect test_file_1.txt test_file_2.txt >> s21_grepi
diff orig_grepi s21_grepi
echo SUCCES TEST NO FLAG

# flag -e
grep -e e test_file_1.txt >> orig_grepi
./s21_grep -e e test_file_1.txt >> s21_grepi
diff orig_grepi s21_grepi

grep -e e *.txt >> orig_grepi
./s21_grep -e e *.txt >> s21_grepi
diff orig_grepi s21_grepi

grep -e example *.txt >> orig_grepi
./s21_grep -e example *.txt >> s21_grepi
diff orig_grepi s21_grepi
echo SUCCES TEST FLAG -e

# flag -v
grep -v j test_file_1.txt >> orig_grepi
./s21_grep -v j test_file_1.txt >> s21_grepi
diff orig_grepi s21_grepi

grep -v j *.txt >> orig_grepi
./s21_grep -v j *.txt >> s21_grepi
diff orig_grepi s21_grepi
echo SUCCES TEST FLAG -v

# flag -c
grep -c 12 test_file_1.txt >> orig_grepi
./s21_grep -c 12 test_file_1.txt >> s21_grepi
diff orig_grepi s21_grepi

grep -c 12 *.txt >> orig_grepi
./s21_grep -c 12 *.txt >> s21_grepi
diff orig_grepi s21_grepi

grep -c o *.txt >> orig_grepi
./s21_grep -c o *.txt >> s21_grepi
diff orig_grepi s21_grepi

grep -c j test_file_1.txt test_file_2.txt >> orig_grepi
./s21_grep -c j test_file_1.txt test_file_2.txt >> s21_grepi
diff orig_grepi s21_grepi

grep -c l *.txt >> orig_grepi
./s21_grep -c l *.txt >> s21_grepi
diff orig_grepi s21_grepi

grep -c r *.txt >> orig_grepi
./s21_grep -c r *.txt >> s21_grepi
diff orig_grepi s21_grepi

grep -c the *.txt >> orig_grepi
./s21_grep -c the *.txt >> s21_grepi
diff orig_grepi s21_grepi
echo SUCCES TEST FLAG -c

#flag -i
grep -i l test_file_1.txt >> orig_grepi # GOOD
./s21_grep -i l test_file_1.txt >> s21_grepi
diff orig_grepi s21_grepi

grep -i l *.txt >> orig_grepi # GOOD
./s21_grep -i l *.txt >> s21_grepi
diff orig_grepi s21_grepi

grep -i .l *.txt >> orig_grepi # GOOD
./s21_grep -i .l *.txt >> s21_grepi
diff orig_grepi s21_grepi

grep -i .trulyalya *.txt >> orig_grepi # GOOD
./s21_grep -i .trulyalya *.txt >> s21_grepi
diff orig_grepi s21_grepi

grep -i trulyalya test_file_1.txt >> orig_grepi # GOOD
./s21_grep -i trulyalya test_file_1.txt >> s21_grepi
diff orig_grepi s21_grepi

grep -i trulyalya test_file_2.txt >> orig_grepi # good
./s21_grep -i trulyalya test_file_2.txt >> s21_grepi
diff orig_grepi s21_grepi

grep -i example *.txt >> orig_grepi
./s21_grep -i example *.txt >> s21_grepi
diff orig_grepi s21_grepi
echo SUCCES TEST FLAG -i

#flag -l
grep -l j test_file_1.txt >> orig_grepi
./s21_grep -l j test_file_1.txt >> s21_grepi
diff orig_grepi s21_grepi

grep -l j *.txt >> orig_grepi
./s21_grep -l j *.txt >> s21_grepi
diff orig_grepi s21_grepi
echo SUCCES TEST FLAG -l

# #flag -n
grep -n ere test_file_1.txt >> orig_grepi
./s21_grep -n ere test_file_1.txt >> s21_grepi
diff orig_grepi s21_grepi

grep -n ere *.txt >> orig_grepi
./s21_grep -n ere *.txt >> s21_grepi
diff orig_grepi s21_grepi

grep -n e *.txt >> orig_grepi
./s21_grep -n e *.txt >> s21_grepi
diff orig_grepi s21_grepi
echo SUCCES TEST FLAG -n

# #flag -h
grep -h a *.txt >> orig_grepi
./s21_grep -h a *.txt >> s21_grepi
diff orig_grepi s21_grepi
echo SUCCES TEST FLAG -h

# #flag -s
grep -s e kokok.txt >> orig_grepi
./s21_grep -s e kokok.txt >> s21_grepi
diff orig_grepi s21_grepi

grep -s e test_file_2.txt >> orig_grepi
./s21_grep -s e test_file_2.txt >> s21_grepi
diff orig_grepi s21_grepi

grep grep -s 123456 >> orig_grepi
./s21_grep grep -s 123456 >> s21_grepi
diff orig_grepi s21_grepi
echo SUCCES TEST FLAG -s

# grep -q example *.txt >> orig_grepi
# ./s21_grep -q example *.txt >> s21_grepi
# diff orig_grepi s21_grepi