.start:
    clear
    mov I, .borderHorizontal
    mov V0, 0
    mov V1, 31
    mov V2, 0  ;VX when drawing

.drawBorder:
    draw V2, V0, 1 
    draw V2, V1, 1
    add V2, 8
    eq V2, 64   ;Check whether V2 at screen screenWidth
    jmp .drawBorder ;Only skipped if horizontal border is done

    mov V0, 0
    mov V1, 63
    mov V2, 1
    mov I, .borderVertical
    draw V0, V2, 15
    draw V1, V2, 15
    add V2, 15      
    draw V0, V2, 15
    draw V1, V2, 15 

.title:
    mov I, .fontC
    mov V0, 12
    mov V1, 8
    draw V0, V1, 5
    add V0, 6

    mov I, .fontH
    draw V0, V1, 5
    add V0,6

    mov I, .fontI
    draw V0, V1, 5
    add V0,6

    mov I, .fontP
    draw V0, V1, 5
    add V0,6

    mov I, .fontDash
    draw V0, V1, 5
    add V0,6

    mov I, .fontF
    draw V0, V1, 5
    add V0,6

    mov I, .fontA
    draw V0, V1, 5
    
    mov I, .fontB
    mov V0, 6
    mov V1, 16
    draw V0, V1, 5
    add V0, 6

    mov I, .fontE
    draw V0, V1, 5
    add V0,6

    mov I, .fontN
    draw V0, V1, 5
    add V0,6

    mov I, .fontC
    draw V0, V1, 5
    add V0,6

    mov I, .fontH
    draw V0, V1, 5
    add V0,6

    mov I, .fontM
    draw V0, V1, 5
    add V0,6

    mov I, .fontA
    draw V0, V1, 5
    add V0,6

    mov I, .fontR
    draw V0, V1, 5
    add V0,6

    mov I, .fontK
    draw V0, V1, 5
    add V0,6
    mov V0, 45

.delayTitle:
    sdly V0
    dly V0
    eq V0, 0
    jmp .delayTitle
    clear
    
.screenTest:
    mov V0, 15
    mov V1, 8
    mov I, .fontS
    draw V0, V1, 5
    add V0, 6

    mov I, .fontC
    draw V0, V1, 5
    add V0, 6

    mov I, .fontR
    draw V0, V1, 5
    add V0, 6

    mov I, .fontE
    draw V0, V1, 5
    add V0, 6
    draw V0, V1, 5
    add V0, 6

    mov I, .fontN
    draw V0, V1, 5
    add V0, 6

    mov I, .fontT
    mov V1, 16
    mov V0, 21
    draw V0, V1, 5
    add V0,6

    mov I, .fontE
    draw V0, V1, 5
    add V0,6

    mov I, .fontS
    draw V0, V1, 5
    add V0,6

    mov I, .fontT
    draw V0, V1, 5
    add V0,6
    mov V0, 45

.delayScreenTest:
    sdly V0
    dly V0
    eq V0, 0
    jmp .delayScreenTest
    clear
    mov V0, 0
    mov V1, 0
    mov I, .checkerBoard
    
.drawCheckerBoard:
    neq V0, 64
    mov V0, 0
    draw V0, V1, 1
    add V0, 8
    neq V0, 64
    mov I, .checkerBoard2
    neq V0, 64
    add V1, 1
    neq V0, 64
    jmp .drawCheckerBoard2
    jmp .drawCheckerBoard
    

.drawCheckerBoard2:
    neq V0, 64
    mov V0, 0
    draw V0, V1, 1
    add V0, 8
    neq V0, 64
    mov I, .checkerBoard
    neq V0, 64
    add V1, 1
    neq V1, 32
    jmp .transition
    neq V0, 64
    jmp .drawCheckerBoard
    jmp .drawCheckerBoard2

.transition:
    mov V0, 0
    mov V1, 0
    mov I, .borderHorizontal
    jmp .reverseScreen

.reverseScreen:
    draw V0, V1, 1
    add V0, 8
    neq V0, 64
    add V1, 1
    neq V0, 64
    mov V0, 0
    neq V1, 32
    mov V0, 45
    neq v1, 32
    jmp .delayReverseScreen
    jmp .reverseScreen

