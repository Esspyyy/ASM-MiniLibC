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
    push rbp
    mov rbp, rsp
    call strrchr wrt ..plt  ; Call strchr through PLT for PIC
    mov rsp, rbp
    pop rbp
    ret
