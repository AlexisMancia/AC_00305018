        org     100h

        section .text

        mov     byte [200h], "A"
        mov     byte [201h], "E"
        mov     byte [202h], "M"
        mov     byte [203h], "D"

        mov     AX,     200h
        mov     CX,     [201h]
        mov     DX,     [202h+DI]
        mov     DI,     [DI+203h]

        int     20h