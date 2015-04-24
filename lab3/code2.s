#.include "nios_macros.s"
.text
.equ LIST_FILE 5,1,3,4,2,8

.global _start

_start:
movia r4, LIST_FILE

	ldw r2, 0(r4)  #O tamanho da lista
	addi r3, r4, 4  #O primeiro elemento da lista

	addi r27, r27, -8 #Abre dois espacos na pilha
	stw r2, 0(r27) #salva o tamanho
	stw r3, 4(r27) #salva o primeiro endereco
	call SORT
END:
	br end
	
SORT:
	
	ldw r3, 4(r27) #salva o primeiro endereco
	ldw r2, 0(r27) #salva o tamanho
	addi r27, r27, 8 #Desaloca a pilha
	add r5, r0, r0 #Contador esta em r5=0
	
LOOP1:
	beq r5, r2, FIM_SORT #se o contador tiver o mesmo tamanho q a lista, sair
	addi r6, r5, -1 #contador interno, recebe r5 - 1 
	addi r8, r5, 0 #r8 recebe o contador
	slli r8, r8, 2 #multiplica por quatro
	add r8, r3, r8 #posicao i da lista
	ldw r10, 0(r8) #r10 possui a[i]
LOOP2:
	blt r6, r0, FIM_LOOP2: #Se r6 for menor que 0, sai do loop
	addi r7, r6, 0 #r7 recebe o contador
	slli r7, r7, 2 #multiplicado por 4
	add r7, r3,r7 #r7 possui endereco de a[j]	
	ldw r9, 0(r7) #r9 possui a[j]
	bgt r9, r10, FIM_LOOP2 #se a[j]>a[i] sai
	stw r9, 4(r7) #salva a[j] em a[j+1]
	addi r6, r6, -1 #decrementa o contador inteiro
	br LOOP2
FIM_LOOP2:	
	stw r10, 4(r7) #salva a[i] em a[j+1]
	addi r5, r5, 1 #incrementa o contador
	br LOOP1
FIM_SORT:
	ret







