.data
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
	
	
	