.data

espaco: .ascii " "

.text
.globl main
main:

	#lendo o numero
	li $v0, 5 
	syscall
	add $s0, $zero, $v0
	
	li $t0, 0
	
	# definimos um registrador par aser o numero 2, para verificar a divisao

	loop:	
		# verifico se a quandidade de numeros a serem imprimidos é 0
		beq $s0, $zero, fim
	
		# n 
		add $t0, $t0, 1
		
		# carregamos  t2 = 2
		li $t2, 2
			
		div $t0, $t2
		# t1 = resto de divisoa
		mfhi $t1
		
		beq $t1, 1, if_num_impar
		j else_n_impar
			if_num_impar:
				# imprime o valor de t0 se for impar 
				add $a0, $zero, $t0
				li $v0, 1
				syscall

				# printar o espaco
				la $a0, espaco
				li $v0, 4
				syscall
				
				# decremento da quantidade de numeros a serem imprimidos 
				sub $s0, $s0, 1
				
				j loop
			else_n_impar:
				j loop
	fim:
	
