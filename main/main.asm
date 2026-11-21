%include "src/functions.s"
%include "src/renderer.s"

%macro SET_PIXEL 4
    mov rdi, %1

    mov rsi, %2
    mov rdx, %3
    
    mov al, %4
    mov cl, al

    call setPixelFramebuffer
%endmacro

%macro RESET_FRAMEBUFFER 1
    mov rdi, %1
    call resetFramebuffer
%endmacro

%macro DRAW_FRAMEBUFFER 1
    mov rdi, %1
    call drawFramebuffer
%endmacro

section .data
    width equ 10
    height equ 10

section .bss
    framebuffer resb width * height

section .text
global _start

_start:
    RESET_FRAMEBUFFER framebuffer

    SET_PIXEL framebuffer, 1, 1, 'o'

    DRAW_FRAMEBUFFER framebuffer


    call exit
