section .data
    msg db 'nhap vao chuoi :',0
    len equ $-msg
    output db 'do dai chuoi :',0
    len1 equ $-output
section .bss
    input resb 256
section .text
    global _start
_start:

    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,len
    int 0x80

    mov eax,3
    mov ebx,0
    mov ecx,input
    mov edx,256
    int 0x80

loop_start:
    cmp byte[eax+ecx],0
    je loop_end
    inc eax
    jmp loop_start
loop_end:
    mov eax,4
    mov ebx,1
    mov ecx,output
    mov edx,len1
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80