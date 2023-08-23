; demo bitwise operations

option casemap:none

nl = 10; ASCII code for newline

    .data
leftOp dword 0f0f0f0fh
rightOp1 dword 0f0f0f0f0h
rightOp2 dword 12345678h

strTitle byte "Listing bitwise.asm",nl,0

fmtStrAnd byte "%lx AND %lx = %lx",nl,0
fmtStrOr byte "%lx OR %lx = %lx",nl,0
fmtStrXor byte "%lx XOR %lx = %lx",nl,0
fmtStrNot byte "NOT %lx = %lx",nl,0

    .code
    externdef printf:proc

    public getTitle
getTitle proc
    lea rax, strTitle
    ret
getTitle endp

    public asmMain
asmMain proc


    sub rsp, 56
; run printf 4 times for diff operations

    lea rcx, fmtStrAnd
    mov edx, leftOp
    mov r8d, rightOp1
    mov r9d, r8d
    and r9d, edx
    call printf

; compute right op2 and leftop

    lea rcx, fmtStrAnd
    mov edx, leftOp
    mov r8d, rightOp2 ; due to format of printf need to print out rightop2 too , so need to store it to compute it again in r9d
    mov r9d, edx
    and r9d, r8d
    call printf

    lea rcx, fmtStrOr
    mov edx, leftOp
    mov r8d, rightOp1
    mov r9d, edx
    or r9d, r8d
    call printf

    lea rcx, fmtStrOr
    mov edx, leftOp
    mov r8d, rightOp2
    mov r9d, edx
    or r9d, r8d
    call printf

    lea rcx, fmtStrXor
    mov edx, leftOp
    mov r8d, rightOp1
    mov r9d, edx
    xor r9d, r8d
    call printf

    lea rcx, fmtStrXor
    mov edx, leftOp
    mov r8d, rightOp2
    mov r9d, edx
    xor r9d, r8d
    call printf

    lea rcx, fmtStrNot
    mov edx, leftOp
    mov r8d, edx
    not r8d
    call printf

    lea rcx, fmtStrNot
    mov edx, rightOp1
    mov r8d, edx
    not r8d
    call printf

    add rsp, 56

    ret ; return to caller

asmMain endp

    end









