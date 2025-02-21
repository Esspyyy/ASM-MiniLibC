;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; memmove
;;

section .text
    global memmove

memmove:
    ; Prologue
    push rbp
    mov rbp, rsp
    push rcx                ; Save rcx
    push r8                 ; Save r8

    ; Initialize rax with destination address
    mov rax, rdi
    cmp rdx, 0              ; Check if length is zero
    je end

    ; Check if destination is after source
    cmp rdi, rsi
    jae check_overlap

forward_copy:
    ; Forward copy loop
    mov cl, byte [rsi]
    mov byte [rdi], cl
    inc rsi
    inc rdi
    dec rdx
    jnz forward_copy
    jmp end

check_overlap:
    ; Check for overlap
    mov r8, rsi
    add r8, rdx
    cmp rdi, r8
    jae forward_copy

backward_copy:
    ; Adjust pointers for backward copy if overlap
    add rdi, rdx
    add rsi, rdx
    dec rdi
    dec rsi

backward_loop:
    ; Backward copy loop
    mov cl, byte [rsi]
    mov byte [rdi], cl
    dec rsi
    dec rdi
    dec rdx
    jnz backward_loop

end:
    ; Epilogue
    pop r8          ; Restore r8 and rcx
    pop rcx
    mov rsp, rbp
    pop rbp
    ret
