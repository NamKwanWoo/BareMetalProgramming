#define slcr_base			0xF8000000
#define slcr_UART_CLK_CTRL	slcr_base + 0x154
#define slcr_UART_RST_CTRL	slcr_base + 0x228

#define uart_base						0xE0001000
#define uart_Control_reg0				uart_base
#define uart_mode_reg0					uart_base + 0x00000004
#define uart_Baud_rate_gen_reg0			uart_base + 0x00000018
#define uart_Baud_rate_divider_reg0		uart_base + 0x00000034
#define uart_Modem_ctrl_reg0			uart_base + 0x00000024
#define uart_Modem_sts_reg0 			uart_base + 0x00000028
#define uart_TX_RX_FIFO0				uart_base + 0x00000030
#define uart_Channel_sts_reg0			uart_base + 0x0000002C

#define	UART1_BASE					 	 0xE0001000
#define	UART_CONTROL_REG0_OFFSET		 0x0
#define	UART_MODE_REG0_OFFSET			 0x4
#define	UART_INTRPT_EN_REG0_OFFSET		 0x8
#define	UART_INTRPT_DIS_REG0_OFFSET	 	 0xC
#define	UART_INTRPT_MASK_REG0_OFFSET	 0x10
#define	UART_BAUD_RATE_GEN_REG0_OFFSET 	 0x18
#define	UART_RCVR_TIMEOUT_REG0_OFFSET	 0x1C
#define	UART_RCVR_FIFO_TRG_LV0_OFFSET	 0x20
#define	UART_CHANNEL_STS_REG0_OFFSET	 0x2C
#define	UART_TX_RX_FIFO0_OFFSET			 0x30
#define	UART_BAUD_RATE_DIV_REG0_OFFSET   0x34


