%include "src/functions.s"
%include "src/renderer.s"

section .data
    width equ 10
    height equ 10

section .bss
    framebuffer resb width * height

section .text
global _start

makeSquare:
    push r12
    push r13

    xor r12, r12
    xor r13, r13

    .loopY:
        cmp r12, 5
        je .end

        jmp .loopX

    .loopX:
        cmp r13, 5
        je .returntoY

        mov rdx, r13
        mov rdi, r12
        
        mov al, '#'
        call setPixelFramebuffer

        inc r13
        jmp .loopX

    .returntoY:
        xor r13, r13
        inc r12
        jmp .loopY

    .end:
        pop r12
        pop r13
        ret

_start:
    call resetFramebuffer

    call makeSquare

    call drawFramebuffer

    call exit
