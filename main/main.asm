%include "src/functions.s"
%include "src/renderer.s"

section .data
    width equ 10
    height equ 10

section .bss
    framebuffer resb width * height

section .text
global _start

_start:
    mov rdi, framebuffer
    call resetFramebuffer

    mov rdi, framebuffer
    call drawFramebuffer

    call exit
