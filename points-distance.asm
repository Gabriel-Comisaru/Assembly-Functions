%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .data
    pointArray: times point_size * 100 dw 2

section .text
    global points_distance
    extern printf
points_distance:
    ;; DO NOT MODIFY
    
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; points
    mov eax, [ebp + 12]     ; distance
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    xor edx, edx
    xor ecx, ecx
    xor esi, esi
distanta:
    mov dx, [ebx + point_size*esi + point.x]
    inc esi
    mov cx, [ebx + point_size*esi + point.x]
    cmp dx, cx
    je calculy
    sub cx,dx
    jmp end
calculy:
    dec esi
    mov dx, [ebx + point_size*esi + point.y]
    inc esi
    mov cx, [ebx + point_size*esi + point.y]
    sub cx, dx
end:
    mov [eax], cx
    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret

    ;; DO NOT MODIFY
