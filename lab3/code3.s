.text


.global _start

_start:
	addi r2, r0, 3 #carrega o numero que vai ser calculado
	
	call FATORIAL
	
END:
	br END
	
FATORIAL: 
	addi r27, r27, -8 # Espaco pra dois na lista
	stw r31, 4(r27) # salva o endereco de retorno
	stw r2, 0(r27) # salva o valor a ser calculado
	addi r3, r0, 1 # r3 = 1 (tambem guarda o retorno)
	bge r2, r3, LOOP1 # Se n>=1, vai pra LOOP1
	addi r27, r27, 8 # Devolve as posicoes da pilha
	ret
	
LOOP1:
	addi r2, r2, -1 # n = n-1
	call FATORIAL #chama fatorial novamente
	
	ldw r2, 0(r27) #Desempilha tudo novamente
	ldw r31, 4(r27)
	addi r27, r27, 8
	
	mul r3, r2, r3 # n * fat(n-1)
	
	ret
	