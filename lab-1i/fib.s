	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, lr}
			
	@ R4 = R0 - 0 (update flags)
	@ if(R0 <= 0) goto .L3 (which returns 0)
	subs r4,r0,#0
	ble .L3 

	@ Compare R4 wtih 1
	@ If R4 == 1 goto .L4 (which returns 1)
	cmp r4,#1
	beq .L4

	@ R3 = f1, R5 = f2
	mov r3 , #0
	mov r5 , #1	
	
.L2:
	@change the f1, f2 (R3 ,R5) 
	add r5,r5,r3
	sub r3,r5,r3
	@R4 is the counter for the loop
	sub r4,r4,#1	
	@ if R4 = 1 , finish the loop go to .L5 ,else cont. the loop
	cmp r4,#1
	beq .L5
	bl .L2	

	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {r3, r4, r5, pc}		@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {r3, r4, r5, pc}		@ EPILOG
.L5:
	mov r0,r5
	pop {r3, r4, r5, pc}

	.size fibonacci, .-fibonacci
	.end
