
#define csd_LED_ADDR	0x41200000

.extern csd_main

.align 8

// Our interrupt vector table
csd_entry:
	b csd_reset
	b .
	b .
	b .
	b .
	b .
	b csd_irq
	b .

.global main
csd_reset:
main:
	ldr r9, =LEDS				// r9 = LEDS address			(Data)
	ldr r10, =csd_LED_ADDR		// r10 = csd_LED_ADDR address
	mov r11, #9					// r11 = #9  use for index

	START:						// Lable START
	subs r11, #1				// r11 = r11 - 1
	cmp r11, #0					// if(r11 == 0) ??
	moveq r11, #8				// true then r11 = #8
	ldreq r9, =LEDS				// true then r9 = LEDS address  (Data)

	ldr r2, [r9], #4			// r2 = [r9] and update r9 = r9 + #4
	str r2, [r10]				// r2의 값을 r1 메모리 자리에 저장
	bl csd_main					// branch and link csd_main

	bl START					// branch and link START Lable




forever:
	nop
	b forever


.data
.align 4
//0000001  10000000
LEDS:
	.word  1,  2,  4,  8,  16,  32,  64, 128

dst:
	.space 16  // allocate memory for 16 words


// Normal Interrupt Service Routine
csd_irq:
	b .
