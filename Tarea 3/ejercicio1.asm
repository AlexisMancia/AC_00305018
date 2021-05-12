org 100h

section .text
    XOR AX, AX
    XOR BX, BX
    XOR DI, DI
    MOV byte[200h],0d
    MOV byte[201h],0d
    MOV byte[202h],3d
    MOV byte[203h],0d
    MOV byte[204h],5d
    MOV byte[205h],0d
    MOV byte[206h],1d
    MOV byte[207h],8d

    jmp suma

suma:
    cmp DI, 8d
    jmp prom
    ADC AL, [200h+DI]
    INC DI
    jmp suma

prom:
    MOV BL, 8d
    DIV BL
    MOV [20Ah], AL

exit:
    int 20h