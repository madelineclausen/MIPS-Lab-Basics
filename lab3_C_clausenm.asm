# Madeline Clausen
# clausenm

.text
processStrings:
    # prologue
    addi $sp, $sp, -128
    sw $ra, 0($sp)
    sw $s0, 4($sp) # strArray
    sw $s1, 8($sp) # numStr
    sw $s2, 12($sp) # total_digits
    sw $s3, 16($sp) # total_space
    sw $s4, 20($sp) # cur_histarray[26]
    move $s0, $a0
    move $s1, $a1
    li $s2, 0
    li $s3, 0
    addi $s4, $sp, 20
    li $s5, 0
    la $t0, total_histarray
    li $t1, 0
    
setToZero:
    beq $t1, 26, lastVariable
   
    sll $t2, $t1, 2
    
    add $t3, $t2, $t0  # total_histarray
    li $t4, 0
    sw $t4, 0($t3)
    
    addi $t3, $t2, 20 # cur_histarray
    add $t3, $t3, $sp
    sw $t4, 0($t3)
    
    addi $t1, $t1, 1
    j setToZero
    
lastVariable:
    sw $s5, 124($sp) # loop counter
strArrayLoop:
    beq $s5, $s1, finalPrint
    sll $t1, $s5, 2
    add $t1, $s0, $t1
    lw $a0, 0($t1)
    move $a1, $s4
    jal countAllChars
    add $s2, $s2, $v1
    add $s3, $s3, $v0
    move $a0, $s4
    la $a1, total_histarray
    li $a2, 26
    jal addArray
    addi $s5, $s5, 1
    j strArrayLoop
finalPrint:  
    li $v0, 4 
    la $a0, stats_label
    syscall 
    move $a0, $s3
    move $a1, $s2
    la $a2, total_histarray
    jal printStats
    # epilogue
    lw $ra, 0($sp)
    lw $s0, 4($sp) # strArray
    lw $s1, 8($sp) # numStr
    lw $s2, 12($sp) # total_digits
    lw $s3, 16($sp) # total_space
    lw $s4, 20($sp) # cur_histarray[26]
    lw $s5, 124($sp) # loop counter
    addi $sp, $sp, 128
    jr $ra


.data
stats_label: .asciiz "Final Stats on All Strings\n"
total_histarray: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
#cur_histarray: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
