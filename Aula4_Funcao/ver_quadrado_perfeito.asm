.data
msg1: 	.asciiz "Digite um valor: "

sim:		.asciiz "Sim"
nao:		.asciiz "Nao"

.text
.globl main
main:
	# mensagem
	li $v0, 4
	la $a0, msg1
	syscall
	
	# ler o valor
	li $v0, 5
	syscall
	
	add $a0, $zero, $v0
	
	jal ver_quadrado_perfeito
	
	add $s0, $zero, $v0
	
	if_res:
		bne $s0, $zero, else_res
	then_res: 
		li $v0, 4
		la $a0, nao
		syscall
		j fim_if_res
	else_res:
		li $v0, 4
		la $a0, sim
		syscall
		
	fim_if_res:
		# encerra programa
		li $v0, 10
		syscall
		
.data
.text
ver_quadrado_perfeito:
	# v0 == 1 ? sim : nao
	li $t0, 1 # t0 = i
	
	loop:
		mul $t1, $t0, $t0	# t1 = i * i
		slt $t2, $t1, $a0	# t1 < n (a0) ? t2 = 1 : t2 = 0  
		beq $t2, $zero, fim_loop
		
		addi $t0, $t0, 1		# i++
		j loop
	fim_loop:
			
		if:	
			mul $t1, $t0, $t0 # t1 = i * i
			bne $t1, $a0, else
		then:
			li $v0, 1 # sim
			j fim_if
		else:
			li $v0, 0 # nao
		fim_if:
			jr $ra
		
	
	
