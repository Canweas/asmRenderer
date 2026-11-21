%macro RESET_FRAMEBUFFER 1
    mov rdi, %1
    call resetFramebuffer
%endmacro

%macro DRAW_FRAMEBUFFER 1
    mov rdi, %1
    call drawFramebuffer
%endmacro

%macro SET_PIXEL 4
    mov rdi, %1

    mov rsi, %2
    mov rdx, %3
    
    mov rcx, %4

    call setPixelFramebuffer
%endmacro


