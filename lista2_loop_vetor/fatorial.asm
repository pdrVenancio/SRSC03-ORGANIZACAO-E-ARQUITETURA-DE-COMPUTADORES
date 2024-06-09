.data

.text
.globl main
main:
	li $v0, 5
	syscall
	add $s0, $zero, $v0
	
	#definimos um registrador para calcular o resultado
	li $t0, 1
	loop_fatorial:
		beq $s0, $zero, mostra_res
		
		# fazemos a multiplicação de um termo para calcular o farorial
		mul $t0, $t0, $s0
		
		# decrementamos s0		
		sub $s0, $s0, 1
		j loop_fatorial		
	mostra_res:
		add $a0, $zero, $t0
		li $v0, 1
		syscall
fim: