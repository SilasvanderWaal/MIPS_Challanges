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
	
	#Looping the array to find the number
loop:	
	lw $t0, my_array($t1)
	beq $t0, $s0, print_number
	bge $t1, $s1 , print_number_missing
	addi $t1, $t1, 4
	j loop
	
print_number:
	la $a0, format_string
	li $t2, 4
	div $t1, $t2
	mflo $a1
	addi $a1, $a1, 1
	jal print
	j exit_system

print_number_missing:
	la $a0, not_found_string
	jal print
	j exit_system
	
exit_system:
	li $v0, 10
	syscall
	
	
	
	