;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; strstr
;;

section .text
    global strstr

strstr:
    push rbp
    mov rbp, rsp
    mov r8, rdi
    cmp byte [rsi], 0
    je empty_needle

outer_loop:
    mov rdi, r8
    mov rcx, rsi
    cmp byte [rdi], 0
    je not_found

inner_loop:
    mov al, byte [rcx]
    cmp al, 0
    je found
    mov dl, byte [rdi]
    cmp dl, 0
    je not_found
    cmp al, dl
    jne next_char
    inc rdi
    inc rcx
    jmp inner_loop

next_char:
    inc r8
    jmp outer_loop

empty_needle:
    mov rax, r8
    jmp end

found:
    mov rax, r8
    jmp end

not_found:
    xor rax, rax

end:
    mov rsp, rbp
    pop rbp
    ret
