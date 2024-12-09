# Madeline Clausen
# clausenm

.text
countAllChars:
    # prologue
    addi $sp, $sp, -28
    sw $ra, 0($sp)
    sw $s0, 4($sp) # str
    sw $s1, 8($sp) # histarray
    sw $s2, 12($sp) # c
    sw $s3, 16($sp) # temp return value
    sw $s4, 20($sp) # space
    sw $s5, 24($sp) # digit
    move $s0, $a0
    move $s1, $a1
    li $s2, 65 # 'A'
    li $t3, 65
    li $t4, 4
charLoop:
    bgt $s2, 90, remaining
    move $a0, $s0
    move $a1, $s2
    jal countC
    move $s3, $v0
    move $a0, $s0
    li $t0, 32
    add $t0, $t0, $s2
    move $a1, $t0
    jal countC
    add $t1, $v0, $s3
    li $t3, 65
    sub $t2, $s2, $t3
    sll $t2, $t2, 2
    add $t2, $t2, $s1
    sw $t1, 0($t2)
    addi $s2, $s2, 1
    j charLoop
remaining:
    move $a0, $s0
    li $a1, ' '
    jal countC
    move $s4, $v0 # space
    li $s5, 0 # digit
    li $s2, 48
lastForLoop:
    bgt $s2, 57, epilogue
    move $a0, $s0
    move $a1, $s2
    jal countC
    add $s5, $s5, $v0
    addi $s2, $s2, 1
    j lastForLoop
epilogue: 
    # epilogue
    move $v0, $s4
    move $v1, $s5
    lw $ra, 0($sp)
    lw $s0, 4($sp) # str
    lw $s1, 8($sp) # histarray
    lw $s2, 12($sp) # c
    lw $s3, 16($sp) # temp return value
    lw $s4, 20($sp) # space
    lw $s5, 24($sp) # digit
    addi $sp, $sp, 28
    jr $ra

