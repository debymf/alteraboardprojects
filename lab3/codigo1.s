.data
vetor: .word 9,2,5,1,8,2,4,3,6,7
.text
.globl __start
__start:

	movia r2,vetor
	addi r3,r0,10
	call SORT

SWAP: 
	slli r9,r3,2
	add r9,r2,r9
	ldw r5,0(r9)
	ldw r6,4(r9)
	stw r6,0(r9)
	stw r5,4(r9)
	ret

SORT:
	addi r27,r27,-20
	stw r31,16(r27)
	stw r10,12(r27)
	stw r11,8(r27)
	stw r12,4(r27)
	stw r13,0(r27)
	mov r11,r2
	mov r10,r3
	mov r13,r0
	
FOR1:
	bge r13,r10,FIM1
	addi r12,r13,-1
	
FOR2:
	bge r12,r0,FIM2
	slli r9,r12,2
	add r6,r11,r9
	ldw r7,0(r6)
	ldw r8,4(r6)
	bge r8,r7,FIM2
	mov r2,r11
	mov r3,r12
	call SWAP
	addi r12,r12,-1
	br FOR2
	
FIM2:
	addi r13,r13,1
	br FOR1
	
FIM1:
	ldw r13,0(r27)
	ldw r12,4(r27)
	ldw r11,8(r27)
	ldw r10,12(r27)
	ldw r31,16(r27)
	addi r27,r27,20
	ret
