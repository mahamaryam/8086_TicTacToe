.model small
.stack
.data
up db 10,13,"     |     |     $"
up2 db "     |     |     $" 
one db '1' 
two db '2'
three db '3'  
four db '4'
five db '5'
six db '6'
seven db '7'
eight db '8'
nine db '9'
boundary1 db "------------$"    
sign1 db ?
sign2 db ?     
boxroof db 10,13,"        x o x o x o x o x o$"
boxside db 10,13,"        x                 o$"
inbox db 10,13, "        o   Tic Tac Toe!  x$"
box2roof db 10,13,"      x o x o x o x o x o x o x o x o$"
box2s db 10,13,"      x                             o$"
 
msg1 db 10,13,10,13,"Enter your sign!(Player 1): $"
msg2 db 10,13,"Enter your sign!(Player 2): $" 
op1 db 10,13,"      o Enter 1 to Play Game        x$"
op2 db 10,13,"      x Enter 2 to view Score Board o$"
op3 db 10,13,"      o Enter 3 to Change Sign      x$"
op4 db 10,13,"      x Enter 4 to Quit Game        o$"  
term db 10,13,10,13,"Game Ended!$"
new1 db 10,13,"Player 1 or Player 2? $"
new2 db 10,13,"Enter new sign: $" 
changed db 10,13,"Sign Changed! $"
winrate1 db 0
winrate2 db 0
score db 10,13,"        x   SCOREBOARD    o$"
player1 db 10,13,"o Player1 x Player2 x $"
midpoint db 10,13,"        x        o        x$"     
s1 db 10,13,"        x    $"
s2 db "   x    $"   
s3 db "   o$"    
wrongi db "No such option exists!$"   
sure db "Are you sure to quit?$"
.code    

main proc
    
       mov ax,@data
       mov ds,ax
       mov dx,offset boxroof
       mov ah,9
       int 21h 
       mov dx,offset boxside
       mov ah,9
       int 21h
       mov dx,offset inbox
       mov ah,9
       int 21h
       mov dx,offset boxside
       mov ah,9
       int 21h
       mov dx,offset boxroof
       mov ah,9
       int 21h  
       mov dl,13
       mov ah,2
       int 21h
       mov dl,10
       mov ah,2
       int 21h
       resume:
       call menu  
       mov dl,13
       mov ah,2
       int 21h
       mov dl,10
       mov ah,2
       int 21h
       mov ah,1
       int 21h  
       cmp al,'1'
       je sg
       cmp al,'2'
       je sc
       cmp al,'3'
       je ns 
       cmp al,'4'
       je qg
       jmp wrong
       sc:
       call scoreboard 
       jmp resume
       ns:
       call newsign
       jmp resume 
       qg:
       call option4
       jmp resume 
       sg:
       call gameon
       jmp resume 
       mov ah,4ch
       int 21h
       wrong:
       mov dx,offset wrongi
       mov ah,9
       int 21h
       jmp resume
      
    main endp 

gameon proc
    
    
    ret
gameon endp    

scoreboard proc

        mov dx,offset boxroof
        mov ah,9
        int 21h   
        mov dx,offset boxside
        mov ah,9
        int 21h
        mov dx,offset score
        mov ah,9
        int 21h
        mov dx,offset boxside
        mov ah,9
        int 21h
        mov dx,offset boxroof
        mov ah,9
        int 21h
        mov dx,offset midpoint
        mov ah,9
        int 21h
        int 21h   
        mov dx,offset s1
        mov ah,9
        int 21h
        mov dx,offset winrate1
        mov dl,winrate1 
        add dl,48
        mov ah,2
        int 21h  
        mov dx,offset s2
        mov ah,9
        int 21h
        mov dx,offset winrate2
        mov dl,winrate2
        add dl,48
        mov ah,2
        int 21h 
        mov dx,offset s3
        mov ah,9
        int 21h
        mov dx,offset midpoint
        mov ah,9
        int 21h
        mov dx,offset boxroof 
        mov ah,9
        int 21h

     ret
     scoreboard endp



newsign proc
    
    mov dx,offset new1
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    cmp al,'1'
    je pl_one
    
    mov dx,offset new2
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    mov sign2,al
    jmp ok

    pl_one:
    mov dx,offset new2
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    mov sign1,al
    ok:
    mov dx,offset changed
    mov ah,9
    int 21h

    ret
newsign endp



option1 proc
    
    call ask_sign
    call board 
     
    ret
option1 endp    

option4 proc
    
    mov dx,offset sure
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    cmp al,'Y'
    je yes
    ret
    yes:
    mov dx,offset term
    mov ah,9
    int 21h
    mov ah,4ch
    int 21h
ret
option4 endp

