;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; memfrob
;;

BITS 64

section .text
    global memfrob

memfrob:
    ; Prologue
    push rbp
    mov rbp, rsp

    mov rax, rdi        ; Save original pointer for return value
    test rsi, rsi       ; Check if length is 0
    jz end

frob_loop:
    xor byte [rdi], 42  ; XOR current byte with 42 (0x2A)
    inc rdi             ; Move to next byte
    dec rsi             ; Decrease counter
    jnz frob_loop       ; Continue if not zero

end:
    ; Epilogue
    mov rsp, rbp
    pop rbp
    ret
