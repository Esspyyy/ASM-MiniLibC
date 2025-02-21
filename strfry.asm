;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; strfry
;;

section .text
    global strfry
    extern strlen
    extern time
    extern srand
    extern rand

strfry:
    ; Prologue
    push rbp
    mov rbp, rsp

    ; Save callee saved registers pq ca marche pas wsh
    push rbx
    push r12
    push r13

    mov r12, rdi ; Save string pointer

    ; Get string length
    call strlen wrt ..plt
    mov r13, rax ; Save length
    test r13, r13 ; Check if string empty
    jz end ; If so, return

    ; Set random seed
    xor rdi, rdi ; Set rdi to NULL to pass as argument to time()
    call time wrt ..plt
    mov rdi, rax ; Retrieve time result
    call srand wrt ..plt

swapping_loop:
    ; Fisher-Yates (Knuth) shuffle algorithm ;)
    dec r13
    jz end

    ; Do a modulo operation
    call rand wrt ..plt ; Get a random number
    xor rdx, rdx ; Clear rdx since div uses rdx:rax and we only want rax
    div r13 ; Quotient goes to rax, remainder to rdx (so: rdx = rand() % current_position)

    ; Swap characters
    mov byte al, [r12 + r13] ; Load current char into al
    mov byte bl, [r12 + rdx] ; Load random char into bl
    mov byte [r12 + rdx], al ; Swap
    mov byte [r12 + r13], bl

    jmp swapping_loop

end:
    ; Epilogue
    mov rax, r12 ; Load string pointer back into rax
    pop r13
    pop r12
    pop rbx
    mov rsp, rbp
    pop rbp
    ret