.delayReverseScreen:
    sdly V0
    dly V0
    eq V0, 0
    jmp .delayReverseScreen
    clear
   
.buttonTest:
    mov I, .fontB
    mov V0, 15
    mov V1, 8
    draw V0, V1, 5
    add V0, 6

    mov I, .fontU
    draw V0, V1, 5
    add V0, 6

    mov I, .fontT
    draw V0, V1, 5
    add V0, 6
    draw V0, V1, 5
    add V0, 6

    mov I, .fontO
    draw V0, V1, 5
    add V0, 6

    mov I, .fontN
    draw V0, V1, 5
    add V0, 6

    mov V1, 16
    mov V0, 21
    mov I, .fontT
    draw V0, V1, 5
    add V0, 6 

    mov I, .fontE
    draw V0, V1, 5
    add V0, 6 

    mov I, .fontS
    draw V0, V1, 5
    add V0, 6 

    mov I, .fontT
    draw V0, V1, 5
    add V0, 6 
    mov V0, 45

.delayButtonTest:
    sdly V0
    dly V0
    eq V0, 0
    jmp .delayButtonTest
    clear

.button1:
    mov I, .font1
    mov V0, 30
    mov V1, 14
    mov V2, 0
    draw V0, V1, 5

.button1Wait:
    kneq V2
    jmp .button2
    jmp .button1Wait

.button2:
    clear
    mov I, .font2
    mov V2, 1
    draw V0, V1, 5

.button2Wait:
    kneq V2
    jmp .button3
    jmp .button2Wait

.button3:
    clear
    mov I, .font3
    mov V2, 2
    draw V0, V1, 5

.button3Wait:
    kneq V2
    jmp .button4
    jmp .button3Wait

.button4:
    clear
    mov I, .font4
    mov V2, 3
    draw V0, V1, 5

.button4Wait:
    kneq V2
    jmp .buttonQ
    jmp .button4Wait

.buttonQ:
    clear
    mov I, .fontQ
    mov V2, 4
    draw V0, V1, 5

.buttonQWait:
    kneq V2
    jmp .buttonW
    jmp .buttonQWait

.buttonW:
    clear
    mov I, .fontW
    mov V2, 5
    draw V0, V1, 5

.buttonWWait:
    kneq V2
    jmp .buttonE
    jmp .buttonWWait

.buttonE:
    clear
    mov I, .fontE
    mov V2, 6
    draw V0, V1, 5

.buttonEWait:
    kneq V2
    jmp .buttonR
    jmp .buttonEWait

.buttonR:
    clear
    mov I, .fontR
    mov V2, 7
    draw V0, V1, 5

.buttonRWait:
    kneq V2
    jmp .buttonA
    jmp .buttonRWait

.buttonA:
    clear
    mov I, .fontA
    mov V2, 8
    draw V0, V1, 5

.buttonAWait:
    kneq V2
    jmp .buttonS
    jmp .buttonAWait

.buttonS:
    clear
    mov I, .fontS
    mov V2, 9
    draw V0, V1, 5

.buttonSWait:
    kneq V2
    jmp .buttonD
    jmp .buttonSWait

.buttonD:
    clear
    mov I, .fontD
    mov V2, 10
    draw V0, V1, 5

.buttonDWait:
    kneq V2
    jmp .buttonF
    jmp .buttonDWait

.buttonF:
    clear
    mov I, .fontF
    mov V2, 11
    draw V0, V1, 5

.buttonFWait:
    kneq V2
    jmp .buttonZ
    jmp .buttonFWait

.buttonZ:
    clear
    mov I, .fontZ
    mov V2, 12
    draw V0, V1, 5

.buttonZWait:
    kneq V2
    jmp .buttonX
    jmp .buttonZWait

.buttonX:
    clear
    mov I, .fontX
    mov V2, 13
    draw V0, V1, 5

.buttonXWait:
    kneq V2
    jmp .buttonC
    jmp .buttonXWait

.buttonC:
    clear
    mov I, .fontC
    mov V2, 14
    draw V0, V1, 5

.buttonCWait:
    kneq V2
    jmp .buttonV
    jmp .buttonCWait

.buttonV:
    clear
    mov I, .fontV
    mov V2, 15
    draw V0, V1, 5

.buttonVWait:
    kneq V2
    jmp .start
    jmp .buttonVWait
    
    
