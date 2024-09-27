	.globl search
	
	.data
	
	#a0 = startadress array
	#a1 = storlek på array
	#a2 = sökta talet
	
	#t0 = current adress
	
	.text
search:
	li $t1, 0	#t1 = counter
loop:	 
	add $t0, $a0, $t1
	lw $t2, ($t0)		#Current value
	beq $t2, $a2, number_found
	bge $t1, $a1 , number_not_found
	addi $t1, $t1, 4
	j loop
	
number_not_found:
	li $v0, 0
	jr $ra

number_found:
	li $t3, 4
	div $t1, $t3
	mflo $t0
	addi $v0, $t0, 1
	jr $ra

	
