	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"svd.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"\012Usage ./svd [iterations] [16 real numbers betwe"
	.ascii	"en -1 and 1]\000"
	.global	__aeabi_dmul
	.global	__aeabi_d2iz
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #84
	str	r0, [fp, #-88]
	str	r1, [fp, #-92]
	ldr	r3, [fp, #-88]
	cmp	r3, #18
	beq	.L2
	ldr	r0, .L9
	bl	puts
	mov	r1, #1
	str	r1, [fp, #-96]
	b	.L3
.L2:
	ldr	r3, [fp, #-92]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	atoi
	mov	r3, r0
	str	r3, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-48]
	b	.L4
.L7:
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L5
.L6:
	ldr	r3, [fp, #-48]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-44]
	add	r3, r2, r3
	add	r3, r3, #2
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-92]
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	atof
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	sub	r4, fp, #36
	ldmia	r4, {r3-r4}
	mov	r5, #0
	mov	r6, #1073741824
	add	r6, r6, #10485760
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_dmul
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	bl	__aeabi_d2iz
	mov	r3, r0
	strh	r3, [fp, #-22]	@ movhi
	ldr	r3, [fp, #-48]
	ldr	r2, [fp, #-44]
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mvn	r2, #59
	mov	r3, r3, asl #1
	sub	r1, fp, #20
	add	r3, r1, r3
	add	r2, r3, r2
	ldrh	r3, [fp, #-22]	@ movhi
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	str	r3, [fp, #-44]
.L5:
	ldr	r3, [fp, #-44]
	cmp	r3, #3
	ble	.L6
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-48]
.L4:
	ldr	r3, [fp, #-48]
	cmp	r3, #3
	ble	.L7
	sub	r3, fp, #80
	mov	r0, r3
	ldr	r1, [fp, #-40]
	bl	PerformSVD
	mov	r3, #0
	str	r3, [fp, #-96]
.L3:
	ldr	r3, [fp, #-96]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp!, {r4, r5, r6, fp, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	.LC0
	.size	main, .-main
	.section	.rodata
	.align	1
	.type	C.3.2828, %object
	.size	C.3.2828, 32
C.3.2828:
	.short	2048
	.short	0
	.short	0
	.short	0
	.short	0
	.short	2048
	.short	0
	.short	0
	.short	0
	.short	0
	.short	2048
	.short	0
	.short	0
	.short	0
	.short	0
	.short	2048
	.align	1
	.type	C.2.2827, %object
	.size	C.2.2827, 32
C.2.2827:
	.short	2048
	.short	0
	.short	0
	.short	0
	.short	0
	.short	2048
	.short	0
	.short	0
	.short	0
	.short	0
	.short	2048
	.short	0
	.short	0
	.short	0
	.short	0
	.short	2048
	.text
	.align	2
	.global	PerformSVD
	.type	PerformSVD, %function
PerformSVD:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 160
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #168
	str	r0, [fp, #-160]
	str	r1, [fp, #-164]
	ldr	r3, .L15
	sub	r2, fp, #48
	mov	ip, #32
	mov	r0, r2
	mov	r1, r3
	mov	r2, ip
	bl	memcpy
	ldr	r3, .L15+4
	sub	r2, fp, #80
	mov	ip, #32
	mov	r0, r2
	mov	r1, r3
	mov	r2, ip
	bl	memcpy
	mov	r3, #0
	strh	r3, [fp, #-82]	@ movhi
	mov	r3, #0
	strh	r3, [fp, #-84]	@ movhi
	mov	r3, #0
	strh	r3, [fp, #-86]	@ movhi
	mov	r3, #0
	strh	r3, [fp, #-88]	@ movhi
	sub	r2, fp, #120
	str	r2, [fp, #-168]
	mov	r3, #0
	ldr	r2, [fp, #-168]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-168]
	add	r3, r3, #4
	str	r3, [fp, #-168]
	mov	r3, #0
	ldr	r2, [fp, #-168]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-168]
	add	r3, r3, #4
	str	r3, [fp, #-168]
	mov	r3, #0
	ldr	r2, [fp, #-168]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-168]
	add	r3, r3, #4
	str	r3, [fp, #-168]
	mov	r3, #0
	ldr	r2, [fp, #-168]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-168]
	add	r3, r3, #4
	str	r3, [fp, #-168]
	mov	r3, #0
	ldr	r2, [fp, #-168]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-168]
	add	r3, r3, #4
	str	r3, [fp, #-168]
	mov	r3, #0
	ldr	r2, [fp, #-168]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-168]
	add	r3, r3, #4
	str	r3, [fp, #-168]
	mov	r3, #0
	ldr	r2, [fp, #-168]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-168]
	add	r3, r3, #4
	str	r3, [fp, #-168]
	mov	r3, #0
	ldr	r2, [fp, #-168]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-168]
	add	r3, r3, #4
	sub	r2, fp, #152
	str	r2, [fp, #-172]
	mov	r3, #0
	ldr	r2, [fp, #-172]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-172]
	add	r3, r3, #4
	str	r3, [fp, #-172]
	mov	r3, #0
	ldr	r2, [fp, #-172]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-172]
	add	r3, r3, #4
	str	r3, [fp, #-172]
	mov	r3, #0
	ldr	r2, [fp, #-172]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-172]
	add	r3, r3, #4
	str	r3, [fp, #-172]
	mov	r3, #0
	ldr	r2, [fp, #-172]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-172]
	add	r3, r3, #4
	str	r3, [fp, #-172]
	mov	r3, #0
	ldr	r2, [fp, #-172]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-172]
	add	r3, r3, #4
	str	r3, [fp, #-172]
	mov	r3, #0
	ldr	r2, [fp, #-172]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-172]
	add	r3, r3, #4
	str	r3, [fp, #-172]
	mov	r3, #0
	ldr	r2, [fp, #-172]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-172]
	add	r3, r3, #4
	str	r3, [fp, #-172]
	mov	r3, #0
	ldr	r2, [fp, #-172]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-172]
	add	r3, r3, #4
	ldr	r2, [fp, #-164]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	str	r3, [fp, #-16]
	b	.L12
.L13:
	ldr	r3, [fp, #-160]
	ldrh	r2, [r3, #0]
	ldr	r3, [fp, #-160]
	ldrh	r1, [r3, #2]
	ldr	r3, [fp, #-160]
	add	r3, r3, #8
	ldrh	r0, [r3, #0]
	ldr	r3, [fp, #-160]
	add	r3, r3, #8
	ldrh	ip, [r3, #2]
	mov	r3, r2, asl #16
	mov	r4, r3, asr #16
	mov	r3, r1, asl #16
	mov	r2, r3, asr #16
	mov	r3, r0, asl #16
	mov	lr, r3, asr #16
	mov	r3, ip, asl #16
	mov	ip, r3, asr #16
	sub	r3, fp, #84
	str	r3, [sp, #0]
	sub	r3, fp, #82
	str	r3, [sp, #4]
	mov	r0, r4
	mov	r1, r2
	mov	r2, lr
	mov	r3, ip
	bl	CalcTheta
	ldr	r3, [fp, #-160]
	add	r3, r3, #16
	ldrh	r2, [r3, #4]
	ldr	r3, [fp, #-160]
	add	r3, r3, #16
	ldrh	r1, [r3, #6]
	ldr	r3, [fp, #-160]
	add	r3, r3, #24
	ldrh	r0, [r3, #4]
	ldr	r3, [fp, #-160]
	add	r3, r3, #24
	ldrh	ip, [r3, #6]
	mov	r3, r2, asl #16
	mov	r5, r3, asr #16
	mov	r3, r1, asl #16
	mov	r2, r3, asr #16
	mov	r3, r0, asl #16
	mov	r4, r3, asr #16
	mov	r3, ip, asl #16
	mov	ip, r3, asr #16
	sub	r3, fp, #88
	str	r3, [sp, #0]
	sub	r3, fp, #86
	str	r3, [sp, #4]
	mov	r0, r5
	mov	r1, r2
	mov	r2, r4
	mov	r3, ip
	bl	CalcTheta
	ldrh	r3, [fp, #-84]
	ldrh	r2, [fp, #-88]
	mov	r3, r3, asl #16
	mov	r1, r3, asr #16
	mov	r3, r2, asl #16
	mov	r3, r3, asr #16
	sub	r2, fp, #120
	mov	r0, r1
	mov	r1, r3
	mov	r3, #1
	bl	ConstructRotMat
	ldrh	r3, [fp, #-82]
	ldrh	r2, [fp, #-86]
	mov	r3, r3, asl #16
	mov	r1, r3, asr #16
	mov	r3, r2, asl #16
	mov	r3, r3, asr #16
	sub	r2, fp, #152
	mov	r0, r1
	mov	r1, r3
	mov	r3, #0
	bl	ConstructRotMat
	sub	r3, fp, #152
	ldr	r0, [fp, #-160]
	mov	r1, r3
	bl	MatrixRotateRight4
	sub	r3, fp, #120
	mov	r0, r3
	ldr	r1, [fp, #-160]
	bl	MatrixRotateLeft4
	sub	r3, fp, #120
	mov	r0, r3
	bl	TransposeRotMat
	sub	r3, fp, #152
	mov	r0, r3
	bl	TransposeRotMat
	sub	r3, fp, #152
	sub	r2, fp, #80
	mov	r0, r3
	mov	r1, r2
	bl	MatrixRotateLeft4
	sub	r3, fp, #48
	sub	r2, fp, #120
	mov	r0, r3
	mov	r1, r2
	bl	MatrixRotateRight4
	sub	r3, fp, #48
	mov	r0, r3
	bl	PermMat
	ldr	r0, [fp, #-160]
	bl	PermMat
	sub	r3, fp, #80
	mov	r0, r3
	bl	PermMat
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
.L12:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L13
	sub	r3, fp, #48
	sub	r2, fp, #80
	mov	r0, r3
	ldr	r1, [fp, #-160]
	bl	printResult
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	C.2.2827
	.word	C.3.2828
	.size	PerformSVD, .-PerformSVD
	.section	.rodata
	.align	2
.LC1:
	.ascii	"\012%11cU%24cSigma%24cV\012\000"
	.global	__aeabi_i2d
	.global	__aeabi_ddiv
	.align	2
.LC2:
	.ascii	"% 02.2f \000"
	.align	2
.LC3:
	.ascii	" | \000"
	.text
	.align	2
	.global	printResult
	.type	printResult, %function
printResult:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #28
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	ldr	r0, .L27
	mov	r1, #32
	mov	r2, #32
	mov	r3, #32
	bl	printf
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L18
.L25:
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L19
.L20:
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-32]
	add	r2, r3, r2
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	mov	r5, #0
	mov	r6, #1073741824
	add	r6, r6, #10485760
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ddiv
	mov	r3, r0
	mov	r4, r1
	ldr	r0, .L27+4
	mov	r2, r3
	mov	r3, r4
	bl	printf
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L19:
	ldr	r3, [fp, #-24]
	cmp	r3, #3
	ble	.L20
	ldr	r0, .L27+8
	bl	printf
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L21
.L22:
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-36]
	add	r2, r3, r2
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	mov	r5, #0
	mov	r6, #1073741824
	add	r6, r6, #10485760
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ddiv
	mov	r3, r0
	mov	r4, r1
	ldr	r0, .L27+4
	mov	r2, r3
	mov	r3, r4
	bl	printf
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L21:
	ldr	r3, [fp, #-24]
	cmp	r3, #3
	ble	.L22
	ldr	r0, .L27+8
	bl	printf
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L23
.L24:
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-40]
	add	r2, r3, r2
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	mov	r5, #0
	mov	r6, #1073741824
	add	r6, r6, #10485760
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ddiv
	mov	r3, r0
	mov	r4, r1
	ldr	r0, .L27+4
	mov	r2, r3
	mov	r3, r4
	bl	printf
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L23:
	ldr	r3, [fp, #-24]
	cmp	r3, #3
	ble	.L24
	mov	r0, #10
	bl	putchar
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L18:
	ldr	r3, [fp, #-28]
	cmp	r3, #3
	ble	.L25
	mov	r0, #10
	bl	putchar
	sub	sp, fp, #16
	ldmfd	sp!, {r4, r5, r6, fp, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.size	printResult, .-printResult
	.align	2
	.global	TransposeRotMat
	.type	TransposeRotMat, %function
TransposeRotMat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	add	r2, r3, #2
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	ldrh	r3, [r3, #0]
	rsb	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-8]
	add	r2, r3, #8
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	ldrh	r3, [r3, #0]
	rsb	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-8]
	add	r2, r3, #22
	ldr	r3, [fp, #-8]
	add	r3, r3, #22
	ldrh	r3, [r3, #0]
	rsb	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-8]
	add	r2, r3, #28
	ldr	r3, [fp, #-8]
	add	r3, r3, #28
	ldrh	r3, [r3, #0]
	rsb	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r2, #0]	@ movhi
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	TransposeRotMat, .-TransposeRotMat
	.align	2
	.global	PermMat
	.type	PermMat, %function
PermMat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #52
	str	r0, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L32
.L35:
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L33
.L34:
	ldr	r3, [fp, #-12]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-8]
	add	r0, r2, r3
	ldr	r3, [fp, #-12]
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r1, [r3, #0]
	mvn	r2, #39
	mov	r3, r0, asl #1
	sub	r0, fp, #4
	add	r3, r0, r3
	add	r3, r3, r2
	strh	r1, [r3, #0]	@ movhi
	ldr	r3, [fp, #-12]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	add	r0, r3, #1
	ldr	r3, [fp, #-12]
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r1, [r3, #0]
	mvn	r2, #39
	mov	r3, r0, asl #1
	sub	ip, fp, #4
	add	r3, ip, r3
	add	r3, r3, r2
	strh	r1, [r3, #0]	@ movhi
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-8]
	add	r0, r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r1, [r3, #0]
	mvn	r2, #39
	mov	r3, r0, asl #1
	sub	r0, fp, #4
	add	r3, r0, r3
	add	r3, r3, r2
	strh	r1, [r3, #0]	@ movhi
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	add	r0, r3, #1
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r1, [r3, #0]
	mvn	r2, #39
	mov	r3, r0, asl #1
	sub	ip, fp, #4
	add	r3, ip, r3
	add	r3, r3, r2
	strh	r1, [r3, #0]	@ movhi
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	str	r3, [fp, #-8]
.L33:
	ldr	r3, [fp, #-8]
	cmp	r3, #2
	ble	.L34
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	mov	r3, r3, asl #2
	sub	r0, r3, #1
	ldr	r3, [fp, #-12]
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-48]
	add	r3, r3, r2
	ldrh	r1, [r3, #2]
	mvn	r2, #39
	mov	r3, r0, asl #1
	sub	r0, fp, #4
	add	r3, r0, r3
	add	r3, r3, r2
	strh	r1, [r3, #0]	@ movhi
	ldr	r3, [fp, #-12]
	mov	r0, r3, asl #2
	ldr	r3, [fp, #-12]
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-48]
	add	r3, r3, r2
	ldrh	r1, [r3, #0]
	mvn	r2, #39
	mov	r3, r0, asl #1
	sub	ip, fp, #4
	add	r3, ip, r3
	add	r3, r3, r2
	strh	r1, [r3, #0]	@ movhi
	ldr	r3, [fp, #-12]
	add	r3, r3, #2
	mov	r3, r3, asl #2
	sub	r0, r3, #1
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-48]
	add	r3, r3, r2
	ldrh	r1, [r3, #2]
	mvn	r2, #39
	mov	r3, r0, asl #1
	sub	r0, fp, #4
	add	r3, r0, r3
	add	r3, r3, r2
	strh	r1, [r3, #0]	@ movhi
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	mov	r0, r3, asl #2
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-48]
	add	r3, r3, r2
	ldrh	r1, [r3, #0]
	mvn	r2, #39
	mov	r3, r0, asl #1
	sub	ip, fp, #4
	add	r3, ip, r3
	add	r3, r3, r2
	strh	r1, [r3, #0]	@ movhi
	ldr	r3, [fp, #-12]
	add	r3, r3, #2
	str	r3, [fp, #-12]
.L32:
	ldr	r3, [fp, #-12]
	cmp	r3, #3
	ble	.L35
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L36
.L39:
	mov	r3, #1
	str	r3, [fp, #-12]
	b	.L37
.L38:
	ldr	r3, [fp, #-12]
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-48]
	add	r1, r3, r2
	ldr	r0, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	mvn	r2, #39
	mov	r3, r3, asl #1
	sub	ip, fp, #4
	add	r3, ip, r3
	add	r3, r3, r2
	ldrh	r2, [r3, #0]
	mov	r3, r0, asl #1
	add	r3, r1, r3
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-48]
	add	r1, r3, r2
	ldr	r0, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #2
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	mvn	r2, #39
	mov	r3, r3, asl #1
	sub	ip, fp, #4
	add	r3, ip, r3
	add	r3, r3, r2
	ldrh	r2, [r3, #0]
	mov	r3, r0, asl #1
	add	r3, r1, r3
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-12]
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-48]
	add	r1, r3, r2
	ldr	r3, [fp, #-8]
	add	r0, r3, #1
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	add	r3, r2, r3
	mvn	r2, #39
	mov	r3, r3, asl #1
	sub	ip, fp, #4
	add	r3, ip, r3
	add	r3, r3, r2
	ldrh	r2, [r3, #0]
	mov	r3, r0, asl #1
	add	r3, r1, r3
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-48]
	add	r1, r3, r2
	ldr	r3, [fp, #-8]
	add	r0, r3, #1
	ldr	r3, [fp, #-12]
	add	r3, r3, #2
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	add	r3, r2, r3
	mvn	r2, #39
	mov	r3, r3, asl #1
	sub	ip, fp, #4
	add	r3, ip, r3
	add	r3, r3, r2
	ldrh	r2, [r3, #0]
	mov	r3, r0, asl #1
	add	r3, r1, r3
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-12]
	add	r3, r3, #2
	str	r3, [fp, #-12]
.L37:
	ldr	r3, [fp, #-12]
	cmp	r3, #2
	ble	.L38
	ldr	r3, [fp, #-48]
	add	r1, r3, #24
	ldr	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	mvn	r2, #39
	mov	r3, r3, asl #1
	sub	ip, fp, #4
	add	r3, ip, r3
	add	r3, r3, r2
	ldrh	r2, [r3, #0]
	mov	r3, r0, asl #1
	add	r3, r1, r3
	strh	r2, [r3, #0]	@ movhi
	ldr	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	mvn	r2, #39
	mov	r3, r3, asl #1
	sub	r1, fp, #4
	add	r3, r1, r3
	add	r3, r3, r2
	ldrh	r1, [r3, #0]
	ldr	r2, [fp, #-48]
	mov	r3, r0, asl #1
	add	r3, r2, r3
	strh	r1, [r3, #0]	@ movhi
	ldr	r3, [fp, #-48]
	add	r0, r3, #24
	ldr	r3, [fp, #-8]
	add	r1, r3, #1
	ldr	r3, [fp, #-8]
	add	r3, r3, #5
	mvn	r2, #39
	mov	r3, r3, asl #1
	sub	ip, fp, #4
	add	r3, ip, r3
	add	r3, r3, r2
	ldrh	r2, [r3, #0]
	mov	r3, r1, asl #1
	add	r3, r0, r3
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-8]
	add	r0, r3, #1
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	mvn	r2, #39
	mov	r3, r3, asl #1
	sub	r1, fp, #4
	add	r3, r1, r3
	add	r3, r3, r2
	ldrh	r1, [r3, #0]
	ldr	r2, [fp, #-48]
	mov	r3, r0, asl #1
	add	r3, r2, r3
	strh	r1, [r3, #0]	@ movhi
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	str	r3, [fp, #-8]
.L36:
	ldr	r3, [fp, #-8]
	cmp	r3, #3
	ble	.L39
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	PermMat, .-PermMat
	.align	2
	.global	ConstructRotMat
	.type	ConstructRotMat, %function
ConstructRotMat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r2, [fp, #-28]
	str	r3, [fp, #-32]
	strh	r0, [fp, #-22]	@ movhi
	strh	r1, [fp, #-24]	@ movhi
	ldrsh	r3, [fp, #-22]
	mov	r0, r3
	bl	Sin
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-14]	@ movhi
	ldrsh	r3, [fp, #-22]
	mov	r0, r3
	bl	Cos
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-12]	@ movhi
	ldrsh	r3, [fp, #-24]
	mov	r0, r3
	bl	Sin
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-10]	@ movhi
	ldrsh	r3, [fp, #-24]
	mov	r0, r3
	bl	Cos
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-8]	@ movhi
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	bne	.L42
	ldrh	r3, [fp, #-14]	@ movhi
	rsb	r3, r3, #0
	strh	r3, [fp, #-14]	@ movhi
	ldrh	r3, [fp, #-10]	@ movhi
	rsb	r3, r3, #0
	strh	r3, [fp, #-10]	@ movhi
.L42:
	mov	r3, #2
	strh	r3, [fp, #-6]	@ movhi
	b	.L43
.L44:
	ldrsh	r3, [fp, #-6]
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-28]
	add	r2, r3, r2
	ldrsh	r3, [fp, #-6]
	mov	r3, r3, asl #1
	add	r2, r2, r3
	mov	r3, #2048
	strh	r3, [r2, #0]	@ movhi
	ldrh	r3, [fp, #-6]	@ movhi
	add	r3, r3, #1
	strh	r3, [fp, #-6]	@ movhi
.L43:
	ldrsh	r3, [fp, #-6]
	cmp	r3, #1
	ble	.L44
	ldr	r2, [fp, #-28]
	ldrh	r3, [fp, #-12]	@ movhi
	strh	r3, [r2, #0]	@ movhi
	ldr	r2, [fp, #-28]
	ldrh	r3, [fp, #-14]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	ldr	r3, [fp, #-28]
	add	r2, r3, #8
	ldrh	r3, [fp, #-12]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	ldr	r3, [fp, #-28]
	add	r2, r3, #8
	ldrh	r3, [fp, #-14]	@ movhi
	rsb	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-28]
	add	r2, r3, #16
	ldrh	r3, [fp, #-8]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	ldr	r3, [fp, #-28]
	add	r2, r3, #16
	ldrh	r3, [fp, #-10]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	ldr	r3, [fp, #-28]
	add	r2, r3, #24
	ldrh	r3, [fp, #-8]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	ldr	r3, [fp, #-28]
	add	r2, r3, #24
	ldrh	r3, [fp, #-10]	@ movhi
	rsb	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r2, #4]	@ movhi
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	ConstructRotMat, .-ConstructRotMat
	.align	2
	.global	MatrixRotateLeft4
	.type	MatrixRotateLeft4, %function
MatrixRotateLeft4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #84
	str	r0, [fp, #-80]
	str	r1, [fp, #-84]
	ldr	r3, [fp, #-80]
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #8
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-80]
	add	r3, r3, #8
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #8
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #8
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-80]
	add	r3, r3, #16
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #16
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #16
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #24
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-80]
	add	r3, r3, #24
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #16
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #24
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #24
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-80]
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #8
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-80]
	add	r3, r3, #8
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #8
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #8
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-80]
	add	r3, r3, #16
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #16
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #16
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #24
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-80]
	add	r3, r3, #24
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #16
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #24
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #24
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-80]
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #8
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-80]
	add	r3, r3, #8
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #8
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #8
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-80]
	add	r3, r3, #16
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #16
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #16
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #24
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-80]
	add	r3, r3, #24
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #16
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #24
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #24
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-80]
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #8
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-80]
	add	r3, r3, #8
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #8
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #8
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-80]
	add	r3, r3, #16
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #16
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #16
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #24
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-80]
	add	r3, r3, #24
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #16
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #24
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #24
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-60]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L47
.L48:
	ldr	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	mvn	r2, #19
	mov	r3, r3, asl #2
	sub	r1, fp, #4
	add	r3, r1, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r2, [fp, #-84]
	mov	r3, r0, asl #1
	add	r3, r2, r3
	strh	r1, [r3, #0]	@ movhi
	ldr	r3, [fp, #-84]
	add	r0, r3, #8
	ldr	r1, [fp, #-8]
	ldr	r3, [fp, #-8]
	mvn	r2, #35
	mov	r3, r3, asl #2
	sub	ip, fp, #4
	add	r3, ip, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	mov	r3, r1, asl #1
	add	r3, r0, r3
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-84]
	add	r0, r3, #16
	ldr	r1, [fp, #-8]
	ldr	r3, [fp, #-8]
	mvn	r2, #51
	mov	r3, r3, asl #2
	sub	ip, fp, #4
	add	r3, ip, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	mov	r3, r1, asl #1
	add	r3, r0, r3
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-84]
	add	r0, r3, #24
	ldr	r1, [fp, #-8]
	ldr	r3, [fp, #-8]
	mvn	r2, #67
	mov	r3, r3, asl #2
	sub	ip, fp, #4
	add	r3, ip, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	mov	r3, r1, asl #1
	add	r3, r0, r3
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-8]
	add	r0, r3, #1
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	mvn	r2, #19
	mov	r3, r3, asl #2
	sub	r1, fp, #4
	add	r3, r1, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r2, [fp, #-84]
	mov	r3, r0, asl #1
	add	r3, r2, r3
	strh	r1, [r3, #0]	@ movhi
	ldr	r3, [fp, #-84]
	add	r1, r3, #8
	ldr	r3, [fp, #-8]
	add	r0, r3, #1
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	mvn	r2, #35
	mov	r3, r3, asl #2
	sub	ip, fp, #4
	add	r3, ip, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	mov	r3, r0, asl #1
	add	r3, r1, r3
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-84]
	add	r1, r3, #16
	ldr	r3, [fp, #-8]
	add	r0, r3, #1
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	mvn	r2, #51
	mov	r3, r3, asl #2
	sub	ip, fp, #4
	add	r3, ip, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	mov	r3, r0, asl #1
	add	r3, r1, r3
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-84]
	add	r1, r3, #24
	ldr	r3, [fp, #-8]
	add	r0, r3, #1
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	mvn	r2, #67
	mov	r3, r3, asl #2
	sub	ip, fp, #4
	add	r3, ip, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	mov	r3, r0, asl #1
	add	r3, r1, r3
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	str	r3, [fp, #-8]
.L47:
	ldr	r3, [fp, #-8]
	cmp	r3, #3
	ble	.L48
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	MatrixRotateLeft4, .-MatrixRotateLeft4
	.align	2
	.global	MatrixRotateRight4
	.type	MatrixRotateRight4, %function
MatrixRotateRight4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #84
	str	r0, [fp, #-80]
	str	r1, [fp, #-84]
	ldr	r3, [fp, #-80]
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #8
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-80]
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #8
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-80]
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #16
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #24
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-80]
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #16
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #24
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-80]
	add	r3, r3, #8
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #8
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #8
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-80]
	add	r3, r3, #8
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #8
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #8
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-80]
	add	r3, r3, #8
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #16
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #8
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #24
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-80]
	add	r3, r3, #8
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #16
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #8
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #24
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-80]
	add	r3, r3, #16
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #16
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #8
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-80]
	add	r3, r3, #16
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #16
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #8
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-80]
	add	r3, r3, #16
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #16
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #16
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #24
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-80]
	add	r3, r3, #16
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #16
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #16
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #24
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-80]
	add	r3, r3, #24
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #24
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #8
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-80]
	add	r3, r3, #24
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #24
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #8
	ldrh	r3, [r3, #2]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-80]
	add	r3, r3, #24
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #16
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #24
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #24
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-80]
	add	r3, r3, #24
	ldrh	r3, [r3, #4]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #16
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r1, r3, r2
	ldr	r3, [fp, #-80]
	add	r3, r3, #24
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-84]
	add	r3, r3, #24
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-80]
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-40]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-80]
	strh	r2, [r3, #2]	@ movhi
	ldr	r3, [fp, #-56]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-80]
	strh	r2, [r3, #4]	@ movhi
	ldr	r3, [fp, #-72]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-80]
	strh	r2, [r3, #6]	@ movhi
	ldr	r3, [fp, #-80]
	add	r2, r3, #8
	ldr	r3, [fp, #-20]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-80]
	add	r2, r3, #8
	ldr	r3, [fp, #-36]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r2, #2]	@ movhi
	ldr	r3, [fp, #-80]
	add	r2, r3, #8
	ldr	r3, [fp, #-52]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r2, #4]	@ movhi
	ldr	r3, [fp, #-80]
	add	r2, r3, #8
	ldr	r3, [fp, #-68]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r2, #6]	@ movhi
	ldr	r3, [fp, #-80]
	add	r2, r3, #16
	ldr	r3, [fp, #-16]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-80]
	add	r2, r3, #16
	ldr	r3, [fp, #-32]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r2, #2]	@ movhi
	ldr	r3, [fp, #-80]
	add	r2, r3, #16
	ldr	r3, [fp, #-48]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r2, #4]	@ movhi
	ldr	r3, [fp, #-80]
	add	r2, r3, #16
	ldr	r3, [fp, #-64]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r2, #6]	@ movhi
	ldr	r3, [fp, #-80]
	add	r2, r3, #24
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-80]
	add	r2, r3, #24
	ldr	r3, [fp, #-28]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r2, #2]	@ movhi
	ldr	r3, [fp, #-80]
	add	r2, r3, #24
	ldr	r3, [fp, #-44]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r2, #4]	@ movhi
	ldr	r3, [fp, #-80]
	add	r2, r3, #24
	ldr	r3, [fp, #-60]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r2, #6]	@ movhi
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	MatrixRotateRight4, .-MatrixRotateRight4
	.global	__aeabi_idiv
	.align	2
	.global	CalcTheta
	.type	CalcTheta, %function
CalcTheta:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	strh	r0, [fp, #-22]	@ movhi
	strh	r1, [fp, #-24]	@ movhi
	strh	r2, [fp, #-26]	@ movhi
	strh	r3, [fp, #-28]	@ movhi
	ldrsh	r2, [fp, #-26]
	ldrsh	r3, [fp, #-24]
	add	r3, r2, r3
	cmp	r3, #0
	bne	.L53
	mov	r3, #0
	strh	r3, [fp, #-12]	@ movhi
	b	.L54
.L53:
	ldrsh	r2, [fp, #-28]
	ldrsh	r3, [fp, #-22]
	cmp	r2, r3
	bne	.L55
	mvn	r3, #32768
	strh	r3, [fp, #-12]	@ movhi
	ldrsh	r2, [fp, #-26]
	ldrsh	r3, [fp, #-24]
	add	r3, r2, r3
	cmp	r3, #0
	bge	.L56
	ldrh	r3, [fp, #-12]	@ movhi
	rsb	r3, r3, #0
	strh	r3, [fp, #-12]	@ movhi
.L56:
	mov	r3, #0
	strh	r3, [fp, #-10]	@ movhi
	b	.L54
.L55:
	ldrsh	r2, [fp, #-26]
	ldrsh	r3, [fp, #-24]
	add	r3, r2, r3
	mov	r1, r3, asl #11
	ldrsh	r2, [fp, #-28]
	ldrsh	r3, [fp, #-22]
	rsb	r3, r3, r2
	mov	r0, r1
	mov	r1, r3
	bl	__aeabi_idiv
	mov	r3, r0
	strh	r3, [fp, #-12]	@ movhi
	ldrsh	r2, [fp, #-28]
	ldrsh	r3, [fp, #-22]
	rsb	r3, r3, r2
	mov	r1, r3, asl #11
	ldrsh	r2, [fp, #-26]
	ldrsh	r3, [fp, #-24]
	add	r3, r2, r3
	mov	r0, r1
	mov	r1, r3
	bl	__aeabi_idiv
	mov	r3, r0
	strh	r3, [fp, #-10]	@ movhi
.L54:
	ldrsh	r2, [fp, #-26]
	ldrsh	r3, [fp, #-24]
	cmp	r2, r3
	bne	.L57
	mov	r3, #0
	strh	r3, [fp, #-8]	@ movhi
	b	.L58
.L57:
	ldrsh	r3, [fp, #-28]
	ldrsh	r2, [fp, #-22]
	add	r3, r3, r2
	cmp	r3, #0
	bne	.L59
	mvn	r3, #32768
	strh	r3, [fp, #-8]	@ movhi
	ldrsh	r2, [fp, #-26]
	ldrsh	r3, [fp, #-24]
	rsb	r3, r3, r2
	cmp	r3, #0
	bge	.L60
	ldrh	r3, [fp, #-8]	@ movhi
	rsb	r3, r3, #0
	strh	r3, [fp, #-8]	@ movhi
.L60:
	mov	r3, #0
	strh	r3, [fp, #-6]	@ movhi
	b	.L58
.L59:
	ldrsh	r2, [fp, #-26]
	ldrsh	r3, [fp, #-24]
	rsb	r3, r3, r2
	mov	r1, r3, asl #11
	ldrsh	r2, [fp, #-28]
	ldrsh	r3, [fp, #-22]
	add	r3, r2, r3
	mov	r0, r1
	mov	r1, r3
	bl	__aeabi_idiv
	mov	r3, r0
	strh	r3, [fp, #-8]	@ movhi
	ldrsh	r2, [fp, #-28]
	ldrsh	r3, [fp, #-22]
	add	r3, r2, r3
	mov	r1, r3, asl #11
	ldrsh	r2, [fp, #-26]
	ldrsh	r3, [fp, #-24]
	rsb	r3, r3, r2
	mov	r0, r1
	mov	r1, r3
	bl	__aeabi_idiv
	mov	r3, r0
	strh	r3, [fp, #-6]	@ movhi
.L58:
	ldrsh	r3, [fp, #-12]
	cmp	r3, #2048
	bgt	.L61
	ldrsh	r3, [fp, #-12]
	cmn	r3, #2048
	blt	.L61
	ldrsh	r3, [fp, #-12]
	mov	r0, r3
	bl	Arctan
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-16]	@ movhi
	b	.L62
.L61:
	ldrsh	r3, [fp, #-12]
	cmp	r3, #2048
	ble	.L63
	ldrsh	r3, [fp, #-10]
	mov	r0, r3
	bl	Arctan
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	rsb	r3, r3, #3216
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-16]	@ movhi
	b	.L62
.L63:
	ldrsh	r3, [fp, #-10]
	mov	r0, r3
	bl	Arctan
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	rsb	r3, r3, #-16777216
	add	r3, r3, #16711680
	add	r3, r3, #62208
	add	r3, r3, #111
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-16]	@ movhi
.L62:
	ldrsh	r3, [fp, #-8]
	cmp	r3, #2048
	bgt	.L64
	ldrsh	r3, [fp, #-8]
	cmn	r3, #2048
	blt	.L64
	ldrsh	r3, [fp, #-8]
	mov	r0, r3
	bl	Arctan
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-14]	@ movhi
	b	.L65
.L64:
	ldrsh	r3, [fp, #-8]
	cmp	r3, #2048
	ble	.L66
	ldrsh	r3, [fp, #-6]
	mov	r0, r3
	bl	Arctan
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	rsb	r3, r3, #3216
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-14]	@ movhi
	b	.L65
.L66:
	ldrsh	r3, [fp, #-6]
	mov	r0, r3
	bl	Arctan
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	rsb	r3, r3, #-16777216
	add	r3, r3, #16711680
	add	r3, r3, #62208
	add	r3, r3, #111
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-14]	@ movhi
.L65:
	ldrsh	r2, [fp, #-16]
	ldrsh	r3, [fp, #-14]
	add	r3, r2, r3
	mov	r3, r3, asr #1
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #8]
	strh	r2, [r3, #0]	@ movhi
	ldrsh	r2, [fp, #-16]
	ldrsh	r3, [fp, #-14]
	rsb	r3, r3, r2
	mov	r3, r3, asr #1
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #4]
	strh	r2, [r3, #0]	@ movhi
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	CalcTheta, .-CalcTheta
	.align	2
	.global	Arctan
	.type	Arctan, %function
Arctan:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	mov	r3, r0
	strh	r3, [fp, #-14]	@ movhi
	mov	r3, #0
	str	r3, [fp, #-8]
	ldrsh	r3, [fp, #-14]
	cmp	r3, #1024
	ble	.L69
	ldrsh	r3, [fp, #-14]
	cmp	r3, #2048
	bgt	.L69
	ldrsh	r1, [fp, #-14]
	mov	r3, r1
	mov	r3, r3, asl #3
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #5
	add	r3, r3, r2
	rsb	r3, r1, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	add	r3, r3, #593920
	add	r3, r3, #2048
	str	r3, [fp, #-8]
	b	.L70
.L69:
	ldrsh	r3, [fp, #-14]
	cmn	r3, #1024
	blt	.L71
	ldrsh	r3, [fp, #-14]
	cmp	r3, #1024
	bgt	.L71
	ldrsh	r1, [fp, #-14]
	mov	r3, r1
	mov	r2, r3, asl #2
	mov	r3, r2, asl #3
	rsb	r3, r2, r3
	mov	r2, r3, asl #4
	add	r3, r3, r2
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	str	r3, [fp, #-8]
	b	.L70
.L71:
	ldrsh	r3, [fp, #-14]
	cmn	r3, #2048
	blt	.L70
	ldrsh	r3, [fp, #-14]
	cmn	r3, #1024
	bge	.L70
	ldrsh	r1, [fp, #-14]
	mov	r3, r1
	mov	r3, r3, asl #3
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #5
	add	r3, r3, r2
	rsb	r3, r1, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #593920
	sub	r3, r3, #2048
	str	r3, [fp, #-8]
.L70:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asr #11
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	Arctan, .-Arctan
	.align	2
	.global	Sin
	.type	Sin, %function
Sin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	mov	r3, r0
	strh	r3, [fp, #-22]	@ movhi
	ldrsh	r2, [fp, #-22]
	ldrsh	r3, [fp, #-22]
	mul	r3, r2, r3
	mov	r3, r3, asr #11
	str	r3, [fp, #-16]
	ldrh	r3, [fp, #-22]	@ movhi
	strh	r3, [fp, #-10]	@ movhi
	ldrsh	r2, [fp, #-22]
	ldr	r3, [fp, #-16]
	mul	r3, r2, r3
	mov	r3, r3, asr #11
	str	r3, [fp, #-8]
	ldrh	r0, [fp, #-10]
	ldr	r1, [fp, #-8]
	mov	r3, r1
	mov	r3, r3, asl #1
	mov	r2, r3, asl #2
	rsb	r2, r3, r2
	mov	r3, r2, asl #3
	rsb	r3, r2, r3
	mov	r2, r3, asl #6
	add	r3, r3, r2
	add	r3, r3, r1
	mov	r3, r3, asr #14
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	rsb	r3, r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-10]	@ movhi
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	mul	r3, r2, r3
	mov	r3, r3, asr #11
	str	r3, [fp, #-8]
	ldr	r1, [fp, #-8]
	mov	r3, r1
	mov	r3, r3, asl #4
	mov	r2, r3, asl #4
	add	r3, r3, r2
	add	r3, r3, r1
	mov	r3, r3, asl #2
	mov	r3, r3, asr #17
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldrh	r3, [fp, #-10]
	add	r3, r2, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-10]	@ movhi
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	mul	r3, r2, r3
	mov	r3, r3, asr #11
	str	r3, [fp, #-8]
	ldrh	r0, [fp, #-10]
	ldr	r1, [fp, #-8]
	mov	r3, r1
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, r1
	mov	r3, r3, asl #7
	mov	r3, r3, asr #23
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	rsb	r3, r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-10]	@ movhi
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	mul	r3, r2, r3
	mov	r3, r3, asr #11
	str	r3, [fp, #-8]
	ldr	r1, [fp, #-8]
	mov	r3, r1
	mov	r2, r3, asl #2
	mov	r3, r2, asl #3
	rsb	r3, r2, r3
	add	r3, r3, r1
	mov	r2, r3, asl #2
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	add	r3, r2, r3
	mov	r3, r3, asr #29
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldrh	r3, [fp, #-10]
	add	r3, r2, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-10]	@ movhi
	ldrh	r3, [fp, #-10]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	Sin, .-Sin
	.align	2
	.global	Cos
	.type	Cos, %function
Cos:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	mov	r3, r0
	strh	r3, [fp, #-22]	@ movhi
	ldrsh	r2, [fp, #-22]
	ldrsh	r3, [fp, #-22]
	mul	r3, r2, r3
	mov	r3, r3, asr #11
	str	r3, [fp, #-16]
	mov	r3, #2048
	strh	r3, [fp, #-10]	@ movhi
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	ldrh	r2, [fp, #-10]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asr #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	rsb	r3, r3, r2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-10]	@ movhi
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	mul	r3, r2, r3
	mov	r3, r3, asr #11
	str	r3, [fp, #-8]
	ldr	r1, [fp, #-8]
	mov	r3, r1
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	mov	r2, r3, asl #6
	add	r3, r3, r2
	mov	r3, r3, asr #15
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldrh	r3, [fp, #-10]
	add	r3, r2, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-10]	@ movhi
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	mul	r3, r2, r3
	mov	r3, r3, asr #11
	str	r3, [fp, #-8]
	ldrh	r0, [fp, #-10]
	ldr	r1, [fp, #-8]
	mov	r3, r1
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	rsb	r2, r3, r2
	add	r2, r2, r1
	mov	r3, r2, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #4
	mov	r3, r3, asr #20
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	rsb	r3, r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-10]	@ movhi
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	mul	r3, r2, r3
	mov	r3, r3, asr #11
	str	r3, [fp, #-8]
	ldr	r1, [fp, #-8]
	mov	r3, r1
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, r1
	mov	r3, r3, asl #7
	mov	r3, r3, asr #26
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldrh	r3, [fp, #-10]
	add	r3, r2, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-10]	@ movhi
	ldrh	r3, [fp, #-10]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	Cos, .-Cos
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
