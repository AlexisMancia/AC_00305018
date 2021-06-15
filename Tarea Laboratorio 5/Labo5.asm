org 100h

    section .data

    cadena DB 'Alexis Ernesto Mancia Dominguez'

    section .text
    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX

    MOV SI, 0
    MOV DI, 0d

    MOV DH, 10 
    MOV DL, 20 

    call textmode

    ITERAR:
        call movecursor
        MOV CL, [cadena+SI]
        CMP CL, 20h
        JE NEXTLINE
        call writechar
        INC SI
        INC DL
        INC DI 
        CMP DI, 31d 
        JB ITERAR 
        jmp waitkey

    textmode: 
        MOV AH, 0h 
        MOV AL, 03h 
        INT 10h
        RET

    movecursor:
        MOV AH, 02h 
        MOV BH, 0h 
        INT 10h
        RET

    writechar:
        MOV AH, 0Ah 
        MOV AL, CL 
        MOV BH, 0h 
        MOV CX, 1h 
        INT 10h
        RET

    waitkey:
        MOV AH, 00h 
        INT 16h

    exit:
        int 20h

    NEXTLINE:
    add DH, 2
    INC SI 
    MOV DL, 20 
    INC DI 
    jmp ITERAR

   