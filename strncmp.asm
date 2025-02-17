;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; strncmp
;;

section .text
    global strncmp

strncmp:
    push rbp
    mov rbp, rsp
    cmp rdx, 0
    je equal

compare_loop:
    mov al, byte [rdi]
    mov cl, byte [rsi]
    cmp al, cl
    jne not_equal
    inc rdi
    inc rsi
    dec rdx
    jnz compare_loop

equal:
    xor rax, rax
    jmp end

not_equal:
    movzx rax, al
    movzx rcx, cl
    sub rax, rcx

end:
    mov rsp, rbp
    pop rbp
    ret
