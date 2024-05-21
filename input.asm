section .data
    question db "What is your name? ",10
	lenq equ $ - question
	greet db "Hello, "
	leng equ $ - greet

section .bss
    name resb 16

section .text
    global _start

_start:
; impresion "What is your name?"
; SYS_WRITE
    mov rax, 1
    mov rdi, 1
    mov rsi, question
    mov rdx, lenq
    syscall

; SYS_READ
    mov rax, 0
    mov rdi, 0
    mov rsi, name
    mov rdx, 16
    syscall

; SYS_READ
	mov rax, 0
	mov rdi, 0
	mov rsi, name
	mov rdx, 16
	syscall

; SYS_WRITE
	mov rax, 1
	mov rdi, 1
	mov rsi, greet
	mov rdx, leng
	syscall

; SYS_WRITE
	mov rax, 1
	mov rdi, 1
	mov rsi, name
	mov rdx, 16
	syscall

; SYS_EXIT
	mov rax, 60
	mov rdi, 0
	syscall