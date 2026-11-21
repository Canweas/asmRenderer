%include "src/functions.s"
%include "src/renderer.s"

section .data
    width equ 3
    height equ 3

section .bss
    framebuffer resb width * height

section .text
global _start

_start:
    call resetFramebuffer

    mov rdi, 2
    mov rdx, 2
    mov al, '#'
    call setPixelFramebuffer

    call drawFramebuffer

    call exit
