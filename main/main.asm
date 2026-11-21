%include "src/functions.s"
%include "src/renderer.s"

section .data
    width equ 10
    height equ 10

section .bss

section .text
global _start

_start:
    call exit
