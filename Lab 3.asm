bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ... problema 7
    a dw 0111011101010111b ; a = 0111 0111 0101 0111b
    b dw 1001101110111110b ; b = 1001 1011 1011 1110b
    c dd 0;
    
; our code starts here
segment code use32 class=code
    start:
        ; ... felixcloutier.com/x86
        ;mov al, byte[c];    al=0000 1111 al=15
        ;not al;             al=1111 0000 al=240
        ;and al, 00000111b;  al=0000 0000 al=0
        ;mov bl, 0;          
        ;or byte[d], al;          bl=0000 0000
        ;or byte[d], 00011000b;   bl=0001 1000 bl=24
        ;mov cl, 0;
        ;mov cl, byte[c];
        ;shl cl, 3;          al=0111 1000 al=120
        ;and cl, 11100000b;  al=0110 0000 al=96
        ;or byte[d], cl;          bl=0111 1000 bl=120
        ;mov bl, byte[d];
        ;exercitiu de practica
        
        
        
        or dword[c],00000000000000000000000000011111b;
        mov eax, 0
        mov ax, word[a];
        ;cwde;               eax=a
        and eax,00000000000000000000000001111111b;
        shl eax, 5;
        or dword[c],       eax;
        or dword[c],00000000011001010000000000000000b;
        mov ax, 0;
        mov eax, 0;
        mov ax, word[b];
        cwde;
        and eax,00000000000000000000111100000000b;
        shl eax, 4;
        or dword[c], eax;
        mov ebx, dword[c];ebx=6667007
        
        
        
        
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
