.data

sim: 	.asciiz "sim"
nao:	.asciiz "nao"

idade_minima: 

.text
.globl main
main:
	# passo as idades para os registradores
	add $t4, $zero, 65
	add $t5, $zero, 35
	add $t6, $zero, 60
	add $t7, $zero, 30
	
	#lendo a idade
	li $v0, 5
	syscall
	add $s0, $zero, $v0 #s0 = idade
	
	#lendo o tempo de serviço
	li $v0, 5
	syscall
	add $s1, $zero, $v0 # s1 = tempo de serviço
	
	#verifica idade s0
	slt $t0, $s0, $t4 # idade < 65 t0 = 1
	beq $t0, $zero, aposenta
	j ver_temp_servico
	
	ver_temp_servico:
		#verifica tempo de serviço
		slt $t0, $s1, $t5 # temp_servico < 35 t0 = 1
		beq $t0, $zero, aposenta
		j ver_temp_e_idade
	
	ver_temp_e_idade:
		slt $t0, $s0, $t6  # idade < 60 t0 = 1
		slt $t1, $s1, $t7  # tempo < 30 t0 = 1
		
		beq $t0, $zero, ver_temp # verifica a idade
		j nao_aposenta
		
		ver_temp:
			beq $t1, $zero, aposenta # verifica o tempo
			j nao_aposenta

	aposenta:
		li $v0, 4
		la $a0, sim
		syscall
		j fim
	nao_aposenta:
		li $v0, 4
		la $a0, nao
		syscall
		j fim
	fim:
	