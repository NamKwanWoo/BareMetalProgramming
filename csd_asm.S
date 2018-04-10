/*
 * assignment4.S
 *
 *  Created on: 2018. 4. 8.
 *      Author: nam
 */


/*
 * assignment4.S
 *
 *  Created on: 2018. 4. 8.
 *      Author: nam
 */


#include "regZedUart.h"
#include "setParameter.s"
#include "getInfoPrint.s"

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
.global csd_entry
csd_reset:


main:

	setParameter
	getInfoPrint

    //================================================= UART INPUT =================================================\\

	ldr r0,	=slcr_UART_RST_CTRL
	ldr r1, =0x0	//	reset UART
	str r1, [r0]

	ldr r0, =slcr_UART_CLK_CTRL
	ldr r1, =0x1402	// divisor = 0x14 (ref clk = 50MHz), srcsel = 0, CLKACT1 = true, CLKACT0 = false
	str r1, [r0]

	ldr r0, =uart_mode_reg0
	ldr r1, =0x20
	str r1, [r0]

	ldr r0, =uart_Control_reg0
	ldr r1, =0x28	//uart off
	str r1, [r0]

	ldr r0, =uart_Baud_rate_gen_reg0
	ldr r1, =0x3e
	str r1, [r0]

	ldr r0, =uart_Baud_rate_divider_reg0
	ldr r1, =0x6
	str r1, [r0]

	ldr r0, =uart_Control_reg0
	ldr r1, =0x00000117	//uart start
	str r1, [r0]

	ldr r0, =uart_Modem_ctrl_reg0
	ldr r1, [r0]

	ldr r0, =uart_Modem_sts_reg0
	ldr r1, [r0]




recvloop:

	ldr r0, =uart_TX_RX_FIFO0
	ldr r1, =uart_Channel_sts_reg0



	// check empty: bit#1 is Rx FIFO empty or not (1: empty, 0: not empty)
	ldr r2, [r1]
	and r2, r2, #1<<1
	cmp r2, #0

	//moveq r10, #1

	// read data and transmit it back to sender
	ldreq r3, [r0]
	streq r3, [r0]

	moveq r4, r3

	cmp r4, #49
	bleq csd_menu1

	cmp r4, #50
	bleq csd_menu2

	cmp r4, #51
	bleq csd_menu3

	cmp r4, #52
	bleq csd_menu4

	cmp r4, #53
	bleq csd_menu5

	cmp r4, #54
	bleq csd_menu6

	cmp r4, #55
	bleq csd_menu7

	cmp r4, #56
	bleq csd_menu8


	// if you type "return" (it seems like
	// only 13 is stored in the buffer, which is "carriage return")
	// so, send "line feed" as well
	cmpeq r3, #13   // 0xD (13) is carriage return in ASCII
	moveq r4, #10 // 0xA (10) is linefeed in ASCII
	streq r4, [r0]

	//cmp r10, #1
	//bl csd_main
	//mov r10, #0

	b recvloop

    //================================================= UART INPUT =================================================\\


.data
.align 4

csd_irq:
	b .
