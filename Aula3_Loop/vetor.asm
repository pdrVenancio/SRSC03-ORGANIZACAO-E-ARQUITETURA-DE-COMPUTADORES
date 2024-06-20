#int v[5] = {1,2,3,4,5}

#for  i = 0, i < 5, i++
#	soma += v[i] 

.data

vet:	.word 1,2,3,4,5

.text
.globl main
	
main: 
	li $s0, 0 # soma = 0
	li $s1, 0 # i = 0
	
	#endereco de cada posicao = base + deslocamennto
	# posicao 0 
	
	la $t0, vet #endereco base, onde comeca o vetor
	
	# deslocamento para o indice 0: 
	#deslocar 1 casa multiplica 2, deslocar 2 casa multiplica por 4
	sll $t1, $s1, 2 # i * 4
	
	#endereco 0
	add $s2, $t0, $t1 # s2 =  base + deslocamento
	
	#somar valor
	lw $t2, 0($s2) # t2 = vet[0]
	add $s0, $s0, $t2 # soma += vet[0]
	
	#incrementar o i
	add $s1, $s1, 1
	
	
	################################################ indice 1
	# deslocamento para o indice 1: 
	#deslocar 1 casa multiplica 2, deslocar 2 casa multiplica por 4
	sll $t1, $s1, 2 # i * 4
	
	#endereco 0
	add $s2, $t0, $t1 # s2 =  base + deslocamento
	
	#somar valor
	lw $t2, 0($s2) # t2 = vet[1]
	add $s0, $s0, $t2 # soma += vet[1]
	
	#incrementar o i
	add $s1, $s1, 1 # i++
	
	
	###############################################	idice 2
	# deslocamento para o indice 2: 
	#deslocar 1 casa multiplica 2, deslocar 2 casa multiplica por 4
	sll $t1, $s1, 2 # i * 4
	
	#endereco 0
	add $s2, $t0, $t1 # s2 =  base + deslocamento
	
	#somar valor
	lw $t2, 0($s2) # t2 = vet[2]
	add $s0, $s0, $t2 # soma += vet[2]
	
	#incrementar o i
	add $s1, $s1, 1
	
	############################################# indice 3
	# deslocamento para o indice 3: 
	#deslocar 1 casa multiplica 2, deslocar 2 casa multiplica por 4
	sll $t1, $s1, 2 # i * 4
	
	#endereco 0
	add $s2, $t0, $t1 # s2 =  base + deslocamento
	
	#somar valor
	lw $t2, 0($s2) # t2 = vet[3]
	add $s0, $s0, $t2 # soma += vet[3]
	
	#incrementar o i
	add $s1, $s1, 1
	
	########################################### indice 4
	# deslocamento para o indice 4: 
	#deslocar 1 casa multiplica 2, deslocar 2 casa multiplica por 4
	sll $t1, $s1, 2 # i * 4
	
	#endereco 0
	add $s2, $t0, $t1 # s2 =  base + deslocamento
	
	#somar valor
	lw $t2, 0($s2) # t2 = vet[4]
	add $s0, $s0, $t2 # soma += vet[4]
	
	#incrementar o i
	add $s1, $s1, 1