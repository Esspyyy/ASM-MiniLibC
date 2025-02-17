;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; strlen
;;

section .text
    global strlen

strlen:
    push rbp,
    mov rbp, rsp
    xor rax, rax

count_loop:
    cmp byte [rdi + rax], 0
    je done
    inc rax
    jmp count_loop

done:
    mov rsp, rbp
    pop rbp
    ret
