%include "src/functions.s"
%include "src/renderer.s"

%macro SET_PIXEL 3
    mov rdi, framebuffer

    mov rsi, %1
    mov rdx, %2
    
    mov al, %3
    mov cl, al

    call setPixelFramebuffer
%endmacro

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

    SET_PIXEL 1, 1, 'o'

    mov rdi, framebuffer
    call drawFramebuffer
    
    call exit
