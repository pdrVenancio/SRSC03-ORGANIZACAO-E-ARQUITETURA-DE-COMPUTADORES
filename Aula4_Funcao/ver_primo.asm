.data

msg1:	.asciiz "primo"
msg2:	.asciiz "nao primo"

.text
.globl main
main:
	
	li $v0, 5 
	syscall
	
	add $a0, $zero, $v0
	
	jal ver_primo
	
	add $s0, $zero, $v0
	
	# Resposta para o usuario
	if_res:
		bne $s0, $zero, else_res
	then_res: 
		li $v0, 4
		la $a0, msg2
		syscall
		j fim_if_res
	else_res:
		li $v0, 4
		la $a0, msg1
		syscall
		
	fim_if_res:
		# encerra programa
		li $v0, 10
		syscall

.data 
.text
ver_primo:
	li $t0, 2
	li $t2, 1
	
	# se o numero for a0 == 1 ja notificamos que o numero nao é impar 
	beq $a0, $t2, nao_elllprimoo
	
	# Verifico o intervalo aberto ] 1, ... , n (a0) [ 
	# qualquer numero nesse intervalo que possuir divisão 
	# de resto zero ja mostra que ele nao é PRIMO 
	loop:
		beq $t0, $a0, end_loop
		
		rem $t1, $a0, $t0
		beq $t1, $zero, nao_elllprimoo	# se um numero com resto de divisao = 0 siguinifica que nao é primo
			
		addi $t0, $t0, 1
		j loop
		
	# Primo v0 = 1
	end_loop:
		addi $v0, $zero, 1
		jr $ra
		
	# Nao primo v0 = 0
	nao_elllprimoo:
		addi $v0, $zero, 0
		jr $ra