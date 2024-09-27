	.data
my_array: .word 5, 7, 1, 9, 2, 4, 8, 3, 6
format_string: .asciiz "The position of the number is: %d"
not_found_string: .asciiz "The number is missing"
	
	.text 
	#Promting the number to search for
	li $v0, 5
	syscall
	add $s0, $zero, $v0	#s0 = Number to search for
	addi $s1, $zero, 36 	#s1 = array lenght
	
	#Inithialize some registers
	li $t0, 0	#t0 = Number to compare
	li $t1, 0	#t1 = Counter
	
	#Calling the search operation
	la $a0, my_array
	add $a1, $s1, $zero
	add $a2, $v0, $zero
	jal search 
	bgt $v0, $zero, print_number
	beq $v0, $zero, print_number_missing
	
print_number:
	la $a0, format_string
	add $a1, $zero, $v0
	jal print
	j exit_system

print_number_missing:
	la $a0, not_found_string
	jal print
	j exit_system
	
exit_system:
	li $v0, 10
	syscall
	
	
	
	