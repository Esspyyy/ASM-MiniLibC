;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; syscall
;;

BITS 64

section .text
    global syscall
    extern __errno_location   ; Add reference to __errno_location function

syscall:
    ; Prelude
    push rbp
    mov rbp, rsp
    ; Push registers on the stack to avoid syscall overwriting them
    push r11
    push rcx


    ; Move arguments to proper registers for syscall
    mov rax, rdi
    mov rdi, rsi
    mov rsi, rdx
    mov rdx, rcx
    mov r10, r8
    mov r8, r9
    ; Sixth argument and up are already on stack if needed

    syscall                 ; Execute system call

    ; Check for error (negative return value)
    cmp rax, 0
    jge end                 ; If no error, return value

    neg rax                 ; Get positive error code
    mov rcx, rax            ; Save error code in rcx
    call __errno_location wrt ..plt   ; Get pointer to errno by calling c function
    mov [rax], ecx          ; Set errno (int so 32bits)
    mov rax, -1             ; Return -1

end:
    ; Epilogue
    pop rcx
    pop r11
    mov rsp, rbp
    pop rbp
    ret

