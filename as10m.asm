 .model small 
        .stack 64 
        .data 
hexcode db '0123456789abcdef' 
msg db 'Total length of parameters (in Hex) is:' 
len db ?,?,0dh,0ah,'The parameters are: $' 
        .code 
hex_asc proc 
        mov dl,10h 
        mov ah,0 
        mov bx,0 
        div dl 
        mov bl,al 
        mov dh,hexcode[bx] 
        mov bl,ah 
        mov dl,hexcode[bx] 
        ret 
hex_asc endp 
main: 
        mov bx,80h 
        mov cl,[bx] 
        mov ax,@data 
        mov ds,ax 
        mov al,cl 
        call hex_asc 
        mov len,dh 
        mov len+1,dl 
        lea dx,msg 
        mov ah,09h 
        int 21h 
        mov ah,62h    
        int 21h 
        mov ds,bx 
        mov dx,81h    
        mov bx,dx    
        add bl,cl     
        mov byte ptr[bx],'$'   
        mov ah,09h 
        int 21h       
        mov ah,4ch   
        int 21h 
end main 