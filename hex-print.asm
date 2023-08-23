; convert decimal to hexadecimal and print

option casemap:none

nl = 10 ;  new line ASCII

    .data

i qword 1
j qword 123
k qword 456789

titleStr byte "Listing 2-1",0

fmtStri byte "i=%d converted to hex=%x",nl,0
fmtStrj byte "j=%d converted to hex=%x",nl,0
fmtStrk byte "k-%d converted to hex=%x",nl,0

    .code
    externdef printf:proc

    public getTitle 
getTitle proc

;Return title to C++ program
; RAX holds function result

lea rax, titleStr
ret

getTitle endp

    public asmMain
asmMain proc

    sub rsp, 56

    ; printf three times to display hex values
    lea rcx, fmtStri
    mov rdx,i
    mov r8,rdx
    call printf

    lea rcx,fmtStrj
    mov rdx,j
    mov r8,rdx
    call printf

    lea rcx,fmtStrk
    mov rdx,k
    mov r8,rdx
    call printf

    add rsp,56
    ret

asmMain endp
    end







