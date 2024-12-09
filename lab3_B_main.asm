.include "lab3_B_clausenm.asm"
.include "lab3_functions.asm"

.globl main
.text
main:
    la $a0, str 
	la $a1, myhist
	jal countAllChars

	move $t9, $v0
	move $t8, $v1

	li $v0, 4
	la $a0, numspaces
	syscall

	li $v0, 1
	move $a0, $t9
	syscall

    li $v0, 4
    la $a0, endl
    syscall

	li $v0, 4
	la $a0, numdigit
	syscall

	li $v0, 1
	move $a0, $t8
	syscall

    li $v0, 4
    la $a0, endl
    syscall

	# either loop and print out hist array, or manually check memory

	li $v0, 10
	syscall


.data
myhist: .word 0,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16,-17,-18,-19,-20,-21,-22,-23,-24,-25
str: .asciiz "HELl0 2 You!"  # 1,E 1,H 2,L 1,O 1,U 1,Y      1,space  2,digit  
endl: .asciiz "\n"
numspaces: .asciiz "NumSpaces: "
numdigit: .asciiz "NumDigits: "

