	.data
format_string: .asciiz "Smallest: %d Biggest: %d"
	
	.text
	#Promt for the amount of numbers -> N
	li $v0, 5
	syscall
	add $s0, $zero, $v0	#s0 = N
	
	#Inithialize som variables
	li $t0, 0	#t0 = smallest
	li $t1, 0	#t1 = biggest
	li $t2, 0	#t2 = counter
	
	#First value to be entered is both biggest and smallest
	li $v0, 5
	syscall
	add $t0, $zero, $v0
	add $t1, $zero, $v0
	addi $t2 $t2, 1
	
	#Loop n times, if number is smaller than smallest or bigger than biggest, replace them
loop:	
	bge $t2, $s0, print_numbers
	li $v0, 5
	syscall
	bgt $v0, $t1, change_biggest
	blt $v0, $t0, change_smallest
	addi $t2 $t2, 1
	j loop
	
change_smallest:
	add $t0, $zero, $v0
	addi $t2 $t2, 1
	j loop

change_biggest:
	add $t1, $zero, $v0
	addi $t2 $t2, 1
	j loop
			
print_numbers:
	la $a0, format_string
	add $a1, $zero, $t0
	add $a2, $zero, $t1
	jal print
	j exit_system
	
exit_system:
	li $v0, 10
	syscall
