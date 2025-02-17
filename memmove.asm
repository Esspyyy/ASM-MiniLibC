;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; memmove
;;

section .text
    global memmove

memmove:
    push rbp
    mov rbp, rsp
    mov rax, rdi
    cmp rdx, 0
    je end

    cmp rdi, rsi
    jae check_overlap

forward_copy:
    mov cl, byte [rsi]
    mov byte [rdi], cl
    inc rsi
    inc rdi
    dec rdx
    jnz forward_copy
    jmp end

check_overlap:
    mov r8, rsi
    add r8, rdx
    cmp rdi, r8
    jae forward_copy

backward_copy:
    add rdi, rdx
    add rsi, rdx
    dec rdi
    dec rsi

backward_loop:
    mov cl, byte [rsi]
    mov byte [rdi], cl
    dec rsi
    dec rdi
    dec rdx
    jnz backward_loop

end:
    mov rsp, rbp
    pop rbp
    ret
