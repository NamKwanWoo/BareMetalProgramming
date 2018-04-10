
.data
string:
	.byte 0x0D
	.byte 0x0A
	.ascii "----------------- LED On Period -----------------"
	.byte 0x0D
	.byte 0x0A
	.ascii "1. 100ms 2. 200ms 3. 300ms 4. 400 ms "
	.byte 0x0D
	.byte 0x0A
	.ascii "5. 500ms 6. 600ms 7. 700ms 8. 1 sec"
	.byte 0x0D
	.byte 0x0A
	.ascii "----------------------------------------------------"
	.byte 0x0D
	.byte 0x0A
	.ascii "Select: "
	.byte 0x0D
	.byte 0x0A
	.byte 0x00

.text

.macro getInfoPrint

	bl uart_trans

.endm


#include "regZedUart.h"

uart_trans:

//////////////////////////////////////////////
//       아래에 오류 발생 시 clean project  //
//////////////////////////////////////////////

	ldr 	r0, =UART1_BASE
	ldr 	r1, =string

TRANSMIT_loop:

	// ---------  Check to see if the Tx FIFO is empty ------------------------------
	ldr 	r2, [r0, #UART_CHANNEL_STS_REG0_OFFSET]	@ get Channel Status Register
	and	r2, r2, #0x8		@ get Transmit Buffer Empty bit(bit[3:3])
	cmp	r2, #0x8				@ check if TxFIFO is empty and ready to receive new data
	bne	TRANSMIT_loop		@ if TxFIFO is NOT empty, keep checking until it is empty
	//------------------------------------------------------------------------------

	ldrb     r3, [r1], #1
	streqb	r3, [r0, #UART_TX_RX_FIFO0_OFFSET]	@ fill the TxFIFO with 0x48
	cmp      r3, #0x00
	bne		TRANSMIT_loop

	mov		pc, lr				@    return to the caller
