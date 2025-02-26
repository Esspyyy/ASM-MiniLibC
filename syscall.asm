;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; syscall
;;

BITS 64

section .text
    global syscall

syscall:
    ; Prelude
    push rbp
    mov rbp, rsp

    ; Save registers that need to be preserved
    push r11
    push rcx

    ; Move arguments to appropriate registers for syscall
    mov rax, rdi        ; System call number
    mov rdi, rsi        ; 1st argument
    mov rsi, rdx        ; 2nd argument
    mov rdx, rcx        ; 3rd argument
    mov r10, r8         ; 4th argument
    mov r8, r9          ; 5th argument
    mov r9, [rsp + 8]
    ; Sixth argument is already on the stack if needed

    ; Execute system call
    syscall

    ; Restore preserved registers
    pop rcx
    pop r11

    ; Epilogue
    mov rsp, rbp
    pop rbp
    ret
