.data

.text
.globl main
main:
	
	li $t0, 0 # total = 0
inicio:
	li $v0, 5 # ler int
	syscall
	
	# i  esta em v0
	slt $t1, $zero, $v0 # if 0 < 1 t1 = 1 else t1 = 0
	beq $t1, $zero, fim
	
	add $t0, $t0, $v0 # total += i
	
	j inicio
fim:

	add $a0, $zero, $t0
	li $v0, 1 # printa int (valor total 
	syscall