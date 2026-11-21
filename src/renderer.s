%define RESET_CHARACTER '.'
%define SPACE 32
%define NEW_LINE 10

; ARGS 1 - RDI, 2 - RSI, 3 - RDX

resetFramebuffer:
    push r12
    xor r12, r12

    .loop:
        cmp r12, width * height
        je .end
        
        mov al, RESET_CHARACTER
        mov byte [framebuffer + r12], al
        inc r12

        jmp .loop

    .end:
        pop r12
        ret

drawFramebuffer:
    push r12
    push r13

    xor r12, r12
    xor r13, r13

    .loopY:
        cmp r12, height
        je .end

        jmp .loopX

    .loopX:
        cmp r13, width
        je .reset

        mov r10, r12
        imul r10, r10, width
        add r10, r13
    
        lea rsi, [framebuffer + r10]
        call printChar
        
        sub rsp, 8
        mov [rsp], SPACE

        mov rsi, rsp
        call printChar

        add rsp, 8

        inc r13
        jmp .loopX
    
    .reset:
        xor r13, r13
        inc r12
        
        sub rsp, 8
        mov [rsp], NEW_LINE

        mov rsi, rsp
        call printChar

        add rsp, 8

        jmp .loopY

    .end:
        pop r12
        pop r13
        ret

setPixelFramebuffer:
    imul rdi, rdi, width
    add rdi, rsi
    
    mov [framebuffer + rdi], al
    ret
