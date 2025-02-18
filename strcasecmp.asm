;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; strcasecmp
;;

section .text
    global strcasecmp

strcasecmp:
    push rbp
    mov rbp, rsp

compare_loop:
    mov al, byte [rdi]
    mov cl, byte [rsi]

    cmp al, 'A'
    jb check_second_char
    cmp al, 'Z'
    ja check_second_char
    add al, 32

check_second_char:
    cmp cl, 'A'
    jb compare_chars
    cmp cl, 'Z'
    ja compare_chars
    add cl, 32

compare_chars:
    cmp al, cl
    jne not_equal
    cmp al, 0
    je equal
    inc rdi
    inc rsi
    jmp compare_loop

not_equal:
    movzx rax, al
    movzx rcx, cl
    sub rax, rcx
    jmp end

equal:
    xor rax, rax

end:
    mov rsp, rbp
    pop rbp
    ret

