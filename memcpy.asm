;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; memcpy
;;

section .text
    global memcpy

memcpy:
    ; Prologue: Save the base pointer and the rcx register
    push rbp
    mov rbp, rsp
    push rcx            ; Save rcx

    ; Set rax to the destination pointer (rdi)
    mov rax, rdi

    ; If the length (rdx) is 0, jump to the end
    cmp rdx, 0
    je end

copy_loop:
    ; Copy byte from source (rsi) to destination (rdi)
    mov cl, byte [rsi]
    mov byte [rdi], cl

    ; Increment source and destination pointers
    inc rsi
    inc rdi

    ; Decrement the length counter
    dec rdx

    ; If length counter is not zero, repeat the loop
    jnz copy_loop

end:
    ; Epilogue
    pop rcx         ; Restore rcx
    mov rsp, rbp
    pop rbp
    ret
