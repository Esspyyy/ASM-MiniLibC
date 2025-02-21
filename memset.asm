;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; memset
;;

section .text
    global memset

memset:
    ; Prologue
    push rbp
    mov rbp, rsp

    ; Initialize rax with the destination address
    mov rax, rdi

    ; Check if the length is zero
    cmp rdx, 0
    je end

fill_loop:
    ; Fill the memory with the specified value
    mov byte [rax], sil
    inc rax
    dec rdx
    jnz fill_loop

end:
    ; Epilogue
    mov rsp, rbp
    pop rbp

    ; Return
    mov rax, rdi
    ret
