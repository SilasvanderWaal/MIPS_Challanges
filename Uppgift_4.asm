	.data
format_string: .asciiz "\n%d är %s"
is_leap_year_string: .asciiz "ett skott år\n"
is_not_leap_year_string: .asciiz "inte ett skott år\n"

	.text
	#promting for user input
	li $v0, 5
	syscall
	
	#Dividable by 400
	li $t0, 400
	div $v0, $t0
	mfhi $t0 
	beq $t0, $zero, print_is_leap_year
	
	#Dividable by 4 but not 100
	li $t0, 4
	div $v0, $t0
	mfhi $t0 
	bne $t0, $zero, print_is_not_leap_year
	li $t0, 100
	div $v0, $t0
	mfhi $t0 
	beq $t0, $zero, print_is_not_leap_year
	
print_is_not_leap_year:
	la $a0, format_string
	add $a1, $v0, $zero
	la $a2, is_not_leap_year_string
	jal print
	j exit_system
	
print_is_leap_year: 
	la $a0, format_string
	add $a1, $v0, $zero
	la $a2, is_leap_year_string
	jal print
	j exit_system
	
exit_system: 
	li, $v0, 10
	syscall