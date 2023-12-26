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
boxroof db 10,13,"        - - - - - - - - - -$"
boxside db 10,13,"        x                 o$"
inbox db 10,13, "        o   Tic Tac Toe!  x$"
box2roof db 10,13,"      - - - - - - - - - - - - - - - -$"
box2s db 10,13,"      x                             o$"
 
msg1 db 10,13,10,13,"Enter your sign!(Player 1): $"
msg2 db 10,13,"Enter your sign!(Player 2): $" 
op1 db 10,13,"      o Enter 1 to Play Game        x$"
op2 db 10,13,"      x Enter 2 to view Score Board o$"
op4 db 10,13,"      o Enter 3 to Quit Game        x$"  
term db 10,13,10,13,"Game Ended!$"
winrate1 db 0
winrate2 db 0
score db 10,13,"        x   SCOREBOARD    o$"
player1 db 10,13,"o Player1 x Player2 x $"
midpoint db 10,13,"        x        o        x$"     
s1 db 10,13,"        x    $"
s2 db "   x    $"   
s3 db "   o$" 
turncount db 0   
wrongi db "No such option exists!$"   
sure db "Are you sure to quit?$" 
input1 db "Player1 Enter: $"
input2 db "Player2 Enter: $"
renter db 10,13,"Incorrect! Re-enter:$" 
alliswell db 0   
player1kijeet db 10,13,"PLAYER 1 HAS WON!!!$"
player2kijeet db 10,13,"PLAYER 2 HAS WON!!!$"
winner db 0
draw_ db 10,13,"GAME IS A DRAW!$"  
again0 db 10,13,"Play Again? $" 
reset db 10,13,"Reset Score?$" 
done db 10,13,"Score Reset!$"
back db 10,13,"Press any key to return $"
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
       mov dx,offset winner
       mov winner,0
       mov one,'1'
       mov two,'2'
       mov three,'3'
       mov four,'4'
       mov five,'5'
       mov six,'6'
       mov seven,'7'
       mov eight,'8'
       mov nine,'9'
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
       je qg 
       jmp wrong
       sc:
       call scoreboard 
       jmp resume 
       qg:   
       
       mov dx,offset sure
       mov ah,9
       int 21h
       mov ah,1
       int 21h
       cmp al,'Y'
       je yes
       jmp resume
       yes:
       mov dx,offset term
       mov ah,9
       int 21h
       mov ah,4ch
       int 21h
   
       sg:  
       call play 
       jmp again_ 
       wrong:
       mov dx,offset wrongi
       mov ah,9
       int 21h
       jmp resume
       again_:
       mov dx,offset again0
       mov ah,9
       int 21h
       mov ah,1
       int 21h
       cmp al,'Y'
       je resume
       jmp qg
      
    main endp 

play proc
          
      call ask_sign  
      mov dx,offset turncount
      mov cx,5
      input:  
      call board
      mov dx,offset input1
      mov ah,9
      int 21h
      mov ah,1
      int 21h
      inc turncount
      mov bl,sign1
      call validation
      call winorlose
      cmp winner,1
      je winarrr1
      cmp turncount,9
      je draw 
      call board
      mov dx,offset input2
      mov ah,9
      int 21h
      mov ah,1
      int 21h
      inc turncount
      mov bl,sign2
      call validation
      call winorlose
      cmp winner,1
      je winner22
    loop input        
      draw:
      mov dx,offset draw_
      mov ah,9
      int 21h
      jmp exit
      
      winarrr1:
      mov dx,offset player1kijeet
      mov ah,9
      int 21h
      inc winrate1
      jmp exit
      winner22:
      mov dx,offset player2kijeet
      mov ah,9
      int 21h 
      inc winrate2
            
exit:
    ret
play endp    


