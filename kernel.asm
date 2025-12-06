; LAOS kernel v0
; Loaded at 0x1000:0000 by bootloader

bits 16
org 0x0000

kernel_start:
    ; Reset the stack and all
    cli
    mov ax, 0x1000
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0xFFF0  ; Simple stack inside the segment
    sti

    call clear_scren

    ; Reset cursor and print text
    mov ah, 0x02
    mov bh, 0
    mov dh, 0
    mov dl, 0
    int 0x10

    mov si, msg_is_running
    call print_tty

    jmp $

;---------------------------
newline_tty:
    mov ah, 0x0E
    mov al, 0x0D
    int 0x10
    mov al, 0x0A
    int 0x10
    ret

read_key:
    mov ah, 0x00
    int 0x16
    ret

clear_scren:
    mov ax, 0x0003
    int 0x10
    ret

;---------------------------
print_tty:
    mov ah, 0x0E
.ploop:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .ploop
.done:
    ret

;---------------------------

msg_is_running db "LAOS kernel is now running, but there's nothing here yet! :)", 0

times 512 - ($ - $$) db 0