.data
.text
.globl main
main:
	#inicialização do loop
	li $t0, 0 #total
	li $t1, 0 #i = 0
	li $t2, 5 # n
	
	#entrada do loop
inicio: 
	#condição de parada
	slt $t3, $t1, $t2 # if i < n t3 = 1 else t3 = 0
	beq $t3, $zero, fim
	
	#corpo do loop
	add $t0, $t0, $t1 # total += i
	
	#incremento
	addi $t1, $t1, 1  # i++
	
	#desvio para o inicio do loop	
	j inicio
	
	
fim: