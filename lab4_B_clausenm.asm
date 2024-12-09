# Madeline Clausen
# clausenm

.text
replace:
    lw $t0, 4($sp) # c
    li $t1, 4
    mul $t0, $t0, $t1 # c * 4
    mul $t2, $a3, $t1 # r * 4
    mul $t2, $t2, $a2 # r * 4 * numCols
    add $t1, $t0, $t2
    add $t1, $t1, $a0 # array[r][c]
    lw $t0, 0($t1) # temp
    lw $t2, 0($sp) # new
    sw $t2, 0($t1)
    move $v0, $t0
    jr $ra
