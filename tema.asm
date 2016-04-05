
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt



;org 0x7C00 ; BIOS-ul va incarca programul
;bits 16 ; procesorul porneste in modul pe 16 biti
 

       
w_cana equ 40 ; dimensiuni cana
h_cana equ 60
start_cana_w equ 220 ;pozitie_cana
start_cana_h equ 120 ;

w_teava equ 80; dimensiuni teava
h_teava equ 10;  
start_teava_w equ 160; pozitie_teava    
start_teava_h equ 85;
    
w_rezervor equ 60; dimensiuni rezervor
h_rezervor equ 50
start_rezervor_w equ 100 ; pozitie rezervor
start_rezervor_h equ 50

w_suport equ 80 ; dimensiuni suport
h_suport equ 20
start_suport equ 200 ; pozitie suport    


pas_lichid equ 10 ; distanta intre doua picaturi
dim_lichid equ 5  ; lungimea unei picaturi

jmp main


main:   

    mov ah, 0
    mov al, 13h ; trecere in mod grafic 320x200
    int 10h       
           
    ; incepem programul
    mov ah, 02    ; load beep
    mov dl, 07h
    int 21h       ; execute 
     
    mov ah, 02    ; load beep
    mov dl, 07h
    int 21h       ; execute
   
    ; suport
    ; suport sus
    mov cx, start_suport+w_suport ; coloana
    mov dx, start_cana_h+h_cana+1 ; rand
    mov al, 1 
    
    suport_1: 
        
        mov ah, 0ch ;afisare pixel
        int 10h
        dec cx
        cmp cx, start_suport
        jae suport_1

    
    ; suport jos
    mov cx, start_suport+w_suport
    mov dx, 199
    mov al, 1
    
    suport_2: 
        
        mov ah, 0ch
        int 10h
        dec cx
        cmp cx, start_suport
        ja suport_2
    
    
    ; suport stanga
    mov cx, start_suport
    mov dx, 200
    mov al, 1
    
    suport_3: 
        
        mov ah, 0ch
        int 10h
        dec dx
        cmp dx, start_cana_h+h_cana+1
        ja suport_3
                
                   
    
    ;suport dreapta
    mov cx, start_suport+w_suport
    mov dx, 200
    mov al, 1
    
    suport_4: 
        
        mov ah, 0ch
        int 10h
        dec dx
        cmp dx, start_cana_h+h_cana+1
        ja suport_4

    
     mov ah, 02    ; load beep
     mov dl, 07h
     int 21h       ; execute
     
     mov ah, 02    ; load beep
     mov dl, 07h
     int 21h       ; execute
    
    
    mov ah, 02    ; load beep
    mov dl, 07h
    int 21h       ; execute 
     
    mov ah, 02    ; load beep
    mov dl, 07h
    int 21h       ; execute
    ; cana
    
    ; afisare latura inferioara cana
    mov cx, start_cana_w+w_cana
    mov dx, start_cana_h+h_cana
    mov al, 15
    
    cana_2: 
    
        mov ah, 0ch
        int 10h
        dec cx
        cmp cx, start_cana_w
        ja cana_2
    
    
    ; latura din stanga cana
    mov cx, start_cana_w
    mov dx, start_cana_h+h_cana
    mov al, 15
    
    cana_3: 
        
        mov ah, 0ch
        int 10h
        dec dx
        cmp dx, start_cana_h
        ja cana_3
    
    
    ; latura din dreapta cana
    mov cx, start_cana_w+w_cana
    mov dx, start_cana_h+h_cana
    mov al, 15
    
    cana_4: 
        
        mov ah, 0ch
        int 10h
        dec dx
        cmp dx, start_cana_h
        ja cana_4
                   

    mov ah, 02    ; load beep
    mov dl, 07h
    int 21h       ; execute 
     
    mov ah, 02    ; load beep
    mov dl, 07h
    int 21h       ; execute
    ; toarta
    
    ; toarta latura superioara
    mov cx, start_cana_w+w_cana+10 ; coloana
    mov dx, start_cana_h+20 ; rand
    mov al, 15 ; alb
    
    toarta_1: 
        
        mov ah, 0ch ;afisare pixel
        int 10h
        dec cx
        cmp cx, start_cana_w+w_cana
        jae toarta_1
    
    
    ; toarta latura inferioara
    mov cx, start_cana_w+w_cana+10
    mov dx, start_cana_h+20+10
    mov al, 15
    
    toarta_2: 
    
        mov ah, 0ch
        int 10h
        dec cx
        cmp cx, start_cana_w+w_cana
        ja toarta_2
    
    ; toarta stanga
    mov cx, start_cana_w+w_cana
    mov dx, start_cana_h+30
    mov al, 15
    
    toarta_3: 
    
        mov ah, 0ch
        int 10h
        dec dx
        cmp dx, start_cana_h+20
        ja toarta_3
    
    ; toarta dreapta
    mov cx, start_cana_w+w_cana+10
    mov dx, start_cana_h+30
    mov al, 15
    
    
    toarta_4: 
    
        mov ah, 0ch
        int 10h
        dec dx
        cmp dx, start_cana_h+20
        ja toarta_4
        
        
    mov ah, 02    ; load beep
    mov dl, 07h
    int 21h       ; execute 
     
    mov ah, 02    ; load beep
    mov dl, 07h
    int 21h       ; execute    
    
    
    
    ; teava de alimentare cana
    ; latura superioara
    mov cx, start_teava_w+w_teava+5 ; coloana
    mov dx, start_teava_h ; rand
    mov al, 15 ; alb
    
    teava_1: 
        
        mov ah, 0ch ;afisare pixel
        int 10h
        dec cx
        cmp cx, start_teava_w
        jae teava_1
    
    
    ; latura inferioara
    mov cx, start_teava_w+w_teava-5
    mov dx, start_teava_h+h_teava
    mov al, 15
    
    
    teava_2: 
        
        mov ah, 0ch
        int 10h
        dec cx
        cmp cx, start_teava_w
        ja teava_2
    
    
    ; latura din stanga teava
    mov cx, start_teava_w+w_teava+5
    mov dx, start_teava_h+h_teava+15
    mov al, 15
        
        
    teava_3: 
        
        mov ah, 0ch
        int 10h
        dec dx
        cmp dx, start_teava_h
        ja teava_3
    
    
    ; latura din dreapta teava
    mov cx, start_teava_w+w_teava-5
    mov dx, start_teava_h+h_teava+15
    mov al, 15
    
    teava_4: 
    
        mov ah, 0ch
        int 10h
        dec dx
        cmp dx, start_teava_h+h_teava
        ja teava_4
                     
    
    mov ah, 02    ; load beep
    mov dl, 07h
    int 21h       ; execute 
     
    mov ah, 02    ; load beep
    mov dl, 07h
    int 21h       ; execute
    
    ; rezervor de bauturi
    
    ; latura superioara
    mov cx, start_rezervor_w+w_rezervor ; coloana
    mov dx, start_rezervor_h+h_rezervor ; rand
    mov al, 15 ; alb
    
    rezervor_1: 
        
        mov ah, 0ch ;afisare pixel
        int 10h
        dec cx
        cmp cx, start_rezervor_w
        jae rezervor_1
    
    
    ; rezervor_inferior
    mov cx, start_rezervor_w+w_rezervor
    mov dx, start_rezervor_h
    mov al, 15
    
    rezervor_2: 
        
        mov ah, 0ch
        int 10h
        dec cx
        cmp cx, start_rezervor_w
        ja rezervor_2
    
    
    ; rezervor stanga
    mov cx, start_rezervor_w
    mov dx, start_rezervor_h+h_rezervor
    mov al, 15
    
    rezervor_3: 
        
        mov ah, 0ch
        int 10h
        dec dx
        cmp dx, start_rezervor_h
        ja rezervor_3
    
    
    ; rezervor dreapta
    mov cx, start_rezervor_w+w_rezervor
    mov dx, start_rezervor_h+h_rezervor
    mov al, 15
    
    rezervor_4: 
    
        mov ah, 0ch
        int 10h
        dec dx
        cmp dx, start_rezervor_h
        ja rezervor_4

    mov ah, 02    ; load beep
    mov dl, 07h
    int 21h       ; execute 
     
    mov ah, 02    ; load beep
    mov dl, 07h
    int 21h       ; execute
    
    ; afisare mesaje
    ;'Bine ati venit la automatul de bauturi!'
    
    mov ah, 0Eh; B
    mov al, 66
    int 10h
    
    mov ah, 0Eh; i
    mov al, 105
    int 10h
    
    mov ah, 0Eh; n
    mov al, 110
    int 10h
    
    mov ah, 0Eh; e
    mov al, 101
    int 10h
    
    mov ah, 0Eh; [space]
    mov al, 32
    int 10h
    
    mov ah, 0Eh; a
    mov al, 97
    int 10h
    
    mov ah, 0Eh; t
    mov al, 116
    int 10h
    
    mov ah, 0Eh; i
    mov al, 105
    int 10h
    
    mov ah, 0Eh; [space]
    mov al, 32
    int 10h
    
    mov ah, 0Eh; v
    mov al, 118
    int 10h
    
    mov ah, 0Eh; e
    mov al, 101
    int 10h
    
    mov ah, 0Eh; n
    mov al, 110
    int 10h
    
    mov ah, 0Eh; i
    mov al, 105
    int 10h
    
    mov ah, 0Eh; t
    mov al, 116
    int 10h
    
    mov ah, 0Eh; [space]
    mov al, 32
    int 10h
    
    mov ah, 0Eh; l
    mov al, 108
    int 10h
    
    mov ah, 0Eh; a
    mov al, 97
    int 10h
    
    mov ah, 0Eh; [space]
    mov al, 32
    int 10h
    
    mov ah, 0Eh; a
    mov al, 97
    int 10h       
    
    mov ah, 0Eh; u
    mov al, 117
    int 10h
    
    mov ah, 0Eh; t
    mov al, 116
    int 10h
    
    
    mov ah, 0Eh; o
    mov al, 111
    int 10h
    
    mov ah, 0Eh; m
    mov al, 109
    int 10h
    
    mov ah, 0Eh; a
    mov al, 97
    int 10h
    
    mov ah, 0Eh; t
    mov al, 116
    int 10h
    
    mov ah, 0Eh; u
    mov al, 117
    int 10h
    
    mov ah, 0Eh; l
    mov al, 108
    int 10h
    
    mov ah, 0Eh; [space]
    mov al, 32
    int 10h
    
    mov ah, 0Eh; d
    mov al, 100
    int 10h
    
    mov ah, 0Eh; e
    mov al, 101
    int 10h
    
    mov ah, 0Eh; [space]
    mov al, 32
    int 10h
    
    mov ah, 0Eh; b
    mov al, 98
    int 10h
    
    mov ah, 0Eh; a
    mov al, 97
    int 10h
    
    mov ah, 0Eh; u
    mov al, 117
    int 10h
    
    mov ah, 0Eh; t
    mov al, 116
    int 10h
    
    mov ah, 0Eh; u
    mov al, 117
    int 10h
    
    mov ah, 0Eh; r
    mov al, 114
    int 10h
    
    mov ah, 0Eh; i
    mov al, 105
    int 10h
    
    mov ah, 0Eh; !
    mov al, 33
    int 10h
    
    mov ah, 0Eh; [enter]
    mov al, 13
    int 10h
    mov al, 10
    int 10h   
    
    ;'Selectati bautura:'
    
    mov ah, 0Eh; S
    mov al, 83
    int 10h
    
    mov ah, 0Eh; e
    mov al, 101
    int 10h
    
    mov ah, 0Eh; l
    mov al, 108
    int 10h
    
    mov ah, 0Eh; e
    mov al, 101
    int 10h
    
    mov ah, 0Eh; c
    mov al, 99
    int 10h
    
    mov ah, 0Eh; t
    mov al, 116
    int 10h
    
    mov ah, 0Eh; a
    mov al, 97
    int 10h
    
    mov ah, 0Eh; t
    mov al, 116
    int 10h
    
    mov ah, 0Eh; i
    mov al, 105
    int 10h
    
    mov ah, 0Eh; [space]
    mov al, 32
    int 10h    
    
    mov ah, 0Eh; b
    mov al, 98
    int 10h
    
    mov ah, 0Eh; a
    mov al, 97
    int 10h
    
    mov ah, 0Eh; u
    mov al, 117
    int 10h
    
    mov ah, 0Eh; t
    mov al, 116
    int 10h
    
    mov ah, 0Eh; u
    mov al, 117
    int 10h
    
    mov ah, 0Eh; r
    mov al, 114
    int 10h
    
    mov ah, 0Eh; a
    mov al, 97
    int 10h
    
    mov ah, 0Eh; :
    mov al, 58
    int 10h       
    
    mov ah, 0Eh; [enter]
    mov al, 13
    int 10h
    mov al, 10
    int 10h
    
    
    ; 'T: Ceai'            
    
    mov ah, 0Eh; T
    mov al, 84
    int 10h
    
    mov ah, 0Eh; :
    mov al, 58
    int 10h
    
    mov ah, 0Eh; [spatiu]
    mov al, 32
    int 10h
    
    mov ah, 0Eh; C
    mov al, 67
    int 10h
    
    mov ah, 0Eh; e
    mov al, 101
    int 10h
    
    mov ah, 0Eh; a
    mov al, 97
    int 10h
    
    mov ah, 0Eh; i
    mov al, 105
    int 10h
    
    mov ah, 0Eh; [enter]
    mov al, 13
    int 10h
    mov al, 10
    int 10h
    
    ; 'C: Cafea'
    
    mov ah, 0Eh; C
    mov al, 67
    int 10h
    
    mov ah, 0Eh; :
    mov al, 58
    int 10h
    
    mov ah, 0Eh; [space]
    mov al, 32
    int 10h
    
    mov ah, 0Eh; C
    mov al, 67
    int 10h
    mov ah, 0Eh; a
    mov al, 97
    int 10h
    
    mov ah, 0Eh; f
    mov al, 102
    int 10h
    
    mov ah, 0Eh; e
    mov al, 101
    int 10h
    
    mov ah, 0Eh; a
    mov al, 97
    int 10h
    
    mov ah, 0Eh; [enter]
    mov al, 13
    int 10h
    mov al, 10
    int 10h
                
    ; 'W: Apa'
                
    mov ah, 0Eh; W
    mov al, 87
    int 10h
    
    mov ah, 0Eh; :
    mov al, 58
    int 10h
    
    mov ah, 0Eh; [space]
    mov al, 32
    int 10h
    
    mov ah, 0Eh; A
    mov al, 65
    int 10h
    
    mov ah, 0Eh; p
    mov al, 112
    int 10h
    
    mov ah, 0Eh; a
    mov al, 97
    int 10h
    
    mov ah, 0Eh; [enter]
    mov al, 13
    int 10h
    mov al, 10
    int 10h


    mov ah, 02    ; load beep
    mov dl, 07h
    int 21h       ; execute 

    
    ; ne pozitionam la iesirea tevii
    
    mov cx, start_teava_w 
    mov dx, start_teava_h+5  
    mov si, cx ; aux pentru latime  
    mov di, dx ; aux pentru inaltime
    
    ; add si, pas_lichid
    
    jmp comanda
    
    

