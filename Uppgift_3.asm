	.data
threshold: .word 204000
low: .word 30
high: .word 50

str_format: .asciiz "\nNetto salary is %d"
	
	.text
#Promt the user for a netto salary
	li $v0, 5
	syscall


	
#Code for brutto under threshold
	lw $t0, threshold	#t0 = treshold
	lw $t1, low		#t1 = low = 30
	lw $t2, high		#t2 = high = 50
	li $t4, 100		#t4 = 100
	
	bgt $v0, $t0, threshold_exceeded
	
	mult $v0, $t1		
	mflo $t3		#t3 = brutto * low

	div $t3, $t4
	mflo $t5 		#t5 = (brutto * low) / 100
	sub $a1, $v0, $t5
		
	la $a0, str_format
	jal print
	j exit_system
	
#Code for brutto over threshold
threshold_exceeded:
	sub $t3, $v0, $t0 	#t3 = brutto - threshold
	mult $t0, $t1
	mflo $t5		#t5 = (threshold) * low
	div $t5, $t4		
	mflo $t6 		#t6 = ((threshold) * low) / 100
	mult $t3, $t2
	mflo $t7		#t7 = (brutto - threshold) * high
	div $t7, $t4
	mflo $t8 		#t8 = ((brutto - threshold) * high )/100
	sub $t9, $v0, $t6 	
	sub $a1, $t9, $t8
	
	
	la $a0, str_format
	jal print
	j exit_system
	
#Subinstruction for exting the system
exit_system: 
	li $v0, 10
	syscall
