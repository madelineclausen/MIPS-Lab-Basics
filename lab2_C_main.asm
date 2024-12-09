.include "lab2_C_clausenm.asm"  #Change this to your file

.data
test_array: .word 220, 888, 599, 90, -77, 91, 10, 101, 48, 47, 2022, 22
size: .word 12

.globl main
.text
main:
    # load the argument registers
    la $a0, test_array
    la $t1, size
    lw $a1, 0($t1)
    
    # call the function
    jal bubbleSort

    # Exit the program
    li $v0, 10
    syscall


