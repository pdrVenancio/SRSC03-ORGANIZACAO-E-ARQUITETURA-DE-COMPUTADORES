.data
msg1: 	.asciiz "Digite um valor: "

par:		.asciiz "Par"
impar:	.asciiz "impar"
.text
.globl main
main:
	# mensagem
	li $v0, 4
	la $a0, msg1
	syscall
	
	# ler o valor
	li $v0, 5
	syscall
	
	add $a0, $zero, $v0
	
	jal ver_par
	
	add $s0, $zero, $v0
	
	if_res:
		bne $s0, $zero, else_res
	then_res: 
		li $v0, 4
		la $a0, par
		syscall
		j fim_if_res
	else_res:
		li $v0, 4
		la $a0, impar
		syscall
		
	fim_if_res:
		# encerra programa
		li $v0, 10
		syscall
		
.data
.text
ver_par:
	# tem que ver esse bo aqui
	andi $v0, $a0, 1
	 jr $ra 
	
	
	