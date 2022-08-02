#!/bin/bash

grep e test_file_1.txt >> orig_grepi
./_grep e test_file_1.txt >> _grepi
diff orig_grepi _grepi

grep e *.txt >> orig_grepi
./_grep e *.txt >> _grepi
diff orig_grepi _grepi

grep e test_file_1.txt test_file_2.txt >> orig_grepi
./_grep e test_file_1.txt test_file_2.txt >> _grepi
diff orig_grepi _grepi

grep exam test_file_1.txt >> orig_grepi
./_grep exam test_file_1.txt >> _grepi
diff orig_grepi _grepi

grep reflect test_file_1.txt test_file_2.txt >> orig_grepi
./_grep reflect test_file_1.txt test_file_2.txt >> _grepi
diff orig_grepi _grepi
echo SUCCES TEST NO FLAG

# flag -e
grep -e e test_file_1.txt >> orig_grepi
./_grep -e e test_file_1.txt >> _grepi
diff orig_grepi _grepi

grep -e e *.txt >> orig_grepi
./_grep -e e *.txt >> _grepi
diff orig_grepi _grepi

grep -e example *.txt >> orig_grepi
./_grep -e example *.txt >> _grepi
diff orig_grepi _grepi
echo SUCCES TEST FLAG -e

# flag -v
grep -v j test_file_1.txt >> orig_grepi
./_grep -v j test_file_1.txt >> _grepi
diff orig_grepi _grepi

grep -v j *.txt >> orig_grepi
./_grep -v j *.txt >> _grepi
diff orig_grepi _grepi
echo SUCCES TEST FLAG -v

# flag -c
grep -c 12 test_file_1.txt >> orig_grepi
./_grep -c 12 test_file_1.txt >> _grepi
diff orig_grepi _grepi

grep -c 12 *.txt >> orig_grepi
./_grep -c 12 *.txt >> _grepi
diff orig_grepi _grepi

grep -c o *.txt >> orig_grepi
./_grep -c o *.txt >> _grepi
diff orig_grepi _grepi

grep -c j test_file_1.txt test_file_2.txt >> orig_grepi
./_grep -c j test_file_1.txt test_file_2.txt >> _grepi
diff orig_grepi _grepi

grep -c l *.txt >> orig_grepi
./_grep -c l *.txt >> _grepi
diff orig_grepi _grepi

grep -c r *.txt >> orig_grepi
./_grep -c r *.txt >> _grepi
diff orig_grepi _grepi

grep -c the *.txt >> orig_grepi
./_grep -c the *.txt >> _grepi
diff orig_grepi _grepi
echo SUCCES TEST FLAG -c

#flag -i
grep -i l test_file_1.txt >> orig_grepi # GOOD
./_grep -i l test_file_1.txt >> _grepi
diff orig_grepi _grepi

grep -i l *.txt >> orig_grepi # GOOD
./_grep -i l *.txt >> _grepi
diff orig_grepi _grepi

grep -i .l *.txt >> orig_grepi # GOOD
./_grep -i .l *.txt >> _grepi
diff orig_grepi _grepi

grep -i .trulyalya *.txt >> orig_grepi # GOOD
./_grep -i .trulyalya *.txt >> _grepi
diff orig_grepi _grepi

grep -i trulyalya test_file_1.txt >> orig_grepi # GOOD
./_grep -i trulyalya test_file_1.txt >> _grepi
diff orig_grepi _grepi

grep -i trulyalya test_file_2.txt >> orig_grepi # good
./_grep -i trulyalya test_file_2.txt >> _grepi
diff orig_grepi _grepi

grep -i example *.txt >> orig_grepi
./_grep -i example *.txt >> _grepi
diff orig_grepi _grepi
echo SUCCES TEST FLAG -i

#flag -l
grep -l j test_file_1.txt >> orig_grepi
./_grep -l j test_file_1.txt >> _grepi
diff orig_grepi _grepi

grep -l j *.txt >> orig_grepi
./_grep -l j *.txt >> _grepi
diff orig_grepi _grepi
echo SUCCES TEST FLAG -l

# #flag -n
grep -n ere test_file_1.txt >> orig_grepi
./_grep -n ere test_file_1.txt >> _grepi
diff orig_grepi _grepi

grep -n ere *.txt >> orig_grepi
./_grep -n ere *.txt >> _grepi
diff orig_grepi _grepi

grep -n e *.txt >> orig_grepi
./_grep -n e *.txt >> _grepi
diff orig_grepi _grepi
echo SUCCES TEST FLAG -n

# #flag -h
grep -h a *.txt >> orig_grepi
./_grep -h a *.txt >> _grepi
diff orig_grepi _grepi
echo SUCCES TEST FLAG -h

# #flag -s
grep -s e kokok.txt >> orig_grepi
./_grep -s e kokok.txt >> _grepi
diff orig_grepi _grepi

grep -s e test_file_2.txt >> orig_grepi
./_grep -s e test_file_2.txt >> _grepi
diff orig_grepi _grepi

grep grep -s 123456 >> orig_grepi
./_grep grep -s 123456 >> _grepi
diff orig_grepi _grepi
echo SUCCES TEST FLAG -s

# grep -q example *.txt >> orig_grepi
# ./_grep -q example *.txt >> _grepi
# diff orig_grepi _grepi