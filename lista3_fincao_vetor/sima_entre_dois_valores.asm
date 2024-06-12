.data

.text
.globl main
main:
	# Lendo os valores
	li $v0, 5
	syscall
	add $a0, $zero, $v0
	
	li $v0, 5
	syscall
	add $a1, $zero, $v0
	
	# chamamos a função
	jal soma_valores
	
	# mandamos o valor para a0 para ser printado
	add $a0, $zero, $v0
	
	# printa resposta
	li $v0, 1
	syscall
	
	# encerra programa
	li $v0, 10
	syscall
	
# Função
.data
.text
soma_valores:
	li $t0, 0	# declaramos uma variavel para armazenar a soma 
	
	# Ideia do loop é incrementar o a0 até ele ser igual a a1 
	#  assim a0 vai percorrer todos os valores 
	loop:
		add $t0, $t0, $a0 # t0 += a0
		
		beq $a0, $a1, end_loop # verificamos se a0 != a1
		
		addi $a0, $a0, 1 # incremento a0
		
		j loop	
			
	end_loop:
		# Retornamos o valor em v0 
		add $v0, $zero, $t0
		jr $ra
		