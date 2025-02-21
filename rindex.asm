;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; rindex
;;

BITS 64

section .text
    global rindex
    extern strrchr

rindex:
    ; Simply call strrchr
    push rbp
    mov rbp, rsp
    call strrchr wrt ..plt  ; Call strrchr through Procedure Linkage Table for Position Independant Code
    mov rsp, rbp
    pop rbp
    ret
