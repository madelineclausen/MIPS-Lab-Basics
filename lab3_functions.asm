# TREAT THIS FILE AS A BLACK BOX. ASSUME YOU DO NOT SEE THIS CODE

.data 
cur_noappear_label: .asciiz "Currently these characters have no occurrences: "
cur_space_label: .asciiz "Current total # spaces: "
cur_digits_label: .asciiz "\nCurrent total # digits: "
newline: .asciiz "\n"
hist_border: .asciiz "\n######## HISTOGRAM #########\n"
end_border: .asciiz "############################\n"
space: .asciiz " "
none: .asciiz "none\n"

.text
countC:
	li $t9, 0	# count
	li $t8, 1	# 1
	add $t2, $a1, $0   # copy of $a1, c	
	add $t1, $0, $a0   # copy of $a0, str[]	

countC_Loop:
	lb $t0, 0($t1)
	beq $t0, $0, countC_Done
	bne $t0, $t2, countC_nocount
	add $t9, $t9, $t8	# count++
countC_nocount:
	add $t1, $t1, $t8
	j countC_Loop	

countC_Done:
	move $v0, $t9	# move count to return value
	jr $ra

#################################################

printStats:
	addi $sp, $sp, -8
	sw $a0, 0($sp) # num spaces
	sw $a1, 4($sp) # num digitss

	#print no appear label
	li $v0, 4
	la $a0, hist_border
	syscall

	move $t9, $a2   # address of histarray
    li $t0, 0		# i = 0

printStats_printhist:
    sll $t3, $t0, 2
	add $t1, $t3, $t9  #address of histarray[i]

	lw $t2, 0($t1)    # value in histarray[i]
	bnez $t2, printStats_notzero

	j printStats_printHistRow_next
printStats_notzero:
	li $v0, 11
	addi $a0, $t0, 65	  # get char to print 
	syscall
	li $a0, ':' 
	syscall
	li $a0, 0x20 
	syscall

printStats_printHistRow_Loop:
		li $v0, 11
		li $a0, '*'
		beqz $t2, printStats_printHistRow_Done
		syscall 	
		addi $t2, $t2, -1
	j printStats_printHistRow_Loop
printStats_printHistRow_Done:
	li $a0, '\n'
	li $v0, 11
	syscall
printStats_printHistRow_next:
	addi $t0, $t0, 1
	beq $t0, 26, printStats_histdone
	j printStats_printhist

printStats_histdone:
	#print end border
	li $v0, 4
	la $a0, end_border
	syscall

    # print number of spaces
	li $v0, 4
	la $a0, cur_space_label
	syscall

	li $v0, 1
	lw $a0, 0($sp)  
	syscall

    # print number of digits
	li $v0, 4
	la $a0, cur_digits_label
	syscall

	li $v0, 1
	lw $a0, 4($sp)  
	syscall

	addi $sp, $sp, 8

	jr $ra

#################################################

addArray:
    li $t0, 0

addArray_loop:
	beq $t0, $a2, addArray_done
    sll $t1, $t0, 2
	add $t2, $t1, $a1
	add $t3, $t1, $a0
	lw $t4, 0($t3)
	lw $t5, 0($t2)
	add $t6, $t4, $t5
	sw $t6, 0($t2)
	addi $t0, $t0, 1
	j addArray_loop

addArray_done:
	jr $ra	

