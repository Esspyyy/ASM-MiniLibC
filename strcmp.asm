;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; strcmp
;;

BITS 64

section .text
    global strcmp

strcmp:
    ; Prologue
    push rbp            ; Save frame pointer
    mov rbp, rsp
    push rcx           ; Save rcx since we modify it

compare_loop:
    ; Load char from both strings
    mov al, byte [rdi]
    mov cl, byte [rsi]


    ; Jump to not_equal if characters are different
    cmp al, cl
    jne not_equal

    ; Check for end of string and leave loop if so
    cmp al, 0
    je equal

    ; Move to next chars and reloop
    inc rdi
    inc rsi
    jmp compare_loop

not_equal:
    movzx rax, al         ; Zero-extend chars for comparison
    movzx rcx, cl
    sub rax, rcx          ; Calculate difference
    jmp end

equal:
    xor rax, rax          ; Return 0 for equal strings

end:
    ; Epilogue
    pop rcx
    mov rsp, rbp
    pop rbp
    ret
