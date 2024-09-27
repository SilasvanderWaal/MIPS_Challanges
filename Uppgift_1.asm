	.data
char: .word 0
next_char: .word 0
previous_char: .word 0
format_str: .asciiz "\nPrevious: %s \nNext: %s "

#Fråga till labb, behöver man avsluta varje ascii med \0? Om man inte gör detta, 
#kommer två seperata ascii variabler bli en lång ifalll man inte har det?
#Demonstrera med format_str

error_msg: .asciiz "\nError, bad input. Please enter a character between a-y\n"

	.text
main:
	#User input a char and is saved into memory
	li $v0, 12
	syscall
	sw $v0, char
	
	#Controll of user input 
	li $t0, 'b'
	li $t1, 'y'
	
	bltu $v0, $t0, error
	bgtu $v0, $t1, error
	
	#Next char and previous char is saved into memory
	addi $t0, $v0, 1
	subi $t1, $v0, 1
	
	sw $t0, next_char
	sw $t1, previous_char
	
	#jal for calling print subrutin, a0 as argument
	la $a0, format_str
	la $a1, previous_char
	la $a2, next_char
	jal print
	j exit_process
	
error:
	la $a0, error_msg
	li $v0, 4
	syscall
	j main
	
exit_process:
	li $v0, 10
	syscall
	
	
