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

; The following function is identical to strrchr
rindex:
    jmp strrchr    ; Direct jump to strchr implementation
