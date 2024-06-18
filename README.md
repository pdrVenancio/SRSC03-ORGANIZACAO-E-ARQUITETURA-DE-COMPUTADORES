# Inicializar no linux

java -jar nome do arquivo

**slt :**  < true retorna 1 false retorna 0

**exemplo:**

```
slt $t1, $zero, $v0  # if($zero < $v0): $t1 = 1 else: $t1 = 0
```

**li:**  Carega um valor, normalmente quando vamor pedir dados do usuario

# Array

Declarar como label

```
.data

arrA .word 1,2,3,4,5,6
arrB .word 2 : 10 #10 elementos inteiros ocupados pelo valor 2
```

Para percorrer o vetor, sll desloca os bit para a esqueda. 

```
sll rd, rt, shamt
```

* **rd:**  Registrador onde o resultado sera armazenado.
* **rt:** Registrador que contem o operando (idx).
* **shmt:**  quantidade de bits a serem deslocados  (4 * i).

# Função

Ussamos **jal** e **jr** o registrador **ra**. 

* Registradore de argumento **a0** a **a3**, se precisar de mais podemos usar os registradores **t** antes de **jal**.
* Pode retornar no maximo 2 valores **v0** e **v1** ante de chamar o **jr $ra**.
*
