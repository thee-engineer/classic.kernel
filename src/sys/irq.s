/*
   Copyright 2018 Alexandru-Paul Copil

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/


.include "board/base.s"
.include "board/irq.s"
.include "psr.s"


.section .text


@ irq_psr_enable
@ Enable IRQ in current PSR mode.
.globl irq_psr_enable
irq_psr_enable:
	MRS	R0, CPSR			@ Read  CPSR
	BIC	R0, #(PSR_IRQ)			@ Clear IRQ bit to enable IRQ
	MSR	CPSR_c, R0			@ Write CPSR
	MOV	PC, LR				@ Return

@ irq
@ IRQ signal.
.globl _irq
_irq:
	PUSH	{R0-R12, LR}			@ Save registers
	BL	irq_handler			@ IRQ Handler
	POP	{R0-R12, LR}			@ Load registers
	SUBS	PC, LR, #4			@ Resume


@ irq_handler
@ The interrupts handler checks which interrupt bits are active and runs the
@ assigned service routine.
irq_handler:
	PUSH	{LR}

	@ DEBUG

	@ LOAD PENDING IRQ
	@ TST  IRQ
	@ GOTO ISR
	@ TST  IRQ
	@ GOTO ISR
	@ ...
	@ Exit

	@ TST CLK IRQ
	BL	clk_arm_isr

	POP	{PC}				@ Return