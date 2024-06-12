.data

vet:	.word 1,2,3,4,5

.text
.globl main
main:
	li $s0, 0 # soma = 0
	li $s1, 0 # i = 0
	li $s3, 5 # n = 5
	
	la $t0, vet # endereco base, onde comeca o vetor
 
	inicio:
		beq $s1, $s3, fim # i == 5 ? fim 	
		sll $t1, $s1, 2 # i * 4
	
		# endereco 0
		add $s2, $t0, $t1 # s2 =  base + deslocamento
	
		# somar valor
		lw $t2, 0($s2) # t2 = vet[1]
		add $s0, $s0, $t2 # soma += vet[1]
	
		# incrementar o i
		add $s1, $s1, 1 # i++
		
		j inicio
	fim:
		