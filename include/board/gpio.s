.include "board/base.s"

.set	GPIO_BANK_0,		GPIO_BASE+0
.set	GPIO_BANK_1,		GPIO_BASE+4

.set	GPIO_GPFSEL0,		0x0
.set	GPIO_GPFSEL1,		0x4
.set	GPIO_GPFSEL2,		0x8
.set	GPIO_GPFSEL3,		0xC
.set	GPIO_GPFSEL4,		0x10
.set	GPIO_GPFSEL5,		0x14
.set	GPIO_GPSET0,		0x1C
.set	GPIO_GPSET1,		0x20
.set	GPIO_CLR0,		0x28
.set	GPIO_CLR1,		0x2C
.set	GPIO_GPPUD,		0x94
.set	GPIO_GPPUDCLK0,		0x98
.set	GPIO_GPPUDCLK1,		0x9C