; asteptare apasare tasta
    comanda:    
         
        mov ah,00 ; selectam comanda
        int 16h
        
        cmp al, 116 ; ceai
        mov al, 3 ; alb     
        jmp picaturi_w
        
        cmp al, 99  ; cafea
        mov al, 5 ; alb     
        jmp picaturi_w
        
        cmp al, 119 ; apa   
        mov al, 7 ; alb     
        jmp picaturi_w
        
        jmp comanda ; daca s-a apasat altceva
        
     
    
    
    picaturi_w:
    
        ; desenez de unde iese lichidul pana la cana, cu pas de 10 
        mov al, 3 ; alb       
        
        jmp picaturi_w
        ; add cx, pas_lichid
        
        picatura_w: 
            
            mov ah, 0ch ;afisare pixel
            int 10h
            inc cx
            cmp cx, si+dim_lichid
            jae picatura_w
         
         add cx, pas_lichid
         mov si, cx
         
         cmp cx, start_teava_w + w_teava - 5
         jnge picaturi_w 
         jg picaturi_h
         
     picaturi_h:
         
         mov al, 3 ; alb       
        
        jmp picatura_h
        ; add cx, pas_lichid
        
        picatura_h: 
            
            mov ah, 0ch ;afisare pixel
            int 10h
            inc dx
            cmp dx, di+dim_lichid
            jae picatura_h
         
         add dx, pas_lichid
         mov di, dx
         
         cmp di, start_teava_h + h_cana + 15
         jnge picaturi_h
         
         
    
        
        
      
      
exit:
    HLT
     

ret




;times 510 - ($-$$) db 0 ;
;dw 0xAA55 ; semnatura bootloader