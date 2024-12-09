.include "lab3_A_clausenm.asm"

.globl main
.text
main:

    # load the argument registers
    la $a0, S
    li $a1, 3  # m
    li $a2, 4  # n 
    # call the function
    jal countCoins

    # save the return value
    move $s0, $v0

    # print string
    li $v0, 4
    la $a0, countCoins_return
    syscall

    # print return value
    li $v0, 1
    move $a0, $s0
    syscall
    
    # print newline
    li $v0, 11
    li $a0, '\n'
    syscall

    # Exit the program
    li $v0, 10
    syscall

.data
countCoins_return: .asciiz "countCoins returned "
S: .word 1, 2, 3
P: .word 1, 3,5,7      # m = 4, n = 8   See expected output file
