;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; strpbrk
;;

section .text
    global strpbrk

strpbrk:
    push rbp
    mov rbp, rsp
    mov rax, rdi

outer_loop:
    cmp byte [rax], 0
    je not_found
    mov rcx, rsi

inner_loop:
    cmp byte [rcx], 0
    je next_char
    mov dl, byte [rcx]
    cmp byte [rax], dl
    je end
    inc rcx
    jmp inner_loop

next_char:
    inc rax
    jmp outer_loop

not_found:
    xor rax, rax

end:
    mov rbp, rsp
    pop rbp
    ret
