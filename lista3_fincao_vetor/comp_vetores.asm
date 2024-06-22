.data

vetA:	.word
vetB:	.word

.text
.globl main
main:
	# Criando o vetor A	
	li $s0, 0
	li $s1, 4
	
	# a0 ==> vetA
	la $a0, vetA
	loop_A:
		beq $s0, $s1, end_loop_A
		# le valor
		li $v0, 5
		syscall
		
		# calcular salto
		sll $t1, $s0, 2
		
		# indice do vet
		add $s2, $a0, $t1
		
		# armazena o valor lido
		sw $v0, 0($s2)
		 
		addi $s0, $s0, 1
		j loop_A
	end_loop_A:
	# Criando o vetor B
	
	li $s0, 0
	li $s1, 6
	
	# a1 ==> vetB
	la $a1, vetB
	
	loop_B:
		beq $s0, $s1, end_loop_B
		#lendo valor
		li $v0, 5
		syscall
		
		# calc salto
		sll $t1, $s0, 2
		
		# idx
		add $s2, $a1, $t1
		
		# armazenar valor
		sw $v0, 0($s2)
		
		addi $s0, $s0, 1
		j loop_B
	end_loop_B:
	
	jal com_vet
	
	add $a0, $v0, $zero
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
.data
.text
# a0 == vetA
# a1 == vetB
# v0 == cont
com_vet:
	li $v0, 0 # con
	
	li $t1, 0
	
	# limite dos vetores & encremento
	li $s0, 0 # i
	li $s1, 4 # A
	
	li $s3, 0 # j
	li $s2, 6 # B
	
	percorre_A:
		beq $s0, $s1, end_percorre_A
		# pego um valor de A
		# salto
		sll $t0, $s0, 2
		# idx
		add $s4, $a0, $t0
		# armazeno o valor de A
		lw $t6, 0($s4)

		# t6 = valor de A
		percorre_B:
			beq $s3, $s2, end_percorre_B	
			# Pego um valor de B
			# salto
			sll $t1, $s3, 2
			# idx
			add $s5, $a1, $t1
			# aramzeno o valor de B
			lw $t7, 0($s5)
			
			#  VERIFICO SE O A[] == B[]
			bne $t6, $t7, not_equal
				# cont ++
				addi $v0, $v0, 1
			not_equal:
			addi $s3, $s3, 1
			j percorre_B
		end_percorre_B:
		
		# reset idx do vetB
		li $s3, 0 # j
		
		addi $s0, $s0, 1
		j percorre_A
	end_percorre_A:
		jr $ra
	
