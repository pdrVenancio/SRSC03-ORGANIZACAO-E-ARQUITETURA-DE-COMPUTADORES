.data

.text
.globl main
main:
	# Lendo valores
	li $v0, 5
	syscall
	add $a0, $v0, $zero
	
	jal ver_quad_perfeito
	
	# Exibindo o resultado que vfoi retornado em v0
	# v0 = 1 sim
	# v0 = 0 nao
	
	# imprime resultado
	add $a0, $v0, $zero
	li $v0, 1
	syscall
	
	# Finaliza o programa
	li $v0, 10
	syscall
	

.data
.text
ver_quad_perfeito:
	li $t0, 1 # i = 1
	loop:
		mul $t1, $t0, $t0 # $t1 = i * i
		slt $t2, $t1, $a0
		beq $t2, $zero, end_loop
		
		addi $t0, $t0, 1
		j loop
	
	end_loop:
		if:
			mul $t1, $t0, $t0
			bne $t1, $a0, else
		then:
			li $v0, 1 # sim
			j end_if
		else:
			li $v0, 0
		end_if:
			jr $ra
			
		
		
	
