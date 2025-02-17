;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; memset
;;

section .text
    global memset

memset:
    push rbp
    mov rbp, rsp
    mov rax, rdi
    cmp rdx, 0
    je end

fill_loop:
    mov byte [rax], sil
    inc rax
    dec rdx
    jnz fill_loop

end:
    mov rax, rdi
    pop rbp
    ret


