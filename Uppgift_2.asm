	.data
str_even: .asciiz "Number is even"
str_uneven: .asciiz "Number is uneven"

	.text
main:
	#Promt user for a number
	li $v0, 5
	syscall
	
	#Divid by 2
	li $t0, 2
	div $v0, $t0
	mfhi $t0
	bne $t0, $zero, print_uneven

print_even:
	la $a0, str_even
	jal print
	j exit_system

print_uneven:
	la $a0, str_uneven
	jal print
	
exit_system:
	li $v0, 10
	syscall
	