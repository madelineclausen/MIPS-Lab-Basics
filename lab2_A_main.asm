.include "lab2_A_clausenm.asm"  #Change this to your file

.data
value: .word 2262
base_k: .word 15
value_string: .asciiz "Value is "
base_string: .asciiz ", Base-k is "
newValue_string: .asciiz "New Value is "
digit_string: .asciiz ", Digit is "


.globl main
.text
main:
    # print string
    li $v0, 4
    la $a0, value_string
    syscall

    # print value
    li $v0, 1
    la $t0, value
    lw $a0, 0($t0)
    syscall

    # print string
    li $v0, 4
    la $a0, base_string
    syscall

    # print value
    li $v0, 1
    la $t1, base_k 
    lw $a0, 0($t1)
    syscall

    # print string
    li $v0, 4
    la $a0, newline
    syscall


    # load the argument registers
    lw $a0, 0($t0)
    lw $a1, 0($t1)
    
    # call the function
    jal BaseK2DDigit

    # save the return values
    move $s0, $v0
    move $s1, $v1
    
    # print string
    li $v0, 4
    la $a0, newValue_string
    syscall

    # print return value
    li $v0, 1
    move $a0, $s0
    syscall

    # print string
    li $v0, 4
    la $a0, digit_string
    syscall
    
    # print digit, using print char syscall
    li $v0, 11      
    move $a0, $s1
    syscall
    
    # print newline
    li $v0, 4
    la $a0, newline
    syscall
    syscall
    
    ############################## ERROR TEST 1 ##############################

    # print string
    li $v0, 4
    la $a0, value_string
    syscall

    # print value
    li $v0, 1
    la $t0, value
    lw $a0, 0($t0)
    syscall

    # print string
    li $v0, 4
    la $a0, base_string
    syscall

    # print value
    li $v0, 1
    li $a0, 20
    syscall

    # print string
    li $v0, 4
    la $a0, newline
    syscall

    # load the argument registers
    lw $a0, 0($t0)
    li $a1, 20
    
    # call the function
    jal BaseK2DDigit

    # save the return values
    move $s0, $v0
    move $s1, $v1
    
    # print string
    li $v0, 4
    la $a0, newValue_string
    syscall

    # print return value
    li $v0, 1
    move $a0, $s0
    syscall

    # print string
    li $v0, 4
    la $a0, digit_string
    syscall
    
    # print digit, using print char syscall
    li $v0, 11      
    move $a0, $s1
    syscall
    
    # print newline
    li $v0, 4
    la $a0, newline
    syscall
    syscall

    ############################## ERROR TEST 2 ##############################

    # print string
    li $v0, 4
    la $a0, value_string
    syscall

    # print value
    li $v0, 1
    li $a0, -1
    syscall

    # print string
    li $v0, 4
    la $a0, base_string
    syscall

    # print value
    li $v0, 1
    la $t1, base_k 
    lw $a0, 0($t1)
    syscall


    # print string
    li $v0, 4
    la $a0, newline
    syscall

    # load the argument registers
    li $a0, -1
    lw $a1, 0($t1)
    
    # call the function
    jal BaseK2DDigit

    # save the return values
    move $s0, $v0
    move $s1, $v1
    
    # print string
    li $v0, 4
    la $a0, newValue_string
    syscall

    # print return value
    li $v0, 1
    move $a0, $s0
    syscall

    # print string
    li $v0, 4
    la $a0, digit_string
    syscall
    
    # print digit, using print char syscall
    li $v0, 11      
    move $a0, $s1
    syscall
    
    # print newline
    li $v0, 4
    la $a0, newline
    syscall

    # Exit the program
    li $v0, 10
    syscall


