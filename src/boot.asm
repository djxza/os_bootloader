.code16

.extern __entry

.global _start

.text

_start:
    cli
    xor	%ax, %ax
    mov	%ax, %ds
    mov	$_msg, %si
    cld

_loop:

    lodsb
    or	%al, %al
    jz	_hang
    mov	$0x0E, %ah
    mov	$0x00, %bh
    int	$0x10
    jmp	_loop
    call __entry

_hang:
    jmp	_hang

_msg:
.string "HI!" 
.byte 0x0D, 0x0A, 0x00
.org 510
.byte 0x55
.byte 0xAA
