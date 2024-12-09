# Madeline Clausen
# clausenm

.data
newline: .asciiz "\n"
Quotient_string: .asciiz "Quotient is "
Remainder_string: .asciiz ", Remainder is "

.text

BaseK2DDigit:
	li $t0, -1
	li $t1, '!'
	ble $a1, 16, CheckNextCondition
	move $v0, $t0
	move $v1, $t1
	jr $ra
CheckNextCondition:
	bge $a1, 2, CheckLastCondition
	move $v0, $t0
	move $v1, $t1
	jr $ra
CheckLastCondition:
	bge $a0, 1, ContinueFunction
	move $v0, $t0
	move $v1, $t1
	jr $ra
ContinueFunction:
	div $a0, $a1
	mfhi $t0
	mflo $t1
	# Print result
	la $a0, Quotient_string
	li $v0, 4
	syscall
	move $a0, $t1
	li $v0, 1
	syscall
	la $a0, Remainder_string
	li $v0, 4
	syscall
	move $a0, $t0
	li $v0, 1
	syscall
	la $a0, newline
	li $v0, 4
	syscall
	ble $t0, 9, Else
	move $v0, $t1
	addi $t0, $t0, -10
	addi $t0, $t0, 'A'
	move $v1, $t0
	jr $ra
Else:
	move $v0, $t1
	addi $t0, $t0, 48
	move $v1, $t0
	jr $ra
	








