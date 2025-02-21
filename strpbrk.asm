;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; strpbrk
;;

BITS 64

section .text
    global strpbrk

strpbrk:
    ; Prologue
    push rbp
    mov rbp, rsp
    push rcx           ; Save rcx since we modify it
    push rdx           ; Save rdx since we modify it (rdx)

    mov rax, rdi       ; Store first string pointer in return register

outer_loop:
    cmp byte [rax], 0  ; Check end of string1
    je not_found
    mov rcx, rsi       ; Reset to start of second string

inner_loop:
    cmp byte [rcx], 0  ; Check end of string2
    je next_char
    mov dl, byte [rcx] ; Load character from string2
    cmp byte [rax], dl ; Compare with current char of string1
    je end
    inc rcx
    jmp inner_loop

next_char:
    inc rax
    jmp outer_loop

not_found:
    xor rax, rax       ; Return NULL if not found

end:
    ; Epilogue
    pop rdx
    pop rcx
    mov rsp, rbp
    pop rbp
    ret
