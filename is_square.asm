%include "../include/io.mac"

section .text
    global is_square
    extern printf

is_square:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; dist
    mov eax, [ebp + 12]     ; nr
    mov ecx, [ebp + 16]     ; sq
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    xor esi, esi
loop:
    xor edx, edx
    xor edi, edi
    xor ecx, ecx
    mov edx, [ebx + esi*4]
    ;;PRINTF32 `dest %d\n\x0`, edx
    cmp edx, 0
    je square
    cmp edx, 1
    je square
    add ecx, 2
    add edi, 2
mul:
    imul edi, ecx
    ;;PRINTF32 `edi %d\n\x0`, edi
    cmp edi, edx
    jg not_square
    cmp edi, edx
    je square
    mov edi, ecx
    inc edi
    inc ecx
    jmp mul
square:
    mov ecx, [ebp + 16]
    mov dword [ecx + esi*4], 1
    jmp next
not_square:
    mov ecx, [ebp + 16]
    mov dword [ecx + esi*4], 0
    jmp next
next:
    inc esi
    cmp esi, eax
    jge end
    jmp loop
end: 
    mov ecx, [ebp + 16]

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
