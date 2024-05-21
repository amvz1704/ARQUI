section .data
    a dd 128
    cant dq 15 ;cantidad de iteraciones
    suma dq 0  ;suma

section .text
    global _start

_start:

    ; rax -> eax -> ax -> al
    ; rcx -> ecx -> cx -> ch
    ; 64  -> 32  -> 16 -> 8 bits

    mov rax, 100 ; rax <- 100
    mov rax, a   ; rax <- a
    mov rax, [a] ; rax <- el contenido de la direccion a
    mov [a], rax ; el valor de rax se escribe en el contenido de la 
    ; direccion a

    ; inc byte [rbx] califica el tamaño del operando
    ; byte  8
    ; word  16
    ; dword 32
    ; qword 64


    inc rax      ; rax <- rax + 1
    add rax, rbx ; rax <- rax + rbx
    dec rax      ; rax <- rax - 1
    sub rax, rbx ; rax <- rax - rbx

    neg rax      ; rax <- ! rax
    and rax, rbx ; rax <- rax && rbx
    or  rax, rbx ; rax <- rax || rbx
    xor rax, rbx ; rax <- rax xor rbx
    
    ;jmp loopStart ; saltar a la etiqueta loopStart
    ;jmp ifDone    ; saltar a la etiqueta ifDone
    ;jmp end       ; saltar a la etiqueta end

    ; instruccion cmp
    ; je  a == b
    ; jne a != b
    ; jg a > b
    ; jge a >= b
    ; jl a < b
    ; jz a == 0
    ; jnz a != 0

    ; si rax es menor o igual que rbx
    ; saltar a la etiqueta notNewMax
    ;cmp rax, rbx
    ;jle notNewMax
    
    mov rcx, qword [cant]
    mov rax, 1
sumLoop:
    add qword[suma], rax
    add rax, 2
    ;loop sumLoop "hace lo mismo" siempre con rcx
    dec rcx
    cmp rcx, 0
    jne sumLoop

    