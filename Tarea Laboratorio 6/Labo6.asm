org     100h

section    .data

    txt1    db    "Login: ", "$"
    txt2     db     "BIENVENIDO", "$"
    txt3     db     "INCORRECTO", "$"
    password    db     "abcde", "$"
    passw     times     10      db    " "

section    .text
    mov     DX, txt1
    call    Digitar
    mov     BP, passw
    call    readInput
    call    compare
    call    await
    int     20h

loop2:
    cmp     DI,5d
    je      end
    mov     BL,[password+DI]
    cmp     BL,[BP+DI]
    jne     INCORRECTO
    inc     DI
    jmp     loop2

compare:
    xor     DI,DI
    call    loop2

end:
    mov     DX, txt2
    call    Digitar
    call    await
    int     20h

INCORRECTO:
    mov     DX, txt3
    call    Digitar
    call    await
    int     20h

await:
    mov     AH, 01h
    int     21h
    ret

readInput:
    xor     SI, SI

loop1:
    call    await
    cmp     AL, 0x0D
    je      exit
    mov     [BP+SI], AL
    inc     SI
    jmp     loop1

exit:
    mov     byte [BP+SI], "$"
    ret

Digitar:
    mov     AH, 09h
    int     21h
    ret