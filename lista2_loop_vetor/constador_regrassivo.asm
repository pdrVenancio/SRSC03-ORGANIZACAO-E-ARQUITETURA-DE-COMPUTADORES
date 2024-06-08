.data
espaco:	 .ascii " '

.text
.globl main
main:
	#ler o valor
	li $v0, 5
	syscall
	add $s0, $zero, $v0
	
	loop:
		beq $s0, 0, fim #quando s0 == 0  acabamos o programa
		
		# printar o valor atual
		add $a0, $zero, $s0
		li $v0, 1
		syscall
		
		# coloca um espaço entre os valores
		la $a0, espaco
		li $v0, 4
		syscall
		
		sub $s0, $s0, 1 #s0 = s0 - 1
		j loop
	fim: