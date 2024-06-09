.data

.text
.globl main
main:

	# valor da soma 
	li $t1, 0
	
	# definimos um registrador como 1 para fazer verificações futuras
	li $t2, 1
	loop_pegar_valor:
		li $v0, 5
		syscall
		add $s0, $zero, $v0
		
		# verifica mos se o numero é maior que 0
		slt $t0, $s0, $t2
		beq $t0, $zero, loop_num_valido
		j loop_pegar_valor
		
	loop_num_valido:
		beq $s0, $zero, imprime_res	
		
		# faço o incremento de t1
		add $t1, $t1, $s0
		
		# faço o decremento do valor passado pelo usiario
		sub $s0, $s0, 1
		
		j loop_num_valido
		
	imprime_res:
		add $a0, $zero, $t1
		li $v0, 1
		syscall
fim:
	
		
	