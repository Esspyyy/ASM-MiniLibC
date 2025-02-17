;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; strrchr
;;

section .text
    global strrchr

strrchr:
    push rbp
    mov rbp, rsp
    xor rax, rax

loop_start:
    cmp byte [rdi], 0
    je check_null
    cmp byte [rdi], sil
    jne next_char
    mov rax, rdi

next_char:
    inc rdi
    jmp loop_start

check_null:
    cmp byte [rdi], sil
    jne end
    mov rax, rdi

end:
    pop rbp
    ret
