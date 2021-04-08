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
