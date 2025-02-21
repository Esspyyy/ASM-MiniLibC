;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; strstr
;;

section .text
    global strstr

strstr:
    ; Prologue
    push rbp
    mov rbp, rsp
    push rcx           ; Push used registers onto the stack
    push rdx
    push r8

    mov r8, rdi        ; Save original string pointer into r8
    cmp byte [rsi], 0  ; Check if needle is empty
    je empty_needle

outer_loop:
    mov rdi, r8        ; Reset search position
    mov rcx, rsi       ; Reset needle pointer
    cmp byte [rdi], 0  ; Check if we reached end of haystack
    je not_found

inner_loop:
    mov al, byte [rcx] ; Load char from needle
    cmp al, 0          ; Check if end of needle
    je found
    mov dl, byte [rdi] ; Load char from haystack
    cmp dl, 0          ; Check if end of haystack
    je not_found
    cmp al, dl         ; Compare characters
    jne next_char
    inc rdi            ; Move to next char
    inc rcx
    jmp inner_loop

next_char:
    inc r8             ; Move to next potential match position
    jmp outer_loop

empty_needle:
    mov rax, r8        ; Return original string if needle is empty
    jmp end

found:
    mov rax, r8        ; Return pointer to match
    jmp end

not_found:
    xor rax, rax       ; Return NULL if not found

end:
    ; Epilogue
    pop r8             ; Restore registers in reverse order
    pop rdx
    pop rcx
    mov rsp, rbp
    pop rbp
    ret
