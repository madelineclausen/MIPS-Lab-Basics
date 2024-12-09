# Madeline Clausen
# clausenm

.data
str_empty: .asciiz "empty"

.text

modifyList:
    neg $t0, $a1
    blt $a2, $t0, returnModifyError
    bge $a2, $a1, returnModifyError
    bltz $a2, modifyIf
    move $t0, $a2 # rowNum
restModify:
    mul $t0, $t0, $a1
    sll $t0, $t0, 2
    add $t0, $t0, $a0
    sb $a3, 0($t0)
    lw $t1, 4($sp) # void* data
    sw $t1, 4($t0)
    li $v0, 0
    jr $ra
modifyIf:
    add $t0, $a1, $a2 # rowNum
    j restModify
returnModifyError:
    li $v0, -1
    jr $ra


printItem:
    neg $t0, $a1
    blt $a2, $t0, returnPrint
    bge $a2, $a1, returnPrint
    bltz $a2, rowNumIf
    move $t0, $a2 # rowNum
restPrint:
    sll $t0, $t0, 3
    add $t0, $t0, $a0
    lb $t1, 0($t0)
    beqz $t1, case0
    beq $t1, 1, case1
    beq $t1, 2, case2
    beq $t1, 3, case3
    beq $t1, 4, case4
    j returnPrint
rowNumIf:
    add $t0, $a1, $a2 # rowNum
    j restPrint
case0:
    la $a0, str_empty
    li $v0, 4
    syscall
    li $v0, 0
    jr $ra
case1:
    addi $a0, $t0, 4
    li $v0, 4
    syscall
    li $v0, 0
    jr $ra
case2:
    lh $a0, 4($t0)
    li $v0, 1
    syscall
    li $v0, 0
    jr $ra
case3:
    lw $a0, 4($t0)
    li $v0, 1
    syscall
    li $v0, 0
    jr $ra
case4:
    lw $a0, 4($t0)
    li $v0, 4
    syscall
    li $v0, 0
    jr $ra
returnPrint:
    li $v0, -1
    jr $ra
