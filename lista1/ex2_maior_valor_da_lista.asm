.data

.text
.globl main
main:
	li $v0, 5
	syscall
	la $t0, 0($v0) 	# t0 = n1 
	
	li $v0, 5
	syscall
	la $t1, 0($v0) 	# t1 = n2
	
	li $v0, 5
	syscall
	la $t2, 0($v0) 	# t2 - n3
	
	li $v0, 5
	syscall
	la $t3, 0($v0)	# t3 = n4 
	
	add $s0, $zero, $t0 # s0 = maior valor 
	
	slt $t0, $s0, $t1 # s0 < t1
	beq $t0, 1, then 
	j if2
	
	then:
		add $s0, $zero, $t1 #s0 = t1
		j if2
	if2:
		slt $t0, $s0, $t2 # s0 < t1 ?
		beq $t0, 1, then2 
		j if3
	then2:
		add $s0, $zero, $t2 #s0 = t2
		j if3
	if3: 
		slt $t0, $s0, $t3 # s0 < t3 ?
		beq $t0, 1, then3
		j fim
	then3:
		add $s0, $zero, $t3 # s0 < t3 ? 
		j fim
	fim:
		add $a0, $zero, $s0 # passa o valor int para o registrador reponsavel por printar
		li $v0, 1 # printa int 
		syscall
	
				
					
						
							
								
									
										
											
												
													
														
															
																
																	
											