validation proc    
           
           mov dl,sign1
           mov dh,sign2
           here:
           cmp one,al
           je onehihai
           cmp two,al
           je twohihai  
           cmp three,al
           je threehihai
           cmp four,al
           je fourhihai
           cmp five,al
           je fivehihai
           cmp six,al
           je sixhihai
           cmp seven,al
           je sevenhihai
           cmp eight,al
           je eighthihai
           cmp nine,al
           je ninehihai
           jmp re   
           
           onehihai:
           cmp one,dl
           je re
           cmp one,dh
           je re
           mov one,bl 
           ret
           
           twohihai:
           cmp two,dl
           je re
           cmp two,dh
           je re
           mov two,bl 
           ret   
           
            threehihai:
           cmp three,dl
           je re
           cmp three,dh
           je re
           mov three,bl   
           ret     
           
           fourhihai:
           cmp four,dl
           je re
           cmp four,dh
           je re
           mov four,bl  
           ret    
           
           fivehihai:
           cmp five,dl
           je re
           cmp five,dh
           je re
           mov five,bl 
           ret     
           
           sixhihai:
           cmp six,dl
           je re
           cmp six,dh
           je re
           mov six,bl   
           ret   
           
           sevenhihai:
           cmp seven,dl
           je re
           cmp seven,dh
           je re
           mov seven,bl
           ret
           
           eighthihai:  
           
           cmp eight,dl
           je re
           cmp eight,dh
           je re
           mov eight,bl  
           ret     
           
           ninehihai:
           cmp nine,dl
           je re
           cmp nine,dh
           je re
           mov nine,bl 
           ret
           
           re:
           mov dx,offset renter
           mov ah,9
           int 21h
           mov ah,1
           int 21h
           jmp here
           
   ret
   validation endp 
   
 
winorlose proc
    
        ;bl has my sign
        mov dx,offset winner
        cmp bl,one
        je ok2
        jmp srow
        ok2:
        cmp bl,two
        je ok3
        jmp srow
        ok3:
        cmp bl,three
        je finally
        jmp srow
        
        
        srow:
        cmp bl,four
        je ok4
        jmp trow
        ok4:
        cmp bl,five                     
        je ok5
        jmp trow
        ok5:
        cmp bl,six
        je finally
        jmp trow
                
        trow:
        cmp bl,seven
        je ok7
        jmp cone
        ok7:
        cmp bl,eight
        je ok8
        jmp cone        
        ok8:
        cmp bl,nine
        je finally
        jmp cone
        
        cone:
        cmp bl,one
        je cone2
        jmp ctwo
        cone2:
        cmp bl,four
        je cone3
        jmp ctwo
        cone3:     
        cmp bl,seven
        je finally
        jmp ctwo
        
        ctwo:
        
        cmp bl,two
        je ctwo2
        jmp cthree
        ctwo2:
        cmp bl,five
        je ctwo3
        jmp cthree
        ctwo3:
        cmp bl,eight
        je finally  
        jmp cthree
        cthree:
        cmp bl,three
        je cthree2
        jmp d1
        
        cthree2:
        cmp bl,six
        je cthree3
        jmp d1
        cthree3:
        cmp bl,nine
        je finally
        jmp d1
        
        d1:
        cmp bl,one
        je d12
        jmp d2
        d12:
        cmp bl,five
        je d13
        jmp d2
        d13:
        cmp bl,nine
        je finally
        d2:
        cmp bl,three
        je d22
        jmp exit2
       
        d22:
        cmp bl,five
        je d23
        jmp exit2
        d23:
        cmp bl,seven
        je finally
        jmp exit2
     
        finally:
        inc winner
        exit2:
    
    ret
    winorlose endp
  
   
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
        mov dx,offset reset
        mov ah,9
        int 21h
        mov ah,1
        int 21h
        cmp al,'Y'
        je rr
        jmp there
        
        rr:
        mov winrate1, 0
        mov winrate2, 0  
        mov dx,offset done
        mov ah,9
        int 21h
        there:
        mov dx,offset back
        mov ah,9
        int 21h
        mov ah,1
        int 21h
         

     ret
     scoreboard endp
  

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
