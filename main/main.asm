%include "src/functions.s"
%include "src/renderer.s"
%include "src/macros.s"

%include "src/game/update.s"
%include "src/game/draw.s"

extern usleep

section .data
    ; Framebuffer data
    width equ 20
    height equ 10

    ; Escape sequences
    RESET_CURSOR db 27, '[', 'H'
    RESET_CURSOR_len equ $ - RESET_CURSOR

    CLEAR_SCREEN db 27, '[', '2', 'J'
    CLEAR_SCREEN_len equ $ - CLEAR_SCREEN

section .bss
    ; Make a framebuffer
    framebuffer resb width * height

section .text
global main

; reset cursor to beginning of line function
resetCursor:
    mov rsi, RESET_CURSOR
    mov rdx, RESET_CURSOR_len
    call printString
    ret

; main function, but preferable to use update and draw functions
main2:
    mov rsi, CLEAR_SCREEN
    mov rdx, CLEAR_SCREEN_len
    call printString

    .while:
        RESET_FRAMEBUFFER framebuffer

        call update
        call draw

        DRAW_FRAMEBUFFER framebuffer
        call resetCursor

        mov rdi, 50000
        call usleep

        jmp .while

main:
    call main2
    call exit
