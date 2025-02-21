;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
;; File description:
;; ffs
;;

section .text
    global ffs

ffs:
    ; Prologue
    push rbp
    mov rbp, rsp
    push rcx            ; Save the rcx register since we modify it

    mov eax, edi        ; Get the input value (32-bit because int)
    test eax, eax       ; Check if value is 0
    jz zero_case        ; If zero, return 0

    xor ecx, ecx        ; Initialize counter
    inc ecx             ; Start counting from 1 because ffs counts from 1

find_bit:
    test eax, 1         ; Test least significant bit
    jnz found           ; If bit is 1, we found it
    shr eax, 1          ; Shift right to check next bit
    inc ecx             ; Increment position counter
    jmp find_bit

found:
    mov eax, ecx        ; Return position of first set bit
    jmp end

zero_case:
    xor eax, eax        ; Return 0 for input 0

end:
    ; Epilogue
    pop rcx
    mov rsp, rbp
    pop rbp
    ret

