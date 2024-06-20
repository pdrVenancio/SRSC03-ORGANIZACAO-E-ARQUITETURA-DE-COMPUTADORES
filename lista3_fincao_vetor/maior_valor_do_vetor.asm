.data
vet:	.word
.text
.globl main
main:
	la $t0, vet # t0 onde começa o vetor

	jal get_values
	
	jal get_maior
	
	add $a0, $v0, $zero
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall

# FUNCAO PARA LER E ARMAZENAR OS VALORES
.data
.text
get_values:

	li $s0, 1 # i = 0
	li $s1, 7 # n = 7
	
	loop_get_values:
		beq $s0, $s1, end_loop_get_values
		
		#leio um valor
		li $v0, 5
		syscall
		
		# calculo o salto para a proxima casa do vetor
		sll $t1, $s0, 2
		
		# Calculo o indice da casa e armazeno em s2
		add $s2, $t0, $t1
		
		# armazeno em uma posicao do vetor
		sw $v0, 0($s2) 
		
		addi $s0, $s0, 1
		
		j loop_get_values	
	end_loop_get_values:
		jr $ra

# FUNCAO PARA BUSCAR O MAIOR VALOR DA LISTA
.data
.text
get_maior:
	# v0 = maior valor
	# t5 = maior valor temporario
	li $s0, 1 # i = 0
	
	sll $t1, $s0, 2
		
	# calcula indice 
	add $s2, $t0, $t1
		
	# armazena valor em v0
	lw $v0, 0($s2)
	addi $s0, $s0, 1
	loop:
		beq $s0, $s1, end_loop
		
		# clacula o salto
		sll $t1, $s0, 2
		
		# calcula indice
		add $s2, $t0, $t1
		
		# armazena valor em t5
		lw $t5, 0($s2)
		
		slt $t4, $v0, $t5 # v0 < t5 true t4 = 1 else t4 = 0
		beq $t4, $zero, not_change
			# guardamos o valo de t5 em v0
			add $v0, $t5, $zero
		
		not_change:
		addi $s0, $s0, 1
	end_loop:
		jr $ra