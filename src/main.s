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


.section .rodata


_str_hang:	.ascii "HANG\n\r\0"


.section .text


.globl _main
_main:

	BL	cmain

 _main_loop:

	BL	clk_sys_epoch
	BL	strtmp_hex
	MOV	R1, #10
	MOV	R2, #1000
	BL	draw_string

	MOV	R0, SP
	BL	strtmp_hex
	MOV	R1, #200
	MOV	R2, #1000
	BL	draw_string

	MOV	R0, PC
	BL	strtmp_hex
	MOV	R1, #400
	MOV	R2, #1000
	BL	draw_string

	B	_main_loop


.globl _hang
_hang:

	LDR	R0, =_str_hang
	BL	uart_send_string

	B .
