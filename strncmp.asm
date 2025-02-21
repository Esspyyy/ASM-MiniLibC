;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; strncmp
;;

section .text
    global strncmp

strncmp:
    ; Prologue
    push rbp
    mov rbp, rsp
    push rcx        ; Save rcx since we'll modify it

    ; if n == 0, return 0
    test rdx, rdx
    jz return_zero

loop:
    ; if n == 0, strings are equal up to n
    test rdx, rdx
    jz return_zero

    ; compare current characters
    movzx rax, byte [rdi]
    movzx rcx, byte [rsi]

    ; if characters differ, return difference
    cmp al, cl
    jne return_diff

    ; if we hit a null terminator, strings are equal
    test al, al
    jz return_zero

    ; move to next character
    inc rdi
    inc rsi
    dec rdx
    jmp loop

return_diff:
    sub rax, rcx
    jmp end

return_zero:
    xor rax, rax

end:
    ; Epilogue
    pop rcx         ; Restore rcx
    mov rsp, rbp
    pop rbp
    ret