.end:
    jmp .end

.borderHorizontal:
.spr "XXXXXXXX"

.checkerBoard:
.spr "X X X X "

.checkerBoard2:
.spr " X X X X"

.borderVertical:
.spr "X       "
.spr "X       "
.spr "X       "
.spr "X       "
.spr "X       "
.spr "X       "
.spr "X       "
.spr "X       "
.spr "X       "
.spr "X       "
.spr "X       "
.spr "X       "
.spr "X       "
.spr "X       "
.spr "X       "

.fontC:
.spr "XXXX    "
.spr "X       "
.spr "X       "
.spr "X       "
.spr "XXXX    "

.fontH:
.spr "X  X    "
.spr "X  X    "
.spr "XXXX    "
.spr "X  X    "
.spr "X  X    "

.fontI:
.spr "XXXX    "
.spr " XX     "
.spr " XX     "
.spr " XX     "
.spr "XXXX    "

.fontP:
.spr "XXXX    "
.spr "X  X    "
.spr "XXXX    "
.spr "X       "
.spr "X       "

.fontDash:
.spr "        "
.spr "        "
.spr "XXXX    "
.spr "        "
.spr "        "

.fontF:
.spr "XXXX    "
.spr "X       "
.spr "XXXX    "
.spr "X       "
.spr "X       "

.fontA:
.spr "XXXX    "
.spr "X  X    "
.spr "XXXX    "
.spr "X  X    "
.spr "X  X    "

.fontB:
.spr "XXX     "
.spr "X  X    "
.spr "XXX     "
.spr "X  X    "
.spr "XXX     "

.fontE:
.spr "XXXX    "
.spr "X       "
.spr "XXXX    "
.spr "X       "
.spr "XXXX    "

.fontN:
.spr "XX X    "
.spr "XX X    "
.spr "X XX    "
.spr "X XX    "
.spr "X  X    "

.fontM:
.spr "XX XX   "
.spr "X X X   "
.spr "X   X   "
.spr "X   X   "
.spr "X   X   "

.fontR:
.spr "XXXX    "
.spr "X  X    "
.spr "XXXX    "
.spr "X X     "
.spr "X  X    "

.fontK:
.spr "X  X    "
.spr "X X     "
.spr "XX      "
.spr "X X     "
.spr "X  X    "

.fontS:
.spr "XXXX    "
.spr "X       "
.spr "XXXX    "
.spr "   X    "
.spr "XXXX    "

.fontT:
.spr "XXXX    "
.spr " XX     "
.spr " XX     "
.spr " XX     "
.spr " XX     "

.fontU:
.spr "X  X    "
.spr "X  X    "
.spr "X  X    "
.spr "X  X    "
.spr "XXXX    "

.fontO:
.spr "XXXX    "
.spr "X  X    "
.spr "X  X    "
.spr "X  X    "
.spr "XXXX    "

.font1:
.spr " XX     "
.spr "  X     "
.spr "  X     "
.spr "  X     "
.spr "XXXX    "

.font2:
.spr "XXXX    "
.spr "X  X    "
.spr "  X     "
.spr "XX      "
.spr "XXXX    "

.font3:
.spr "XXX     "
.spr "   X    "
.spr "XXX     "
.spr "   X    "
.spr "XXX     "

.font4:
.spr "X  X    "
.spr "X  X    "
.spr "XXXX    "
.spr "   X    "
.spr "   X    "

.fontQ:
.spr "XXX     "
.spr "X X     "
.spr "X X     "
.spr "XXX     "
.spr "   X    "

.fontW:
.spr "X   X   "
.spr "X   X   "
.spr "X   X   "
.spr "X X X   "
.spr "XX XX   "

.fontD:
.spr "XXX     "
.spr "X  X    "
.spr "X  X    "
.spr "X  X    "
.spr "XXX     "

.fontZ:
.spr "XXXX    "
.spr "   X    "
.spr "  X     "
.spr " X      "
.spr "XXXX    "

.fontX:
.spr "X  X    "
.spr "X  X    "
.spr " XX     "
.spr "X  X    "
.spr "X  X    "

.fontV:
.spr "X  X    "
.spr "X  X    "
.spr "X  X    "
.spr "X  X    "
.spr " XX     "
