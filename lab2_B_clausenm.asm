# Madeline Clausen
# clausenm
.include "lab2_A_clausenm.asm"

.data
basek_num: .ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"   
value: .word 0
k: .word 0
value_prompt: .asciiz "Enter Value: "
base_prompt: .asciiz "Enter Base: "
value_string: .asciiz "Value "
base_string: .asciiz " in Base-"
is_string: .asciiz " is "
Error: .asciiz "Value must be > 0. Base must be in the range [2,16]\n"

.text
.globl main
main:

    # print string
    li $v0, 4
    la $a0, value_prompt
    syscall

    # user input integer
    li $v0, 5
    syscall

    # Store user value in memory at label value
    la $t0, value
    sw $v0, 0($t0) 

    # print string
    li $v0, 4
    la $a0, base_prompt
    syscall

    # user input integer
    li $v0, 5
    syscall

    # Store user value in memory at label k
    la $t0, k
    sw $v0, 0($t0) 
    li $s0, 19 # Position
    la $s1, value
    lw $s1, ($s1)
    la $s2, k
    lw $s2, ($s2)
while_loop:
    beqz $s1, done
    move $a0, $s1
    move $a1, $s2
    jal BaseK2DDigit 	#v, char digit = BaseK2DDigit(v, k);
    move $s1, $v0
    bne $s1, -1, second_check
    la $a0, Error
    li $v0, 4
    syscall
    j end_program
second_check:
    bge $s2, 2, third_check
    la $a0, Error
    li $v0, 4
    syscall
    j end_program
third_check:
    ble $s2, 16, skip
    la $a0, Error
    li $v0, 4
    syscall
    j end_program
skip:
    addi $s0, $s0, -1
    la $t0, basek_num
    add $t0, $t0, $s0
    sb $v1, ($t0)
    j while_loop

done:
    la $a0, value_string
    li $v0, 4
    syscall
    la $t0, value
    lw $t1, ($t0)
    move $a0, $t1
    li $v0, 1
    syscall
    la $a0, base_string
    li $v0, 4
    syscall
    la $t0, k
    lw $t1, ($t0)
    move $a0, $t1
    li $v0, 1
    syscall
    la $a0, is_string
    li $v0, 4
    syscall
    la $t0, basek_num
    add $t0, $t0, $s0
    move $a0, $t0
    li $v0, 4
    syscall
end_program:
    li $v0, 10
    syscall



