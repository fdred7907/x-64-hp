; demo 2's compliment and neg statement

    option casemap:none

nl  =   10 ; newline ASCII
maxLen = 256 ; length of max number

    .data
titleStr byte "Listing 2'scompliment.asm", 0

prompt1 byte "Enter a number between 0 and 127 : ", 0
fmtStr1 byte "Value in hexadecimal %x",nl,0
fmtStr2 byte "Invert all the bits %x",nl,0
fmtStr3 byte "Add 1 (hexadecimal) %x",nl,0
fmtStr4 byte "Signed Converted Integer: %d",nl,0
fmtStr5 byte "Using neg instruction display: %d",nl,0

intValue sqword ?
input byte maxLen dup (?)

    .code
    externdef printf:proc
    externdef atoi:proc
    externdef readLine:proc

; Return program title

    public getTitle
getTitle proc
    lea rax, titleStr
    ret
getTitle endp

    public asmMain
asmMain proc

    sub rsp, 56

    lea rcx, prompt1
    call printf

    lea rcx, input
    mov rdx, maxLen
    call readLine

    lea rcx, input
    call atoi
    and rax, 0ffh
    mov intValue, rax


    ; print out the decimal value in hexa form

    lea rcx, fmtStr1
    mov rdx, rax
    call printf

    ; invert all bits

    lea rcx, fmtStr2
    mov rdx, intValue
    not dl ; only the lower 8-bits
    call printf

    ; invert all bits and add 1

    mov rdx, intValue
    not rdx
    add rdx, 1
    and rdx, 0ffh ; keep only the lower 8-bits

    lea rcx, fmtStr3
    call printf


    ; negate value and print signed integer in one go

    mov rdx, intValue
    not rdx
    add rdx, 1
    lea rcx, fmtStr4
    call printf ; no need to truncate as c++ auto leaves HO 32-bit



    ; negate the value using neg instruction

    lea rcx, fmtStr5
    mov rdx, intValue
    neg rdx
    call printf

    add rsp,56

    ret

asmMain endp

    end
    
