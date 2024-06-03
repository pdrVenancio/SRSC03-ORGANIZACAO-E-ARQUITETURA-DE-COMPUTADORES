# $s0 = r
# $s1 = m
# $s2 = n
# $s3 = o
# $s4 = p

# Exercicio A: r = m + n
	addi $s1, $zero, 10 # $s1 = 10
	addi $s2, $zero, 6 # $s2 = 6
	add $s0, $s1, $s2 # $s1 + $s2

# Exercico B: r = m - (n + o)
	add $t0, $s2, $s3 # $t0 = n + o
	sub $s0, $s1, $t0 # s0 = n - t0

# Exercicio C: r = (m - n) - (o + p)
	sub $t0, $s1, $s2 # t0 =  m - n
	add $t1, $s3, $s4 # t1 == o + p
	sub $s0, $t0, $t1 # s0 = t0 - t1

# Exercico D: r = m - (n + 2)
	addi $t0, $s2, 2 #t0 = n + 2
	sub $s0, $s1, $t0  # r = m -  t0

#Exercicio E: r = [m - (2 - n)]  - ( o + p + 3)
# o + p + 3
	add $t0, $s3 , $s4 # o + p
	addi $t1, $t0, 3 # t1 = t0 + 3
# Pedomos usar t0 ou inves do t1

	addi $t2, $zero, 2 # t2 = 2
	sub $t2, $t2, $s2 # t2 = t1 - n

	sub $t3, $s1, $t2 # t3 =  m - t2
 
	sub $s0, $t3, $t1 # s0 = t3 - t1

