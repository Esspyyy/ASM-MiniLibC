;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; index
;;

section .text
    global index

; The following code is identical to strchr
index:
    ; Prologue
    push rbp            ; Save frame pointer
    mov rbp, rsp       ; Create new frame

loop_start:
    cmp byte [rdi], sil    ; Compare current char with target
    je found               ; Jump if found
    cmp byte [rdi], 0      ; Check for string end
    je not_found           ; Jump if end reached
    inc rdi                ; Move to next character
    jmp loop_start

found:
    mov rax, rdi           ; Return pointer to found character
    jmp end

not_found:
    xor rax, rax           ; Return NULL

end:
    ; Epilogue
    mov rsp, rbp          ; Restore stack pointer
    pop rbp               ; Restore frame pointer
    ret
