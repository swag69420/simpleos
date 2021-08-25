[BITS 16]

ORG 0x7C00

jmp START

PrintDesc: 
 pusha
 mov cx,
 mov dx, 
 divide:
    mov bx, 10
    div bx
    add cx, 1
    push dx,
    mov dx, 0
    cmp ax, 0
    jne divide
 print:
    pop dx
    sub cx, 1
    add dx, 30h
    mov si, sp
    mov [si], dl
    call print_bios
    cmp cx, 0
      jne print
 popa
ret

keyboard_handler:
    pusha
    mov si, keyMsg
    call print_bios

    in al, 0x60
    call print_keyCode
    mov al, 0x20
    out 0x20, al
    popa
iret

kernel_handler:
    pusha 
    push es
    xor ax, ax
    mov es, ax
    mov si, welcomeMsg
    call print_bios
    pop es
    popa
iret

print_keyCode:

ret

clear_scr:
