%include "../include/io.mac"

section .text
    global simple
    extern printf
section .data
    save db 0
    divider db 0
simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here
	
    xor eax, eax
shift:
    mov bl, byte [esi + eax]
    add bl, dl
    cmp bl, 90
    jg divide
continue:
    mov [edi + eax], bl
    inc eax
    cmp eax, ecx
    jb shift
    jmp end
divide:
    sub bl, 90
    add bl, 64
    jmp continue
end:
    
    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