menu proc
        
        mov dx,offset box2roof
        mov ah,9
        int 21h
        mov dx,offset box2s
        mov ah,9
        int 21h
        mov dx,offset op1
        mov ah,9
        int 21h
        mov dx,offset op2
        mov ah,9
        int 21h
        mov dx,offset op3
        mov ah,9
        int 21h
        mov dx,offset op4
        mov ah,9
        int 21h
        mov dx,offset box2s
        mov ah,9
        int 21h
        mov dx,offset box2roof
        mov ah,9
        int 21h
        
        ret
menu endp        
    
ask_sign proc
    
    mov dx,offset msg1
    mov ah,9
    int 21h
    mov dx,offset sign1
    mov ah,1
    int 21h
    mov sign1,al
    mov dx,offset msg2
    mov ah,9
    int 21h
    mov dx,offset sign2
    mov ah,1
    int 21h
    mov sign2,al
    
    ret
    ask_sign endp
    
board proc
    
       mov dl,13
       mov ah,2
       int 21h
       mov dl,10
       mov ah,2
       int 21h
       mov dx,offset up
       mov ah,9
       int 21h
       
       mov dl,13
       mov ah,2
       int 21h
       mov dl,10
       mov ah,2
       int 21h
       mov dl,32
       mov ah,2
       int 21h
       int 21h
       int 21h 
        
       mov dl,one
       mov ah,2
       int 21h 
       mov dl,32
       mov ah,2
       int 21h
       mov dl,'|'
       mov ah,2
       int 21h
       mov dl,32
       mov ah,2
       int 21h
       int 21h
       mov dl,two
       mov ah,2
       int 21h
       mov dl,32
       mov ah,2
       int 21h
       int 21h
       mov dl,'|'
       mov ah,2
       int 21h
       mov dl,32
       mov ah,2
       int 21h
       int 21h
       mov dl,three
       mov ah,2
       int 21h   
        mov dx,offset up
       mov ah,9
      
       int 21h
       mov dl,13
       mov ah,2
       int 21h
       mov dl,10
       mov ah,2
       int 21h
       mov dl,32
       mov ah,2
       int 21h
       int 21h
       int 21h    
       mov dx,offset boundary1
       mov ah,9
       int 21h   
       mov dl,13
       mov ah,2
       int 21h
       mov dl,10
       mov ah,2
       int 21h
       mov dx,offset up2
       mov ah,9
       int 21h  
       mov dl,13
       mov ah,2
       int 21h
       mov dl,10
       mov ah,2
       int 21h 
       mov dl,32
       mov ah,2
       int 21h
       int 21h
       int 21h 
       
       mov dl,four
       mov ah,2
       int 21h 
       mov dl,32
       mov ah,2
       int 21h
       mov dl,'|'
       mov ah,2
       int 21h
       mov dl,32
       mov ah,2
       int 21h
       int 21h
       mov dl,five
       mov ah,2
       int 21h
       mov dl,32
       mov ah,2
       int 21h
       int 21h
       mov dl,'|'
       mov ah,2
       int 21h
       mov dl,32
       mov ah,2
       int 21h
       int 21h
       mov dl,six
       mov ah,2
       int 21h   
        mov dx,offset up
       mov ah,9
      
       int 21h
       mov dl,13
       mov ah,2
       int 21h
       mov dl,10
       mov ah,2
       int 21h
       mov dl,32
       mov ah,2
       int 21h
       int 21h
       int 21h    
       mov dx,offset boundary1
       mov ah,9
       int 21h   
       mov dl,13
       mov ah,2
       int 21h
       mov dl,10
       mov ah,2
       int 21h 
        mov dx,offset up2
       mov ah,9
       int 21h 
       mov dl,13
       mov ah,2
       int 21h
       mov dl,10
       mov ah,2
       int 21h
       mov dl,32
       mov ah,2
       int 21h
       int 21h
       int 21h 
       
       mov dl,seven
       mov ah,2
       int 21h 
       mov dl,32
       mov ah,2
       int 21h
       mov dl,'|'
       mov ah,2
       int 21h
       mov dl,32
       mov ah,2
       int 21h
       int 21h
       mov dl,eight
       mov ah,2
       int 21h
       mov dl,32
       mov ah,2
       int 21h
       int 21h
       mov dl,'|'
       mov ah,2
       int 21h
       mov dl,32
       mov ah,2
       int 21h
       int 21h
       mov dl,nine
       mov ah,2
       int 21h   
        mov dx,offset up
       mov ah,9
      
       int 21h
       mov dl,13
       mov ah,2
       int 21h
       mov dl,10
       mov ah,2
       int 21h
       mov dl,32
       mov ah,2
       int 21h
       int 21h
       int 21h    
       
    
    ret
    board endp
    end main
