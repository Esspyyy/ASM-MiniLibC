;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; memcpy
;;

section .text

memcpy:
    push rbp
    mov rbp, rsp
    mov rax, rdi
    cmp rdx, 0
    je end

copy_loop:
    mov cl, byte [rsi]
    mov byte [rdi], cl
    inc rsi
    inc rdi
    dec rdx
    jnz copy_loop

end:
    pop rbp
    ret
