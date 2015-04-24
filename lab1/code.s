.include "nios_macros.s"

.text
.equ TEST_NUM, 0x90abcdef

.global _start

_start:

movia r7, TEST_NUM 
mov r4, r7 

call STRING_COUNTER

mov r16, r2 

mov r4, r7 
nor r4, r4, r4

call STRING_COUNTER

mov r17, r2 

mov r4, r7 
srli r5,r4,1
xor r4,r4,r5
call STRING_COUNTER2

mov r18,r2

END:
br END 

STRING_COUNTER:
mov r2, r0

STRING_COUNTER_LOOP: 
beq r4, r0, END_STRING_COUNTER

srli r5, r4, 1 
and r4, r4, r5 
addi r2, r2, 1 
br STRING_COUNTER_LOOP
END_STRING_COUNTER:

ret

STRING_COUNTER2:
mov r2, r0
STRING_COUNTER_LOOP2: 
beq r4, r0, END_STRING_COUNTER2

srli r5, r4, 1 
and r4, r4, r5 
addi r2, r2, 1 
br STRING_COUNTER_LOOP2
END_STRING_COUNTER2:

ret

.end