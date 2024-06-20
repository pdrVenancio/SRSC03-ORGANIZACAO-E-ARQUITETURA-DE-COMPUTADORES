.data
# declarar o vetor com elemento 0 e depois ir alterando cada elemento quando for lido
vet:	.word
.text
.globl main
main:
	li $s0, 1 
	li $s1, 7 # n = 7
	
	la $t0, vet # t0 onde começa o vetor
	
	# Buscando os dados para o vetor
	loop_pega_valores:
		beq $s0, $s1, end_loop
		
		# leio o valor 
		li $v0, 5
		syscall
		
        # t1 contem o salto para a proxima casa do vetor
		sll $t1, $s0, 2	# i * 4 
		
		add $s2, $t0, $t1  # s2 armazena o indice do vetor
		
		sw $v0, 0($s2) # guardo o valor lido em vet[idice]
		
		addi $s0, $s0, 1 # incremento
		
		j loop_pega_valores
	end_loop:
		# verifica o maior valor
		# t7 = maior valor
		
		li $s0, 1 
		
		loop_printa_valores:
			beq $s0, $s1, end_print
			
            # t1 contem o salto para a proxima casa do vetor
			sll $t1, $s0, 2	# i * 4 
		
			add $s2, $t0, $t1 # s2 armazena o indice do vetor
		
			lw $a0, 0($s2) # a0 = vet[0]
			
			# imprime valor
			# guarda o valor de vet[indice] em a0
			li $v0, 1
			syscall
			
			addi $s0, $s0, 1 # incremento
			j loop_printa_valores
		end_print:


