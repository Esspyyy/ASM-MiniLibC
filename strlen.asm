;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; strlen
;;

section .text
    global strlen

strlen:
    ; Prologue
    push rbp            ; Save frame pointer
    mov rbp, rsp       ; Create new frame

    xor rax, rax       ; Initialize counter to 0

count_loop:
    cmp byte [rdi + rax], 0     ; Check for null terminator
    je done                     ; Jump if end of string
    inc rax                     ; Increment counter
    jmp count_loop              ; Continue counting

done:
    ; Epilogue
    mov rsp, rbp       ; Restore stack pointer
    pop rbp            ; Restore frame pointer
    ret
