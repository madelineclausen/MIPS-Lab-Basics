# Madeline Clausen
# clausenm

.text
findMinArray:
    li $t5, 0x7FFFFFFF # min
    li $t6, -1 # min_r
    li $t7, -1 # min_c
    li $t0, -1 # row_counter
row_loop:
    addi $t0, $t0, 1 # r
    bge $t0, $a1, return_min
    li $t1, -1 # col_counter
col_loop:
    addi $t1, $t1, 1 # c
    bge $t1, $a2, row_loop
    mul $t2, $a2, $t0 # r * num_col
    li $t3, 4
    mul $t2, $t2, $t3 # r * num_col * 4
    mul $t3, $t3, $t1 # c * 4
    add $t4, $t2, $t3
    add $t4, $t4, $a0
    lw $t4, 0($t4) # array[r][c]
    bge $t4, $t5, col_loop
    move $t5, $t4
    move $t6, $t0
    move $t7, $t1
    j col_loop
return_min:
    move $v0, $t6
    move $v1, $t7
    jr $ra
