# Madeline Mae Clausen
# clausenm

.globl main
.text
main:
	# Prompt
	li $v0, 4 
	la $a0, prompt 
	syscall 
	# Read string
	la $a0, str
	li $a1, 5
	li $v0, 8
	syscall 
	# Go to new line
	la $a0, endl
	li $v0, 4
	syscall
	# Load str
	la $t0, str
	# Print str
	move $a0, $t0
	li $v0, 4
	syscall
	# Go to new line
	la $a0, endl
	li $v0, 4
	syscall
	# Load 4 bytes
	la $t3, str
	lw $t4, 0($t3)
	# Print int
	move $a0, $t4
	li $v0, 1
	syscall
	# Go to new line
	la $a0, endl
	li $v0, 4
	syscall
	# Print int (binary)
	move $a0, $t4
	li $v0, 35
	syscall
	# Go to new line
	la $a0, endl
	li $v0, 4
	syscall
	# Print int (hex)
	move $a0, $t4
	li $v0, 34
	syscall
	# Go to new line
	la $a0, endl
	li $v0, 4
	syscall
	# Add 1 and reload
	addi $t4, $t4, 1
	sw $t4, 0($t3)
	# Print str
	move $a0, $t3
	li $v0, 4
	syscall
	# Go to new line
	la $a0, endl
	li $v0, 4
	syscall
	# Load 2nd byte
	lb $t1, 1($t3)
	addi $t5, $0, 2
	div $t1, $t5
	mfhi $t5
	bne $t5, $0, if_odd
	
if_even:
	# Load str
	la $t2, even
	# Print str
	move $a0, $t2
	li $v0, 4
	syscall
	j done
if_odd:
	# Load str
	la $t2, odd
	# Print str
	move $a0, $t2
	li $v0, 4
	syscall
done:      
	# End program
	li $v0, 10
	syscall

.data
prompt: .asciiz "Enter 4 characters: "
endl: .asciiz "\n"
.align 2
str: .asciiz "????"
even: .asciiz "EVEN"
odd: .asciiz "ODD"

