;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; strrchr
;;

BITS 64

section .text
    global strrchr

strrchr:
    ; Prologue
    push rbp
    mov rbp, rsp

    xor rax, rax       ; Initialize return value to NULL

loop_start:
    cmp byte [rdi], 0      ; Check for end of string
    je check_null          ; If null terminator, check if we're looking for null
    cmp byte [rdi], sil    ; Compare current char with target
    jne next_char          ; If no match, continue
    mov rax, rdi           ; If match, save current position

next_char:
    inc rdi                ; Move to next character
    jmp loop_start

check_null:
    cmp byte [rdi], sil    ; Check if we're looking for null terminator
    jne end                ; If not, we're done
    mov rax, rdi           ; If yes, save position of null terminator

end:
    ; Epilogue
    mov rsp, rbp
    pop rbp
    ret
