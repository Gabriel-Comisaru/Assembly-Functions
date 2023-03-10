%include "../include/io.mac"
section .data
    save dd 0
    null dd 0
    ok dd 0
section .text
    global beaufort
    extern printf

; void beaufort(int len_plain, char *plain, int len_key, char *key, char tabula_recta[26][26], char *enc) ;
beaufort:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; len_plain
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; len_key
    mov edx, [ebp + 20] ; key (address of first element in matrix)
    mov edi, [ebp + 24] ; tabula_recta
    mov esi, [ebp + 28] ; enc
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE
    xor esi, esi
    xor ecx, ecx
    push ecx
    push esi
    mov dword [save], 0 ; variabila in care voi salva index-ul conform caruia voi lua literele din key
next:
    mov ebx, [ebp + 12]
    mov edx, [ebp + 20]
    xor eax, eax
    xor esi, esi
    pop esi ; revendic index-ul pentru parcurgerea plain-ului
    mov ecx, [ebp + 8] 
    mov al, byte [ebx + esi] ; salvez litera din plain
    ;PRINTF32 `lit_plain = %c\n\x0`, eax
    cmp esi, ecx
    jge end

    xor ebx, ebx
    mov ebx, [ebp + 16]
    dec ebx
    xor ecx, ecx
    mov ecx, dword [save]
    cmp ecx, ebx
    jg reset_save
    jmp continue
reset_save:
    mov dword [save], 0
    ;PRINTF32 `RSAVE= %d\n\x0`, [save]
continue:
    xor ecx, ecx
    xor ebx, ebx
    mov ebx, dword [save]
    xor edx, edx
    mov edx, [ebp + 20]
    mov cl, byte [edx + ebx] ; litera din key
    inc esi
    push esi ; salvez indexul pe stiva
    ;PRINTF32 `SAVE= %d\n\x0`, [save]
    ;PRINTF32 `KEY= %c\n\x0`, ecx
    cmp ecx, eax
    xor ebx, ebx
    xor esi, esi
    xor edx, edx
again:
    mov dl, byte [edi + esi]
    inc esi
    cmp al, dl
    jne again
    xor eax, eax
    xor edx, edx
    add eax, esi
    dec eax
    ;PRINTF32 `indx_plain = %d\n\x0`, eax
    xor esi, esi
again_2:
    inc esi
    mov dl, byte [edi + eax]
    add eax, 26
    cmp dl, cl
    jne again_2
ceva:
    dec esi
    ;PRINTF32 `indx_cript= %d\n\x0`, esi
    xor eax, eax
    mov eax, esi
    mov esi, [ebp + 28]
    mov dl, byte [edi + eax]
    ;add edx, eax
    pop ebx
    dec ebx
    ;PRINTF32 `!AFISARE!= %c\n\x0`, edx
    mov byte [esi + ebx], dl
    mov eax, [ebp + 8]
    xor ecx, ecx
    mov ecx, ebx
    inc ebx
    push ebx
    dec eax
    cmp ecx, eax
    jge end
    add dword [save], 1
    xor esi, esi
    xor ebx, ebx
    xor eax, eax
    jmp next
end:
    xor esi, esi
    pop esi
    pop esi
    mov eax, [ebp + 8]
    mov ebx, [ebp + 12]
    mov ecx, [ebp + 16]
    mov edx, [ebp + 20]
    mov edi, [ebp + 24]
    mov esi, [ebp + 28]
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
