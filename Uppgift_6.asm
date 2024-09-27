	.data
format_string: .asciiz "%d "
array: .word 40

	.text
	li $s0, 0	#t0 = count for loading in numbers
	li $t1, 0	#t1 = previos number + new number
	li $s1, 0	#t2 = Count for printing numbers 

	#Promt loop for user input
while_loop:
	li $v0, 5
	syscall
	#Chheck if input is 0 or if we have filled the array
	beq $v0, $zero, print_array
	bge $s0, 40, print_array
	
	#Calculate the integer for the array
	add $t1, $t1, $v0	#t1 = previous + current
	sw $t1, array($s0)	#t1 is saved in the array 
	addi $s0, $s0, 4	#Counter is increased by 4 bytes AKA 1 word
	j while_loop
	
	#Printing loop, uses s0 and array lenght as loop limit
print_array:
	bge $s1, $s0, exit_system	#Check if t2 is greater than the array index
	bge  $s1, 40, exit_system
	la $a0, format_string		#Load adress for format string
	lw $a1, array($s1)		#Load value to print
	jal print			
	addi $s1, $s1, 4		#Increase print counter
	j print_array
	
exit_system: 
	li $v0, 10
	syscall
