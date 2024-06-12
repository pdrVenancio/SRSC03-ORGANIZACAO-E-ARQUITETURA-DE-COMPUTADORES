.data
msg1:	.asciiz "Informe o valor: "
msg2: 	.asciiz "Resultado: "
.text
.globl main
main:
	
	# msg1
	li $v0, 4
	la $a0, msg1
	syscall

	# ler o valor
	li $v0, 5
	syscall
	
	#enviar o valor para a função / subprograma
	add  $a0, $zero, $v0 #  armazenamos o valor em a0
	# invocar a fução
	jal fatorial
	
	# guardamos o valor em t0 para nao se perder
	add $t0, $zero, $v0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	add $a0, $zero, $t0
	li $v0, 1
	syscall
	
	# Para a execução do programa
	li $v0, 10
	syscall

# subprograma / funcao
# Calcular o fatorial do valor em $a0
# Devolve resposta em $v0
.data
.text
fatorial:
	# resposta sera devolvida em v0
	li $v0, 1 # inicializando o valor fatorial
	
	loop:
		beq $a0, $zero, fim # n > 0
		
		mul $v0, $v0, $a0  # f = f * i
		
		subi $a0, $a0, 1 # i --
		
		j loop
	fim:
		# devolvendo a respos em v0
		jr $ra # return 	