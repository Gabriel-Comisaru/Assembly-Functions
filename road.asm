%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global road
    extern printf

road:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    xor esi, esi
    xor edx, edx
    xor ecx, ecx
distanta:
    xor ecx, ecx
    xor edx, edx
    xor ecx, ecx
    mov dx, word [eax + point_size*esi + point.x]
    ;;PRINTF32 `aici %d\x0`, edx
    cmp dx, 0
    je end
    inc esi
    mov cx, word [eax + point_size*esi + point.x]
    ;;PRINTF32 ` aici2 %d\n\x0`, ecx
    cmp cx, 0
    je end
    cmp dx, cx
    je calculy
    cmp cx, dx
    jg greater_x
    sub dx, cx
    mov cx, dx
    jmp loop
greater_x:
    sub cx, dx
    jmp loop
calculy:
    dec esi
    mov dx, word [eax + point_size*esi + point.y]
    inc esi
    mov cx, word [eax + point_size*esi + point.y]
    cmp cx, dx
    jg greater_y
    sub dx, cx
    mov cx, dx
    jmp loop
greater_y:
    sub cx, dx
loop:
    mov dx, cx
    mov ecx, [ebp + 12]
    dec esi
    ;;PRINTF32 `dest %d\n\x0`, edx
    mov [ebx + esi*4], edx
    ;;PRINTF32 `vect %d\n\x0`, [ebx]
    add esi, 2
    cmp esi, ecx
    jge end
    dec esi
    jmp distanta
end:
    mov ecx, [ebp + 12]

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
