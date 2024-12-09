# Madeline Clausen
# clausenm

.text
countCoins:


    # prologue
    addi $sp, $sp, -20
    sw $ra, 0($sp)
    sw $s0, 4($sp) # S
    sw $s1, 8($sp) # m
    sw $s2, 12($sp) # n
    sw $s4, 16($sp) # temp return value
    move $s0, $a0
    move $s1, $a1
    move $s2, $a2
        
    # main
    li $s3, 0 # temp
    li $v0, 4 
    la $a0, print_str
    syscall 
    li $v0, 1 
    move $a0, $a1
    syscall
    li $v0, 4 
    la $a0, comma_str
    syscall
    li $v0, 1 
    move $a0, $s2
    syscall
    li $v0, 4 
    la $a0, print2_str
    syscall
    bnez $s2, elif
    li $s3, 1
    j last_thing1
elif:
    bltz $s2, last_thing1
    blez $s1, last_thing1
    addi $t1, $s1, -1 # m - 1
    move $a0, $s0
    move $a1, $t1
    move $a2, $s2
    jal countCoins
    move $a0, $s0
    move $a1, $s1
    move $s4, $v0
    
    li $t0, 4
    mul $t0, $t0, $s1
    addi $t0, $t0, -4
    add $t0, $s0, $t0
    lw $t0, 0($t0)
    sub $t0, $s2, $t0 # n - S[m - 1]
    
    move $a2, $t0 
    jal countCoins
    add $s3, $v0, $s4 # $t0 = countCoins(S, m - 1, n) + countCoins(S, m, n - S[m - 1]);

last_thing:
    li $v0, 4 
    la $a0, return_str
    syscall
    li $v0, 1 
    move $a0, $s3
    syscall
    li $v0, 4 
    la $a0, nl
    syscall
    # epilogue
    move $v0, $s3
    lw $ra, 0($sp)
    lw $s0, 4($sp)
    lw $s1, 8($sp)
    lw $s2, 12($sp)
    lw $s4, 16($sp)
    addi $sp, $sp, 20
    jr $ra
    
last_thing1:
    lw $a0, 4($sp)
    lw $a1, 8($sp)
    j last_thing
    
.data
print_str: .asciiz "countCoins(S, "
comma_str: .asciiz ", "
print2_str: .asciiz ")\n"
return_str: .asciiz "Return: "
nl: .asciiz "\n"
