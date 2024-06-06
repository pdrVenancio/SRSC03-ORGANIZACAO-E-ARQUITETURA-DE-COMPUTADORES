.data
equ: 	.asciiz "equilatero"
iso: 	.asciiz "isoceles"
esc: 	.asciiz "escaleno"

.text
.globl main
main:
	#le l1
	li $v0, 5
	syscall
	add $s1, $zero, $v0 #s1 = l1
	
	#le l2
	li $v0, 5
	syscall
	add $s2, $zero, $v0 # s2 = l2

	#le l3
	li $v0, 5
	syscall
	add $s3, $zero, $v0 # s3 = l3
	
	
	beq $s1, $s2, ver_equilatero # compara se dois lados
	j ver_isoceles
	
	#verifica se é equilatero
	ver_equilatero:
		beq $s1, $s3, equilatero # compara o ultimo lado 
		j isoceles
		
	ver_isoceles:
		beq $s1, $s3, isoceles # compara o ultimo lado
		j ver_s2 # se s1 e s2 forem diferntes aida tenho que compara s com s2  
		
		ver_s2:
			beq $s2, $s3, isoceles #comparo os lado que falta 
			j escaleno
		
	equilatero:
		#imprimir
		li $v0, 4 
		la $a0, equ
		syscall
		j fim
	isoceles:
		#imprimir
		li $v0,4
		la $a0, iso
		syscall
		j fim
	escaleno:
		#imprimir
		li $v0, 4
		la $a0, esc
		syscall
		j fim
		
	fim:
