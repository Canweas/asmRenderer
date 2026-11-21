printString:
    mov rax, 1
    mov rdi, 1
    syscall

    ret

printChar:
    mov rax, 1
    mov rdi, 1
    mov rdx, 1
    syscall
    
    ret

read:
    mov rax, 0
    mov rdi, 0
    syscall

    ret

exit:
    mov rax, 60
    xor rdi, rdi
    syscall
