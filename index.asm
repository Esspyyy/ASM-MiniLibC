;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; index
;;

section .text
    global index
    extern strchr

; The following code is identical to strchr
index:
    jmp strchr    ; Direct jump to strchr implementation
