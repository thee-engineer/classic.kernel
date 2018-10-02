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


_str_null:	.ascii "NULL\0"


.section .data


.section .text


@ str_conv_hex (*mem, value) -> *str
.globl str_conv_hex
str_conv_hex:
	LDR	R0, =_str_null
	MOV	PC, LR


@ str_conv_16uint (*mem, value) -> *str
.globl str_conv_16uint
str_conv_16uint:
	LDR	R0, =_str_null
	MOV	PC, LR


@ str_conv_32uint (*mem, value) -> *str
.globl str_conv_32uint
str_conv_32uint:
	LDR	R0, =_str_null
	MOV	PC, LR


@ str_conv_32int (*mem, value) -> *str
.globl str_conv_32int
str_conv_32int:
	LDR	R0, =_str_null
	MOV	PC, LR
