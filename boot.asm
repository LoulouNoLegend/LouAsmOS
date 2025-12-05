mov ah, 0x0e ; Enter tty mode

mov al, "O"
int 0x10
mov al, "S"
int 0x10
mov al, " "
int 0x10
mov al, "L"
int 0x10
mov al, "O"
int 0x10
mov al, "A"
int 0x10
mov al, "D"
int 0x10
mov al, "E"
int 0x10
mov al, "D"
int 0x10
mov al, "!"
int 0x10

jmp $ ; Infinite Loop


; Placing 510 zeros minus the size of the code above
; Then boot signature / magic number (16-bit / 2 bytes)
times 510 - ($-$$) db 0
dw 0xaa55