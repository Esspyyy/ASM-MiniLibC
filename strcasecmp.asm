;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; strcasecmp
;;

section .text
    global strcasecmp

strcasecmp:
    ; Prologue
    push rbp            ; Save frame pointer
    mov rbp, rsp
    push rcx            ; Save rcx since we modify it

compare_loop:
    ; Load characters from strings
    mov al, byte [rdi]
    mov cl, byte [rsi]

    ; Convert first character to lowercase if it's uppercase
    cmp al, 'A'
    jb check_second_char    ; If not, got to next character
    cmp al, 'Z'
    ja check_second_char
    add al, 32

check_second_char:
    ; Convert second character to lowercase if it's uppercase
    cmp cl, 'A'
    jb compare_chars
    cmp cl, 'Z'
    ja compare_chars
    add cl, 32

compare_chars:
    ; Compare characters
    cmp al, cl
    jne not_equal
    cmp al, 0
    je equal
    inc rdi
    inc rsi
    jmp compare_loop

not_equal:
    ; Characters are not equal, calculate difference
    movzx rax, al
    movzx rcx, cl
    sub rax, rcx
    jmp end

equal:
    ; Characters are equal, return 0
    xor rax, rax

end:
    ; Epilogue
    pop rcx            ; Restore rcx
    mov rsp, rbp
    pop rbp
    ret
