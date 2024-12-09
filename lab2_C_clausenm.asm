# Madeline Clausen
# clausenm

.data
input: .word 0
newline: .asciiz "\n"
Sorted_str: .asciiz "Sorted:\n"

.text
bubbleSort:
    li $t0, 0  # i
    addi $t1, $a1, -1  # n - 1
    move $s0, $a0  # arr
    li $t7, 4
start:
    bge $t0, $t1, print
    li $t2, 0  # j
    sub $t3, $t1, $t0  # n - i - 1
    addi $t0, $t0, 1
second_loop:
    bge $t2, $t3, start
    mul $s1, $t7, $t2
    add $s2, $s1, $s0
    addi $t2, $t2, 1
    addi $s3, $s2, 4
    lw $t4, ($s2)  # arr[j]
    lw $t5, ($s3)  # arr[j+1]
    ble $t4, $t5, second_loop
    move $t6, $t4  # tmp
    sw $t5, ($s2)
    sw $t6, ($s3)
    j second_loop
    
print:
    la $a0, Sorted_str
    li $v0, 4
    syscall
    li $t0, 0  # i
    #move $t8, $a1
last_loop:
    bge $t0, $a1, finish # t0 = 0, but increments   $t8 is n
    mul  $t1, $t7, $t0 # t7 = 4
    add $t1, $s0, $t1
    lw $t2, ($t1)
    move $a0, $t2
    li $v0, 1
    syscall
    la $a0, newline
    li $v0, 4
    syscall
    addi $t0, $t0, 1
    j last_loop
finish:
    jr $ra

