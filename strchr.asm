;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; strchr
;;


section .text
    global strchr

strchr:
    push rbp
    mov rbp, rsp

loop_start:
    cmp byte [rdi], sil
    je found
    cmp byte [rdi], 0
    je not_found
    inc rdi
    jmp loop_start

found:
    mov rax, rdi
    jmp end

not_found:
    xor rax, rax

end:
    mov rsp, rbp
    pop rbp
    ret
