;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; index
;;

BITS 64

section .text
    global index
    extern strchr

index:
    push rbp
    mov rbp, rsp
    call strchr wrt ..plt  ; Call strchr through PLT for PIC
    mov rsp, rbp
    pop rbp
    ret
