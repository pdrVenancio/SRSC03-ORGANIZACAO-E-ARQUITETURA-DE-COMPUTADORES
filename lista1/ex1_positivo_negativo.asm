.data 

pos: 	.asciiz "positivo" 	#mensagem positivo
neg: 	.asciiz "negativo" 	#idem, negativo
	
.text
.globl main
main:
	#addi $t0,$zero, 10
	
	# ler um valor inteiro
	li $v0, 5	# codigo para ler um inteiro
	syscall 	# executa o comando so para ler
	
	la $t0, 0($v0)	# passa o valor lido para t0
	
	slt $t1, $t0, $zero # t0 < zero true t1 = 1 else t1 = 0
	
	add $t2 , $zero, 1 # atribui t2 como 1
	beq $t1, $t2, then # verifica se t1 e t2 sao iguais
	j else
then:
	li $v0, 4 	# imprimir a string
	la $a0, neg	# passa o valor de negativo para ser impresso
	syscall
	j fim
else:
	li $v0, 4 	# imprimir a string
	la $a0, pos	# passa o valor de positivo para ser impresso
	syscall
	j fim

fim:	
