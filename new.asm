;ensamblar : nasm -f elf64 nombreArchivo.asm -o nombreArchivo.o
;enlazar   : ld nombreArchivo.o -o nombreArchivo
;ejecutar  : ./nombreArchivo


section .data ; datos iniciales globales declarados
    message db "Hello World", 10 ; etiqueta "message" a una direccion desconocida
    ;message db "Hello World", 10, 0 ; 10 = \n 0 = fin cadena
    len equ $ - message ; etiqueta final - "message"

    ; db 8  bits
    ; dw 16 bits
    ; dd 32 bits
    ; dq 64 bits

section .text
    global _start

section .bss ; se declaran datos sin valor inicial
    ; resb 8  bits
    ; resw 16 bits
    ; resd 32 bits
    ; resq 64 bits


section .text; se coloca instrucciones de codigo

;se usa formato decimal 'q' para octal '0x' hexadecimal

_start:

    mov rax, message ; rax apunta al principio de la cadena
    mov rbx, 0       ; contador
; nos desplazamos a lo largo de la cadena hasta encontrar un cero
; cuando rax vale cero dejamos de iterar
; en rbx se encuentra la longitud de la cadena
_countLoop:
	inc	rax
	inc	rbx
	mov	cl, [rax]
	cmp	cl, 0
	jne	_countLoop

; LLAMADA AL SISTEMA
; rax => ID <= 1 : sys_write
; rdi => Primer parametro   : output
; rsi => Segundo parametro  : direccion del mensaje
; rdx => Tercer parametro  : longitud del mensaje
    mov rax, 1  ; asignas rax 1 ID: sys_write
    mov rdi, 1  ; asignas rdi 1  
    mov rsi, message    ; asignas rsi message
    mov rdx, rbx
    ;mov rdx, len        ; asignas rdx len
    syscall             ; llamada de syscall

    mov rax, 60 ; asignas rax 60 ID: sys_exit         
    mov rdi, 0  ; 0 <= sin errores
    syscall
