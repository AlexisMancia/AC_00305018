    org 100h

        section .text
        
        mov BP,numeroList
        call parImpar

        int 20h
        
        section .data
numeroList db 10,09,08,07,06,05,04,03,02,01,0xA

parImpar:
    xor SI,SI

while:
    mov AL,[BP+SI]
    mov dl, al
    
    cmp AL,0xA
    je end

    mov bl,01h
    and AL,bl
    
    cmp AL,01h  
    jnz numeroPar
    
    mov [0320H+SI],dl
    
    inc SI
    jmp while

numeroPar:
    mov [0300H+SI],dl

    inc SI
    jmp while

end:
ret 
