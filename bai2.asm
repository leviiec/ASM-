section .data
    msg db "Nhap chuoi: ", 0
    msg2 db "Chuoi in hoa la: ", 0
    buffer db 100
section .text
    global _start

_start:

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 12
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 100
    int 0x80

    xor esi, esi
    mov edx, 100
lower:
    mov al, [buffer + esi]
    cmp al, 0
    je done
    cmp al, 'a'
    jl skip
    cmp al, 'z'
    jg skip
    sub al, 32
    mov [buffer + esi], al
    skip:
        inc esi
        jmp lower
done:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, 18
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80