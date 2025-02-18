;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; strcspn
;;

section .text
    global strcspn

strcspn:
    push rbp
    mov rbp, rsp
    xor rax, rax

outer_loop:
    cmp byte [rdi + rax], 0
    je end
    mov rcx, rsi

inner_loop:
    cmp byte [rcx], 0
    je next_char
    mov dl, byte [rcx]
    cmp byte [rdi + rax], dl
    je end
    inc rcx
    jmp inner_loop

next_char:
    inc rax
    jmp outer_loop

end:
    mov rsp, rbp
    pop rbp
    ret
