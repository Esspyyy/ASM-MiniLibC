;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; strcspn
;;

BITS 64

section .text
    global strcspn

strcspn:
    ; Prologue
    push rbp
    mov rbp, rsp
    push rcx           ; Save rcx since we modify it
    push rdx           ; Save rdx since we modify it (dl)
    xor rax, rax       ; Initialize counter to 0

outer_loop:
    cmp byte [rdi + rax], 0    ; Check end of string1
    je end
    mov rcx, rsi              ; Reset rcx to start of string2

inner_loop:
    cmp byte [rcx], 0         ; Check end of string2
    je next_char
    mov dl, byte [rcx]        ; Load character from string2
    cmp byte [rdi + rax], dl  ; Compare with current char of string1
    je end
    inc rcx
    jmp inner_loop

next_char:
    inc rax
    jmp outer_loop

end:
    ; Epilogue
    pop rdx
    pop rcx
    mov rsp, rbp
    pop rbp
    ret
