# Madeline Mae Clausen
# clausenm

.globl main
.text
main:
	# Prompt
	li $v0, 4 
	la $a0, prompt 
	syscall  
	# Read int
	li $v0, 5 
	syscall 
	# Load num address
	la $t0, num
	# Load num value
	lw $t1, 0($t0)
	# Add num and user input
	add $t1, $t1, $v0
	# Print result
	move $a0, $t1
	li $v0, 1
	syscall
	# Go to new line
	la $a0, endl
	li $v0, 4
	syscall
	# Negate value
	sub $t1, $0, $t1
	move $t4, $t1
	# Print result
	move $a0, $t1
	li $v0, 1
	syscall
	# Go to new line
	la $a0, endl
	li $v0, 4
	syscall
	# Load value
	la $t2, value
	sw $t1, ($t2)
	# Load abcd
	la $t1, abcd
	lb $t3, 0($t1)
	sb $t3, 0($t1)
	# Print abcd
	move $a0, $t1
	li $v0, 4
	syscall
	# Go to new line
	la $a0, endl
	li $v0, 4
	syscall
	# Shift left 8 bits
	sll $t4, $t4, 8
	# Print result
	move $a0, $t4
	li $v0, 1
	syscall
	# Go to new line
	la $a0, endl
	li $v0, 4
	syscall
	# Load value
	sw $t4, ($t2)
	# Print abcd
	move $a0, $t1
	li $v0, 4
	syscall
	# End program
	li $v0, 10
	syscall


.data
num: .word 2010 # an integer
prompt: .asciiz "Enter an integer:"  # a string
endl: .asciiz "\n"   # a string
.align 2
abcd: .ascii "ABCD"  # 4-character array
value: .word -100    # an integer
moreabcs: .asciiz "EFGHIJK"  # a string
