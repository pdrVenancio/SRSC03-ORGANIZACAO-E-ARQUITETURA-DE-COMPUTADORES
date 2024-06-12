.data

.text
.globl main
main:
	li $s0, 1 # i = 0
	li $s1, 7 # n = 7
	
	li $t0, 0
	
	# Buscando os dados para o vetor
	loop_ pega_valores:
		beq $s0, $s1, end_loop
		# leio o valor 
		li $v0, 5
		syscall
		
		sll $t1, $s1, 2
		
		
		
		
		j loop_pega_valores
	end_loop:


.data
.text
retorna_maior_valor:
	