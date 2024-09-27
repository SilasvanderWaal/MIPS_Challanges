	.data
format_string: .asciiz "%d %d"

	.text
	#promting for user input
	li $v0, 5
	syscall
	add $s0, $zero, $v0
	
	#Inithialing registers
	li $t0, 0 	# t0 = counter //Is not used, missunderstood the asignment
	li $t1, 0 	# t1 = new value
	li $t2, 0 	# t2 = old vlues + new value
		
	#Loop n times, add 1 to current value and sum the new and old number
loop:	
	bgt $t2, $s0, stop_loop
	addi $t1, $t1, 1
	add $t2, $t2, $t1
	j loop
stop_loop:	
	la $a0, format_string
	add $a1, $zero, $t2
	add $a2, $zero, $t1
	jal print
	j exit_system
exit_system: 
	li, $v0, 10
	syscall
