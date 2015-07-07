;   ======================================================================
;                     SEGA CD BIOS 2.00w US Disassembly
;   ======================================================================
;
;       Disassembly created by DarkMorford
;
;   ======================================================================

	include	"constants.asm"
	include "variables.asm"
	include "macros.asm"

InitialSSP:
	dc.l $FFFFFD00
	dc.l _start
	dc.l errorReset
	dc.l _CODERR
	dc.l _CODERR
	dc.l _DEVERR
	dc.l _CHKERR
	dc.l _TRPERR
	dc.l _SPVERR
	dc.l _TRACE
	dc.l _NOCOD0
	dc.l _NOCOD1
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l _LEVEL2		; External interrupt
	dc.l errorReset
	dc.l _LEVEL4		; H-blank
	dc.l errorReset
	dc.l _LEVEL6		; V-blank
	dc.l errorReset
	dc.l _TRAP00
	dc.l _TRAP01
	dc.l _TRAP02
	dc.l _TRAP03
	dc.l _TRAP04
	dc.l _TRAP05
	dc.l _TRAP06
	dc.l _TRAP07
	dc.l _TRAP08
	dc.l _TRAP09
	dc.l _TRAP10
	dc.l _TRAP11
	dc.l _TRAP12
	dc.l _TRAP13
	dc.l _TRAP14
	dc.l _TRAP15
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset
	dc.l errorReset

	dc.b 'SEGA MEGA DRIVE '
	dc.b '(C)SEGA 1993.JUN'
	dc.b 'CD2 BOOT ROM     06/01-1993     20:00      2.00W'
	dc.b 'CD2 BOOT ROM                                    '
	dc.b 'BR 000006-2.00'
	dc.w $AEE0
	dc.b 'JM4             '
	dc.l $000000
	dc.l $01FFFF
	dc.l $FF0000
	dc.l $FFFFFF
	dc.b '            '
	dc.b '            '
	dc.b '                                        '
	dc.b 'U 2             '
; ---------------------------------------------------------------------------

errorReset:
	lea	(_EXCPT).w, a0
	move.w	#$4EF9, d0
	move.w	d0, (a0)+
	move.l	#$640, (a0)+
	movea.l	(InitialSSP).w, sp
	bra.w	_start
	rte
; ---------------------------------------------------------------------------
	dcb.b 102, $FF ; Fill with $FF up to $280
; ---------------------------------------------------------------------------
	bra.w	sub_640
; ---------------------------------------------------------------------------
	bra.w	_start
; ---------------------------------------------------------------------------
	bra.w	loc_684
; ---------------------------------------------------------------------------
	bra.w	loc_67C
; ---------------------------------------------------------------------------
	bra.w	altVblankHandler
; ---------------------------------------------------------------------------
	bra.w	enableDefaultHInt
; ---------------------------------------------------------------------------
	bra.w	readJoypads
; ---------------------------------------------------------------------------
	bra.w	sub_1134
; ---------------------------------------------------------------------------
	bra.w	clearAllVram
; ---------------------------------------------------------------------------
	bra.w	clearVdpPatternTables
; ---------------------------------------------------------------------------
	bra.w	clearVsram
; ---------------------------------------------------------------------------
	bra.w	loadDefaultVdpRegs
; ---------------------------------------------------------------------------
	bra.w	loadVdpRegs
; ---------------------------------------------------------------------------
	bra.w	fillVramSegment
; ---------------------------------------------------------------------------
	bra.w	clearVramSegment
; ---------------------------------------------------------------------------
	bra.w	dmaClearVramSegment
; ---------------------------------------------------------------------------
	bra.w	dmaFillVramSegment
; ---------------------------------------------------------------------------
	bra.w	sub_C2E
; ---------------------------------------------------------------------------
	bra.w	sub_C52
; ---------------------------------------------------------------------------
	bra.w	sub_CF2
; ---------------------------------------------------------------------------
	bra.w	dmaTransferToVram
; ---------------------------------------------------------------------------
	bra.w	dmaTransferToVramWithRewrite
; ---------------------------------------------------------------------------
	bra.w	displayOn
; ---------------------------------------------------------------------------
	bra.w	displayOff
; ---------------------------------------------------------------------------
	bra.w	loadPalettesNoUpdate
; ---------------------------------------------------------------------------
	bra.w	loadPalettesToBuffer
; ---------------------------------------------------------------------------
	bra.w	dmaTransferPalettes
; ---------------------------------------------------------------------------
	bra.w	NemDec
; ---------------------------------------------------------------------------
	bra.w	NemDecToRam
; ---------------------------------------------------------------------------
	bra.w	sub_1CA2
; ---------------------------------------------------------------------------
	bra.w	clearRamSegment
; ---------------------------------------------------------------------------
	bra.w	sub_1C06
; ---------------------------------------------------------------------------
	bra.w	sub_1C18
; ---------------------------------------------------------------------------
	bra.w	loc_976
; ---------------------------------------------------------------------------
	bra.w	waitForVblank
; ---------------------------------------------------------------------------
	bra.w	dmaSendSpriteTable
; ---------------------------------------------------------------------------
	bra.w	sub_1904
; ---------------------------------------------------------------------------
	bra.w	enableUserHInt
; ---------------------------------------------------------------------------
	bra.w	disableHInt
; ---------------------------------------------------------------------------
	bra.w	writeTextToScreen
; ---------------------------------------------------------------------------
	bra.w	loc_195E
; ---------------------------------------------------------------------------
	bra.w	loc_1952
; ---------------------------------------------------------------------------
	bra.w	loadDefaultFont
; ---------------------------------------------------------------------------
	bra.w	sub_18CE
; ---------------------------------------------------------------------------
	bra.w	EniDec
; ---------------------------------------------------------------------------
	bra.w	sub_199C
; ---------------------------------------------------------------------------
	bra.w	randWithModulo
; ---------------------------------------------------------------------------
	bra.w	rand
; ---------------------------------------------------------------------------
	bra.w	clearCommRegisters
; ---------------------------------------------------------------------------
	bra.w	sub_15EE
; ---------------------------------------------------------------------------
	bra.w	sub_1658
; ---------------------------------------------------------------------------
	bra.w	sub_16D2
; ---------------------------------------------------------------------------
	bra.w	sub_17E2
; ---------------------------------------------------------------------------
	bra.w	sub_17EC
; ---------------------------------------------------------------------------
	bra.w	sub_17F6
; ---------------------------------------------------------------------------
	bra.w	sub_1800
; ---------------------------------------------------------------------------
	bra.w	sendInt2ToSubCpu
; ---------------------------------------------------------------------------
	bra.w	sub_68C4
; ---------------------------------------------------------------------------
	bra.w	setVblankHandler
; ---------------------------------------------------------------------------
	bra.w	sub_CA0
; ---------------------------------------------------------------------------
	bra.w	sub_CC6
; ---------------------------------------------------------------------------
	bra.w	dmaCopyVram
; ---------------------------------------------------------------------------
	bra.w	sub_1730
; ---------------------------------------------------------------------------
	bra.w	sub_55AC
; ---------------------------------------------------------------------------
	bra.w	numberToBcd
; ---------------------------------------------------------------------------
	bra.w	displayBlack
; ---------------------------------------------------------------------------
	bra.w	fadeOutColors
; ---------------------------------------------------------------------------
	bra.w	sub_E20
; ---------------------------------------------------------------------------
	bra.w	sub_E0C
; ---------------------------------------------------------------------------
	bra.w	sub_1A28
; ---------------------------------------------------------------------------
	bra.w	sub_1A38
; ---------------------------------------------------------------------------
	bra.w	sub_1A76
; ---------------------------------------------------------------------------
	bra.w	sub_1A4E

; =============== S U B	R O U T	I N E =======================================


installErrorVectors:			; CODE XREF: setupGenHardwarep
	lea	(_EXCPT).w, a0
	move.w	#$4EF9, d0
	move.w	d0, (a0)+
	move.l	#$640, (a0)+
	move.w	d0, (a0)+
	move.l	#$904, (a0)+
	lea	(nullHandler).w, a1
	moveq	#$11, d1

loc_3C2:				; CODE XREF: installErrorVectors+22j
	move.w	d0, (a0)+
	move.l	a1, (a0)+
	dbf	d1, loc_3C2
	lea	(errorReset).l, a1
	moveq	#7, d1

loc_3D2:				; CODE XREF: installErrorVectors+32j
	move.w	d0, (a0)+
	move.l	a1, (a0)+
	dbf	d1, loc_3D2
	move.w	d0, (a0)+
	move.l	#$40C, (a0)+
	move.w	d0, (a0)+
	move.l	#$88F0, (a0)
	lea	asc_40E(pc), a1	; "RAM_CARTRIDG"
	lea	(byte_400001).l, a2
	tst.b	(a2)
	bpl.s	locret_40C
	lea	$F(a2), a2
	moveq	#5, d1

loc_3FE:				; CODE XREF: installErrorVectors:loc_400j
	cmpm.w	(a1)+, (a2)+

loc_400:
	dbne	d1, loc_3FE
	bne.s	locret_40C
	move.l	#$400020, (a0)

locret_40C:				; CODE XREF: installErrorVectors+52j
	rts
; End of function installErrorVectors

; ---------------------------------------------------------------------------
asc_40E:	dc.b 'RAM_CARTRIDG'     ; DATA XREF: installErrorVectors+46o

; =============== S U B	R O U T	I N E =======================================

setVblankHandler:
	move.l a1, (_LEVEL6 + 2).w
	rts
; End of function setVblankHandler


; =============== S U B	R O U T	I N E =======================================

setVblankJumpTarget:
	move.l a1, (vblankJumpTarget + 2).w
	rts
; End of function setVblankJumpTarget

; ---------------------------------------------------------------------------

_start:
	tst.l	($A10008).l
	bne.s	loc_434
	tst.w	($A1000C).l

loc_434:				; CODE XREF: ROM:0000042Cj
	bne.w	loc_4C8
	lea	InitData(pc),a5
	movem.w	(a5)+,d5-d7
	movem.l	(a5)+,a0-a4
	move.b	-$10FF(a1),d0
	andi.b	#$F,d0
	beq.s	loc_456
	move.l	#'SEGA',$2F00(a1)

loc_456:				; CODE XREF: ROM:0000044Cj
	move.w	(a4),d0
	moveq	#0,d0
	move.l	#$C0000000,(VDP_CONTROL).l
	move.w	#31,d1

loc_468:				; CODE XREF: ROM:0000046Aj
	move.l	d0,(a3)
	dbf	d1,loc_468
	movea.l	d0, a6
	move.l	a6, usp
	moveq	#23,d1

loc_474:				; CODE XREF: ROM:0000047Aj
	move.b	(a5)+,d5
	move.w	d5,(a4)
	add.w	d7,d5
	dbf	d1,loc_474
	move.l	(a5)+,(a4)
	move.w	d0,(a3)
	move.w	d7,(a1)
	move.w	d7,(a2)

loc_486:				; CODE XREF: ROM:00000488j
	btst	d0,(a1)
	bne.s	loc_486
	moveq	#37,d2

loc_48C:				; CODE XREF: ROM:0000048Ej
	move.b	(a5)+,(a0)+
	dbf	d2,loc_48C
	move.w	d0,(a2)
	move.w	d0,(a1)
	move.w	d7,(a2)

loc_498:				; CODE XREF: ROM:0000049Aj
	move.l	d0,-(a6)
	dbf	d6,loc_498
	move.l	(a5)+,(a4)
	move.l	(a5)+,(a4)
	moveq	#31,d3

loc_4A4:				; CODE XREF: ROM:000004A6j
	move.l	d0,(a3)
	dbf	d3,loc_4A4
	move.l	(a5)+,(a4)
	moveq	#19,d4

loc_4AE:				; CODE XREF: ROM:000004B0j
	move.l	d0,(a3)
	dbf	d4,loc_4AE
	moveq	#3,d5

loc_4B6:				; CODE XREF: ROM:000004BAj
	move.b	(a5)+,$11(a3)
	dbf	d5,loc_4B6
	move.w	d0,(a2)
	movem.l	(a6),d0-a6
	move	#$2700,sr

loc_4C8:				; CODE XREF: ROM:loc_434j
	bra.s	loc_536
; ---------------------------------------------------------------------------
InitData:
	dc.w $8000
	dc.w $3FFF
	dc.w $100
	dc.l $A00000
	dc.l $A11100
	dc.l $A11200
	dc.l $C00000
	dc.l $C00004
	dc.b   4
	dc.b $14
	dc.b $30 ; 0
	dc.b $3C ; <
	dc.b   7
	dc.b $6C ; l
	dc.b   0
	dc.b   0
	dc.b   0
	dc.b   0
	dc.b $FF
	dc.b   0
	dc.b $81 ; 
	dc.b $37 ; 7
	dc.b   0
	dc.b   1
	dc.b   1
	dc.b   0
	dc.b   0
	dc.b $FF
	dc.b $FF
	dc.b   0
	dc.b   0
	dc.b $80 ; €
	dc.l $40000080
	dc.b $AF ; ¯
	dc.b   1
	dc.b $D9 ; Ù
	dc.b $1F
	dc.b $11
	dc.b $27 ; '
	dc.b   0
	dc.b $21 ; !
	dc.b $26 ; &
	dc.b   0
	dc.b $F9 ; ù
	dc.b $77 ; w
	dc.b $ED ; í
	dc.b $B0 ; °
	dc.b $DD ; Ý
	dc.b $E1 ; á
	dc.b $FD ; ý
	dc.b $E1 ; á
	dc.b $ED ; í
	dc.b $47 ; G
	dc.b $ED ; í
	dc.b $4F ; O
	dc.b $D1 ; Ñ
	dc.b $E1 ; á
	dc.b $F1 ; ñ
	dc.b   8
	dc.b $D9 ; Ù
	dc.b $C1 ; Á
	dc.b $D1 ; Ñ
	dc.b $E1 ; á
	dc.b $F1 ; ñ
	dc.b $F9 ; ù
	dc.b $F3 ; ó
	dc.b $ED ; í
	dc.b $56 ; V
	dc.b $36 ; 6
	dc.b $E9 ; é
	dc.b $E9 ; é
	dc.w $8104
	dc.w $8F02
	dc.l $C0000000
	dc.l $40000010
	dc.b $9F ; Ÿ
	dc.b $BF ; ¿
	dc.b $DF ; ß
	dc.b $FF
; ---------------------------------------------------------------------------

loc_536:				; CODE XREF: ROM:loc_4C8j
	tst.w	(VDP_CONTROL).l
	m_disableInterrupts
	moveq	#$FFFFFFFF,d1
	bsr.w	sub_183A
	clr.b	(byte_FFFFFE54).w
	btst	#6,(JOYCTRL3).l
	beq.s	loc_598
	movea.l	(InitialSSP).w,sp ; Warm boot

loc_558:				; CODE XREF: ROM:00000562j
	move.w	(VDP_CONTROL).l,d3 ; Wait for DMA to finish
	btst	#1,d3
	bne.s	loc_558
	bsr.w	checkRegion
	movem.l	d0-d1,-(sp)
	bsr.w	testCartBootBlock
	bne.w	sub_640		; Boot block didn't match, bail out
	move.l	(_EXCPT+2).w,d0
	bcs.w	loc_5AC

bootCartridge:
	st	(byte_FFFFFE54).w
	bsr.w	setupGenHardware
	move.w	#$4EF9,(_EXCPT).w
	move.l	#$5AC,(_EXCPT+2).w
	jmp	cartBoot
; ---------------------------------------------------------------------------

loc_598:				; CODE XREF: ROM:00000552j
	jsr	(loadDefaultVdpRegs).w
	jsr	(clearAllVram).w
	bsr.w	checkRegion
	bsr.w	clearSubCpuPrg
	bsr.w	clearWordRam2M

loc_5AC:				; CODE XREF: ROM:00000578j sub_640+38j
	m_disableInterrupts
	bsr.w	testCartBootBlock
	beq.s	bootCartridge
	bsr.s	sub_5F0
	moveq	#1,d0
	moveq	#4,d1
	jsr	sub_1800(pc)
	moveq	#4,d0
	bsr.w	setNextState

mainLoop:				; CODE XREF: ROM:000005D4j
	lea	(nextState).w,a0
	move.w	(a0),d0
	andi.w	#$7FFC,d0
	jsr	mainJumpTable(pc,d0.w)
	bra.s	mainLoop
; ---------------------------------------------------------------------------

mainJumpTable:
	nop
	rts
; ---------------------------------------------------------------------------
	bra.w	sub_21F4
; ---------------------------------------------------------------------------
	bra.w	sub_3040
; ---------------------------------------------------------------------------
	bra.w	loadPrgFromWordRam
; ---------------------------------------------------------------------------
	bra.w	sub_7374
; ---------------------------------------------------------------------------
	jmp	$FFFF0000

; =============== S U B	R O U T	I N E =======================================


sub_5F0:				; CODE XREF: ROM:000005B6p
		bsr.s	setupGenHardware
		lea	(_EXCPT).w,a0
		move.w	#$4EF9,(a0)+
		move.l	#$640,(a0)+
		jsr	(waitForVblank).w
		bsr.w	clearCommRegisters
		lea	(GA_COMM_SUBFLAGS).l,a4

loc_60E:				; CODE XREF: sub_5F0+20j
		move.b	(a4),d0
		bne.s	loc_60E
		rts
; End of function sub_5F0


; =============== S U B	R O U T	I N E =======================================


setupGenHardware:			; CODE XREF: ROM:00000580p sub_5F0p
		jsr	installErrorVectors(pc)
		bsr.w	setupJoypads
		jsr	(loadZ80Prg).w
		bsr.w	loadSubCpuPrg
		bsr.w	loadDefaultVdpRegs
		clr.w	(paletteBuffer0).w
		move.l	#$C0000000,(VDP_CONTROL).l
		move.w	#0,(VDP_DATA).l
		rts
; End of function setupGenHardware


; =============== S U B	R O U T	I N E =======================================


sub_640:				; CODE XREF: ROM:00000280j
					; ROM:00000570j
	m_disableInterrupts
	move.b	#$9F,(PSG_CTRL).l
	nop
	nop
	move.b	#$BF,(PSG_CTRL).l
	nop
	nop
	move.b	#$DF,(PSG_CTRL).l
	nop
	nop
	move.b	#$FF,(PSG_CTRL).l
	jsr	(loadDefaultVdpRegs).w
	jsr	(clearAllVram).w
	bra.w	loc_5AC
; End of function sub_640

; ---------------------------------------------------------------------------

loc_67C:				; CODE XREF: ROM:0000028Cj
		m_disableInterrupts
		movea.l	(InitialSSP).w,sp

loc_684:				; CODE XREF: ROM:00000288j
		m_disableInterrupts
		jsr	(loadDefaultVdpRegs).w
		jsr	(clearAllVram).w
		jsr	installErrorVectors(pc)
		bsr.w	setupJoypads
		jsr	(loadZ80Prg).w
		bsr.w	sub_118C
		bsr.w	loadSubCpuPrg
		jsr	(waitForVblank).w
		bsr.w	clearCommRegisters
		lea	(GA_COMM_SUBFLAGS).l,a4

loc_6B2:				; CODE XREF: ROM:000006B4j
		move.b	(a4),d0
		bne.s	loc_6B2
		bsr.w	sub_16C4
		moveq	#1,d0
		moveq	#8,d1
		jsr	sub_1800(pc)
		moveq	#8,d0
		bsr.s	setNextState
		bra.w	mainLoop

; =============== S U B	R O U T	I N E =======================================


setNextState:				; CODE XREF: ROM:000005C2p
					; ROM:000006C4p ...
		andi.w	#$1C,d0
		move.w	d0,(nextState).w
		rts
; End of function setNextState


; =============== S U B	R O U T	I N E =======================================


clearSubCpuPrg:				; CODE XREF: ROM:000005A4p
		lea	(GA_RESET_HALT).l,a5
		lea	1(a5),a6

WaitForBus:				; CODE XREF: clearSubCpuPrg+Ej
		bset	#1,(a5)		; Request sub-CPU bus
		beq.s	WaitForBus
		move.w	(a6),d5
		moveq	#0,d7
		andi.w	#2,d5
		ori.w	#$40,d5	; '@'
		move.w	d5,(a6)
		bsr.s	fillSubCpuBank
		andi.w	#2,d5
		ori.w	#$80,d5	; '€'
		move.w	d5,(a6)
		bsr.s	fillSubCpuBank
		andi.w	#2,d5
		ori.w	#$C0,d5	; 'À'
		move.w	d5,(a6)
		bsr.s	fillSubCpuBank
		andi.w	#2,d5
		move.w	d5,(a6)
; End of function clearSubCpuPrg


; =============== S U B	R O U T	I N E =======================================


fillSubCpuBank:
	lea	(SubCPU_Bank).l, a0
	move.w	#$7FFF, d0

@FillLoop:
	move.l	d7, (a0)+
	dbf	d0, @FillLoop
	rts
; End of function fillSubCpuBank


; =============== S U B	R O U T	I N E =======================================


loadSubCpuPrg:				; CODE XREF: setupGenHardware+Cp
					; ROM:000006A0p
		lea	(GA_RESET_HALT).l,a5

loc_72A:				; CODE XREF: loadSubCpuPrg+Aj
		bclr	#0,(a5)		; Place	sub-CPU	in RESET state
		bne.s	loc_72A
		lea	1(a5),a6
		move.w	(a6),d5
		andi.w	#2,d5
		move.w	d5,(a6)
		lea	(unk_16000).l,a0
		lea	(SubCPU_Base0).l,a1
		bsr.w	decompressKosinski
		lea	(unk_13400).l,a0
		lea	(SubCPU_Base1).l,a1
		bsr.w	decompressKosinski
		lea	(unk_1A000).l,a0
		lea	(SubCPU_Base2).l,a1
		bsr.w	decompressKosinski
		move.b	#$2A,(a6) ; '*' ; Write-protect sub-CPU PRG_RAM $0-$5400

loc_770:				; CODE XREF: loadSubCpuPrg+50j
		bset	#0,(a5)		; Release sub-CPU from RESET state
		beq.s	loc_770

loc_776:				; CODE XREF: loadSubCpuPrg+56j
		bclr	#1,(a5)		; Release sub-CPU bus
		bne.s	loc_776
		rts
; End of function loadSubCpuPrg


; =============== S U B	R O U T	I N E =======================================


clearWordRam2M:				; CODE XREF: ROM:000005A8p
		btst	#GA_MEM_MODE_MODE,1(a6)
		bne.s	locret_79E
		btst	#GA_MEM_MODE_RET,1(a6)
		beq.s	locret_79E
		lea	(WordRAM_Bank0).l,a0
		moveq	#$FFFFFFFF,d0
		moveq	#0,d7

loc_798:				; CODE XREF: clearWordRam2M+1Cj
		move.l	d7,(a0)+
		dbf	d0,loc_798

locret_79E:				; CODE XREF: clearWordRam2M+6j
					; clearWordRam2M+Ej
		rts
; End of function clearWordRam2M


; =============== S U B	R O U T	I N E =======================================


checkRegion:
	move.b	(MD_VERSION).l,d0
	andi.b	#$C0,d0
	cmpi.b	#$80,d0
	bne.s	RegionMismatch
	rts
; ---------------------------------------------------------------------------

RegionMismatch:
	m_disableInterrupts
	jsr	loadDefaultVdpRegs(pc)
	jsr	loadDefaultFont(pc)
	lea	regionErrorText(pc),a1
	move.l	#$C0000000,(VDP_CONTROL).l
	move.l	(a1)+,(VDP_DATA).l
	move.l	#$46060003,d0
	jsr	writeTextToScreen(pc)
	jsr	displayOn(pc)

loc_7E0:	; Infinite loop	while displaying error
	bra.s	loc_7E0
; End of function checkRegion

; ---------------------------------------------------------------------------
regionErrorText:dc.w $EE0		; DATA XREF: checkRegion+1Eo
		dc.w 0
		dc.b '              ERROR!',0,0
		dc.b 'THIS IS AN NTSC-COMPATIBLE SEGA-CD',0
		dc.b 'FOR USE IN NTSC REGIONS OTHER THAN',0
		dc.b '     JAPAN AND SOUTHEAST ASIA.'
		dc.b $FF, 0

; =============== S U B	R O U T	I N E =======================================

; Decompression	routine	for Kosinski data format.
	include "compression\kosinski.asm"

; =============== S U B	R O U T	I N E =======================================


nullHandler:				; DATA XREF: installErrorVectors+18o
		rte
; End of function nullHandler


; =============== S U B	R O U T	I N E =======================================


vblankHandler:
		movem.l	d0-a6,-(sp)
		bsr.w	sub_15EE
		tst.b	(byte_FFFFFE28).w
		bne.s	loc_926
		bsr.w	dmaTransferPalettes
		btst	#1,(vblankCode).w
		beq.s	loc_926
		jsr	vblankJumpTarget
		addq.b	#1,(byte_FFFFFE27).w

loc_926:				; CODE XREF: vblankHandler+Cj
					; vblankHandler+18j
		bsr.w	sub_118C
		bsr.w	sub_11D8
		clr.b	(vblankCode).w
		bsr.w	sub_1658
		bsr.w	sub_1818
		movem.l	(sp)+,d0-a6
		rte
; End of function vblankHandler


; =============== S U B	R O U T	I N E =======================================


altVblankHandler:			; CODE XREF: ROM:00000290j
		movem.l	d0-a6,-(sp)
		bsr.w	sub_15EE
		tst.b	(byte_FFFFFE28).w
		bne.s	loc_962
		bsr.w	dmaTransferPalettes
		btst	#1,(vblankCode).w
		beq.s	loc_962
		jsr	vblankJumpTarget
		addq.b	#1,(byte_FFFFFE27).w

loc_962:				; CODE XREF: altVblankHandler+Cj
					; altVblankHandler+18j
		bsr.w	readJoypads
		clr.b	(vblankCode).w
		movem.l	(sp)+,d0-a6
		rte
; End of function altVblankHandler


; =============== S U B	R O U T	I N E =======================================


waitForVblank:				; CODE XREF: ROM:00000308j sub_5F0+10p ...
		m_disableInterrupts
		moveq	#3,d0

loc_976:				; CODE XREF: ROM:00000304j
		move.b	d0,(vblankCode).w
		andi	#$F8FF,sr

loc_97E:				; CODE XREF: waitForVblank+12j
		tst.b	(vblankCode).w
		bne.s	loc_97E
		bsr.w	rand
		rts
; End of function waitForVblank


; =============== S U B	R O U T	I N E =======================================


enableUserHInt:				; CODE XREF: ROM:00000314j
		move.l	a1,(_LEVEL4+2).w
		move.w	a1,(GA_HINT_VECTOR).l
		bset	#4,(vdpRegCache+1).w
		move.w	(vdpRegCache).w,(VDP_CONTROL).l
		rts
; End of function enableUserHInt


; =============== S U B	R O U T	I N E =======================================


enableDefaultHInt:			; CODE XREF: ROM:00000294j
		move.l	a1,(_LEVEL4+2).w
		move.w	#$FD0C,(GA_HINT_VECTOR).l
		bset	#4,(vdpRegCache+1).w
		move.w	(vdpRegCache).w,(VDP_CONTROL).l
		rts
; End of function enableDefaultHInt


; =============== S U B	R O U T	I N E =======================================


disableHInt:				; CODE XREF: ROM:00000318j
		bclr	#4,(vdpRegCache+1).w
		move.w	(vdpRegCache).w,(VDP_CONTROL).l
		rts
; End of function disableHInt


; =============== S U B	R O U T	I N E =======================================


loadDefaultVdpRegs:			; CODE XREF: ROM:000002ACj
					; ROM:loc_598p	...
		lea	defaultVdpRegs(pc),a1
		move.w	#$80,(vdpLineIncrement).w ; '€'

loadVdpRegs:				; CODE XREF: ROM:000002B0j
					; sub_1CFA+2Ap	...
		lea	(vdpRegCache).w,a2
		moveq	#0,d0

loc_9E0:				; CODE XREF: loadDefaultVdpRegs+28j
		move.b	(a1),d0
		bpl.s	locret_9FA
		move.w	(a1)+,d1
		cmpi.b	#$92,d0
		bhi.s	loc_9F2
		add.b	d0,d0
		move.w	d1,(a2,d0.w)

loc_9F2:				; CODE XREF: loadDefaultVdpRegs+1Aj
		move.w	d1,(VDP_CONTROL).l
		bra.s	loc_9E0
; ---------------------------------------------------------------------------

locret_9FA:				; CODE XREF: loadDefaultVdpRegs+12j
		rts
; End of function loadDefaultVdpRegs

; ---------------------------------------------------------------------------
defaultVdpRegs:
	dc.w $8004  ; Reg #00: H-int off, H/V counter active
	dc.w $8124  ; Reg #01: Display/DMA off, V-int on, V28-cell (NTSC) mode
	dc.w $9011  ; Reg #16: Scroll plane size 64x64 cells
	dc.w $8B00  ; Reg #11: Ext. Int off, H/V full scroll mode
	dc.w $8C81  ; Reg #12: H40-cell mode, Shadow/hilight off, no interlace
	dc.w $8328  ; Reg #03: Window pattern table $A000
	dc.w $8230  ; Reg #02: Scroll A pattern table $C000
	dc.w $8407  ; Reg #04: Scroll B pattern table $E000
	dc.w $855C  ; Reg #05: Sprite attribute table $B800
	dc.w $8D2F  ; Reg #13: H-scroll table $BC00
	dc.w $8700  ; Reg #07: Background color palette 0, color 0
	dc.w $8A00  ; Reg #10: H-interrupt timing set to 0
	dc.w $8F02  ; Reg #15: Auto-increment VDP set to 2
	dc.w $9100  ; Reg #17: Window H position set to 0
	dc.w $9200  ; Reg #18: Window V position set to 0
	dc.w 0

; =============== S U B	R O U T	I N E =======================================


clearAllVram:				; CODE XREF: ROM:000002A0j
					; ROM:0000059Cp ...
		move.l	#$C0000000,(VDP_CONTROL).l ; Set palette 0 color 0 to black
		move.w	#0,(VDP_DATA).l
		bsr.w	clearVsram
		move.l	#$40000000,d0
		move.w	#$FFFF,d1
		bra.w	dmaClearVramSegment
; End of function clearAllVram


; =============== S U B	R O U T	I N E =======================================


clearVdpPatternTables:			; CODE XREF: ROM:000002A4j
		bsr.s	clearSpriteTable
		bsr.w	dmaClearScrollTableA
		bsr.w	dmaClearScrollTableB
		bra.w	dmaClearWindowTable
; End of function clearVdpPatternTables


; =============== S U B	R O U T	I N E =======================================

; Clear	VRAM dword at $BC00

sub_A4E:
		move.l	#$7C000002,(VDP_CONTROL).l
		move.l	#0,(VDP_DATA).l
		rts
; End of function sub_A4E


; =============== S U B	R O U T	I N E =======================================

; Clear	VRAM dword at $B800

clearSpriteTable:			; CODE XREF: clearVdpPatternTablesp
		clr.l	(spriteTable).w
		move.l	#$78000002,(VDP_CONTROL).l
		move.l	#0,(VDP_DATA).l
		rts
; End of function clearSpriteTable


; =============== S U B	R O U T	I N E =======================================


clearVsram:				; CODE XREF: ROM:000002A8j
					; clearAllVram+12p
		move.l	#$40000010,d0
		moveq	#39,d1

clearVramSegment:			; CODE XREF: ROM:000002B8j
					; sub_1CFA+1Ap
		moveq	#0,d2

fillVramSegment:			; CODE XREF: ROM:000002B4j
		move.l	d0,(VDP_CONTROL).l

loc_A8E:				; CODE XREF: clearVsram+16j
		move.w	d2,(VDP_DATA).l
		dbf	d1,loc_A8E
		rts
; End of function clearVsram


; =============== S U B	R O U T	I N E =======================================

; Clear	VRAM from $A000-$ADFF

dmaClearWindowTable:			; CODE XREF: clearVdpPatternTables+Aj
		move.l	#$60000002,d0
		move.w	#$DFF,d1
		bra.s	dmaClearVramSegment
; End of function dmaClearWindowTable


; =============== S U B	R O U T	I N E =======================================

; Clear	VRAM from $C000-$DFFF

dmaClearScrollTableA:			; CODE XREF: clearVdpPatternTables+2p
		move.l	#$40000003,d0
		bra.s	loc_AB4
; End of function dmaClearScrollTableA


; =============== S U B	R O U T	I N E =======================================

; Clear	VRAM from $E000-$FFFF

dmaClearScrollTableB:			; CODE XREF: clearVdpPatternTables+6p
		move.l	#$60000003,d0

loc_AB4:				; CODE XREF: dmaClearScrollTableA+6j
		move.w	#$1FFF,d1
; End of function dmaClearScrollTableB


dmaClearVramSegment:			; CODE XREF: ROM:000002BCj
					; clearAllVram+20j ...
		moveq	#0,d2

; =============== S U B	R O U T	I N E =======================================

; Input	parameters:
; d0 - Fill address
; d1 - DMA length
; d2 - Fill value

dmaFillVramSegment:			; CODE XREF: ROM:000002C0j
		lea	(VDP_CONTROL).l,a6
		move.w	#$8F01,(a6)
		move.w	(vdpRegCache+2).w,d3
		bset	#4,d3
		move.w	d3,(a6)
		move.l	#$940000,d3
		move.w	d1,d3
		lsl.l	#8,d3
		move.w	#$9300,d3
		move.b	d1,d3
		move.l	d3,(a6)
		move.w	#$9780,(a6)
		ori.l	#$40000080,d0
		move.l	d0,(a6)
		move.b	d2,-4(a6)

DmaWaitLoop:				; CODE XREF: dmaFillVramSegment+3Cj
		move.w	(a6),d3		; Wait for DMA to finish
		btst	#1,d3
		bne.s	DmaWaitLoop
		move.w	(vdpRegCache+2).w,(a6)
		move.w	#$8F02,(a6)
		rts
; End of function dmaFillVramSegment


; =============== S U B	R O U T	I N E =======================================

; Input	parameters:
; d0 - Dest address
; d1 - Source address
; d2 - DMA length

dmaTransferToVram:			; CODE XREF: ROM:000002D0j
		lea	(VDP_CONTROL).l,a6
		move.w	(vdpRegCache+2).w,d3
		bset	#4,d3
		move.w	d3,(a6)
		asr.l	#1,d1
		move.l	#$940000,d3
		move.w	d2,d3
		lsl.l	#8,d3
		move.w	#$9300,d3
		move.b	d2,d3
		move.l	d3,(a6)
		move.l	#$960000,d3
		move.w	d1,d3
		lsl.l	#8,d3
		move.w	#$9500,d3
		move.b	d1,d3
		move.l	d3,(a6)
		swap	d1
		move.w	#$9700,d3
		move.b	d1,d3
		move.w	d3,(a6)
		ori.l	#$40000080,d0
		swap	d0
		move.w	d0,(a6)
		swap	d0
		move.w	d0,-(sp)
		move.w	(sp)+,(a6)
		move.w	(vdpRegCache+2).w,(a6)
		rts
; End of function dmaTransferToVram


; =============== S U B	R O U T	I N E =======================================

; Input	parameters:
; d0 - Dest address
; d1 - Source address
; d2 - DMA length

dmaTransferToVramWithRewrite:		; CODE XREF: ROM:000002D4j sub_1A28+8p ...
		move.l	a1,-(sp)
		movea.l	d1,a1
		addq.l	#2,d1
		asr.l	#1,d1
		lea	(VDP_CONTROL).l,a6
		move.w	#$8F02,(a6)
		move.w	(vdpRegCache+2).w,d3
		bset	#4,d3
		move.w	d3,(a6)
		move.l	#$940000,d3
		move.w	d2,d3
		lsl.l	#8,d3
		move.w	#$9300,d3
		move.b	d2,d3
		move.l	d3,(a6)
		move.l	#$960000,d3
		move.w	d1,d3
		lsl.l	#8,d3
		move.w	#$9500,d3
		move.b	d1,d3
		move.l	d3,(a6)
		swap	d1
		move.w	#$9700,d3
		move.b	d1,d3
		move.w	d3,(a6)
		ori.l	#$40000080,d0
		swap	d0
		move.w	d0,(a6)
		swap	d0
		move.w	d0,-(sp)
		move.w	(sp)+,(a6)
		move.w	(vdpRegCache+2).w,(a6)
		andi.w	#$FF7F,d0
		move.l	d0,(a6)
		move.l	(a1),-4(a6)
		move.w	(vdpRegCache+$1E).w,(a6)
		movea.l	(sp)+,a1
		rts
; End of function dmaTransferToVramWithRewrite


; =============== S U B	R O U T	I N E =======================================

; Input	parameters:
; d0 - Dest address
; d1 - Source address
; d2 - DMA length

dmaCopyVram:				; CODE XREF: ROM:00000374j
		lea	(VDP_CONTROL).l,a6
		move.w	#$8F01,(a6)
		move.w	(vdpRegCache+2).w,d3
		bset	#4,d3
		move.w	d3,(a6)
		move.l	#$940000,d3
		move.w	d2,d3
		lsl.l	#8,d3
		move.w	#$9300,d3
		move.b	d2,d3
		move.l	d3,(a6)
		move.l	#$960000,d3
		move.w	d1,d3
		lsl.l	#8,d3
		move.w	#$9500,d3
		move.b	d1,d3
		move.l	d3,(a6)
		move.w	#$97C0,(a6)
		ori.w	#$C0,d0	; 'À'
		move.l	d0,(a6)

dmaWaitLoop:				; CODE XREF: dmaCopyVram+48j
		move.w	(a6),d3		; Wait for DMA to finish
		btst	#1,d3
		bne.s	dmaWaitLoop
		move.w	(vdpRegCache+2).w,(a6)
		move.w	#$8F02,(a6)
		rts
; End of function dmaCopyVram


; =============== S U B	R O U T	I N E =======================================


readFromVram:
		move.l	d0,(VDP_CONTROL).l

loc_C22:				; CODE XREF: readFromVram+Cj
		move.w	(VDP_DATA).l,(a2)+
		dbf	d1,loc_C22
		rts
; End of function readFromVram


; =============== S U B	R O U T	I N E =======================================

; Inputs:
; d0: VDP-formatted address
; d1: Column count
; d2: Line count
; a1: Data source

sub_C2E:				; CODE XREF: ROM:000002C4j
					; sub_1CFA+70p	...
		lea	(VDP_DATA).l,a5
		move.w	#0,-(sp)
		move.w	(vdpLineIncrement).w,-(sp)

loc_C3C:				; CODE XREF: sub_C2E+1Cj
		move.l	d0,4(a5)
		move.w	d1,d3

loc_C42:				; CODE XREF: sub_C2E+16j
		move.w	(a1)+,(a5)
		dbf	d3,loc_C42
		add.l	(sp),d0
		dbf	d2,loc_C3C
		addq.w	#4,sp
		rts
; End of function sub_C2E


; =============== S U B	R O U T	I N E =======================================

; Inputs:
; d0: VDP-formatted address
; d1: Columns
; d2: Lines
; d3: Template word
; a1: Source data

sub_C52:				; CODE XREF: ROM:000002C8j
		lea	(VDP_DATA).l,a5
		move.w	#0,-(sp)
		move.w	(vdpLineIncrement).w,-(sp)

loc_C60:				; CODE XREF: sub_C52+1Ej
		move.l	d0,4(a5)
		move.w	d1,d4

loc_C66:				; CODE XREF: sub_C52+18j
		move.b	(a1)+,d3
		move.w	d3,(a5)
		dbf	d4,loc_C66
		add.l	(sp),d0
		dbf	d2,loc_C60
		addq.w	#4,sp
		rts
; End of function sub_C52


; =============== S U B	R O U T	I N E =======================================

; Inputs:
; d0: VDP-formatted address
; d1: Columns
; d2: Lines
; d3: OR mask
; a1: Source data

sub_C78:				; CODE XREF: sub_5764+60p
		lea	(VDP_DATA).l,a5
		move.w	#0,-(sp)
		move.w	(vdpLineIncrement).w,-(sp)

loc_C86:				; CODE XREF: sub_C78+20j
		move.l	d0,4(a5)
		move.w	d1,d5

loc_C8C:				; CODE XREF: sub_C78+1Aj
		move.w	(a1)+,d4
		or.w	d3,d4
		move.w	d4,(a5)
		dbf	d5,loc_C8C
		add.l	(sp),d0
		dbf	d2,loc_C86
		addq.w	#4,sp
		rts
; End of function sub_C78


; =============== S U B	R O U T	I N E =======================================


sub_CA0:				; CODE XREF: ROM:0000036Cj
		lea	(VDP_DATA).l,a5
		move.w	#0,-(sp)
		move.w	(vdpLineIncrement).w,-(sp)

loc_CAE:				; CODE XREF: sub_CA0+1Ej
		move.l	d0,4(a5)
		move.w	d1,d4

loc_CB4:				; CODE XREF: sub_CA0+18j
		move.w	d3,(a5)
		addq.w	#1,d3
		dbf	d4,loc_CB4
		add.l	(sp),d0
		dbf	d2,loc_CAE
		addq.w	#4,sp
		rts
; End of function sub_CA0


; =============== S U B	R O U T	I N E =======================================


sub_CC6:				; CODE XREF: ROM:00000370j
		lea	(VDP_DATA).l,a5
		move.w	#0,-(sp)
		move.w	(vdpLineIncrement).w,-(sp)
		sub.w	d1,d3
		sub.w	d1,d3
		subq.w	#2,d3

loc_CDA:				; CODE XREF: sub_CC6+24j
		move.l	d0,4(a5)
		move.w	d1,d4

loc_CE0:				; CODE XREF: sub_CC6+1Cj
		move.w	(a1)+,(a5)
		dbf	d4,loc_CE0
		adda.w	d3,a1
		add.l	(sp),d0
		dbf	d2,loc_CDA
		addq.w	#4,sp
		rts
; End of function sub_CC6


; =============== S U B	R O U T	I N E =======================================


sub_CF2:				; CODE XREF: ROM:000002CCj
					; sub_1CFA+11Ap ...
		lea	(VDP_DATA).l,a5
		move.w	#0,-(sp)
		move.w	(vdpLineIncrement).w,-(sp)

loc_D00:				; CODE XREF: sub_CF2+1Cj
		move.l	d0,4(a5)
		move.w	d1,d5

loc_D06:				; CODE XREF: sub_CF2+16j
		move.w	d3,(a5)
		dbf	d5,loc_D06
		add.l	(sp),d0
		dbf	d2,loc_D00
		addq.w	#4,sp
		rts
; End of function sub_CF2


; =============== S U B	R O U T	I N E =======================================


displayOn:				; CODE XREF: ROM:000002D8j
					; checkRegion+3Cp ...
		bset	#6,(vdpRegCache+3).w
		bra.s	loc_D36
; ---------------------------------------------------------------------------

displayBlack:				; CODE XREF: ROM:00000384j
		move.l	#$C0000000,(VDP_CONTROL).l
		move.w	#0,(VDP_DATA).l

displayOff:				; CODE XREF: ROM:000002DCj sub_1CFA+4p ...
		bclr	#6,(vdpRegCache+3).w

loc_D36:				; CODE XREF: displayOn+6j
		move.w	(vdpRegCache+2).w,(VDP_CONTROL).l
		rts
; End of function displayOn


; =============== S U B	R O U T	I N E =======================================


loadPalettesToBuffer:			; CODE XREF: ROM:000002E4j
					; sub_1CFA+38p	...
		bset	#0,(vdpUpdateFlags).w

loadPalettesNoUpdate:			; CODE XREF: ROM:000002E0j
					; sub_68C4+46p
		move.l	a3,-(sp)
		moveq	#0,d0
		move.b	(a1)+,d0
		lea	(paletteBuffer0).w,a3
		adda.w	d0,a3
		move.b	(a1)+,d0

loc_D54:				; CODE XREF: loadPalettesToBuffer+16j
		move.w	(a1)+,(a3)+
		dbf	d0,loc_D54
		movea.l	(sp)+,a3
		rts
; End of function loadPalettesToBuffer


; =============== S U B	R O U T	I N E =======================================


dmaTransferPalettes:			; CODE XREF: ROM:000002E8j
					; vblankHandler+Ep ...
		bclr	#0,(vdpUpdateFlags).w
		beq.s	locret_DC2
		lea	(VDP_CONTROL).l,a4
		move.w	(vdpRegCache+2).w,d4
		bset	#4,d4
		move.w	d4,(a4)
		move	sr,-(sp)
		m_disableInterrupts
		m_z80RequestBus
		move.l	#$94009340,(a4)
		move.l	#$96FD95C0,(a4)
		move.w	#$977F,(a4)
		move.w	#$C000,(a4)
		move.w	#$80,-(sp) ; '€'

		m_z80WaitForBus

		move.w	(sp)+,(a4)
		m_z80ReleaseBus
		move.w	(vdpRegCache+2).w,(a4)
		move.l	#$C0000000,(a4)
		move.w	(paletteBuffer0).w,-4(a4)
		move	(sp)+,sr

locret_DC2:				; CODE XREF: dmaTransferPalettes+6j
		rts
; End of function dmaTransferPalettes


; =============== S U B	R O U T	I N E =======================================

; Input:
; d0: Color offset
; d1: Color count

fadeOutColors:				; CODE XREF: ROM:00000388j
		movem.l	d0-d5/a0,-(sp)
		lea	(paletteBuffer0).w,a0
		adda.w	d0,a0
		moveq	#0,d0

loc_DD0:				; CODE XREF: fadeOutColors+36j
		moveq	#$E,d2
		move.w	(a0),d3
		move.w	d3,d4
		and.b	d2,d4
		beq.s	loc_DDC
		subq.w	#2,d3

loc_DDC:				; CODE XREF: fadeOutColors+14j
		move.w	#$E0,d2	; 'à'
		move.w	d3,d4
		and.b	d2,d4
		beq.s	loc_DEA
		subi.w	#$20,d3	; ' '

loc_DEA:				; CODE XREF: fadeOutColors+20j
		move.w	#$E00,d2
		and.w	d2,d4
		beq.s	loc_DF6
		subi.w	#$200,d3

loc_DF6:				; CODE XREF: fadeOutColors+2Cj
		move.w	d3,(a0)+
		or.w	d3,d0
		dbf	d1,loc_DD0
		bset	#0,(vdpUpdateFlags).w
		tst.w	d0
		movem.l	(sp)+,d0-d5/a0
		rts
; End of function fadeOutColors


; =============== S U B	R O U T	I N E =======================================


sub_E0C:				; CODE XREF: ROM:00000390j
		move.b	(a1)+,(byte_FFFFFE46).w
		move.b	(a1)+,(byte_FFFFFE47).w
		move.l	a1,(dword_FFFFFE4A).w
		move.w	#$E,(word_FFFFFE48).w
		rts
; End of function sub_E0C


; =============== S U B	R O U T	I N E =======================================


sub_E20:				; CODE XREF: ROM:0000038Cj
		movem.l	d0-d4/a0-a1,-(sp)
		moveq	#0,d0
		move.b	(byte_FFFFFE46).w,d0
		lea	(paletteBuffer0).w,a1
		adda.w	d0,a1
		move.b	(byte_FFFFFE47).w,d0
		movea.l	(dword_FFFFFE4A).w,a0

loc_E38:				; CODE XREF: sub_E20+4Aj
		move.w	(word_FFFFFE48).w,d1
		move.w	(a0)+,d2
		move.w	d2,d3
		andi.w	#$E,d3
		sub.w	d1,d3
		bpl.s	loc_E4A
		moveq	#0,d3

loc_E4A:				; CODE XREF: sub_E20+26j
		asl.w	#4,d1
		move.w	d2,d4
		andi.w	#$E0,d4	; 'à'
		sub.w	d1,d4
		bpl.s	loc_E58
		moveq	#0,d4

loc_E58:				; CODE XREF: sub_E20+34j
		asl.w	#4,d1
		andi.w	#$E00,d2
		sub.w	d1,d2
		bpl.s	loc_E64
		moveq	#0,d2

loc_E64:				; CODE XREF: sub_E20+40j
		or.w	d4,d3
		or.w	d3,d2
		move.w	d2,(a1)+
		dbf	d0,loc_E38
		tst.w	(word_FFFFFE48).w
		beq.s	loc_E78
		subq.w	#2,(word_FFFFFE48).w

loc_E78:				; CODE XREF: sub_E20+52j
		bset	#0,(vdpUpdateFlags).w
		movem.l	(sp)+,d0-d4/a0-a1
		rts
; End of function sub_E20


; =============== S U B	R O U T	I N E =======================================

; Nemesis decompressor
	include "compression\nemesis.asm"

; =============== S U B	R O U T	I N E =======================================

loadZ80Prg:				; CODE XREF: setupGenHardware+8p
					; ROM:00000698p
		lea	(Z80_BUSREQ).l,a4
		move	sr,-(sp)
		m_disableInterrupts
		move.w	#$100,(a4)
		move.w	#$100,$100(a4)

loc_FD6:				; CODE XREF: loadZ80Prg+1Aj
		btst	#0,(a4)
		bne.s	loc_FD6
		lea	(Z80_RAM_Base0).l,a6
		lea	(Z80_PRG_Base0).l,a5
		move.w	#3231,d7

loc_FEC:				; CODE XREF: loadZ80Prg+2Ej
		move.b	(a5)+,(a6)+
		dbf	d7,loc_FEC
		lea	(Z80_RAM_Base1).l,a6
		lea	(Z80_PRG_Base1).l,a5
		move.w	#377,d7

loc_1002:				; CODE XREF: loadZ80Prg+44j
		move.b	(a5)+,(a6)+
		dbf	d7,loc_1002
		lea	(Z80_RAM_Base2).l,a6
		lea	(Z80_PRG_Base2).l,a5
		move.w	#1209,d7

loc_1018:				; CODE XREF: loadZ80Prg+5Aj
		move.b	(a5)+,(a6)+
		dbf	d7,loc_1018
		move.w	#0,$100(a4)
		move.w	#0,(a4)
		move.w	#$100,$100(a4)
		move	(sp)+,sr
		rts
; End of function loadZ80Prg


; =============== S U B	R O U T	I N E =======================================


loadZ80Prg0:				; CODE XREF: sub_68C4+A6p
		lea	(Z80_BUSREQ).l,a4
		move	sr,-(sp)
		m_disableInterrupts
		move.w	#$100,(a4)
		move.w	#$100,$100(a4)

loc_1048:				; CODE XREF: loadZ80Prg0+1Aj
		btst	#0,(a4)
		bne.s	loc_1048
		lea	(Z80_RAM_Base0).l,a6
		lea	(Z80_PRG_Base0).l,a5
		move.w	#377,d7

loc_105E:				; CODE XREF: loadZ80Prg0+2Ej
		move.b	(a5)+,(a6)+
		dbf	d7,loc_105E
		move.w	#0,$100(a4)
		move.w	#0,(a4)
		move.w	#$100,$100(a4)
		move	(sp)+,sr
		rts
; End of function loadZ80Prg0


; =============== S U B	R O U T	I N E =======================================


sub_1078:				; CODE XREF: sub_68C4+A2p
		move	sr,-(sp)
		m_disableInterrupts
		m_z80RequestBus

loc_1086:				; CODE XREF: sub_1078+10j
		move.b	(a1)+,(a0)+
		dbf	d0,loc_1086
		m_z80ReleaseBus
		move	(sp)+,sr
		rts
; End of function sub_1078


; =============== S U B	R O U T	I N E =======================================


sub_1098:				; CODE XREF: sub_1CFA+8p sub_30C2+18p	...
		move.b	#$E3,d7

loc_109C:				; CODE XREF: sub_1CFA+478p
					; sub_21F4+F2p	...
		move	sr,-(sp)
		m_disableInterrupts
		m_z80RequestBus

loc_10AA:				; CODE XREF: sub_1098+1Aj
		btst	#0,(Z80_BUSREQ).l
		bne.s	loc_10AA
		move.b	d7,(byte_A01C0A).l
		m_z80ReleaseBus
		move	(sp)+,sr
		rts
; End of function sub_1098


; =============== S U B	R O U T	I N E =======================================


readJoypads:				; CODE XREF: ROM:00000298j
					; altVblankHandler:loc_962p
		m_z80RequestBus
		m_z80WaitForBus

		bsr.s	readJoypadsInternal

		m_z80ReleaseBus
		rts
; End of function readJoypads


; =============== S U B	R O U T	I N E =======================================


readJoypadsInternal:			; CODE XREF: readJoypads+12p
		lea	(joy1Down).w,a5
		lea	(JOYDATA1).l,a6
		bsr.w	readSingleJoypad
		addq.w	#2,a6

readSingleJoypad:			; CODE XREF: readJoypadsInternal+Ap
					; sub_11D8+6Ap	...
		move.b	#0,(a6)
		nop
		nop
		move.b	(a6),d7
		asl.b	#2,d7
		move.b	#$40,(a6) ; '@'
		andi.w	#$C0,d7	; 'À'
		move.b	(a6),d6
		andi.w	#$3F,d6	; '?'
		or.b	d6,d7
		not.b	d7
		move.b	(a5),d6
		eor.b	d7,d6
		move.b	d7,(a5)+
		and.b	d7,d6
		move.b	d6,(a5)+
		rts
; End of function readJoypadsInternal


; =============== S U B	R O U T	I N E =======================================


setupJoypads:
		moveq	#$40,d7
		move.b	d7,(JOYCTRL1).l
		move.b	d7,(JOYCTRL2).l
		move.b	d7,(JOYCTRL3).l
		rts
; End of function setupJoypads


; =============== S U B	R O U T	I N E =======================================

; Input	parameters:
; a6 - JOYDATA1

sub_1134:				; CODE XREF: ROM:0000029Cj sub_118C+6p ...
		movem.l	d1-d3,-(sp)
		move	sr,-(sp)
		m_disableInterrupts
		m_z80RequestBus
		m_z80WaitForBus

		moveq	#$40,d3	; '@'
		move.b	d3,6(a6)
		moveq	#0,d7
		move.b	d3,(a6)
		bsr.s	sub_1174
		move.b	#0,(a6)
		add.w	d7,d7
		bsr.s	sub_1174
		m_z80ReleaseBus
		move	(sp)+,sr
		movem.l	(sp)+,d1-d3
		rts
; End of function sub_1134


; =============== S U B	R O U T	I N E =======================================


sub_1174:				; CODE XREF: sub_1134+26p sub_1134+2Ep
		move.b	(a6),d2
		move.b	d2,d3
		andi.b	#$C,d2
		beq.s	loc_1180
		addq.w	#1,d7

loc_1180:				; CODE XREF: sub_1174+8j
		add.w	d7,d7
		andi.w	#3,d3
		beq.s	locret_118A
		addq.w	#1,d7

locret_118A:				; CODE XREF: sub_1174+12j
		rts
; End of function sub_1174


; =============== S U B	R O U T	I N E =======================================


sub_118C:				; CODE XREF: ROM:0000069Cp
					; vblankHandler:loc_926p
		lea	(JOYDATA1).l,a6
		bsr.s	sub_1134
		cmp.b	(byte_FFFFFE18).w,d7
		beq.s	loc_11AE
		move.b	d7,(byte_FFFFFE18).w
		cmpi.b	#7,d7
		beq.s	loc_11AA
		cmpi.b	#3,d7
		bne.s	loc_11AE

loc_11AA:				; CODE XREF: sub_118C+16j
		moveq	#0,d1
		bsr.s	sub_11CC

loc_11AE:				; CODE XREF: sub_118C+Cj sub_118C+1Cj
		addq.w	#2,a6
		bsr.s	sub_1134
		cmp.b	(byte_FFFFFE19).w,d7
		beq.s	locret_11D6
		move.b	d7,(byte_FFFFFE19).w
		moveq	#1,d1
		cmpi.b	#7,d7
		beq.s	sub_11CC
		cmpi.b	#3,d7
		beq.s	sub_11CC
		rts
; End of function sub_118C


; =============== S U B	R O U T	I N E =======================================


sub_11CC:				; CODE XREF: sub_118C+20p sub_118C+36j ...
		moveq	#0,d0
		bsr.w	sub_12F4
		bcc.s	locret_11D6
		nop

locret_11D6:				; CODE XREF: sub_118C+2Aj sub_11CC+6j
		rts
; End of function sub_11CC


; =============== S U B	R O U T	I N E =======================================


sub_11D8:				; CODE XREF: vblankHandler+26p
		cmpi.b	#7,(byte_FFFFFE18).w
		bne.s	loc_1218
		lea	(joy1Down).w,a1
		move.l	a1,-(sp)
		lea	(unk_FFFFFE0C).w,a2
		moveq	#0,d1
		bsr.w	sub_1484
		movea.l	(sp)+,a3
		cmpa.l	a3,a1
		bne.s	loc_11F8
		clr.w	(a1)

loc_11F8:				; CODE XREF: sub_11D8+1Cj
		lea	(unk_FFFFFE1A).w,a3
		moveq	#3,d0

loc_11FE:				; CODE XREF: sub_11D8+2Aj
		cmpi.b	#2,(a3)+
		dbeq	d0,loc_11FE
		bne.s	loc_1264
		lea	(unk_FFFFFE0C).w,a5
		lea	(joy2Down).w,a0
		bsr.w	sub_12CC
		bra.w	loc_12BA
; ---------------------------------------------------------------------------

loc_1218:				; CODE XREF: sub_11D8+6j
		cmpi.b	#3,(byte_FFFFFE18).w
		beq.s	loc_1250
		lea	(joy1Down).w,a5
		lea	(JOYDATA1).l,a6
		m_z80RequestBus

loc_1232:				; CODE XREF: sub_11D8+62j
		btst	#0,(Z80_BUSREQ).l
		bne.s	loc_1232
		move.b	#$40,6(a6) ; '@'
		bsr.w	readSingleJoypad
		m_z80ReleaseBus
		bra.s	loc_1264
; ---------------------------------------------------------------------------

loc_1250:				; CODE XREF: sub_11D8+46j
		lea	(unk_FFFFFE00).w,a5
		moveq	#0,d1
		moveq	#1,d0
		bsr.w	sub_12F4
		bcs.s	loc_12C4
		lea	(joy1Down).w,a0
		bsr.s	sub_12CC

loc_1264:				; CODE XREF: sub_11D8+2Ej sub_11D8+76j
		cmpi.b	#3,(byte_FFFFFE19).w
		beq.s	loc_12A6
		cmpi.b	#7,(byte_FFFFFE19).w
		bne.s	loc_1276
		bra.s	loc_12BA
; ---------------------------------------------------------------------------

loc_1276:				; CODE XREF: sub_11D8+9Aj
		lea	(joy2Down).w,a5
		lea	(JOYDATA2).l,a6
		m_z80RequestBus

loc_1288:				; CODE XREF: sub_11D8+B8j
		btst	#0,(Z80_BUSREQ).l
		bne.s	loc_1288
		move.b	#$40,6(a6) ; '@'
		bsr.w	readSingleJoypad
		m_z80ReleaseBus
		bra.s	loc_12BA
; ---------------------------------------------------------------------------

loc_12A6:				; CODE XREF: sub_11D8+92j
		lea	(unk_FFFFFE0C).w,a5
		moveq	#1,d1
		moveq	#1,d0
		bsr.w	sub_12F4
		bcs.s	loc_12C8
		lea	(joy2Down).w,a0
		bsr.s	sub_12CC

loc_12BA:				; CODE XREF: sub_11D8+3Cj sub_11D8+9Cj ...
		m_z80ReleaseBus
		rts
; ---------------------------------------------------------------------------

loc_12C4:				; CODE XREF: sub_11D8+84j
		moveq	#0,d1
		bra.s	locret_12CA
; ---------------------------------------------------------------------------

loc_12C8:				; CODE XREF: sub_11D8+DAj
		moveq	#1,d1

locret_12CA:				; CODE XREF: sub_11D8+EEj
		rts
; End of function sub_11D8


; =============== S U B	R O U T	I N E =======================================


sub_12CC:				; CODE XREF: sub_11D8+38p sub_11D8+8Ap ...
		move.b	1(a5),d0
		andi.w	#3,d0
		bclr	#0,d0
		beq.s	loc_12DE
		bset	#6,d0

loc_12DE:				; CODE XREF: sub_12CC+Cj
		bclr	#1,d0
		beq.s	loc_12E8
		bset	#4,d0

loc_12E8:				; CODE XREF: sub_12CC+16j
		move.b	(a0),d1
		eor.b	d0,d1
		move.b	d0,(a0)+
		and.b	d0,d1
		move.b	d1,(a0)+
		rts
; End of function sub_12CC


; =============== S U B	R O U T	I N E =======================================


sub_12F4:				; CODE XREF: sub_11CC+2p sub_11D8+80p	...
		movem.l	d1-a6,-(sp)
		add.w	d1,d1
		lea	(JOYDATA1).l,a6
		adda.w	d1,a6
		andi.w	#7,d0
		add.w	d0,d0
		lea	word_1318(pc), a0
		adda.w	(a0,d0.w),a0
		jsr	(a0)
		movem.l	(sp)+,d1-a6
		rts
; End of function sub_12F4

; ---------------------------------------------------------------------------
word_1318:	dc.w 8			; DATA XREF: sub_12F4+14o
		dc.w $4C
		dc.w $166
		dc.w $166
		dc.w $3E3C
		dc.w $FF

; =============== S U B	R O U T	I N E =======================================


sub_1324:
		m_z80RequestBus
		m_z80WaitForBus

		move.b	#$60,6(a6) ; '`'
		bsr.w	loc_1452
		bcs.s	loc_1356
		move.b	#$40,(a6) ; '@'
		bsr.w	loc_1452
		bcs.s	loc_1356
		m_z80ReleaseBus
		rts
; ---------------------------------------------------------------------------

loc_1356:				; CODE XREF: sub_1324+1Cj sub_1324+26j
		m_z80ReleaseBus
		ori	#1,ccr
		rts
; End of function sub_1324

; ---------------------------------------------------------------------------
		dc.w $3E3C
		dc.w $FF
		dc.w $49D5

; =============== S U B	R O U T	I N E =======================================


sub_136A:
		m_z80RequestBus
		m_z80WaitForBus

		move.b	#$20,(a6) ; ' '
		move.b	#$60,6(a6) ; '`'
		move.b	#$60,(a6) ; '`'
		bsr.w	loc_1452
		bcs.s	sub_13E6
		move.b	#$20,(a6) ; ' '
		bsr.w	loc_1452
		bcs.s	sub_13E6
		btst	#2,d0
		bne.s	sub_13E6
		bsr.w	sub_1466
		bcs.s	sub_13E6
		bsr.w	sub_144E
		bcs.s	sub_13E6
		moveq	#2,d6

loc_13AE:				; CODE XREF: sub_136A+54j
		bsr.w	sub_1466
		bcs.s	sub_13E6
		move.b	(a6),(a4)+
		bsr.w	sub_144E
		bcs.s	sub_13E6
		move.b	(a6),(a4)+
		dbf	d6,loc_13AE
		moveq	#2,d6

loc_13C4:				; CODE XREF: sub_136A+66j
		bsr.w	sub_1466
		bcs.s	sub_13E6
		bsr.w	sub_144E
		bcs.s	sub_13E6
		dbf	d6,loc_13C4
		move.b	#$60,(a6) ; '`'
		bsr.w	loc_1452
		m_z80ReleaseBus
		bra.s	sub_13FC
; End of function sub_136A


; =============== S U B	R O U T	I N E =======================================


sub_13E6:				; CODE XREF: sub_136A+24j sub_136A+2Ej ...
		move.b	#$60,(a6) ; '`'
		m_z80ReleaseBus
		clr.l	6(a5)
		ori	#1,ccr
		rts
; End of function sub_13E6


; =============== S U B	R O U T	I N E =======================================


sub_13FC:				; CODE XREF: sub_136A+7Aj sub_157C+1Ap
		lea	(a5),a4
		moveq	#0,d0
		moveq	#0,d1
		movep.w	2(a4),d0
		movep.w	3(a4),d1
		andi.w	#$F0F,d0
		andi.w	#$F0F,d1
		lsl.w	#4,d0
		or.w	d1,d0
		move.w	d0,d1
		andi.w	#$FF,d1
		lsr.w	#8,d0
		btst	#1,(a4)
		beq.s	loc_1428
		subi.w	#$100,d1

loc_1428:				; CODE XREF: sub_13FC+26j
		btst	#3,(a4)
		beq.s	loc_1430
		clr.b	d1

loc_1430:				; CODE XREF: sub_13FC+30j
		neg.w	d1
		move.w	d1,8(a4)
		btst	#0,(a4)
		beq.s	loc_1440
		subi.w	#$100,d0

loc_1440:				; CODE XREF: sub_13FC+3Ej
		btst	#2,(a4)
		beq.s	loc_1448
		clr.b	d0

loc_1448:				; CODE XREF: sub_13FC+48j
		move.w	d0,6(a4)
		rts
; End of function sub_13FC


; =============== S U B	R O U T	I N E =======================================


sub_144E:				; CODE XREF: sub_136A+3Cp sub_136A+4Cp ...
		move.b	#$20,(a6) ; ' '

loc_1452:				; CODE XREF: sub_1324+18p sub_1324+22p ...
		andi	#$FE,ccr ; 'þ'

loc_1456:				; CODE XREF: sub_144E+Ej
		move.b	(a6),d0
		btst	#4,d0
		dbne	d7,loc_1456
		beq.s	loc_147E
		move.b	(a6),d0
		rts
; End of function sub_144E


; =============== S U B	R O U T	I N E =======================================


sub_1466:				; CODE XREF: sub_136A+36p
					; sub_136A:loc_13AEp ...
		move.b	#0,(a6)
		andi	#$FE,ccr ; 'þ'

loc_146E:				; CODE XREF: sub_1466+Ej
		move.b	(a6),d0
		btst	#4,d0
		dbeq	d7,loc_146E
		bne.s	loc_147E
		move.b	(a6),d0
		rts
; ---------------------------------------------------------------------------

loc_147E:				; CODE XREF: sub_144E+12j sub_1466+12j
		ori	#1,ccr
		rts
; End of function sub_1466


; =============== S U B	R O U T	I N E =======================================


sub_1484:				; CODE XREF: sub_11D8+14p
		movem.l	d1-a0/a3-a6,-(sp)
		lea	(unk_FFFFFE1A).w,a0
		add.w	d1,d1
		lea	(JOYDATA1).l,a6
		adda.w	d1,a6
		m_z80RequestBus
		m_z80WaitForBus

		move.b	#$20,(a6) ; ' '
		move.b	#$60,6(a6) ; '`'
		move.w	#$FF,d7
		btst	#4,(a6)
		beq.w	loc_1510
		bsr.s	sub_1466
		bcs.s	loc_1510
		andi.b	#$F,d0
		bsr.s	sub_144E
		bcs.s	loc_1510
		andi.b	#$F,d0
		bsr.s	sub_1466
		bcs.s	loc_1510
		move.b	d0,(a0)+
		bsr.w	sub_144E
		bcs.s	loc_1510
		move.b	d0,(a0)+
		bsr.s	sub_1466
		bcs.s	loc_1510
		move.b	d0,(a0)+
		moveq	#$20,d6	; ' '
		bsr.w	sub_144E
		bcs.s	loc_1510
		move.b	d0,(a0)+
		andi.l	#$F0F0F0F,-(a0)
		bsr.s	sub_1522
		bsr.s	sub_1522
		bsr.s	sub_1522
		bsr.s	sub_1522
		move.b	#$60,(a6) ; '`'
		bsr.w	loc_1452
		m_z80ReleaseBus
		movem.l	(sp)+,d1-a0/a3-a6
		rts
; ---------------------------------------------------------------------------

loc_1510:				; CODE XREF: sub_1484+36j sub_1484+3Cj ...
		move.b	#$60,(a6) ; '`'
		m_z80ReleaseBus
		movem.l	(sp)+,d1-a0/a3-a6
		rts
; End of function sub_1484


; =============== S U B	R O U T	I N E =======================================


sub_1522:				; CODE XREF: sub_1484+6Ep sub_1484+70p ...
		moveq	#0,d0
		move.b	(a0)+,d0
		cmpi.b	#2,d0
		bhi.s	locret_1540
		add.w	d0,d0
		add.w	d0,d0
		jmp	loc_1534(pc,d0.w)
; ---------------------------------------------------------------------------

loc_1534:
		bra.w	sub_154C
; ---------------------------------------------------------------------------
		bra.w	loc_1542
; ---------------------------------------------------------------------------
		bra.w	sub_157C
; ---------------------------------------------------------------------------

locret_1540:				; CODE XREF: sub_1522+8j
		rts
; ---------------------------------------------------------------------------

loc_1542:				; CODE XREF: sub_1522+16j
		bsr.s	sub_154C
		bsr.w	sub_15B2
		bcs.s	loc_1510
		rts
; End of function sub_1522


; =============== S U B	R O U T	I N E =======================================


sub_154C:				; CODE XREF: sub_1522:loc_1534j
					; sub_1522:loc_1542p
		bsr.w	sub_15B2
		bcs.s	loc_1510
		andi.w	#$F,d0
		move.w	d0,d1
		bsr.w	sub_15B2
		bcs.s	loc_1510
		andi.w	#$F,d0
		asl.w	#4,d0
		or.b	d0,d1
		not.b	d1
		cmpa.l	#$FFFFFE20,a1
		bhi.s	locret_157A
		move.b	(a1),d0
		eor.b	d1,d0
		move.b	d1,(a1)+
		and.b	d1,d0
		move.b	d0,(a1)+

locret_157A:				; CODE XREF: sub_154C+22j
		rts
; End of function sub_154C


; =============== S U B	R O U T	I N E =======================================


sub_157C:				; CODE XREF: sub_1522+1Aj
		moveq	#5,d1
		cmpa.l	#$FFFFFE0C,a2
		bhi.s	loc_15A0
		lea	(a2),a4

loc_1588:				; CODE XREF: sub_157C+14j
		bsr.w	sub_15B2
		bcs.s	loc_1510
		move.b	d0,(a4)+
		dbf	d1,loc_1588
		lea	(a2),a5
		bsr.w	sub_13FC
		lea	$C(a2),a2
		rts
; ---------------------------------------------------------------------------

loc_15A0:				; CODE XREF: sub_157C+8j sub_157C+2Cj
		bsr.w	sub_15B2
		bcs.w	loc_1510
		dbf	d1,loc_15A0
		rts
; End of function sub_157C


; =============== S U B	R O U T	I N E =======================================


sub_15AE:
		move.b	(a6),d0
		rts
; End of function sub_15AE


; =============== S U B	R O U T	I N E =======================================


sub_15B2:				; CODE XREF: sub_1522+22p sub_154Cp ...
		bchg	#5,d6
		beq.w	sub_144E
		bra.w	sub_1466
; End of function sub_15B2


; =============== S U B	R O U T	I N E =======================================


clearCommRegisters:			; CODE XREF: ROM:00000340j sub_5F0+14p ...
		moveq	#0,d0
		lea	(GA_COMM_MAINFLAGS).l,a6
		move.b	d0,(a6)
		addq.w	#2,a6
		move.l	d0,(a6)+
		move.l	d0,(a6)+
		move.l	d0,(a6)+
		move.l	d0,(a6)+
		lea	(mainCommFlags).w,a6
		move.w	d0,(a6)+
		move.l	d0,(a6)+
		move.l	d0,(a6)+
		move.l	d0,(a6)+
		move.l	d0,(a6)+
		rts
; End of function clearCommRegisters


; =============== S U B	R O U T	I N E =======================================


sub_15E2:				; CODE XREF: sub_15E2+8j
		btst	#0,(GA_COMM_SUBFLAGS).l
		beq.s	sub_15E2
		rts
; End of function sub_15E2


; =============== S U B	R O U T	I N E =======================================


sub_15EE:				; CODE XREF: ROM:00000344j
					; vblankHandler+4p ...
		lea	(GA_COMM_MAINFLAGS).l,a4
		bset	#0,(a4)
		lea	(mainCommFlags).w,a6
		bclr	#1,(a6)
		lea	(GA_RESET_HALT).l,a5
		btst	#0,(a5)
		beq.s	locret_1656
		btst	#1,(a5)
		bne.s	locret_1656
		addq.w	#1,a4
		btst	#0,(a4)
		beq.s	loc_1648
		bset	#1,(a6)
		bchg	#0,(a6)+
		beq.s	loc_162C

loc_1624:				; CODE XREF: sub_15EE+3Aj
		btst	#1,(a4)
		bne.s	loc_1624
		bra.s	loc_1632
; ---------------------------------------------------------------------------

loc_162C:				; CODE XREF: sub_15EE+34j sub_15EE+42j
		btst	#1,(a4)
		beq.s	loc_162C

loc_1632:				; CODE XREF: sub_15EE+3Cj
		move.b	(a4),(a6)+
		addq.w	#1,a4
		moveq	#3,d0

loc_1638:				; CODE XREF: sub_15EE+4Ej
		move.l	(a6),(a4)+
		clr.l	(a6)+
		dbf	d0,loc_1638
		move.l	(a4)+,(a6)+
		move.l	(a4)+,(a6)+
		move.l	(a4)+,(a6)+
		move.l	(a4)+,(a6)+

loc_1648:				; CODE XREF: sub_15EE+2Aj
		bset	#0,-1(a5)	; Send INT2 to sub-CPU
		bset	#1,(GA_COMM_MAINFLAGS).l

locret_1656:				; CODE XREF: sub_15EE+1Cj sub_15EE+22j
		rts
; End of function sub_15EE


; =============== S U B	R O U T	I N E =======================================


sub_1658:				; CODE XREF: ROM:00000348j
					; vblankHandler+2Ep
		bclr	#1,(GA_COMM_MAINFLAGS).l
		lea	(mainCommFlags).w,a4
		btst	#1,(a4)
		beq.s	locret_16C2
		btst	#2,1(a4)
		beq.s	locret_16C2
		bset	#2,(a4)
		lea	((subCommData+4)).w,a0
		move.w	(a0)+,d0
		move.w	d0,(byte_FFFFFE3A).w
		andi.w	#$A000,d0
		bne.s	locret_16C2
		move.b	5(a0),(unk_FFFFFE57).w
		btst	#3,1(a4)
		beq.s	loc_16B0
		btst	#5,(a4)
		beq.s	locret_16C2
		move.w	(a0)+,(unk_FFFFFE3C).w
		addq.w	#4,a0
		move.w	(a0)+,(unk_FFFFFE3E).w
		move.b	(a0)+,d0
		move.b	d0,(byte_FFFFFE43).w
		bset	#6,(a4)
		rts
; ---------------------------------------------------------------------------

loc_16B0:				; CODE XREF: sub_1658+3Aj
		move.w	(a0)+,(word_FFFFFE44).w
		addq.w	#4,a0
		move.w	(a0)+,(word_FFFFFE40).w
		move.b	(a0)+,(byte_FFFFFE42).w
		bset	#5,(a4)

locret_16C2:				; CODE XREF: sub_1658+10j sub_1658+18j ...
		rts
; End of function sub_1658


; =============== S U B	R O U T	I N E =======================================


sub_16C4:				; CODE XREF: ROM:000006B6p sub_1730+Cp ...
		bclr	#6,(mainCommFlags).w
		bclr	#5,(mainCommFlags).w
		rts
; End of function sub_16C4


; =============== S U B	R O U T	I N E =======================================


sub_16D2:				; CODE XREF: ROM:0000034Cj sub_16D2+8j ...
		btst	#6,(GA_COMM_SUBFLAGS).l
		beq.s	sub_16D2
		bclr	#2,(GA_COMM_MAINFLAGS).l
		rts
; End of function sub_16D2


; =============== S U B	R O U T	I N E =======================================


sub_16E6:				; CODE XREF: loadPrgFromWordRam+24p
		bclr	#0,(byte_FFFFFDDD).w
		bset	#7,(GA_COMM_MAINFLAGS).l
		bset	#GA_MEM_MODE_DMNA,(GA_MEM_MODE).l
		rts
; End of function sub_16E6


; =============== S U B	R O U T	I N E =======================================


sub_16FE:				; CODE XREF: loadPrgFromWordRam+30p
		btst	#0,(byte_FFFFFDDD).w
		beq.s	loc_171A
		btst	#7,(GA_COMM_SUBFLAGS).l
		bne.s	loc_172A
		bclr	#0,(byte_FFFFFDDD).w
		or.w	d0,d0
		rts
; ---------------------------------------------------------------------------

loc_171A:				; CODE XREF: sub_16FE+6j
		btst	#7,(GA_COMM_SUBFLAGS).l
		beq.s	loc_172A
		bset	#0,(byte_FFFFFDDD).w

loc_172A:				; CODE XREF: sub_16FE+10j sub_16FE+24j
		ori	#1,ccr
		rts
; End of function sub_16FE


; =============== S U B	R O U T	I N E =======================================


sub_1730:				; CODE XREF: ROM:00000378j
					; DATA XREF: sub_4400+4o ...
		cmpi.w	#0,d0
		beq.s	loc_1742
		cmpi.w	#$12,d0
		bne.s	loc_1748
		bsr.w	sub_16C4
		bra.s	loc_1748
; ---------------------------------------------------------------------------

loc_1742:				; CODE XREF: sub_1730+4j
		moveq	#$FFFFFFFF,d1
		bsr.w	sub_183A

loc_1748:				; CODE XREF: sub_1730+Aj sub_1730+10j
		moveq	#0,d3
		move.b	byte_178C(pc,d0.w),d3
		move.b	byte_178D(pc,d0.w),d0
		bmi.s	loc_1778
		bne.s	loc_175C
		move.w	d3,(mainCommData).w
		rts
; ---------------------------------------------------------------------------

loc_175C:				; CODE XREF: sub_1730+24j
		cmpi.b	#1,d0
		beq.s	loc_1782
		move.w	d2,d0
		andi.l	#$F,d0
		swap	d0
		lsr.l	#4,d0
		or.w	d0,d1
		andi.w	#$FF0,d2
		lsl.w	#4,d2
		or.w	d2,d3

loc_1778:				; CODE XREF: sub_1730+22j
		swap	d3
		move.w	d1,d3
		move.l	d3,(mainCommData).w
		rts
; ---------------------------------------------------------------------------

loc_1782:				; CODE XREF: sub_1730+30j
		move.b	d3,d1
		swap	d1
		move.l	d1,(mainCommData).w
		rts
; End of function sub_1730

; ---------------------------------------------------------------------------
byte_178C:	dc.b $A
byte_178D:	dc.b 0
		dc.b 2
		dc.b 0
		dc.b 3
		dc.b 0
		dc.b 4
		dc.b 0
		dc.b 5
		dc.b 0
		dc.b 6
		dc.b 0
		dc.b 7
		dc.b 0
		dc.b 8
		dc.b 0
		dc.b 9
		dc.b 0
		dc.b $10
		dc.b $FF
		dc.b $11
		dc.b $FF
		dc.b $12
		dc.b $FF
		dc.b $13
		dc.b $FF
		dc.b $14
		dc.b 1
		dc.b $15
		dc.b $FF
		dc.b $16
		dc.b 1
		dc.b $17
		dc.b 1
		dc.b $18
		dc.b 1
		dc.b $20
		dc.b $FF
		dc.b $21
		dc.b $FF
		dc.b $80
		dc.b 0
		dc.b $81
		dc.b 0
		dc.b $82
		dc.b $FF
		dc.b $83
		dc.b $FF
		dc.b $85
		dc.b 2
		dc.b $86
		dc.b 2
		dc.b $87
		dc.b 0
		dc.b $89
		dc.b 0
		dc.b $8A
		dc.b 0
		dc.b $8B
		dc.b 0
		dc.b $8C
		dc.b $FF
		dc.b $8D
		dc.b 0
		dc.b $8F
		dc.b 0
		dc.b $90
		dc.b 0
		dc.b $91
		dc.b 0
		dc.b $92
		dc.b $FF
		dc.b $93
		dc.b $FF
		dc.b 0
		dc.b $FF
		dc.b $C0
		dc.b $FF
		dc.b $C1
		dc.b $FF
		dc.b $19
		dc.b $FF
		dc.b $C2
		dc.b $FF
		dc.b $C3
		dc.b $FF

; =============== S U B	R O U T	I N E =======================================


sub_17E2:				; CODE XREF: ROM:00000350j
		move.w	d0,(mainCommData).w
		move.w	d1,(mainCommData+2).w
		rts
; End of function sub_17E2


; =============== S U B	R O U T	I N E =======================================


sub_17EC:				; CODE XREF: ROM:00000354j
		move.w	d0,(mainCommData+8).w
		move.w	d1,(mainCommData+$A).w
		rts
; End of function sub_17EC


; =============== S U B	R O U T	I N E =======================================


sub_17F6:				; CODE XREF: ROM:00000358j
		move.w	d0,(mainCommData+$C).w
		move.w	d1,(mainCommData+$E).w
		rts
; End of function sub_17F6


; =============== S U B	R O U T	I N E =======================================


sub_1800:				; CODE XREF: ROM:0000035Cj
					; ROM:000005BCp ...
		cmpi.w	#1,d0
		bne.s	loc_180E
		bset	#2,(GA_COMM_MAINFLAGS).l

loc_180E:				; CODE XREF: sub_1800+4j
		move.w	d0,(mainCommData+4).w
		move.w	d1,(mainCommData+6).w
		rts
; End of function sub_1800


; =============== S U B	R O U T	I N E =======================================


sub_1818:				; CODE XREF: vblankHandler+32p
					; sub_2424p
		btst	#1,(mainCommFlags).w
		beq.s	locret_1830
		move.w	(subCommData).w,d0
		move.w	(subCommData+2).w,d1
		andi.w	#$FC,d0	; 'ü'
		jmp	loc_1832(pc,d0.w)
; ---------------------------------------------------------------------------

locret_1830:				; CODE XREF: sub_1818+6j
		rts
; End of function sub_1818

; ---------------------------------------------------------------------------

loc_1832:
		nop
		rts
; ---------------------------------------------------------------------------
		bra.w	*+4

; =============== S U B	R O U T	I N E =======================================


sub_183A:				; CODE XREF: ROM:00000542p
					; sub_1730+14p	...
		move.b	d1,(byte_FFFFFDDC).w
		rts
; End of function sub_183A


; =============== S U B	R O U T	I N E =======================================


sub_1840:				; CODE XREF: sub_21F4:loc_2264p
					; sub_329A+30p	...
		move.b	(byte_FFFFFDDC).w,d0
		rts
; End of function sub_1840


; =============== S U B	R O U T	I N E =======================================


sub_1846:				; CODE XREF: sub_21F4+E8p
					; sub_21F4:loc_2306p ...
		cmpi.b	#4,(byte_FFFFFDDC).w
		beq.s	locret_1854
		cmpi.b	#6,(byte_FFFFFDDC).w

locret_1854:				; CODE XREF: sub_1846+6j
		rts
; End of function sub_1846


; =============== S U B	R O U T	I N E =======================================


sub_1856:				; CODE XREF: sub_21F4+5Ep sub_329A+F8p ...
		cmpi.b	#$40,(byte_FFFFFE3A).w ; '@'
		beq.s	loc_1862
		tst.w	d0
		rts
; ---------------------------------------------------------------------------

loc_1862:				; CODE XREF: sub_1856+6j
		ori	#1,ccr
		rts
; End of function sub_1856


; =============== S U B	R O U T	I N E =======================================

; Copy sprite table from RAM ($FFF900) to VRAM ($B800)

dmaSendSpriteTable:			; CODE XREF: ROM:0000030Cj
					; sub_6AF0+12p
		btst	#0,(vblankCode).w
		beq.s	locret_18CC
		lea	(VDP_CONTROL).l,a4
		move.w	(vdpRegCache+2).w,d4
		bset	#4,d4
		move.w	d4,(a4)
		move	sr,-(sp)
		m_disableInterrupts
		m_z80RequestBus
		move.l	#$94019340,(a4)
		move.l	#$96FC9580,(a4)
		move.w	#$977F,(a4)
		move.w	#$7800,(a4)
		move.w	#$82,-(sp) ; '‚'

		m_z80WaitForBus

		move.w	(sp)+,(a4)
		m_z80ReleaseBus
		move.w	(vdpRegCache+2).w,(a4)
		move.l	#$78000002,(a4)
		move.w	(spriteTable).w,-4(a4)
		move	(sp)+,sr

locret_18CC:				; CODE XREF: dmaSendSpriteTable+6j
		rts
; End of function dmaSendSpriteTable


; =============== S U B	R O U T	I N E =======================================

; Inputs:
; d1: Joypad 0/1
; a1:

sub_18CE:				; CODE XREF: ROM:0000032Cj
					; sub_329A+50p	...
		move.l	a5,-(sp)
		move.w	(joy1Down).w,d1
		tst.w	d0
		beq.s	loc_18DC
		move.w	(joy2Down).w,d1

loc_18DC:				; CODE XREF: sub_18CE+8j
		lea	(byte_FFFFFE24).w,a5
		adda.w	d0,a5
		andi.b	#$F,d1
		bne.s	loc_18FA
		andi.w	#$F00,d1
		beq.s	loc_18FE
		subq.b	#1,(a5)
		bpl.s	loc_18FE
		move.b	#5,(a5)
		lsr.w	#8,d1
		bra.s	loc_18FE
; ---------------------------------------------------------------------------

loc_18FA:				; CODE XREF: sub_18CE+18j
		move.b	#$14,(a5)

loc_18FE:				; CODE XREF: sub_18CE+1Ej sub_18CE+22j ...
		move.b	d1,(a1)
		movea.l	(sp)+,a5
		rts
; End of function sub_18CE


; =============== S U B	R O U T	I N E =======================================


sub_1904:				; CODE XREF: ROM:00000310j
		lsr.l	#2,d0
		move.w	d0,d1
		swap	d0
		subq.w	#1,d1

loc_190C:				; CODE XREF: sub_1904+Aj sub_1904+Ej
		move.l	(a0)+,(a1)+
		dbf	d1,loc_190C
		dbf	d0,loc_190C
		jmp	(a2)
; End of function sub_1904


; =============== S U B	R O U T	I N E =======================================


writeTextToScreen:			; CODE XREF: ROM:0000031Cj
					; checkRegion+38p ...
		move.w	(fontTileOffset).w,d1
		lea	(VDP_DATA).l,a5

loc_1922:				; CODE XREF: writeTextToScreen+24j
		move.l	d0,4(a5)

loc_1926:				; CODE XREF: writeTextToScreen+1Aj
		moveq	#0,d2
		move.b	(a1)+,d2
		bmi.s	locret_193E
		beq.s	loc_1934
		add.w	d1,d2
		move.w	d2,(a5)
		bra.s	loc_1926
; ---------------------------------------------------------------------------

loc_1934:				; CODE XREF: writeTextToScreen+14j
		swap	d0
		add.w	(vdpLineIncrement).w,d0
		swap	d0
		bra.s	loc_1922
; ---------------------------------------------------------------------------

locret_193E:				; CODE XREF: writeTextToScreen+12j
		rts
; End of function writeTextToScreen


; =============== S U B	R O U T	I N E =======================================


loadDefaultFont:			; CODE XREF: ROM:00000328j
					; checkRegion+1Ap ...
		move.l	#$44000000,d0
		move.w	#0,(fontTileOffset).w
		move.l	#$11011,d1

loc_1952:				; CODE XREF: ROM:00000324j
					; sub_873A+80p
		move.l	d0,d2
		lea	(defaultFontData).l,a1
		move.w	#$60,d2	; '`'

loc_195E:				; CODE XREF: ROM:00000320j
					; sub_5FBE+18p	...
		asl.w	#2,d2
		subq.w	#1,d2
		lea	(VDP_DATA).l,a5
		move.l	d0,4(a5)
		move.l	d1,-(sp)

loc_196E:				; CODE XREF: loadDefaultFont+44j
		move.w	(a1)+,d1
		bsr.s	loc_198E
		bsr.s	sub_198C
		bsr.s	sub_198C
		bsr.s	sub_198C
		move.l	d3,(a5)
		bsr.s	loc_198E
		bsr.s	sub_198C
		bsr.s	sub_198C
		bsr.s	sub_198C
		move.l	d3,(a5)
		dbf	d2,loc_196E
		move.l	(sp)+,d1
		rts
; End of function loadDefaultFont


; =============== S U B	R O U T	I N E =======================================


sub_198C:				; CODE XREF: loadDefaultFont+32p
					; loadDefaultFont+34p ...

arg_0		=  4

		rol.l	#8,d3

loc_198E:				; CODE XREF: loadDefaultFont+30p
					; loadDefaultFont+3Ap
		rol.w	#2,d1
		move.w	d1,d4
		andi.w	#3,d4
		move.b	arg_0(sp,d4.w),d3
		rts
; End of function sub_198C


; =============== S U B	R O U T	I N E =======================================


sub_199C:				; CODE XREF: ROM:00000334j
					; sub_1CFA+39Cp ...
		lea	(VDP_DATA).l,a5
		move.w	d2,d6
		addq.w	#1,d6

loc_19A6:				; CODE XREF: sub_199C+24j
		move.w	d3,d5
		move.l	d0,4(a5)
		move.w	d1,d4

loc_19AE:				; CODE XREF: sub_199C+16j
		move.w	d5,(a5)
		add.w	d6,d5
		dbf	d4,loc_19AE
		addq.w	#1,d3
		swap	d0
		add.w	(vdpLineIncrement).w,d0
		swap	d0
		dbf	d2,loc_19A6
		rts
; End of function sub_199C


; =============== S U B	R O U T	I N E =======================================


randWithModulo:				; CODE XREF: ROM:00000338j
					; sub_5444+1Ep
		move.w	(prngState).w,d1
		muls.w	#$3619,d1
		addi.w	#$5D35,d1
		move.w	d1,(prngState).w
		muls.w	d0,d1
		swap	d0
		clr.w	d0
		asr.l	#1,d0
		add.l	d1,d0
		swap	d0
		ext.l	d0
		rts
; End of function randWithModulo


; =============== S U B	R O U T	I N E =======================================


rand:					; CODE XREF: ROM:0000033Cj
					; waitForVblank+14p
		move.w	(prngState).w,d0
		muls.w	#$3619,d0
		addi.w	#$5D35,d0
		move.w	d0,(prngState).w
		rts
; End of function rand


; =============== S U B	R O U T	I N E =======================================


numberToBcd:				; CODE XREF: ROM:00000380j
		move.w	d6,-(sp)
		andi.l	#$FFFF,d1
		divu.w	#$3E8,d1
		move.w	d1,d6
		asl.w	#4,d6
		clr.w	d1
		swap	d1
		divu.w	#$64,d1	; 'd'
		or.b	d1,d6
		asl.w	#4,d6
		clr.w	d1
		swap	d1
		divu.w	#$A,d1
		or.b	d1,d6
		asl.w	#4,d6
		swap	d1
		or.w	d6,d1
		move.w	(sp)+,d6
		rts
; End of function numberToBcd


; =============== S U B	R O U T	I N E =======================================

; Input:
; a1:

sub_1A28:				; CODE XREF: ROM:00000394j sub_1A28+Cj ...
		move.w	(a1)+,d2
		beq.s	locret_1A36
		movem.l	(a1)+,d0-d1
		jsr	dmaTransferToVramWithRewrite
		bra.s	sub_1A28
; ---------------------------------------------------------------------------

locret_1A36:				; CODE XREF: sub_1A28+2j
		rts
; End of function sub_1A28


; =============== S U B	R O U T	I N E =======================================

; Input:
; a1:

sub_1A38:				; CODE XREF: ROM:00000398j
		move.l	a1,d3
		move.w	(a1)+,d2
		beq.s	locret_1A4C
		move.l	(a1)+,d0
		moveq	#0,d1
		move.w	(a1)+,d1
		add.l	d3,d1
		jsr	dmaTransferToVramWithRewrite
		bra.s	sub_1A28
; ---------------------------------------------------------------------------

locret_1A4C:				; CODE XREF: sub_1A38+4j
		rts
; End of function sub_1A38


; =============== S U B	R O U T	I N E =======================================

; Inputs:
; d0:
; d1:

sub_1A4E:				; CODE XREF: ROM:000003A0j sub_4C74+Cp
		lea	(unk_FFFFFE4E).w,a0
		lea	(unk_FFFFFE50).w,a1
		move.l	d0,(a0)+
		move.l	d1,(a1)+
		subq.w	#1,a0
		subq.w	#1,a1
		move	#4,ccr
		sbcd	-(a1),-(a0)
		sbcd	-(a1),-(a0)
		move	sr,-(sp)
		bcc.s	loc_1A6E
		subi.b	#$40,(a0) ; '@'

loc_1A6E:				; CODE XREF: sub_1A4E+1Aj
		move	(sp)+,sr
		sbcd	-(a1),-(a0)
		move.w	(a0),d0
		rts
; End of function sub_1A4E


; =============== S U B	R O U T	I N E =======================================


sub_1A76:				; CODE XREF: ROM:0000039Cj
		addq.w	#2,a1
		abcd	-(a2),-(a1)
		bcs.s	loc_1A94
		cmpi.b	#$60,(a1) ; '`'
		bcs.s	loc_1A9C
		movem.l	d0-d1,-(sp)
		move.b	(a1),d0
		moveq	#$40,d1	; '@'
		abcd	d1,d0
		move.b	d0,(a1)
		movem.l	(sp)+,d0-d1
		bra.s	loc_1A9C
; ---------------------------------------------------------------------------

loc_1A94:				; CODE XREF: sub_1A76+4j
		move	sr,-(sp)
		addi.b	#$40,(a1) ; '@'
		move	(sp)+,sr

loc_1A9C:				; CODE XREF: sub_1A76+Aj sub_1A76+1Cj
		abcd	-(a2),-(a1)
		rts
; End of function sub_1A76


; =============== S U B	R O U T	I N E =======================================

; Enigma decompressor
	include "compression\enigma.asm"

; =============== S U B	R O U T	I N E =======================================

; Input:
; a0:
; d7:

clearRamSegment:			; CODE XREF: ROM:000002F8j
					; sub_1C06:loc_1C0Ap ...
		movea.w	a0,a6
		moveq	#0,d6

loc_1BFE:				; CODE XREF: clearRamSegment+6j
		move.l	d6,(a6)+
		dbf	d7,loc_1BFE
		rts
; End of function clearRamSegment


; =============== S U B	R O U T	I N E =======================================


sub_1C06:				; CODE XREF: ROM:000002FCj
		movem.l	d5/a0,-(sp)

loc_1C0A:				; CODE XREF: sub_1C06+8j
		bsr.s	clearRamSegment
		movea.w	a6,a0
		dbf	d5,loc_1C0A
		movem.l	(sp)+,d5/a0
		rts
; End of function sub_1C06


; =============== S U B	R O U T	I N E =======================================


sub_1C18:				; CODE XREF: ROM:00000300j
					; sub_1CA2+30p
		btst	#1,2(a0)
		beq.s	loc_1C22
		rts
; ---------------------------------------------------------------------------

loc_1C22:				; CODE XREF: sub_1C18+6j
		movea.l	4(a0),a1
		moveq	#0,d1
		move.b	(a1)+,d1
		move.b	(a1)+,$19(a0)
		tst.b	2(a0)
		bpl.s	loc_1C38
		addq.b	#1,$19(a0)

loc_1C38:				; CODE XREF: sub_1C18+1Aj
		move.w	$C(a0),d2
		cmpi.w	#$180,d2
		bhi.s	locret_1C8E
		move.w	8(a0),d3

loc_1C46:				; CODE XREF: sub_1C18+68j sub_1C18+72j
		move.b	(a1)+,d0
		ext.w	d0
		add.w	d2,d0
		move.w	d0,(a2)+
		move.b	(a1)+,(a2)+
		move.b	d6,(a2)+
		move.b	(a1)+,d0
		or.b	$18(a0),d0
		move.b	d0,(a2)+
		move.b	(a1)+,(a2)+
		move.b	(a1)+,d0
		tst.b	2(a0)
		bpl.s	loc_1C6C
		bchg	#3,-2(a2)
		move.b	(a1),d0

loc_1C6C:				; CODE XREF: sub_1C18+4Aj
		addq.w	#1,a1
		ext.w	d0
		add.w	d3,d0
		move.w	d0,d4
		subi.w	#$41,d4	; 'A'
		cmpi.w	#$17F,d4
		bcs.s	loc_1C86
		subq.w	#6,a2
		dbf	d1,loc_1C46
		rts
; ---------------------------------------------------------------------------

loc_1C86:				; CODE XREF: sub_1C18+64j
		move.w	d0,(a2)+
		addq.b	#1,d6
		dbf	d1,loc_1C46

locret_1C8E:				; CODE XREF: sub_1C18+28j
		rts
; End of function sub_1C18


; =============== S U B	R O U T	I N E =======================================


sub_1C90:				; CODE XREF: sub_1CA2+22p
		move.l	$10(a0),d2
		add.l	d2,8(a0)
		move.l	$14(a0),d3
		add.l	d3,$C(a0)
		rts
; End of function sub_1C90


; =============== S U B	R O U T	I N E =======================================

; Inputs:
; d0:
; d1:
; a0:
; a1:

sub_1CA2:				; CODE XREF: ROM:000002F4j
					; sub_3040+2Cp	...
		move.l	a1,(dword_FFFFFE30).w
		move.l	a1,-(sp)
		move.w	#1,(word_FFFFFE38).w

loc_1CAE:				; CODE XREF: sub_1CA2+42j
		movem.w	d0-d1,-(sp)
		move.w	(a0),d0
		beq.s	loc_1CDE
		andi.w	#$7FFC,d0
		movea.l	(dword_FFFFFE34).w,a1
		movea.l	(a1,d0.w),a1
		jsr	(a1)
		bsr.s	sub_1C90
		tst.w	(a0)
		beq.s	loc_1CDE
		movea.l	(dword_FFFFFE30).w,a2
		move.w	(word_FFFFFE38).w,d6
		bsr.w	sub_1C18
		move.w	d6,(word_FFFFFE38).w
		move.l	a2,(dword_FFFFFE30).w

loc_1CDE:				; CODE XREF: sub_1CA2+12j sub_1CA2+26j
		movem.w	(sp)+,d0-d1
		adda.w	d1,a0
		dbf	d0,loc_1CAE
		movea.l	(dword_FFFFFE30).w,a2
		cmpa.l	(sp)+,a2
		beq.s	loc_1CF6
		clr.b	-5(a2)
		rts
; ---------------------------------------------------------------------------

loc_1CF6:				; CODE XREF: sub_1CA2+4Cj
		clr.l	(a2)
		rts
; End of function sub_1CA2


; =============== S U B	R O U T	I N E =======================================


sub_1CFA:				; CODE XREF: sub_21F4p
		st	(byte_FFFFFE28).w
		bsr.w	displayOff
		bsr.w	sub_1098
		bsr.w	loadDefaultVdpRegs
		move.w	#$FFFF,d1
		move.l	#$40000000,d0
		bsr.w	clearVramSegment
		clr.l	(dword_FFFFC106).w
		bsr.w	sub_16C4
		lea	word_217A(pc),a1
		jsr	loadVdpRegs(pc)
		m_disableInterrupts
		lea	(byte_218A).l,a1
		bsr.w	loadPalettesToBuffer
		move.l	#$66600002,(VDP_CONTROL).l
		lea	(unk_9C00).l,a1
		jsr	NemDec
		move.w	#$2533,d0
		lea	(unk_B9DA).l,a1
		lea	(decompScratch).w,a2
		bsr.w	EniDec
		moveq	#$27,d1	; '''
		moveq	#$15,d2
		move.l	#$53800003,d0
		lea	(decompScratch).w,a1
		jsr	sub_C2E
		move.l	#$50C00003,(VDP_CONTROL).l
		lea	(unk_BAAE).l,a1
		jsr	NemDec
		move.w	#$4686,d0
		lea	(unk_BAC8).l,a1
		lea	(decompScratch).w,a2
		bsr.w	EniDec
		moveq	#$1C,d1
		moveq	#2,d2
		move.l	#$54920003,d0
		lea	(decompScratch).w,a1
		jsr	sub_C2E
		move.w	#$4686,d0
		lea	(unk_BAEC).l,a1
		lea	(decompScratch).w,a2
		bsr.w	EniDec
		moveq	#$C,d1
		moveq	#3,d2
		move.l	#$56140003,d0
		lea	(decompScratch).w,a1
		jsr	sub_C2E
		move.w	#$4686,d0
		lea	(unk_BB06).l,a1
		lea	(decompScratch).w,a2
		bsr.w	EniDec
		moveq	#$C,d1
		moveq	#$A,d2
		move.l	#$58020003,d0
		lea	(decompScratch).w,a1
		jsr	sub_C2E
		moveq	#$F,d7
		move.l	#$61E00003,(VDP_CONTROL).l

loc_1DFA:				; CODE XREF: sub_1CFA+108j
		move.w	#$3333,(VDP_DATA).l
		dbf	d7,loc_1DFA
		moveq	#$27,d1	; '''
		moveq	#2,d2
		move.l	#$64000003,d0
		move.w	#$670F,d3
		jsr	sub_CF2
		moveq	#$27,d1	; '''
		moveq	#2,d2
		move.l	#$70800003,d0
		move.w	#$670F,d3
		jsr	sub_CF2
		moveq	#$27,d1	; '''
		moveq	#2,d2
		move.l	#$72000003,d0
		move.w	#$670F,d3
		jsr	sub_CF2
		moveq	#$27,d1	; '''
		moveq	#2,d2
		move.l	#$7E800003,d0
		move.w	#$670F,d3
		jsr	sub_CF2
		move.l	#$60000003,(VDP_CONTROL).l
		lea	(word_EB12).l,a0
		move.w	#$AF,d6	; '¯'

loc_1E62:				; CODE XREF: sub_1CFA+16Ej
		move.w	(a0)+,(VDP_DATA).l
		dbf	d6,loc_1E62
		move.w	#$E700,d0
		moveq	#$A,d7
		move.l	#$53280003,(VDP_CONTROL).l

loc_1E7C:				; CODE XREF: sub_1CFA+18Aj
		move.w	d0,(VDP_DATA).l
		addq.w	#1,d0
		dbf	d7,loc_1E7C
		move.l	#$61600003,(VDP_CONTROL).l
		lea	(dword_EC72).l,a0
		move.w	#$1F,d7

loc_1E9C:				; CODE XREF: sub_1CFA+1A8j
		move.l	(a0)+,(VDP_DATA).l
		dbf	d7,loc_1E9C
		move.w	#$E70B,d0
		moveq	#3,d7
		move.l	#$53400003,(VDP_CONTROL).l

loc_1EB6:				; CODE XREF: sub_1CFA+1C4j
		move.w	d0,(VDP_DATA).l
		addq.w	#1,d0
		dbf	d7,loc_1EB6
		moveq	#9,d7
		move.l	#$52600003,d0
		lea	(word_ECF2).l,a0

loc_1ED0:				; CODE XREF: sub_1CFA+1EEj
		move.l	d0,(VDP_CONTROL).l
		moveq	#$F,d6

loc_1ED8:				; CODE XREF: sub_1CFA+1E4j
		move.w	(a0)+,(VDP_DATA).l
		dbf	d6,loc_1ED8
		addi.l	#$800000,d0
		dbf	d7,loc_1ED0
		move.l	#$53480003,(VDP_CONTROL).l
		move.w	#$E693,d0
		move.w	d0,(VDP_DATA).l
		move.l	#$534A0003,(VDP_CONTROL).l
		move.w	#$E693,d0
		move.w	d0,(VDP_DATA).l
		bsr.w	sub_238C
		clr.b	(byte_FFFFC0FF).w
		clr.b	(unk_FFFFFE53).w

loc_1F20:				; CODE XREF: sub_1CFA+22Ej
		btst	#GA_MEM_MODE_MODE,(GA_MEM_MODE).l
		bne.s	loc_1F20

loc_1F2A:				; CODE XREF: sub_1CFA+238j
		btst	#GA_MEM_MODE_RET,(GA_MEM_MODE).l
		beq.s	loc_1F2A
		clr.w	(word_219C00).l
		lea	(WordRAM_Bank1).l,a0
		move.w	#$7FFF,d7

loc_1F44:				; CODE XREF: sub_1CFA+24Cj
		clr.l	(a0)+
		dbf	d7,loc_1F44
		lea	(dword_BB46).l,a0
		lea	(unk_200080).l,a1
		move.w	#1375,d7

loc_1F5A:				; CODE XREF: sub_1CFA+262j
		move.l	(a0)+,(a1)+
		dbf	d7,loc_1F5A
		lea	(dword_D09E).l,a0
		lea	(unk_201880).l,a1
		move.w	#1407,d7

loc_1F70:				; CODE XREF: sub_1CFA+278j
		move.l	(a0)+,(a1)+
		dbf	d7,loc_1F70
		lea	(dword_D046).l,a0
		lea	(unk_220C02).l,a1
		moveq	#$A,d0
		moveq	#3,d1
		move.w	#$200,d2
		bsr.w	sub_2522
		lea	(dword_E61E).l,a0
		lea	(unk_23F002).l,a1
		moveq	#$10,d0
		moveq	#3,d1
		move.w	#$200,d2
		bsr.w	sub_2522
		lea	(unk_21A000).l,a0
		move.w	#6079,d7

loc_1FB0:				; CODE XREF: sub_1CFA+2BCj
		move.l	#0,(a0)+
		dbf	d7,loc_1FB0
		move.w	#0,(word_FFFFC10E).w
		move.w	#0,(word_FFFFC110).w
		move.w	#0,(word_FFFFC112).w
		move.w	#0,(word_FFFFC114).w
		move.w	#0,(word_FFFFC116).w
		move.w	#0,(word_FFFFC118).w
		move.w	#0,(word_FFFFC11A).w
		move.w	#0,(word_FFFFC11C).w
		move.w	#0,(word_FFFFC11E).w
		move.w	#0,(word_FFFFC120).w
		move.w	#0,(word_219C02).l
		move.w	#0,(word_219C04).l
		move.w	#0,(word_219C06).l
		move.w	#0,(word_219C08).l
		move.w	#0,(word_219C0A).l
		move.w	#0,(word_219C0C).l
		move.w	#0,(word_219C0E).l
		move.w	#0,(word_219C10).l
		move.w	#0,(word_219C12).l
		move.w	#0,(word_219C14).l
		lea	(word_FFFFC102).w,a0
		moveq	#4,d7

loc_204C:				; CODE XREF: sub_1CFA+354j
		clr.w	(a0)+
		dbf	d7,loc_204C
		lea	(dword_FFFFC122).w,a0
		moveq	#$B,d7

loc_2058:				; CODE XREF: sub_1CFA+360j
		clr.w	(a0)+
		dbf	d7,loc_2058
		clr.w	(word_219C00).l
		clr.w	(word_219C16).l
		clr.w	(word_219C18).l
		move.w	#0,(word_FFFFC136).w

loc_2076:				; CODE XREF: sub_1CFA+384j
		bset	#GA_MEM_MODE_DMNA,(GA_MEM_MODE).l
		beq.s	loc_2076
		andi	#$F8FF,sr
		move.l	#$66020003,d0
		move.w	#$25,d1	; '%'
		move.w	#4,d2
		move.w	#1,d3
		jsr	sub_199C
		move.l	#$68820003,d0
		move.w	#$25,d1	; '%'
		move.w	#4,d2
		move.w	#$BF,d3	; '¿'
		jsr	sub_199C
		move.l	#$6B020003,d0
		move.w	#$25,d1	; '%'
		move.w	#4,d2
		move.w	#$17D,d3
		jsr	sub_199C
		move.l	#$6D820003,d0
		move.w	#$25,d1	; '%'
		move.w	#4,d2
		move.w	#$475,d3
		jsr	sub_199C
		move.l	#$74020003,d0
		move.w	#$25,d1	; '%'
		move.w	#4,d2
		move.w	#$23B,d3
		jsr	sub_199C
		move.l	#$76820003,d0
		move.w	#$25,d1	; '%'
		move.w	#4,d2
		move.w	#$2F9,d3
		jsr	sub_199C
		move.l	#$79020003,d0
		move.w	#$25,d1	; '%'
		move.w	#4,d2
		move.w	#$3B7,d3
		jsr	sub_199C
		move.l	#$7B820003,d0
		move.w	#$25,d1	; '%'
		move.w	#4,d2
		move.w	#$475,d3
		jsr	sub_199C
		move.l	#$40000010,(VDP_CONTROL).l
		move.w	#$120,(VDP_DATA).l
		move.l	#$40020010,(VDP_CONTROL).l
		move.w	#$120,(VDP_DATA).l
		jsr	displayOn
		lea	(sub_2424).l,a1
		jsr	setVblankJumpTarget
		clr.b	(byte_FFFFFE28).w
		bsr.w	sub_16D2
		move.b	#$81,d7
		jsr	loc_109C
		jmp	waitForVblank
; End of function sub_1CFA

; ---------------------------------------------------------------------------
word_217A:
	dc.w $8238 ; Reg #02: Scroll A pattern table $E000
	dc.w $8300 ; Reg #03: Window pattern table $0000
	dc.w $8406 ; Reg #04: Scroll B pattern table $C000
	dc.w $8500 ; Reg #05: Sprite attribute table $0000
	dc.w $8B00 ; Reg #11: Ext. Int off, H/V full scroll mode
	dc.w $8D00 ; Reg #13: H-scroll data table $0000
	dc.w $9011 ; Reg #16: Scroll plane size 64x64 cells
	dc.w 0

byte_218A:
	dc.b 0
	dc.b 51

	dc.w $000
	dc.w $0EE
	dc.w $0AE
	dc.w $06E
	dc.w $00E
	dc.w $E0C
	dc.w $E60
	dc.w $CE0
	dc.w $0E0
	dc.w $000
	dc.w $EEC
	dc.w $C00
	dc.w $C20
	dc.w $C40
	dc.w $C60
	dc.w $C80

	dc.w $000
	dc.w $000
	dc.w $8AA
	dc.w $246
	dc.w $864
	dc.w $ACC
	dc.w $224
	dc.w $466
	dc.w $444
	dc.w $666
	dc.w $888
	dc.w $68A
	dc.w $268
	dc.w $AAA
	dc.w $442
	dc.w $000

	dc.w $000
	dc.w $000
	dc.w $000
	dc.w $246
	dc.w $864
	dc.w $ACC
	dc.w $000
	dc.w $000
	dc.w $000
	dc.w $000
	dc.w $888
	dc.w $000
	dc.w $000
	dc.w $000
	dc.w $000
	dc.w $000

	dc.w $000
	dc.w $EEE
	dc.w $888
	dc.w $000

; =============== S U B	R O U T	I N E =======================================


sub_21F4:				; CODE XREF: ROM:000005DAj
		bsr.w	sub_1CFA

loc_21F8:				; CODE XREF: sub_21F4+6Ej
		move.w	#$258,(word_FFFFC100).w

loc_21FE:				; CODE XREF: sub_21F4+7Cj sub_21F4+D2j ...
		bsr.w	sub_26E8
		jsr	waitForVblank
		movem.l	d0-d1/a1,-(sp)
		moveq	#0,d0
		cmpi.b	#7,(byte_FFFFFE18).w
		bne.s	loc_2224
		lea	(unk_FFFFFE1A).w,a1
		moveq	#3,d1

loc_221A:				; CODE XREF: sub_21F4+2Aj
		cmpi.b	#2,(a1)+
		dbeq	d1,loc_221A
		beq.s	loc_222C

loc_2224:				; CODE XREF: sub_21F4+1Ej
		cmpi.b	#3,(byte_FFFFFE19).w
		bne.s	loc_2236

loc_222C:				; CODE XREF: sub_21F4+2Ej
		move.b	(joy2Triggered).w,d0
		andi.w	#$50,d0	; 'P'
		add.w	d0,d0

loc_2236:				; CODE XREF: sub_21F4+36j
		cmpi.b	#3,(byte_FFFFFE18).w
		bne.s	loc_224A
		move.b	(joy1Triggered).w,d1
		andi.w	#$50,d1	; 'P'
		add.w	d1,d1
		or.w	d1,d0

loc_224A:				; CODE XREF: sub_21F4+48j
		or.b	d0,(joy1Triggered).w
		movem.l	(sp)+,d0-d1/a1
		jsr	sub_1856
		bcc.s	loc_2264
		moveq	#3,d2
		bsr.w	sub_2310
		clr.b	(byte_FFFFC0FF).w
		bra.s	loc_21F8
; ---------------------------------------------------------------------------

loc_2264:				; CODE XREF: sub_21F4+62j
		bsr.w	sub_1840
		tst.b	d0
		bmi.s	loc_2298
		tst.b	(byte_FFFFFE3A).w
		bmi.s	loc_21FE
		tst.b	(byte_FFFFC0FF).w
		bne.w	loc_22D4
		move.b	(joy1Triggered).w,d0
		bmi.s	loc_228E
		andi.b	#$70,d0	; 'p'
		beq.s	loc_2294
		move.b	#2,(byte_FFFFC0FF).w
		bra.s	loc_2294
; ---------------------------------------------------------------------------

loc_228E:				; CODE XREF: sub_21F4+8Aj
		move.b	#1,(byte_FFFFC0FF).w

loc_2294:				; CODE XREF: sub_21F4+90j sub_21F4+98j
		moveq	#2,d2
		bra.s	loc_22BE
; ---------------------------------------------------------------------------

loc_2298:				; CODE XREF: sub_21F4+76j
		tst.b	(byte_FFFFC0FF).w
		bne.s	loc_22BC
		move.b	(joy1Triggered).w,d0
		bmi.s	loc_22AE
		andi.b	#$70,d0	; 'p'
		bne.s	loc_22B6
		moveq	#0,d2
		bra.s	loc_22BE
; ---------------------------------------------------------------------------

loc_22AE:				; CODE XREF: sub_21F4+AEj
		move.b	#1,(byte_FFFFC0FF).w
		bra.s	loc_22BC
; ---------------------------------------------------------------------------

loc_22B6:				; CODE XREF: sub_21F4+B4j
		move.b	#2,(byte_FFFFC0FF).w

loc_22BC:				; CODE XREF: sub_21F4+A8j sub_21F4+C0j
		moveq	#1,d2

loc_22BE:				; CODE XREF: sub_21F4+A2j sub_21F4+B8j
		bsr.w	sub_2310
		tst.w	(word_FFFFC100).w
		beq.w	loc_21FE
		subq.w	#1,(word_FFFFC100).w
		beq.s	loc_2306
		bra.w	loc_21FE
; ---------------------------------------------------------------------------

loc_22D4:				; CODE XREF: sub_21F4+82j
		cmpi.b	#2,(byte_FFFFC0FF).w
		beq.s	loc_22E2
		bsr.w	sub_1846
		beq.s	loc_22F8

loc_22E2:				; CODE XREF: sub_21F4+E6j
		move.b	#$E0,d7
		jsr	loc_109C
		moveq	#1,d0
		moveq	#8,d1
		jsr	sub_1800(pc)
		moveq	#8,d0
		jmp	setNextState
; ---------------------------------------------------------------------------

loc_22F8:				; CODE XREF: sub_21F4+ECj
					; sub_21F4+116j
		move.b	#$E1,d7
		jsr	loc_109C
		moveq	#$C,d0
		jmp	setNextState
; ---------------------------------------------------------------------------

loc_2306:				; CODE XREF: sub_21F4+DAj
		jsr	sub_1846
		beq.s	loc_22F8
		bra.w	loc_21FE
; End of function sub_21F4


; =============== S U B	R O U T	I N E =======================================


sub_2310:				; CODE XREF: sub_21F4+66p
					; sub_21F4:loc_22BEp
		lsl.w	#2,d2
		movea.l	off_2326(pc,d2.w),a0
		move.l	#$64600003,d1
		move.w	#$37,d6	; '7'
		bsr.w	sub_2336
		rts
; End of function sub_2310

; ---------------------------------------------------------------------------
off_2326:	dc.l unk_FFFFC13A
		dc.l unk_FFFFC83A
		dc.l unk_FFFFCF3A
		dc.l unk_FFFFD63A

; =============== S U B	R O U T	I N E =======================================


sub_2336:				; CODE XREF: sub_2310+10p sub_2336+18j
		move.l	d1,(VDP_CONTROL).l
		moveq	#$F,d7

loc_233E:				; CODE XREF: sub_2336+Ej
		move.w	(a0)+,(VDP_DATA).l
		dbf	d7,loc_233E
		addi.l	#$800000,d1
		dbf	d6,sub_2336
		rts
; End of function sub_2336


; =============== S U B	R O U T	I N E =======================================


sub_2354:				; CODE XREF: sub_238C+18p sub_238C+32p ...
		movea.l	a1,a2
		move.w	#$1BF,d7

loc_235A:				; CODE XREF: sub_2354+Cj
		move.l	#0,(a2)+
		dbf	d7,loc_235A
		movea.l	a1,a2
		moveq	#$1C,d7
		sub.w	d1,d7
		lsr.w	#1,d7
		lsl.w	#5,d7
		adda.w	d7,a2
		movea.l	a2,a1
		move.w	d1,d7
		lsl.w	#4,d7
		subq.w	#1,d7
		move.w	d7,d0

loc_237A:				; CODE XREF: sub_2354+28j
		move.w	(a0)+,(a2)+
		dbf	d7,loc_237A
		adda.w	#$380,a1

loc_2384:				; CODE XREF: sub_2354+32j
		move.w	(a0)+,(a1)+
		dbf	d0,loc_2384
		rts
; End of function sub_2354


; =============== S U B	R O U T	I N E =======================================


sub_238C:				; CODE XREF: sub_1CFA+21Ap
		lea	(decompScratch).w,a2
		lea	(unk_E6A6).l,a1
		bsr.w	NemDecToRam
		moveq	#$F,d1
		lea	(decompScratch).w,a0
		lea	(unk_FFFFC13A).w,a1
		bsr.s	sub_2354
		lea	(decompScratch).w,a2
		lea	(unk_E7A8).l,a1
		bsr.w	NemDecToRam
		moveq	#$D,d1
		lea	(decompScratch).w,a0
		lea	(unk_FFFFC83A).w,a1
		bsr.s	sub_2354
		lea	(decompScratch).w,a2
		lea	(unk_E882).l,a1
		bsr.w	NemDecToRam
		moveq	#$1A,d1
		lea	(decompScratch).w,a0
		lea	(unk_FFFFCF3A).w,a1
		bsr.w	sub_2354
		lea	(decompScratch).w,a2
		lea	(unk_E9F2).l,a1
		bsr.w	NemDecToRam
		moveq	#$14,d1
		lea	(decompScratch).w,a0
		lea	(unk_FFFFD63A).w,a1
		bsr.w	sub_2354
		moveq	#1,d6
		move.w	#$E723,d0
		move.l	#$5E8C0003,d1

loc_2404:				; CODE XREF: sub_238C+92j
		moveq	#$1B,d7
		move.l	d1,(VDP_CONTROL).l

loc_240C:				; CODE XREF: sub_238C+88j
		move.w	d0,(VDP_DATA).l
		addq.w	#4,d0
		dbf	d7,loc_240C
		addi.l	#$800000,d1
		dbf	d6,loc_2404
		rts
; End of function sub_238C


; =============== S U B	R O U T	I N E =======================================


sub_2424:				; DATA XREF: sub_1CFA+462o
		bsr.w	sub_1818
		jsr	displayOff
		btst	#0,(GA_MEM_MODE).l
		beq.w	loc_24DC
		move.w	(word_219C00).l,d3
		cmpi.w	#3,d3
		bne.s	loc_2458
		move.l	#$40000010,(VDP_CONTROL).l
		move.w	#$40,(VDP_DATA).l ; '@'
		bra.s	loc_2470
; ---------------------------------------------------------------------------

loc_2458:				; CODE XREF: sub_2424+1Ej
		cmpi.w	#7,d3
		bne.s	loc_2478
		move.l	#$40000010,(VDP_CONTROL).l
		move.w	#$120,(VDP_DATA).l

loc_2470:				; CODE XREF: sub_2424+32j
		bsr.w	sub_2FAC
		bsr.w	sub_2F58

loc_2478:				; CODE XREF: sub_2424+38j
		move.w	(word_219C00).l,d3
		lsl.w	#1,d3
		moveq	#0,d0
		move.w	word_24E2(pc,d3.w),d0
		lsl.l	#2,d0
		lsr.w	#2,d0
		swap	d0
		ori.l	#$40000000,d0
		move.w	word_24F2(pc,d3.w),d2
		lsl.w	#1,d3
		move.l	off_2502(pc,d3.w),d1
		jsr	dmaTransferToVramWithRewrite
		move.w	(word_219C00).l,(word_FFFFC10A).w
		move.b	(byte_FFFFC138).w,(word_219C18).l
		tst.b	(word_219C16).l
		beq.s	loc_24C0
		move.b	(word_219C16).l,(byte_FFFFC10C).w

loc_24C0:				; CODE XREF: sub_2424+92j
		moveq	#9,d7
		lea	(word_FFFFC10E).w,a0
		lea	(word_219C02).l,a1

loc_24CC:				; CODE XREF: sub_2424+AAj
		move.w	(a0)+,(a1)+
		dbf	d7,loc_24CC

loc_24D2:				; CODE XREF: sub_2424+B6j
		bset	#1,(GA_MEM_MODE).l
		beq.s	loc_24D2

loc_24DC:				; CODE XREF: sub_2424+10j
		jsr	displayOn
		rts
; End of function sub_2424

; ---------------------------------------------------------------------------
word_24E2:	dc.w $20
		dc.w $17E0
		dc.w $2FA0
		dc.w $8EA0
		dc.w $4760
		dc.w $5F20
		dc.w $76E0
		dc.w $8EA0
word_24F2:	dc.w $BE0
		dc.w $BE0
		dc.w $BE0
		dc.w $BE0
		dc.w $BE0
		dc.w $BE0
		dc.w $BE0
		dc.w $BE0
off_2502:	dc.l unk_21A000
		dc.l unk_21B7C0
		dc.l unk_21CF80
		dc.l unk_21E740
		dc.l unk_21A000
		dc.l unk_21B7C0
		dc.l unk_21CF80
		dc.l unk_21E740

; =============== S U B	R O U T	I N E =======================================


sub_2522:				; CODE XREF: sub_1CFA+290p
					; sub_1CFA+2A8p ...
		movea.l	a1,a2
		move.w	d0,d3

loc_2526:				; CODE XREF: sub_2522+6j
		move.w	(a0)+,(a2)+
		dbf	d3,loc_2526
		adda.w	d2,a1
		dbf	d1,sub_2522
		rts
; End of function sub_2522


; =============== S U B	R O U T	I N E =======================================


sub_2534:
		movem.l	d0-d7/a5,-(sp)
		lea	(VDP_DATA).l,a5
		move.w	#0,-(sp)
		move.w	(vdpLineIncrement).w,-(sp)

loc_2546:				; CODE XREF: sub_2534+24j
		move.l	d0,4(a5)
		move.w	d1,d4

loc_254C:				; CODE XREF: sub_2534+1Ej
		move.w	(a1)+,d5
		add.w	d3,d5
		move.w	d5,(a5)
		dbf	d4,loc_254C
		add.l	(sp),d0
		dbf	d2,loc_2546
		addq.w	#4,sp
		movem.l	(sp)+,d0-d7/a5
		rts
; End of function sub_2534


; =============== S U B	R O U T	I N E =======================================


sub_2564:				; CODE XREF: sub_2CDC+12p sub_2E0E+12p ...
		addi.w	#$80,d7	; '€'

loc_2568:				; CODE XREF: sub_2802+8p sub_2834+8p ...
		move.l	d6,-(sp)
		andi.w	#$1FF,d7
		move.w	d7,d6
		btst	#7,d7
		beq.s	loc_2578
		not.w	d6

loc_2578:				; CODE XREF: sub_2564+10j
		andi.w	#$7F,d6	; ''
		lsl.w	#1,d6
		move.w	word_2590(pc,d6.w),d6
		btst	#8,d7
		beq.s	loc_258A
		neg.w	d6

loc_258A:				; CODE XREF: sub_2564+22j
		move.w	d6,d7
		move.l	(sp)+,d6
		rts
; End of function sub_2564

; ---------------------------------------------------------------------------
word_2590:	dc.w 0
		dc.w 3
		dc.w 6
		dc.w 9
		dc.w $C
		dc.w $F
		dc.w $12
		dc.w $16
		dc.w $19
		dc.w $1C
		dc.w $1F
		dc.w $22
		dc.w $25
		dc.w $28
		dc.w $2B
		dc.w $2F
		dc.w $32
		dc.w $35
		dc.w $38
		dc.w $3B
		dc.w $3E
		dc.w $41
		dc.w $44
		dc.w $47
		dc.w $4A
		dc.w $4D
		dc.w $50
		dc.w $53
		dc.w $56
		dc.w $59
		dc.w $5C
		dc.w $5F
		dc.w $62
		dc.w $65
		dc.w $68
		dc.w $6A
		dc.w $6D
		dc.w $70
		dc.w $73
		dc.w $76
		dc.w $79
		dc.w $7B
		dc.w $7E
		dc.w $81
		dc.w $84
		dc.w $86
		dc.w $89
		dc.w $8C
		dc.w $8E
		dc.w $91
		dc.w $93
		dc.w $96
		dc.w $99
		dc.w $9B
		dc.w $9E
		dc.w $A0
		dc.w $A2
		dc.w $A5
		dc.w $A7
		dc.w $AA
		dc.w $AC
		dc.w $AE
		dc.w $B1
		dc.w $B3
		dc.w $B5
		dc.w $B7
		dc.w $B9
		dc.w $BC
		dc.w $BE
		dc.w $C0
		dc.w $C2
		dc.w $C4
		dc.w $C6
		dc.w $C8
		dc.w $CA
		dc.w $CC
		dc.w $CE
		dc.w $D0
		dc.w $D1
		dc.w $D3
		dc.w $D5
		dc.w $D7
		dc.w $D8
		dc.w $DA
		dc.w $DC
		dc.w $DD
		dc.w $DF
		dc.w $E0
		dc.w $E2
		dc.w $E3
		dc.w $E5
		dc.w $E6
		dc.w $E7
		dc.w $E9
		dc.w $EA
		dc.w $EB
		dc.w $EC
		dc.w $EE
		dc.w $EF
		dc.w $F0
		dc.w $F1
		dc.w $F2
		dc.w $F3
		dc.w $F4
		dc.w $F5
		dc.w $F6
		dc.w $F7
		dc.w $F7
		dc.w $F8
		dc.w $F9
		dc.w $FA
		dc.w $FA
		dc.w $FB
		dc.w $FB
		dc.w $FC
		dc.w $FC
		dc.w $FD
		dc.w $FD
		dc.w $FE
		dc.w $FE
		dc.w $FE
		dc.w $FF
		dc.w $FF
		dc.w $FF
		dc.w $FF
		dc.w $FF
		dc.w $FF
		dc.w $100

; =============== S U B	R O U T	I N E =======================================


sub_2690:				; CODE XREF: sub_27CCp	sub_2994p ...
		move.w	#0,(word_FFFFC10E).w
		move.w	#0,(word_FFFFC110).w
		move.w	#0,(word_FFFFC112).w
		move.w	#0,(word_FFFFC114).w
		move.w	#0,(word_FFFFC116).w
		clr.w	(word_FFFFC132).w
		clr.l	(dword_FFFFC122).w
		clr.l	(dword_FFFFC126).w
		rts
; End of function sub_2690


; =============== S U B	R O U T	I N E =======================================


sub_26BC:				; CODE XREF: sub_286Ap	sub_2A82p ...
		move.w	#0,(word_FFFFC118).w
		move.w	#0,(word_FFFFC11A).w
		move.w	#0,(word_FFFFC11C).w
		move.w	#0,(word_FFFFC11E).w
		move.w	#0,(word_FFFFC120).w
		clr.w	(word_FFFFC134).w
		clr.l	(dword_FFFFC12A).w
		clr.l	(dword_FFFFC12E).w
		rts
; End of function sub_26BC


; =============== S U B	R O U T	I N E =======================================


sub_26E8:				; CODE XREF: sub_21F4:loc_21FEp
		move.w	(word_FFFFC10A).w,d0
		andi.w	#3,d0
		cmpi.w	#3,d0
		bne.s	locret_2704
		tst.b	(byte_FFFFC10C).w
		beq.s	locret_2704
		bsr.w	sub_2706
		bsr.w	sub_2722

locret_2704:				; CODE XREF: sub_26E8+Cj sub_26E8+12j
		rts
; End of function sub_26E8


; =============== S U B	R O U T	I N E =======================================


sub_2706:				; CODE XREF: sub_26E8+14p
		move.w	(word_FFFFC136).w,d0
		lsl.w	#2,d0
		jsr	loc_2712(pc,d0.w)
		rts
; End of function sub_2706

; ---------------------------------------------------------------------------

loc_2712:
		bra.w	sub_2756
; ---------------------------------------------------------------------------
		bra.w	sub_2878
; ---------------------------------------------------------------------------
		bra.w	sub_2A90
; ---------------------------------------------------------------------------
		bra.w	sub_2C60

; =============== S U B	R O U T	I N E =======================================


sub_2722:				; CODE XREF: sub_26E8+18p
		move.w	(word_FFFFC136).w,d0
		lsl.w	#2,d0
		jsr	loc_272E(pc,d0.w)
		rts
; End of function sub_2722

; ---------------------------------------------------------------------------

loc_272E:
		bra.w	sub_277E
; ---------------------------------------------------------------------------
		bra.w	sub_28A4
; ---------------------------------------------------------------------------
		bra.w	sub_2AC8
; ---------------------------------------------------------------------------
		bra.w	sub_2C94

; =============== S U B	R O U T	I N E =======================================


sub_273E:				; CODE XREF: ROM:00002766j
					; ROM:00002776j ...
		subq.w	#1,(dword_FFFFC122).w
		bne.s	locret_2748
		addq.w	#1,(word_FFFFC132).w

locret_2748:				; CODE XREF: sub_273E+4j
		rts
; End of function sub_273E


; =============== S U B	R O U T	I N E =======================================


sub_274A:				; CODE XREF: ROM:0000278Ej
					; ROM:000028BCj ...
		subq.w	#1,(dword_FFFFC12A).w
		bne.s	locret_2754
		addq.w	#1,(word_FFFFC134).w

locret_2754:				; CODE XREF: sub_274A+4j
		rts
; End of function sub_274A


; =============== S U B	R O U T	I N E =======================================


sub_2756:				; CODE XREF: ROM:loc_2712j
		move.w	(word_FFFFC132).w,d0
		lsl.w	#2,d0
		jsr	loc_2762(pc,d0.w)
		rts
; End of function sub_2756

; ---------------------------------------------------------------------------

loc_2762:
		bra.w	sub_27A2
; ---------------------------------------------------------------------------
		bra.w	sub_273E
; ---------------------------------------------------------------------------
		bra.w	sub_27AE
; ---------------------------------------------------------------------------
		bra.w	sub_27AE
; ---------------------------------------------------------------------------
		bra.w	sub_27C0
; ---------------------------------------------------------------------------
		bra.w	sub_273E
; ---------------------------------------------------------------------------
		bra.w	sub_27CC

; =============== S U B	R O U T	I N E =======================================


sub_277E:				; CODE XREF: ROM:loc_272Ej
		move.w	(word_FFFFC134).w,d0
		lsl.w	#2,d0
		jsr	loc_278A(pc,d0.w)
		rts
; End of function sub_277E

; ---------------------------------------------------------------------------

loc_278A:
		bra.w	sub_27D2
; ---------------------------------------------------------------------------
		bra.w	sub_274A
; ---------------------------------------------------------------------------
		bra.w	sub_27DE
; ---------------------------------------------------------------------------
		bra.w	sub_2802
; ---------------------------------------------------------------------------
		bra.w	sub_2834
; ---------------------------------------------------------------------------
		bra.w	sub_286A

; =============== S U B	R O U T	I N E =======================================


sub_27A2:				; CODE XREF: ROM:loc_2762j
		move.w	#$40,(dword_FFFFC122).w	; '@'
		addq.w	#1,(word_FFFFC132).w
		rts
; End of function sub_27A2


; =============== S U B	R O U T	I N E =======================================


sub_27AE:				; CODE XREF: ROM:0000276Aj
					; ROM:0000276Ej
		subq.w	#4,(word_FFFFC116).w
		andi.w	#$1FF,(word_FFFFC116).w
		bne.s	locret_27BE
		addq.w	#1,(word_FFFFC132).w

locret_27BE:				; CODE XREF: sub_27AE+Aj
		rts
; End of function sub_27AE


; =============== S U B	R O U T	I N E =======================================


sub_27C0:				; CODE XREF: ROM:00002772j
		move.w	#$7F,(dword_FFFFC122).w	; ''
		addq.w	#1,(word_FFFFC132).w
		rts
; End of function sub_27C0


; =============== S U B	R O U T	I N E =======================================


sub_27CC:				; CODE XREF: ROM:0000277Aj
		bsr.w	sub_2690
		rts
; End of function sub_27CC


; =============== S U B	R O U T	I N E =======================================


sub_27D2:				; CODE XREF: ROM:loc_278Aj
		move.w	#$40,(dword_FFFFC12A).w	; '@'
		addq.w	#1,(word_FFFFC134).w
		rts
; End of function sub_27D2


; =============== S U B	R O U T	I N E =======================================


sub_27DE:				; CODE XREF: ROM:00002792j
		addq.w	#1,(dword_FFFFC12A).w
		move.w	(dword_FFFFC12A).w,d0
		lsr.w	#2,d0
		add.w	d0,(word_FFFFC11E).w
		cmpi.w	#$100,(dword_FFFFC12A).w
		bne.s	locret_2800
		addq.w	#1,(word_FFFFC134).w
		clr.w	(dword_FFFFC12A).w
		clr.w	(word_FFFFC11E).w

locret_2800:				; CODE XREF: sub_27DE+14j
		rts
; End of function sub_27DE


; =============== S U B	R O U T	I N E =======================================


sub_2802:				; CODE XREF: ROM:00002796j
		addq.w	#4,(dword_FFFFC12A).w
		move.w	(dword_FFFFC12A).w,d7
		bsr.w	loc_2568
		lsr.w	#2,d7
		neg.w	d7
		move.w	d7,(word_FFFFC11A).w
		move.w	(dword_FFFFC12A).w,(word_FFFFC11C).w
		addi.w	#$10,(word_FFFFC11E).w
		cmpi.w	#$100,(dword_FFFFC12A).w
		bne.s	locret_2832
		addq.w	#1,(word_FFFFC134).w
		clr.w	(dword_FFFFC12A).w

locret_2832:				; CODE XREF: sub_2802+26j
		rts
; End of function sub_2802


; =============== S U B	R O U T	I N E =======================================


sub_2834:				; CODE XREF: ROM:0000279Aj
		addq.w	#4,(dword_FFFFC12A).w
		move.w	(dword_FFFFC12A).w,d7
		bsr.w	loc_2568
		lsr.w	#2,d7
		move.w	d7,(word_FFFFC11A).w
		move.w	#$100,d0
		sub.w	(dword_FFFFC12A).w,d0
		move.w	d0,(word_FFFFC11C).w
		addi.w	#$10,(word_FFFFC11E).w
		cmpi.w	#$100,(dword_FFFFC12A).w
		bne.s	locret_2868
		addq.w	#1,(word_FFFFC134).w
		clr.w	(dword_FFFFC12A).w

locret_2868:				; CODE XREF: sub_2834+2Aj
		rts
; End of function sub_2834


; =============== S U B	R O U T	I N E =======================================


sub_286A:				; CODE XREF: ROM:0000279Ej
		bsr.w	sub_26BC
		addq.w	#1,(word_FFFFC136).w
		clr.b	(byte_FFFFC10C).w
		rts
; End of function sub_286A


; =============== S U B	R O U T	I N E =======================================


sub_2878:				; CODE XREF: ROM:00002716j
		move.w	(word_FFFFC132).w,d0
		lsl.w	#2,d0
		jsr	loc_2884(pc,d0.w)
		rts
; End of function sub_2878

; ---------------------------------------------------------------------------

loc_2884:
		bra.w	sub_28D4
; ---------------------------------------------------------------------------
		bra.w	sub_2902
; ---------------------------------------------------------------------------
		bra.w	sub_2916
; ---------------------------------------------------------------------------
		bra.w	sub_2934
; ---------------------------------------------------------------------------
		bra.w	sub_2948
; ---------------------------------------------------------------------------
		bra.w	sub_295C
; ---------------------------------------------------------------------------
		bra.w	sub_2978
; ---------------------------------------------------------------------------
		bra.w	sub_2994

; =============== S U B	R O U T	I N E =======================================


sub_28A4:				; CODE XREF: ROM:00002732j
		move.w	(word_FFFFC134).w,d0
		lsl.w	#2,d0
		jsr	loc_28B0(pc,d0.w)
		rts
; End of function sub_28A4

; ---------------------------------------------------------------------------

loc_28B0:
		bra.w	sub_299A
; ---------------------------------------------------------------------------
		bra.w	sub_29C6
; ---------------------------------------------------------------------------
		bra.w	sub_29F4
; ---------------------------------------------------------------------------
		bra.w	sub_274A
; ---------------------------------------------------------------------------
		bra.w	sub_2A22
; ---------------------------------------------------------------------------
		bra.w	sub_2A36
; ---------------------------------------------------------------------------
		bra.w	sub_2A4A
; ---------------------------------------------------------------------------
		bra.w	sub_2A66
; ---------------------------------------------------------------------------
		bra.w	sub_2A82

; =============== S U B	R O U T	I N E =======================================


sub_28D4:				; CODE XREF: ROM:loc_2884j
		addq.w	#4,(dword_FFFFC122).w
		subq.w	#5,(word_FFFFC10E).w
		addq.w	#2,(word_FFFFC110).w
		move.w	(dword_FFFFC122).w,d7
		bsr.w	loc_2568
		lsr.w	#2,d7
		neg.w	d7
		move.w	d7,(word_FFFFC112).w
		cmpi.w	#$100,(dword_FFFFC122).w
		bne.s	locret_2900
		addq.w	#1,(word_FFFFC132).w
		clr.w	(dword_FFFFC122).w

locret_2900:				; CODE XREF: sub_28D4+22j
		rts
; End of function sub_28D4


; =============== S U B	R O U T	I N E =======================================


sub_2902:				; CODE XREF: ROM:00002888j
		addq.w	#8,(word_FFFFC112).w
		subq.w	#2,(word_FFFFC110).w
		addq.w	#5,(word_FFFFC10E).w
		bne.s	locret_2914
		addq.w	#1,(word_FFFFC132).w

locret_2914:				; CODE XREF: sub_2902+Cj
		rts
; End of function sub_2902


; =============== S U B	R O U T	I N E =======================================


sub_2916:				; CODE XREF: ROM:0000288Cj
		addi.w	#$20,(word_FFFFC116).w ; ' '
		andi.w	#$1FF,(word_FFFFC116).w
		subi.w	#$10,(word_FFFFC112).w
		bne.s	locret_2932
		addq.w	#1,(word_FFFFC132).w
		clr.b	(byte_FFFFC10C).w

locret_2932:				; CODE XREF: sub_2916+12j
		rts
; End of function sub_2916


; =============== S U B	R O U T	I N E =======================================


sub_2934:				; CODE XREF: ROM:00002890j
		addi.w	#$10,(word_FFFFC116).w
		andi.w	#$1FF,(word_FFFFC116).w
		bne.s	locret_2946
		addq.w	#1,(word_FFFFC132).w

locret_2946:				; CODE XREF: sub_2934+Cj
		rts
; End of function sub_2934


; =============== S U B	R O U T	I N E =======================================


sub_2948:				; CODE XREF: ROM:00002894j
		subi.w	#$10,(word_FFFFC116).w
		andi.w	#$1FF,(word_FFFFC116).w
		bne.s	locret_295A
		addq.w	#1,(word_FFFFC132).w

locret_295A:				; CODE XREF: sub_2948+Cj
		rts
; End of function sub_2948


; =============== S U B	R O U T	I N E =======================================


sub_295C:				; CODE XREF: ROM:00002898j
		addq.w	#8,(word_FFFFC114).w
		andi.w	#$1FF,(word_FFFFC114).w
		addq.w	#8,(word_FFFFC116).w
		andi.w	#$1FF,(word_FFFFC116).w
		bne.s	locret_2976
		addq.w	#1,(word_FFFFC132).w

locret_2976:				; CODE XREF: sub_295C+14j
		rts
; End of function sub_295C


; =============== S U B	R O U T	I N E =======================================


sub_2978:				; CODE XREF: ROM:0000289Cj
		subq.w	#8,(word_FFFFC114).w
		andi.w	#$1FF,(word_FFFFC114).w
		subq.w	#8,(word_FFFFC116).w
		andi.w	#$1FF,(word_FFFFC116).w
		bne.s	locret_2992
		addq.w	#1,(word_FFFFC132).w

locret_2992:				; CODE XREF: sub_2978+14j
		rts
; End of function sub_2978


; =============== S U B	R O U T	I N E =======================================


sub_2994:				; CODE XREF: ROM:000028A0j
		bsr.w	sub_2690
		rts
; End of function sub_2994


; =============== S U B	R O U T	I N E =======================================


sub_299A:				; CODE XREF: ROM:loc_28B0j
		addq.w	#1,(dword_FFFFC12A).w
		addi.w	#$10,(word_FFFFC11C).w
		addq.w	#8,(word_FFFFC118).w
		addi.w	#$20,(word_FFFFC120).w ; ' '
		andi.w	#$1FF,(word_FFFFC120).w
		cmpi.w	#$200,(word_FFFFC11C).w
		bne.s	locret_29C4
		addq.w	#1,(word_FFFFC134).w
		clr.w	(dword_FFFFC12A).w

locret_29C4:				; CODE XREF: sub_299A+20j
		rts
; End of function sub_299A


; =============== S U B	R O U T	I N E =======================================


sub_29C6:				; CODE XREF: ROM:000028B4j
		addq.w	#8,(dword_FFFFC12A).w
		move.w	(dword_FFFFC12A).w,d7
		lsr.w	#1,d7
		bsr.w	loc_2568
		move.w	d7,(word_FFFFC11C).w
		addi.w	#$200,(word_FFFFC11C).w
		addq.w	#8,(word_FFFFC118).w
		cmpi.w	#$200,(dword_FFFFC12A).w
		bne.s	locret_29F2
		addq.w	#1,(word_FFFFC134).w
		clr.w	(dword_FFFFC12A).w

locret_29F2:				; CODE XREF: sub_29C6+22j
		rts
; End of function sub_29C6


; =============== S U B	R O U T	I N E =======================================


sub_29F4:				; CODE XREF: ROM:000028B8j
		addq.w	#1,(dword_FFFFC12A).w
		subi.w	#$10,(word_FFFFC11C).w
		subi.w	#$18,(word_FFFFC118).w
		addi.w	#$20,(word_FFFFC120).w ; ' '
		andi.w	#$1FF,(word_FFFFC120).w
		tst.w	(word_FFFFC11C).w
		bne.s	locret_2A20
		addq.w	#1,(word_FFFFC134).w
		move.w	#$20,(dword_FFFFC12A).w	; ' '

locret_2A20:				; CODE XREF: sub_29F4+20j
		rts
; End of function sub_29F4


; =============== S U B	R O U T	I N E =======================================


sub_2A22:				; CODE XREF: ROM:000028C0j
		subi.w	#$10,(word_FFFFC120).w
		andi.w	#$1FF,(word_FFFFC120).w
		bne.s	locret_2A34
		addq.w	#1,(word_FFFFC134).w

locret_2A34:				; CODE XREF: sub_2A22+Cj
		rts
; End of function sub_2A22


; =============== S U B	R O U T	I N E =======================================


sub_2A36:				; CODE XREF: ROM:000028C4j
		addi.w	#$10,(word_FFFFC120).w
		andi.w	#$1FF,(word_FFFFC120).w
		bne.s	locret_2A48
		addq.w	#1,(word_FFFFC134).w

locret_2A48:				; CODE XREF: sub_2A36+Cj
		rts
; End of function sub_2A36


; =============== S U B	R O U T	I N E =======================================


sub_2A4A:				; CODE XREF: ROM:000028C8j
		subq.w	#8,(word_FFFFC11E).w
		andi.w	#$1FF,(word_FFFFC11E).w
		subq.w	#8,(word_FFFFC120).w
		andi.w	#$1FF,(word_FFFFC120).w
		bne.s	locret_2A64
		addq.w	#1,(word_FFFFC134).w

locret_2A64:				; CODE XREF: sub_2A4A+14j
		rts
; End of function sub_2A4A


; =============== S U B	R O U T	I N E =======================================


sub_2A66:				; CODE XREF: ROM:000028CCj
		addq.w	#8,(word_FFFFC11E).w
		andi.w	#$1FF,(word_FFFFC11E).w
		addq.w	#8,(word_FFFFC120).w
		andi.w	#$1FF,(word_FFFFC120).w
		bne.s	locret_2A80
		addq.w	#1,(word_FFFFC134).w

locret_2A80:				; CODE XREF: sub_2A66+14j
		rts
; End of function sub_2A66


; =============== S U B	R O U T	I N E =======================================


sub_2A82:				; CODE XREF: ROM:000028D0j
		bsr.w	sub_26BC
		addq.w	#1,(word_FFFFC136).w
		clr.b	(byte_FFFFC10C).w
		rts
; End of function sub_2A82


; =============== S U B	R O U T	I N E =======================================


sub_2A90:				; CODE XREF: ROM:0000271Aj
		move.w	(word_FFFFC132).w,d0
		lsl.w	#2,d0
		jsr	loc_2A9C(pc,d0.w)
		rts
; End of function sub_2A90

; ---------------------------------------------------------------------------

loc_2A9C:
		bra.w	sub_2AF0
; ---------------------------------------------------------------------------
		bra.w	sub_273E
; ---------------------------------------------------------------------------
		bra.w	sub_2AFC
; ---------------------------------------------------------------------------
		bra.w	sub_2B08
; ---------------------------------------------------------------------------
		bra.w	sub_273E
; ---------------------------------------------------------------------------
		bra.w	sub_2B2C
; ---------------------------------------------------------------------------
		bra.w	sub_273E
; ---------------------------------------------------------------------------
		bra.w	sub_2B56
; ---------------------------------------------------------------------------
		bra.w	sub_2B84
; ---------------------------------------------------------------------------
		bra.w	sub_2BB6
; ---------------------------------------------------------------------------
		bra.w	sub_2BE4

; =============== S U B	R O U T	I N E =======================================


sub_2AC8:				; CODE XREF: ROM:00002736j
		move.w	(word_FFFFC134).w,d0
		lsl.w	#2,d0
		jsr	loc_2AD4(pc,d0.w)
		rts
; End of function sub_2AC8

; ---------------------------------------------------------------------------

loc_2AD4:
		bra.w	sub_2BEA
; ---------------------------------------------------------------------------
		bra.w	sub_274A
; ---------------------------------------------------------------------------
		bra.w	sub_2C10
; ---------------------------------------------------------------------------
		bra.w	sub_2C1C
; ---------------------------------------------------------------------------
		bra.w	sub_2C36
; ---------------------------------------------------------------------------
		bra.w	sub_274A
; ---------------------------------------------------------------------------
		bra.w	sub_2C52

; =============== S U B	R O U T	I N E =======================================


sub_2AF0:				; CODE XREF: ROM:loc_2A9Cj
		move.w	#$3F,(dword_FFFFC122).w	; '?'
		addq.w	#1,(word_FFFFC132).w
		rts
; End of function sub_2AF0


; =============== S U B	R O U T	I N E =======================================


sub_2AFC:				; CODE XREF: ROM:00002AA4j
		move.b	#2,(byte_FFFFC138).w
		addq.w	#1,(word_FFFFC132).w
		rts
; End of function sub_2AFC


; =============== S U B	R O U T	I N E =======================================


sub_2B08:				; CODE XREF: ROM:00002AA8j
		addq.w	#6,(word_FFFFC112).w
		addi.w	#$10,(word_FFFFC116).w
		andi.w	#$1FF,(word_FFFFC116).w
		cmpi.w	#$300,(word_FFFFC112).w
		bne.s	locret_2B2A
		addq.w	#1,(word_FFFFC132).w
		move.w	#$5E,(dword_FFFFC122).w	; '^'

locret_2B2A:				; CODE XREF: sub_2B08+16j
		rts
; End of function sub_2B08


; =============== S U B	R O U T	I N E =======================================


sub_2B2C:				; CODE XREF: ROM:00002AB0j
		move.w	#0,(word_FFFFC10E).w
		move.w	#0,(word_FFFFC110).w
		move.w	#0,(word_FFFFC112).w
		move.w	#0,(word_FFFFC114).w
		move.w	#0,(word_FFFFC116).w
		addq.w	#1,(word_FFFFC132).w
		move.w	#$10,(dword_FFFFC122).w
		rts
; End of function sub_2B2C


; =============== S U B	R O U T	I N E =======================================


sub_2B56:				; CODE XREF: ROM:00002AB8j
		addq.w	#8,(dword_FFFFC122).w
		move.w	(dword_FFFFC122).w,d7
		bsr.w	loc_2568
		lsr.w	#4,d7
		neg.w	d7
		move.w	d7,(word_FFFFC110).w
		subq.w	#4,(word_FFFFC10E).w
		subq.w	#2,(word_FFFFC112).w
		cmpi.w	#$100,(dword_FFFFC122).w
		bne.s	locret_2B82
		addq.w	#1,(word_FFFFC132).w
		clr.w	(dword_FFFFC122).w

locret_2B82:				; CODE XREF: sub_2B56+22j
		rts
; End of function sub_2B56


; =============== S U B	R O U T	I N E =======================================


sub_2B84:				; CODE XREF: ROM:00002ABCj
		addq.w	#4,(dword_FFFFC122).w
		move.w	(dword_FFFFC122).w,d7
		bsr.w	loc_2568
		move.w	d7,d6
		lsr.w	#2,d6
		lsr.w	#1,d7
		add.w	d6,d7
		move.w	d7,(word_FFFFC110).w
		addq.w	#1,(word_FFFFC10E).w
		addq.w	#4,(word_FFFFC112).w
		cmpi.w	#$100,(dword_FFFFC122).w
		bne.s	locret_2BB4
		addq.w	#1,(word_FFFFC132).w
		clr.w	(dword_FFFFC122).w

locret_2BB4:				; CODE XREF: sub_2B84+26j
		rts
; End of function sub_2B84


; =============== S U B	R O U T	I N E =======================================


sub_2BB6:				; CODE XREF: ROM:00002AC0j
		addq.w	#8,(dword_FFFFC122).w
		move.w	(dword_FFFFC122).w,d7
		bsr.w	loc_2568
		lsr.w	#3,d7
		neg.w	d7
		move.w	d7,(word_FFFFC110).w
		addq.w	#2,(word_FFFFC10E).w
		subq.w	#6,(word_FFFFC112).w
		cmpi.w	#$100,(dword_FFFFC122).w
		bne.s	locret_2BE2
		addq.w	#1,(word_FFFFC132).w
		clr.w	(dword_FFFFC122).w

locret_2BE2:				; CODE XREF: sub_2BB6+22j
		rts
; End of function sub_2BB6


; =============== S U B	R O U T	I N E =======================================


sub_2BE4:				; CODE XREF: ROM:00002AC4j
		bsr.w	sub_2690
		rts
; End of function sub_2BE4


; =============== S U B	R O U T	I N E =======================================


sub_2BEA:				; CODE XREF: ROM:loc_2AD4j
		addi.w	#$10,(word_FFFFC11C).w
		addi.w	#$10,(word_FFFFC120).w
		andi.w	#$1FF,(word_FFFFC120).w
		cmpi.w	#$400,(word_FFFFC11C).w
		bne.s	locret_2C0E
		addq.w	#1,(word_FFFFC134).w
		move.w	#$80,(dword_FFFFC12A).w	; '€'

locret_2C0E:				; CODE XREF: sub_2BEA+18j
		rts
; End of function sub_2BEA


; =============== S U B	R O U T	I N E =======================================


sub_2C10:				; CODE XREF: ROM:00002ADCj
		move.b	#1,(byte_FFFFC138).w
		addq.w	#1,(word_FFFFC134).w
		rts
; End of function sub_2C10


; =============== S U B	R O U T	I N E =======================================


sub_2C1C:				; CODE XREF: ROM:00002AE0j
		subi.w	#$10,(word_FFFFC11C).w
		cmpi.w	#$FFA0,(word_FFFFC11C).w
		bne.s	locret_2C34
		addq.w	#1,(word_FFFFC134).w
		move.b	#0,(byte_FFFFC138).w

locret_2C34:				; CODE XREF: sub_2C1C+Cj
		rts
; End of function sub_2C1C


; =============== S U B	R O U T	I N E =======================================


sub_2C36:				; CODE XREF: ROM:00002AE4j
		addi.w	#$15,(word_FFFFC120).w
		addq.w	#4,(word_FFFFC11C).w
		bne.s	locret_2C50
		addq.w	#1,(word_FFFFC134).w
		clr.w	(word_FFFFC120).w
		move.w	#$91,(dword_FFFFC12A).w	; '‘'

locret_2C50:				; CODE XREF: sub_2C36+Aj
		rts
; End of function sub_2C36


; =============== S U B	R O U T	I N E =======================================


sub_2C52:				; CODE XREF: ROM:00002AECj
		bsr.w	sub_26BC
		addq.w	#1,(word_FFFFC136).w
		clr.b	(byte_FFFFC10C).w
		rts
; End of function sub_2C52


; =============== S U B	R O U T	I N E =======================================


sub_2C60:				; CODE XREF: ROM:0000271Ej
		move.w	(word_FFFFC132).w,d0
		lsl.w	#2,d0
		jsr	loc_2C6C(pc,d0.w)
		rts
; End of function sub_2C60

; ---------------------------------------------------------------------------

loc_2C6C:
		bra.w	sub_2CC4
; ---------------------------------------------------------------------------
		bra.w	sub_2CDC
; ---------------------------------------------------------------------------
		bra.w	sub_2D20
; ---------------------------------------------------------------------------
		bra.w	sub_2D4C
; ---------------------------------------------------------------------------
		bra.w	sub_2D70
; ---------------------------------------------------------------------------
		bra.w	sub_2D9C
; ---------------------------------------------------------------------------
		bra.w	sub_273E
; ---------------------------------------------------------------------------
		bra.w	sub_2DBA
; ---------------------------------------------------------------------------
		bra.w	sub_273E
; ---------------------------------------------------------------------------
		bra.w	sub_2DF0

; =============== S U B	R O U T	I N E =======================================


sub_2C94:				; CODE XREF: ROM:0000273Aj
		move.w	(word_FFFFC134).w,d0
		lsl.w	#2,d0
		jsr	loc_2CA0(pc,d0.w)
		rts
; End of function sub_2C94

; ---------------------------------------------------------------------------

loc_2CA0:
		bra.w	sub_2DF6
; ---------------------------------------------------------------------------
		bra.w	sub_2E0E
; ---------------------------------------------------------------------------
		bra.w	sub_2E56
; ---------------------------------------------------------------------------
		bra.w	sub_2E8A
; ---------------------------------------------------------------------------
		bra.w	sub_274A
; ---------------------------------------------------------------------------
		bra.w	sub_2EAC
; ---------------------------------------------------------------------------
		bra.w	sub_2F06
; ---------------------------------------------------------------------------
		bra.w	sub_2F32
; ---------------------------------------------------------------------------
		bra.w	sub_2F4A

; =============== S U B	R O U T	I N E =======================================


sub_2CC4:				; CODE XREF: ROM:loc_2C6Cj
		addq.w	#8,(word_FFFFC110).w
		addi.w	#$18,(word_FFFFC112).w
		cmpi.w	#$180,(word_FFFFC112).w
		bne.s	locret_2CDA
		addq.w	#1,(word_FFFFC132).w

locret_2CDA:				; CODE XREF: sub_2CC4+10j
		rts
; End of function sub_2CC4


; =============== S U B	R O U T	I N E =======================================


sub_2CDC:				; CODE XREF: ROM:00002C70j
		addq.w	#4,(dword_FFFFC122).w
		addq.w	#8,(word_FFFFC116).w
		andi.w	#$1FF,(word_FFFFC116).w
		move.w	(dword_FFFFC122).w,d7
		bsr.w	sub_2564
		asr.w	#1,d7
		neg.w	d7
		addi.w	#$200,d7
		move.w	d7,(word_FFFFC112).w
		move.w	(dword_FFFFC122).w,d7
		bsr.w	loc_2568
		neg.w	d7
		asl.w	#1,d7
		move.w	d7,(word_FFFFC10E).w
		cmpi.w	#$200,(dword_FFFFC122).w
		bne.s	locret_2D1E
		addq.w	#1,(word_FFFFC132).w
		clr.w	(dword_FFFFC122).w

locret_2D1E:				; CODE XREF: sub_2CDC+38j
		rts
; End of function sub_2CDC


; =============== S U B	R O U T	I N E =======================================


sub_2D20:				; CODE XREF: ROM:00002C74j
		addq.w	#8,(dword_FFFFC122).w
		move.w	(dword_FFFFC122).w,d7
		bsr.w	loc_2568
		asr.w	#1,d7
		addi.w	#$80,d7	; '€'
		move.w	d7,(word_FFFFC110).w
		subq.w	#8,(word_FFFFC112).w
		cmpi.w	#$80,(word_FFFFC112).w ; '€'
		bne.s	locret_2D4A
		addq.w	#1,(word_FFFFC132).w
		clr.w	(dword_FFFFC122).w

locret_2D4A:				; CODE XREF: sub_2D20+20j
		rts
; End of function sub_2D20


; =============== S U B	R O U T	I N E =======================================


sub_2D4C:				; CODE XREF: ROM:00002C78j
		addi.w	#$20,(word_FFFFC116).w ; ' '
		andi.w	#$1FF,(word_FFFFC116).w
		subq.w	#8,(word_FFFFC110).w
		subq.w	#8,(word_FFFFC112).w
		bne.s	locret_2D6E
		addq.w	#1,(word_FFFFC132).w
		clr.b	(byte_FFFFC10C).w
		clr.w	(dword_FFFFC122).w

locret_2D6E:				; CODE XREF: sub_2D4C+14j
		rts
; End of function sub_2D4C


; =============== S U B	R O U T	I N E =======================================


sub_2D70:				; CODE XREF: ROM:00002C7Cj
		addq.w	#2,(dword_FFFFC122).w
		move.w	(dword_FFFFC122).w,d7
		bsr.w	loc_2568
		asr.w	#1,d7
		move.w	d7,(word_FFFFC110).w
		addq.w	#4,(word_FFFFC10E).w
		addq.w	#2,(word_FFFFC112).w
		cmpi.w	#$80,(dword_FFFFC122).w	; '€'
		bne.s	locret_2D9A
		addq.w	#1,(word_FFFFC132).w
		clr.w	(dword_FFFFC122).w

locret_2D9A:				; CODE XREF: sub_2D70+20j
		rts
; End of function sub_2D70


; =============== S U B	R O U T	I N E =======================================


sub_2D9C:				; CODE XREF: ROM:00002C80j
		subq.w	#4,(word_FFFFC110).w
		subi.w	#$10,(word_FFFFC10E).w
		bne.s	locret_2DB8
		addq.w	#1,(word_FFFFC132).w
		move.w	#$10,(dword_FFFFC122).w
		move.w	#$40,(dword_FFFFC122+2).w ; '@'

locret_2DB8:				; CODE XREF: sub_2D9C+Aj
		rts
; End of function sub_2D9C


; =============== S U B	R O U T	I N E =======================================


sub_2DBA:				; CODE XREF: ROM:00002C88j
		addq.w	#8,(dword_FFFFC122).w
		move.w	(dword_FFFFC122).w,d7
		bsr.w	loc_2568
		asr.w	#1,d7
		subq.w	#2,(dword_FFFFC122+2).w
		add.w	(dword_FFFFC122+2).w,d7
		move.w	d7,(word_FFFFC110).w
		subq.w	#4,(word_FFFFC112).w
		cmpi.w	#$100,(dword_FFFFC122).w
		bne.s	locret_2DEE
		addq.w	#1,(word_FFFFC132).w
		move.w	#$40,(dword_FFFFC122).w	; '@'
		clr.w	(dword_FFFFC122+2).w

locret_2DEE:				; CODE XREF: sub_2DBA+24j
		rts
; End of function sub_2DBA


; =============== S U B	R O U T	I N E =======================================


sub_2DF0:				; CODE XREF: ROM:00002C90j
		bsr.w	sub_2690
		rts
; End of function sub_2DF0


; =============== S U B	R O U T	I N E =======================================


sub_2DF6:				; CODE XREF: ROM:loc_2CA0j
		addq.w	#8,(word_FFFFC11A).w
		addi.w	#$18,(word_FFFFC11C).w
		cmpi.w	#$180,(word_FFFFC11C).w
		bne.s	locret_2E0C
		addq.w	#1,(word_FFFFC134).w

locret_2E0C:				; CODE XREF: sub_2DF6+10j
		rts
; End of function sub_2DF6


; =============== S U B	R O U T	I N E =======================================


sub_2E0E:				; CODE XREF: ROM:00002CA4j
		addq.w	#4,(dword_FFFFC12A).w
		subq.w	#8,(word_FFFFC120).w
		andi.w	#$1FF,(word_FFFFC120).w
		move.w	(dword_FFFFC12A).w,d7
		bsr.w	sub_2564
		asr.w	#1,d7
		neg.w	d7
		addi.w	#$200,d7
		move.w	d7,(word_FFFFC11C).w
		move.w	(dword_FFFFC12A).w,d7
		bsr.w	loc_2568
		asl.w	#1,d7
		move.w	d7,(word_FFFFC118).w
		cmpi.w	#$200,(dword_FFFFC12A).w
		bne.s	locret_2E54
		addq.w	#1,(word_FFFFC134).w
		clr.w	(dword_FFFFC12A).w
		move.w	#$180,(word_FFFFC11C).w

locret_2E54:				; CODE XREF: sub_2E0E+36j
		rts
; End of function sub_2E0E


; =============== S U B	R O U T	I N E =======================================


sub_2E56:				; CODE XREF: ROM:00002CA8j
		addq.w	#8,(dword_FFFFC12A).w
		move.w	(dword_FFFFC12A).w,d7
		bsr.w	loc_2568
		asr.w	#1,d7
		neg.w	d7
		addi.w	#$80,d7	; '€'
		move.w	d7,(word_FFFFC11A).w
		subq.w	#8,(word_FFFFC11C).w
		cmpi.w	#$100,(dword_FFFFC12A).w
		bne.s	locret_2E88
		addq.w	#1,(word_FFFFC134).w
		clr.w	(dword_FFFFC12A).w
		move.w	#$80,(word_FFFFC11C).w ; '€'

locret_2E88:				; CODE XREF: sub_2E56+22j
		rts
; End of function sub_2E56


; =============== S U B	R O U T	I N E =======================================


sub_2E8A:				; CODE XREF: ROM:00002CACj
		subi.w	#$20,(word_FFFFC120).w ; ' '
		andi.w	#$1FF,(word_FFFFC120).w
		subq.w	#8,(word_FFFFC11A).w
		subq.w	#8,(word_FFFFC11C).w
		bne.s	locret_2EAA
		addq.w	#1,(word_FFFFC134).w
		move.w	#$20,(dword_FFFFC12A).w	; ' '

locret_2EAA:				; CODE XREF: sub_2E8A+14j
		rts
; End of function sub_2E8A


; =============== S U B	R O U T	I N E =======================================


sub_2EAC:				; CODE XREF: ROM:00002CB4j
		addq.w	#8,(dword_FFFFC12A).w
		addq.w	#8,(word_FFFFC120).w
		andi.w	#$1FF,(word_FFFFC120).w
		addq.w	#8,(word_FFFFC11E).w
		andi.w	#$1FF,(word_FFFFC11E).w
		move.w	(dword_FFFFC12A).w,d7
		bsr.w	loc_2568
		asr.w	#2,d7
		neg.w	d7
		move.w	d7,(word_FFFFC11A).w
		move.w	(dword_FFFFC12A).w,d7
		bsr.w	sub_2564
		asr.w	#2,d7
		subi.w	#$40,d7	; '@'
		move.w	d7,(word_FFFFC118).w
		move.w	(dword_FFFFC12A).w,d7
		bsr.w	loc_2568
		asr.w	#3,d7
		move.w	d7,(word_FFFFC11C).w
		cmpi.w	#$200,(dword_FFFFC12A).w
		bne.s	locret_2F04
		addq.w	#1,(word_FFFFC134).w
		clr.w	(dword_FFFFC12A).w

locret_2F04:				; CODE XREF: sub_2EAC+4Ej
		rts
; End of function sub_2EAC


; =============== S U B	R O U T	I N E =======================================


sub_2F06:				; CODE XREF: ROM:00002CB8j
		addq.w	#8,(dword_FFFFC12A).w
		move.w	(dword_FFFFC12A).w,d7
		bsr.w	loc_2568
		asr.w	#1,d7
		neg.w	d7
		move.w	d7,(word_FFFFC11A).w
		addi.w	#$10,(word_FFFFC11C).w
		cmpi.w	#$100,(dword_FFFFC12A).w
		bne.s	locret_2F30
		addq.w	#1,(word_FFFFC134).w
		clr.w	(dword_FFFFC12A).w

locret_2F30:				; CODE XREF: sub_2F06+20j
		rts
; End of function sub_2F06


; =============== S U B	R O U T	I N E =======================================


sub_2F32:				; CODE XREF: ROM:00002CBCj
		addi.w	#$20,(word_FFFFC120).w ; ' '
		andi.w	#$1FF,(word_FFFFC120).w
		subq.w	#8,(word_FFFFC11C).w
		bne.s	locret_2F48
		addq.w	#1,(word_FFFFC134).w

locret_2F48:				; CODE XREF: sub_2F32+10j
		rts
; End of function sub_2F32


; =============== S U B	R O U T	I N E =======================================


sub_2F4A:				; CODE XREF: ROM:00002CC0j
		bsr.w	sub_26BC
		clr.w	(word_FFFFC136).w
		clr.b	(byte_FFFFC10C).w
		rts
; End of function sub_2F4A


; =============== S U B	R O U T	I N E =======================================


sub_2F58:				; CODE XREF: sub_2424+50p
		move.w	(dword_FFFFC106+2).w,d0
		lsl.w	#1,d0
		lea	word_2F8C(pc),a0
		adda.w	d0,a0
		lea	((paletteBuffer0+2)).w,a1
		moveq	#7,d7

loc_2F6A:				; CODE XREF: sub_2F58+14j
		move.w	(a0)+,(a1)+
		dbf	d7,loc_2F6A
		clr.w	(dword_FFFFC106).w
		addq.w	#1,(dword_FFFFC106+2).w
		cmpi.w	#8,(dword_FFFFC106+2).w
		bne.s	loc_2F84
		clr.w	(dword_FFFFC106+2).w

loc_2F84:				; CODE XREF: sub_2F58+26j
		bset	#0,(vdpUpdateFlags).w
		rts
; End of function sub_2F58

; ---------------------------------------------------------------------------
word_2F8C:	dc.w $EE		; DATA XREF: sub_2F58+6o
		dc.w $AE
		dc.w $6E
		dc.w $E
		dc.w $E0C
		dc.w $E60
		dc.w $CE0
		dc.w $E0
		dc.w $EE
		dc.w $AE
		dc.w $6E
		dc.w $E
		dc.w $E0C
		dc.w $E60
		dc.w $CE0
		dc.w $E0

; =============== S U B	R O U T	I N E =======================================


sub_2FAC:				; CODE XREF: sub_2424:loc_2470p
		lea	((paletteBuffer2+6)).w,a0
		addq.w	#1,(word_FFFFC102).w
		cmpi.w	#$10,(word_FFFFC102).w
		bne.s	loc_2FC0
		clr.w	(word_FFFFC102).w

loc_2FC0:				; CODE XREF: sub_2FAC+Ej
		move.w	(word_FFFFC102).w,d0
		lsr.w	#1,d0
		lsl.w	#1,d0
		move.w	word_2FE0(pc,d0.w),(a0)
		move.w	word_3000(pc,d0.w),2(a0)
		move.w	word_3020(pc,d0.w),4(a0)
		bset	#0,(vdpUpdateFlags).w
		rts
; End of function sub_2FAC

; ---------------------------------------------------------------------------
word_2FE0:	dc.w $ACC
		dc.w $8AA
		dc.w $688
		dc.w $466
		dc.w $244
		dc.w $466
		dc.w $688
		dc.w $8AA
		dc.w $ACC
		dc.w $8AA
		dc.w $688
		dc.w $466
		dc.w $244
		dc.w $466
		dc.w $688
		dc.w $8AA
word_3000:	dc.w $688
		dc.w $466
		dc.w $244
		dc.w $466
		dc.w $688
		dc.w $8AA
		dc.w $ACC
		dc.w $8AA
		dc.w $688
		dc.w $466
		dc.w $244
		dc.w $466
		dc.w $688
		dc.w $8AA
		dc.w $ACC
		dc.w $8AA
word_3020:	dc.w $466
		dc.w $244
		dc.w $466
		dc.w $688
		dc.w $8AA
		dc.w $ACC
		dc.w $8AA
		dc.w $688
		dc.w $466
		dc.w $244
		dc.w $466
		dc.w $688
		dc.w $8AA
		dc.w $ACC
		dc.w $8AA
		dc.w $688

; =============== S U B	R O U T	I N E =======================================


sub_3040:				; CODE XREF: ROM:000005DEj
		bsr.w	sub_30C2

loc_3044:				; CODE XREF: sub_3040+66j
		jsr	waitForVblank(pc)
		st	(byte_FFFFFE28).w
		jsr	sub_62E4(pc)
		bsr.w	sub_43F2
		bcs.s	loc_3070
		cmpi.b	#1,(byte_FFFFD002).w
		beq.s	loc_3070
		lea	(unk_FFFFD300).w,a0
		lea	(spriteTable).w,a1
		moveq	#1,d0
		move.w	#$80,d1	; '€'
		jsr	sub_1CA2

loc_3070:				; CODE XREF: sub_3040+14j sub_3040+1Cj
		bsr.w	sub_44E2
		bsr.w	sub_5F36
		bsr.w	sub_56B6
		bsr.w	sub_54B2
		bsr.w	sub_6130

loc_3084:				; CODE XREF: sub_3040+50j
		move.w	(VDP_COUNTER).l,d0
		bmi.s	loc_3092
		cmpi.w	#$5800,d0
		bls.s	loc_3084

loc_3092:				; CODE XREF: sub_3040+4Aj
		bsr.w	sub_5C8A
		jsr	sub_6342(pc)
		clr.b	(byte_FFFFFE28).w
		move.b	(byte_FFFFD007).w,d0
		andi.b	#$C0,d0
		beq.s	loc_3044
		btst	#6,d0
		bne.s	loc_30BC
		moveq	#1,d0
		moveq	#$10,d1
		jsr	sub_1800(pc)
		moveq	#$10,d0
		jmp	setNextState(pc)
; ---------------------------------------------------------------------------

loc_30BC:				; CODE XREF: sub_3040+6Cj
		moveq	#$C,d0
		jmp	setNextState(pc)
; End of function sub_3040


; =============== S U B	R O U T	I N E =======================================


sub_30C2:				; CODE XREF: sub_3040p
		st	(byte_FFFFFE28).w
		jsr	displayOff(pc)
		jsr	loadDefaultVdpRegs(pc)
		jsr	clearAllVram(pc)
		lea	word_318C(pc),a1
		jsr	loadVdpRegs(pc)
		jsr	sub_1098(pc)
		lea	(word_319E).l,a1
		jsr	setVblankJumpTarget(pc)
		bsr.w	sub_328C
		move.b	#1,(byte_FFFFD010).w
		move.b	#$10,(byte_FFFFD00F).w
		move.b	#$10,(byte_FFFFD011).w
		move.b	#3,(byte_FFFFD00E).w
		clr.w	(word_FFFFD166).w
		bsr.w	sub_5260
		bsr.w	sub_5F2C
		bsr.w	sub_62C8
		jsr	sub_6342(pc)
		clr.l	(spriteTable).w
		clr.l	(spriteTable+4).w
		move.l	#$3180,(dword_FFFFFE34).w
		lea	(unk_FFFFD300).w,a0
		moveq	#$7F,d7	; ''
		bsr.w	clearRamSegment
		bsr.w	sub_329A
		move.w	#8,(unk_FFFFD380).w
		bsr.w	sub_5FA2
		move.l	#$40000010,(VDP_CONTROL).l
		move.l	#$200100,(VDP_DATA).l
		move.l	#$44000002,(VDP_CONTROL).l
		move.w	#$FF80,(VDP_DATA).l
		clr.b	(byte_FFFFD003).w
		bsr.w	sub_63AC
		bsr.w	sub_5DFA
		bsr.w	sub_16D2
		clr.b	(byte_FFFFFE28).w
		jsr	waitForVblank(pc)
		jsr	displayOn(pc)
		rts
; End of function sub_30C2

; ---------------------------------------------------------------------------
		dc.b   0
		dc.b   0
		dc.b $32 ; 2
		dc.b $DC ; Ü
		dc.b   0
		dc.b   0
		dc.b $42 ; B
		dc.b $20
word_318C:
	dc.w $8334 ; Reg #03: Window pattern table $D000
	dc.w $8230 ; Reg #02: Scroll A pattern table $C000
	dc.w $8407 ; Reg #04: Scroll B pattern table $E000
	dc.w $8568 ; Reg #05: Sprite attribute table $D000
	dc.w $8D21 ; Reg #13: H-scroll data table $8400
	dc.w $8C81 ; Reg #12: Shadow/hilight/interlace off, H40-cell mode
	dc.w $9100 ; Reg #17: Window H position 0
	dc.w $9200 ; Reg #18: Window V position 0
	dc.w 0
word_319E:	dc.w $49F9		; DATA XREF: sub_30C2+1Co
		dc.w $C0
		dc.w 4
		dc.w $3838
		dc.w $FDB6
		dc.w $8C4
		dc.w 4
		dc.w $3884
		dc.w $40E7
		dc.w $7C
		dc.w $700
		dc.w $33FC
		dc.w $100
		dc.w $A1
		dc.w $1100
		dc.w $28BC
		dc.w $9400
		dc.w $9380
		dc.w $28BC
		dc.w $96FC
		dc.w $9580
		dc.w $38BC
		dc.w $977F
		dc.w $38BC
		dc.w $5000
		dc.w $3F3C
		dc.w $83
		dc.w $839
		dc.w 0
		dc.w $A1
		dc.w $1100
		dc.w $66F6
		dc.w $389F
		dc.w $33FC
		dc.w 0
		dc.w $A1
		dc.w $1100
		dc.w $38B8
		dc.w $FDB6
		dc.w $28BC
		dc.w $5000
		dc.w 3
		dc.w $3978
		dc.w $F900
		dc.w $FFFC
		dc.w $46DF
		dc.w $6100
		dc.w $327A

; =============== S U B	R O U T	I N E =======================================


sub_31FE:
		bclr	#5,(byte_FFFFD007).w
		beq.s	locret_3210
		tst.b	(byte_FFFFD003).w
		beq.s	loc_3212
		bra.w	sub_63D4
; ---------------------------------------------------------------------------

locret_3210:				; CODE XREF: sub_31FE+6j
		rts
; ---------------------------------------------------------------------------

loc_3212:				; CODE XREF: sub_31FE+Cj
		jsr	displayOff(pc)
		move.w	#(loc_900E+3),(VDP_CONTROL).l
		move.w	#(loc_900E+3),(vdpRegCache+$20).w
		move.w	#loc_8700,(VDP_CONTROL).l
		move.w	#loc_8700,(vdpRegCache+$E).w
		move.w	#(loc_90FE+2),(VDP_CONTROL).l
		move.w	#(loc_90FE+2),(vdpRegCache+$22).w
		move.w	#loc_9200,(VDP_CONTROL).l
		move.w	#loc_9200,(vdpRegCache+$24).w
		move.l	#$42200003,d6
		bsr.w	sub_6816
		bsr.w	sub_5DD8
		clr.b	(byte_FFFFD061).w
		move.l	#$40000010,(VDP_CONTROL).l
		move.l	#$200100,(VDP_DATA).l
		move.l	#$44000002,(VDP_CONTROL).l
		move.l	#$FF800000,(VDP_DATA).l
		jmp	displayOn(pc)
; End of function sub_31FE


; =============== S U B	R O U T	I N E =======================================


sub_328C:				; CODE XREF: sub_30C2+26p
		lea	(word_FFFFD000).w,a0
		moveq	#48,d0

loc_3292:				; CODE XREF: sub_328C+8j
		clr.w	(a0)+
		dbf	d0,loc_3292
		rts
; End of function sub_328C


; =============== S U B	R O U T	I N E =======================================


sub_329A:				; CODE XREF: sub_30C2+70p
		lea	(unk_FFFFD300).w,a0
		move.w	#4,(a0)
		move.b	#$80,$18(a0)
		move.l	#$12BBD,4(a0)
		clr.l	$36(a0)
		move.l	#1,$32(a0)
		bsr.w	sub_1846
		beq.s	loc_32D4
		move.l	#$10003,$32(a0)
		bsr.w	sub_1840
		bne.s	loc_32D4
		clr.l	$32(a0)

loc_32D4:				; CODE XREF: sub_329A+26j sub_329A+34j
		clr.w	$24(a0)
		bra.w	loc_35CA
; ---------------------------------------------------------------------------
		bsr.w	sub_40AE
		bsr.w	sub_42B8
		lea	$44(a0),a1
		moveq	#0,d0
		bsr.w	sub_18CE
		btst	#3,(byte_FFFFD008).w
		beq.s	loc_32F8
		rts
; ---------------------------------------------------------------------------

loc_32F8:				; CODE XREF: sub_329A+5Aj
		btst	#7,(joy1Down).w
		bne.s	loc_3342
		tst.b	(byte_FFFFD003).w
		beq.s	loc_331A
		btst	#4,(joy1Triggered).w
		bne.w	loc_34A2
		btst	#1,2(a0)
		beq.s	loc_331A
		rts
; ---------------------------------------------------------------------------

loc_331A:				; CODE XREF: sub_329A+6Aj sub_329A+7Cj
		move.w	$24(a0),d0
		jmp	loc_3322(pc,d0.w)
; ---------------------------------------------------------------------------

loc_3322:
		bra.w	loc_3448
; ---------------------------------------------------------------------------
		bra.w	loc_3470
; ---------------------------------------------------------------------------
		bra.w	sub_3654
; ---------------------------------------------------------------------------
		bra.w	sub_3710
; ---------------------------------------------------------------------------
		bra.w	loc_3A46
; ---------------------------------------------------------------------------
		bra.w	sub_3A40
; ---------------------------------------------------------------------------
		bra.w	sub_3ABC
; ---------------------------------------------------------------------------
		bra.w	sub_3AE4
; ---------------------------------------------------------------------------

loc_3342:				; CODE XREF: sub_329A+64j
		move.b	(joy1Triggered).w,d0
		btst	#7,d0
		beq.w	loc_33AE
		move.w	#8,$5C(a0)
		bsr.w	sub_1846
		bne.w	loc_338E
		tst.w	$24(a0)
		bne.s	loc_336E
		cmpi.l	#1,$32(a0)
		beq.w	sub_4054

loc_336E:				; CODE XREF: sub_329A+C6j
		bsr.w	sub_3AE4
		tst.b	(byte_FFFFD003).w
		beq.s	loc_3382
		move.l	#$10003,$32(a0)
		bra.s	loc_338A
; ---------------------------------------------------------------------------

loc_3382:				; CODE XREF: sub_329A+DCj
		move.l	#1,$32(a0)

loc_338A:				; CODE XREF: sub_329A+E6j
		bra.w	loc_35CA
; ---------------------------------------------------------------------------

loc_338E:				; CODE XREF: sub_329A+BEj
		bsr.w	sub_3AE4
		bsr.w	sub_1856
		bcs.s	loc_33A6
		btst	#0,(byte_FFFFD008).w
		bne.s	loc_33A6
		bsr.w	sub_1840
		bne.s	loc_33AA

loc_33A6:				; CODE XREF: sub_329A+FCj
					; sub_329A+104j
		bsr.w	sub_41EE

loc_33AA:				; CODE XREF: sub_329A+10Aj
		bra.w	loc_35CA
; ---------------------------------------------------------------------------

loc_33AE:				; CODE XREF: sub_329A+B0j
		bsr.w	sub_1856
		bcs.s	loc_33F0
		btst	#0,(byte_FFFFD008).w
		bne.s	loc_33F0
		bsr.w	sub_1840
		beq.s	loc_33F0
		tst.w	$5C(a0)
		bmi.s	loc_33CC
		addq.w	#1,$5C(a0)

loc_33CC:				; CODE XREF: sub_329A+12Cj
		move.b	(joy1Triggered).w,d0
		andi.b	#$7C,d0	; '|'
		beq.w	loc_35CA
		cmpi.w	#$10,$5C(a0)
		bls.w	loc_35CA
		bsr.s	loc_33F8
		bsr.w	loc_35CA
		clr.w	$5C(a0)
		bra.w	sub_4054
; ---------------------------------------------------------------------------

loc_33F0:				; CODE XREF: sub_329A+118j
					; sub_329A+120j ...
		clr.l	$32(a0)
		bra.w	loc_35CA
; ---------------------------------------------------------------------------

loc_33F8:				; CODE XREF: sub_329A+148p
		btst	#6,d0
		bne.s	loc_342A
		btst	#5,d0
		bne.s	loc_341A
		btst	#4,d0
		bne.s	loc_3434
		btst	#3,d0
		bne.s	loc_343E
		move.l	#3,$32(a0)
		rts
; ---------------------------------------------------------------------------

loc_341A:				; CODE XREF: sub_329A+168j
		move.l	#5,$32(a0)
		btst	#2,(byte_FFFFD008).w
		bne.s	locret_3432

loc_342A:				; CODE XREF: sub_329A+162j
		move.l	#$10003,$32(a0)

locret_3432:				; CODE XREF: sub_329A+18Ej
		rts
; ---------------------------------------------------------------------------

loc_3434:				; CODE XREF: sub_329A+16Ej
		move.l	#$10004,$32(a0)
		rts
; ---------------------------------------------------------------------------

loc_343E:				; CODE XREF: sub_329A+174j
		move.l	#$20003,$32(a0)
		rts
; ---------------------------------------------------------------------------

loc_3448:				; CODE XREF: sub_329A:loc_3322j
		move.w	(joy1Down).w,d0
		andi.w	#$7070,d0
		bne.s	loc_345E
		tst.b	(byte_FFFFD060).w
		bne.w	sub_3BD8
		bra.w	loc_34DA
; ---------------------------------------------------------------------------

loc_345E:				; CODE XREF: sub_329A+1B6j
		bsr.w	loc_35CA
		move.b	(joy1Triggered).w,d0
		andi.b	#$70,d0	; 'p'
		bne.w	sub_4054
		rts
; ---------------------------------------------------------------------------

loc_3470:				; CODE XREF: sub_329A+8Cj
		btst	#1,2(a0)
		bne.w	loc_35CA
		move.w	(joy1Down).w,d0
		andi.w	#$7070,d0
		bne.s	loc_3490
		tst.b	(byte_FFFFD060).w
		bne.w	sub_3BD8
		bra.w	loc_34DA
; ---------------------------------------------------------------------------

loc_3490:				; CODE XREF: sub_329A+1E8j
		bsr.w	loc_35CA
		move.b	(joy1Triggered).w,d0
		andi.b	#$70,d0	; 'p'
		bne.w	sub_4054
		rts
; ---------------------------------------------------------------------------

loc_34A2:				; CODE XREF: sub_329A+72j
		bchg	#1,2(a0)
		move.b	(byte_FFFFD004).w,d0
		addq.b	#1,d0
		andi.b	#3,d0
		andi.b	#$FC,(byte_FFFFD004).w
		or.b	d0,(byte_FFFFD004).w
		cmpi.b	#3,d0
		bne.s	loc_34C8
		bsr.w	sub_5F10
		bra.s	loc_34CC
; ---------------------------------------------------------------------------

loc_34C8:				; CODE XREF: sub_329A+226j
		bsr.w	sub_5ED2

loc_34CC:				; CODE XREF: sub_329A+22Cj
		btst	#0,(byte_FFFFD004).w
		beq.w	sub_5E6C
		bra.w	sub_5EA8
; ---------------------------------------------------------------------------

loc_34DA:				; CODE XREF: sub_329A+1C0j
					; sub_329A+1F2j
		move.b	(joy1Triggered).w,d1
		bsr.w	sub_1856
		bcs.s	loc_34F2
		btst	#0,(byte_FFFFD008).w
		bne.s	loc_34F2
		bsr.w	sub_1840
		bne.s	loc_34FA

loc_34F2:				; CODE XREF: sub_329A+248j
					; sub_329A+250j
		clr.l	$32(a0)
		bra.w	loc_35BE
; ---------------------------------------------------------------------------

loc_34FA:				; CODE XREF: sub_329A+256j
		tst.b	(byte_FFFFD003).w
		beq.s	loc_3512
		cmpi.w	#3,$34(a0)
		bhi.s	loc_3512
		btst	#0,d1
		beq.s	loc_3512
		bra.w	loc_35BE
; ---------------------------------------------------------------------------

loc_3512:				; CODE XREF: sub_329A+264j
					; sub_329A+26Cj ...
		move.w	$34(a0),d0
		bne.s	loc_3532
		move.l	#1,$32(a0)
		bsr.w	sub_1846
		beq.s	loc_352E
		move.l	#$10003,$32(a0)

loc_352E:				; CODE XREF: sub_329A+28Aj
		bra.w	loc_35BE
; ---------------------------------------------------------------------------

loc_3532:				; CODE XREF: sub_329A+27Cj
		lea	unk_35C0(pc),a1
		move.b	(a1,d0.w),d0
		btst	#3,d1
		beq.s	loc_354C
		cmp.w	$32(a0),d0
		ble.s	loc_355C
		addq.w	#1,$32(a0)
		bra.s	loc_355C
; ---------------------------------------------------------------------------

loc_354C:				; CODE XREF: sub_329A+2A4j
		btst	#2,d1
		beq.s	loc_355C
		tst.w	$32(a0)
		beq.s	loc_355C
		subq.w	#1,$32(a0)

loc_355C:				; CODE XREF: sub_329A+2AAj
					; sub_329A+2B0j ...
		btst	#0,d1
		beq.s	loc_358C
		bsr.w	sub_1846
		beq.s	loc_3570
		cmpi.w	#3,$34(a0)
		bra.s	loc_3576
; ---------------------------------------------------------------------------

loc_3570:				; CODE XREF: sub_329A+2CCj
		cmpi.w	#1,$34(a0)

loc_3576:				; CODE XREF: sub_329A+2D4j
		ble.s	loc_35BE
		subq.w	#1,$34(a0)
		cmpi.w	#4,$34(a0)
		bne.s	loc_35AC
		move.w	#1,$32(a0)
		bra.s	loc_35AC
; ---------------------------------------------------------------------------

loc_358C:				; CODE XREF: sub_329A+2C6j
		btst	#1,d1
		beq.s	loc_35BE
		cmpi.w	#8,$34(a0)
		bcc.s	loc_35BE
		addq.w	#1,$34(a0)
		cmpi.w	#3,$34(a0)
		bne.s	loc_35AC
		move.w	#1,$32(a0)

loc_35AC:				; CODE XREF: sub_329A+2E8j
					; sub_329A+2F0j ...
		move.w	$34(a0),d0
		move.b	(a1,d0.w),d0
		cmp.w	$32(a0),d0
		bge.s	loc_35BE
		move.w	d0,$32(a0)

loc_35BE:				; CODE XREF: sub_329A+25Cj
					; sub_329A+274j ...
		bra.s	loc_35CA
; ---------------------------------------------------------------------------
unk_35C0:	dc.b   0		; DATA XREF: sub_329A:loc_3532o
		dc.b   0
		dc.b   0
		dc.b   2
		dc.b   2
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
; ---------------------------------------------------------------------------

loc_35CA:				; CODE XREF: sub_329A+3Ej
					; sub_329A:loc_338Aj ...
		move.w	$32(a0),d0
		or.w	$34(a0),d0
		bmi.s	locret_35EE
		bsr.s	sub_3624
		clr.b	$4C(a0)
		move.w	$30(a0),d1
		add.w	d1,d1
		add.w	d1,d1
		move.w	word_35F0(pc,d1.w),$C(a0)
		move.w	word_35F2(pc,d1.w),8(a0)

locret_35EE:				; CODE XREF: sub_329A+338j
		rts
; End of function sub_329A

; ---------------------------------------------------------------------------
word_35F0:	dc.w $C8
word_35F2:	dc.w $138
		dc.w $A6
		dc.w $188
		dc.w $B6
		dc.w $188
		dc.w $DE
		dc.w $174
		dc.w $D6
		dc.w $192
		dc.w $DE
		dc.w $1A8
		dc.w $EE
		dc.w $174
		dc.w $E6
		dc.w $192
		dc.w $EE
		dc.w $1A8
		dc.w $F6
		dc.w $192
		dc.w $104
		dc.w $192
		dc.w $116
		dc.w $188
		dc.w $126
		dc.w $188

; =============== S U B	R O U T	I N E =======================================


sub_3624:				; CODE XREF: sub_329A+33Ap
					; sub_3BD8:loc_3C8Ej
		moveq	#0,d0
		move.w	$34(a0),d1
		lea	word_3642(pc),a1
		subq.w	#1,d1
		bmi.s	loc_3638

loc_3632:				; CODE XREF: sub_3624+10j
		add.w	(a1)+,d0
		dbf	d1,loc_3632

loc_3638:				; CODE XREF: sub_3624+Cj
		add.w	$32(a0),d0
		move.w	d0,$30(a0)
		rts
; End of function sub_3624

; ---------------------------------------------------------------------------
word_3642:	dc.w 1			; DATA XREF: sub_3624+6o
		dc.w 1
		dc.w 1
		dc.w 3
		dc.w 3
		dc.w 1
		dc.w 1
		dc.w 1
		dc.w 1

; =============== S U B	R O U T	I N E =======================================


sub_3654:				; CODE XREF: sub_329A+90j
		move.w	(joy1Down).w,d0
		andi.w	#$7070,d0
		bne.s	loc_366A
		tst.b	(byte_FFFFD060).w
		bne.w	sub_3D80
		bsr.w	sub_367C

loc_366A:				; CODE XREF: sub_3654+8j
		bsr.w	sub_36CA
		move.b	(joy1Triggered).w,d0
		andi.b	#$70,d0	; 'p'
		bne.w	sub_4054
		rts
; End of function sub_3654


; =============== S U B	R O U T	I N E =======================================


sub_367C:				; CODE XREF: sub_3654+12p
		move.b	(joy1Triggered).w,d1
		btst	#2,d1
		beq.s	loc_3692
		tst.w	$32(a0)
		beq.s	loc_36A4
		subq.w	#1,$32(a0)
		bra.s	loc_36A4
; ---------------------------------------------------------------------------

loc_3692:				; CODE XREF: sub_367C+8j
		btst	#3,d1
		beq.s	loc_36A4
		cmpi.w	#2,$32(a0)
		bcc.s	loc_36A4
		addq.w	#1,$32(a0)

loc_36A4:				; CODE XREF: sub_367C+Ej sub_367C+14j	...
		btst	#1,d1
		beq.s	loc_36B8
		cmpi.w	#2,$34(a0)
		bcc.s	locret_36C8
		addq.w	#1,$34(a0)
		bra.s	locret_36C8
; ---------------------------------------------------------------------------

loc_36B8:				; CODE XREF: sub_367C+2Cj
		btst	#0,d1
		beq.s	locret_36C8
		tst.w	$34(a0)
		beq.s	locret_36C8
		subq.w	#1,$34(a0)

locret_36C8:				; CODE XREF: sub_367C+34j sub_367C+3Aj ...
		rts
; End of function sub_367C


; =============== S U B	R O U T	I N E =======================================


sub_36CA:				; CODE XREF: sub_3654:loc_366Ap
					; sub_3D80+6p
		move.w	$32(a0),d0
		or.w	$34(a0),d0
		bmi.s	locret_36E6
		bsr.s	sub_36F4
		clr.b	$4C(a0)
		move.w	word_36E8(pc,d0.w),$C(a0)
		move.w	word_36EE(pc,d1.w),8(a0)

locret_36E6:				; CODE XREF: sub_36CA+8j
		rts
; End of function sub_36CA

; ---------------------------------------------------------------------------
word_36E8:	dc.w $11E
		dc.w $12E
		dc.w $13E
word_36EE:	dc.w $D4
		dc.w $10C
		dc.w $144

; =============== S U B	R O U T	I N E =======================================


sub_36F4:				; CODE XREF: sub_36CA+Ap sub_3D80+1Aj
		move.w	$34(a0),d0
		move.w	d0,d2
		add.w	d0,d0
		add.w	d0,d2
		move.w	$32(a0),d1
		add.w	d1,d2
		addi.w	#$D,d2
		move.w	d2,$30(a0)
		add.w	d1,d1
		rts
; End of function sub_36F4


; =============== S U B	R O U T	I N E =======================================


sub_3710:				; CODE XREF: sub_329A+94j
		move.b	(joy1Triggered).w,d1
		move.b	d1,d0
		andi.b	#$70,d0	; 'p'
		bne.w	loc_3726
		tst.b	(byte_FFFFD060).w
		bne.w	sub_3DE0

loc_3726:				; CODE XREF: sub_3710+Aj
		cmpi.w	#1,$34(a0)
		beq.w	loc_37D2
		bhi.w	loc_3850
		move.b	d1,d0
		andi.b	#$70,d0	; 'p'
		bne.w	sub_3A08
		btst	#3,d1
		beq.s	loc_374E
		move.w	#2,$32(a0)
		bra.w	sub_3910
; ---------------------------------------------------------------------------

loc_374E:				; CODE XREF: sub_3710+32j
		tst.w	$3C(a0)
		bne.s	loc_3786
		btst	#2,d1
		beq.w	loc_376E
		tst.w	(word_FFFFD168).w
		beq.w	sub_3910
		move.w	#1,$32(a0)
		bra.w	sub_3910
; ---------------------------------------------------------------------------

loc_376E:				; CODE XREF: sub_3710+48j
		btst	#1,d1
		beq.w	sub_3910
		move.w	#1,$34(a0)
		move.w	$3E(a0),$32(a0)
		bra.w	sub_392A
; ---------------------------------------------------------------------------

loc_3786:				; CODE XREF: sub_3710+42j
		btst	#2,d1
		beq.w	loc_3796
		clr.w	$32(a0)
		bra.w	sub_3910
; ---------------------------------------------------------------------------

loc_3796:				; CODE XREF: sub_3710+7Aj
		btst	#1,d1
		beq.w	sub_3910
		tst.w	(word_FFFFD168).w
		beq.w	sub_3910
		move.w	#2,$34(a0)
		move.w	$40(a0),d0
		add.w	(word_FFFFD042).w,d0
		cmp.w	(word_FFFFD168).w,d0
		bcs.s	loc_37C8
		move.w	(word_FFFFD168).w,d0
		sub.w	(word_FFFFD042).w,d0
		subq.w	#1,d0
		move.w	d0,$40(a0)

loc_37C8:				; CODE XREF: sub_3710+A8j
		move.w	$40(a0),$32(a0)
		bra.w	sub_392A
; ---------------------------------------------------------------------------

loc_37D2:				; CODE XREF: sub_3710+1Cj
		move.b	d1,d0
		andi.b	#$70,d0	; 'p'
		bne.w	sub_3950
		btst	#0,d1
		beq.w	loc_37F8
		move.w	$32(a0),$3E(a0)
		clr.w	$34(a0)
		move.w	#2,$32(a0)
		bra.w	sub_3910
; ---------------------------------------------------------------------------

loc_37F8:				; CODE XREF: sub_3710+D0j
		btst	#1,d1
		beq.w	loc_3830
		tst.w	(word_FFFFD168).w
		beq.w	sub_392A
		move.w	$32(a0),$3E(a0)
		addq.w	#1,$34(a0)
		move.w	(word_FFFFD166).w,d0
		sub.w	(word_FFFFD042).w,d0
		bmi.s	loc_3826
		cmpi.w	#$A,d0
		bls.s	loc_3828
		moveq	#9,d0
		bra.s	loc_3828
; ---------------------------------------------------------------------------

loc_3826:				; CODE XREF: sub_3710+10Aj
		moveq	#0,d0

loc_3828:				; CODE XREF: sub_3710+110j
					; sub_3710+114j
		move.w	d0,$32(a0)
		bra.w	sub_392A
; ---------------------------------------------------------------------------

loc_3830:				; CODE XREF: sub_3710+ECj
		move.w	(word_FFFFD100).w,d0
		move.w	(word_FFFFD040).w,d2
		bsr.w	sub_38C8
		cmp.w	(word_FFFFD040).w,d2
		beq.w	sub_392A
		move.w	d2,(word_FFFFD040).w
		bsr.w	sub_5C50
		bra.w	sub_392A
; ---------------------------------------------------------------------------

loc_3850:				; CODE XREF: sub_3710+20j
		move.b	d1,d0
		tst.w	$3C(a0)
		beq.s	loc_3860
		andi.b	#$70,d0	; 'p'
		bne.w	sub_39AC

loc_3860:				; CODE XREF: sub_3710+146j
		tst.b	(byte_FFFFD060).w
		bne.s	locret_38BE
		btst	#0,d1
		beq.w	loc_3896
		tst.w	$3C(a0)
		bne.s	loc_3882
		subq.w	#1,$34(a0)
		move.w	$3E(a0),$32(a0)
		bra.w	sub_392A
; ---------------------------------------------------------------------------

loc_3882:				; CODE XREF: sub_3710+162j
		move.w	$32(a0),$40(a0)
		clr.w	$34(a0)
		move.w	#2,$32(a0)
		bra.w	sub_3910
; ---------------------------------------------------------------------------

loc_3896:				; CODE XREF: sub_3710+15Aj
		move.w	(word_FFFFD168).w,d0
		tst.w	$3C(a0)
		bne.s	loc_38A2
		addq.w	#1,d0

loc_38A2:				; CODE XREF: sub_3710+18Ej
		move.w	(word_FFFFD042).w,d2
		bsr.w	sub_38C8
		cmp.w	(word_FFFFD042).w,d2
		beq.w	sub_392A
		move.w	d2,(word_FFFFD042).w
		bsr.w	sub_5C68
		bra.w	sub_392A
; ---------------------------------------------------------------------------

locret_38BE:				; CODE XREF: sub_3710+154j
		rts
; End of function sub_3710


; =============== S U B	R O U T	I N E =======================================


sub_38C0:				; CODE XREF: sub_3950+4j sub_3950+Cj ...
		moveq	#$FFFFFF92,d7
		jsr	loc_109C(pc)
		rts
; End of function sub_38C0


; =============== S U B	R O U T	I N E =======================================


sub_38C8:				; CODE XREF: sub_3710+128p
					; sub_3710+196p
		move.b	$44(a0),d1
		btst	#3,d1
		beq.s	loc_38F0
		move.w	$32(a0),d3
		add.w	d2,d3
		addq.w	#1,d3
		cmp.w	d0,d3
		bcc.s	locret_38FA
		cmpi.w	#9,$32(a0)
		bcc.s	loc_38EC
		addq.w	#1,$32(a0)
		bra.s	locret_38FA
; ---------------------------------------------------------------------------

loc_38EC:				; CODE XREF: sub_38C8+1Cj
		addq.w	#1,d2
		bra.s	locret_38FA
; ---------------------------------------------------------------------------

loc_38F0:				; CODE XREF: sub_38C8+8j
		btst	#2,d1
		beq.s	locret_38FA
		bsr.w	sub_38FC

locret_38FA:				; CODE XREF: sub_38C8+14j sub_38C8+22j ...
		rts
; End of function sub_38C8


; =============== S U B	R O U T	I N E =======================================


sub_38FC:				; CODE XREF: sub_38C8+2Ep
		tst.w	$32(a0)
		beq.s	loc_3908
		subq.w	#1,$32(a0)
		rts
; ---------------------------------------------------------------------------

loc_3908:				; CODE XREF: sub_38FC+4j
		tst.w	d2
		beq.s	locret_390E
		subq.w	#1,d2

locret_390E:				; CODE XREF: sub_38FC+Ej
		rts
; End of function sub_38FC


; =============== S U B	R O U T	I N E =======================================


sub_3910:				; CODE XREF: sub_3710+3Aj sub_3710+50j ...
		move.w	#$11E,$C(a0)
		move.w	$32(a0),d0
		add.w	d0,d0
		move.w	word_3924(pc,d0.w),8(a0)
		rts
; End of function sub_3910

; ---------------------------------------------------------------------------
word_3924:	dc.w $D4
		dc.w $10C
		dc.w $144

; =============== S U B	R O U T	I N E =======================================


sub_392A:				; CODE XREF: sub_3710+72j sub_3710+BEj ...
		move.w	#$128,$C(a0)
		cmpi.w	#1,$34(a0)
		beq.s	loc_393E
		move.w	#$138,$C(a0)

loc_393E:				; CODE XREF: sub_392A+Cj
		move.w	$32(a0),d0
		mulu.w	#$10,d0
		addi.w	#$B8,d0	; '¸'
		move.w	d0,8(a0)
		rts
; End of function sub_392A


; =============== S U B	R O U T	I N E =======================================


sub_3950:				; CODE XREF: sub_3710+C8j
		tst.w	$30(a0)
		bmi.w	sub_38C0
		tst.w	$3C(a0)
		bne.w	sub_38C0
		move.w	$32(a0),d0
		add.w	(word_FFFFD040).w,d0
		cmp.w	(word_FFFFD100).w,d0
		bhi.w	sub_38C0
		lea	(unk_FFFFD102).w,a1
		move.b	(a1,d0.w),d0
		bsr.w	sub_5282
		bcs.s	locret_39AA
		move.w	(word_FFFFD166).w,d0
		sub.w	(word_FFFFD042).w,d0
		bmi.s	loc_39A0
		cmpi.w	#$A,d0
		bcs.s	loc_39A6
		addq.w	#1,(word_FFFFD042).w
		move.w	(word_FFFFD166).w,d0
		bsr.w	sub_5DCE
		move.w	d0,(word_FFFFD042).w
		bra.s	loc_39A6
; ---------------------------------------------------------------------------

loc_39A0:				; CODE XREF: sub_3950+36j
		move.w	(word_FFFFD166).w,(word_FFFFD042).w

loc_39A6:				; CODE XREF: sub_3950+3Cj sub_3950+4Ej
		bsr.w	sub_5C68

locret_39AA:				; CODE XREF: sub_3950+2Cj
		rts
; End of function sub_3950


; =============== S U B	R O U T	I N E =======================================


sub_39AC:				; CODE XREF: sub_3710+14Cj
		tst.w	$30(a0)
		bmi.w	sub_38C0
		move.w	$32(a0),d0
		add.w	(word_FFFFD042).w,d0
		cmp.w	(word_FFFFD168).w,d0
		bge.w	sub_38C0
		bsr.w	sub_52CA
		move	sr,-(sp)
		bsr.s	sub_39E8
		bsr.w	sub_5C68
		move	(sp)+,sr
		beq.s	loc_39DA
		bsr.w	sub_392A
		rts
; ---------------------------------------------------------------------------

loc_39DA:				; CODE XREF: sub_39AC+26j
		clr.w	$3C(a0)
		clr.l	$32(a0)
		bsr.s	sub_3A08
		bra.w	sub_3910
; End of function sub_39AC


; =============== S U B	R O U T	I N E =======================================


sub_39E8:				; CODE XREF: sub_39AC+1Ep
		move.w	$32(a0),d0
		move.w	(word_FFFFD042).w,d1
		add.w	d1,d0
		cmp.w	(word_FFFFD168).w,d0
		bcs.s	locret_3A06
		tst.w	d1
		beq.s	loc_3A02
		subq.w	#1,(word_FFFFD042).w
		rts
; ---------------------------------------------------------------------------

loc_3A02:				; CODE XREF: sub_39E8+12j
		subq.w	#1,$32(a0)

locret_3A06:				; CODE XREF: sub_39E8+Ej
		rts
; End of function sub_39E8


; =============== S U B	R O U T	I N E =======================================


sub_3A08:				; CODE XREF: sub_3710+2Aj sub_39AC+36p
		tst.w	$30(a0)
		bmi.w	sub_38C0
		move.w	$32(a0),d0
		cmpi.w	#2,d0
		beq.w	loc_3A34
		move.w	d0,$3C(a0)
		beq.s	loc_3A34
		tst.w	(word_FFFFD168).w
		bne.s	loc_3A34
		clr.w	$3C(a0)
		moveq	#$FFFFFF92,d7
		jsr	loc_109C(pc)
		rts
; ---------------------------------------------------------------------------

loc_3A34:				; CODE XREF: sub_3A08+10j sub_3A08+18j ...
		addi.w	#$16,d0
		move.w	d0,$30(a0)
		bra.w	sub_4054
; End of function sub_3A08


; =============== S U B	R O U T	I N E =======================================


sub_3A40:				; CODE XREF: sub_329A+9Cj
		lea	(byte_FFFFD011).w,a6
		bra.s	loc_3A4A
; ---------------------------------------------------------------------------

loc_3A46:				; CODE XREF: sub_329A+98j
		lea	(byte_FFFFD00F).w,a6

loc_3A4A:				; CODE XREF: sub_3A40+4j
		move.b	(joy1Triggered).w,d0
		move.b	d0,d1
		andi.b	#$70,d1	; 'p'
		beq.s	loc_3A60
		bsr.w	sub_416A
		moveq	#6,d1
		bra.w	sub_59DE
; ---------------------------------------------------------------------------

loc_3A60:				; CODE XREF: sub_3A40+14j
		tst.b	(byte_FFFFD060).w
		bne.w	sub_3F76
		move.b	$44(a0),d1
		move.b	(a6),d2
		btst	#0,d1
		beq.s	loc_3A8C
		moveq	#1,d1
		move	#4,ccr
		abcd	d1,d2
		cmpi.b	#$59,d2	; 'Y'
		bls.s	loc_3AA8
		moveq	#1,d2
		move.b	#$14,(byte_FFFFFE24).w
		bra.s	loc_3AA8
; ---------------------------------------------------------------------------

loc_3A8C:				; CODE XREF: sub_3A40+32j
		btst	#1,d1
		beq.s	loc_3AAA
		moveq	#1,d1
		move	#4,ccr
		sbcd	d1,d2
		cmpi.b	#1,d2
		bge.s	loc_3AA8
		moveq	#$59,d2	; 'Y'
		move.b	#$14,(byte_FFFFFE24).w

loc_3AA8:				; CODE XREF: sub_3A40+40j sub_3A40+4Aj ...
		move.b	d2,(a6)

loc_3AAA:				; CODE XREF: sub_3A40+50j
		move.w	#$C8,$C(a0) ; 'È'
		move.w	#$144,8(a0)
		move.b	(a6),d1
		bra.w	sub_5480
; End of function sub_3A40


; =============== S U B	R O U T	I N E =======================================


sub_3ABC:				; CODE XREF: sub_329A+A0j
		cmpi.w	#0,(word_FFFFD024).w
		beq.w	sub_416A
		move.b	(joy1Triggered).w,d1
		andi.b	#$70,d1	; 'p'
		beq.s	locret_3AE2
		cmpi.w	#$100,(word_FFFFD024).w
		bne.s	locret_3AE2
		moveq	#$1A,d0
		bsr.w	sub_44CC
		bra.w	sub_416A
; ---------------------------------------------------------------------------

locret_3AE2:				; CODE XREF: sub_3ABC+12j sub_3ABC+1Aj
		rts
; End of function sub_3ABC


; =============== S U B	R O U T	I N E =======================================


sub_3AE4:				; CODE XREF: sub_329A+A4j
					; sub_329A:loc_336Ep ...
		tst.b	(byte_FFFFD003).w
		bne.w	sub_3B76
; End of function sub_3AE4


; =============== S U B	R O U T	I N E =======================================


sub_3AEC:				; CODE XREF: sub_41EE+8p
		clr.l	(dword_FFFFD336).w
		move.w	$24(a0),d0
		jmp	loc_3AF8(pc,d0.w)
; End of function sub_3AEC

; ---------------------------------------------------------------------------

loc_3AF8:
		bra.w	loc_3B3A
; ---------------------------------------------------------------------------
		bra.w	loc_3B56
; ---------------------------------------------------------------------------
		bra.w	sub_3B28
; ---------------------------------------------------------------------------
		bra.w	sub_3B28
; ---------------------------------------------------------------------------
		bra.w	loc_3B1E
; ---------------------------------------------------------------------------
		bra.w	loc_3B1E
; ---------------------------------------------------------------------------
		bra.w	loc_3B18
; ---------------------------------------------------------------------------
		bra.w	loc_3B1E
; ---------------------------------------------------------------------------

loc_3B18:				; CODE XREF: ROM:00003B10j
		bsr.w	sub_5034
		bra.s	sub_3B28
; ---------------------------------------------------------------------------

loc_3B1E:				; CODE XREF: ROM:00003B08j
					; ROM:00003B0Cj ...
		bsr.s	sub_3B28
		moveq	#6,d1
		bsr.w	sub_59DE
		rts

; =============== S U B	R O U T	I N E =======================================


sub_3B28:				; CODE XREF: ROM:00003B00j
					; ROM:00003B04j ...
		bsr.w	loc_4EAE
		bsr.w	sub_5C20
		clr.w	$24(a0)
		tst.b	(byte_FFFFD003).w
		bne.s	loc_3B56

loc_3B3A:				; CODE XREF: ROM:loc_3AF8j
		btst	#2,(byte_FFFFD008).w
		beq.s	loc_3B4C
		move.l	#5,$32(a0)
		rts
; ---------------------------------------------------------------------------

loc_3B4C:				; CODE XREF: sub_3B28+18j
		move.l	#$10003,$32(a0)
		rts
; ---------------------------------------------------------------------------

loc_3B56:				; CODE XREF: ROM:00003AFCj
					; sub_3B28+10j
		btst	#0,(byte_FFFFD004).w
		beq.w	sub_4FB4
		bclr	#0,(byte_FFFFD004).w
		bsr.w	loc_5E74
		moveq	#$A,d1
		moveq	#0,d0
		bsr.w	sub_5764
		bra.w	sub_4FB4
; End of function sub_3B28


; =============== S U B	R O U T	I N E =======================================


sub_3B76:				; CODE XREF: sub_3AE4+4j
		clr.l	(dword_FFFFD336).w
		move.w	$24(a0),d0
		jmp	loc_3B82(pc,d0.w)
; End of function sub_3B76

; ---------------------------------------------------------------------------

loc_3B82:
		nop
		rts
; ---------------------------------------------------------------------------
		bra.w	loc_3BBC
; ---------------------------------------------------------------------------
		bra.w	sub_3BAE
; ---------------------------------------------------------------------------
		bra.w	sub_3BAE
; ---------------------------------------------------------------------------
		bra.w	loc_3BA2
; ---------------------------------------------------------------------------
		bra.w	loc_3BA2
; ---------------------------------------------------------------------------
		bra.w	loc_3BAA
; ---------------------------------------------------------------------------
		bra.w	*+4
; ---------------------------------------------------------------------------

loc_3BA2:				; CODE XREF: ROM:00003B92j
					; ROM:00003B96j ...
		bsr.s	sub_3BAE
		moveq	#6,d1
		bra.w	sub_59DE
; ---------------------------------------------------------------------------

loc_3BAA:				; CODE XREF: ROM:00003B9Aj
		bsr.w	sub_5034

; =============== S U B	R O U T	I N E =======================================


sub_3BAE:				; CODE XREF: ROM:00003B8Aj
					; ROM:00003B8Ej ...
		bsr.w	loc_4EAE
		bsr.w	sub_5C20
		move.w	#4,$24(a0)

loc_3BBC:				; CODE XREF: ROM:00003B86j
		btst	#2,(byte_FFFFD008).w
		beq.s	loc_3BCE
		move.l	#$10003,$32(a0)
		rts
; ---------------------------------------------------------------------------

loc_3BCE:				; CODE XREF: sub_3BAE+14j
		move.l	#5,$32(a0)
		rts
; End of function sub_3BAE


; =============== S U B	R O U T	I N E =======================================


sub_3BD8:				; CODE XREF: sub_329A+1BCj
					; sub_329A+1EEj
		bsr.w	sub_1856
		bcs.s	loc_3BEC
		btst	#0,(byte_FFFFD008).w
		bne.s	loc_3BEC
		bsr.w	sub_1840
		bne.s	loc_3BF4

loc_3BEC:				; CODE XREF: sub_3BD8+4j sub_3BD8+Cj
		clr.l	$32(a0)
		bra.w	loc_35CA
; ---------------------------------------------------------------------------

loc_3BF4:				; CODE XREF: sub_3BD8+12j
		move.w	$34(a0),d0
		bne.s	loc_3C14
		move.l	#1,$32(a0)
		bsr.w	sub_1846
		beq.s	loc_3C10
		move.l	#$10003,$32(a0)

loc_3C10:				; CODE XREF: sub_3BD8+2Ej
		bra.w	loc_35CA
; ---------------------------------------------------------------------------

loc_3C14:				; CODE XREF: sub_3BD8+20j
		tst.b	$4C(a0)
		beq.s	loc_3C1E
		bsr.w	loc_35CA

loc_3C1E:				; CODE XREF: sub_3BD8+40j
		lea	unk_3C94(pc),a1
		tst.b	(byte_FFFFD003).w
		bne.s	loc_3C2E
		bsr.w	sub_1846
		beq.s	loc_3C30

loc_3C2E:				; CODE XREF: sub_3BD8+4Ej
		addq.w	#8,a1

loc_3C30:				; CODE XREF: sub_3BD8+54j
		bsr.w	sub_3FD4
		lea	off_3CB8(pc),a1
		bsr.w	sub_4016
		bcs.s	locret_3C92
		move.w	$34(a0),d0
		bmi.s	locret_3C92
		cmpi.w	#3,d0
		bcs.s	loc_3C8E
		cmpi.w	#5,d0
		bhi.s	loc_3C8E
		move.w	$32(a0),d1
		bmi.s	locret_3C92
		cmpi.w	#1,$32(a0)
		bne.s	loc_3C84
		move.w	$C(a0),d0
		lea	unk_3CA4(pc),a1
		bsr.w	sub_4048
		move.w	d1,$34(a0)
		bmi.s	loc_3C7C
		cmpi.w	#5,d1
		bne.s	loc_3C8E
		clr.w	$32(a0)
		bra.s	loc_3C8E
; ---------------------------------------------------------------------------

loc_3C7C:				; CODE XREF: sub_3BD8+96j
		move.w	#$FFFF,$30(a0)
		rts
; ---------------------------------------------------------------------------

loc_3C84:				; CODE XREF: sub_3BD8+84j
		lea	off_3D18(pc),a1
		bsr.w	sub_4016
		bcs.s	locret_3C92

loc_3C8E:				; CODE XREF: sub_3BD8+70j sub_3BD8+76j ...
		bra.w	sub_3624
; ---------------------------------------------------------------------------

locret_3C92:				; CODE XREF: sub_3BD8+64j sub_3BD8+6Aj ...
		rts
; End of function sub_3BD8

; ---------------------------------------------------------------------------
unk_3C94:	dc.b   1		; DATA XREF: sub_3BD8:loc_3C1Eo
		dc.b $6C ; l
		dc.b   1
		dc.b $A8 ; ¨
		dc.b   0
		dc.b $A0 ;  
		dc.b   1
		dc.b $28 ; (
		dc.b   1
		dc.b $6C ; l
		dc.b   1
		dc.b $A8 ; ¨
		dc.b   0
		dc.b $CA ; Ê
		dc.b   1
		dc.b $28 ; (
unk_3CA4:	dc.b   0		; DATA XREF: sub_3BD8+8Ao
		dc.b $D8 ; Ø
		dc.b   0
		dc.b   3
		dc.b   0
		dc.b $DC ; Ü
		dc.b $80 ; €
		dc.b   3
		dc.b   0
		dc.b $E8 ; è
		dc.b   0
		dc.b   4
		dc.b   0
		dc.b $EC ; ì
		dc.b $80 ; €
		dc.b   4
		dc.b   0
		dc.b $F8 ; ø
		dc.b   0
		dc.b   5
off_3CB8:	dc.l off_3D30		; DATA XREF: sub_3BD8+5Co
		dc.b   0
		dc.b $AA ; ª
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $B0 ; °
		dc.b $80 ; €
		dc.b   1
		dc.b   0
		dc.b $BA ; º
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $CA ; Ê
		dc.b $80 ; €
		dc.b   2
		dc.b   0
		dc.b $D8 ; Ø
		dc.b   0
		dc.b   3
		dc.b   0
		dc.b $E8 ; è
		dc.b   0
		dc.b   4
		dc.b   0
		dc.b $F8 ; ø
		dc.b   0
		dc.b   5
		dc.b   0
		dc.b $FC ; ü
		dc.b $80 ; €
		dc.b   5
		dc.b   1
		dc.b   4
		dc.b   0
		dc.b   6
		dc.b   1
		dc.b $10
		dc.b $80 ; €
		dc.b   6
		dc.b   1
		dc.b $18
		dc.b   0
		dc.b   7
		dc.b   1
		dc.b $20
		dc.b $80 ; €
		dc.b   7
		dc.b   1
		dc.b $28 ; (
		dc.b   0
		dc.b   8
		dc.b   0
		dc.b   0
		dc.b $3D ; =
		dc.b $30 ; 0
		dc.b   0
		dc.b $D8 ; Ø
		dc.b   0
		dc.b   3
		dc.b   0
		dc.b $E8 ; è
		dc.b   0
		dc.b   4
		dc.b   0
		dc.b $F8 ; ø
		dc.b   0
		dc.b   5
		dc.b   0
		dc.b $FC ; ü
		dc.b $80 ; €
		dc.b   5
		dc.b   1
		dc.b   4
		dc.b   0
		dc.b   6
		dc.b   1
		dc.b $10
		dc.b $80 ; €
		dc.b   6
		dc.b   1
		dc.b $18
		dc.b   0
		dc.b   7
		dc.b   1
		dc.b $20
		dc.b $80 ; €
		dc.b   7
		dc.b   1
		dc.b $28 ; (
		dc.b   0
		dc.b   8
off_3D18:	dc.l off_3D30		; DATA XREF: sub_3BD8:loc_3C84o
		dc.b   0
		dc.b $D2 ; Ò
		dc.b $80 ; €
		dc.b   2
		dc.b   0
		dc.b $DF ; ß
		dc.b   0
		dc.b   3
		dc.b   0
		dc.b $E2 ; â
		dc.b $80 ; €
		dc.b   3
		dc.b   0
		dc.b $EF ; ï
		dc.b   0
		dc.b   4
		dc.b   0
		dc.b $FC ; ü
		dc.b $80 ; €
		dc.b   4
off_3D30:	dc.l unk_3D54		; DATA XREF: ROM:off_3CB8o
					; ROM:off_3D18o
		dc.b   0
		dc.b   0
		dc.b $3D ; =
		dc.b $58 ; X
		dc.b   0
		dc.b   0
		dc.b $3D ; =
		dc.b $58 ; X
		dc.b   0
		dc.b   0
		dc.b $3D ; =
		dc.b $60 ; `
		dc.b   0
		dc.b   0
		dc.b $3D ; =
		dc.b $60 ; `
		dc.b   0
		dc.b   0
		dc.b $3D ; =
		dc.b $60 ; `
		dc.b   0
		dc.b   0
		dc.b $3D ; =
		dc.b $74 ; t
		dc.b   0
		dc.b   0
		dc.b $3D ; =
		dc.b $58 ; X
		dc.b   0
		dc.b   0
		dc.b $3D ; =
		dc.b $58 ; X
unk_3D54:	dc.b   1		; DATA XREF: ROM:off_3D30o
		dc.b $A8 ; ¨
		dc.b   0
		dc.b   0
		dc.b   1
		dc.b $88 ; ˆ
		dc.b   0
		dc.b   0
		dc.b   1
		dc.b $A8 ; ¨
		dc.b $80 ; €
		dc.b   0
		dc.b   1
		dc.b $78 ; x
		dc.b   0
		dc.b   0
		dc.b   1
		dc.b $7B ; {
		dc.b $80 ; €
		dc.b   0
		dc.b   1
		dc.b $95 ; •
		dc.b   0
		dc.b   1
		dc.b   1
		dc.b $98 ; ˜
		dc.b $80 ; €
		dc.b   1
		dc.b   1
		dc.b $A8 ; ¨
		dc.b   0
		dc.b   2
		dc.b   1
		dc.b $74 ; t
		dc.b $FF
		dc.b $FF
		dc.b   1
		dc.b $9C ; œ
		dc.b   0
		dc.b   0
		dc.b   1
		dc.b $A8 ; ¨
		dc.b $80 ; €
		dc.b   0

; =============== S U B	R O U T	I N E =======================================


sub_3D80:				; CODE XREF: sub_3654+Ej
		tst.b	$4C(a0)
		beq.s	loc_3D8A
		bsr.w	sub_36CA

loc_3D8A:				; CODE XREF: sub_3D80+4j
		lea	word_3DA0(pc),a1
		bsr.w	sub_3FD4
		lea	off_3DA8(pc),a1
		bsr.w	sub_4016
		bcc.w	sub_36F4
		rts
; End of function sub_3D80

; ---------------------------------------------------------------------------
word_3DA0:	dc.w $A8		; DATA XREF: sub_3D80:loc_3D8Ao
		dc.w $148
		dc.w $112
		dc.w $13E
off_3DA8:	dc.l off_3DC0		; DATA XREF: sub_3D80+12o
		dc.b   1
		dc.b $1E
		dc.b   0
		dc.b   0
		dc.b   1
		dc.b $22 ; "
		dc.b $80 ; €
		dc.b   0
		dc.b   1
		dc.b $2E ; .
		dc.b   0
		dc.b   1
		dc.b   1
		dc.b $32 ; 2
		dc.b $80 ; €
		dc.b   1
		dc.b   1
		dc.b $3E ; >
		dc.b   0
		dc.b   2
off_3DC0:	dc.l unk_3DCC		; DATA XREF: ROM:off_3DA8o
		dc.b   0
		dc.b   0
		dc.b $3D ; =
		dc.b $CC ; Ì
		dc.b   0
		dc.b   0
		dc.b $3D ; =
		dc.b $CC ; Ì
unk_3DCC:	dc.b   0		; DATA XREF: ROM:off_3DC0o
					; ROM:off_3E12o
		dc.b $D8 ; Ø
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $E0 ; à
		dc.b $80 ; €
		dc.b   0
		dc.b   1
		dc.b $10
		dc.b   0
		dc.b   1
		dc.b   1
		dc.b $18
		dc.b $80 ; €
		dc.b   1
		dc.b   1
		dc.b $48 ; H
		dc.b   0
		dc.b   2

; =============== S U B	R O U T	I N E =======================================


sub_3DE0:				; CODE XREF: sub_3710+12j
		lea	off_3DF2(pc),a1
		bsr.w	sub_3E6A
		lea	off_3DFA(pc),a1
		bsr.w	sub_3F56
		rts
; End of function sub_3DE0

; ---------------------------------------------------------------------------
off_3DF2:	dc.l unk_A00150		; DATA XREF: sub_3DE0o
		dc.b   1
		dc.b $12
		dc.b   1
		dc.b $39 ; 9
off_3DFA:	dc.l off_3E12		; DATA XREF: sub_3DE0+8o
		dc.b   1
		dc.b $1E
		dc.b   0
		dc.b   0
		dc.b   1
		dc.b $20
		dc.b $80 ; €
		dc.b   0
		dc.b   1
		dc.b $29 ; )
		dc.b   0
		dc.b   1
		dc.b   1
		dc.b $2F ; /
		dc.b $80 ; €
		dc.b   1
		dc.b   1
		dc.b $39 ; 9
		dc.b   0
		dc.b   2
off_3E12:	dc.l unk_3DCC		; DATA XREF: ROM:off_3DFAo
		dc.b   0
		dc.b   0
		dc.b $3E ; >
		dc.b $1E
		dc.b   0
		dc.b   0
		dc.b $3E ; >
		dc.b $1E
		dc.b   0
		dc.b $B8 ; ¸
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $B9 ; ¹
		dc.b $80 ; €
		dc.b   0
		dc.b   0
		dc.b $C8 ; È
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $C9 ; É
		dc.b $80 ; €
		dc.b   1
		dc.b   0
		dc.b $D8 ; Ø
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $D9 ; Ù
		dc.b $80 ; €
		dc.b   2
		dc.b   0
		dc.b $E8 ; è
		dc.b   0
		dc.b   3
		dc.b   0
		dc.b $E9 ; é
		dc.b $80 ; €
		dc.b   3
		dc.b   0
		dc.b $F8 ; ø
		dc.b   0
		dc.b   4
		dc.b   0
		dc.b $F9 ; ù
		dc.b $80 ; €
		dc.b   4
		dc.b   1
		dc.b   8
		dc.b   0
		dc.b   5
		dc.b   1
		dc.b   9
		dc.b $80 ; €
		dc.b   5
		dc.b   1
		dc.b $18
		dc.b   0
		dc.b   6
		dc.b   1
		dc.b $19
		dc.b $80 ; €
		dc.b   6
		dc.b   1
		dc.b $28 ; (
		dc.b   0
		dc.b   7
		dc.b   1
		dc.b $29 ; )
		dc.b $80 ; €
		dc.b   7
		dc.b   1
		dc.b $38 ; 8
		dc.b   0
		dc.b   8
		dc.b   1
		dc.b $39 ; 9
		dc.b $80 ; €
		dc.b   8
		dc.b   1
		dc.b $51 ; Q
		dc.b   0
		dc.b   9

; =============== S U B	R O U T	I N E =======================================


sub_3E6A:				; CODE XREF: sub_3DE0+4p
		move.l	a1,-(sp)
		bsr.w	sub_3FD4
		movea.l	(sp)+,a1
		tst.w	$34(a0)
		bne.s	loc_3EA6
		moveq	#0,d7
		move.w	(a1),d7
		addq.w	#8,d7
		swap	d7
		cmp.l	8(a0),d7
		blt.s	loc_3E8C
		move.l	d7,8(a0)
		bra.s	locret_3EE8
; ---------------------------------------------------------------------------

loc_3E8C:				; CODE XREF: sub_3E6A+1Aj
		moveq	#0,d7
		move.w	2(a1),d7
		subq.w	#8,d7
		swap	d7
		cmp.l	8(a0),d7
		bgt.s	locret_3EE8
		move.l	8(a0),d6
		move.l	d7,8(a0)
		bra.s	locret_3EE8
; ---------------------------------------------------------------------------

loc_3EA6:				; CODE XREF: sub_3E6A+Cj
		cmpi.w	#1,$34(a0)
		bne.s	loc_3EC8
		move.w	(word_FFFFD100).w,d0
		move.w	(word_FFFFD040).w,d2
		bsr.s	sub_3EEA
		cmp.w	(word_FFFFD040).w,d2
		beq.s	locret_3EE8
		move.w	d2,(word_FFFFD040).w
		bsr.w	sub_5C50
		bra.s	locret_3EE8
; ---------------------------------------------------------------------------

loc_3EC8:				; CODE XREF: sub_3E6A+42j
		move.w	(word_FFFFD168).w,d0
		tst.w	$3C(a0)
		bne.s	loc_3ED4
		addq.w	#1,d0

loc_3ED4:				; CODE XREF: sub_3E6A+66j
		move.w	(word_FFFFD042).w,d2
		bsr.s	sub_3EEA
		cmp.w	(word_FFFFD042).w,d2
		beq.s	locret_3EE8
		move.w	d2,(word_FFFFD042).w
		bsr.w	sub_5C68

locret_3EE8:				; CODE XREF: sub_3E6A+20j sub_3E6A+30j ...
		rts
; End of function sub_3E6A


; =============== S U B	R O U T	I N E =======================================


sub_3EEA:				; CODE XREF: sub_3E6A+4Cp sub_3E6A+6Ep
		moveq	#0,d7
		move.w	(a1),d7
		addq.w	#8,d7
		swap	d7
		cmp.l	8(a0),d7
		blt.s	loc_3F1A
		move.l	8(a0),d6
		move.l	d7,8(a0)
		sub.l	d7,d6
		add.l	d6,$58(a0)
		cmpi.w	#$FFF8,$58(a0)
		bgt.s	locret_3F54
		clr.l	$58(a0)
		tst.w	d2
		beq.s	locret_3F54
		subq.w	#1,d2
		bra.s	locret_3F54
; ---------------------------------------------------------------------------

loc_3F1A:				; CODE XREF: sub_3EEA+Cj
		moveq	#0,d7
		move.w	2(a1),d7
		subq.w	#8,d7
		swap	d7
		cmp.l	8(a0),d7
		bgt.s	loc_3F50
		move.l	8(a0),d6
		move.l	d7,8(a0)
		sub.l	d7,d6
		add.l	d6,$58(a0)
		cmpi.w	#8,$58(a0)
		bls.s	locret_3F54
		move.l	d0,d5
		subi.w	#$A,d5
		bmi.w	loc_3F50
		cmp.w	d5,d2
		bge.s	loc_3F50
		addq.w	#1,d2

loc_3F50:				; CODE XREF: sub_3EEA+3Ej sub_3EEA+5Cj ...
		clr.l	$58(a0)

locret_3F54:				; CODE XREF: sub_3EEA+22j sub_3EEA+2Aj ...
		rts
; End of function sub_3EEA


; =============== S U B	R O U T	I N E =======================================


sub_3F56:				; CODE XREF: sub_3DE0+Cp
		movem.l	d0/d2,-(sp)
		bsr.w	sub_4016
		movem.l	(sp)+,d0/d2
		bcs.s	loc_3F6E
		move.w	$32(a0),d7
		move.w	d7,$30(a0)
		rts
; ---------------------------------------------------------------------------

loc_3F6E:				; CODE XREF: sub_3F56+Cj
		move.w	#$FFFF,$30(a0)
		rts
; End of function sub_3F56


; =============== S U B	R O U T	I N E =======================================


sub_3F76:				; CODE XREF: sub_3A40+24j
		moveq	#0,d3
		move.b	(a6),d2
		move.l	$54(a0),d0
		beq.s	loc_3FC2
		bpl.s	loc_3F86
		moveq	#$FFFFFFFF,d3
		neg.l	d0

loc_3F86:				; CODE XREF: sub_3F76+Aj
		add.l	$58(a0),d0
		swap	d0
		move.w	d0,d1
		andi.w	#$1F,d0
		swap	d0
		move.l	d0,$58(a0)
		lsr.w	#5,d1
		andi.w	#7,d1
		tst.w	d3
		bpl.s	loc_3FB2
		move	#4,ccr
		abcd	d1,d2
		cmpi.b	#$59,d2	; 'Y'
		bls.s	loc_3FC0
		moveq	#1,d2
		bra.s	loc_3FC0
; ---------------------------------------------------------------------------

loc_3FB2:				; CODE XREF: sub_3F76+2Aj
		move	#4,ccr
		sbcd	d1,d2
		cmpi.b	#1,d2
		bge.s	loc_3FC0
		moveq	#$59,d2	; 'Y'

loc_3FC0:				; CODE XREF: sub_3F76+36j sub_3F76+3Aj ...
		move.b	d2,(a6)

loc_3FC2:				; CODE XREF: sub_3F76+8j
		move.w	#$C8,$C(a0) ; 'È'
		move.w	#$144,8(a0)
		move.b	(a6),d1
		bra.w	sub_5480
; End of function sub_3F76


; =============== S U B	R O U T	I N E =======================================


sub_3FD4:				; CODE XREF: sub_3BD8:loc_3C30p
					; sub_3D80+Ep ...
		move.l	$50(a0),d0
		add.l	d0,8(a0)
		move.w	(a1)+,d0
		cmp.w	8(a0),d0
		ble.s	loc_3FE8
		move.w	d0,8(a0)

loc_3FE8:				; CODE XREF: sub_3FD4+Ej
		move.w	(a1)+,d0
		cmp.w	8(a0),d0
		bge.s	loc_3FF4
		move.w	d0,8(a0)

loc_3FF4:				; CODE XREF: sub_3FD4+1Aj
		move.l	$54(a0),d0
		add.l	d0,$C(a0)
		move.w	(a1)+,d0
		cmp.w	$C(a0),d0
		ble.s	loc_4008
		move.w	d0,$C(a0)

loc_4008:				; CODE XREF: sub_3FD4+2Ej
		move.w	(a1)+,d0
		cmp.w	$C(a0),d0
		bge.s	locret_4014

loc_4010:
		move.w	d0,$C(a0)

locret_4014:				; CODE XREF: sub_3FD4+3Aj
		rts
; End of function sub_3FD4


; =============== S U B	R O U T	I N E =======================================


sub_4016:				; CODE XREF: sub_3BD8+60p sub_3BD8+B0p ...
		movea.l	(a1)+,a2
		move.w	$C(a0),d0
		bsr.s	sub_4048
		move.w	d1,$34(a0)
		bpl.s	loc_4026
		bmi.s	loc_403C

loc_4026:				; CODE XREF: sub_4016+Cj sub_42B8+BAp
		move.w	8(a0),d0
		add.w	d1,d1
		add.w	d1,d1
		movea.l	(a2,d1.w),a1
		bsr.s	sub_4048
		move.w	d1,$32(a0)
		bmi.s	loc_403C
		rts
; ---------------------------------------------------------------------------

loc_403C:				; CODE XREF: sub_4016+Ej sub_4016+22j
		move.w	#$FFFF,$30(a0)
		ori	#1,ccr
		rts
; End of function sub_4016


; =============== S U B	R O U T	I N E =======================================


sub_4048:				; CODE XREF: sub_3BD8+8Ep sub_4016+6p	...
		cmp.w	(a1)+,d0
		bls.s	loc_4050
		addq.w	#2,a1
		bra.s	sub_4048
; ---------------------------------------------------------------------------

loc_4050:				; CODE XREF: sub_4048+2j
		move.w	(a1),d1
		rts
; End of function sub_4048


; =============== S U B	R O U T	I N E =======================================


sub_4054:				; CODE XREF: sub_329A+D0j
					; sub_329A+152j ...
		move.w	$30(a0),d0
		bpl.s	loc_4066
		move.w	d7,-(sp)
		moveq	#$FFFFFF92,d7
		jsr	loc_109C(pc)
		move.w	(sp)+,d7
		rts
; ---------------------------------------------------------------------------

loc_4066:				; CODE XREF: sub_4054+4j
		cmpi.w	#4,$24(a0)
		beq.s	loc_4074
		lea	unk_4084(pc),a1
		bra.s	loc_4078
; ---------------------------------------------------------------------------

loc_4074:				; CODE XREF: sub_4054+18j
		lea	unk_409E(pc),a1

loc_4078:				; CODE XREF: sub_4054+1Ej
		move.w	$30(a0),d0
		move.b	(a1,d0.w),d0
		bra.w	sub_44CC
; End of function sub_4054

; ---------------------------------------------------------------------------
unk_4084:	dc.b   0		; DATA XREF: sub_4054+1Ao
		dc.b  $C
		dc.b $15
		dc.b   4
		dc.b   2
		dc.b   5
		dc.b   7
		dc.b   6
		dc.b   8
		dc.b   3
		dc.b   9
		dc.b $1F
		dc.b  $E
		dc.b $10
		dc.b  $F
		dc.b  $A
		dc.b $12
		dc.b $13
		dc.b $16
		dc.b $14
		dc.b $1C
		dc.b $20
		dc.b $21 ; !
		dc.b $22 ; "
		dc.b $23 ; #
		dc.b   0
unk_409E:	dc.b   0		; DATA XREF: sub_4054:loc_4074o
		dc.b  $C
		dc.b $15
		dc.b   4
		dc.b   2
		dc.b   5
		dc.b $18
		dc.b   6
		dc.b $17
		dc.b   3
		dc.b   9
		dc.b $1F
		dc.b $19
		dc.b $13
		dc.b   9
		dc.b   0

; =============== S U B	R O U T	I N E =======================================


sub_40AE:				; CODE XREF: sub_329A+42p
		addi.b	#$40,$21(a0) ; '@'
		bcc.s	locret_40D2
		move.b	$21(a0),d0
		addq.b	#1,d0
		andi.w	#$F,d0
		move.b	d0,$21(a0)
		add.w	d0,d0
		move.w	word_40D4(pc,d0.w),(paletteBuffer2+$16).w
		bset	#0,(vdpUpdateFlags).w

locret_40D2:				; CODE XREF: sub_40AE+6j
		rts
; End of function sub_40AE

; ---------------------------------------------------------------------------
word_40D4:	dc.w 0
		dc.w $22
		dc.w $44
		dc.w $66
		dc.w $88
		dc.w $AA
		dc.w $CC
		dc.w $EE
		dc.w $CC
		dc.w $AA
		dc.w $88
		dc.w $66
		dc.w $44
		dc.w $22
		dc.w 0
		dc.w 0

; =============== S U B	R O U T	I N E =======================================


sub_40F4:				; CODE XREF: sub_4CA6:loc_4CB2p
					; sub_4FB4p
		move.l	#$10003,(dword_FFFFD332).w
		tst.b	(byte_FFFFD003).w
		bne.s	loc_4108
		move.l	(dword_FFFFD336).w,(dword_FFFFD332).w

loc_4108:				; CODE XREF: sub_40F4+Cj
		move.w	(word_FFFFD33A).w,(word_FFFFD330).w
		bclr	#1,(byte_FFFFD302).w
		clr.l	(dword_FFFFD336).w
		clr.w	(word_FFFFD324).w
		st	(byte_FFFFD34C).w
		bclr	#0,(byte_FFFFD004).w
		bclr	#1,(byte_FFFFD004).w
		rts
; End of function sub_40F4


; =============== S U B	R O U T	I N E =======================================


sub_412E:				; CODE XREF: sub_4CA6+6p sub_4F9A+4p
		move.l	#$10003,(dword_FFFFD332).w
		tst.b	(byte_FFFFD003).w
		beq.s	loc_4142
		move.l	(dword_FFFFD336).w,(dword_FFFFD332).w

loc_4142:				; CODE XREF: sub_412E+Cj
		move.w	(word_FFFFD33A).w,(word_FFFFD330).w
		bclr	#1,(byte_FFFFD302).w
		clr.l	(dword_FFFFD336).w
		move.w	#4,(word_FFFFD324).w
		bclr	#0,(byte_FFFFD004).w
		bclr	#1,(byte_FFFFD004).w
		st	(byte_FFFFD34C).w
		rts
; End of function sub_412E


; =============== S U B	R O U T	I N E =======================================


sub_416A:				; CODE XREF: sub_3A40+16p sub_3ABC+6j	...
		move.l	(dword_FFFFD336).w,(dword_FFFFD332).w
		move.l	#7,(dword_FFFFD336).w
		move.w	#8,(word_FFFFD324).w
		st	(byte_FFFFD34C).w
		rts
; End of function sub_416A


; =============== S U B	R O U T	I N E =======================================


sub_4184:				; CODE XREF: sub_4E48+30p
		move.l	#$20000,(dword_FFFFD336).w
		move.w	#$C,(word_FFFFD324).w
		move.l	#$20000,(dword_FFFFD332).w
		clr.l	(dword_FFFFD33E).w
		clr.w	(word_FFFFD33C).w
		st	(byte_FFFFD34C).w
		rts
; End of function sub_4184


; =============== S U B	R O U T	I N E =======================================


sub_41A8:				; CODE XREF: sub_50F6+20p
		bsr.s	sub_41DC
		moveq	#1,d1
		bsr.w	sub_59DE
		move.w	#$10,(word_FFFFD324).w
		rts
; End of function sub_41A8


; =============== S U B	R O U T	I N E =======================================


sub_41B8:				; CODE XREF: sub_5134+1Cp
		bsr.s	sub_41DC
		moveq	#2,d1
		bsr.w	sub_59DE
		move.w	#$14,(word_FFFFD324).w
		rts
; End of function sub_41B8


; =============== S U B	R O U T	I N E =======================================


sub_41C8:
		bsr.s	sub_41DC
		move.w	#$1C,(word_FFFFD324).w
		rts
; End of function sub_41C8


; =============== S U B	R O U T	I N E =======================================


sub_41D2:				; CODE XREF: sub_4FDC+46p
		bsr.s	sub_41DC
		move.w	#$18,(word_FFFFD324).w
		rts
; End of function sub_41D2


; =============== S U B	R O U T	I N E =======================================


sub_41DC:				; CODE XREF: sub_41A8p	sub_41B8p ...
		move.l	(dword_FFFFD332).w,(dword_FFFFD336).w
		move.w	(word_FFFFD330).w,(word_FFFFD33A).w
		clr.l	(dword_FFFFD332).w
		rts
; End of function sub_41DC


; =============== S U B	R O U T	I N E =======================================


sub_41EE:				; CODE XREF: sub_329A:loc_33A6p
					; sub_4400+74p	...
		movem.l	a0,-(sp)
		lea	(unk_FFFFD300).w,a0
		bsr.w	sub_3AEC
		st	$4C(a0)
		clr.l	$32(a0)
		movem.l	(sp)+,a0
		rts
; End of function sub_41EE


; =============== S U B	R O U T	I N E =======================================


sub_4208:				; CODE XREF: sub_59DE+2p
		cmpi.w	#$10,(word_FFFFD324).w
		beq.s	locret_4216
		cmpi.w	#$14,(word_FFFFD324).w

locret_4216:				; CODE XREF: sub_4208+6j
		rts
; End of function sub_4208


; =============== S U B	R O U T	I N E =======================================


sub_4218:				; CODE XREF: sub_5E6Cp
		cmpi.w	#4,(word_FFFFD324).w
		rts
; End of function sub_4218


; =============== S U B	R O U T	I N E =======================================


sub_4220:
		bset	#7,(a0)
		bne.s	loc_423E
		move.l	#$12BD2,4(a0)
		move.w	#$130,$C(a0)
		move.b	#$80,$18(a0)
		clr.w	$32(a0)

loc_423E:				; CODE XREF: sub_4220+4j
		lea	(unk_FFFFD300).w,a1
		cmpi.w	#$C,$24(a1)
		bne.s	loc_42B0
		btst	#0,(byte_FFFFD004).w
		bne.w	loc_42B0
		tst.w	$3C(a1)
		bne.s	loc_42B0
		bclr	#1,2(a0)
		cmpi.w	#2,$34(a1)
		bne.s	loc_4292
		move.b	(joy1Triggered).w,d0
		andi.b	#$70,d0	; 'p'
		beq.s	loc_4292
		move.w	$32(a1),d0
		add.w	(word_FFFFD042).w,d0
		move.w	(word_FFFFD168).w,d1
		addq.w	#1,d1
		cmp.w	d1,d0
		bge.w	sub_38C0
		tst.w	$30(a1)
		bmi.w	sub_38C0
		move.w	d0,(word_FFFFD166).w

loc_4292:				; CODE XREF: sub_4220+46j sub_4220+50j
		move.w	(word_FFFFD166).w,d0
		sub.w	(word_FFFFD042).w,d0
		bmi.s	loc_42B0
		cmpi.w	#$A,d0
		bge.s	loc_42B0
		mulu.w	#$10,d0
		addi.w	#$A8,d0	; '¨'
		move.w	d0,8(a0)
		rts
; ---------------------------------------------------------------------------

loc_42B0:				; CODE XREF: sub_4220+28j sub_4220+30j ...
		bset	#1,2(a0)
		rts
; End of function sub_4220


; =============== S U B	R O U T	I N E =======================================


sub_42B8:				; CODE XREF: sub_329A+46p
		cmpi.b	#7,(byte_FFFFFE18).w
		bne.s	loc_42D0
		lea	(unk_FFFFFE1A).w,a1
		moveq	#3,d0

loc_42C6:				; CODE XREF: sub_42B8+12j
		cmpi.b	#2,(a1)+
		dbeq	d0,loc_42C6
		beq.s	loc_42E0

loc_42D0:				; CODE XREF: sub_42B8+6j
		cmpi.b	#3,(byte_FFFFFE19).w
		bne.s	loc_4306
		cmpi.b	#3,(byte_FFFFFE18).w
		beq.s	loc_4320

loc_42E0:				; CODE XREF: sub_42B8+16j
		move.b	(joy2Triggered).w,d0
		andi.w	#$F0,d0	; 'ð'
		or.b	d0,(joy1Triggered).w
		lea	($FFFFFE0C).w,a3
		tst.l	6(a3)
		bne.s	loc_4318
		tst.b	(joy1Down).w
		bne.s	loc_430E
		clr.l	$50(a0)
		clr.l	$54(a0)
		rts
; ---------------------------------------------------------------------------

loc_4306:				; CODE XREF: sub_42B8+1Ej
		cmpi.b	#3,(byte_FFFFFE18).w
		beq.s	loc_4320

loc_430E:				; CODE XREF: sub_42B8+42j
		tst.b	(byte_FFFFD060).w
		bne.w	loc_4348
		rts
; ---------------------------------------------------------------------------

loc_4318:				; CODE XREF: sub_42B8+3Cj
		move.b	#$81,(byte_FFFFD060).w
		bra.s	loc_432A
; ---------------------------------------------------------------------------

loc_4320:				; CODE XREF: sub_42B8+26j sub_42B8+54j
		lea	(unk_FFFFFE00).w,a3
		move.b	#1,(byte_FFFFD060).w

loc_432A:				; CODE XREF: sub_42B8+66j
		moveq	#0,d0
		move.w	6(a3),d0
		swap	d0
		asr.l	#1,d0
		move.l	d0,$50(a0)
		moveq	#0,d0
		move.w	8(a3),d0
		swap	d0
		asr.l	#1,d0
		move.l	d0,$54(a0)
		rts
; ---------------------------------------------------------------------------

loc_4348:				; CODE XREF: sub_42B8+5Aj
		clr.b	(byte_FFFFD060).w
		move.w	$34(a0),d1
		bpl.s	loc_4376
		andi.w	#$FF,d1
		btst	#0,(joy1Down).w
		beq.s	loc_4360
		addq.w	#1,d1

loc_4360:				; CODE XREF: sub_42B8+A4j
		move.w	d1,$34(a0)
		move.w	$24(a0),d0
		cmpi.w	#$10,d0
		bcc.s	loc_4376
		movea.l	sub_43CE(pc,d0.w),a2
		bsr.w	loc_4026

loc_4376:				; CODE XREF: sub_42B8+98j sub_42B8+B4j
		move.w	$32(a0),d0
		bpl.s	loc_43B8
		cmpi.w	#0,$24(a0)
		bne.s	loc_43A4
		tst.w	$34(a0)
		bne.s	loc_43A4
		cmpi.w	#$FFFF,d0
		beq.s	loc_439A
		cmpi.w	#$8001,d0
		bne.s	loc_43A4

loc_4396:				; CODE XREF: sub_42B8+E6j
					; sub_42B8+112j
		moveq	#1,d0
		bra.s	loc_43B2
; ---------------------------------------------------------------------------

loc_439A:				; CODE XREF: sub_42B8+D6j
		bsr.w	sub_1846
		bne.s	loc_4396
		moveq	#0,d0
		bra.s	loc_43B2
; ---------------------------------------------------------------------------

loc_43A4:				; CODE XREF: sub_42B8+CAj sub_42B8+D0j ...
		andi.w	#$FF,d0
		btst	#2,(joy1Down).w
		beq.s	loc_43B2
		addq.w	#1,d0

loc_43B2:				; CODE XREF: sub_42B8+E0j sub_42B8+EAj ...
		move.w	d0,$32(a0)
		bra.s	locret_43CC
; ---------------------------------------------------------------------------

loc_43B8:				; CODE XREF: sub_42B8+C2j
		cmpi.w	#0,$24(a0)
		bne.s	locret_43CC
		tst.l	$34(a0)
		bne.s	locret_43CC
		bsr.w	sub_1846
		bne.s	loc_4396

locret_43CC:				; CODE XREF: sub_42B8+FEj
					; sub_42B8+106j ...
		rts
; End of function sub_42B8


; =============== S U B	R O U T	I N E =======================================

sub_43CE:
		dc.w $0
		dc.w $3D30
		dc.w $0
		dc.w $3DC0
		dc.w $0
		dc.w $3E12
		dc.w $0
		dc.w $3E12

loc_43DE:				; CODE XREF: sub_4B46p	sub_4BA2+9Cp
		move.b	(joy1Down).w,d0
		tst.b	(byte_FFFFD060).w
		bpl.s	loc_43EC
		or.b	(joy2Down).w,d0

loc_43EC:				; CODE XREF: sub_43CE+18j
		andi.b	#$70,d0	; 'p'
		rts
; End of function sub_43CE


; =============== S U B	R O U T	I N E =======================================


sub_43F2:				; CODE XREF: sub_3040+10p
		move.w	(word_FFFFD020).w,d0
		beq.s	locret_43FE
		bsr.s	sub_4400
		ori	#1,ccr

locret_43FE:				; CODE XREF: sub_43F2+4j
		rts
; End of function sub_43F2


; =============== S U B	R O U T	I N E =======================================


sub_4400:				; CODE XREF: sub_43F2+6p
		lea	(byte_FFFFD008).w,a0
		lea	sub_1730(pc),a6
		bclr	#0,(word_FFFFD020+1).w
		bne.w	sub_4A58
		bclr	#6,(word_FFFFD020+1).w
		bne.w	sub_4B70
		bclr	#7,(word_FFFFD020+1).w
		bne.w	sub_47EE
		bclr	#0,(word_FFFFD020).w
		bne.w	sub_47D2
		bclr	#2,(word_FFFFD020+1).w
		bne.w	sub_4624
		bclr	#4,(word_FFFFD020+1).w
		bne.w	sub_45BE
		bclr	#5,(word_FFFFD020+1).w
		bra.w	*+4
; ---------------------------------------------------------------------------

loc_444E:				; CODE XREF: sub_4400+4Aj
		move.b	(word_FFFFFE44+1).w,d7
		cmpi.w	#$1000,(word_FFFFD024).w
		bne.s	loc_447E
		moveq	#0,d7
		bset	#4,(byte_FFFFD004).w
		bset	#0,(byte_FFFFD005).w
		bsr.w	sub_4720
		bsr.w	sub_4718
		bsr.w	sub_47FE
		bsr.w	sub_41EE
		moveq	#8,d1
		bsr.w	sub_59DE

loc_447E:				; CODE XREF: sub_4400+58j
		bsr.w	sub_52F4
		bsr.w	sub_5336
		bset	#2,(byte_FFFFD004).w
		bsr.w	sub_5CFA
		tst.b	(byte_FFFFD038).w
		beq.s	loc_44BC
		bset	#6,(byte_FFFFD004).w
		bset	#6,1(a0)
		bsr.w	sub_53D2
		cmp.b	(byte_FFFFD038).w,d1
		bcc.s	loc_44B0
		move.b	d1,(byte_FFFFD038).w

loc_44B0:				; CODE XREF: sub_4400+AAj
		moveq	#0,d0
		move.b	(byte_FFFFD038).w,d0
		subq.w	#1,d0
		bsr.w	sub_53B6

loc_44BC:				; CODE XREF: sub_4400+94j
		btst	#4,(byte_FFFFD004).w
		bne.w	locret_44CA
		bsr.w	sub_6396

locret_44CA:				; CODE XREF: sub_4400+C2j
		rts
; End of function sub_4400


; =============== S U B	R O U T	I N E =======================================


sub_44CC:				; CODE XREF: sub_3ABC+1Ep sub_4054+2Cj
		move.w	d0,(word_FFFFD000).w
		st	(byte_FFFFD002).w
		rts
; End of function sub_44CC


; =============== S U B	R O U T	I N E =======================================


sub_44D6:
		move.w	#$B,(word_FFFFD000).w
		st	(byte_FFFFD002).w
		rts
; End of function sub_44D6


; =============== S U B	R O U T	I N E =======================================


sub_44E2:				; CODE XREF: sub_3040:loc_3070p
		bsr.w	sub_1840
		bmi.s	loc_4504
		btst	#0,(byte_FFFFD008).w
		beq.s	loc_44F8
		moveq	#$FFFFFFFF,d1
		bsr.w	sub_183A
		bra.s	loc_4504
; ---------------------------------------------------------------------------

loc_44F8:				; CODE XREF: sub_44E2+Cj
		bset	#3,(byte_FFFFD004).w
		bne.s	loc_4504
		bsr.w	sub_5732

loc_4504:				; CODE XREF: sub_44E2+4j sub_44E2+14j	...
		lea	(byte_FFFFD008).w,a0
		lea	sub_1730(pc),a6
		move.w	(word_FFFFD000).w,d0
		asl.w	#2,d0
		jmp	loc_4516(pc,d0.w)
; End of function sub_44E2

; ---------------------------------------------------------------------------

loc_4516:
		bra.w	sub_45A6
; ---------------------------------------------------------------------------
		bra.w	locret_45BC
; ---------------------------------------------------------------------------
		bra.w	sub_4642
; ---------------------------------------------------------------------------
		bra.w	sub_4730
; ---------------------------------------------------------------------------
		bra.w	sub_4822
; ---------------------------------------------------------------------------
		bra.w	sub_48FE
; ---------------------------------------------------------------------------
		bra.w	sub_49DC
; ---------------------------------------------------------------------------
		bra.w	sub_4A70
; ---------------------------------------------------------------------------
		bra.w	sub_4BA2
; ---------------------------------------------------------------------------
		bra.w	sub_4D24
; ---------------------------------------------------------------------------
		bra.w	loc_4D88
; ---------------------------------------------------------------------------
		bra.w	sub_4F2C
; ---------------------------------------------------------------------------
		bra.w	sub_4F64
; ---------------------------------------------------------------------------
		bra.w	sub_4F8E
; ---------------------------------------------------------------------------
		bra.w	sub_4F9A
; ---------------------------------------------------------------------------
		bra.w	sub_4FDC
; ---------------------------------------------------------------------------
		bra.w	sub_506A
; ---------------------------------------------------------------------------
		bra.w	sub_506A
; ---------------------------------------------------------------------------
		bra.w	sub_50F6
; ---------------------------------------------------------------------------
		bra.w	sub_516C
; ---------------------------------------------------------------------------
		bra.w	sub_5134
; ---------------------------------------------------------------------------
		bra.w	sub_51C6
; ---------------------------------------------------------------------------
		bra.w	sub_4E48
; ---------------------------------------------------------------------------
		bra.w	sub_51D6
; ---------------------------------------------------------------------------
		bra.w	loc_51FA
; ---------------------------------------------------------------------------
		bra.w	sub_4FB4
; ---------------------------------------------------------------------------
		bra.w	sub_5042
; ---------------------------------------------------------------------------
		bra.w	sub_480C
; ---------------------------------------------------------------------------
		bra.w	sub_4F2C
; ---------------------------------------------------------------------------
		nop
		rts
; ---------------------------------------------------------------------------
		nop
		rts
; ---------------------------------------------------------------------------
		bra.w	sub_4C8E
; ---------------------------------------------------------------------------
		bra.w	sub_4CA6
; ---------------------------------------------------------------------------
		bra.w	sub_4CC4
; ---------------------------------------------------------------------------
		bra.w	sub_4D08
; ---------------------------------------------------------------------------
		bra.w	sub_4E9E

; =============== S U B	R O U T	I N E =======================================


sub_45A6:				; CODE XREF: ROM:loc_4516j
		btst	#1,(word_FFFFD04E).w
		bne.w	sub_4730
		btst	#2,(word_FFFFD04E).w
		bne.w	sub_4642
		rts
; End of function sub_45A6

; ---------------------------------------------------------------------------

locret_45BC:				; CODE XREF: ROM:0000451Aj
		rts

; =============== S U B	R O U T	I N E =======================================


sub_45BE:				; CODE XREF: sub_4400+40j
		clr.w	(word_FFFFD04E).w
		moveq	#2,d0
		bsr.w	sub_1800
		bset	#0,(a0)
		andi.b	#3,(byte_FFFFD004).w
		bclr	#0,(byte_FFFFD005).w
		bsr.w	sub_4A58
		moveq	#0,d7
		bsr.w	sub_52F4
		bsr.w	loc_4F3C
		move.b	#$10,(byte_FFFFD00F).w
		move.b	#$10,(byte_FFFFD011).w
		bsr.w	sub_4F18
		bsr.w	sub_5DB0
		clr.b	(byte_FFFFD038).w
		clr.b	(word_FFFFFE44+1).w
		clr.w	(word_FFFFFE40).w
		moveq	#$FFFFFFFF,d1
		bsr.w	sub_183A
		bsr.w	sub_5732
		bsr.w	sub_41EE
		moveq	#7,d1
		bsr.w	sub_59DE
		rts
; End of function sub_45BE


; =============== S U B	R O U T	I N E =======================================


sub_461C:
		bclr	#0,(a0)
		bne.s	sub_4624
		rts
; End of function sub_461C


; =============== S U B	R O U T	I N E =======================================


sub_4624:				; CODE XREF: sub_4400+36j sub_461C+4j
		move.w	#$1FF,d1
		moveq	#$12,d0
		jsr	(a6)
		bclr	#0,(a0)
		bclr	#2,(byte_FFFFD004).w
		moveq	#6,d1
		bsr.w	sub_59DE
		andi	#$FB,ccr ; 'û'
		rts
; End of function sub_4624


; =============== S U B	R O U T	I N E =======================================


sub_4642:				; CODE XREF: ROM:0000451Ej
					; sub_45A6+10j
		btst	#4,(byte_FFFFD004).w
		bne.s	loc_46B8
		btst	#2,(byte_FFFFD004).w
		bne.s	loc_4670
		bsr.w	sub_4710
		bsr.w	sub_4728
		bset	#2,(word_FFFFD04E).w
		bclr	#1,(word_FFFFD04E).w
		beq.w	loc_46B8
		bsr.w	sub_47FE
		bra.s	loc_46B8
; ---------------------------------------------------------------------------

loc_4670:				; CODE XREF: sub_4642+Ej
		clr.w	(word_FFFFD04E).w
		btst	#1,(a0)
		beq.s	loc_4692
		tst.b	(byte_FFFFD050).w
		bne.s	locret_46C0
		bclr	#1,(a0)
		bset	#2,(a0)
		moveq	#6,d0
		jsr	(a6)
		bsr.w	sub_47FE
		bra.s	loc_46A6
; ---------------------------------------------------------------------------

loc_4692:				; CODE XREF: sub_4642+36j
		bset	#2,(a0)
		bne.s	loc_46B8
		bsr.s	sub_46F4
		beq.s	loc_46A2
		moveq	#$4E,d0	; 'N'
		jsr	(a6)
		bra.s	loc_46A6
; ---------------------------------------------------------------------------

loc_46A2:				; CODE XREF: sub_4642+58j
		moveq	#$4C,d0	; 'L'
		jsr	(a6)

loc_46A6:				; CODE XREF: sub_4642+4Ej sub_4642+5Ej
		bsr.w	sub_4710
		bsr.w	sub_4728
		moveq	#4,d1
		bsr.w	sub_59DE
		bsr.w	sub_51A4

loc_46B8:				; CODE XREF: sub_4642+6j sub_4642+24j	...
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w

locret_46C0:				; CODE XREF: sub_4642+3Cj
		rts
; End of function sub_4642


; =============== S U B	R O U T	I N E =======================================


sub_46C2:				; CODE XREF: sub_4D9E+36j sub_506A+40j
		bsr.s	sub_46F4
		btst	#1,(a0)
		beq.s	loc_46D0
		moveq	#$50,d0	; 'P'
		jsr	(a6)
		bra.s	loc_46EA
; ---------------------------------------------------------------------------

loc_46D0:				; CODE XREF: sub_46C2+6j
		moveq	#$4E,d0	; 'N'
		jsr	(a6)
		bset	#2,(a0)
		bsr.w	sub_4710
		bsr.w	sub_4728
		moveq	#4,d1
		bsr.w	sub_59DE
		bsr.w	sub_51A4

loc_46EA:				; CODE XREF: sub_46C2+Cj
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		rts
; End of function sub_46C2


; =============== S U B	R O U T	I N E =======================================


sub_46F4:				; CODE XREF: sub_4642+56p sub_46C2p ...
		move.w	(a0),d0
		andi.w	#$400D,d0
		bne.s	loc_4704
		moveq	#0,d1
		move.b	(byte_FFFFD038).w,d1
		bne.s	loc_4708

loc_4704:				; CODE XREF: sub_46F4+6j
		bsr.w	sub_53C2

loc_4708:				; CODE XREF: sub_46F4+Ej
		move.w	(a0),d0
		andi.w	#$400D,d0
		rts
; End of function sub_46F4


; =============== S U B	R O U T	I N E =======================================


sub_4710:				; CODE XREF: sub_4642+10p
					; sub_4642:loc_46A6p ...
		move.w	#$2000,d0
		bra.w	loc_471A
; End of function sub_4710


; =============== S U B	R O U T	I N E =======================================


sub_4718:				; CODE XREF: sub_4400+6Cp sub_4730+12p ...
		moveq	#0,d0

loc_471A:				; CODE XREF: sub_4710+4j
		moveq	#1,d1
		bra.w	sub_5764
; End of function sub_4718


; =============== S U B	R O U T	I N E =======================================


sub_4720:				; CODE XREF: sub_4400+68p sub_49DC+Cp	...
		move.w	#$2000,d0
		bra.w	loc_472A
; End of function sub_4720


; =============== S U B	R O U T	I N E =======================================


sub_4728:				; CODE XREF: sub_4642+14p sub_4642+68p ...
		moveq	#0,d0

loc_472A:				; CODE XREF: sub_4720+4j
		moveq	#3,d1
		bra.w	sub_5764
; End of function sub_4728


; =============== S U B	R O U T	I N E =======================================


sub_4730:				; CODE XREF: ROM:00004522j sub_45A6+6j
		btst	#4,(byte_FFFFD004).w
		bne.w	loc_47C8
		btst	#2,(byte_FFFFD004).w
		bne.s	loc_4754
		bsr.s	sub_4718
		bsr.s	sub_4728
		bsr.w	sub_47DA
		bset	#1,(word_FFFFD04E).w
		bra.w	loc_47C8
; ---------------------------------------------------------------------------

loc_4754:				; CODE XREF: sub_4730+10j
		move.w	(a0),d0
		move.w	(word_FFFFD022).w,d1
		eor.w	d1,d0
		btst	#9,d0
		bne.w	locret_47D0
		clr.w	(word_FFFFD04E).w
		btst	#2,(a0)
		bne.s	loc_47A2
		btst	#1,(a0)
		bne.s	loc_47C0
		bset	#1,(a0)
		bset	#2,(a0)
		move.w	#$2000,d0
		bsr.w	sub_4806
		bsr.s	sub_4728
		moveq	#5,d1
		bsr.w	sub_59DE
		bsr.w	sub_51A4
		bsr.w	sub_46F4
		beq.s	loc_479C
		moveq	#$50,d0	; 'P'
		jsr	(a6)
		bra.s	loc_47C8
; ---------------------------------------------------------------------------

loc_479C:				; CODE XREF: sub_4730+64j
		moveq	#$1C,d0
		jsr	(a6)
		bra.s	loc_47C8
; ---------------------------------------------------------------------------

loc_47A2:				; CODE XREF: sub_4730+3Cj
		btst	#1,(a0)
		bne.s	loc_47C0
		btst	#4,(word_FFFFD036+1).w
		bne.s	loc_47C0
		bsr.w	sub_4C74
		bcs.s	loc_47C8
		tst.b	(byte_FFFFD050).w
		bne.s	locret_47D0
		bsr.s	sub_47D2
		bra.s	loc_47C8
; ---------------------------------------------------------------------------

loc_47C0:				; CODE XREF: sub_4730+42j sub_4730+76j ...
		tst.b	(byte_FFFFD050).w
		bne.s	locret_47D0
		bsr.s	sub_47EE

loc_47C8:				; CODE XREF: sub_4730+6j sub_4730+20j	...
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w

locret_47D0:				; CODE XREF: sub_4730+30j sub_4730+8Aj ...
		rts
; End of function sub_4730


; =============== S U B	R O U T	I N E =======================================


sub_47D2:				; CODE XREF: sub_4400+2Cj sub_4730+8Cp
		bset	#1,(a0)
		moveq	#4,d0
		jsr	(a6)
; End of function sub_47D2


; =============== S U B	R O U T	I N E =======================================


sub_47DA:				; CODE XREF: sub_4730+16p
		move.w	#$2000,d0
		bsr.s	sub_4806
		moveq	#5,d1
		bsr.w	sub_59DE
		bsr.w	sub_4728
		bra.w	sub_4718
; End of function sub_47DA


; =============== S U B	R O U T	I N E =======================================


sub_47EE:				; CODE XREF: sub_4400+22j sub_4730+96p
		bclr	#1,(a0)
		moveq	#6,d0
		jsr	(a6)
		bsr.w	sub_4710
		bsr.w	sub_4728
; End of function sub_47EE


; =============== S U B	R O U T	I N E =======================================


sub_47FE:				; CODE XREF: sub_4400+70p sub_4642+28p ...
		moveq	#6,d1
		bsr.w	sub_59DE
		moveq	#0,d0
; End of function sub_47FE


; =============== S U B	R O U T	I N E =======================================


sub_4806:				; CODE XREF: sub_4730+50p sub_47DA+4p
		moveq	#2,d1
		bra.w	sub_5764
; End of function sub_4806


; =============== S U B	R O U T	I N E =======================================


sub_480C:				; CODE XREF: ROM:00004582j
		cmpi.w	#$100,(word_FFFFD024).w
		bne.s	locret_4820
		moveq	#4,d0
		jsr	(a6)
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w

locret_4820:				; CODE XREF: sub_480C+6j
		rts
; End of function sub_480C


; =============== S U B	R O U T	I N E =======================================


sub_4822:				; CODE XREF: ROM:00004526j
		move.w	(a0),d7
		btst	#8,d7
		bne.w	loc_48EC
		btst	#2,(byte_FFFFD004).w
		beq.w	loc_48EC
		btst	#4,(byte_FFFFD004).w
		bne.w	loc_48E2
		btst	#1,d7
		bne.w	sub_5250
		btst	#$A,d7
		beq.s	loc_48BE
		move.w	(dword_FFFFD02C).w,d6
		cmpi.w	#2,d6
		bcs.s	loc_485E
		bsr.w	sub_53C2
		bra.s	loc_4862
; ---------------------------------------------------------------------------

loc_485E:				; CODE XREF: sub_4822+34j
		bsr.w	sub_541C

loc_4862:				; CODE XREF: sub_4822+3Aj
		move.b	d1,(byte_FFFFD038).w
		bset	#4,(byte_FFFFD005).w
		andi.b	#$DF,(byte_FFFFD005).w
		move.w	d1,-(sp)
		move.w	#$2000,d0
		moveq	#4,d1
		bsr.w	sub_5764
		moveq	#0,d0
		moveq	#5,d1
		bsr.w	sub_5764
		move.w	(sp)+,d1
		bset	#6,(byte_FFFFD004).w
		bset	#6,1(a0)
		andi.w	#$400D,d7
		beq.s	loc_48AC
		btst	#1,(a0)
		beq.s	loc_48A6
		moveq	#$50,d0	; 'P'
		jsr	(a6)
		bra.s	loc_48E2
; ---------------------------------------------------------------------------

loc_48A6:				; CODE XREF: sub_4822+7Cj
		moveq	#$4E,d0	; 'N'
		jsr	(a6)
		bra.s	loc_48E2
; ---------------------------------------------------------------------------

loc_48AC:				; CODE XREF: sub_4822+76j
		btst	#1,(a0)
		beq.s	loc_48B8
		moveq	#$1C,d0
		jsr	(a6)
		bra.s	loc_48E2
; ---------------------------------------------------------------------------

loc_48B8:				; CODE XREF: sub_4822+8Ej
		moveq	#$4C,d0	; 'L'
		jsr	(a6)
		bra.s	loc_48E2
; ---------------------------------------------------------------------------

loc_48BE:				; CODE XREF: sub_4822+2Aj
		bsr.w	sub_541C
		move.b	d1,(byte_FFFFD038).w

loc_48C6:				; CODE XREF: sub_4822+D2j sub_4822+DAj
		bset	#6,(byte_FFFFD004).w
		bset	#6,1(a0)
		move.w	#$2000,d0
		moveq	#4,d1
		bsr.w	sub_5764
		move.b	#$14,(byte_FFFFD05A).w

loc_48E2:				; CODE XREF: sub_4822+1Aj sub_4822+82j ...
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		rts
; ---------------------------------------------------------------------------

loc_48EC:				; CODE XREF: sub_4822+6j sub_4822+10j
		subq.b	#1,(byte_FFFFD038).w
		beq.s	loc_48F6
		bmi.s	loc_48F6
		bra.s	loc_48C6
; ---------------------------------------------------------------------------

loc_48F6:				; CODE XREF: sub_4822+CEj sub_4822+D0j
		move.b	#1,(byte_FFFFD038).w
		bra.s	loc_48C6
; End of function sub_4822


; =============== S U B	R O U T	I N E =======================================


sub_48FE:				; CODE XREF: ROM:0000452Aj
		move.w	(a0),d7
		btst	#8,d7
		bne.w	loc_498E
		btst	#2,(byte_FFFFD004).w
		beq.w	loc_498E
		btst	#4,(byte_FFFFD004).w
		bne.w	loc_4984
		btst	#1,d7
		bne.w	sub_5250
		btst	#$A,d7
		beq.w	loc_495E
		bsr.w	sub_53E4
		beq.w	loc_4984
		move.b	d1,(byte_FFFFD038).w
		bset	#5,(byte_FFFFD005).w
		andi.b	#$EF,(byte_FFFFD005).w
		move.w	d1,-(sp)
		move.w	#$2000,d0
		moveq	#5,d1
		bsr.w	sub_5764
		moveq	#0,d0
		moveq	#4,d1
		bsr.w	sub_5764
		move.w	(sp)+,d1
		bsr.s	sub_49A2
		bra.s	loc_4984
; ---------------------------------------------------------------------------

loc_495E:				; CODE XREF: sub_48FE+2Aj
		bsr.w	sub_53E4
		beq.s	loc_4984
		move.b	d1,(byte_FFFFD038).w

loc_4968:				; CODE XREF: sub_48FE+9Aj sub_48FE+A2j
		bset	#6,(byte_FFFFD004).w
		bset	#6,1(a0)
		move.w	#$2000,d0
		moveq	#5,d1
		bsr.w	sub_5764
		move.b	#$14,(byte_FFFFD05B).w

loc_4984:				; CODE XREF: sub_48FE+1Aj sub_48FE+32j ...
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		rts
; ---------------------------------------------------------------------------

loc_498E:				; CODE XREF: sub_48FE+6j sub_48FE+10j
		addq.b	#1,(byte_FFFFD038).w
		cmpi.b	#$63,(byte_FFFFD038).w ; 'c'
		bls.s	loc_4968
		move.b	#$63,(byte_FFFFD038).w ; 'c'
		bra.s	loc_4968
; End of function sub_48FE


; =============== S U B	R O U T	I N E =======================================


sub_49A2:				; CODE XREF: sub_48FE+5Cp sub_4BA2+68j ...
		move.b	d1,(byte_FFFFD038).w
		bset	#6,(byte_FFFFD004).w
		bset	#6,1(a0)
		andi.w	#$400D,d7
		beq.s	loc_49CA
		btst	#1,(a0)
		beq.s	loc_49C4
		moveq	#$50,d0	; 'P'
		jsr	(a6)
		bra.s	locret_49DA
; ---------------------------------------------------------------------------

loc_49C4:				; CODE XREF: sub_49A2+1Aj
		moveq	#$4E,d0	; 'N'
		jsr	(a6)
		bra.s	locret_49DA
; ---------------------------------------------------------------------------

loc_49CA:				; CODE XREF: sub_49A2+14j
		btst	#1,(a0)
		beq.s	loc_49D6
		moveq	#$1C,d0
		jsr	(a6)
		bra.s	locret_49DA
; ---------------------------------------------------------------------------

loc_49D6:				; CODE XREF: sub_49A2+2Cj
		moveq	#$4C,d0	; 'L'
		jsr	(a6)

locret_49DA:				; CODE XREF: sub_49A2+20j sub_49A2+26j ...
		rts
; End of function sub_49A2


; =============== S U B	R O U T	I N E =======================================


sub_49DC:				; CODE XREF: ROM:0000452Ej
		btst	#2,(a0)
		bne.s	loc_49FE
		tst.w	(word_FFFFD04E).w
		beq.s	loc_49F8
		bsr.w	sub_4720
		bsr.w	sub_4718
		bsr.w	sub_47FE
		clr.w	(word_FFFFD04E).w

loc_49F8:				; CODE XREF: sub_49DC+Aj
		btst	#1,(a0)
		beq.s	loc_4A04

loc_49FE:				; CODE XREF: sub_49DC+4j
		bsr.s	sub_4A0E
		bsr.w	sub_5034

loc_4A04:				; CODE XREF: sub_49DC+20j
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		rts
; End of function sub_49DC


; =============== S U B	R O U T	I N E =======================================


sub_4A0E:				; CODE XREF: sub_49DC:loc_49FEp
					; sub_4BA2+74j
		moveq	#2,d0
		jsr	(a6)

loc_4A12:				; CODE XREF: sub_4A58+4j sub_4A58+16j
		bclr	#2,(a0)
		bclr	#1,(a0)
		moveq	#6,d1
		bsr.w	sub_59DE
		bsr.w	sub_51BC
		bsr.w	sub_53B0
		bsr.w	sub_53C2
		move.b	d1,(byte_FFFFD038).w
		bclr	#6,(byte_FFFFD004).w
		bclr	#6,1(a0)
		move.b	(byte_FFFFFE43).w,d3
		bsr.w	sub_53B0
		clr.b	(byte_FFFFFE43).w
		bsr.w	sub_5034
		bsr.w	sub_4720
		bsr.w	sub_47FE
		bra.w	sub_4718
; End of function sub_4A0E


; =============== S U B	R O U T	I N E =======================================


sub_4A58:				; CODE XREF: sub_4400+Ej sub_45BE+1Ap
		btst	#3,(a0)
		beq.s	loc_4A12
		bsr.w	sub_4B80
		bsr.w	sub_4C54
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		bra.s	loc_4A12
; End of function sub_4A58


; =============== S U B	R O U T	I N E =======================================


sub_4A70:				; CODE XREF: ROM:00004532j
		move.w	(a0),d0
		btst	#$A,d0
		beq.w	sub_5250
		btst	#1,d0
		bne.w	sub_5250
		move.w	(word_FFFFD022).w,d1
		eor.w	d0,d1
		btst	#$A,d1
		bne.w	loc_4B66
		btst	#9,d1
		bne.w	locret_4B6E
		btst	#$B,d1
		bne.w	locret_4B6E
		tst.b	(byte_FFFFD002).w
		bpl.w	sub_4B46
		cmpi.w	#$100,(word_FFFFD024).w
		beq.s	loc_4ADE
		cmpi.w	#$500,(word_FFFFD024).w
		beq.s	loc_4ADE
		cmpi.w	#0,(word_FFFFD024).w
		bne.w	loc_4B66
		btst	#1,(word_FFFFD036+1).w
		bne.w	loc_4B66
		andi.w	#$400D,d0
		beq.s	loc_4ADE
		bsr.w	sub_53C2
		cmp.b	(byte_FFFFD030).w,d1
		bne.w	loc_4B66

loc_4ADE:				; CODE XREF: sub_4A70+3Ej sub_4A70+46j ...
		bset	#3,(a0)
		bclr	#4,(a0)
		move.b	#1,(byte_FFFFD002).w
		move.w	#$2000,d0
		moveq	#6,d1
		bsr.w	sub_5764
		move.w	(a0),d0
		andi.w	#$400D,d0
		bne.s	sub_4B22
		bsr.w	sub_53C2
		cmp.b	(word_FFFFFE44).w,d1
		bne.s	sub_4B40
		cmpi.w	#5,(dword_FFFFD02C).w
		bhi.s	sub_4B40
		bset	#5,1(a0)
		bset	#0,(byte_FFFFD00A).w
		moveq	#$1C,d0
		jsr	(a6)
		rts
; End of function sub_4A70


; =============== S U B	R O U T	I N E =======================================


sub_4B22:				; CODE XREF: sub_4A70+8Cj
		cmpi.w	#5,(dword_FFFFD02C).w
		bhi.s	sub_4B40
		bset	#5,1(a0)
		bset	#0,(byte_FFFFD00A).w
		bsr.w	sub_53C2
		moveq	#$50,d0	; 'P'
		jsr	(a6)
		rts
; End of function sub_4B22


; =============== S U B	R O U T	I N E =======================================


sub_4B40:				; CODE XREF: sub_4A70+96j sub_4A70+9Ej ...
		moveq	#$A,d0
		jsr	(a6)
		rts
; End of function sub_4B40


; =============== S U B	R O U T	I N E =======================================


sub_4B46:				; CODE XREF: sub_4A70+34j
		bsr.w	loc_43DE
		bne.s	locret_4B6E
		bsr.s	sub_4B80
		bclr	#0,(byte_FFFFD00A).w
		beq.s	loc_4B62
		btst	#1,(a0)
		bne.s	loc_4B66
		moveq	#6,d0
		jsr	(a6)
		bra.s	loc_4B66
; ---------------------------------------------------------------------------

loc_4B62:				; CODE XREF: sub_4B46+Ej
		moveq	#$C,d0
		jsr	(a6)

loc_4B66:				; CODE XREF: sub_4A70+1Cj sub_4A70+4Ej ...
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w

locret_4B6E:				; CODE XREF: sub_4A70+24j sub_4A70+2Cj ...
		rts
; End of function sub_4B46


; =============== S U B	R O U T	I N E =======================================


sub_4B70:				; CODE XREF: sub_4400+18j
		btst	#3,(a0)
		bne.s	loc_4B78
		rts
; ---------------------------------------------------------------------------

loc_4B78:				; CODE XREF: sub_4B70+4j
		bset	#0,(byte_FFFFD00A).w
		rts
; End of function sub_4B70


; =============== S U B	R O U T	I N E =======================================


sub_4B80:				; CODE XREF: sub_4A58+6p sub_4B46+6p
		btst	#4,(a0)
		bne.s	locret_4B8C
		bclr	#3,(a0)
		bne.s	loc_4B8E

locret_4B8C:				; CODE XREF: sub_4B80+4j
		rts
; ---------------------------------------------------------------------------

loc_4B8E:				; CODE XREF: sub_4B80+Aj
		bclr	#5,1(a0)
		moveq	#2,d0
		bsr.w	sub_1800
		moveq	#0,d0
		moveq	#6,d1
		bra.w	sub_5764
; End of function sub_4B80


; =============== S U B	R O U T	I N E =======================================


sub_4BA2:				; CODE XREF: ROM:00004536j
		move.w	(a0),d0
		btst	#$A,d0
		beq.w	sub_5250
		btst	#1,d0
		bne.w	sub_5250
		move.w	(word_FFFFD022).w,d1
		eor.w	d0,d1
		btst	#$A,d1
		bne.w	loc_4C4A
		btst	#9,d1
		bne.w	locret_4C52
		btst	#$B,d1
		bne.w	locret_4C52
		tst.b	(byte_FFFFD002).w
		bpl.s	loc_4C36
		cmpi.w	#$100,(word_FFFFD024).w
		beq.s	loc_4BF0
		cmpi.w	#$500,(word_FFFFD024).w
		beq.s	loc_4BF0
		cmpi.w	#0,(word_FFFFD024).w
		bne.s	loc_4C4A

loc_4BF0:				; CODE XREF: sub_4BA2+3Cj sub_4BA2+44j
		bsr.w	sub_4C74
		bcc.s	loc_4C1A
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		btst	#0,1(a0)
		beq.s	loc_4C0E
		bsr.w	sub_53C2
		bra.w	sub_49A2
; ---------------------------------------------------------------------------

loc_4C0E:				; CODE XREF: sub_4BA2+62j
		bsr.w	sub_53E4
		bne.w	sub_49A2
		bra.w	sub_4A0E
; ---------------------------------------------------------------------------

loc_4C1A:				; CODE XREF: sub_4BA2+52j
		bset	#3,(a0)
		bset	#4,(a0)
		move.b	#1,(byte_FFFFD002).w
		moveq	#8,d0
		jsr	(a6)
		move.w	#$2000,d0
		moveq	#7,d1
		bra.w	sub_5764
; ---------------------------------------------------------------------------

loc_4C36:				; CODE XREF: sub_4BA2+34j
		btst	#1,(word_FFFFD036+1).w
		bne.s	locret_4C52
		bsr.w	loc_43DE
		bne.s	locret_4C52
		moveq	#$C,d0
		jsr	(a6)
		bsr.s	sub_4C54

loc_4C4A:				; CODE XREF: sub_4BA2+1Cj sub_4BA2+4Cj
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w

locret_4C52:				; CODE XREF: sub_4BA2+24j sub_4BA2+2Cj ...
		rts
; End of function sub_4BA2


; =============== S U B	R O U T	I N E =======================================


sub_4C54:				; CODE XREF: sub_4A58+Ap sub_4BA2+A6p
		bclr	#4,(a0)
		beq.s	locret_4C60
		bclr	#3,(a0)
		bne.s	loc_4C62

locret_4C60:				; CODE XREF: sub_4C54+4j
		rts
; ---------------------------------------------------------------------------

loc_4C62:				; CODE XREF: sub_4C54+Aj
		moveq	#2,d0
		bsr.w	sub_1800
		bclr	#4,(a0)
		moveq	#0,d0
		moveq	#7,d1
		bra.w	sub_5764
; End of function sub_4C54


; =============== S U B	R O U T	I N E =======================================


sub_4C74:				; CODE XREF: sub_4730+80p
					; sub_4BA2:loc_4BF0p
		move.l	(word_FFFFFE40).w,d0
		moveq	#4,d1
		swap	d1
		movem.l	a0-a1,-(sp)
		bsr.w	sub_1A4E
		movem.l	(sp)+,a0-a1
		cmp.w	(dword_FFFFD028).w,d0
		rts
; End of function sub_4C74


; =============== S U B	R O U T	I N E =======================================


sub_4C8E:				; CODE XREF: ROM:00004592j
		btst	#0,(a0)
		bne.s	loc_4C9C
		bsr.w	sub_5B82
		bsr.w	sub_416A

loc_4C9C:				; CODE XREF: sub_4C8E+4j
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		rts
; End of function sub_4C8E


; =============== S U B	R O U T	I N E =======================================


sub_4CA6:				; CODE XREF: ROM:00004596j
		tst.b	(byte_FFFFD003).w
		beq.s	loc_4CB2
		bsr.w	sub_412E
		bra.s	loc_4CB6
; ---------------------------------------------------------------------------

loc_4CB2:				; CODE XREF: sub_4CA6+4j
		bsr.w	sub_40F4

loc_4CB6:				; CODE XREF: sub_4CA6+Aj
		bsr.w	sub_5C20
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		rts
; End of function sub_4CA6


; =============== S U B	R O U T	I N E =======================================


sub_4CC4:				; CODE XREF: ROM:0000459Aj
		move.w	#$2000,d0
		moveq	#$18,d1
		bsr.w	sub_5764
		moveq	#0,d0
		moveq	#$19,d1
		bsr.w	sub_5764
		move.w	(word_FFFFD166).w,d0
		sub.w	(word_FFFFD042).w,d0
		bcs.s	loc_4CF4
		cmpi.b	#9,d0
		bls.s	loc_4CFE
		move.w	(word_FFFFD166).w,d0
		subi.w	#9,d0
		move.w	d0,(word_FFFFD042).w
		bra.s	loc_4CFA
; ---------------------------------------------------------------------------

loc_4CF4:				; CODE XREF: sub_4CC4+1Aj
		move.w	(word_FFFFD166).w,(word_FFFFD042).w

loc_4CFA:				; CODE XREF: sub_4CC4+2Ej
		bsr.w	sub_5C68

loc_4CFE:				; CODE XREF: sub_4CC4+20j
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		rts
; End of function sub_4CC4


; =============== S U B	R O U T	I N E =======================================


sub_4D08:				; CODE XREF: ROM:0000459Ej
		moveq	#0,d0
		moveq	#$18,d1
		bsr.w	sub_5764
		move.w	#$2000,d0
		moveq	#$19,d1
		bsr.w	sub_5764
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		rts
; End of function sub_4D08


; =============== S U B	R O U T	I N E =======================================


sub_4D24:				; CODE XREF: ROM:0000453Aj
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		btst	#0,(a0)
		beq.s	loc_4D34
		rts
; ---------------------------------------------------------------------------

loc_4D34:				; CODE XREF: sub_4D24+Cj
		btst	#1,1(a0)
		bne.w	sub_5250
		btst	#5,(a0)
		beq.s	sub_4D64
		bchg	#0,1(a0)
		beq.s	sub_4D78
; End of function sub_4D24


; =============== S U B	R O U T	I N E =======================================


sub_4D4C:				; CODE XREF: sub_4F2C+18p
		bclr	#0,1(a0)
		moveq	#0,d0
		bsr.s	loc_4D84
		bclr	#5,(a0)
		moveq	#0,d0
		moveq	#$B,d1
		bsr.w	sub_5764
		rts
; End of function sub_4D4C


; =============== S U B	R O U T	I N E =======================================


sub_4D64:				; CODE XREF: sub_4D24+1Ej
		bset	#5,(a0)
		moveq	#2,d0
		bsr.s	loc_4D84
		move.w	#$2000,d0
		moveq	#$B,d1
		bsr.w	sub_5764
		rts
; End of function sub_4D64


; =============== S U B	R O U T	I N E =======================================


sub_4D78:				; CODE XREF: sub_4D24+26j
		move.w	#$4000,d0
		moveq	#$B,d1
		bsr.w	sub_5764
		moveq	#1,d0

loc_4D84:				; CODE XREF: sub_4D4C+8p sub_4D64+6p
		bra.w	sub_5A90
; End of function sub_4D78

; ---------------------------------------------------------------------------

loc_4D88:				; CODE XREF: ROM:0000453Ej
		tst.w	(word_FFFFD168).w
		beq.w	sub_5250
		btst	#6,(a0)
		beq.s	sub_4D9E
		bsr.w	sub_5034
		bsr.s	sub_4DF2
		bra.s	sub_4DD8

; =============== S U B	R O U T	I N E =======================================


sub_4D9E:				; CODE XREF: ROM:00004D94j
		btst	#2,(a0)
		beq.s	loc_4DAE
		btst	#1,1(a0)
		bne.w	sub_5250

loc_4DAE:				; CODE XREF: sub_4D9E+4j
		move.w	#$2000,d0
		moveq	#$10,d1
		bsr.w	sub_5764
		bsr.w	sub_5374
		clr.w	(word_FFFFD03E).w
		bset	#6,(a0)
		btst	#2,1(a0)
		beq.s	loc_4DD0
		bsr.w	sub_5444

loc_4DD0:				; CODE XREF: sub_4D9E+2Cj
		bsr.w	sub_5CFA
		bra.w	sub_46C2
; End of function sub_4D9E


; =============== S U B	R O U T	I N E =======================================


sub_4DD8:				; CODE XREF: ROM:00004D9Cj
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		rts
; End of function sub_4DD8


; =============== S U B	R O U T	I N E =======================================


sub_4DE2:
		tst.w	(word_FFFFD168).w
		beq.s	sub_4DF2
		move.w	#$2000,d0
		moveq	#$13,d1
		bra.w	sub_5764
; End of function sub_4DE2


; =============== S U B	R O U T	I N E =======================================


sub_4DF2:				; CODE XREF: ROM:00004D9Ap sub_4DE2+4j ...
		bclr	#6,(byte_FFFFD008).w
		beq.s	loc_4E24
		btst	#2,(byte_FFFFD009).w
		bne.s	loc_4E0C
		bsr.w	sub_5336
		clr.b	(byte_FFFFD038).w
		bra.s	loc_4E24
; ---------------------------------------------------------------------------

loc_4E0C:				; CODE XREF: sub_4DF2+Ej
		bsr.w	sub_53C2
		move.w	d1,-(sp)
		bsr.w	sub_531A
		bsr.w	sub_5444
		move.w	(sp)+,d0
		bsr.w	sub_5392
		bsr.w	sub_5CFA

loc_4E24:				; CODE XREF: sub_4DF2+6j sub_4DF2+18j
		moveq	#0,d0
		tst.w	(word_FFFFD168).w
		beq.s	loc_4E30
		move.w	#$2000,d0

loc_4E30:				; CODE XREF: sub_4DF2+38j
		moveq	#$13,d1
		bsr.w	sub_5764
		bsr.w	sub_5CFA
		bclr	#6,(byte_FFFFD008).w
		moveq	#0,d0
		moveq	#$10,d1
		bra.w	sub_5764
; End of function sub_4DF2


; =============== S U B	R O U T	I N E =======================================


sub_4E48:				; CODE XREF: ROM:0000456Ej
		btst	#2,(byte_FFFFD004).w
		beq.w	sub_5250
		tst.b	(word_FFFFFE44+1).w
		beq.w	sub_5250
		bsr.w	sub_1840
		beq.s	loc_4E94
		btst	#2,(a0)
		beq.s	loc_4E6E
		btst	#6,(a0)
		bne.w	sub_5250

loc_4E6E:				; CODE XREF: sub_4E48+1Cj
		move.w	#$2000,d0
		moveq	#$13,d1
		bsr.w	sub_5764
		bsr.w	sub_4184
		moveq	#0,d1
		bsr.w	sub_59DE
		bsr.w	sub_5BEC
		bsr.w	sub_5C50
		bsr.w	sub_5C68
		bset	#7,1(a0)

loc_4E94:				; CODE XREF: sub_4E48+16j
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		rts
; End of function sub_4E48


; =============== S U B	R O U T	I N E =======================================


sub_4E9E:				; CODE XREF: ROM:000045A2j
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		bsr.w	sub_5B82
		bsr.w	sub_416A

loc_4EAE:				; CODE XREF: sub_3B28p	sub_3BAEp
		moveq	#6,d1
		bsr.w	sub_59DE
		bclr	#7,(byte_FFFFD009).w
		tst.w	(word_FFFFD168).w
		beq.w	sub_4DF2
		btst	#6,(byte_FFFFD008).w
		beq.s	loc_4EEA
		btst	#2,(byte_FFFFD008).w
		bne.s	loc_4EEA
		bsr.w	sub_5374
		btst	#2,(byte_FFFFD009).w
		beq.s	loc_4EE2
		bsr.w	sub_5444

loc_4EE2:				; CODE XREF: sub_4E9E+3Ej
		clr.w	(word_FFFFD03E).w
		bsr.w	sub_5CFA

loc_4EEA:				; CODE XREF: sub_4E9E+2Aj sub_4E9E+32j
		move.w	#$2000,d0
		moveq	#$13,d1
		bsr.w	sub_5764
		rts
; End of function sub_4E9E


; =============== S U B	R O U T	I N E =======================================


sub_4EF6:
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		bclr	#6,(a0)
		beq.s	loc_4F0A
		bsr.w	sub_5034
		bsr.s	sub_4F18

loc_4F0A:				; CODE XREF: sub_4EF6+Cj
		bsr.w	sub_5260
		moveq	#0,d0
		moveq	#$13,d1
		bsr.w	sub_5764
		rts
; End of function sub_4EF6


; =============== S U B	R O U T	I N E =======================================


sub_4F18:				; CODE XREF: sub_45BE+34p sub_4EF6+12p
		bsr.w	sub_5260
		bsr.w	sub_4DF2
		clr.w	(word_FFFFD166).w
		clr.b	(byte_FFFFD038).w
		bra.w	sub_5CFA
; End of function sub_4F18


; =============== S U B	R O U T	I N E =======================================


sub_4F2C:				; CODE XREF: ROM:00004542j
					; ROM:00004586j
		move.w	#$2000,d0
		moveq	#$14,d1
		bsr.w	sub_5764
		move.b	#$14,(byte_FFFFD059).w

loc_4F3C:				; CODE XREF: sub_45BE+24p
		bsr.w	sub_50B8
		bsr.w	sub_4DF2
		bsr.w	sub_4D4C
		bsr.w	sub_5034
		bsr.w	sub_515E
		bsr.w	sub_5128
		move.b	#1,(byte_FFFFD010).w
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		rts
; End of function sub_4F2C


; =============== S U B	R O U T	I N E =======================================


sub_4F64:				; CODE XREF: ROM:00004546j
		btst	#0,(a0)
		bne.w	sub_5250
		bsr.w	sub_1846
		bne.w	sub_5250
		move.w	#$2000,d0
		moveq	#$E,d1
		bsr.w	sub_5764
		bset	#6,(byte_FFFFD007).w
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		rts
; End of function sub_4F64


; =============== S U B	R O U T	I N E =======================================


sub_4F8E:				; CODE XREF: ROM:0000454Aj
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		rts
; End of function sub_4F8E

; ---------------------------------------------------------------------------
		rts

; =============== S U B	R O U T	I N E =======================================


sub_4F9A:				; CODE XREF: ROM:0000454Ej
		bsr.w	sub_5034
		bsr.w	sub_412E
		bsr.s	sub_4FC8
		bsr.w	sub_5E22
		move.w	#$2000,d0
		moveq	#$C,d1
		bsr.w	sub_5764
		rts
; End of function sub_4F9A


; =============== S U B	R O U T	I N E =======================================


sub_4FB4:				; CODE XREF: sub_3B28+34j sub_3B28+4Aj ...
		bsr.w	sub_40F4
		bsr.s	sub_4FC8
		bsr.w	sub_5E54
		moveq	#$C,d1
		moveq	#0,d0
		bsr.w	sub_5764
		rts
; End of function sub_4FB4


; =============== S U B	R O U T	I N E =======================================


sub_4FC8:				; CODE XREF: sub_4F9A+8p sub_4FB4+4p
		not.b	(byte_FFFFD003).w
		bset	#5,(byte_FFFFD007).w
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		rts
; End of function sub_4FC8


; =============== S U B	R O U T	I N E =======================================


sub_4FDC:				; CODE XREF: ROM:00004552j
		btst	#2,(a0)
		beq.w	sub_5250
		tst.b	(byte_FFFFD003).w
		bne.w	sub_5250
		btst	#1,1(a0)
		bne.s	loc_5028
		btst	#1,(a0)
		bne.w	sub_5250
		cmpi.w	#$100,(word_FFFFD024).w
		bne.s	loc_502A
		move.l	(dword_FFFFD028).w,d0
		move.w	(word_FFFFD1CE).w,d1
		move.b	d1,d0
		move.l	d0,(dword_FFFFD014).w
		move.l	(dword_FFFFD02C).w,(dword_FFFFD01C).w
		move.w	#$4000,d0
		moveq	#$11,d1
		bsr.w	sub_5764
		bsr.w	sub_41D2
		bra.s	loc_502A
; ---------------------------------------------------------------------------

loc_5028:				; CODE XREF: sub_4FDC+16j
		bsr.s	sub_5034

loc_502A:				; CODE XREF: sub_4FDC+26j sub_4FDC+4Aj
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		rts
; End of function sub_4FDC


; =============== S U B	R O U T	I N E =======================================


sub_5034:				; CODE XREF: ROM:loc_3B18p
					; ROM:loc_3BAAp ...
		bclr	#1,(byte_FFFFD009).w
		moveq	#0,d0
		moveq	#$11,d1
		bra.w	sub_5764
; End of function sub_5034


; =============== S U B	R O U T	I N E =======================================


sub_5042:				; CODE XREF: ROM:0000457Ej
		move.w	(word_FFFFD1CE).w,d1
		move.l	(dword_FFFFD028).w,d0
		move.b	d1,d0
		move.l	d0,(dword_FFFFD018).w
		move.w	#$2000,d0
		moveq	#$11,d1
		bsr.w	sub_5764
		bset	#1,(byte_FFFFD009).w
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		rts
; End of function sub_5042


; =============== S U B	R O U T	I N E =======================================


sub_506A:				; CODE XREF: ROM:00004556j
					; ROM:0000455Aj
		btst	#2,(byte_FFFFD004).w
		beq.w	sub_5250
		btst	#2,1(a0)
		beq.s	loc_5082
		bsr.s	sub_50B8
		bsr.s	sub_5034
		bra.s	loc_50AE
; ---------------------------------------------------------------------------

loc_5082:				; CODE XREF: sub_506A+10j
		btst	#1,1(a0)
		bne.w	sub_5250
		bset	#2,1(a0)
		bsr.w	sub_5444
		bsr.w	sub_5CFA
		move.w	#$2000,d0
		moveq	#$F,d1
		bsr.w	sub_5764
		btst	#2,(a0)
		beq.s	loc_50AE
		bne.w	sub_46C2

loc_50AE:				; CODE XREF: sub_506A+16j sub_506A+3Ej
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		rts
; End of function sub_506A


; =============== S U B	R O U T	I N E =======================================


sub_50B8:				; CODE XREF: sub_4F2C:loc_4F3Cp
					; sub_506A+12p
		bclr	#2,1(a0)
		bne.s	loc_50C2
		rts
; ---------------------------------------------------------------------------

loc_50C2:				; CODE XREF: sub_50B8+6j
		move.w	#0,d0
		moveq	#$F,d1
		bsr.w	sub_5764
		btst	#6,(a0)
		beq.s	loc_50E6
		bsr.w	sub_5374
		btst	#2,(a0)
		beq.s	loc_50EA
		move.b	(unk_FFFFD039).w,d0
		bsr.w	sub_5392
		bra.s	loc_50EA
; ---------------------------------------------------------------------------

loc_50E6:				; CODE XREF: sub_50B8+18j
		bsr.w	sub_5336

loc_50EA:				; CODE XREF: sub_50B8+22j sub_50B8+2Cj
		bsr.w	sub_53C2
		move.b	d1,(byte_FFFFD038).w
		bra.w	sub_5CFA
; End of function sub_50B8


; =============== S U B	R O U T	I N E =======================================


sub_50F6:				; CODE XREF: ROM:0000455Ej
		btst	#0,(a0)
		bne.s	loc_511E
		btst	#1,1(a0)
		bne.w	sub_5250
		bchg	#7,(a0)
		bne.s	loc_511C
		move.w	#$2000,d0
		moveq	#$12,d1
		bsr.w	sub_5764
		bsr.w	sub_41A8
		bra.s	loc_511E
; ---------------------------------------------------------------------------

loc_511C:				; CODE XREF: sub_50F6+14j
		bsr.s	sub_5128

loc_511E:				; CODE XREF: sub_50F6+4j sub_50F6+24j
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		rts
; End of function sub_50F6


; =============== S U B	R O U T	I N E =======================================


sub_5128:				; CODE XREF: sub_4F2C+24p
					; sub_50F6:loc_511Cp
		bclr	#7,(a0)
		moveq	#$12,d1
		moveq	#0,d0
		bra.w	sub_5764
; End of function sub_5128


; =============== S U B	R O U T	I N E =======================================


sub_5134:				; CODE XREF: ROM:00004566j
		btst	#0,(a0)
		bne.s	loc_5154
		bchg	#4,1(a0)
		beq.s	loc_5146
		bsr.s	sub_515E
		bra.s	loc_5154
; ---------------------------------------------------------------------------

loc_5146:				; CODE XREF: sub_5134+Cj
		move.w	#$2000,d0
		moveq	#$15,d1
		bsr.w	sub_5764
		bsr.w	sub_41B8

loc_5154:				; CODE XREF: sub_5134+4j sub_5134+10j
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		rts
; End of function sub_5134


; =============== S U B	R O U T	I N E =======================================


sub_515E:				; CODE XREF: sub_4F2C+20p sub_5134+Ep
		bclr	#4,1(a0)
		moveq	#0,d0
		moveq	#$15,d1
		bra.w	sub_5764
; End of function sub_515E


; =============== S U B	R O U T	I N E =======================================


sub_516C:				; CODE XREF: ROM:00004562j
		btst	#2,(a0)
		beq.s	loc_519A
		addq.b	#1,(byte_FFFFD00E).w
		andi.b	#3,(byte_FFFFD00E).w
		bsr.w	sub_5AD0
		moveq	#$16,d1
		move.w	#$2000,d0
		bsr.w	sub_5764
		move.b	#$14,(byte_FFFFD058).w
		st	(byte_FFFFD00C).w
		move.b	(byte_FFFFD00E).w,(byte_FFFFD00D).w

loc_519A:				; CODE XREF: sub_516C+4j
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		rts
; End of function sub_516C


; =============== S U B	R O U T	I N E =======================================


sub_51A4:				; CODE XREF: sub_4642+72p sub_46C2+24p ...
		tst.b	(byte_FFFFD00C).w
		beq.s	loc_51B2
		move.b	(byte_FFFFD00D).w,(byte_FFFFD00E).w
		bra.s	loc_51B6
; ---------------------------------------------------------------------------

loc_51B2:				; CODE XREF: sub_51A4+4j
		clr.b	(byte_FFFFD00E).w

loc_51B6:				; CODE XREF: sub_51A4+Cj
		bsr.w	sub_5AD0
		rts
; End of function sub_51A4


; =============== S U B	R O U T	I N E =======================================


sub_51BC:				; CODE XREF: sub_4A0E+12p
		move.b	#3,(byte_FFFFD00E).w
		bra.w	sub_5AD0
; End of function sub_51BC


; =============== S U B	R O U T	I N E =======================================


sub_51C6:				; CODE XREF: ROM:0000456Aj
		bset	#7,(byte_FFFFD007).w
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		rts
; End of function sub_51C6


; =============== S U B	R O U T	I N E =======================================


sub_51D6:				; CODE XREF: ROM:00004572j
		btst	#0,(a0)
		bne.s	loc_521C
		cmpi.b	#$F,(byte_FFFFD010).w
		bcc.s	loc_521C
		addq.b	#1,(byte_FFFFD010).w
		moveq	#9,d1
		move.w	#$2000,d0
		bsr.w	sub_5764
		move.b	#$14,(byte_FFFFD05D).w
		bra.s	loc_521C
; ---------------------------------------------------------------------------

loc_51FA:				; CODE XREF: ROM:00004576j
		btst	#0,(a0)
		bne.s	loc_521C
		cmpi.b	#1,(byte_FFFFD010).w
		bls.s	loc_521C
		subq.b	#1,(byte_FFFFD010).w
		moveq	#8,d1
		move.w	#$2000,d0
		bsr.w	sub_5764
		move.b	#$14,(byte_FFFFD05C).w

loc_521C:				; CODE XREF: sub_51D6+4j sub_51D6+Cj ...
		move.b	(byte_FFFFD010).w,d1
		bsr.w	sub_55AC
		bsr.w	sub_5480
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		rts
; End of function sub_51D6


; =============== S U B	R O U T	I N E =======================================


sub_5232:
		btst	#2,(byte_FFFFD008).w
		beq.s	loc_5240
		cmp.b	(byte_FFFFFE43).w,d1
		rts
; ---------------------------------------------------------------------------

loc_5240:				; CODE XREF: sub_5232+6j
		andi	#$FB,ccr ; 'û'
		rts
; End of function sub_5232


; =============== S U B	R O U T	I N E =======================================


sub_5246:
		bsr.w	sub_53C2
		move.b	d1,(byte_FFFFD038).w
		rts
; End of function sub_5246


; =============== S U B	R O U T	I N E =======================================


sub_5250:				; CODE XREF: sub_4822+22j sub_48FE+22j ...
		moveq	#$FFFFFF92,d7
		jsr	loc_109C(pc)
		clr.w	(word_FFFFD000).w
		clr.b	(byte_FFFFD002).w
		rts
; End of function sub_5250


; =============== S U B	R O U T	I N E =======================================


sub_5260:				; CODE XREF: sub_30C2+46p
					; sub_4EF6:loc_4F0Ap ...
		movem.l	d7/a6,-(sp)
		clr.w	(word_FFFFD042).w
		clr.w	(word_FFFFD168).w
		clr.w	(word_FFFFD166).w
		lea	(unk_FFFFD16A).w,a6
		moveq	#$18,d7

loc_5276:				; CODE XREF: sub_5260+18j
		clr.l	(a6)+
		dbf	d7,loc_5276
		movem.l	(sp)+,d7/a6
		rts
; End of function sub_5260


; =============== S U B	R O U T	I N E =======================================


sub_5282:				; CODE XREF: sub_3950+28p
		lea	(word_FFFFD168).w,a1
		cmpi.w	#$63,(a1) ; 'c'
		beq.s	loc_52C4
		addq.w	#1,(a1)
		addq.w	#1,(word_FFFFD166).w
		movem.l	d1-d2,-(sp)
		move.w	(word_FFFFD166).w,d1
		move.w	(a1),d2
		cmp.w	d1,d2
		beq.s	loc_52BA
		movem.l	a1-a2,-(sp)
		lea	2(a1,d2.w),a2
		adda.w	d2,a1
		addq.w	#1,a1
		sub.w	d1,d2
		subq.w	#1,d2

loc_52B0:				; CODE XREF: sub_5282+30j
		move.b	-(a1),-(a2)
		dbf	d2,loc_52B0
		movem.l	(sp)+,a1-a2

loc_52BA:				; CODE XREF: sub_5282+1Cj
		move.b	d0,1(a1,d1.w)
		movem.l	(sp)+,d1-d2
		rts
; ---------------------------------------------------------------------------

loc_52C4:				; CODE XREF: sub_5282+8j
		ori	#1,ccr
		rts
; End of function sub_5282


; =============== S U B	R O U T	I N E =======================================


sub_52CA:				; CODE XREF: sub_39AC+18p
		lea	(word_FFFFD168).w,a1
		tst.w	(a1)
		beq.s	locret_52F2
		subq.w	#1,(a1)
		move.w	(a1),d1
		sub.w	d0,d1

loc_52D8:				; CODE XREF: sub_52CA+16j
		move.b	3(a1,d0.w),2(a1,d0.w)
		addq.w	#1,d0
		dbf	d1,loc_52D8
		move.w	(a1),d1
		cmp.w	(word_FFFFD166).w,d1
		bcc.s	loc_52F0
		move.w	d1,(word_FFFFD166).w

loc_52F0:				; CODE XREF: sub_52CA+20j
		tst.w	(a1)

locret_52F2:				; CODE XREF: sub_52CA+6j
		rts
; End of function sub_52CA


; =============== S U B	R O U T	I N E =======================================


sub_52F4:				; CODE XREF: sub_4400:loc_447Ep
					; sub_45BE+20p
		movem.l	d0-d1/a1,-(sp)
		moveq	#0,d0
		tst.b	d7
		beq.s	loc_5310
		move.b	(word_FFFFFE44).w,d1
		lea	(unk_FFFFD102).w,a1

loc_5306:				; CODE XREF: sub_52F4+1Aj
		move.b	d1,(a1)+
		addq.w	#1,d0
		addq.w	#1,d1
		cmp.b	d7,d1
		bls.s	loc_5306

loc_5310:				; CODE XREF: sub_52F4+8j
		move.w	d0,(word_FFFFD100).w
		movem.l	(sp)+,d0-d1/a1
		rts
; End of function sub_52F4


; =============== S U B	R O U T	I N E =======================================


sub_531A:				; CODE XREF: sub_4DF2+20p
		movem.l	d0-d1/a1-a2,-(sp)
		lea	(word_FFFFD100).w,a1
		lea	(unk_FFFFD1D0).w,a2
		move.w	(a1)+,d0
		move.w	d0,(a2)+

loc_532A:				; CODE XREF: sub_531A+12j
		move.b	(a1)+,(a2)+
		dbf	d0,loc_532A
		movem.l	(sp)+,d0-d1/a1-a2
		rts
; End of function sub_531A


; =============== S U B	R O U T	I N E =======================================


sub_5336:				; CODE XREF: sub_4400+82p sub_4DF2+10p ...
		movem.l	d0-d1/a1-a2,-(sp)
		btst	#2,(byte_FFFFD008).w
		bne.s	loc_5346
		bsr.s	sub_53B0
		bra.s	loc_534C
; ---------------------------------------------------------------------------

loc_5346:				; CODE XREF: sub_5336+Aj
		bsr.s	sub_53C2
		movem.l	d1,-(sp)

loc_534C:				; CODE XREF: sub_5336+Ej
		lea	(word_FFFFD100).w,a1
		lea	(unk_FFFFD1D0).w,a2
		move.w	(a1)+,d0
		move.w	d0,(a2)+

loc_5358:				; CODE XREF: sub_5336+24j
		move.b	(a1)+,(a2)+
		dbf	d0,loc_5358
		btst	#2,(byte_FFFFD008).w
		beq.s	loc_536E
		movem.l	(sp)+,d0
		bsr.w	sub_5392

loc_536E:				; CODE XREF: sub_5336+2Ej
		movem.l	(sp)+,d0-d1/a1-a2
		rts
; End of function sub_5336


; =============== S U B	R O U T	I N E =======================================


sub_5374:				; CODE XREF: sub_4D9E+1Ap sub_4E9E+34p ...
		movem.l	a1-a2,-(sp)
		lea	(word_FFFFD1CE).w,a1
		clr.w	(a1)+
		lea	(word_FFFFD168).w,a2
		move.w	(a2)+,(a1)+
		moveq	#$18,d0

loc_5386:				; CODE XREF: sub_5374+14j
		move.l	(a2)+,(a1)+
		dbf	d0,loc_5386
		movem.l	(sp)+,a1-a2
		rts
; End of function sub_5374


; =============== S U B	R O U T	I N E =======================================


sub_5392:				; CODE XREF: sub_4DF2+2Ap sub_50B8+28p ...
		movem.l	d1/a1-a2,-(sp)
		lea	(word_FFFFD1CE).w,a1
		lea	(unk_FFFFD1D2).w,a2
		moveq	#0,d1

loc_53A0:				; CODE XREF: sub_5392+14j
		cmp.b	(a2)+,d0
		beq.s	loc_53A8
		addq.w	#1,d1
		bra.s	loc_53A0
; ---------------------------------------------------------------------------

loc_53A8:				; CODE XREF: sub_5392+10j
		move.w	d1,(a1)
		movem.l	(sp)+,d1/a1-a2
		rts
; End of function sub_5392


; =============== S U B	R O U T	I N E =======================================


sub_53B0:				; CODE XREF: sub_4A0E+16p sub_4A0E+32p ...
		clr.w	(word_FFFFD1CE).w
		rts
; End of function sub_53B0


; =============== S U B	R O U T	I N E =======================================


sub_53B6:				; CODE XREF: sub_4400+B8p sub_62E4+56p
		cmp.w	(word_FFFFD1CE).w,d0
		beq.s	locret_53C0
		move.w	d0,(word_FFFFD1CE).w

locret_53C0:				; CODE XREF: sub_53B6+4j
		rts
; End of function sub_53B6


; =============== S U B	R O U T	I N E =======================================


sub_53C2:				; CODE XREF: sub_46F4:loc_4704p
					; sub_4822+36p	...
		move.l	a1,-(sp)
		lea	(word_FFFFD1CE).w,a1
		move.w	(a1),d1
		move.b	4(a1,d1.w),d1
		movea.l	(sp)+,a1
		rts
; End of function sub_53C2


; =============== S U B	R O U T	I N E =======================================


sub_53D2:				; CODE XREF: sub_4400+A2p
		move.l	a1,-(sp)
		lea	(unk_FFFFD1D0).w,a1
		move.w	(a1)+,d1
		subq.w	#1,d1
		move.b	(a1,d1.w),d1
		movea.l	(sp)+,a1
		rts
; End of function sub_53D2


; =============== S U B	R O U T	I N E =======================================


sub_53E4:				; CODE XREF: sub_48FE+2Ep
					; sub_48FE:loc_495Ep ...
		movem.l	a1,-(sp)
		lea	(word_FFFFD1CE).w,a1
		addq.w	#1,(a1)
		move.w	(a1)+,d1
		cmp.w	(a1)+,d1
		bcs.s	loc_5412
		btst	#5,(byte_FFFFD008).w
		beq.s	loc_5404
		clr.w	-4(a1)
		moveq	#0,d1
		bra.s	loc_5412
; ---------------------------------------------------------------------------

loc_5404:				; CODE XREF: sub_53E4+16j
		subq.w	#1,d1
		move.w	d1,-4(a1)
		moveq	#0,d1
		movem.l	(sp)+,a1
		rts
; ---------------------------------------------------------------------------

loc_5412:				; CODE XREF: sub_53E4+Ej sub_53E4+1Ej
		move.b	(a1,d1.w),d1
		movem.l	(sp)+,a1
		rts
; End of function sub_53E4


; =============== S U B	R O U T	I N E =======================================


sub_541C:				; CODE XREF: sub_4822:loc_485Ep
					; sub_4822:loc_48BEp
		move.l	a1,-(sp)
		lea	(word_FFFFD1CE).w,a1
		subq.w	#1,(a1)
		bpl.s	loc_543A
		btst	#5,(byte_FFFFD008).w
		beq.s	loc_5438
		move.w	2(a1),d1
		subq.w	#1,d1
		move.w	d1,(a1)
		bra.s	loc_543A
; ---------------------------------------------------------------------------

loc_5438:				; CODE XREF: sub_541C+10j
		clr.w	(a1)

loc_543A:				; CODE XREF: sub_541C+8j sub_541C+1Aj
		move.w	(a1),d1
		move.b	4(a1,d1.w),d1
		movea.l	(sp)+,a1
		rts
; End of function sub_541C


; =============== S U B	R O U T	I N E =======================================


sub_5444:				; CODE XREF: sub_4D9E+2Ep sub_4DF2+24p ...
		move.b	(byte_FFFFFE28).w,d0
		move.w	d0,-(sp)
		clr.b	(byte_FFFFFE28).w
		lea	(word_FFFFD1CE).w,a1
		clr.w	(a1)+
		move.w	(a1)+,d3
		move.w	d3,d4
		subq.w	#1,d3
		cmpi.w	#$63,d3	; 'c'
		bhi.s	locret_547E

loc_5460:				; CODE XREF: sub_5444+30j
		move.w	d4,d0
		bsr.w	randWithModulo
		move.b	(a1,d3.w),d2
		move.b	(a1,d0.w),(a1,d3.w)
		move.b	d2,(a1,d0.w)
		dbf	d3,loc_5460
		move.w	(sp)+,d0
		move.b	d0,(byte_FFFFFE28).w

locret_547E:				; CODE XREF: sub_5444+1Aj
		rts
; End of function sub_5444


; =============== S U B	R O U T	I N E =======================================


sub_5480:				; CODE XREF: sub_3A40+78j sub_3F76+5Aj ...
		move.l	#$45CE0003,d0
		moveq	#1,d2
		bra.w	sub_5618
; End of function sub_5480


; =============== S U B	R O U T	I N E =======================================


sub_548C:
		move.l	#$45CE0003,(VDP_CONTROL).l
		move.l	(unk_FFFFE0A2).w,(VDP_DATA).l
		move.l	#$464E0003,(VDP_CONTROL).l
		move.l	(unk_FFFFE0A2).w,(VDP_DATA).l
		rts
; End of function sub_548C


; =============== S U B	R O U T	I N E =======================================


sub_54B2:				; CODE XREF: sub_3040+3Cp
		moveq	#0,d0
		moveq	#0,d1
		btst	#4,(byte_FFFFD004).w
		bne.s	loc_54EE
		btst	#2,(byte_FFFFD004).w
		bne.s	loc_54D6
		btst	#6,(byte_FFFFD004).w
		beq.s	loc_54EE
		moveq	#0,d1
		move.b	(byte_FFFFD038).w,d0
		bne.s	loc_54EE

loc_54D6:				; CODE XREF: sub_54B2+12j
		move.b	(byte_FFFFD030).w,d0
		cmpi.b	#$FF,d0
		bne.s	loc_54E2
		moveq	#0,d0

loc_54E2:				; CODE XREF: sub_54B2+2Cj
		move.w	(word_FFFFD026).w,d1
		cmpi.w	#$FFFF,d1
		bne.s	loc_54EE
		moveq	#0,d1

loc_54EE:				; CODE XREF: sub_54B2+Aj sub_54B2+1Aj	...
		lea	(VDP_DATA).l,a5
		lea	(unk_FFFFD039).w,a6
		move.b	d0,(a6)
		move.w	d1,(unk_FFFFD03A).w
		lea	dword_5590(pc),a4
		moveq	#1,d2
		move.w	d2,-(sp)
		move.b	(a6)+,d1
		bsr.w	sub_55AC
		move.l	(a4)+,d0
		bsr.w	sub_5618
		move.l	(a4)+,d0
		move.w	(sp)+,d2
		bsr.w	sub_55C4
		moveq	#0,d2
		cmpi.w	#$800,(word_FFFFD024).w
		beq.s	loc_5548
		move.w	(byte_FFFFD008).w,d0
		move.w	(word_FFFFD022).w,d1
		btst	#$A,d0
		beq.s	loc_5568
		eor.w	d0,d1
		btst	#$A,d1
		bne.s	loc_5548
		move.w	(word_FFFFD036).w,d0
		andi.w	#$C0,d0	; 'À'
		cmpi.w	#$C0,d0	; 'À'
		beq.s	loc_5568

loc_5548:				; CODE XREF: sub_54B2+70j sub_54B2+86j
		bset	#7,(byte_FFFFD005).w
		move.l	(a4)+,d0
		bsr.w	sub_566E
		move.l	(a4)+,d0
		bsr.w	sub_5694
		move.l	(a4)+,d0
		bsr.w	sub_566E
		move.l	(a4)+,d0
		bsr.w	sub_5694
		bra.s	loc_5586
; ---------------------------------------------------------------------------

loc_5568:				; CODE XREF: sub_54B2+7Ej sub_54B2+94j
		bclr	#7,(byte_FFFFD005).w
		move.b	(a6)+,d1
		move.l	(a4)+,d0
		bsr.w	sub_5618
		move.l	(a4)+,d0
		bsr.s	sub_55C4
		move.b	(a6)+,d1
		move.l	(a4)+,d0
		bsr.w	sub_5618
		move.l	(a4)+,d0
		bsr.s	sub_55C4

loc_5586:				; CODE XREF: sub_54B2+B4j
		move.b	(byte_FFFFD010).w,d1
		bsr.s	sub_55AC
		move.l	(a4)+,d0
		bra.s	sub_55C4
; End of function sub_54B2

; ---------------------------------------------------------------------------
dword_5590:	dc.l $45AA0003		; DATA XREF: sub_54B2+4Co
		dc.l $42BE0003
		dc.l $45B20003
		dc.l $42C80003
		dc.l $45B80003
		dc.l $42CE0003
		dc.l $42D80003

; =============== S U B	R O U T	I N E =======================================


sub_55AC:				; CODE XREF: ROM:0000037Cj
					; sub_51D6+4Ap	...
		move.w	d6,-(sp)
		andi.l	#$FF,d1
		divu.w	#$A,d1
		move.w	d1,d6
		asl.w	#4,d6
		swap	d1
		add.b	d6,d1
		move.w	(sp)+,d6
		rts
; End of function sub_55AC


; =============== S U B	R O U T	I N E =======================================


sub_55C4:				; CODE XREF: sub_54B2+64p sub_54B2+C6p ...
		tst.b	(byte_FFFFD003).w
		beq.s	locret_5616
		btst	#0,(byte_FFFFD004).w
		beq.s	loc_55DA
		btst	#1,(byte_FFFFD004).w
		bne.s	locret_5616

loc_55DA:				; CODE XREF: sub_55C4+Cj
		movem.l	d0-d2,-(sp)
		move.l	d0,(VDP_CONTROL).l
		move.b	d1,d0
		andi.w	#$F0,d0	; 'ð'
		bne.s	loc_55F8
		tst.w	d2
		beq.s	loc_55FA
		moveq	#0,d2
		move.w	#$C001,d0
		bra.s	loc_55FE
; ---------------------------------------------------------------------------

loc_55F8:				; CODE XREF: sub_55C4+26j
		lsr.w	#4,d0

loc_55FA:				; CODE XREF: sub_55C4+2Aj
		addi.w	#$6EF,d0

loc_55FE:				; CODE XREF: sub_55C4+32j
		move.w	d0,(VDP_DATA).l
		andi.w	#$F,d1
		addi.w	#$6EF,d1
		move.w	d1,(VDP_DATA).l
		movem.l	(sp)+,d0-d2

locret_5616:				; CODE XREF: sub_55C4+4j sub_55C4+14j
		rts
; End of function sub_55C4


; =============== S U B	R O U T	I N E =======================================


sub_5618:				; CODE XREF: sub_5480+8j sub_54B2+5Cp	...
		movem.l	d0-d6/a5-a6,-(sp)
		lea	(unk_FFFFEB1E).w,a6
		lea	(VDP_DATA).l,a5
		move.l	d0,4(a5)
		move.b	d1,d4
		asr.w	#4,d1
		bsr.s	sub_5654
		move.w	d5,d6
		swap	d5
		move.w	d5,(a5)
		move.w	d4,d1
		bsr.s	sub_5654
		swap	d5
		move.w	d5,(a5)
		addi.l	#$800000,d0
		move.l	d0,4(a5)
		move.w	d6,(a5)
		swap	d5
		move.w	d5,(a5)
		movem.l	(sp)+,d0-d6/a5-a6
		rts
; End of function sub_5618


; =============== S U B	R O U T	I N E =======================================


sub_5654:				; CODE XREF: sub_5618+16p sub_5618+20p
		andi.w	#$F,d1
		bne.s	loc_5662
		tst.w	d2
		beq.s	loc_5662
		moveq	#$28,d1	; '('
		bra.s	loc_5666
; ---------------------------------------------------------------------------

loc_5662:				; CODE XREF: sub_5654+4j sub_5654+8j
		add.w	d1,d1
		add.w	d1,d1

loc_5666:				; CODE XREF: sub_5654+Cj
		moveq	#0,d2
		move.l	(a6,d1.w),d5
		rts
; End of function sub_5654


; =============== S U B	R O U T	I N E =======================================


sub_566E:				; CODE XREF: sub_54B2+9Ep sub_54B2+AAp
		lea	(VDP_DATA).l,a5
		move.l	d0,4(a5)
		move.w	(unk_FFFFEB4A).w,(a5)
		move.w	(unk_FFFFEB4A).w,(a5)
		addi.l	#$800000,d0
		move.l	d0,4(a5)
		move.w	(unk_FFFFEB4C).w,(a5)
		move.w	(unk_FFFFEB4C).w,(a5)
		rts
; End of function sub_566E


; =============== S U B	R O U T	I N E =======================================


sub_5694:				; CODE XREF: sub_54B2+A4p sub_54B2+B0p
		tst.b	(byte_FFFFD003).w
		beq.s	locret_56B4
		btst	#0,(byte_FFFFD004).w
		beq.s	loc_56AA
		btst	#1,(byte_FFFFD004).w
		bne.s	locret_56B4

loc_56AA:				; CODE XREF: sub_5694+Cj
		move.l	d0,4(a5)
		move.l	#$6FF06FF,(a5)

locret_56B4:				; CODE XREF: sub_5694+4j sub_5694+14j
		rts
; End of function sub_5694


; =============== S U B	R O U T	I N E =======================================


sub_56B6:				; CODE XREF: sub_3040+38p
		moveq	#0,d0
		lea	(byte_FFFFD058).w,a0
		moveq	#$16,d1
		bsr.w	sub_5722
		moveq	#$14,d1
		bsr.w	sub_5722
		moveq	#4,d1
		bsr.w	sub_5722
		moveq	#5,d1
		bsr.w	sub_5722
		tst.b	(byte_FFFFD003).w
		beq.s	loc_56E8
		moveq	#8,d1
		bsr.w	sub_5722
		moveq	#9,d1
		bsr.w	sub_5722
		bra.s	loc_56EA
; ---------------------------------------------------------------------------

loc_56E8:				; CODE XREF: sub_56B6+22j
		clr.w	(a0)

loc_56EA:				; CODE XREF: sub_56B6+30j
		moveq	#0,d0
		moveq	#4,d1
		btst	#4,(byte_FFFFD005).w
		bne.s	loc_5702
		moveq	#5,d1
		btst	#5,(byte_FFFFD005).w
		bne.s	loc_5702
		rts
; ---------------------------------------------------------------------------

loc_5702:				; CODE XREF: sub_56B6+3Ej sub_56B6+48j
		btst	#7,(byte_FFFFD005).w
		bne.s	loc_571A
		btst	#6,(byte_FFFFD005).w
		beq.s	locret_5720
		andi.b	#$8F,(byte_FFFFD005).w
		bra.s	sub_5764
; ---------------------------------------------------------------------------

loc_571A:				; CODE XREF: sub_56B6+52j
		bset	#6,(byte_FFFFD005).w

locret_5720:				; CODE XREF: sub_56B6+5Aj
		rts
; End of function sub_56B6


; =============== S U B	R O U T	I N E =======================================


sub_5722:				; CODE XREF: sub_56B6+8p sub_56B6+Ep ...
		tst.b	(a0)+
		beq.s	locret_5730
		subq.b	#1,-1(a0)
		bne.s	locret_5730
		bra.w	sub_5764
; ---------------------------------------------------------------------------

locret_5730:				; CODE XREF: sub_5722+2j sub_5722+8j
		rts
; End of function sub_5722


; =============== S U B	R O U T	I N E =======================================


sub_5732:				; CODE XREF: sub_44E2+1Ep sub_45BE+4Ep ...
		move.l	#$43580003,d0
		bsr.w	sub_1846
		bne.s	sub_5754
		tst.b	(byte_FFFFD003).w
		beq.s	loc_5746
		rts
; ---------------------------------------------------------------------------

loc_5746:				; CODE XREF: sub_5732+10j
		lea	(unk_FFFFE438).w,a1
		moveq	#9,d1
		move.w	#6,d2
		bra.w	sub_C2E
; End of function sub_5732


; =============== S U B	R O U T	I N E =======================================


sub_5754:				; CODE XREF: sub_5732+Aj sub_5DFA+18p	...
		lea	(unk_FFFFE4C4).w,a1
		moveq	#9,d1
		move.w	#6,d2
		bra.w	sub_C2E
; End of function sub_5754

; ---------------------------------------------------------------------------
		rts

; =============== S U B	R O U T	I N E =======================================


sub_5764:				; CODE XREF: sub_3B28+46p sub_4718+4j	...
		btst	#0,(byte_FFFFD004).w
		beq.s	loc_5774
		lea	unk_5904(pc),a1
		bsr.s	sub_57CE
		bra.s	loc_5780
; ---------------------------------------------------------------------------

loc_5774:				; CODE XREF: sub_5764+6j
		cmpi.w	#$C,d1
		bhi.s	loc_5780
		lea	unk_5904(pc),a1
		bsr.s	loc_5784

loc_5780:				; CODE XREF: sub_5764+Ej sub_5764+14j
		lea	unk_580C(pc),a1

loc_5784:				; CODE XREF: sub_5764+1Ap
		cmpi.w	#$1F,d1
		bcs.s	loc_578C

locret_578A:				; CODE XREF: sub_5764+2Cj sub_5764+40j ...
		rts
; ---------------------------------------------------------------------------

loc_578C:				; CODE XREF: sub_5764+24j
		cmpi.w	#$1B,d1
		bcc.s	locret_578A
		cmpi.w	#$E,d1
		bls.s	loc_57B0
		cmpi.w	#$17,d1
		bls.s	loc_57A8
		cmpi.w	#2,(word_FFFFD052).w
		bne.s	locret_578A
		bra.s	loc_57B0
; ---------------------------------------------------------------------------

loc_57A8:				; CODE XREF: sub_5764+38j
		cmpi.w	#1,(word_FFFFD052).w
		bne.s	locret_578A

loc_57B0:				; CODE XREF: sub_5764+32j sub_5764+42j
		movem.l	d0-d5/a5,-(sp)
		asl.w	#3,d1
		adda.w	d1,a1
		move.w	d0,d3
		movem.w	(a1),d0-d2/a1
		swap	d0
		move.w	#3,d0
		jsr	sub_C78(pc)
		movem.l	(sp)+,d0-d5/a5
		rts
; End of function sub_5764


; =============== S U B	R O U T	I N E =======================================


sub_57CE:				; CODE XREF: sub_5764+Cp
		cmpi.w	#$C,d1
		bls.s	loc_57D6
		rts
; ---------------------------------------------------------------------------

loc_57D6:				; CODE XREF: sub_57CE+4j
		movem.l	d0-d5/a2,-(sp)
		asl.w	#3,d1
		adda.w	d1,a1
		move.w	d0,d3
		movem.w	(a1),d0-d2/a1
		subi.w	#$138,d0
		move.w	d0,d4
		andi.w	#$7E,d0	; '~'
		andi.w	#$F80,d4
		lsr.w	#5,d4
		mulu.w	#5,d4
		add.w	d4,d0
		lea	(unk_FFFFF5C6).w,a2
		adda.w	d0,a2
		moveq	#$14,d0
		bsr.w	sub_62AE
		movem.l	(sp)+,d0-d5/a2
		rts
; End of function sub_57CE

; ---------------------------------------------------------------------------
unk_580C:	dc.b $46 ; F		; DATA XREF: sub_5764:loc_5780o
		dc.b $D8 ; Ø
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   0
		dc.b $E8 ; è
		dc.b $F8 ; ø
		dc.b $46 ; F
		dc.b $DE ; Þ
		dc.b   0
		dc.b   3
		dc.b   0
		dc.b   1
		dc.b $E8 ; è
		dc.b $FE ; þ
		dc.b $48 ; H
		dc.b $DE ; Þ
		dc.b   0
		dc.b   3
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b $1E
		dc.b $47 ; G
		dc.b $DE ; Þ
		dc.b   0
		dc.b   3
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b  $E
		dc.b $47 ; G
		dc.b $58 ; X
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b $2E ; .
		dc.b $47 ; G
		dc.b $66 ; f
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b $3A ; :
		dc.b $48 ; H
		dc.b $58 ; X
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b $46 ; F
		dc.b $48 ; H
		dc.b $66 ; f
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b $52 ; R
		dc.b $48 ; H
		dc.b $58 ; X
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b $76 ; v
		dc.b $48 ; H
		dc.b $66 ; f
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b $82 ; ‚
		dc.b $4B ; K
		dc.b $5C ; \
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   0
		dc.b $E8 ; è
		dc.b $F8 ; ø
		dc.b $49 ; I
		dc.b $DC ; Ü
		dc.b   0
		dc.b   5
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b $5E ; ^
		dc.b $4C ; L
		dc.b $5C ; \
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   0
		dc.b $E8 ; è
		dc.b $F8 ; ø
		dc.b $45 ; E
		dc.b $5C ; \
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   0
		dc.b $E8 ; è
		dc.b $F8 ; ø
		dc.b $44 ; D
		dc.b $5C ; \
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   0
		dc.b $E8 ; è
		dc.b $F8 ; ø
		dc.b $4B ; K
		dc.b $2A ; *
		dc.b   0
		dc.b   5
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b $D6 ; Ö
		dc.b $4B ; K
		dc.b $46 ; F
		dc.b   0
		dc.b   5
		dc.b   0
		dc.b   1
		dc.b $EA ; ê
		dc.b   6
		dc.b $4B ; K
		dc.b $38 ; 8
		dc.b   0
		dc.b   5
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b $EE ; î
		dc.b $4C ; L
		dc.b $2A ; *
		dc.b   0
		dc.b   5
		dc.b   0
		dc.b   1
		dc.b $EA ; ê
		dc.b $1E
		dc.b $4C ; L
		dc.b $46 ; F
		dc.b   0
		dc.b   5
		dc.b   0
		dc.b   1
		dc.b $EA ; ê
		dc.b $4E ; N
		dc.b $4D ; M
		dc.b $38 ; 8
		dc.b   0
		dc.b   5
		dc.b   0
		dc.b   1
		dc.b $EA ; ê
		dc.b $7E ; ~
		dc.b $4D ; M
		dc.b $2A ; *
		dc.b   0
		dc.b   5
		dc.b   0
		dc.b   1
		dc.b $EA ; ê
		dc.b $66 ; f
		dc.b $4C ; L
		dc.b $38 ; 8
		dc.b   0
		dc.b   5
		dc.b   0
		dc.b   1
		dc.b $EA ; ê
		dc.b $36 ; 6
		dc.b $4D ; M
		dc.b $46 ; F
		dc.b   0
		dc.b   5
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b $BE ; ¾
		dc.b $4B ; K
		dc.b $2A ; *
		dc.b   0
		dc.b   5
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b $8E ; Ž
		dc.b $4B ; K
		dc.b $38 ; 8
		dc.b   0
		dc.b   5
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b $A6 ; ¦
		dc.b $4B ; K
		dc.b $46 ; F
		dc.b   0
		dc.b   5
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b $BE ; ¾
		dc.b $46 ; F
		dc.b $D8 ; Ø
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b   1
		dc.b $E8 ; è
		dc.b $F8 ; ø
		dc.b $46 ; F
		dc.b $D8 ; Ø
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b   1
		dc.b $E8 ; è
		dc.b $F8 ; ø
		dc.b $46 ; F
		dc.b $D8 ; Ø
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b   1
		dc.b $E8 ; è
		dc.b $F8 ; ø
		dc.b $46 ; F
		dc.b $D8 ; Ø
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b   1
		dc.b $E8 ; è
		dc.b $F8 ; ø
unk_5904:	dc.b $54 ; T		; DATA XREF: sub_5764+8o sub_5764+16o
		dc.b $B8 ; ¸
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   0
		dc.b $E8 ; è
		dc.b $F8 ; ø
		dc.b $54 ; T
		dc.b $BE ; ¾
		dc.b   0
		dc.b   3
		dc.b   0
		dc.b   1
		dc.b $E8 ; è
		dc.b $FE ; þ
		dc.b $56 ; V
		dc.b $BE ; ¾
		dc.b   0
		dc.b   3
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b $1E
		dc.b $55 ; U
		dc.b $BE ; ¾
		dc.b   0
		dc.b   3
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b  $E
		dc.b $55 ; U
		dc.b $38 ; 8
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b $2E ; .
		dc.b $55 ; U
		dc.b $46 ; F
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b $3A ; :
		dc.b $56 ; V
		dc.b $38 ; 8
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b $46 ; F
		dc.b $56 ; V
		dc.b $46 ; F
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b $52 ; R
		dc.b $56 ; V
		dc.b $38 ; 8
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b $76 ; v
		dc.b $56 ; V
		dc.b $46 ; F
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b $82 ; ‚
		dc.b $59 ; Y
		dc.b $3C ; <
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   0
		dc.b $E8 ; è
		dc.b $F8 ; ø
		dc.b $57 ; W
		dc.b $BC ; ¼
		dc.b   0
		dc.b   5
		dc.b   0
		dc.b   1
		dc.b $E9 ; é
		dc.b $5E ; ^
		dc.b $5A ; Z
		dc.b $3C ; <
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   0
		dc.b $E8 ; è
		dc.b $F8 ; ø
		dc.b $43 ; C
		dc.b $FA ; ú
		dc.b   0
		dc.b $2C ; ,
		dc.b  $C
		dc.b $41 ; A
		dc.b   0
		dc.b  $A
		dc.b $63 ; c
		dc.b   2
		dc.b $4E ; N
		dc.b $75 ; u

; =============== S U B	R O U T	I N E =======================================


sub_5978:
		movem.l	d0-d5/a5,-(sp)
		add.w	d1,d1
		adda.w	d1,a1
		add.w	d1,d1
		adda.w	d1,a1
		move.w	d0,d3
		movem.w	(a1),d0-d1/a1
		swap	d0
		move.w	#3,d0
		bsr.w	sub_5B6C
		movem.l	(sp)+,d0-d5/a5
		rts
; End of function sub_5978

; ---------------------------------------------------------------------------
		dc.b $48 ; H
		dc.b $26 ; &
		dc.b   0
		dc.b   2
		dc.b $EB ; ë
		dc.b $4E ; N
		dc.b $48 ; H
		dc.b $30 ; 0
		dc.b   0
		dc.b   2
		dc.b $EB ; ë
		dc.b $54 ; T
		dc.b $48 ; H
		dc.b $38 ; 8
		dc.b   0
		dc.b   2
		dc.b $EB ; ë
		dc.b $5A ; Z
		dc.b $48 ; H
		dc.b $40 ; @
		dc.b   0
		dc.b   2
		dc.b $EB ; ë
		dc.b $60 ; `
		dc.b $48 ; H
		dc.b $48 ; H
		dc.b   0
		dc.b   7
		dc.b $EB ; ë
		dc.b $66 ; f
		dc.b $48 ; H
		dc.b $48 ; H
		dc.b   0
		dc.b   7
		dc.b $EB ; ë
		dc.b $66 ; f
		dc.b $48 ; H
		dc.b $5A ; Z
		dc.b   0
		dc.b   7
		dc.b $EB ; ë
		dc.b $76 ; v
		dc.b $48 ; H
		dc.b $5A ; Z
		dc.b   0
		dc.b   7
		dc.b $EB ; ë
		dc.b $76 ; v
		dc.b $48 ; H
		dc.b $5A ; Z
		dc.b   0
		dc.b   7
		dc.b $EB ; ë
		dc.b $86 ; †
		dc.b $48 ; H
		dc.b $5A ; Z
		dc.b   0
		dc.b   7
		dc.b $EB ; ë
		dc.b $86 ; †
		dc.b $48 ; H
		dc.b $26 ; &
		dc.b   0
		dc.b   2
		dc.b $EB ; ë
		dc.b $96 ; –
		dc.b $4E ; N
		dc.b $75 ; u

; =============== S U B	R O U T	I N E =======================================


sub_59DE:				; CODE XREF: sub_3A40+1Cj
					; ROM:00003B22p ...
		move.l	a1,-(sp)
		bsr.w	sub_4208
		bne.s	loc_59F2
		cmpi.w	#1,d1
		beq.s	loc_59F2
		cmpi.w	#2,d1
		bne.s	loc_5A60

loc_59F2:				; CODE XREF: sub_59DE+6j sub_59DE+Cj
		move.l	#$45BE0003,d0
		tst.b	(byte_FFFFD003).w
		beq.s	loc_5A1C
		cmpi.w	#4,d1
		bcs.s	loc_5A5E
		cmpi.w	#7,d1
		bcc.s	loc_5A5E
		movem.l	d0-d2,-(sp)
		moveq	#3,d1
		bsr.s	sub_5A64
		movem.l	(sp)+,d0-d2
		bsr.w	sub_5DEE
		bra.s	loc_5A60
; ---------------------------------------------------------------------------

loc_5A1C:				; CODE XREF: sub_59DE+1Ej
		cmpi.w	#6,d1
		bne.s	loc_5A5E
		tst.b	(byte_FFFFFDDC).w
		beq.s	loc_5A60
		btst	#1,(byte_FFFFD008).w
		bne.s	loc_5A3E
		btst	#2,(byte_FFFFD008).w
		beq.s	loc_5A42
		moveq	#4,d1
		bra.w	loc_5A5E
; ---------------------------------------------------------------------------

loc_5A3E:				; CODE XREF: sub_59DE+50j
		moveq	#5,d1
		bra.s	loc_5A5E
; ---------------------------------------------------------------------------

loc_5A42:				; CODE XREF: sub_59DE+58j
		moveq	#9,d1
		lea	(unk_FFFFE152).w,a1
		bsr.w	writeToVram
		addi.l	#$800000,d0
		moveq	#9,d1
		lea	(unk_FFFFE152).w,a1
		bsr.w	writeToVram
		bra.s	loc_5A60
; ---------------------------------------------------------------------------

loc_5A5E:				; CODE XREF: sub_59DE+24j sub_59DE+2Aj ...
		bsr.s	sub_5A64

loc_5A60:				; CODE XREF: sub_59DE+12j sub_59DE+3Cj ...
		movea.l	(sp)+,a1
		rts
; End of function sub_59DE


; =============== S U B	R O U T	I N E =======================================


sub_5A64:				; CODE XREF: sub_59DE+32p
					; sub_59DE:loc_5A5Ep
		move.w	d1,-(sp)
		add.w	d1,d1
		movea.w	word_5A7E(pc,d1.w),a1
		moveq	#9,d1
		moveq	#1,d2
		move.l	#$45BE0003,d0
		bsr.w	sub_C2E
		move.w	(sp)+,d1
		rts
; End of function sub_5A64

; ---------------------------------------------------------------------------
word_5A7E:	dc.w $EC3E
		dc.w $EC16
		dc.w $EBC6
		dc.w $EBEE
		dc.w $EB4E
		dc.w $EB76
		dc.w $EB9E
		dc.w $ECB6
		dc.w $ECDE

; =============== S U B	R O U T	I N E =======================================


sub_5A90:				; CODE XREF: sub_4D78:loc_4D84j
		cmpi.w	#2,d0
		bhi.s	locret_5ACA
		move.w	d0,d1
		move.l	#$44BE0003,d0
		tst.w	d1
		bne.s	loc_5ABC
		moveq	#9,d1
		lea	(unk_FFFFE0B6).w,a1
		bsr.w	writeToVram
		addi.l	#$800000,d0
		moveq	#9,d1
		lea	(unk_FFFFE0EA).w,a1
		bra.w	writeToVram
; ---------------------------------------------------------------------------

loc_5ABC:				; CODE XREF: sub_5A90+10j
		add.w	d1,d1
		movea.w	locret_5ACA(pc,d1.w),a1
		moveq	#9,d1
		moveq	#1,d2
		bsr.w	sub_C2E

locret_5ACA:				; CODE XREF: sub_5A90+4j
		rts
; End of function sub_5A90

; ---------------------------------------------------------------------------
		asr.w	d6,d6
		lsr.l	#6,d6

; =============== S U B	R O U T	I N E =======================================


sub_5AD0:				; CODE XREF: sub_516C+10p
					; sub_51A4:loc_51B6p ...
		moveq	#0,d0
		move.b	(byte_FFFFD00E).w,d0
		mulu.w	#$C,d0
		lea	(unk_FFFFEAEE).w,a1
		adda.w	d0,a1
		move.l	#$44B20003,d0
		moveq	#5,d1
		bra.w	writeToVram
; End of function sub_5AD0


; =============== S U B	R O U T	I N E =======================================


sub_5AEC:				; CODE XREF: sub_5FA2+16p
		move.l	#$43240003,d0
		lea	(decompScratch).w,a1
		moveq	#$19,d1
		moveq	#$E,d2
		jsr	sub_C2E(pc)
		move.l	#$46D80003,d0
		lea	(unk_FFFFE30C).w,a1
		moveq	#9,d1
		moveq	#$E,d2
		jsr	sub_C2E(pc)
		bsr.w	sub_5732
		bsr.s	sub_5AD0
		bsr.s	sub_5B22
		bsr.w	sub_5F36
		clr.w	(word_FFFFD052).w
		rts
; End of function sub_5AEC


; =============== S U B	R O U T	I N E =======================================


sub_5B22:				; CODE XREF: sub_5AEC+2Ap
		move.w	#1,d1
		moveq	#3,d7

loc_5B28:				; CODE XREF: sub_5B22+20j
		moveq	#0,d0
		cmpi.w	#3,d1
		bne.s	loc_5B3C
		btst	#2,(byte_FFFFD008).w
		bne.s	loc_5B3C
		move.w	#$2000,d0

loc_5B3C:				; CODE XREF: sub_5B22+Cj sub_5B22+14j
		bsr.w	sub_5764
		addq.w	#1,d1
		dbf	d7,loc_5B28
		move.w	#$A,d1
		moveq	#1,d7

loc_5B4C:				; CODE XREF: sub_5B22+32j
		moveq	#0,d0
		bsr.w	sub_5764
		addq.w	#1,d1
		dbf	d7,loc_5B4C
		rts
; End of function sub_5B22


; =============== S U B	R O U T	I N E =======================================


writeToVram:				; CODE XREF: sub_59DE+6Ap sub_59DE+7Ap ...
		move.l	d0,(VDP_CONTROL).l

loc_5B60:				; CODE XREF: writeToVram+Cj
		move.w	(a1)+,(VDP_DATA).l
		dbf	d1,loc_5B60
		rts
; End of function writeToVram


; =============== S U B	R O U T	I N E =======================================


sub_5B6C:				; CODE XREF: sub_5978+18p
		move.l	d0,(VDP_CONTROL).l

loc_5B72:				; CODE XREF: sub_5B6C+10j
		move.w	(a1)+,d4
		or.w	d3,d4
		move.w	d4,(VDP_DATA).l
		dbf	d1,loc_5B72
		rts
; End of function sub_5B6C


; =============== S U B	R O U T	I N E =======================================


sub_5B82:				; CODE XREF: sub_4C8E+6p sub_4E9E+8p
		moveq	#$A,d1
		move.w	#$2000,d0
		bsr.w	sub_5764
		move.w	#1,(word_FFFFD052).w
		move.l	#$4AA40003,d0
		lea	(unk_FFFFE550).w,a1
		moveq	#$19,d1
		moveq	#8,d2
		jsr	sub_C2E(pc)
		lea	unk_5BE2(pc),a2
		move.w	(byte_FFFFD008).w,d2
		moveq	#$F,d1

loc_5BAE:				; CODE XREF: sub_5B82+52j
		move.b	(a2)+,d3
		bmi.s	loc_5BBC
		btst	d3,d2
		beq.s	loc_5BBC

loc_5BB6:				; CODE XREF: sub_5B82+44j
		move.w	#$2000,d0
		bra.s	loc_5BCA
; ---------------------------------------------------------------------------

loc_5BBC:				; CODE XREF: sub_5B82+2Ej sub_5B82+32j
		cmpi.b	#$FE,d3
		bne.s	loc_5BC8
		tst.w	(word_FFFFD168).w
		bne.s	loc_5BB6

loc_5BC8:				; CODE XREF: sub_5B82+3Ej
		moveq	#0,d0

loc_5BCA:				; CODE XREF: sub_5B82+38j
		bsr.w	sub_5764
		addq.w	#1,d1
		cmpi.w	#$17,d1
		bls.s	loc_5BAE
		tst.b	(byte_FFFFD003).w
		beq.s	locret_5BE0
		bsr.w	resetWindowVPos

locret_5BE0:				; CODE XREF: sub_5B82+58j
		rts
; End of function sub_5B82

; ---------------------------------------------------------------------------
unk_5BE2:	dc.b   2		; DATA XREF: sub_5B82+22o
		dc.b  $E
		dc.b   1
		dc.b  $F
		dc.b $FE ; þ
		dc.b $FF
		dc.b   4
		dc.b $FF
		dc.b $FF
		dc.b   0

; =============== S U B	R O U T	I N E =======================================


sub_5BEC:				; CODE XREF: sub_4E48+3Ap
		move.w	#2,(word_FFFFD052).w
		move.l	#$4AA40003,d0
		lea	(unk_FFFFE724).w,a1
		moveq	#$19,d1
		moveq	#8,d2
		jsr	sub_C2E(pc)
		move.w	#$2000,d0
		moveq	#$18,d1
		bsr.w	sub_5764
		moveq	#0,d0
		addq.w	#1,d1
		bsr.w	sub_5764
		moveq	#0,d0
		addq.w	#1,d1
		bsr.w	sub_5764
		rts
; End of function sub_5BEC


; =============== S U B	R O U T	I N E =======================================


sub_5C20:				; CODE XREF: sub_3B28+4p sub_3BAE+4p ...
		moveq	#$A,d1
		moveq	#0,d0
		bsr.w	sub_5764
		move.l	#$4AA40003,d0
		moveq	#$19,d1
		moveq	#8,d2
		move.w	#0,d3
		jsr	sub_CF2(pc)
		moveq	#6,d1
		bsr.w	sub_59DE
		clr.w	(word_FFFFD052).w
		tst.b	(byte_FFFFD003).w
		beq.s	locret_5C4E
		bsr.w	sub_5E88

locret_5C4E:				; CODE XREF: sub_5C20+28j
		rts
; End of function sub_5C20


; =============== S U B	R O U T	I N E =======================================


sub_5C50:				; CODE XREF: sub_3710+138p
					; sub_3E6A+58p	...
		move.l	#$4C2A0003,d0
		moveq	#0,d2
		move.w	(word_FFFFD040).w,d4
		move.w	(word_FFFFD100).w,d6
		lea	(unk_FFFFD102).w,a1
		bra.w	sub_5D22
; End of function sub_5C50


; =============== S U B	R O U T	I N E =======================================


sub_5C68:				; CODE XREF: sub_3710+1A6p
					; sub_3950:loc_39A6p ...
		move.l	#$4D2A0003,d0
		moveq	#0,d2
		move.w	(word_FFFFD042).w,d4
		move.w	(word_FFFFD168).w,d6
		lea	(unk_FFFFD16A).w,a1
		bra.w	sub_5D22
; End of function sub_5C68


; =============== S U B	R O U T	I N E =======================================


sub_5C80:
		move.w	d1,d4
		move.w	d2,d6
		moveq	#0,d2
		bra.w	sub_5D22
; End of function sub_5C80


; =============== S U B	R O U T	I N E =======================================


sub_5C8A:				; CODE XREF: sub_3040:loc_3092p
		btst	#2,(byte_FFFFD004).w
		beq.s	locret_5CF8
		btst	#4,(byte_FFFFD004).w
		bne.s	locret_5CF8
		move.l	#$46AA0003,d0
		move.w	(word_FFFFD03E).w,d1
		moveq	#0,d2
		move.w	(unk_FFFFD03C).w,d3
		lea	(unk_FFFFD1D2).w,a1
		cmp.w	(unk_FFFFD1D0).w,d3
		bcc.s	loc_5CB8
		bsr.w	sub_5D4C

loc_5CB8:				; CODE XREF: sub_5C8A+28j
		move.w	(word_FFFFD1CE).w,d3
		move.w	d3,(unk_FFFFD03C).w
		btst	#2,(byte_FFFFD008).w
		beq.s	locret_5CF8
		moveq	#0,d1
		move.w	d3,d1
		divu.w	#$A,d1
		subq.w	#1,d1
		bpl.s	loc_5CD6
		moveq	#0,d1

loc_5CD6:				; CODE XREF: sub_5C8A+48j
		cmp.w	(word_FFFFD03E).w,d1
		beq.s	loc_5CEA
		move.w	d1,(word_FFFFD03E).w
		movem.l	d1/d3/a1,-(sp)
		bsr.s	sub_5CFA
		movem.l	(sp)+,d1/d3/a1

loc_5CEA:				; CODE XREF: sub_5C8A+50j
		move.l	#$46AA0003,d0
		move.w	#$2000,d2
		bra.w	sub_5D4C
; ---------------------------------------------------------------------------

locret_5CF8:				; CODE XREF: sub_5C8A+6j sub_5C8A+Ej ...
		rts
; End of function sub_5C8A


; =============== S U B	R O U T	I N E =======================================


sub_5CFA:				; CODE XREF: sub_4400+8Cp
					; sub_4D9E:loc_4DD0p ...
		move.w	(unk_FFFFD1D0).w,d2
		beq.w	sub_5DB0
		move.l	#$46AA0003,d0
		move.w	(word_FFFFD03E).w,d1
		lea	(unk_FFFFD1D2).w,a1
		mulu.w	#$A,d1
		move.w	d1,d4
		move.w	d2,d6
		moveq	#0,d2
		bsr.s	sub_5D22
		addi.l	#$800000,d0
; End of function sub_5CFA


; =============== S U B	R O U T	I N E =======================================


sub_5D22:				; CODE XREF: sub_5C50+14j sub_5C68+14j ...
		move.l	d0,(VDP_CONTROL).l
		moveq	#9,d5

loc_5D2A:				; CODE XREF: sub_5D22+16j
		cmp.w	d4,d6
		ble.s	loc_5D3E
		move.b	(a1,d4.w),d1
		bsr.w	sub_5D82
		addq.w	#1,d4
		dbf	d5,loc_5D2A
		rts
; ---------------------------------------------------------------------------

loc_5D3E:				; CODE XREF: sub_5D22+Aj sub_5D22+24j
		move.l	(word_FFFFE172).w,(VDP_DATA).l
		dbf	d5,loc_5D3E
		rts
; End of function sub_5D22


; =============== S U B	R O U T	I N E =======================================


sub_5D4C:				; CODE XREF: sub_5C8A+2Ap sub_5C8A+6Aj
		mulu.w	#$A,d1
		move.w	d3,d4
		sub.w	d1,d4
		bmi.s	locret_5D80
		cmpi.b	#$14,d4
		bcc.s	locret_5D80
		swap	d0
		cmpi.b	#$A,d4
		bcs.s	loc_5D6C
		addi.w	#$80,d0	; '€'
		subi.w	#$A,d4

loc_5D6C:				; CODE XREF: sub_5D4C+16j
		add.w	d4,d4
		add.w	d4,d4
		add.w	d4,d0
		swap	d0
		move.l	d0,(VDP_CONTROL).l
		move.b	(a1,d3.w),d1
		bsr.s	sub_5D82

locret_5D80:				; CODE XREF: sub_5D4C+8j sub_5D4C+Ej
		rts
; End of function sub_5D4C


; =============== S U B	R O U T	I N E =======================================


sub_5D82:				; CODE XREF: sub_5D22+10p sub_5D4C+32p
		bsr.w	sub_55AC
		move.w	d1,d3
		lsr.w	#4,d3
		andi.w	#$F,d3
		bne.s	loc_5D94
		move.w	#$168B,d3

loc_5D94:				; CODE XREF: sub_5D82+Cj
		addi.w	#$5B2,d3
		add.w	d2,d3
		swap	d3
		move.w	d1,d3
		andi.w	#$F,d3
		addi.w	#$5A9,d3
		add.w	d2,d3
		move.l	d3,(VDP_DATA).l
		rts
; End of function sub_5D82


; =============== S U B	R O U T	I N E =======================================


sub_5DB0:				; CODE XREF: sub_45BE+38p sub_5CFA+4j
		clr.w	(word_FFFFD03E).w
		move.l	#$46AA0003,d0
		bsr.w	loc_5DC4
		move.l	#$472A0003,d0

loc_5DC4:				; CODE XREF: sub_5DB0+Ap
		lea	(word_FFFFE172).w,a1
		moveq	#$13,d1
		bra.w	writeToVram
; End of function sub_5DB0


; =============== S U B	R O U T	I N E =======================================


sub_5DCE:				; CODE XREF: sub_3950+46p
		subi.w	#9,d0
		bpl.s	locret_5DD6
		moveq	#0,d0

locret_5DD6:				; CODE XREF: sub_5DCE+4j
		rts
; End of function sub_5DCE


; =============== S U B	R O U T	I N E =======================================


sub_5DD8:				; CODE XREF: sub_31FE+5Ap
		moveq	#6,d1
		moveq	#0,d0
		bsr.w	sub_5764
		moveq	#7,d1
		moveq	#0,d0
		bra.w	sub_5764
; End of function sub_5DD8


; =============== S U B	R O U T	I N E =======================================


sub_5DE8:				; CODE XREF: sub_63D4+98p
		moveq	#3,d1
		bsr.w	sub_59DE
; End of function sub_5DE8


; =============== S U B	R O U T	I N E =======================================


sub_5DEE:				; CODE XREF: sub_59DE+38p
		move.b	(byte_FFFFD010).w,d1
		bsr.w	sub_55AC
		bra.w	sub_5480
; End of function sub_5DEE


; =============== S U B	R O U T	I N E =======================================


sub_5DFA:				; CODE XREF: sub_30C2+ACp
		move.l	#$54B80003,d0
		lea	(unk_FFFFE30C).w,a1
		moveq	#9,d1
		moveq	#$E,d2
		jsr	sub_C2E(pc)
		move.l	#$51380003,d0
		bsr.w	sub_5754
		move.w	#$2000,d0
		moveq	#3,d1
		bsr.w	sub_5764
		rts
; End of function sub_5DFA


; =============== S U B	R O U T	I N E =======================================


sub_5E22:				; CODE XREF: sub_4F9A+Ap
		bsr.w	sub_5E88
		move.l	#$42200003,d6
		bsr.w	loc_67E2
		move.l	#$43580003,d0
		bsr.w	sub_5754
		moveq	#0,d0
		moveq	#9,d1
		bsr.w	sub_5764
		moveq	#8,d1
		bsr.w	sub_5764
		moveq	#3,d1
		bsr.w	sub_59DE
		bsr.w	sub_5ED2
		rts
; End of function sub_5E22


; =============== S U B	R O U T	I N E =======================================


sub_5E54:				; CODE XREF: sub_4FB4+6p
		bsr.s	resetWindowVPos
		bsr.w	sub_5732
		move.l	#$42200003,d6
		bsr.w	sub_6816
		moveq	#6,d1
		bsr.w	sub_59DE
		rts
; End of function sub_5E54


; =============== S U B	R O U T	I N E =======================================


sub_5E6C:				; CODE XREF: sub_329A+238j
		bsr.w	sub_4218
		bls.s	loc_5E74
		bsr.s	resetWindowVPos

loc_5E74:				; CODE XREF: sub_3B28+3Ep sub_5E6C+4j
		move.l	#$51380003,d0
		lea	(unk_FFFFF5C6).w,a1
		moveq	#9,d1
		moveq	#$15,d2
		jsr	sub_C2E(pc)
		rts
; End of function sub_5E6C


; =============== S U B	R O U T	I N E =======================================


sub_5E88:				; CODE XREF: sub_5C20+2Ap sub_5E22p ...
		move.w	#$9282,(VDP_CONTROL).l
		move.w	#$9282,(vdpRegCache+$24).w
		rts
; End of function sub_5E88


; =============== S U B	R O U T	I N E =======================================


resetWindowVPos:			; CODE XREF: sub_5B82+5Ap sub_5E54p ...
		move.w	#$9200,(VDP_CONTROL).l
		move.w	#$9200,(vdpRegCache+$24).w
		rts
; End of function resetWindowVPos


; =============== S U B	R O U T	I N E =======================================


sub_5EA8:				; CODE XREF: sub_329A+23Cj
		move.l	#$11380003,d0
		lea	(unk_FFFFF5C6).w,a1
		moveq	#9,d1
		moveq	#$15,d2
		jsr	sub_6282(pc)
		move.l	#$51380003,d0
		moveq	#9,d1
		move.w	#$15,d2
		move.w	#0,d3
		jsr	sub_CF2(pc)
		bsr.s	sub_5E88
		rts
; End of function sub_5EA8


; =============== S U B	R O U T	I N E =======================================


sub_5ED2:				; CODE XREF: sub_329A:loc_34C8p
					; sub_5E22+2Cp
		lea	(VDP_DATA).l,a5
		move.l	#$42BA0003,4(a5)
		move.l	#$C6F9C6FA,(a5)
		move.l	#$42C40003,4(a5)
		move.l	#$C6F9C6FD,(a5)
		move.l	#$42CC0003,4(a5)
		move.w	#$C6FE,(a5)
		move.l	#$42D40003,4(a5)
		move.l	#$C6FBC6FC,(a5)
		rts
; End of function sub_5ED2


; =============== S U B	R O U T	I N E =======================================


sub_5F10:				; CODE XREF: sub_329A+228p
		lea	(VDP_DATA).l,a5
		move.l	#$42BA0003,4(a5)
		move.w	#$C001,d0
		moveq	#$13,d1

loc_5F24:				; CODE XREF: sub_5F10+16j
		move.w	d0,(a5)
		dbf	d1,loc_5F24
		rts
; End of function sub_5F10


; =============== S U B	R O U T	I N E =======================================


sub_5F2C:				; CODE XREF: sub_30C2+4Ap
		clr.l	(dword_FFFFD062).w
		clr.l	(dword_FFFFD066).w
		rts
; End of function sub_5F2C


; =============== S U B	R O U T	I N E =======================================


sub_5F36:				; CODE XREF: sub_3040+34p sub_5AEC+2Cp
		lea	(VDP_DATA).l,a5
		move.l	#$492C0003,4(a5)
		move.w	(dword_FFFFD032).w,d0
		lea	(unk_FFFFEAAE).w,a1
		lea	(unk_FFFFD044).w,a2
		bsr.s	loc_5F66
		move.l	#$482C0003,4(a5)
		move.w	(dword_FFFFD032+2).w,d0
		lea	(unk_FFFFEAAE).w,a1
		lea	(unk_FFFFD048).w,a2

loc_5F66:				; CODE XREF: sub_5F36+1Ap
		move.b	2(a2),3(a2)
		move.b	1(a2),2(a2)
		move.b	(a2),1(a2)
		move.b	d0,(a2)+
		add.b	(a2)+,d0
		add.b	(a2)+,d0
		add.b	(a2)+,d0
		lsr.b	#2,d0
		lea	$20(a1),a1
		moveq	#$F,d1
		sub.w	d0,d1
		subq.w	#1,d0
		bmi.s	loc_5F92

loc_5F8C:				; CODE XREF: sub_5F36+58j
		move.w	(a1)+,(a5)
		dbf	d0,loc_5F8C

loc_5F92:				; CODE XREF: sub_5F36+54j
		tst.w	d1
		bmi.s	locret_5FA0
		lea	-$20(a1),a1

loc_5F9A:				; CODE XREF: sub_5F36+66j
		move.w	(a1)+,(a5)
		dbf	d1,loc_5F9A

locret_5FA0:				; CODE XREF: sub_5F36+5Ej
		rts
; End of function sub_5F36


; =============== S U B	R O U T	I N E =======================================


sub_5FA2:				; CODE XREF: sub_30C2+7Ap
		bsr.w	sub_5FBE
		lea	(unk_FFFFED06).w,a1
		move.l	#$70000003,d0
		moveq	#$27,d1	; '''
		moveq	#$1B,d2
		jsr	sub_C2E(pc)
		bsr.w	sub_5AEC
		rts
; End of function sub_5FA2


; =============== S U B	R O U T	I N E =======================================


sub_5FBE:				; CODE XREF: sub_5FA2p
		lea	off_602C(pc),a0
		movea.l	(a0)+,a1
		jsr	loadPalettesToBuffer(pc)
		bsr.s	sub_6018
		bsr.s	sub_6018

loc_5FCC:				; CODE XREF: sub_5FBE+1Cj
		move.l	(a0)+,d0
		beq.s	loc_5FDC
		movea.l	(a0)+,a1
		move.l	(a0)+,d1
		move.w	(a0)+,d2
		jsr	loc_195E(pc)
		bra.s	loc_5FCC
; ---------------------------------------------------------------------------

loc_5FDC:				; CODE XREF: sub_5FBE+10j
		movea.w	(a0)+,a2

loc_5FDE:				; CODE XREF: sub_5FBE+2Aj
		move.w	(a0)+,d0
		beq.s	loc_5FEA
		movea.l	(a0)+,a1
		jsr	EniDec(pc)
		bra.s	loc_5FDE
; ---------------------------------------------------------------------------

loc_5FEA:				; CODE XREF: sub_5FBE+22j
		move.l	#$70600003,d0
		move.l	#$11188188,d1
		moveq	#$19,d7
		lea	(word_15108).l,a1

loc_5FFE:				; CODE XREF: sub_5FBE+48j
		bsr.s	sub_6010
		addi.l	#$800000,d0
		dbf	d7,loc_5FFE
		lea	(word_15070).l,a1
; End of function sub_5FBE


; =============== S U B	R O U T	I N E =======================================


sub_6010:				; CODE XREF: sub_5FBE:loc_5FFEp
		moveq	#1,d2
		jsr	loc_195E(pc)
		rts
; End of function sub_6010


; =============== S U B	R O U T	I N E =======================================


sub_6018:				; CODE XREF: sub_5FBE+Ap sub_5FBE+Cp
		move.l	(a0)+,(VDP_CONTROL).l

loc_601E:				; CODE XREF: sub_6018+10j
		move.l	(a0)+,d0
		beq.s	locret_602A
		movea.l	d0,a1
		jsr	NemDec(pc)
		bra.s	loc_601E
; ---------------------------------------------------------------------------

locret_602A:				; CODE XREF: sub_6018+8j
		rts
; End of function sub_6018

; ---------------------------------------------------------------------------
off_602C:	dc.l byte_60AE		; DATA XREF: sub_5FBEo
		dc.l $44200002
		dc.l $10890
		dc.b   0
		dc.b   1
		dc.b $26 ; &
		dc.b $26 ; &
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $7D ; }
		dc.b $E0 ; à
		dc.b   0
		dc.b   3
		dc.b   0
		dc.b   1
		dc.b   8
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $5D ; ]
		dc.b $E0 ; à
		dc.b   0
		dc.b   3
		dc.b   0
		dc.b   1
		dc.b $26 ; &
		dc.b $74 ; t
		dc.b $11
		dc.b $18
		dc.b $81 ; 
		dc.b $88 ; ˆ
		dc.b   0
		dc.b $11
		dc.b $7E ; ~
		dc.b $A0 ;  
		dc.b   0
		dc.b   3
		dc.b   0
		dc.b   1
		dc.b $2B ; +
		dc.b $E0 ; à
		dc.b   0
		dc.b  $B
		dc.b $B0 ; °
		dc.b $BB ; »
		dc.b   0
		dc.b   3
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $E0 ; à
		dc.b   0
		dc.b $84 ; „
		dc.b $21 ; !
		dc.b   0
		dc.b   1
		dc.b $27 ; '
		dc.b   4
		dc.b $84 ; „
		dc.b $21 ; !
		dc.b   0
		dc.b   1
		dc.b $27 ; '
		dc.b $B0 ; °
		dc.b $84 ; „
		dc.b $21 ; !
		dc.b   0
		dc.b   1
		dc.b $28 ; (
		dc.b $62 ; b
		dc.b $84 ; „
		dc.b $21 ; !
		dc.b   0
		dc.b   1
		dc.b $29 ; )
		dc.b $C2 ; Â
		dc.b $84 ; „
		dc.b $21 ; !
		dc.b   0
		dc.b   1
		dc.b $2A ; *
		dc.b  $E
		dc.b $84 ; „
		dc.b $21 ; !
		dc.b   0
		dc.b   1
		dc.b $2A ; *
		dc.b $78 ; x
		dc.b $84 ; „
		dc.b $21 ; !
		dc.b   0
		dc.b   1
		dc.b $2A ; *
		dc.b $86 ; †
		dc.b $84 ; „
		dc.b $21 ; !
		dc.b   0
		dc.b   1
		dc.b $2A ; *
		dc.b $9E ; ž
		dc.b $84 ; „
		dc.b $21 ; !
		dc.b   0
		dc.b   1
		dc.b $2A ; *
		dc.b $B4 ; ´
		dc.b $46 ; F
		dc.b   9
		dc.b   0
		dc.b   1
		dc.b $2B ; +
		dc.b $6C ; l
		dc.b   0
		dc.b   0
		dc.b $4E ; N
		dc.b $75 ; u
byte_60AE:	dc.b 0			; DATA XREF: ROM:off_602Co
		dc.b $3F
		dc.w $E88
		dc.w 0
		dc.w $222
		dc.w $444
		dc.w $666
		dc.w $888
		dc.w $AAA
		dc.w $CCC
		dc.w $EEE
		dc.w $ECA
		dc.w $E66
		dc.w $EC
		dc.w $666
		dc.w $2EA
		dc.w $4A4
		dc.w $E
		dc.w $E88
		dc.w 0
		dc.w $222
		dc.w $444
		dc.w $64
		dc.w $86
		dc.w $CA
		dc.w $EC
		dc.w $EE
		dc.w $EC
		dc.w $E00
		dc.w $EC
		dc.w $6EC
		dc.w $EEE
		dc.w $4A4
		dc.w $E
		dc.w $E88
		dc.w 0
		dc.w $222
		dc.w $444
		dc.w $460
		dc.w $680
		dc.w $8A0
		dc.w $AC0
		dc.w $EE0
		dc.w $CC0
		dc.w $AE0
		dc.w $44
		dc.w $EE0
		dc.w 0
		dc.w $AA
		dc.w $EE
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0

; =============== S U B	R O U T	I N E =======================================


sub_6130:				; CODE XREF: sub_3040+40p
		lea	(unk_FFFFD05E).w,a0
		btst	#0,(a0)
		bne.s	loc_6184
		btst	#2,(a0)
		bne.s	loc_6160
		tst.b	(byte_FFFFD003).w
		beq.w	locret_61DE
		bset	#2,(a0)
		move.b	#$B4,(unk_FFFFD05F).w
		move.l	#$5A040003,d0
		lea	asc_6214(pc),a1	; "  PRESS THE B BUTTON	TO"
		bra.w	loc_6248
; ---------------------------------------------------------------------------

loc_6160:				; CODE XREF: sub_6130+Ej
		subq.b	#1,1(a0)
		beq.s	loc_6174
		tst.b	(byte_FFFFD003).w
		beq.s	loc_6174
		btst	#0,(byte_FFFFD004).w
		beq.s	locret_61DE

loc_6174:				; CODE XREF: sub_6130+34j sub_6130+3Aj
		bset	#0,(a0)
		bclr	#2,(a0)
		move.l	#$5A040003,d0
		bra.s	loc_61D2
; ---------------------------------------------------------------------------

loc_6184:				; CODE XREF: sub_6130+8j
		btst	#1,(a0)
		bne.s	locret_61DE
		btst	#3,(a0)
		bne.s	loc_61B6
		tst.b	(byte_FFFFD003).w
		beq.s	locret_61DE
		btst	#0,(byte_FFFFD004).w
		beq.s	locret_61DE
		bset	#3,(a0)
		move.b	#$B4,(unk_FFFFD05F).w
		move.l	#$52840003,d0
		lea	asc_61E0(pc),a1	; "  PRESS THE B BUTTON	TO"
		bra.w	loc_6248
; ---------------------------------------------------------------------------

loc_61B6:				; CODE XREF: sub_6130+5Ej
		subq.b	#1,1(a0)
		beq.s	loc_61C4
		btst	#0,(byte_FFFFD004).w
		bne.s	locret_61DE

loc_61C4:				; CODE XREF: sub_6130+8Aj
		bset	#1,(a0)
		bclr	#3,(a0)
		move.l	#$52840003,d0

loc_61D2:				; CODE XREF: sub_6130+52j
		moveq	#$19,d1
		moveq	#2,d2
		move.w	#$8000,d3
		jsr	sub_CF2(pc)

locret_61DE:				; CODE XREF: sub_6130+14j sub_6130+42j ...
		rts
; ---------------------------------------------------------------------------
asc_61E0:	dc.b '  PRESS THE B BUTTON TO',0,0 ; DATA XREF: sub_6130+7Eo
		dc.b 'DISPLAY THE CONTROL PANEL['
		dc.b $FF
asc_6214:	dc.b '  PRESS THE B BUTTON TO',0,0 ; DATA XREF: sub_6130+28o
		dc.b 'REMOVE THE CONTROL PANEL['
		dc.b $FF
		dc.b   0
; ---------------------------------------------------------------------------

loc_6248:				; CODE XREF: sub_6130+2Cj sub_6130+82j
		lea	(VDP_DATA).l,a5
		move.w	#$783,d1

loc_6252:				; CODE XREF: sub_6130+14Ej
		move.l	d0,4(a5)

loc_6256:				; CODE XREF: sub_6130+144j
		moveq	#0,d2
		move.b	(a1)+,d2
		bmi.s	locret_6280
		beq.s	loc_6276
		cmpi.w	#$20,d2	; ' '
		bne.s	loc_6268
		moveq	#0,d2
		bra.s	loc_6272
; ---------------------------------------------------------------------------

loc_6268:				; CODE XREF: sub_6130+132j
		subi.w	#$41,d2	; 'A'
		add.w	d2,d2
		add.w	d2,d2
		add.w	d1,d2

loc_6272:				; CODE XREF: sub_6130+136j
		move.w	d2,(a5)
		bra.s	loc_6256
; ---------------------------------------------------------------------------

loc_6276:				; CODE XREF: sub_6130+12Cj
		swap	d0
		add.w	(vdpLineIncrement).w,d0
		swap	d0
		bra.s	loc_6252
; ---------------------------------------------------------------------------

locret_6280:				; CODE XREF: sub_6130+12Aj
		rts
; End of function sub_6130


; =============== S U B	R O U T	I N E =======================================


sub_6282:				; CODE XREF: sub_5EA8+Ep
		lea	(VDP_DATA).l,a5

loc_6288:				; CODE XREF: sub_6282+26j
		move.l	d0,4(a5)
		move.w	d1,d3

loc_628E:				; CODE XREF: sub_6282+Ej
		move.w	(a5),(a1)+
		dbf	d3,loc_628E
		nop
		movem.l	d6-d7,-(sp)
		clr.l	d7
		move.w	(vdpLineIncrement).w,d7
		swap	d7
		add.l	d7,d0
		movem.l	(sp)+,d6-d7
		dbf	d2,loc_6288
		rts
; End of function sub_6282


; =============== S U B	R O U T	I N E =======================================


sub_62AE:				; CODE XREF: sub_57CE+34p
		sub.w	d1,d0
		sub.w	d1,d0
		subq.w	#2,d0

loc_62B4:				; CODE XREF: sub_62AE+14j
		move.w	d1,d5

loc_62B6:				; CODE XREF: sub_62AE+Ej
		move.w	(a1)+,d4
		or.w	d3,d4
		move.w	d4,(a2)+
		dbf	d5,loc_62B6
		adda.w	d0,a2
		dbf	d2,loc_62B4
		rts
; End of function sub_62AE


; =============== S U B	R O U T	I N E =======================================


sub_62C8:				; CODE XREF: sub_30C2+4Ep sub_62C8+8j
		btst	#GA_MEM_MODE_MODE,(GA_MEM_MODE).l
		beq.s	sub_62C8

loc_62D2:				; CODE XREF: sub_62C8+12j
		btst	#GA_MEM_MODE_RET,(GA_MEM_MODE).l
		bne.s	loc_62D2
		clr.w	(word_200400).l
		rts
; End of function sub_62C8


; =============== S U B	R O U T	I N E =======================================


sub_62E4:				; CODE XREF: sub_3040+Cp sub_62E4+8j
		btst	#GA_MEM_MODE_RET,(GA_MEM_MODE).l
		bne.s	sub_62E4
		move	sr,-(sp)
		m_disableInterrupts
		lea	(WordRAM_Bank0).l,a1
		move.w	$400(a1),(word_FFFFD020).w
		move.w	$402(a1),(word_FFFFD022).w
		move.w	$404(a1),(word_FFFFD024).w
		move.w	$424(a1),(word_FFFFD026).w
		move.l	$408(a1),(dword_FFFFD028).w
		move.l	$40C(a1),(dword_FFFFD02C).w
		move.b	$410(a1),(byte_FFFFD030).w
		move.l	$426(a1),(dword_FFFFD032).w
		move.w	$42A(a1),(word_FFFFD036).w
		move.b	$440(a1),(byte_FFFFD050).w
		move.w	$564(a1),d0
		bsr.w	sub_53B6
		move	(sp)+,sr
		rts
; End of function sub_62E4


; =============== S U B	R O U T	I N E =======================================


sub_6342:				; CODE XREF: sub_3040+56p sub_30C2+52p ...
		btst	#GA_MEM_MODE_RET,(GA_MEM_MODE).l
		bne.s	sub_6342
		move	sr,-(sp)
		m_disableInterrupts
		lea	(WordRAM_Bank0).l,a1
		move.w	(word_FFFFD020).w,$400(a1)
		move.w	(byte_FFFFD008).w,$42C(a1)
		move.l	(byte_FFFFD00E).w,$42E(a1)
		move.w	(word_FFFFD012).w,$432(a1)
		move.l	(dword_FFFFD014).w,$434(a1)
		move.l	(dword_FFFFD018).w,$438(a1)
		move.l	(dword_FFFFD01C).w,$43C(a1)
		lea	$4FE(a1),a1
		lea	(word_FFFFD168).w,a2
		moveq	#$33,d0	; '3'

loc_638C:				; CODE XREF: sub_6342+4Cj
		move.l	(a2)+,(a1)+
		dbf	d0,loc_638C
		move	(sp)+,sr
		rts
; End of function sub_6342


; =============== S U B	R O U T	I N E =======================================


sub_6396:				; CODE XREF: sub_4400+C6p
		lea	(WordRAM_Bank0).l,a1
		lea	(dword_FFFFD700).w,a2
		move.w	#$95,d0	; '•'

loc_63A4:				; CODE XREF: sub_6396+10j
		move.l	(a1)+,(a2)+
		dbf	d0,loc_63A4
		rts
; End of function sub_6396


; =============== S U B	R O U T	I N E =======================================


sub_63AC:				; CODE XREF: sub_30C2+A8p
		clr.b	(byte_FFFFD003).w
		move.l	#$40200000,(VDP_CONTROL).l
		moveq	#7,d0

loc_63BC:				; CODE XREF: sub_63AC+1Aj
		move.l	#$FFFFFFFF,(VDP_DATA).l
		dbf	d0,loc_63BC
		bsr.w	sub_67DC
		bsr.w	sub_681C
		rts
; End of function sub_63AC


; =============== S U B	R O U T	I N E =======================================


sub_63D4:				; CODE XREF: sub_31FE+Ej sub_63D4+8j
		btst	#GA_MEM_MODE_RET,(GA_MEM_MODE).l
		beq.s	sub_63D4
		jsr	displayOff(pc)
		move.w	#$9001,(VDP_CONTROL).l
		move.w	#$9001,(vdpRegCache+$20).w
		move.w	#$8730,(VDP_CONTROL).l
		move.w	#$8730,(vdpRegCache+$E).w
		move.l	#$40000010,(VDP_CONTROL).l
		move.w	#$20,(VDP_DATA).l ; ' '
		lea	(VDP_CONTROL).l,a4
		move.w	(vdpRegCache+2).w,d4
		bset	#4,d4
		move.w	d4,(a4)
		m_z80RequestBus
		move.w	#$9501,d0
		move.l	#$97119600,d1
		move.w	#$4060,d2
		move.w	#$80,d3	; '€'
		lea	(WordRAM_Bank1).l,a1
		moveq	#$26,d6	; '&'

loc_6442:				; CODE XREF: sub_63D4:loc_6458j
		bsr.w	sub_67B6
		lea	$400(a1),a1
		addq.w	#2,d1
		addi.w	#$360,d2
		bpl.s	loc_6458
		subi.w	#$4000,d2
		addq.w	#1,d3

loc_6458:				; CODE XREF: sub_63D4+7Cj
		dbf	d6,loc_6442
		m_z80ReleaseBus
		bsr.w	sub_6618
		st	(byte_FFFFD061).w
		bsr.w	sub_5DE8
		jsr	displayOn(pc)
		rts
; End of function sub_63D4


; =============== S U B	R O U T	I N E =======================================


sub_6476:				; CODE XREF: sub_6476+8j
		btst	#GA_MEM_MODE_RET,(GA_MEM_MODE).l
		beq.s	sub_6476
		lea	(unk_20E0FC).l,a0
		move.b	(byte_FFFFD010).w,-$78(a0)
		lea	(VDP_CONTROL).l,a4
		lea	-4(a4),a3
		tst.b	(byte_FFFFD061).w
		beq.s	loc_64BC
		move.l	#$44020002,(VDP_CONTROL).l
		move.w	(word_20E080).l,(a3)
		move.l	#$40020010,(VDP_CONTROL).l
		move.w	(word_20E082).l,(a3)

loc_64BC:				; CODE XREF: sub_6476+24j
		bset	#4,(vdpRegCache+3).w
		move.w	(vdpRegCache+2).w,(a4)
		m_z80RequestBus
		moveq	#0,d7

loc_64D0:				; CODE XREF: sub_6476+9Aj
		move.w	2(a0),d6
		cmp.w	(a0),d6
		beq.s	loc_6512
		addq.w	#8,2(a0)
		andi.w	#$7F8,2(a0)
		lea	loc_654C(pc),a6
		tst.b	(byte_FFFFD061).w
		bne.s	loc_64F0
		lea	sub_6572(pc),a6

loc_64F0:				; CODE XREF: sub_6476+74j
		bsr.s	sub_6534
		btst	#1,(GA_COMM_MAINFLAGS).l
		beq.s	loc_6512
		move.w	#$7D0,d6
		btst	#6,(MD_VERSION).l
		beq.s	loc_650E
		move.w	#$1770,d6

loc_650E:				; CODE XREF: sub_6476+92j
		cmp.w	d0,d7
		bls.s	loc_64D0

loc_6512:				; CODE XREF: sub_6476+60j sub_6476+84j
		tst.b	(byte_FFFFD061).w
		beq.s	loc_6520
		bclr	#1,(GA_COMM_MAINFLAGS).l

loc_6520:				; CODE XREF: sub_6476+A0j
		m_z80ReleaseBus
		bclr	#4,(vdpRegCache+3).w
		move.w	(vdpRegCache+2).w,(a4)
		rts
; End of function sub_6476


; =============== S U B	R O U T	I N E =======================================


sub_6534:				; CODE XREF: sub_6476:loc_64F0p
		moveq	#0,d0
		move.w	6(a0,d6.w),d0
		move.l	8(a0,d6.w),d1
		move.w	4(a0,d6.w),d6
		cmpi.w	#$20,d6	; ' '
		bhi.s	locret_6570
		jmp	(a6,d6.w)
; ---------------------------------------------------------------------------

loc_654C:				; DATA XREF: sub_6476+6Co
		bra.w	locret_6570
; ---------------------------------------------------------------------------
		bra.w	loc_6598
; ---------------------------------------------------------------------------
		bra.w	sub_65FC
; ---------------------------------------------------------------------------
		bra.w	sub_66E8
; ---------------------------------------------------------------------------
		bra.w	sub_671A
; ---------------------------------------------------------------------------
		bra.w	sub_676C
; ---------------------------------------------------------------------------
		bra.w	sub_6618
; ---------------------------------------------------------------------------
		bra.w	sub_6640
; ---------------------------------------------------------------------------
		bra.w	sub_669E
; ---------------------------------------------------------------------------

locret_6570:				; CODE XREF: sub_6534+12j
					; sub_6534:loc_654Cj
		rts
; End of function sub_6534


; =============== S U B	R O U T	I N E =======================================


sub_6572:				; DATA XREF: sub_6476+76o
		bra.w	locret_6596
; ---------------------------------------------------------------------------
		bra.w	loc_6598
; ---------------------------------------------------------------------------
		bra.w	sub_65FC
; ---------------------------------------------------------------------------
		bra.w	locret_6596
; ---------------------------------------------------------------------------
		bra.w	locret_6596
; ---------------------------------------------------------------------------
		bra.w	locret_6596
; ---------------------------------------------------------------------------
		bra.w	locret_6596
; ---------------------------------------------------------------------------
		bra.w	sub_6640
; ---------------------------------------------------------------------------
		bra.w	sub_669E
; ---------------------------------------------------------------------------

locret_6596:				; CODE XREF: sub_6572j	sub_6572+Cj ...
		rts
; End of function sub_6572

; ---------------------------------------------------------------------------

loc_6598:				; CODE XREF: sub_6534+1Cj sub_6572+4j
		btst	#3,d0
		beq.s	sub_65BA
		bclr	#7,(byte_FFFFD004).w
		beq.s	locret_65FA
		bclr	#1,(GA_COMM_MAINFLAGS).l
		addi.w	#$1771,d7
		bsr.w	sub_681C
		jmp	displayOn(pc)

; =============== S U B	R O U T	I N E =======================================


sub_65BA:				; CODE XREF: ROM:0000659Cj
		bset	#7,(byte_FFFFD004).w
		bne.s	locret_65FA
		tst.b	(byte_FFFFD061).w
		beq.s	locret_65FA
		bclr	#1,(GA_COMM_MAINFLAGS).l
		addi.w	#$1771,d7
		jsr	displayOff(pc)
		move.w	#$8F01,(a4)
		move.l	#$9483939F,(a4)
		move.w	#$9780,(a4)
		move.l	#$40600080,(a4)
		move.b	d1,(a3)

loc_65EE:				; CODE XREF: sub_65BA+3Aj
		move.w	(a4),d4
		btst	#1,d4
		bne.s	loc_65EE
		move.w	#$8F02,(a4)

locret_65FA:				; CODE XREF: ROM:000065A4j sub_65BA+6j ...
		rts
; End of function sub_65BA


; =============== S U B	R O U T	I N E =======================================


sub_65FC:				; CODE XREF: sub_6534+20j sub_6572+8j
		andi.w	#$F,d1
		add.w	d1,d1
		move.w	d1,(word_FFFFD04C).w
		lea	($FFFFFB80).w,a1
		move.w	$60(a1,d1.w),$5E(a1)
		bset	#0,(vdpUpdateFlags).w
		rts
; End of function sub_65FC


; =============== S U B	R O U T	I N E =======================================


sub_6618:				; CODE XREF: sub_63D4+90p sub_6534+30j
		lea	(paletteBuffer3).w,a2
		lea	(unk_20E002).l,a1
		moveq	#7,d0

loc_6624:				; CODE XREF: sub_6618+Ej
		move.l	(a1)+,(a2)+
		dbf	d0,loc_6624
		move.w	(word_FFFFD04C).w,d1
		lea	($FFFFFB80).w,a1
		move.w	$60(a1,d1.w),$5E(a1)
		bset	#0,(vdpUpdateFlags).w
		rts
; End of function sub_6618


; =============== S U B	R O U T	I N E =======================================


sub_6640:				; CODE XREF: sub_6534+34j sub_6572+1Cj
		bsr.s	sub_6684
		move.w	#$8F80,(VDP_CONTROL).l
		move.w	#$8F80,(vdpRegCache+$1E).w
		moveq	#$1A,d6
		move.l	d4,(a4)

loc_6654:				; CODE XREF: sub_6640:loc_666Cj
		move.w	d0,(a3)
		addq.w	#1,d0
		dbf	d3,loc_6660
		subi.w	#$1B,d0

loc_6660:				; CODE XREF: sub_6640+18j
		dbf	d2,loc_666C
		andi.l	#$707E0003,d4
		move.l	d4,(a4)

loc_666C:				; CODE XREF: sub_6640:loc_6660j
		dbf	d6,loc_6654
		move.w	#$8F02,(VDP_CONTROL).l
		move.w	#$8F02,(vdpRegCache+$1E).w
		addi.w	#$B4,d7	; '´'
		rts
; End of function sub_6640


; =============== S U B	R O U T	I N E =======================================


sub_6684:				; CODE XREF: sub_6640p	sub_669E+4p
		move.w	d1,d2
		move.w	d1,d3
		lsr.w	#8,d2
		andi.w	#$FF,d2
		andi.w	#$FF,d3
		move.l	#$60000003,d4
		clr.w	d1
		add.l	d1,d4
		rts
; End of function sub_6684


; =============== S U B	R O U T	I N E =======================================


sub_669E:				; CODE XREF: sub_6534+38j sub_6572+20j
		addi.w	#$1A7,d7
		bsr.s	sub_6684
		movem.l	d0-d4,-(sp)
		bsr.s	sub_66C4
		movem.l	(sp)+,d0-d4
		addi.l	#$800000,d4
		cmpi.l	#$70000003,d4
		bcs.s	loc_66C2
		subi.l	#$10000000,d4

loc_66C2:				; CODE XREF: sub_669E+1Cj
		addq.w	#1,d0
; End of function sub_669E


; =============== S U B	R O U T	I N E =======================================


sub_66C4:				; CODE XREF: sub_669E+Ap
		moveq	#$26,d6	; '&'
		move.l	d4,(a4)

loc_66C8:				; CODE XREF: sub_66C4:loc_66E2j
		move.w	d0,(a3)
		addi.w	#$1B,d0
		dbf	d3,loc_66D6
		subi.w	#$41D,d0

loc_66D6:				; CODE XREF: sub_66C4+Aj
		dbf	d2,loc_66E2
		andi.l	#$7F800003,d4
		move.l	d4,(a4)

loc_66E2:				; CODE XREF: sub_66C4:loc_66D6j
		dbf	d6,loc_66C8
		rts
; End of function sub_66C4


; =============== S U B	R O U T	I N E =======================================


sub_66E8:				; CODE XREF: sub_6534+24j
		move.w	d0,d2
		andi.w	#$FFFE,d0
		lea	(WordRAM_Bank1).l,a1
		adda.l	d0,a1
		bsr.w	sub_6796
		lsr.w	#1,d2
		bcc.s	locret_6718
		lea	$3D0(a1),a1
		addi.l	#$3600000,d1
		bpl.w	sub_6796
		subi.l	#$40000000,d1
		addq.w	#1,d1
		bsr.w	sub_6796

locret_6718:				; CODE XREF: sub_66E8+14j
		rts
; End of function sub_66E8


; =============== S U B	R O U T	I N E =======================================


sub_671A:				; CODE XREF: sub_6534+28j
		move.w	d0,d6
		move.w	d1,d3
		ori.w	#$80,d3	; '€'
		swap	d1
		move.w	d1,d2
		addq.w	#2,d0
		lea	(WordRAM_Bank1).l,a1
		andi.w	#$FFFE,d0
		adda.l	d0,a1
		lsr.w	#1,d0
		move.l	#$97110000,d1
		move.w	d0,d1
		lsr.w	#8,d1
		ori.w	#$9600,d1
		andi.w	#$FF,d0
		ori.w	#$9500,d0
		bsr.w	sub_67B6
		lsr.w	#1,d6
		bcc.s	locret_676A
		addq.w	#2,d1
		lea	$400(a1),a1
		addi.w	#$360,d2
		bpl.s	loc_6766
		subi.w	#$4000,d2
		addq.w	#1,d3

loc_6766:				; CODE XREF: sub_671A+44j
		bsr.w	sub_67B6

locret_676A:				; CODE XREF: sub_671A+38j
		rts
; End of function sub_671A


; =============== S U B	R O U T	I N E =======================================


sub_676C:				; CODE XREF: sub_6534+2Cj
		andi.w	#$FFFE,d0
		lea	(WordRAM_Bank1).l,a1
		adda.l	d0,a1
		moveq	#$26,d3	; '&'

loc_677A:				; CODE XREF: sub_676C:loc_6790j
		bsr.s	sub_6796
		lea	$3D0(a1),a1
		addi.l	#$3600000,d1
		bpl.s	loc_6790
		subi.l	#$40000000,d1
		addq.w	#1,d1

loc_6790:				; CODE XREF: sub_676C+1Aj
		dbf	d3,loc_677A
		rts
; End of function sub_676C


; =============== S U B	R O U T	I N E =======================================


sub_6796:				; CODE XREF: sub_66E8+Ep sub_66E8+20j	...
		move.l	d1,(a4)
		move.l	(a1)+,(a3)
		move.l	(a1)+,(a3)
		move.l	(a1)+,(a3)
		move.l	(a1)+,(a3)
		move.l	(a1)+,(a3)
		move.l	(a1)+,(a3)
		move.l	(a1)+,(a3)
		move.l	(a1)+,(a3)
		move.l	(a1)+,(a3)
		move.l	(a1)+,(a3)
		move.l	(a1)+,(a3)
		move.l	(a1)+,(a3)
		addi.w	#$28,d7	; '('
		rts
; End of function sub_6796


; =============== S U B	R O U T	I N E =======================================


sub_67B6:				; CODE XREF: sub_63D4:loc_6442p
					; sub_671A+32p	...
		move.l	#$940193B0,(a4)
		move.w	d0,(a4)
		move.l	d1,(a4)
		move.w	d2,(a4)
		move.w	d3,-(sp)
		move.w	(sp)+,(a4)
		move.w	d2,(a4)
		andi.w	#$FF7F,d3
		move.w	d3,(a4)
		ori.w	#$80,d3	; '€'
		move.l	(a1),-4(a4)
		addi.w	#$FA,d7	; 'ú'
		rts
; End of function sub_67B6


; =============== S U B	R O U T	I N E =======================================


sub_67DC:				; CODE XREF: sub_63AC+1Ep
		move.l	#$50000003,d6

loc_67E2:				; CODE XREF: sub_5E22+Ap
		move.w	#$C001,d3

loc_67E6:				; CODE XREF: sub_6816+4j
		move.l	d6,d0
		bsr.s	sub_680E
		move.l	d6,d0
		addi.l	#$D000000,d0
		bsr.s	sub_680E
		move.l	d6,d0
		addi.l	#$1000000,d0
		bsr.s	sub_6806
		move.l	d6,d0
		addi.l	#$14C0000,d0
; End of function sub_67DC


; =============== S U B	R O U T	I N E =======================================


sub_6806:				; CODE XREF: sub_67DC+20p
		moveq	#1,d1
		moveq	#$17,d2
		bra.w	sub_CF2
; End of function sub_6806


; =============== S U B	R O U T	I N E =======================================


sub_680E:				; CODE XREF: sub_67DC+Cp sub_67DC+16p
		moveq	#$27,d1	; '''
		moveq	#1,d2
		bra.w	sub_CF2
; End of function sub_680E


; =============== S U B	R O U T	I N E =======================================


sub_6816:				; CODE XREF: sub_31FE+56p sub_5E54+Cp
		move.w	#$8000,d3
		bra.s	loc_67E6
; End of function sub_6816


; =============== S U B	R O U T	I N E =======================================


sub_681C:				; CODE XREF: sub_63AC+22p
					; ROM:000065B2p
		movem.l	d4-d6/a5,-(sp)
		move.l	#$60000003,d0
		moveq	#$26,d1	; '&'
		moveq	#$1A,d2
		move.w	#$6003,d3
		jsr	sub_199C(pc)
		movem.l	(sp)+,d4-d6/a5
		rts
; End of function sub_681C


; =============== S U B	R O U T	I N E =======================================


loadPrgFromWordRam:			; CODE XREF: ROM:000005E2j
		lea	(sub_68A6).l,a1
		jsr	setVblankHandler
		andi	#$F8FF,sr
		lea	($FFFF0000).l,a0
		move.w	#$3EBF,d0
		moveq	#0,d1

loc_6852:				; CODE XREF: loadPrgFromWordRam+1Cj
		move.l	d1,(a0)+
		dbf	d0,loc_6852
		bsr.w	clearCommRegisters
		jsr	sub_16E6
		move.w	#$258,d7

loc_6864:				; CODE XREF: loadPrgFromWordRam+36j
		bsr.w	waitForVblank
		bsr.w	sub_16FE
		bcc.s	loc_687A
		dbf	d7,loc_6864
		movea.l	(InitialSSP).w,sp
		bra.w	_start
; ---------------------------------------------------------------------------

loc_687A:				; CODE XREF: loadPrgFromWordRam+34j
		move.w	#$1FFF,d0
		lea	($FFFF0000).l,a1
		lea	(WordRAM_Bank0).l,a0

loc_688A:				; CODE XREF: loadPrgFromWordRam+54j
		move.l	(a0)+,(a1)+
		dbf	d0,loc_688A
		moveq	#$FFFFFFFF,d1
		bsr.w	sub_183A
		lea	(sub_68AE).l,a1
		jsr	setVblankHandler
		moveq	#$14,d0
		jmp	setNextState
; End of function loadPrgFromWordRam


; =============== S U B	R O U T	I N E =======================================


sub_68A6:				; DATA XREF: loadPrgFromWordRamo
		bsr.s	sendInt2ToSubCpu
		clr.b	(vblankCode).w
		rte
; End of function sub_68A6


; =============== S U B	R O U T	I N E =======================================


sub_68AE:				; DATA XREF: loadPrgFromWordRam+5Eo
		bsr.s	sendInt2ToSubCpu
		rte
; End of function sub_68AE


; =============== S U B	R O U T	I N E =======================================


sendInt2ToSubCpu:			; CODE XREF: ROM:00000360j sub_68A6p ...
		move.l	a5,-(sp)
		lea	(GA_RESET_HALT).l,a5
		bset	#0,-1(a5)
		movea.l	(sp)+,a5
		rts
; End of function sendInt2ToSubCpu


; =============== S U B	R O U T	I N E =======================================


sub_68C4:				; CODE XREF: ROM:00000364j
		move.l	(_LEVEL6+2).w,-(sp)
		move.w	(_LEVEL6).w,-(sp)
		move.l	a1,-(sp)
		st	(byte_FFFFFE28).w
		move.l	#$6A1E,(vblankJumpTarget+2).w
		move.w	#$4EF9,(vblankJumpTarget).w
		move.l	#$6AF0,(_LEVEL6+2).w
		move.w	#$4EF9,(_LEVEL6).w
		andi	#$F8FF,sr
		jsr	loadDefaultVdpRegs(pc)
		jsr	clearAllVram(pc)
		clr.l	(spriteTable).w
		clr.l	(spriteTable+4).w
		jsr	loadDefaultFont(pc)
		lea	byte_6A38(pc),a1
		jsr	loadPalettesNoUpdate
		move.l	#$40200000,(VDP_CONTROL).l
		jsr	NemDec
		movea.l	(sp)+,a1
		jsr	loadPalettesToBuffer(pc)
		move.l	#$60000000,(VDP_CONTROL).l
		jsr	NemDec
		adda.w	#$1D0,a1
		jsr	NemDec
		adda.w	#$206,a1
		move.w	#$6100,d0
		lea	(decompScratch).w,a2
		jsr	EniDec
		move.w	#$613F,d0
		jsr	EniDec
		subq.w	#1,a1
		move.l	#$4B0C0003,d0
		jsr	writeTextToScreen(pc)
		lea	(Z80_RAM_Base2).l,a0
		move.w	#$DF,d0	; 'ß'
		jsr	sub_1078(pc)
		jsr	loadZ80Prg0(pc)
		lea	(decompScratch).w,a1
		move.l	#$451A0003,d0
		moveq	#$11,d1
		moveq	#5,d2
		jsr	sub_C2E(pc)
		bsr.w	sub_6A20
		clr.b	(byte_FFFFFE28).w
		jsr	displayOn(pc)
		move.l	#$6B0C,(dword_FFFFFE34).w
		lea	(unk_FFFFC000).w,a0
		move.w	#$4FF,d7
		bsr.w	clearRamSegment
		bsr.w	sub_6B14
		move.w	#$3B,d7	; ';'

loc_69A8:				; CODE XREF: sub_68C4+E8j
		jsr	waitForVblank
		dbf	d7,loc_69A8
		move.w	#$38,d7	; '8'
		moveq	#0,d6

loc_69B6:				; CODE XREF: sub_68C4:loc_69C6j
		jsr	waitForVblank
		addi.b	#$1A,d6
		bpl.s	loc_69C4
		bsr.s	sub_6A20
		bra.s	loc_69C6
; ---------------------------------------------------------------------------

loc_69C4:				; CODE XREF: sub_68C4+FAj
		bsr.s	sub_6A26

loc_69C6:				; CODE XREF: sub_68C4+FEj
		dbf	d7,loc_69B6
		move.w	#$81,d7	; ''
		jsr	loc_109C
		move.w	#3,d7

loc_69D6:				; CODE XREF: sub_68C4+12Cj
		move.w	d7,-(sp)
		jsr	waitForVblank
		lea	(word_FFFFD000).w,a0
		lea	(spriteTable).w,a1
		moveq	#$F,d0
		move.w	#$40,d1	; '@'
		jsr	sub_1CA2(pc)
		move.w	(sp)+,d7
		dbf	d7,loc_69D6
		move.w	#$F0,d7	; 'ð'

loc_69F8:				; CODE XREF: sub_68C4+14Ej
		move.w	d7,-(sp)
		jsr	waitForVblank
		lea	(unk_FFFFC000).w,a0
		lea	(spriteTable).w,a1
		moveq	#$4F,d0	; 'O'
		move.w	#$40,d1	; '@'
		jsr	sub_1CA2(pc)
		move.w	(sp)+,d7
		dbf	d7,loc_69F8
		move.w	(sp)+,(_LEVEL6).w
		move.l	(sp)+,(_LEVEL6+2).w
		rts
; End of function sub_68C4


; =============== S U B	R O U T	I N E =======================================


sub_6A20:				; CODE XREF: sub_68C4+BCp sub_68C4+FCp
		lea	(unk_FFFFE0D8).w,a1
		bra.s	loc_6A2A
; End of function sub_6A20


; =============== S U B	R O U T	I N E =======================================


sub_6A26:				; CODE XREF: sub_68C4:loc_69C4p
		lea	(unk_FFFFE0F6).w,a1

loc_6A2A:				; CODE XREF: sub_6A20+4j
		move.l	#$45900003,d0
		moveq	#2,d1
		moveq	#4,d2
		jmp	sub_C2E(pc)
; End of function sub_6A26

; ---------------------------------------------------------------------------
byte_6A38:	dc.b 0			; DATA XREF: sub_68C4+42o
		dc.b $2F
		dc.w 0
		dc.w $EE8
		dc.w 0
		dc.w $EE4
		dc.w $EE0
		dc.w $EC0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $EC0
		dc.w 0
		dc.w $EE0
		dc.w $EC0
		dc.w $EA0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $E80
		dc.w 0
		dc.w $EC0
		dc.w $EA0
		dc.w $E80
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.b   0
		dc.b   4
		dc.b $80 ; €
		dc.b $54 ; T
		dc.b  $E
		dc.b $71 ; q
		dc.b   0
		dc.b $83 ; ƒ
		dc.b   2
		dc.b   2
		dc.b $84 ; „
		dc.b   3
		dc.b   6
		dc.b $FF
		dc.b $1F
		dc.b $A0 ;  
		dc.b $FC ; ü
		dc.b   8
		dc.b $1D
		dc.b $BF ; ¿
		dc.b   1
		dc.b $BA ; º
		dc.b $ED ; í
		dc.b $F8 ; ø
		dc.b  $C
		dc.b  $F
		dc.b $F0 ; ð
		dc.b $5D ; ]
		dc.b $6B ; k
		dc.b $A0 ;  
		dc.b $3F ; ?
		dc.b $81 ; 
		dc.b $F8 ; ø
		dc.b $50 ; P
		dc.b $FE ; þ
		dc.b   0
		dc.b   4
		dc.b   8
		dc.b   0
		dc.b   0
		dc.b $6A ; j
		dc.b $D0 ; Ð
		dc.b   0
		dc.b   0
		dc.b $6A ; j
		dc.b $D8 ; Ø
		dc.b   0
		dc.b   0
		dc.b $6A ; j
		dc.b $E0 ; à
		dc.b   0
		dc.b   0
		dc.b $6A ; j
		dc.b $E8 ; è
		dc.b   0
		dc.b   0
		dc.b $F8 ; ø
		dc.b   0
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b $F8 ; ø
		dc.b   0
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b $F8 ; ø
		dc.b   0
		dc.b   0
		dc.b   3
		dc.b   0
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b $F8 ; ø
		dc.b   0
		dc.b   0
		dc.b   4
		dc.b   0
		dc.b $FC ; ü

; =============== S U B	R O U T	I N E =======================================


sub_6AF0:
		movem.l	d0-a6,-(sp)
		jsr	sendInt2ToSubCpu(pc)
		tst.b	(byte_FFFFFE28).w
		bne.s	loc_6B06
		bsr.w	dmaTransferPalettes
		jsr	dmaSendSpriteTable

loc_6B06:				; CODE XREF: sub_6AF0+Cj
		clr.b	(vblankCode).w
		movem.l	(sp)+,d0-a6
		rte
; End of function sub_6AF0

; ---------------------------------------------------------------------------
		dc.b   0
		dc.b   0
		dc.b $6D ; m
		dc.b $68 ; h

; =============== S U B	R O U T	I N E =======================================


sub_6B14:				; CODE XREF: sub_68C4+DCp
		lea	(unk_FFFFC000).w,a0
		moveq	#$40,d6	; '@'
		moveq	#$4F,d7	; 'O'
		lea	unk_6B88(pc),a1

loc_6B20:				; CODE XREF: sub_6B14+6Ej
		move.w	#4,(a0)
		move.w	#$D3,8(a0) ; 'Ó'
		move.w	#$EB,$C(a0) ; 'ë'
		move.b	d7,$23(a0)
		cmpi.b	#$F,d7
		bls.s	loc_6B40
		move.w	#$E4,$C(a0) ; 'ä'

loc_6B40:				; CODE XREF: sub_6B14+24j
		moveq	#0,d0
		move.w	(a1)+,d0
		add.l	d0,d0
		add.l	d0,d0
		neg.l	d0
		move.l	d0,$14(a0)
		move.w	(a1)+,$28(a0)
		moveq	#0,d0
		move.w	(a1)+,d0
		add.l	d0,d0
		subi.l	#$E00,d0
		move.l	d0,$10(a0)
		move.w	d7,d0
		andi.w	#$3C,d0	; '<'
		asr.w	#2,d0
		move.b	d0,$21(a0)
		move.w	d7,d0
		andi.w	#3,d0
		move.b	d0,$20(a0)
		clr.b	$18(a0)
		move.b	d7,$26(a0)
		adda.w	d6,a0
		dbf	d7,loc_6B20
		rts
; End of function sub_6B14

; ---------------------------------------------------------------------------
unk_6B88:	dc.b $80 ; €		; DATA XREF: sub_6B14+8o
		dc.b   0
		dc.b   0
		dc.b $90 ; 
		dc.b  $B
		dc.b $8E ; Ž
		dc.b $78 ; x
		dc.b   0
		dc.b   0
		dc.b $8A ; Š
		dc.b $13
		dc.b $7A ; z
		dc.b $90 ; 
		dc.b   0
		dc.b   0
		dc.b $A0 ;  
		dc.b $17
		dc.b $33 ; 3
		dc.b $84 ; „
		dc.b   0
		dc.b   0
		dc.b $94 ; ”
		dc.b $20
		dc.b   0
		dc.b $74 ; t
		dc.b   0
		dc.b   0
		dc.b $87 ; ‡
		dc.b $2A ; *
		dc.b $AA ; ª
		dc.b $80 ; €
		dc.b   0
		dc.b   0
		dc.b $90 ; 
		dc.b $2F ; /
		dc.b $1C
		dc.b $70 ; p
		dc.b   0
		dc.b   0
		dc.b $85 ; …
		dc.b $3A ; :
		dc.b $B4 ; ´
		dc.b $8C ; Œ
		dc.b   0
		dc.b   0
		dc.b $9C ; œ
		dc.b $38 ; 8
		dc.b $9D ; 
		dc.b $6C ; l
		dc.b   0
		dc.b   0
		dc.b $81 ; 
		dc.b $4C ; L
		dc.b $67 ; g
		dc.b $84 ; „
		dc.b   0
		dc.b   0
		dc.b $94 ; ”
		dc.b $49 ; I
		dc.b $83 ; ƒ
		dc.b $74 ; t
		dc.b   0
		dc.b   0
		dc.b $88 ; ˆ
		dc.b $57 ; W
		dc.b $87 ; ‡
		dc.b $7C ; |
		dc.b   0
		dc.b   0
		dc.b $8D ; 
		dc.b $5B ; [
		dc.b $B0 ; °
		dc.b $8C ; Œ
		dc.b   0
		dc.b   0
		dc.b $9C ; œ
		dc.b $59 ; Y
		dc.b $6F ; o
		dc.b $70 ; p
		dc.b   0
		dc.b   0
		dc.b $84 ; „
		dc.b $71 ; q
		dc.b $74 ; t
		dc.b $7C ; |
		dc.b   0
		dc.b   0
		dc.b $8D ; 
		dc.b $71 ; q
		dc.b $79 ; y
		dc.b $80 ; €
		dc.b   0
		dc.b   0
		dc.b $91 ; ‘
		dc.b $75 ; u
		dc.b $68 ; h
		dc.b $88 ; ˆ
		dc.b   0
		dc.b   0
		dc.b $98 ; ˜
		dc.b $76 ; v
		dc.b $BC ; ¼
		dc.b $78 ; x
		dc.b   0
		dc.b   0
		dc.b $8A ; Š
		dc.b $8A ; Š
		dc.b $33 ; 3
		dc.b $84 ; „
		dc.b   0
		dc.b   0
		dc.b $93 ; “
		dc.b $88 ; ˆ
		dc.b $B5 ; µ
		dc.b $90 ; 
		dc.b   0
		dc.b   0
		dc.b $A0 ;  
		dc.b $84 ; „
		dc.b   0
		dc.b $80 ; €
		dc.b   0
		dc.b   0
		dc.b $90 ; 
		dc.b $99 ; ™
		dc.b $C7 ; Ç
		dc.b $84 ; „
		dc.b   0
		dc.b   0
		dc.b $84 ; „
		dc.b $7A ; z
		dc.b $2E ; .
		dc.b $70 ; p
		dc.b   0
		dc.b   0
		dc.b $69 ; i
		dc.b $19
		dc.b $99 ; ™
		dc.b $80 ; €
		dc.b   0
		dc.b   0
		dc.b $75 ; u
		dc.b $1F
		dc.b $B9 ; ¹
		dc.b $84 ; „
		dc.b   0
		dc.b   0
		dc.b $7B ; {
		dc.b $26 ; &
		dc.b $81 ; 
		dc.b $78 ; x
		dc.b   0
		dc.b   0
		dc.b $6C ; l
		dc.b $35 ; 5
		dc.b $55 ; U
		dc.b $78 ; x
		dc.b   0
		dc.b   0
		dc.b $6E ; n
		dc.b $3D ; =
		dc.b $AC ; ¬
		dc.b $7C ; |
		dc.b   0
		dc.b   0
		dc.b $72 ; r
		dc.b $44 ; D
		dc.b $7D ; }
		dc.b $74 ; t
		dc.b   0
		dc.b   0
		dc.b $6A ; j
		dc.b $53 ; S
		dc.b $52 ; R
		dc.b $8C ; Œ
		dc.b   0
		dc.b   0
		dc.b $82 ; ‚
		dc.b $4B ; K
		dc.b $D0 ; Ð
		dc.b $70 ; p
		dc.b   0
		dc.b   0
		dc.b $66 ; f
		dc.b $6A ; j
		dc.b $AA ; ª
		dc.b $90 ; 
		dc.b   0
		dc.b   0
		dc.b $85 ; …
		dc.b $59 ; Y
		dc.b $80 ; €
		dc.b $80 ; €
		dc.b   0
		dc.b   0
		dc.b $76 ; v
		dc.b $6D ; m
		dc.b $8F ; 
		dc.b $88 ; ˆ
		dc.b   0
		dc.b   0
		dc.b $7E ; ~
		dc.b $6E ; n
		dc.b $BA ; º
		dc.b $94 ; ”
		dc.b   0
		dc.b   0
		dc.b $8A ; Š
		dc.b $6C ; l
		dc.b $85 ; …
		dc.b $84 ; „
		dc.b   0
		dc.b   0
		dc.b $7A ; z
		dc.b $85 ; …
		dc.b $3E ; >
		dc.b $70 ; p
		dc.b   0
		dc.b   0
		dc.b $66 ; f
		dc.b $A6 ; ¦
		dc.b $E6 ; æ
		dc.b $8C ; Œ
		dc.b   0
		dc.b   0
		dc.b $82 ; ‚
		dc.b $8A ; Š
		dc.b $D4 ; Ô
		dc.b $80 ; €
		dc.b   0
		dc.b   0
		dc.b $76 ; v
		dc.b $A1 ; ¡
		dc.b $A0 ;  
		dc.b $70 ; p
		dc.b   0
		dc.b   0
		dc.b $66 ; f
		dc.b $C5 ; Å
		dc.b   5
		dc.b $90 ; 
		dc.b   0
		dc.b   0
		dc.b $86 ; †
		dc.b $9D ; 
		dc.b $9C ; œ
		dc.b $84 ; „
		dc.b   0
		dc.b   0
		dc.b $84 ; „
		dc.b $9E ; ž
		dc.b  $F
		dc.b $78 ; x
		dc.b   0
		dc.b   0
		dc.b $88 ; ˆ
		dc.b  $C
		dc.b $3C ; <
		dc.b $74 ; t
		dc.b   0
		dc.b   0
		dc.b $83 ; ƒ
		dc.b $10
		dc.b $9C ; œ
		dc.b $90 ; 
		dc.b   0
		dc.b   0
		dc.b $99 ; ™
		dc.b  $D
		dc.b $62 ; b
		dc.b $7C ; |
		dc.b   0
		dc.b   0
		dc.b $83 ; ƒ
		dc.b $12
		dc.b $90 ; 
		dc.b $70 ; p
		dc.b   0
		dc.b   0
		dc.b $76 ; v
		dc.b  $F
		dc.b $2F ; /
		dc.b $88 ; ˆ
		dc.b   0
		dc.b   0
		dc.b $88 ; ˆ
		dc.b $12
		dc.b $D2 ; Ò
		dc.b $8C ; Œ
		dc.b   0
		dc.b   0
		dc.b $89 ; ‰
		dc.b  $E
		dc.b   3
		dc.b $84 ; „
		dc.b   0
		dc.b   0
		dc.b $86 ; †
		dc.b $13
		dc.b $1A
		dc.b $94 ; ”
		dc.b   0
		dc.b   0
		dc.b $8E ; Ž
		dc.b $10
		dc.b $39 ; 9
		dc.b $84 ; „
		dc.b   0
		dc.b   0
		dc.b $7E ; ~
		dc.b $9B ; ›
		dc.b $6D ; m
		dc.b $8C ; Œ
		dc.b   0
		dc.b   0
		dc.b $8B ; ‹
		dc.b $94 ; ”
		dc.b $42 ; B
		dc.b $90 ; 
		dc.b   0
		dc.b   0
		dc.b $92 ; ’
		dc.b $8D ; 
		dc.b $26 ; &
		dc.b $94 ; ”
		dc.b   0
		dc.b   0
		dc.b $97 ; —
		dc.b $8A ; Š
		dc.b $2C ; ,
		dc.b $7C ; |
		dc.b   0
		dc.b   0
		dc.b $83 ; ƒ
		dc.b $A5 ; ¥
		dc.b $21 ; !
		dc.b $74 ; t
		dc.b   0
		dc.b   0
		dc.b $80 ; €
		dc.b $A6 ; ¦
		dc.b   0
		dc.b $78 ; x
		dc.b   0
		dc.b   0
		dc.b $86 ; †
		dc.b $A5 ; ¥
		dc.b $40 ; @
		dc.b $6C ; l
		dc.b   0
		dc.b   0
		dc.b $7F ; 
		dc.b $AC ; ¬
		dc.b $58 ; X
		dc.b $70 ; p
		dc.b   0
		dc.b   0
		dc.b $80 ; €
		dc.b $B1 ; ±
		dc.b   0
		dc.b $94 ; ”
		dc.b   0
		dc.b   0
		dc.b $88 ; ˆ
		dc.b $35 ; 5
		dc.b $A5 ; ¥
		dc.b $90 ; 
		dc.b   0
		dc.b   0
		dc.b $84 ; „
		dc.b $56 ; V
		dc.b $4D ; M
		dc.b $78 ; x
		dc.b   0
		dc.b   0
		dc.b $72 ; r
		dc.b $90 ; 
		dc.b $D7 ; ×
		dc.b $88 ; ˆ
		dc.b   0
		dc.b   0
		dc.b $7E ; ~
		dc.b $AB ; «
		dc.b $AE ; ®
		dc.b $88 ; ˆ
		dc.b   0
		dc.b   0
		dc.b $BE ; ¾
		dc.b $17
		dc.b $E4 ; ä
		dc.b $94 ; ”
		dc.b   0
		dc.b   0
		dc.b $BE ; ¾
		dc.b $1C
		dc.b $71 ; q
		dc.b $78 ; x
		dc.b   0
		dc.b   0
		dc.b $BE ; ¾
		dc.b $29 ; )
		dc.b $69 ; i
		dc.b $70 ; p
		dc.b   0
		dc.b   0
		dc.b $BE ; ¾
		dc.b $99 ; ™
		dc.b $99 ; ™
		dc.b $84 ; „
		dc.b   0
		dc.b   0
		dc.b $BE ; ¾
		dc.b $34 ; 4
		dc.b $9A ; š
		dc.b $6C ; l
		dc.b   0
		dc.b   0
		dc.b $BE ; ¾
		dc.b $44 ; D
		dc.b $89 ; ‰
		dc.b $80 ; €
		dc.b   0
		dc.b   0
		dc.b $BE ; ¾
		dc.b $44 ; D
		dc.b $81 ; 
		dc.b $74 ; t
		dc.b   0
		dc.b   0
		dc.b $BE ; ¾
		dc.b $50 ; P
		dc.b $D7 ; ×
		dc.b $90 ; 
		dc.b   0
		dc.b   0
		dc.b $BE ; ¾
		dc.b $84 ; „
		dc.b $DC ; Ü
		dc.b $7C ; |
		dc.b   0
		dc.b   0
		dc.b $BE ; ¾
		dc.b $5C ; \
		dc.b $16
		dc.b $8C ; Œ
		dc.b   0
		dc.b   0
		dc.b $BE ; ¾
		dc.b $59 ; Y
		dc.b $C4 ; Ä
		dc.b $74 ; t
		dc.b   0
		dc.b   0
		dc.b $BE ; ¾
		dc.b $6F ; o
		dc.b $A3 ; £
		dc.b $7C ; |
		dc.b   0
		dc.b   0
		dc.b $BE ; ¾
		dc.b $72 ; r
		dc.b $2F ; /
		dc.b $8C ; Œ
		dc.b   0
		dc.b   0
		dc.b $BE ; ¾
		dc.b $95 ; •
		dc.b $9C ; œ
		dc.b $84 ; „
		dc.b   0
		dc.b   0
		dc.b $BE ; ¾
		dc.b $7A ; z
		dc.b $BD ; ½
		dc.b $80 ; €
		dc.b   0
		dc.b   0
		dc.b $BE ; ¾
		dc.b $85 ; …
		dc.b $68 ; h
		dc.b $4A ; J
		dc.b $68 ; h
		dc.b   0
		dc.b $28 ; (
		dc.b $67 ; g
		dc.b $16
		dc.b   6
		dc.b $A8 ; ¨
		dc.b   0
		dc.b   0
		dc.b   8
		dc.b   0
		dc.b   0
		dc.b $14
		dc.b $53 ; S
		dc.b $68 ; h
		dc.b   0
		dc.b $28 ; (
		dc.b $66 ; f
		dc.b   8
		dc.b $42 ; B
		dc.b $A8 ; ¨
		dc.b   0
		dc.b $10
		dc.b $42 ; B
		dc.b $A8 ; ¨
		dc.b   0
		dc.b $14
		dc.b $10
		dc.b $28 ; (
		dc.b   0
		dc.b $23 ; #
		dc.b $50 ; P
		dc.b $28 ; (
		dc.b   0
		dc.b $26 ; &
		dc.b $10
		dc.b $28 ; (
		dc.b   0
		dc.b $26 ; &
		dc.b   2
		dc.b   0
		dc.b   0
		dc.b $60 ; `
		dc.b  $C
		dc.b   0
		dc.b   0
		dc.b $60 ; `
		dc.b $66 ; f
		dc.b   2
		dc.b $70 ; p
		dc.b   0
		dc.b $11
		dc.b $40 ; @
		dc.b   0
		dc.b $18
		dc.b $43 ; C
		dc.b $FA ; ú
		dc.b $FD ; ý
		dc.b $1C
		dc.b $53 ; S
		dc.b $28 ; (
		dc.b   0
		dc.b $21 ; !
		dc.b $6A ; j
		dc.b  $A
		dc.b $11
		dc.b $69 ; i
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $21 ; !
		dc.b $52 ; R
		dc.b $28 ; (
		dc.b   0
		dc.b $20
		dc.b $70 ; p
		dc.b   0
		dc.b $10
		dc.b $28 ; (
		dc.b   0
		dc.b $20
		dc.b $B0 ; °
		dc.b $11
		dc.b $65 ; e
		dc.b   6
		dc.b $70 ; p
		dc.b   0
		dc.b $11
		dc.b $40 ; @
		dc.b   0
		dc.b $20
		dc.b $E5 ; å
		dc.b $40 ; @
		dc.b $21 ; !
		dc.b $71 ; q
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   4
		dc.b $4E ; N
		dc.b $75 ; u

; =============== S U B	R O U T	I N E =======================================


testCartBootBlock:			; CODE XREF: ROM:0000056Cp
					; ROM:000005B0p
		lea	(cartBoot).l,a0
		cmpi.l	#'SEGA',-$100(a0)
		bne.s	locret_6DEC	; Bail if it doesn't start with SEGA
		lea	RegionBootBlock(pc),a1
		move.w	#706,d0

loc_6DE6:				; CODE XREF: testCartBootBlock+1Aj
		cmpm.w	(a0)+,(a1)+
		dbne	d0,loc_6DE6

locret_6DEC:				; CODE XREF: testCartBootBlock+Ej
		rts
; End of function testCartBootBlock

; ---------------------------------------------------------------------------
RegionBootBlock:		; DATA XREF: testCartBootBlock+10o
	incbin "us_boot_block.bin"

; =============== S U B	R O U T	I N E =======================================


sub_7374:				; CODE XREF: ROM:000005E6j
		bsr.w	sub_873A
		bsr.s	sub_738A
		moveq	#1,d0
		moveq	#8,d1
		bsr.w	sub_1800
		moveq	#8,d0
		bsr.w	setNextState
		rts
; End of function sub_7374


; =============== S U B	R O U T	I N E =======================================


sub_738A:				; CODE XREF: sub_7374+4p sub_738A+Ej
		moveq	#$3C,d0	; '<'
		and.w	(word_FFFFFF00).w,d0
		jsr	loc_739C(pc,d0.w)
		tst.w	(word_FFFFFF00).w
		bpl.s	sub_738A
		rts
; End of function sub_738A

; ---------------------------------------------------------------------------

loc_739C:
		bra.w	loc_73F6
; ---------------------------------------------------------------------------
		bra.w	loc_743A
; ---------------------------------------------------------------------------
		bra.w	sub_7484
; ---------------------------------------------------------------------------
		bra.w	sub_74E6
; ---------------------------------------------------------------------------
		bra.w	sub_87EC
; ---------------------------------------------------------------------------

loc_73B0:				; CODE XREF: ROM:000073BCj
		bsr.w	waitForVblank
		nop
		nop
		nop
		nop
		bra.s	loc_73B0

; =============== S U B	R O U T	I N E =======================================


waitForWordRam:				; CODE XREF: waitForWordRam+8j
					; sub_73CA+2Aj	...
		btst	#GA_MEM_MODE_RET,(GA_MEM_MODE).l
		beq.s	waitForWordRam
		rts
; End of function waitForWordRam


; =============== S U B	R O U T	I N E =======================================


sub_73CA:				; CODE XREF: ROM:000073FAp sub_7446+4p ...
		lea	($FFFFFDE0).w,a0
		lea	$10(a0),a1

loc_73D2:				; CODE XREF: sub_73CA+12j
		tst.l	8(a1)
		beq.s	loc_73DE
		bsr.w	waitForVblank
		bra.s	loc_73D2
; ---------------------------------------------------------------------------

loc_73DE:				; CODE XREF: sub_73CA+Cj
		move.w	d0,8(a0)

loc_73E2:				; CODE XREF: sub_73CA+20j
		bset	#1,($A12003).l
		beq.s	loc_73E2
		bsr.w	waitForVblank
		clr.l	8(a0)
		bra.s	waitForWordRam
; End of function sub_73CA

; ---------------------------------------------------------------------------

loc_73F6:				; CODE XREF: ROM:loc_739Cj
		move.w	#1,d0
		bsr.s	sub_73CA
		lea	(unk_210000).l,a2
		lea	$4010(a2),a0
		lea	$4000(a2),a1
		move.w	#0,d0
		jsr	byte_FFFFFDAE
		bcs.s	loc_7416
		moveq	#3,d1

loc_7416:				; CODE XREF: ROM:00007412j
		add.w	d1,d1
		move.w	word_7432(pc,d1.w),0(a2)
		moveq	#$FFFFFF93,d7
		bsr.w	loc_109C
		move.w	#4,(word_FFFFFF00).w
		move.b	#0,$C(a1)
		rts
; ---------------------------------------------------------------------------
word_7432:	dc.w 0
		dc.w $8000
		dc.w $8001
		dc.w $8081
; ---------------------------------------------------------------------------

loc_743A:				; CODE XREF: ROM:000073A0j
		bsr.s	sub_7446
		bsr.s	sub_7450
		move.w	#8,(word_FFFFFF00).w
		rts

; =============== S U B	R O U T	I N E =======================================


sub_7446:				; CODE XREF: ROM:loc_743Ap
		move.w	#2,d0
		bsr.w	sub_73CA
		rts
; End of function sub_7446


; =============== S U B	R O U T	I N E =======================================


sub_7450:				; CODE XREF: ROM:0000743Cp
		lea	(unk_210000).l,a2
		cmpi.w	#$8081,0(a2)
		bne.s	loc_7476
		lea	$4000(a2),a1
		move.w	#1,d0
		jsr	byte_FFFFFDAE
		cmpi.w	#$FFFF,d0
		bne.s	loc_747A
		cmpi.w	#$FFFF,d1
		bne.s	loc_747A

loc_7476:				; CODE XREF: sub_7450+Cj
		moveq	#0,d0
		moveq	#0,d1

loc_747A:				; CODE XREF: sub_7450+1Ej sub_7450+24j
		move.w	d0,2(a2)
		move.w	d1,4(a2)
		rts
; End of function sub_7450


; =============== S U B	R O U T	I N E =======================================


sub_7484:				; CODE XREF: ROM:000073A4j
		lea	(WordRAM_Bank0).l,a0
		lea	(unk_210000).l,a1
		lea	(byte_FFFFFF06).w,a2
		move.b	#0,(a2)
		bset	#0,(a2)
		tst.w	0(a1)
		bpl.s	loc_74A6
		bset	#1,(a2)

loc_74A6:				; CODE XREF: sub_7484+1Cj
		tst.w	4(a0)
		beq.s	loc_74B0
		bset	#2,(a2)

loc_74B0:				; CODE XREF: sub_7484+26j
		tst.w	4(a1)
		beq.s	loc_74BA
		bset	#3,(a2)

loc_74BA:				; CODE XREF: sub_7484+30j
		tst.w	4(a0)
		beq.s	loc_74CA
		tst.w	2(a1)
		beq.s	loc_74CA
		bset	#4,(a2)

loc_74CA:				; CODE XREF: sub_7484+3Aj sub_7484+40j
		tst.w	4(a1)
		beq.s	loc_74DA
		tst.w	2(a0)
		beq.s	loc_74DA
		bset	#5,(a2)

loc_74DA:				; CODE XREF: sub_7484+4Aj sub_7484+50j
		bset	#6,(a2)
		move.w	#$C,(word_FFFFFF00).w
		rts
; End of function sub_7484


; =============== S U B	R O U T	I N E =======================================


sub_74E6:				; CODE XREF: ROM:000073A8j
		moveq	#$7C,d0	; '|'
		and.w	(word_FFFFFF02).w,d0
		jsr	loc_74F6(pc,d0.w)
		bsr.w	waitForVblank
		rts
; End of function sub_74E6

; ---------------------------------------------------------------------------

loc_74F6:
		bra.w	sub_752C
; ---------------------------------------------------------------------------
		bra.w	sub_769C
; ---------------------------------------------------------------------------
		bra.w	sub_7A5E
; ---------------------------------------------------------------------------
		bra.w	sub_7C6E
; ---------------------------------------------------------------------------
		bra.w	loc_7D7C
; ---------------------------------------------------------------------------
		bra.w	sub_8124
; ---------------------------------------------------------------------------
		bra.w	loc_823C
; ---------------------------------------------------------------------------
		bra.w	sub_85C8
; ---------------------------------------------------------------------------
		bra.w	*+4

; =============== S U B	R O U T	I N E =======================================


sub_751A:				; CODE XREF: ROM:00007516j sub_751A+8j
		bset	#1,(GA_MEM_MODE).l
		beq.s	sub_751A
		move.w	#$10,(word_FFFFFF00).w
		rts
; End of function sub_751A


; =============== S U B	R O U T	I N E =======================================


sub_752C:				; CODE XREF: ROM:loc_74F6j
		bset	#7,(word_FFFFFF02).w
		bne.s	loc_7540
		bsr.w	sub_754E
		bsr.w	sub_7594
		bsr.w	sub_760C

loc_7540:				; CODE XREF: sub_752C+6j
		bsr.w	sub_7A1E
		beq.s	locret_754C
		move.w	#4,(word_FFFFFF02).w

locret_754C:				; CODE XREF: sub_752C+18j
		rts
; End of function sub_752C


; =============== S U B	R O U T	I N E =======================================


sub_754E:				; CODE XREF: sub_752C+8p
		bsr.w	sub_7876
		movem.w	word_757C(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_7582(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_7588(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_758E(pc),d0-d2
		bsr.w	sub_77FA
		rts
; End of function sub_754E

; ---------------------------------------------------------------------------
word_757C:	dc.w $8100		; DATA XREF: sub_754E+4w
		dc.w $286
		dc.w 0
word_7582:	dc.w $8100		; DATA XREF: sub_754E+Ew
		dc.w $786
		dc.w 4
word_7588:	dc.w $8100		; DATA XREF: sub_754E+18w
		dc.w $C9C
		dc.w $11
word_758E:	dc.w $8100		; DATA XREF: sub_754E+22w
		dc.w $90
		dc.w $1F

; =============== S U B	R O U T	I N E =======================================


sub_7594:				; CODE XREF: sub_752C+Cp
		lea	(WordRAM_Bank0).l,a4
		btst	#0,1(a4)
		beq.s	loc_75E8
		movem.w	word_75F4(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_75FA(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_7600(pc),d0-d2
		bsr.w	sub_77FA
		lea	$4000(a4),a0
		move.w	#$41C,d0
		moveq	#0,d1
		bsr.w	sub_783E
		move.w	#$590,d1
		move.w	4(a4),d0
		bsr.w	sub_78D8
		move.w	#$5B2,d1
		move.w	2(a4),d0
		bsr.w	sub_78D8
		rts
; ---------------------------------------------------------------------------

loc_75E8:				; CODE XREF: sub_7594+Cj
		movem.w	word_7606(pc),d0-d2
		bsr.w	sub_77FA
		rts
; End of function sub_7594

; ---------------------------------------------------------------------------
word_75F4:	dc.w $8100		; DATA XREF: sub_7594+Ew
		dc.w $386
		dc.w 1
word_75FA:	dc.w $8100		; DATA XREF: sub_7594+18w
		dc.w $48C
		dc.w 2
word_7600:	dc.w $8100		; DATA XREF: sub_7594+22w
		dc.w $4AE
		dc.w 3
word_7606:	dc.w $8100		; DATA XREF: sub_7594:loc_75E8w
		dc.w $496
		dc.w $1D

; =============== S U B	R O U T	I N E =======================================


sub_760C:				; CODE XREF: sub_752C+10p
		lea	(unk_210000).l,a4
		tst.w	0(a4)
		bmi.s	loc_7624
		movem.w	word_7696(pc),d0-d2
		bsr.w	sub_77FA
		rts
; ---------------------------------------------------------------------------

loc_7624:				; CODE XREF: sub_760C+Aj
		btst	#0,1(a4)
		beq.s	loc_7672
		movem.w	word_767E(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_7684(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_768A(pc),d0-d2
		bsr.w	sub_77FA
		lea	$4000(a4),a0
		move.w	#$91C,d0
		moveq	#0,d1
		bsr.w	sub_783E
		move.w	4(a4),d0
		move.w	#$A90,d1
		bsr.w	sub_78D8
		move.w	2(a4),d0
		move.w	#$AB2,d1
		bsr.w	sub_78D8
		rts
; ---------------------------------------------------------------------------

loc_7672:				; CODE XREF: sub_760C+1Ej
		movem.w	word_7690(pc),d0-d2
		bsr.w	sub_77FA
		rts
; End of function sub_760C

; ---------------------------------------------------------------------------
word_767E:	dc.w $8100		; DATA XREF: sub_760C+20w
		dc.w $886
		dc.w 1
word_7684:	dc.w $8100		; DATA XREF: sub_760C+2Aw
		dc.w $98C
		dc.w 2
word_768A:	dc.w $8100		; DATA XREF: sub_760C+34w
		dc.w $9AE
		dc.w 3
word_7690:	dc.w $8100		; DATA XREF: sub_760C:loc_7672w
		dc.w $896
		dc.w $1D
word_7696:	dc.w $8100		; DATA XREF: sub_760C+Cw
		dc.w $896
		dc.w $1E

; =============== S U B	R O U T	I N E =======================================


sub_769C:				; CODE XREF: ROM:000074FAj
		bset	#7,(word_FFFFFF02).w
		bne.s	loc_76A8
		bsr.w	sub_76D8

loc_76A8:				; CODE XREF: sub_769C+6j
		bsr.w	sub_77A0
		bsr.w	sub_7A1E
		beq.s	locret_76D6
		move.w	(word_FFFFFF0A).w,d0
		btst	d0,(byte_FFFFFF06).w
		bne.s	loc_76C4
		moveq	#$FFFFFF92,d7
		bsr.w	loc_109C
		bra.s	locret_76D6
; ---------------------------------------------------------------------------

loc_76C4:				; CODE XREF: sub_769C+1Ej
		move.w	(word_FFFFFF0A).w,d0
		lsl.w	#2,d0
		addq.w	#8,d0
		move.w	d0,(word_FFFFFF02).w
		moveq	#$FFFFFF91,d7
		bsr.w	loc_109C

locret_76D6:				; CODE XREF: sub_769C+14j sub_769C+26j
		rts
; End of function sub_769C


; =============== S U B	R O U T	I N E =======================================


sub_76D8:				; CODE XREF: sub_769C+8p
		bsr.w	sub_7876
		lea	(byte_FFFFFF06).w,a4
		movem.w	word_7770(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_7776(pc),d0-d2
		btst	#1,(a4)
		bne.s	loc_76FA
		addi.w	#$2000,d0

loc_76FA:				; CODE XREF: sub_76D8+1Cj
		bsr.w	sub_77FA
		movem.w	word_777C(pc),d0-d2
		btst	#2,(a4)
		bne.s	loc_770E
		addi.w	#$2000,d0

loc_770E:				; CODE XREF: sub_76D8+30j
		bsr.w	sub_77FA
		movem.w	word_7782(pc),d0-d2
		btst	#3,(a4)
		bne.s	loc_7722
		addi.w	#$2000,d0

loc_7722:				; CODE XREF: sub_76D8+44j
		bsr.w	sub_77FA
		movem.w	word_7788(pc),d0-d2
		btst	#4,(a4)
		bne.s	loc_7736
		addi.w	#$2000,d0

loc_7736:				; CODE XREF: sub_76D8+58j
		bsr.w	sub_77FA
		movem.w	word_778E(pc),d0-d2
		btst	#5,(a4)
		bne.s	loc_774A
		addi.w	#$2000,d0

loc_774A:				; CODE XREF: sub_76D8+6Cj
		bsr.w	sub_77FA
		movem.w	word_779A(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_7794(pc),d0-d2
		bsr.w	sub_77FA
		move.l	#$60000,(word_FFFFFF0A).w
		clr.w	(word_FFFFFF08).w
		rts
; End of function sub_76D8

; ---------------------------------------------------------------------------
word_7770:	dc.w $8100		; DATA XREF: sub_76D8+8w
		dc.w $396
		dc.w 5
word_7776:	dc.w $8100		; DATA XREF: sub_76D8+12w
		dc.w $496
		dc.w 6
word_777C:	dc.w $8100		; DATA XREF: sub_76D8+26w
		dc.w $596
		dc.w 7
word_7782:	dc.w $8100		; DATA XREF: sub_76D8+3Aw
		dc.w $696
		dc.w 8
word_7788:	dc.w $8100		; DATA XREF: sub_76D8+4Ew
		dc.w $796
		dc.w 9
word_778E:	dc.w $8100		; DATA XREF: sub_76D8+62w
		dc.w $896
		dc.w $A
word_7794:	dc.w $8100		; DATA XREF: sub_76D8+80w
		dc.w $996
		dc.w $B
word_779A:	dc.w $8100		; DATA XREF: sub_76D8+76w
		dc.w $A4
		dc.w $24

; =============== S U B	R O U T	I N E =======================================


sub_77A0:				; CODE XREF: sub_769C:loc_76A8p
		bsr.w	sub_790A
		move.w	(word_FFFFFF0A).w,d1
		bpl.s	loc_77AE
		moveq	#0,d1
		bra.s	loc_77B6
; ---------------------------------------------------------------------------

loc_77AE:				; CODE XREF: sub_77A0+8j
		cmpi.w	#6,d1
		ble.s	loc_77B6
		moveq	#6,d1

loc_77B6:				; CODE XREF: sub_77A0+Cj sub_77A0+12j
		move.w	d1,(word_FFFFFF0A).w
		mulu.w	#$10,d1
		addi.w	#$B8,d1	; '¸'
		swap	d1
		move.w	#$D01,d1
		move.l	#$1000D8,d2
		moveq	#3,d0
		moveq	#$20,d3	; ' '

loc_77D2:				; CODE XREF: sub_7BBA+24p sub_7F66+A2j ...
		lea	(dword_220E00).l,a0

loc_77D8:				; CODE XREF: sub_77A0+42j
		movem.l	d1-d2,(a0)
		addq.w	#8,a0
		addq.w	#1,d1
		add.w	d3,d2
		dbf	d0,loc_77D8
		clr.l	(a0)
		rts
; End of function sub_77A0


; =============== S U B	R O U T	I N E =======================================


sub_77EA:				; CODE XREF: sub_78D8+2Cp
		lea	(WordRAM_Bank1).l,a1
		lea	(unk_15DC6).l,a3
		adda.w	d1,a1
		bra.s	loc_7814
; End of function sub_77EA


; =============== S U B	R O U T	I N E =======================================

; Inputs:
;   d0:
;   d1:
;   d2:

sub_77FA:				; CODE XREF: sub_754E+Ap sub_754E+14p	...
		lea	(WordRAM_Bank1).l,a1
		lea	(off_15920).l,a2
		lea	(unk_15DC6).l,a3
		adda.w	d1,a1
		add.w	d2,d2
		adda.w	(a2,d2.w),a2

loc_7814:				; CODE XREF: sub_77EA+Ej sub_77FA+26j
		move.w	(a2)+,d2
		bmi.s	locret_7822
		lsl.w	#2,d2
		lea	(a3,d2.w),a0
		bsr.s	sub_7824
		bra.s	loc_7814
; ---------------------------------------------------------------------------

locret_7822:				; CODE XREF: sub_77FA+1Cj
		rts
; End of function sub_77FA


; =============== S U B	R O U T	I N E =======================================


sub_7824:				; CODE XREF: sub_77FA+24p
		movem.w	(a0),d1-d2
		subq.w	#1,d1
		add.w	d0,d2

loc_782C:				; CODE XREF: sub_7824+14j
		move.w	d2,(a1)
		addq.w	#1,d2
		move.w	d2,$80(a1)
		addq.w	#1,d2
		addq.w	#2,a1
		dbf	d1,loc_782C
		rts
; End of function sub_7824


; =============== S U B	R O U T	I N E =======================================


sub_783E:				; CODE XREF: sub_7594+36p sub_760C+48p ...
		lea	(WordRAM_Bank1).l,a1
		adda.w	d0,a1

loc_7846:				; CODE XREF: sub_783E+12j sub_844C+58p
		moveq	#0,d0
		move.b	(a0)+,d0
		beq.s	locret_7852
		add.w	d1,d0
		move.w	d0,(a1)+
		bra.s	loc_7846
; ---------------------------------------------------------------------------

locret_7852:				; CODE XREF: sub_783E+Cj
		rts
; End of function sub_783E


; =============== S U B	R O U T	I N E =======================================


sub_7854:				; CODE XREF: sub_873A+84p
		move.l	#$42000000,(VDP_CONTROL).l
		lea	(VDP_DATA).l,a0
		moveq	#$FFFFFFFF,d0
		moveq	#7,d1

loc_7868:				; CODE XREF: sub_7854+1Cj
		moveq	#7,d3

loc_786A:				; CODE XREF: sub_7854+18j
		move.l	d0,(a0)
		dbf	d3,loc_786A
		dbf	d1,loc_7868
		rts
; End of function sub_7854


; =============== S U B	R O U T	I N E =======================================


sub_7876:				; CODE XREF: sub_754Ep	sub_76D8p ...
		lea	(dword_220E00).l,a0
		move.w	#$DF,d4	; 'ß'

loc_7880:				; CODE XREF: sub_7B4A+18p sub_800C+18p ...
		moveq	#0,d0
		moveq	#0,d1
		moveq	#0,d2
		moveq	#0,d3

loc_7888:				; CODE XREF: sub_7876+16j
		movem.l	d0-d3,-(a0)
		dbf	d4,loc_7888
		rts
; End of function sub_7876


; =============== S U B	R O U T	I N E =======================================


sub_7892:				; CODE XREF: sub_78D8+8p sub_7EA8+52p	...
		pea	(a0)
		andi.l	#$FFFF,d0
		divu.w	#$2710,d0
		bsr.s	sub_78CC
		divu.w	#$3E8,d0
		bsr.s	sub_78CC
		divu.w	#$64,d0	; 'd'
		bsr.s	sub_78CC
		divu.w	#$A,d0
		bsr.s	sub_78CC
		move.w	d0,(a0)
		movea.l	(sp)+,a0
		moveq	#4,d0

loc_78B8:				; CODE XREF: sub_7892+28j
		tst.w	(a0)+
		dbne	d0,loc_78B8
		bne.s	loc_78C2
		addq.w	#1,d0

loc_78C2:				; CODE XREF: sub_7892+2Cj
		subq.w	#2,a0

loc_78C4:				; CODE XREF: sub_7892+34j
		add.w	d1,(a0)+
		dbf	d0,loc_78C4
		rts
; End of function sub_7892


; =============== S U B	R O U T	I N E =======================================


sub_78CC:				; CODE XREF: sub_7892+Cp sub_7892+12p	...
		move.w	d0,(a0)+
		swap	d0
		andi.l	#$FFFF,d0
		rts
; End of function sub_78CC


; =============== S U B	R O U T	I N E =======================================


sub_78D8:				; CODE XREF: sub_7594+42p sub_7594+4Ep ...
		move.l	d1,-(sp)
		lea	(unk_FFFFFF0E).w,a0
		moveq	#$12,d1
		bsr.s	sub_7892
		move.w	#$FFFF,(a0)
		lea	(unk_FFFFFF0E).w,a0
		moveq	#3,d0

loc_78EC:				; CODE XREF: sub_78D8+1Ej
		tst.w	(a0)
		bne.s	loc_78F4
		move.w	#2,(a0)

loc_78F4:				; CODE XREF: sub_78D8+16j
		addq.w	#2,a0
		dbf	d0,loc_78EC
		move.l	(sp)+,d1
		lea	(unk_FFFFFF0E).w,a2
		move.w	#(dword_C0FE+2),d0
		bsr.w	sub_77EA
		rts
; End of function sub_78D8


; =============== S U B	R O U T	I N E =======================================


sub_790A:				; CODE XREF: sub_77A0p	sub_7F66p
		pea	(a0)
		cmpi.b	#7,(byte_FFFFFE18).w
		beq.s	loc_791E
		cmpi.b	#3,(byte_FFFFFE18).w
		beq.s	loc_7940
		bra.s	loc_794E
; ---------------------------------------------------------------------------

loc_791E:				; CODE XREF: sub_790A+8j
		moveq	#3,d0
		and.b	(word_FFFFFF08).w,d0
		add.w	d0,d0
		move.w	word_7988(pc,d0.w),d0
		add.w	d0,(word_FFFFFF0A).w
		lea	(unk_FFFFFE1A).w,a0
		moveq	#3,d0

loc_7934:				; CODE XREF: sub_790A+2Ej
		cmpi.b	#2,(a0)+
		dbeq	d0,loc_7934
		beq.s	loc_7966
		bra.s	loc_794E
; ---------------------------------------------------------------------------

loc_7940:				; CODE XREF: sub_790A+10j
		move.w	(word_FFFFFE08).w,d0
		bsr.w	sub_7A16
		add.l	d0,(word_FFFFFF0A).w
		bra.s	loc_795E
; ---------------------------------------------------------------------------

loc_794E:				; CODE XREF: sub_790A+12j sub_790A+34j
		moveq	#3,d0
		and.b	(word_FFFFFF08).w,d0
		add.w	d0,d0
		move.w	word_7988(pc,d0.w),d0
		add.w	d0,(word_FFFFFF0A).w

loc_795E:				; CODE XREF: sub_790A+42j
		cmpi.b	#3,(byte_FFFFFE19).w
		bne.s	loc_7974

loc_7966:				; CODE XREF: sub_790A+32j
		move.w	(dword_FFFFFE12+2).w,d0
		bsr.w	sub_7A16
		add.l	d0,(word_FFFFFF0A).w
		bra.s	loc_7984
; ---------------------------------------------------------------------------

loc_7974:				; CODE XREF: sub_790A+5Aj
		moveq	#3,d0
		and.b	(word_FFFFFF08+1).w,d0
		add.w	d0,d0
		move.w	word_7988(pc,d0.w),d0
		add.w	d0,(word_FFFFFF0A).w

loc_7984:				; CODE XREF: sub_790A+68j
		movea.l	(sp)+,a0
		rts
; End of function sub_790A

; ---------------------------------------------------------------------------
word_7988:	dc.w 0
		dc.w $FFFF
		dc.w 1
		dc.w 0

; =============== S U B	R O U T	I N E =======================================


sub_7990:				; CODE XREF: sub_7C0A+4p
		pea	(a0)
		cmpi.b	#7,(byte_FFFFFE18).w
		beq.s	loc_79A4
		cmpi.b	#3,(byte_FFFFFE18).w
		beq.s	loc_79C6
		bra.s	loc_79D4
; ---------------------------------------------------------------------------

loc_79A4:				; CODE XREF: sub_7990+8j
		moveq	#$C,d0
		and.b	(word_FFFFFF08).w,d0
		lsr.w	#1,d0
		move.w	unk_7A0E(pc,d0.w),d0
		add.w	d0,(word_FFFFFF0A).w
		lea	(unk_FFFFFE1A).w,a0
		moveq	#3,d0

loc_79BA:				; CODE XREF: sub_7990+2Ej
		cmpi.b	#2,(a0)+
		dbeq	d0,loc_79BA
		beq.s	loc_79EC
		bra.s	loc_79D4
; ---------------------------------------------------------------------------

loc_79C6:				; CODE XREF: sub_7990+10j
		move.w	(word_FFFFFE06).w,d0
		bsr.w	sub_7A16
		add.l	d0,(word_FFFFFF0A).w
		bra.s	loc_79E4
; ---------------------------------------------------------------------------

loc_79D4:				; CODE XREF: sub_7990+12j sub_7990+34j
		moveq	#$C,d0
		and.b	(word_FFFFFF08).w,d0
		lsr.w	#1,d0
		move.w	unk_7A0E(pc,d0.w),d0
		add.w	d0,(word_FFFFFF0A).w

loc_79E4:				; CODE XREF: sub_7990+42j
		cmpi.b	#3,(byte_FFFFFE19).w
		bne.s	loc_79FA

loc_79EC:				; CODE XREF: sub_7990+32j
		move.w	(dword_FFFFFE12).w,d0
		bsr.w	sub_7A16
		add.l	d0,(word_FFFFFF0A).w
		bra.s	loc_7A0A
; ---------------------------------------------------------------------------

loc_79FA:				; CODE XREF: sub_7990+5Aj
		moveq	#$C,d0
		and.b	(word_FFFFFF08+1).w,d0
		lsr.w	#1,d0
		move.w	unk_7A0E(pc,d0.w),d0
		add.w	d0,(word_FFFFFF0A).w

loc_7A0A:				; CODE XREF: sub_7990+68j
		movea.l	(sp)+,a0
		rts
; End of function sub_7990

; ---------------------------------------------------------------------------
unk_7A0E:	dc.b   0
		dc.b   0
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b   0

; =============== S U B	R O U T	I N E =======================================


sub_7A16:				; CODE XREF: sub_790A+3Ap sub_790A+60p ...
		ext.l	d0
		asl.l	#8,d0
		asl.l	#2,d0
		rts
; End of function sub_7A16


; =============== S U B	R O U T	I N E =======================================


sub_7A1E:				; CODE XREF: sub_752C:loc_7540p
					; sub_769C+10p	...
		movem.l	d0,-(sp)
		cmpi.b	#3,(byte_FFFFFE18).w
		bne.s	loc_7A32
		tst.b	(byte_FFFFFE0B).w
		bne.s	loc_7A58
		bra.s	loc_7A3A
; ---------------------------------------------------------------------------

loc_7A32:				; CODE XREF: sub_7A1E+Aj
		moveq	#$FFFFFFF0,d0
		and.b	(joy1Triggered).w,d0
		bne.s	loc_7A58

loc_7A3A:				; CODE XREF: sub_7A1E+12j
		cmpi.b	#3,(byte_FFFFFE19).w
		bne.s	loc_7A52
		tst.b	(byte_FFFFFE17).w
		beq.s	loc_7A58
		nop
		nop
		nop
		nop
		bra.s	loc_7A58
; ---------------------------------------------------------------------------

loc_7A52:				; CODE XREF: sub_7A1E+22j
		moveq	#$FFFFFFF0,d0
		and.b	(joy2Triggered).w,d0

loc_7A58:				; CODE XREF: sub_7A1E+10j sub_7A1E+1Aj ...
		movem.l	(sp)+,d0
; End of function sub_7A1E

		rts

; =============== S U B	R O U T	I N E =======================================


sub_7A5E:				; CODE XREF: ROM:000074FEj
		bset	#7,(word_FFFFFF02).w
		bne.s	loc_7A6A
		clr.w	(word_FFFFFF04).w

loc_7A6A:				; CODE XREF: sub_7A5E+6j
		lea	(WordRAM_Bank0).l,a4
		moveq	#$7C,d0	; '|'
		and.w	(word_FFFFFF04).w,d0
		jsr	loc_7A7C(pc,d0.w)
		rts
; End of function sub_7A5E

; ---------------------------------------------------------------------------

loc_7A7C:
		bra.w	sub_7AA0
; ---------------------------------------------------------------------------
		bra.w	sub_7BBA
; ---------------------------------------------------------------------------
		bra.w	sub_7A90
; ---------------------------------------------------------------------------
		bra.w	sub_7B4A
; ---------------------------------------------------------------------------
		bra.w	sub_7C34

; =============== S U B	R O U T	I N E =======================================


sub_7A90:				; CODE XREF: ROM:00007A84j
		move.w	#3,d0
		bsr.w	sub_73CA
		move.w	#$C,(word_FFFFFF04).w
		rts
; End of function sub_7A90


; =============== S U B	R O U T	I N E =======================================


sub_7AA0:				; CODE XREF: ROM:loc_7A7Cj
		clr.l	(dword_220E00).l
		bsr.w	sub_7876
		movem.w	word_7B26(pc),d0-d2
		bsr.w	sub_77FA
		tst.b	1(a4)
		beq.s	loc_7B04
		bgt.s	loc_7AE8
		movem.w	word_7B32(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_7B38(pc),d0-d2
		bsr.w	sub_77FA
		move.w	4(a4),d0
		move.w	#$690,d1
		bsr.w	sub_78D8
		move.w	2(a4),d0
		move.w	#$6B2,d1
		bsr.w	sub_78D8

loc_7AE8:				; CODE XREF: sub_7AA0+1Aj
		movem.w	word_7B2C(pc),d0-d2
		bsr.w	sub_77FA
		lea	$4000(a4),a0
		move.w	#$410,d0
		moveq	#0,d1
		bsr.w	sub_783E
		bsr.w	sub_7C4C

loc_7B04:				; CODE XREF: sub_7AA0+18j
		movem.w	word_7B3E(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_7B44(pc),d0-d2
		bsr.w	sub_77FA
		move.w	#4,(word_FFFFFF04).w
		move.w	#1,(word_FFFFFF0A).w
		rts
; End of function sub_7AA0

; ---------------------------------------------------------------------------
word_7B26:	dc.w $8100		; DATA XREF: sub_7AA0+Aw
		dc.w $9A
		dc.w 5
word_7B2C:	dc.w $8100		; DATA XREF: sub_7AA0:loc_7AE8w
		dc.w $290
		dc.w $12
word_7B32:	dc.w $8100		; DATA XREF: sub_7AA0+1Cw
		dc.w $58C
		dc.w 2
word_7B38:	dc.w $8100		; DATA XREF: sub_7AA0+26w
		dc.w $5AE
		dc.w 3
word_7B3E:	dc.w $8100		; DATA XREF: sub_7AA0:loc_7B04w
		dc.w $9AC
		dc.w $E
word_7B44:	dc.w $8100		; DATA XREF: sub_7AA0+6Ew
		dc.w $AA0
		dc.w $F

; =============== S U B	R O U T	I N E =======================================


sub_7B4A:				; CODE XREF: ROM:00007A88j
					; ROM:00007C98j
		bset	#7,(word_FFFFFF04).w
		bne.s	loc_7B94
		clr.l	(dword_220E00).l
		lea	(dword_220E00).l,a0
		move.w	#$BF,d4	; '¿'
		bsr.w	loc_7880
		btst	#0,1(a4)
		beq.s	loc_7B7A
		movem.w	word_7BA8(pc),d0-d2
		bsr.w	sub_77FA
		bra.s	loc_7B8A
; ---------------------------------------------------------------------------

loc_7B7A:				; CODE XREF: sub_7B4A+22j
		movem.w	word_7BB4(pc),d0-d2
		bsr.w	sub_77FA
		moveq	#$FFFFFF92,d7
		bsr.w	loc_109C

loc_7B8A:				; CODE XREF: sub_7B4A+2Ej
		movem.w	word_7BAE(pc),d0-d2
		bsr.w	sub_77FA

loc_7B94:				; CODE XREF: sub_7B4A+6j
		bsr.w	sub_7A1E
		beq.s	locret_7BA6
		moveq	#$FFFFFF91,d7
		bsr.w	loc_109C
		move.w	#$10,(word_FFFFFF04).w

locret_7BA6:				; CODE XREF: sub_7B4A+4Ej
		rts
; End of function sub_7B4A

; ---------------------------------------------------------------------------
word_7BA8:	dc.w $8100		; DATA XREF: sub_7B4A+24w
		dc.w $59A
		dc.w $10
word_7BAE:	dc.w $8100		; DATA XREF: sub_7B4A:loc_7B8Aw
		dc.w $898
		dc.w $11
word_7BB4:	dc.w $8100		; DATA XREF: sub_7B4A:loc_7B7Aw
		dc.w $59A
		dc.w $21

; =============== S U B	R O U T	I N E =======================================


sub_7BBA:				; CODE XREF: ROM:00007A80j
					; ROM:00007C90j
		bsr.w	sub_7C0A
		moveq	#0,d2
		move.w	(word_FFFFFF0A).w,d2
		mulu.w	#$28,d2	; '('
		addi.w	#$FC,d2	; 'ü'
		swap	d2
		move.w	#$10,d2
		swap	d2
		move.l	#$1280D01,d1
		moveq	#0,d0
		moveq	#$20,d3	; ' '
		bsr.w	loc_77D2
		bsr.w	sub_7A1E
		beq.s	locret_7BFA
		tst.w	(word_FFFFFF0A).w
		bne.s	loc_7BFC
		moveq	#$FFFFFF91,d7
		bsr.w	loc_109C
		move.w	#8,(word_FFFFFF04).w

locret_7BFA:				; CODE XREF: sub_7BBA+2Cj
		rts
; ---------------------------------------------------------------------------

loc_7BFC:				; CODE XREF: sub_7BBA+32j
		moveq	#$FFFFFF90,d7
		bsr.w	loc_109C
		move.w	#$10,(word_FFFFFF04).w
		rts
; End of function sub_7BBA


; =============== S U B	R O U T	I N E =======================================


sub_7C0A:				; CODE XREF: sub_7BBAp	sub_80FAp
		move.w	(word_FFFFFF0A).w,d2
		bsr.w	sub_7990
		move.w	(word_FFFFFF0A).w,d1
		bpl.s	loc_7C1C
		moveq	#0,d1
		bra.s	loc_7C24
; ---------------------------------------------------------------------------

loc_7C1C:				; CODE XREF: sub_7C0A+Cj
		cmpi.w	#1,d1
		ble.s	loc_7C24
		moveq	#1,d1

loc_7C24:				; CODE XREF: sub_7C0A+10j sub_7C0A+16j
		move.w	d1,(word_FFFFFF0A).w
		cmp.w	d1,d2
		beq.s	locret_7C32
		moveq	#$FFFFFF90,d7
		bsr.w	loc_109C

locret_7C32:				; CODE XREF: sub_7C0A+20j
		rts
; End of function sub_7C0A


; =============== S U B	R O U T	I N E =======================================


sub_7C34:				; CODE XREF: ROM:00007A8Cj
					; ROM:00007C9Cj ...
		move.w	#4,(word_FFFFFF00).w
		move.w	#4,(word_FFFFFF02).w
		move.w	#0,(word_FFFFFF04).w
		clr.l	(word_FFFFFF0A).w
		rts
; End of function sub_7C34


; =============== S U B	R O U T	I N E =======================================


sub_7C4C:				; CODE XREF: sub_7AA0+60p
					; ROM:00007D00p
		movem.w	word_7C62(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_7C68(pc),d0-d2
		bsr.w	sub_77FA
		rts
; End of function sub_7C4C

; ---------------------------------------------------------------------------
word_7C62:	dc.w $8100		; DATA XREF: sub_7C4Cw
		dc.w $890
		dc.w $C
word_7C68:	dc.w $8100		; DATA XREF: sub_7C4C+Aw
		dc.w $990
		dc.w $D

; =============== S U B	R O U T	I N E =======================================


sub_7C6E:				; CODE XREF: ROM:00007502j
		bset	#7,(word_FFFFFF02).w
		bne.s	loc_7C7A
		clr.w	(word_FFFFFF04).w

loc_7C7A:				; CODE XREF: sub_7C6E+6j
		lea	(unk_210000).l,a4
		moveq	#$7C,d0	; '|'
		and.w	(word_FFFFFF04).w,d0
		jsr	loc_7C8C(pc,d0.w)
		rts
; End of function sub_7C6E

; ---------------------------------------------------------------------------

loc_7C8C:
		bra.w	loc_7CA0
; ---------------------------------------------------------------------------
		bra.w	sub_7BBA
; ---------------------------------------------------------------------------
		bra.w	loc_7D50
; ---------------------------------------------------------------------------
		bra.w	sub_7B4A
; ---------------------------------------------------------------------------
		bra.w	sub_7C34
; ---------------------------------------------------------------------------

loc_7CA0:				; CODE XREF: ROM:loc_7C8Cj
		clr.l	(dword_220E00).l
		bsr.w	sub_7876
		movem.w	word_7D26(pc),d0-d2
		bsr.w	sub_77FA
		tst.b	1(a4)
		beq.s	loc_7D04
		bgt.s	loc_7CE8
		movem.w	word_7D32(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_7D38(pc),d0-d2
		bsr.w	sub_77FA
		move.w	4(a4),d0
		move.w	#$690,d1
		bsr.w	sub_78D8
		move.w	2(a4),d0
		move.w	#$6B2,d1
		bsr.w	sub_78D8

loc_7CE8:				; CODE XREF: ROM:00007CBAj
		movem.w	word_7D2C(pc),d0-d2
		bsr.w	sub_77FA
		lea	$4000(a4),a0
		move.w	#$410,d0
		moveq	#0,d1
		bsr.w	sub_783E
		bsr.w	sub_7C4C

loc_7D04:				; CODE XREF: ROM:00007CB8j
		movem.w	word_7D3E(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_7D44(pc),d0-d2
		bsr.w	sub_77FA
		move.w	#4,(word_FFFFFF04).w
		move.w	#1,(word_FFFFFF0A).w
		rts
; ---------------------------------------------------------------------------
word_7D26:	dc.w $8100		; DATA XREF: ROM:00007CAAw
		dc.w $9A
		dc.w 6
word_7D2C:	dc.w $8100		; DATA XREF: ROM:loc_7CE8w
		dc.w $290
		dc.w $17
word_7D32:	dc.w $8100		; DATA XREF: ROM:00007CBCw
		dc.w $58C
		dc.w 2
word_7D38:	dc.w $8100		; DATA XREF: ROM:00007CC6w
		dc.w $5AE
		dc.w 3
word_7D3E:	dc.w $8100		; DATA XREF: ROM:loc_7D04w
		dc.w $9AC
		dc.w $E
word_7D44:	dc.w $8100		; DATA XREF: ROM:00007D0Ew
		dc.w $AA0
		dc.w $F
		dc.w $8100
		dc.w $B1C
		dc.w $F
; ---------------------------------------------------------------------------

loc_7D50:				; CODE XREF: ROM:00007C94j
		lea	$4000(a4),a1
		move.w	#6,d0
		jsr	byte_FFFFFDAE
		bcs.s	loc_7D66
		move.w	#$8081,0(a4)
		bra.s	loc_7D74
; ---------------------------------------------------------------------------

loc_7D66:				; CODE XREF: ROM:00007D5Cj
		move.w	#0,0(a4)
		clr.w	2(a4)
		clr.w	4(a4)

loc_7D74:				; CODE XREF: ROM:00007D64j
		move.w	#$C,(word_FFFFFF04).w
		rts
; ---------------------------------------------------------------------------

loc_7D7C:				; CODE XREF: ROM:00007506j
		lea	(WordRAM_Bank0).l,a4
		moveq	#$7C,d0	; '|'
		and.w	(word_FFFFFF04).w,d0
		jsr	loc_7D8E(pc,d0.w)
		rts
; ---------------------------------------------------------------------------

loc_7D8E:
		bra.w	loc_7DA6
; ---------------------------------------------------------------------------
		bra.w	sub_7E3E
; ---------------------------------------------------------------------------
		bra.w	sub_800C
; ---------------------------------------------------------------------------
		bra.w	sub_7DD2
; ---------------------------------------------------------------------------
		bra.w	sub_80AA
; ---------------------------------------------------------------------------
		bra.w	sub_7C34
; ---------------------------------------------------------------------------

loc_7DA6:				; CODE XREF: ROM:loc_7D8Ej
		bsr.w	sub_7DE2
		movem.w	word_7DC6(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_7DCC(pc),d0-d2
		bsr.w	sub_77FA
		move.w	#4,(word_FFFFFF04).w
		rts
; ---------------------------------------------------------------------------
word_7DC6:	dc.w $8100		; DATA XREF: ROM:00007DAAw
		dc.w $96
		dc.w 7
word_7DCC:	dc.w $8100		; DATA XREF: ROM:00007DB4w
		dc.w $290
		dc.w $12

; =============== S U B	R O U T	I N E =======================================


sub_7DD2:				; CODE XREF: ROM:00007D9Aj
		move.w	#8,d0
		bsr.w	sub_73CA
		move.w	#$10,(word_FFFFFF04).w
		rts
; End of function sub_7DD2


; =============== S U B	R O U T	I N E =======================================


sub_7DE2:				; CODE XREF: ROM:loc_7DA6p sub_814Ep ...
		clr.l	(dword_220E00).l
		clr.l	(word_FFFFFF0A).w
		bsr.w	sub_7876
		movem.w	word_7E26(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_7E2C(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_7E32(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_7E38(pc),d0-d2
		bsr.w	sub_77FA
		lea	$4000(a4),a0
		move.w	#$410,d0
		moveq	#0,d1
		bra.w	sub_783E
; End of function sub_7DE2

; ---------------------------------------------------------------------------
word_7E26:	dc.w $8100		; DATA XREF: sub_7DE2+Ew
		dc.w $58A
		dc.w $18
word_7E2C:	dc.w $8100		; DATA XREF: sub_7DE2+18w
		dc.w $5A4
		dc.w $18
word_7E32:	dc.w $8100		; DATA XREF: sub_7DE2+22w
		dc.w $5B8
		dc.w $23
word_7E38:	dc.w $8100		; DATA XREF: sub_7DE2+2Cw
		dc.w $68A
		dc.w $13

; =============== S U B	R O U T	I N E =======================================


sub_7E3E:				; CODE XREF: ROM:00007D92j
		bset	#7,(word_FFFFFF04).w
		bne.s	loc_7E56
		clr.w	$A(a4)
		clr.w	$C(a4)
		bsr.w	sub_7EA8
		clr.w	(word_FFFFFF08).w

loc_7E56:				; CODE XREF: sub_7E3E+6j
		bsr.s	sub_7E6C
		bsr.w	sub_7A1E
		beq.s	locret_7E6A
		moveq	#$FFFFFF91,d7
		bsr.w	loc_109C
		move.w	#8,(word_FFFFFF04).w

locret_7E6A:				; CODE XREF: sub_7E3E+1Ej
		rts
; End of function sub_7E3E


; =============== S U B	R O U T	I N E =======================================


sub_7E6C:				; CODE XREF: sub_7E3E:loc_7E56p
					; sub_82F2:loc_8306p
		bsr.w	sub_7F66
		move.w	(word_FFFFFF0C).w,d0
		bmi.s	loc_7E8A
		beq.s	loc_7E98
		moveq	#$A,d1
		add.w	$A(a4),d1
		cmp.w	4(a4),d1
		beq.s	loc_7E98
		add.w	d0,$A(a4)
		bra.s	loc_7E94
; ---------------------------------------------------------------------------

loc_7E8A:				; CODE XREF: sub_7E6C+8j
		add.w	$A(a4),d0
		bmi.s	loc_7E98
		move.w	d0,$A(a4)

loc_7E94:				; CODE XREF: sub_7E6C+1Cj
		bsr.w	sub_7EA8

loc_7E98:				; CODE XREF: sub_7E6C+Aj sub_7E6C+16j	...
		move.w	$A(a4),d0
		move.w	(word_FFFFFF0A).w,d1
		add.w	d1,d0
		move.w	d0,$C(a4)
		rts
; End of function sub_7E6C


; =============== S U B	R O U T	I N E =======================================


sub_7EA8:				; CODE XREF: sub_7E3E+10p
					; sub_7E6C:loc_7E94p ...
		lea	$80(a4),a0
		moveq	#9,d0

loc_7EAE:				; CODE XREF: sub_7EA8+Ej
		clr.l	(a0)+
		clr.l	(a0)+
		clr.l	(a0)+
		clr.l	(a0)+
		dbf	d0,loc_7EAE
		move.w	#4,d0
		bsr.w	sub_73CA
		lea	$80(a4),a0
		bsr.w	sub_7F40

loc_7ECA:				; CODE XREF: sub_81FC+30j
		lea	$80(a4),a2
		moveq	#$A,d7
		cmp.w	4(a4),d7
		ble.s	loc_7EDA
		move.w	4(a4),d7

loc_7EDA:				; CODE XREF: sub_7EA8+2Cj
		subq.w	#1,d7
		move.w	$A(a4),d6
		moveq	#0,d5

loc_7EE2:				; CODE XREF: sub_7EA8+82j
		moveq	#1,d0
		add.w	d6,d0
		lea	(WordRAM_Bank1).l,a0
		move.w	d5,d2
		lsl.w	#7,d2
		addi.w	#$806,d2
		adda.w	d2,a0
		move.w	#$A030,d1
		bsr.w	sub_7892
		move.w	#$8000,d1
		lea	(a2),a1
		adda.w	#$E,a0
		move.w	#$A000,d1
		bsr.w	sub_7F30
		moveq	#0,d0
		move.w	$E(a2),d0
		adda.w	#2,a0
		move.w	#$A030,d1
		bsr.w	sub_7892
		lea	$10(a2),a2
		addq.w	#1,d5
		addq.w	#1,d6
		dbf	d7,loc_7EE2
		rts
; End of function sub_7EA8


; =============== S U B	R O U T	I N E =======================================


sub_7F30:				; CODE XREF: sub_7EA8+64p
		moveq	#$A,d2

loc_7F32:				; CODE XREF: sub_7F30+Aj
		moveq	#0,d0
		move.b	(a1)+,d0
		add.w	d1,d0
		move.w	d0,(a0)+
		dbf	d2,loc_7F32
		rts
; End of function sub_7F30


; =============== S U B	R O U T	I N E =======================================


sub_7F40:				; CODE XREF: sub_7EA8+1Ep sub_81FC+2Cp
		moveq	#9,d0

loc_7F42:				; CODE XREF: sub_7F40+20j
		lea	(a0),a1
		move.w	d0,-(sp)
		moveq	#$A,d0

loc_7F48:				; CODE XREF: sub_7F40+16j
		moveq	#$7F,d1	; ''
		and.b	(a1),d1
		cmpi.b	#$20,d1	; ' '
		bcc.s	loc_7F54
		moveq	#$20,d1	; ' '

loc_7F54:				; CODE XREF: sub_7F40+10j
		move.b	d1,(a1)+
		dbf	d0,loc_7F48
		lea	$10(a0),a0
		move.w	(sp)+,d0
		dbf	d0,loc_7F42
		rts
; End of function sub_7F40


; =============== S U B	R O U T	I N E =======================================


sub_7F66:				; CODE XREF: sub_7E6Cp	sub_81C0p
		bsr.w	sub_790A
		moveq	#0,d1
		move.w	(word_FFFFFF0A).w,d1
		cmpi.w	#$A,4(a4)
		blt.s	loc_7F9C
		tst.w	d1
		bmi.s	loc_7F92
		cmpi.w	#9,d1
		bgt.s	loc_7F88
		clr.w	(word_FFFFFF0C).w
		bra.s	loc_7FC4
; ---------------------------------------------------------------------------

loc_7F88:				; CODE XREF: sub_7F66+1Aj
		moveq	#9,d1
		move.w	#1,(word_FFFFFF0C).w
		bra.s	loc_7FC4
; ---------------------------------------------------------------------------

loc_7F92:				; CODE XREF: sub_7F66+14j
		moveq	#0,d1
		move.w	#$FFFF,(word_FFFFFF0C).w
		bra.s	loc_7FC4
; ---------------------------------------------------------------------------

loc_7F9C:				; CODE XREF: sub_7F66+10j
		tst.w	d1
		bmi.s	loc_7FAC
		cmp.w	4(a4),d1
		bge.s	loc_7FB4
		clr.w	(word_FFFFFF0C).w
		bra.s	loc_7FC4
; ---------------------------------------------------------------------------

loc_7FAC:				; CODE XREF: sub_7F66+38j
		moveq	#0,d1
		clr.w	(word_FFFFFF0C).w
		bra.s	loc_7FC4
; ---------------------------------------------------------------------------

loc_7FB4:				; CODE XREF: sub_7F66+3Ej
		move.w	4(a4),d1
		subq.w	#1,d1
		clr.w	(word_FFFFFF0C).w
		bra.s	loc_7FC4
; ---------------------------------------------------------------------------
		clr.w	(word_FFFFFF0C).w

loc_7FC4:				; CODE XREF: sub_7F66+20j sub_7F66+2Aj ...
		move.w	d1,(word_FFFFFF0A).w
		lsl.w	#4,d1
		lea	$80(a4),a0
		adda.w	d1,a0
		pea	(a0)
		lea	$120(a4),a1
		moveq	#$A,d0

loc_7FD8:				; CODE XREF: sub_7F66+74j
		move.b	(a0)+,(a1)+
		dbf	d0,loc_7FD8
		movea.l	(sp)+,a0
		move.w	$E(a0),$12C(a4)
		move.b	$B(a0),$12B(a4)
		moveq	#0,d1
		move.w	(word_FFFFFF0A).w,d1
		lsl.w	#3,d1
		addi.w	#$100,d1
		swap	d1
		move.w	#$C01,d1

loc_7FFE:
		move.l	#$1000A8,d2
		moveq	#6,d0
		moveq	#$20,d3	; ' '
		bra.w	loc_77D2
; End of function sub_7F66


; =============== S U B	R O U T	I N E =======================================


sub_800C:				; CODE XREF: ROM:00007D96j
					; ROM:0000813Ej
		bset	#7,(word_FFFFFF04).w
		bne.s	loc_8066
		clr.l	(dword_220E00).l
		lea	(dword_220E00).l,a0
		move.w	#$8F,d4	; ''
		bsr.w	loc_7880
		movem.w	word_8092(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_8098(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_809E(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_80A4(pc),d0-d2
		bsr.w	sub_77FA
		lea	$120(a4),a0
		move.w	#$71E,d0
		move.w	#(loc_7FFE+2),d1
		bsr.w	sub_783E
		move.w	#1,(word_FFFFFF0A).w

loc_8066:				; CODE XREF: sub_800C+6j
		bsr.w	sub_80FA
		bsr.w	sub_7A1E
		beq.s	locret_8082
		tst.w	(word_FFFFFF0A).w
		bne.s	loc_8084
		moveq	#$FFFFFF91,d7
		bsr.w	loc_109C
		move.w	#$C,(word_FFFFFF04).w

locret_8082:				; CODE XREF: sub_800C+62j
		rts
; ---------------------------------------------------------------------------

loc_8084:				; CODE XREF: sub_800C+68j
		moveq	#$FFFFFF90,d7
		bsr.w	loc_109C
		move.w	#$14,(word_FFFFFF04).w
		rts
; End of function sub_800C

; ---------------------------------------------------------------------------
word_8092:	dc.w $8100		; DATA XREF: sub_800C+1Cw
		dc.w $692
		dc.w $18
word_8098:	dc.w $8100		; DATA XREF: sub_800C+26w
		dc.w $594
		dc.w $14
word_809E:	dc.w $8100		; DATA XREF: sub_800C+30w
		dc.w $6B8
		dc.w $15
word_80A4:	dc.w $8100		; DATA XREF: sub_800C+3Aw
		dc.w $79A
		dc.w $F

; =============== S U B	R O U T	I N E =======================================


sub_80AA:				; CODE XREF: ROM:00007D9Ej
					; ROM:00008146j
		bset	#7,(word_FFFFFF04).w
		bne.s	loc_80DA
		clr.l	(dword_220E00).l
		lea	(dword_220E00).l,a0
		move.w	#$BF,d4	; '¿'
		bsr.w	loc_7880
		movem.w	word_80EE(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_80F4(pc),d0-d2
		bsr.w	sub_77FA

loc_80DA:				; CODE XREF: sub_80AA+6j
		bsr.w	sub_7A1E
		beq.s	locret_80EC
		moveq	#$FFFFFF91,d7
		bsr.w	loc_109C
		move.w	#$14,(word_FFFFFF04).w

locret_80EC:				; CODE XREF: sub_80AA+34j
		rts
; End of function sub_80AA

; ---------------------------------------------------------------------------
word_80EE:	dc.w $8100		; DATA XREF: sub_80AA+1Cw
		dc.w $398
		dc.w $16
word_80F4:	dc.w $8100		; DATA XREF: sub_80AA+26w
		dc.w $698
		dc.w $11

; =============== S U B	R O U T	I N E =======================================


sub_80FA:				; CODE XREF: sub_800C:loc_8066p
					; sub_834E:loc_83B2p
		bsr.w	sub_7C0A
		moveq	#0,d2
		move.w	(word_FFFFFF0A).w,d2
		mulu.w	#$28,d2	; '('
		addi.w	#$E4,d2	; 'ä'
		swap	d2
		move.w	#$10,d2
		swap	d2
		move.l	#$F80D01,d1
		moveq	#0,d0
		moveq	#$20,d3	; ' '
		bsr.w	loc_77D2
		rts
; End of function sub_80FA


; =============== S U B	R O U T	I N E =======================================


sub_8124:				; CODE XREF: ROM:0000750Aj
		lea	(unk_210000).l,a4
		moveq	#$7C,d0	; '|'
		and.w	(word_FFFFFF04).w,d0
		jsr	loc_8136(pc,d0.w)
		rts
; End of function sub_8124

; ---------------------------------------------------------------------------

loc_8136:
		bra.w	sub_814E
; ---------------------------------------------------------------------------
		bra.w	sub_8192
; ---------------------------------------------------------------------------
		bra.w	sub_800C
; ---------------------------------------------------------------------------
		bra.w	sub_817A
; ---------------------------------------------------------------------------
		bra.w	sub_80AA
; ---------------------------------------------------------------------------
		bra.w	sub_7C34

; =============== S U B	R O U T	I N E =======================================


sub_814E:				; CODE XREF: ROM:loc_8136j
		bsr.w	sub_7DE2
		movem.w	word_816E(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_8174(pc),d0-d2
		bsr.w	sub_77FA
		move.w	#4,(word_FFFFFF04).w
		rts
; End of function sub_814E

; ---------------------------------------------------------------------------
word_816E:	dc.w $8100		; DATA XREF: sub_814E+4w
		dc.w $96
		dc.w 8
word_8174:	dc.w $8100		; DATA XREF: sub_814E+Ew
		dc.w $290
		dc.w $17

; =============== S U B	R O U T	I N E =======================================


sub_817A:				; CODE XREF: ROM:00008142j
					; sub_82A4:loc_82E6p
		clr.b	$12B(a4)
		lea	$120(a4),a0
		move.w	#5,d0
		jsr	byte_FFFFFDAE
		move.w	#$10,(word_FFFFFF04).w
		rts
; End of function sub_817A


; =============== S U B	R O U T	I N E =======================================


sub_8192:				; CODE XREF: ROM:0000813Aj
		bset	#7,(word_FFFFFF04).w
		bne.s	loc_81AA
		clr.w	$A(a4)
		clr.w	$C(a4)
		bsr.w	sub_81FC
		clr.w	(word_FFFFFF08).w

loc_81AA:				; CODE XREF: sub_8192+6j
		bsr.s	sub_81C0
		bsr.w	sub_7A1E
		beq.s	locret_81BE
		moveq	#$FFFFFF91,d7
		bsr.w	loc_109C
		move.w	#8,(word_FFFFFF04).w

locret_81BE:				; CODE XREF: sub_8192+1Ej
		rts
; End of function sub_8192


; =============== S U B	R O U T	I N E =======================================


sub_81C0:				; CODE XREF: sub_8192:loc_81AAp
					; sub_866A:loc_867Ep
		bsr.w	sub_7F66
		move.w	(word_FFFFFF0C).w,d0
		bmi.s	loc_81DE
		beq.s	loc_81EC
		moveq	#$A,d1
		add.w	$A(a4),d1
		cmp.w	4(a4),d1
		beq.s	loc_81EC
		add.w	d0,$A(a4)
		bra.s	loc_81E8
; ---------------------------------------------------------------------------

loc_81DE:				; CODE XREF: sub_81C0+8j
		add.w	$A(a4),d0
		bmi.s	loc_81EC
		move.w	d0,$A(a4)

loc_81E8:				; CODE XREF: sub_81C0+1Cj
		bsr.w	sub_81FC

loc_81EC:				; CODE XREF: sub_81C0+Aj sub_81C0+16j	...
		move.w	$A(a4),d0
		move.w	(word_FFFFFF0A).w,d1
		add.w	d1,d0
		move.w	d0,$C(a4)
		rts
; End of function sub_81C0


; =============== S U B	R O U T	I N E =======================================


sub_81FC:				; CODE XREF: sub_8192+10p
					; sub_81C0:loc_81E8p ...
		lea	$80(a4),a0
		moveq	#9,d0

loc_8202:				; CODE XREF: sub_81FC+Ej
		clr.l	(a0)+
		clr.l	(a0)+
		clr.l	(a0)+
		clr.l	(a0)+
		dbf	d0,loc_8202
		move.w	$A(a4),d1
		swap	d1
		move.w	#$A,d1
		lea	$80(a4),a1
		lea	sub_8230(pc),a0
		move.w	#7,d0
		jsr	byte_FFFFFDAE
		bsr.w	sub_7F40
		bra.w	loc_7ECA
; End of function sub_81FC


; =============== S U B	R O U T	I N E =======================================


sub_8230:				; DATA XREF: sub_81FC+20o
		move.l	$2A2A(a2),d5
		move.l	$2A2A(a2),d5
		move.l	$2A00(a2),d5

loc_823C:				; CODE XREF: ROM:0000750Ej
		lea	(unk_210000).l,a3
		lea	(WordRAM_Bank0).l,a4
		moveq	#$7C,d0	; '|'
		and.w	(word_FFFFFF04).w,d0
		jsr	loc_8254(pc,d0.w)
		rts
; End of function sub_8230

; ---------------------------------------------------------------------------

loc_8254:
		bra.w	sub_8278
; ---------------------------------------------------------------------------
		bra.w	sub_82F2
; ---------------------------------------------------------------------------
		bra.w	sub_834E
; ---------------------------------------------------------------------------
		bra.w	sub_82A4
; ---------------------------------------------------------------------------
		bra.w	sub_83FC
; ---------------------------------------------------------------------------
		bra.w	sub_7C34
; ---------------------------------------------------------------------------
		bra.w	sub_844C
; ---------------------------------------------------------------------------
		bra.w	sub_84DC
; ---------------------------------------------------------------------------
		bra.w	sub_8562

; =============== S U B	R O U T	I N E =======================================


sub_8278:				; CODE XREF: ROM:loc_8254j
		bsr.w	sub_7DE2
		movem.w	word_8298(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_829E(pc),d0-d2
		bsr.w	sub_77FA
		move.w	#4,(word_FFFFFF04).w
		rts
; End of function sub_8278

; ---------------------------------------------------------------------------
word_8298:	dc.w $8100		; DATA XREF: sub_8278+4w
		dc.w $92
		dc.w 9
word_829E:	dc.w $8100		; DATA XREF: sub_8278+Ew
		dc.w $290
		dc.w $12

; =============== S U B	R O U T	I N E =======================================


sub_82A4:				; CODE XREF: ROM:00008260j
		move.w	#5,d0
		bsr.w	sub_73CA
		moveq	#2,d7

loc_82AE:				; CODE XREF: sub_82A4+2Cj
		lea	$120(a4),a0
		lea	$130(a4),a1
		move.w	#4,d0
		jsr	byte_FFFFFDAE
		bcs.s	loc_82DE
		lea	$120(a4),a0
		lea	$130(a4),a1
		move.w	#8,d0
		jsr	byte_FFFFFDAE
		dbcc	d7,loc_82AE
		bcs.s	loc_82E6
		move.w	#$10,(word_FFFFFF04).w
		rts
; ---------------------------------------------------------------------------

loc_82DE:				; CODE XREF: sub_82A4+1Aj
		move.w	#$18,(word_FFFFFF04).w
		rts
; ---------------------------------------------------------------------------

loc_82E6:				; CODE XREF: sub_82A4+30j
		bsr.w	sub_817A
		move.w	#$20,(word_FFFFFF04).w ; ' '
		rts
; End of function sub_82A4


; =============== S U B	R O U T	I N E =======================================


sub_82F2:				; CODE XREF: ROM:00008258j
		bset	#7,(word_FFFFFF04).w
		bne.s	loc_8306
		clr.w	$A(a4)
		clr.w	$C(a4)
		bsr.w	sub_7EA8

loc_8306:				; CODE XREF: sub_82F2+6j
		bsr.w	sub_7E6C
		bsr.w	sub_7A1E
		bne.s	loc_8312
		rts
; ---------------------------------------------------------------------------

loc_8312:				; CODE XREF: sub_82F2+1Cj
		lea	$120(a4),a0
		move.w	#2,d0
		clr.b	$12B(a4)
		jsr	byte_FFFFFDAE
		bcs.s	loc_832C
		move.w	#$1C,(word_FFFFFF04).w
		rts
; ---------------------------------------------------------------------------

loc_832C:				; CODE XREF: sub_82F2+30j sub_866A+30j
		move.w	$12C(a4),d0
		move.w	2(a3),d1
		cmp.w	d0,d1
		bge.s	loc_8340
		move.w	#$18,(word_FFFFFF04).w
		rts
; ---------------------------------------------------------------------------

loc_8340:				; CODE XREF: sub_82F2+44j
		moveq	#$FFFFFF91,d7
		bsr.w	loc_109C
		move.w	#8,(word_FFFFFF04).w
		rts
; End of function sub_82F2


; =============== S U B	R O U T	I N E =======================================


sub_834E:				; CODE XREF: ROM:0000825Cj
					; ROM:000085E8j
		bset	#7,(word_FFFFFF04).w
		bne.s	loc_83B2
		clr.l	(dword_220E00).l
		lea	(unk_220D00).l,a0
		move.w	#$87,d4	; '‡'
		bsr.w	loc_7880
		movem.w	word_83DE(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_83E4(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_83EA(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_83F0(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_83F6(pc),d0-d2
		bsr.w	sub_77FA
		lea	$120(a4),a0
		move.w	#$71E,d0
		move.w	#(loc_7FFE+2),d1
		bsr.w	sub_783E
		move.w	#1,(word_FFFFFF0A).w

loc_83B2:				; CODE XREF: sub_834E+6j
		bsr.w	sub_80FA
		bsr.w	sub_7A1E
		beq.s	locret_83CE
		tst.w	(word_FFFFFF0A).w
		bne.s	loc_83D0
		moveq	#$FFFFFF91,d7
		bsr.w	loc_109C
		move.w	#$C,(word_FFFFFF04).w

locret_83CE:				; CODE XREF: sub_834E+6Cj
		rts
; ---------------------------------------------------------------------------

loc_83D0:				; CODE XREF: sub_834E+72j
		moveq	#$FFFFFF90,d7
		bsr.w	loc_109C
		move.w	#$14,(word_FFFFFF04).w
		rts
; End of function sub_834E

; ---------------------------------------------------------------------------
word_83DE:	dc.w $8100		; DATA XREF: sub_834E+1Cw
		dc.w $692
		dc.w $18
word_83E4:	dc.w $8100		; DATA XREF: sub_834E+26w
		dc.w $594
		dc.w $20
word_83EA:	dc.w $8100		; DATA XREF: sub_834E+30w
		dc.w $6B8
		dc.w $15
word_83F0:	dc.w $8100		; DATA XREF: sub_834E+3Aw
		dc.w $79A
		dc.w $F
word_83F6:	dc.w $8100		; DATA XREF: sub_834E+44w
		dc.w $998
		dc.w $11

; =============== S U B	R O U T	I N E =======================================


sub_83FC:				; CODE XREF: ROM:00008264j
					; ROM:000085F0j
		bset	#7,(word_FFFFFF04).w
		bne.s	loc_842C
		clr.l	(dword_220E00).l
		lea	(dword_220E00).l,a0
		move.w	#$BF,d4	; '¿'
		bsr.w	loc_7880
		movem.w	word_8440(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_8446(pc),d0-d2
		bsr.w	sub_77FA

loc_842C:				; CODE XREF: sub_83FC+6j
		bsr.w	sub_7A1E
		beq.s	locret_843E
		moveq	#$FFFFFF91,d7
		bsr.w	loc_109C
		move.w	#$14,(word_FFFFFF04).w

locret_843E:				; CODE XREF: sub_83FC+34j
		rts
; End of function sub_83FC

; ---------------------------------------------------------------------------
word_8440:	dc.w $8100		; DATA XREF: sub_83FC+1Cw
		dc.w $398
		dc.w $1C
word_8446:	dc.w $8100		; DATA XREF: sub_83FC+26w
		dc.w $698
		dc.w $11

; =============== S U B	R O U T	I N E =======================================


sub_844C:				; CODE XREF: ROM:0000826Cj
					; ROM:000085F8j
		bset	#7,(word_FFFFFF04).w
		bne.s	loc_84AE
		clr.l	(dword_220E00).l
		lea	(dword_220E00).l,a0
		move.w	#$B7,d4	; '·'
		bsr.w	loc_7880
		movem.w	word_84C2(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_84C8(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_84CE(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_84D4(pc),d0-d2
		bsr.w	sub_77FA
		lea	$120(a4),a0
		move.w	#$512,d0
		move.w	#(loc_7FFE+2),d1
		bsr.w	sub_783E
		lea	word_84DA(pc),a0
		bsr.w	loc_7846
		moveq	#$FFFFFF92,d7
		bsr.w	loc_109C

loc_84AE:				; CODE XREF: sub_844C+6j
		bsr.w	sub_7A1E
		beq.s	locret_84C0
		move.w	#$14,(word_FFFFFF04).w
		moveq	#$FFFFFF91,d7
		bsr.w	loc_109C

locret_84C0:				; CODE XREF: sub_844C+66j
		rts
; End of function sub_844C

; ---------------------------------------------------------------------------
word_84C2:	dc.w $8100		; DATA XREF: sub_844C+1Cw
		dc.w $290
		dc.w $19
word_84C8:	dc.w $8100		; DATA XREF: sub_844C+26w
		dc.w $390
		dc.w $22
word_84CE:	dc.w $8100		; DATA XREF: sub_844C+30w
		dc.w $690
		dc.w $1A
word_84D4:	dc.w $8100		; DATA XREF: sub_844C+3Aw
		dc.w $898
		dc.w $11
word_84DA:	dc.w $2E00		; DATA XREF: sub_844C+54o

; =============== S U B	R O U T	I N E =======================================


sub_84DC:				; CODE XREF: ROM:00008270j
					; ROM:000085FCj
		bset	#7,(word_FFFFFF04).w
		bne.s	loc_8536
		clr.l	(dword_220E00).l
		lea	(dword_220E00).l,a0
		move.w	#$B7,d4	; '·'
		bsr.w	loc_7880
		movem.w	word_854A(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_8550(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_8556(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_855C(pc),d0-d2
		bsr.w	sub_77FA
		lea	$120(a4),a0
		move.w	#$412,d0
		move.w	#(loc_7FFE+2),d1
		bsr.w	sub_783E
		moveq	#$FFFFFF92,d7
		bsr.w	loc_109C

loc_8536:				; CODE XREF: sub_84DC+6j
		bsr.w	sub_7A1E
		beq.s	locret_8548
		move.w	#$14,(word_FFFFFF04).w
		moveq	#$FFFFFF91,d7
		bsr.w	loc_109C

locret_8548:				; CODE XREF: sub_84DC+5Ej
		rts
; End of function sub_84DC

; ---------------------------------------------------------------------------
word_854A:	dc.w $8100		; DATA XREF: sub_84DC+1Cw
		dc.w $290
		dc.w $1B
word_8550:	dc.w $8100		; DATA XREF: sub_84DC+26w
		dc.w $490
		dc.w $25
word_8556:	dc.w $8100		; DATA XREF: sub_84DC+30w
		dc.w $790
		dc.w $1A
word_855C:	dc.w $8100		; DATA XREF: sub_84DC+3Aw
		dc.w $998
		dc.w $11

; =============== S U B	R O U T	I N E =======================================


sub_8562:				; CODE XREF: ROM:00008274j
					; ROM:00008600j
		bset	#7,(word_FFFFFF04).w
		bne.s	loc_85A8
		clr.l	(dword_220E00).l
		lea	(dword_220E00).l,a0
		move.w	#$B7,d4	; '·'
		bsr.w	loc_7880
		movem.w	word_85BC(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_85C2(pc),d0-d2
		bsr.w	sub_77FA
		lea	$120(a4),a0
		move.w	#$410,d0
		move.w	#(loc_7FFE+2),d1
		bsr.w	sub_783E
		moveq	#$FFFFFF92,d7
		bsr.w	loc_109C

loc_85A8:				; CODE XREF: sub_8562+6j
		bsr.w	sub_7A1E
		beq.s	locret_85BA
		move.w	#$14,(word_FFFFFF04).w
		moveq	#$FFFFFF91,d7
		bsr.w	loc_109C

locret_85BA:				; CODE XREF: sub_8562+4Aj
		rts
; End of function sub_8562

; ---------------------------------------------------------------------------
word_85BC:	dc.w $8100		; DATA XREF: sub_8562+1Cw
		dc.w $590
		dc.w $1A
word_85C2:	dc.w $8100		; DATA XREF: sub_8562+26w
		dc.w $798
		dc.w $11

; =============== S U B	R O U T	I N E =======================================


sub_85C8:				; CODE XREF: ROM:00007512j
		lea	(WordRAM_Bank0).l,a3
		lea	(unk_210000).l,a4
		moveq	#$7C,d0	; '|'
		and.w	(word_FFFFFF04).w,d0
		jsr	loc_85E0(pc,d0.w)
		rts
; End of function sub_85C8

; ---------------------------------------------------------------------------

loc_85E0:
		bra.w	sub_8604
; ---------------------------------------------------------------------------
		bra.w	sub_866A
; ---------------------------------------------------------------------------
		bra.w	sub_834E
; ---------------------------------------------------------------------------
		bra.w	sub_8630
; ---------------------------------------------------------------------------
		bra.w	sub_83FC
; ---------------------------------------------------------------------------
		bra.w	sub_7C34
; ---------------------------------------------------------------------------
		bra.w	sub_844C
; ---------------------------------------------------------------------------
		bra.w	sub_84DC
; ---------------------------------------------------------------------------
		bra.w	sub_8562

; =============== S U B	R O U T	I N E =======================================


sub_8604:				; CODE XREF: ROM:loc_85E0j
		bsr.w	sub_7DE2
		movem.w	word_8624(pc),d0-d2
		bsr.w	sub_77FA
		movem.w	word_862A(pc),d0-d2
		bsr.w	sub_77FA
		move.w	#4,(word_FFFFFF04).w
		rts
; End of function sub_8604

; ---------------------------------------------------------------------------
word_8624:	dc.w $8100		; DATA XREF: sub_8604+4w
		dc.w $92
		dc.w $A
word_862A:	dc.w $8100		; DATA XREF: sub_8604+Ew
		dc.w $290
		dc.w $17

; =============== S U B	R O U T	I N E =======================================


sub_8630:				; CODE XREF: ROM:000085ECj
		lea	$120(a4),a0
		lea	$130(a4),a1
		clr.b	$12B(a4)
		move.w	#3,d0
		jsr	byte_FFFFFDAE
		move.w	d0,$12C(a4)
		move.b	d1,$12B(a4)
		move.w	#6,d0
		bsr.w	sub_73CA
		tst.w	$12E(a3)
		bmi.s	loc_8662
		move.w	#$10,(word_FFFFFF04).w
		rts
; ---------------------------------------------------------------------------

loc_8662:				; CODE XREF: sub_8630+28j
		move.w	#$20,(word_FFFFFF04).w ; ' '
		rts
; End of function sub_8630


; =============== S U B	R O U T	I N E =======================================


sub_866A:				; CODE XREF: ROM:000085E4j
		bset	#7,(word_FFFFFF04).w
		bne.s	loc_867E
		clr.w	$A(a4)
		clr.w	$C(a4)
		bsr.w	sub_81FC

loc_867E:				; CODE XREF: sub_866A+6j
		bsr.w	sub_81C0
		bsr.w	sub_7A1E
		bne.s	loc_868A
		rts
; ---------------------------------------------------------------------------

loc_868A:				; CODE XREF: sub_866A+1Cj
		clr.b	$12B(a4)
		move.w	#7,d0
		bsr.w	sub_73CA
		tst.w	$12E(a3)
		bne.w	loc_832C
		move.w	#$1C,(word_FFFFFF04).w
		rts
; End of function sub_866A


; =============== S U B	R O U T	I N E =======================================


sub_86A6:				; DATA XREF: sub_873A+20o
		btst	#GA_MEM_MODE_RET,(GA_MEM_MODE).l
		beq.s	loc_86E2
		move.l	#$74000003,(VDP_CONTROL).l
		lea	(dword_220E00).l,a0
		lea	(VDP_DATA).l,a1
		moveq	#$27,d0	; '''

loc_86C8:				; CODE XREF: sub_86A6+24j
		move.l	(a0)+,(a1)
		dbeq	d0,loc_86C8
		move.l	#$40000003,d0
		move.l	#WordRAM_Bank1,d1
		move.w	#$700,d2
		bsr.w	dmaTransferToVramWithRewrite

loc_86E2:				; CODE XREF: sub_86A6+8j
		moveq	#0,d0
		lea	(word_FFFFFF08).w,a1
		jsr	sub_18CE
		moveq	#1,d0
		lea	($FFFFFF09).w,a1
		jsr	sub_18CE
		lea	(unk_FFFFFE00).w,a0
		bsr.s	sub_8704
		lea	(unk_FFFFFE0C).w,a0

loc_8700:
		bsr.s	sub_8704
		rts
; End of function sub_86A6


; =============== S U B	R O U T	I N E =======================================


sub_8704:				; CODE XREF: sub_86A6+54p
					; sub_86A6:loc_8700p
		moveq	#3,d0
		and.b	1(a0),d0
		beq.s	loc_871E
		cmpi.b	#$C,$A(a0)
		bcs.s	loc_8734
		clr.b	$A(a0)
		st	$B(a0)
		rts
; ---------------------------------------------------------------------------

loc_871E:				; CODE XREF: sub_8704+6j
		clr.b	$B(a0)
		addq.b	#1,$A(a0)
		cmpi.b	#$40,$A(a0) ; '@'
		bcs.s	loc_8734
		move.b	#$40,$A(a0) ; '@'

loc_8734:				; CODE XREF: sub_8704+Ej sub_8704+28j
		clr.b	$B(a0)
		rts
; End of function sub_8704


; =============== S U B	R O U T	I N E =======================================


sub_873A:				; CODE XREF: sub_7374p
		st	(byte_FFFFFE28).w
		bsr.w	displayOff

loc_8742:				; CODE XREF: sub_873A+10j
		btst	#GA_MEM_MODE_MODE,(GA_MEM_MODE).l
		bne.s	loc_8742

loc_874C:				; CODE XREF: sub_873A+1Aj
		bset	#GA_MEM_MODE_DMNA,(GA_MEM_MODE).l
		beq.s	loc_874C
		bsr.w	waitForWordRam
		lea	sub_86A6,a1
		jsr	setVblankJumpTarget
		move.l	#0,(mainCommData+8).w
		lea	word_87FE(pc),a1
		bsr.w	loadVdpRegs
		bsr.w	clearAllVram
		bsr.w	sub_7876
		clr.l	(dword_220E00).l
		move.l	#$60000000,(VDP_CONTROL).l
		lea	(unk_15300).l,a1
		jsr	NemDec(pc)
		move.l	#$61C00000,(VDP_CONTROL).l
		lea	(unk_1546E).l,a1
		jsr	NemDec(pc)
		move.l	#$44000000,d0
		move.w	#0,(fontTileOffset).w
		move.l	#$EE0EE,d1
		bsr.w	loc_1952
		bsr.w	sub_7854
		lea	byte_881E(pc),a1
		bsr.w	loadPalettesToBuffer
		bsr.w	sub_1098
		lea	(word_FFFFFF00).w,a0
		moveq	#0,d0
		moveq	#3,d1

loc_87D6:				; CODE XREF: sub_873A+9Ej
		move.l	d0,(a0)+
		dbf	d1,loc_87D6
		clr.w	(unk_FFFFFE0A).w
		clr.w	(unk_FFFFFE16).w
		clr.b	(byte_FFFFFE28).w
		bra.w	displayOn
; End of function sub_873A


; =============== S U B	R O U T	I N E =======================================


sub_87EC:				; CODE XREF: ROM:000073ACj
		moveq	#$3B,d7	; ';'

loc_87EE:				; CODE XREF: sub_87EC+6j
		bsr.w	waitForVblank
		dbf	d7,loc_87EE
		move.w	#$FFFF,(word_FFFFFF00).w
		rts
; End of function sub_87EC

; ---------------------------------------------------------------------------
word_87FE:
	dc.w $8004 ; Reg #00: H-int off, H/V counter active
	dc.w $8124 ; Reg #01: Display/DMA off, V-int on, V28-cell (NTSC) mode
	dc.w $8230 ; Reg #02: Scroll A pattern table $C000
	dc.w $8334 ; Reg #03: Window pattern table $D000
	dc.w $8407 ; Reg #04: Scroll B pattern table $E000
	dc.w $857A ; Reg #05: Sprite attribute table $F400
	dc.w $8700 ; Reg #07: Background color palette 0, color 0
	dc.w $8A00 ; Reg #10: H-interrupt timing set to 0
	dc.w $8B02 ; Reg #11: Ext. Int off, H full scroll, V 2-cell scroll
	dc.w $8C81 ; Reg #12: H40-cell mode, Shadow/hilight off, no interlace
	dc.w $8D3C ; Reg #13: H-scroll data table $F000
	dc.w $8F02 ; Reg #15: Auto-increment VDP set to 2
	dc.w $9001 ; Reg #16: Scroll plane size 32V x 64H cells
	dc.w $9100 ; Reg #17: Window H position set to 0
	dc.w $9200 ; Reg #18: Window V position set to 0
	dc.w 0
byte_881E:	dc.b 0			; DATA XREF: sub_873A+88o
		dc.b $2F
		dc.w 0
		dc.w 0
		dc.w $C86
		dc.w $CCC
		dc.w $888
		dc.w $444
		dc.w $222
		dc.w $EEE
		dc.w $AC
		dc.w $666
		dc.w 0
		dc.w $444
		dc.w $888
		dc.w $EEE
		dc.w $EEE
		dc.w $A40
		dc.w 0
		dc.w 0
		dc.w $C86
		dc.w $888
		dc.w $666
		dc.w $222
		dc.w 0
		dc.w $AAA
		dc.w $AC
		dc.w $666
		dc.w 0
		dc.w $222
		dc.w $444
		dc.w $666
		dc.w $4EE
		dc.w 0
		dc.w 0
		dc.w $666
		dc.w $444
		dc.w $888
		dc.w $444
		dc.w 0
		dc.w 0
		dc.w 4
		dc.w $68
		dc.w 0
		dc.w 0
		dc.w $288
		dc.w $4AA
		dc.w $6CC
		dc.w $4EE
		dc.w 0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   1
		dc.b   1
		dc.b   1
		dc.b   0
		dc.b   1
		dc.b $57 ; W
		dc.b $A6 ; ¦
		dc.b $71 ; q
		dc.b $4B ; K
		dc.b $C6 ; Æ
		dc.b $19
		dc.b $A7 ; §
		dc.b $72 ; r
		dc.b $4C ; L
		dc.b $C7 ; Ç
		dc.b $1A
		dc.b   1
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   1
		dc.b   1
		dc.b $14
		dc.b $3A ; :
		dc.b $38 ; 8
		dc.b $12
		dc.b $1A
		dc.b   6
		dc.b $3B ; ;
		dc.b $39 ; 9
		dc.b $13
		dc.b $1B
		dc.b   7
		dc.b   1
a___________:	dc.b '___________',0    ; DATA XREF: ROM:00008F18o
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $40 ; @
aSega_cd_rom:	dc.b 'SEGA_CD_ROM',0    ; DATA XREF: ROM:00008F6Eo
		dc.b   1
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $52 ; R
		dc.b $41 ; A
		dc.b $4D ; M
		dc.b $5F ; _
		dc.b $43 ; C
		dc.b $41 ; A
		dc.b $52 ; R
		dc.b $54 ; T
		dc.b $52 ; R
		dc.b $49 ; I
		dc.b $44 ; D
		dc.b $47 ; G
		dc.b $45 ; E
		dc.b $5F ; _
		dc.b $5F ; _
		dc.b $5F ; _
off_88D6:	dc.l unk_600000		; DATA XREF: sub_98B2+38r sub_9922+Cr
off_88DA:	dc.l unk_7FFFFF		; DATA XREF: ROM:00008F10r sub_9922+4r
		dc.b $21 ; !
		dc.b $7A ; z
		dc.b   0
		dc.b  $C
		dc.b   0
		dc.b   2
		dc.b $30 ; 0
		dc.b $BA ; º
		dc.b   0
		dc.b   4
		dc.b $4E ; N
		dc.b $75 ; u
		dc.b $4E ; N
		dc.b $F9 ; ù
		dc.b   0
		dc.b   0
		dc.b $88 ; ˆ
		dc.b $F0 ; ð
		dc.b $48 ; H
		dc.b $E7 ; ç
		dc.b   0
		dc.b $24 ; $
		dc.b $2A ; *
		dc.b $7C ; |
		dc.b $FF
		dc.b $FF
		dc.b $FE ; þ
		dc.b $80 ; €
		dc.b $D0 ; Ð
		dc.b $40 ; @
		dc.b $D0 ; Ð
		dc.b $40 ; @
		dc.b $4E ; N
		dc.b $BB ; »
		dc.b   0
		dc.b $10
		dc.b $24 ; $
		dc.b $7A ; z
		dc.b $FF
		dc.b $D6 ; Ö
		dc.b   8
		dc.b $92 ; ’
		dc.b   0
		dc.b   0
		dc.b $4C ; L
		dc.b $DF ; ß
		dc.b $24 ; $
		dc.b   0
		dc.b $4E ; N
		dc.b $75 ; u
		dc.b $60 ; `
		dc.b   0
		dc.b   0
		dc.b $6A ; j
		dc.b $60 ; `
		dc.b   0
		dc.b   1
		dc.b $E6 ; æ
		dc.b $60 ; `
		dc.b   0
		dc.b   2
		dc.b $22 ; "
		dc.b $60 ; `
		dc.b   0
		dc.b   3
		dc.b $18
		dc.b $60 ; `
		dc.b   0
		dc.b   3
		dc.b $78 ; x
		dc.b $60 ; `
		dc.b   0
		dc.b   4
		dc.b $B2 ; ²
		dc.b $60 ; `
		dc.b   0
		dc.b   5
		dc.b $D2 ; Ò
		dc.b $60 ; `
		dc.b   0
		dc.b   6
		dc.b $64 ; d
		dc.b $60 ; `
		dc.b   0
		dc.b   2
		dc.b $84 ; „
		dc.b $60 ; `
		dc.b   0
		dc.b   0
		dc.b   6
		dc.b $60 ; `
		dc.b   0
		dc.b   0
		dc.b $12
		dc.b $22 ; "
		dc.b $7A ; z
		dc.b $FF
		dc.b $98 ; ˜
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b $40 ; @
		dc.b $C1 ; Á
		dc.b $49 ; I
		dc.b $61 ; a
		dc.b   0
		dc.b  $B
		dc.b $B4 ; ´
		dc.b $4E ; N
		dc.b $75 ; u
		dc.b $48 ; H
		dc.b $E7 ; ç
		dc.b   0
		dc.b $30 ; 0
		dc.b $24 ; $
		dc.b $7A ; z
		dc.b $FF
		dc.b $88 ; ˆ
		dc.b   8
		dc.b $D2 ; Ò
		dc.b   0
		dc.b   0
		dc.b $26 ; &
		dc.b $48 ; H
		dc.b $22 ; "
		dc.b $7A ; z
		dc.b $FF
		dc.b $7A ; z
		dc.b $24 ; $
		dc.b $49 ; I
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b $40 ; @
		dc.b $C1 ; Á
		dc.b $49 ; I
		dc.b $61 ; a
		dc.b   0
		dc.b  $C
		dc.b $F2 ; ò
		dc.b   1
		dc.b $4A ; J
		dc.b   0
		dc.b   0
		dc.b $B0 ; °
		dc.b $93 ; “
		dc.b $67 ; g
		dc.b   4
		dc.b $44 ; D
		dc.b $FC ; ü
		dc.b   0
		dc.b   1
		dc.b $4C ; L
		dc.b $DF ; ß
		dc.b  $C
		dc.b   0
		dc.b $4E ; N
		dc.b $75 ; u
		dc.b $48 ; H
		dc.b $E7 ; ç
		dc.b $20
		dc.b $38 ; 8
		dc.b $48 ; H
		dc.b $E7 ; ç
		dc.b   0
		dc.b $40 ; @
		dc.b $2B ; +
		dc.b $48 ; H
		dc.b   0
		dc.b   0
		dc.b $41 ; A
		dc.b $E8 ; è
		dc.b   2
		dc.b   0
		dc.b $2B ; +
		dc.b $48 ; H
		dc.b   0
		dc.b   4
		dc.b $41 ; A
		dc.b $E8 ; è
		dc.b   0
		dc.b $40 ; @
		dc.b $2B ; +
		dc.b $48 ; H
		dc.b   0
		dc.b   8
		dc.b $41 ; A
		dc.b $E8 ; è
		dc.b   1
		dc.b   0
		dc.b $2B ; +
		dc.b $48 ; H
		dc.b   0
		dc.b  $C
		dc.b $41 ; A
		dc.b $E8 ; è
		dc.b   1
		dc.b   0
		dc.b $2B ; +
		dc.b $48 ; H
		dc.b   0
		dc.b $10
		dc.b $41 ; A
		dc.b $E8 ; è
		dc.b   0
		dc.b $40 ; @
		dc.b $2B ; +
		dc.b $48 ; H
		dc.b   0
		dc.b $14
		dc.b $41 ; A
		dc.b $E8 ; è
		dc.b   0
		dc.b $40 ; @
		dc.b $2B ; +
		dc.b $48 ; H
		dc.b   0
		dc.b $18
		dc.b $41 ; A
		dc.b $E8 ; è
		dc.b   1
		dc.b   0
		dc.b $2B ; +
		dc.b $48 ; H
		dc.b   0
		dc.b $5A ; Z
		dc.b $41 ; A
		dc.b $E8 ; è
		dc.b   0
		dc.b $40 ; @
		dc.b $2B ; +
		dc.b $48 ; H
		dc.b   0
		dc.b $6A ; j
		dc.b $20
		dc.b $6D ; m
		dc.b   0
		dc.b   0
		dc.b $61 ; a
		dc.b   0
		dc.b   8
		dc.b $3E ; >
		dc.b $24 ; $
		dc.b $3C ; <
		dc.b   0
		dc.b   8
		dc.b   1
		dc.b   0
		dc.b $20
		dc.b $6D ; m
		dc.b   0
		dc.b $18
		dc.b $43 ; C
		dc.b $FA ; ú
		dc.b $FE ; þ
		dc.b $A4 ; ¤
		dc.b $26 ; &
		dc.b $6D ; m
		dc.b   0
		dc.b   8
		dc.b $28 ; (
		dc.b $6D ; m
		dc.b   0
		dc.b  $C
		dc.b $61 ; a
		dc.b   0
		dc.b   8
		dc.b $4C ; L
		dc.b $24 ; $
		dc.b $3C ; <
		dc.b   0
		dc.b   6
		dc.b   0
		dc.b $40 ; @
		dc.b $20
		dc.b $6D ; m
		dc.b   0
		dc.b $18
		dc.b $43 ; C
		dc.b $FA ; ú
		dc.b $FE ; þ
		dc.b $9E ; ž
		dc.b $26 ; &
		dc.b $6D ; m
		dc.b   0
		dc.b $10
		dc.b $28 ; (
		dc.b $6D ; m
		dc.b   0
		dc.b $14
		dc.b $61 ; a
		dc.b   0
		dc.b   8
		dc.b $32 ; 2
		dc.b $42 ; B
		dc.b $AD ; ­
		dc.b   0
		dc.b $30 ; 0
		dc.b $42 ; B
		dc.b $AD ; ­
		dc.b   0
		dc.b $34 ; 4
		dc.b $42 ; B
		dc.b $AD ; ­
		dc.b   0
		dc.b $66 ; f
		dc.b $4C ; L
		dc.b $DF ; ß
		dc.b   2
		dc.b   0
		dc.b $61 ; a
		dc.b   0
		dc.b  $E
		dc.b $9C ; œ
		dc.b $65 ; e
		dc.b   0
		dc.b   0
		dc.b $90 ; 
		dc.b $24 ; $
		dc.b $49 ; I
		dc.b $22 ; "
		dc.b $6D ; m
		dc.b   0
		dc.b $5A ; Z
		dc.b $20
		dc.b $6D ; m
		dc.b   0
		dc.b $38 ; 8
		dc.b $41 ; A
		dc.b $E8 ; è
		dc.b   0
		dc.b $60 ; `
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b $10
		dc.b $61 ; a
		dc.b   0
		dc.b  $A
		dc.b $CC ; Ì
		dc.b $22 ; "
		dc.b $4A ; J
		dc.b $24 ; $
		dc.b $6D ; m
		dc.b   0
		dc.b $5A ; Z
		dc.b $41 ; A
		dc.b $FA ; ú
		dc.b $FE ; þ
		dc.b $8C ; Œ
		dc.b $B5 ; µ
		dc.b $88 ; ˆ
		dc.b $67 ; g
		dc.b  $A
		dc.b $B5 ; µ
		dc.b $88 ; ˆ
		dc.b $67 ; g
		dc.b   6
		dc.b $B5 ; µ
		dc.b $88 ; ˆ
		dc.b $66 ; f
		dc.b   0
		dc.b   0
		dc.b $5C ; \
		dc.b $24 ; $
		dc.b $49 ; I
		dc.b $20
		dc.b $6D ; m
		dc.b   0
		dc.b $38 ; 8
		dc.b $41 ; A
		dc.b $E8 ; è
		dc.b   0
		dc.b $40 ; @
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b  $C
		dc.b $34 ; 4
		dc.b   1
		dc.b $61 ; a
		dc.b   0
		dc.b  $A
		dc.b $A0 ;  
		dc.b $22 ; "
		dc.b $4A ; J
		dc.b $45 ; E
		dc.b $FA ; ú
		dc.b $FE ; þ
		dc.b $54 ; T
		dc.b $32 ; 2
		dc.b   2
		dc.b $61 ; a
		dc.b   0
		dc.b  $C
		dc.b $18
		dc.b $66 ; f
		dc.b   0
		dc.b   0
		dc.b $58 ; X
		dc.b $20
		dc.b $2D ; -
		dc.b   0
		dc.b $30 ; 0
		dc.b $E0 ; à
		dc.b $80 ; €
		dc.b $EA ; ê
		dc.b $80 ; €
		dc.b $44 ; D
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b $4C ; L
		dc.b $DF ; ß
		dc.b $1C
		dc.b   4
		dc.b $4E ; N
		dc.b $75 ; u
		dc.b $24 ; $
		dc.b $49 ; I
		dc.b $34 ; 4
		dc.b   1
		dc.b $D4 ; Ô
		dc.b $42 ; B
		dc.b $D4 ; Ô
		dc.b $42 ; B
		dc.b $43 ; C
		dc.b $FA ; ú
		dc.b   0
		dc.b $52 ; R
		dc.b $22 ; "
		dc.b $71 ; q
		dc.b $20
		dc.b   0
		dc.b $34 ; 4
		dc.b   1
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b  $D
		dc.b $61 ; a
		dc.b   0
		dc.b  $C
		dc.b $1E
		dc.b $22 ; "
		dc.b $4A ; J
		dc.b $32 ; 2
		dc.b   2
		dc.b $44 ; D
		dc.b $FC ; ü
		dc.b   0
		dc.b   1
		dc.b $60 ; `
		dc.b $D6 ; Ö
		dc.b $61 ; a
		dc.b   0
		dc.b  $E
		dc.b $7C ; |
		dc.b $64 ; d
		dc.b  $A
		dc.b $70 ; p
		dc.b   0
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b   0
		dc.b $60 ; `
		dc.b   0
		dc.b $FF
		dc.b $CE ; Î
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b   1
		dc.b $20
		dc.b $2D ; -
		dc.b   0
		dc.b $30 ; 0
		dc.b $E0 ; à
		dc.b $80 ; €
		dc.b $EA ; ê
		dc.b $80 ; €
		dc.b $60 ; `
		dc.b   0
		dc.b $FF
		dc.b $BE ; ¾
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b  $B
		dc.b $61 ; a
		dc.b   0
		dc.b  $E
		dc.b $9E ; ž
		dc.b $65 ; e
		dc.b $E6 ; æ
		dc.b $20
		dc.b $2D ; -
		dc.b   0
		dc.b $30 ; 0
		dc.b $E0 ; à
		dc.b $80 ; €
		dc.b $EA ; ê
		dc.b $80 ; €
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b   2
		dc.b $60 ; `
		dc.b $C2 ; Â
		dc.b   0
		dc.b   0
		dc.b $8A ; Š
		dc.b $E4 ; ä
		dc.b   0
		dc.b   0
		dc.b $8A ; Š
		dc.b $F0 ; ð
		dc.b $4E ; N
		dc.b $4F ; O
		dc.b $54 ; T
		dc.b $5F ; _
		dc.b $45 ; E
		dc.b $58 ; X
		dc.b $49 ; I
		dc.b $53 ; S
		dc.b $54 ; T
		dc.b $5F ; _
		dc.b $5F ; _
		dc.b   0
		dc.b $55 ; U
		dc.b $4E ; N
		dc.b $46 ; F
		dc.b $4F ; O
		dc.b $52 ; R
		dc.b $4D ; M
		dc.b $41 ; A
		dc.b $54 ; T
		dc.b $5F ; _
		dc.b $5F ; _
		dc.b $5F ; _
		dc.b   0
		dc.b $48 ; H
		dc.b $E7 ; ç
		dc.b $30 ; 0
		dc.b $20
		dc.b $70 ; p
		dc.b   0
		dc.b $61 ; a
		dc.b   0
		dc.b  $D
		dc.b $56 ; V
		dc.b $65 ; e
		dc.b $26 ; &
		dc.b $36 ; 6
		dc.b   0
		dc.b $61 ; a
		dc.b   0
		dc.b  $D
		dc.b $7A ; z
		dc.b $65 ; e
		dc.b $1E
		dc.b $4A ; J
		dc.b $40 ; @
		dc.b $6C ; l
		dc.b   2
		dc.b $70 ; p
		dc.b   0
		dc.b $24 ; $
		dc.b $49 ; I
		dc.b $43 ; C
		dc.b $FA ; ú
		dc.b $FD ; ý
		dc.b $9C ; œ
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b  $C
		dc.b $61 ; a
		dc.b   0
		dc.b  $B
		dc.b $94 ; ”
		dc.b $22 ; "
		dc.b $4A ; J
		dc.b $32 ; 2
		dc.b   3
		dc.b $4C ; L
		dc.b $DF ; ß
		dc.b   4
		dc.b  $C
		dc.b $4E ; N
		dc.b $75 ; u
		dc.b $30 ; 0
		dc.b $3C ; <
		dc.b $FF
		dc.b $FF
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b $FF
		dc.b $FF
		dc.b $44 ; D
		dc.b $FC ; ü
		dc.b   0
		dc.b   1
		dc.b $60 ; `
		dc.b $EC ; ì
		dc.b $48 ; H
		dc.b $E7 ; ç
		dc.b $30 ; 0
		dc.b $3A ; :
		dc.b $26 ; &
		dc.b $48 ; H
		dc.b $61 ; a
		dc.b   0
		dc.b  $D
		dc.b $16
		dc.b $32 ; 2
		dc.b   0
		dc.b $6F ; o
		dc.b $66 ; f
		dc.b $20
		dc.b $6D ; m
		dc.b   0
		dc.b $38 ; 8
		dc.b $53 ; S
		dc.b $41 ; A
		dc.b $91 ; ‘
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $40 ; @
		dc.b $51 ; Q
		dc.b $C9 ; É
		dc.b $FF
		dc.b $F8 ; ø
		dc.b $34 ; 4
		dc.b   0
		dc.b $53 ; S
		dc.b $42 ; B
		dc.b $24 ; $
		dc.b $6D ; m
		dc.b   0
		dc.b $5A ; Z
		dc.b $4D ; M
		dc.b $ED ; í
		dc.b   0
		dc.b $1C
		dc.b $26 ; &
		dc.b $16
		dc.b $42 ; B
		dc.b $96 ; –
		dc.b $22 ; "
		dc.b $4A ; J
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b $20
		dc.b $61 ; a
		dc.b   0
		dc.b   8
		dc.b $42 ; B
		dc.b $65 ; e
		dc.b  $C
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b  $B
		dc.b $22 ; "
		dc.b $4B ; K
		dc.b $61 ; a
		dc.b   0
		dc.b  $B
		dc.b   2
		dc.b $67 ; g
		dc.b   8
		dc.b $2C ; ,
		dc.b $83 ; ƒ
		dc.b $51 ; Q
		dc.b $CA ; Ê
		dc.b $FF
		dc.b $E4 ; ä
		dc.b $60 ; `
		dc.b $26 ; &
		dc.b $20
		dc.b $7A ; z
		dc.b $FD ; ý
		dc.b $4A ; J
		dc.b $34 ; 4
		dc.b $2A ; *
		dc.b   0
		dc.b  $C
		dc.b $6F ; o
		dc.b   0
		dc.b   0
		dc.b $1C
		dc.b $53 ; S
		dc.b $42 ; B
		dc.b $D1 ; Ñ
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $80 ; €
		dc.b $51 ; Q
		dc.b $CA ; Ê
		dc.b $FF
		dc.b $F8 ; ø
		dc.b $12
		dc.b $2A ; *
		dc.b   0
		dc.b  $B
		dc.b $30 ; 0
		dc.b $2A ; *
		dc.b   0
		dc.b  $E
		dc.b $4C ; L
		dc.b $DF ; ß
		dc.b $5C ; \
		dc.b  $C
		dc.b $4E ; N
		dc.b $75 ; u
		dc.b $44 ; D
		dc.b $FC ; ü
		dc.b   0
		dc.b   1
		dc.b $60 ; `
		dc.b $F4 ; ô
		dc.b $48 ; H
		dc.b $E7 ; ç
		dc.b $20
		dc.b $12
		dc.b $24 ; $
		dc.b $49 ; I
		dc.b $61 ; a
		dc.b   0
		dc.b $FF
		dc.b $7E ; ~
		dc.b $65 ; e
		dc.b   0
		dc.b   0
		dc.b $64 ; d
		dc.b $4A ; J
		dc.b   1
		dc.b $67 ; g
		dc.b   0
		dc.b   0
		dc.b $30 ; 0
		dc.b $4D ; M
		dc.b $ED ; í
		dc.b   0
		dc.b $1C
		dc.b $42 ; B
		dc.b $96 ; –
		dc.b $53 ; S
		dc.b $40 ; @
		dc.b $34 ; 4
		dc.b   0
		dc.b $26 ; &
		dc.b $6D ; m
		dc.b   0
		dc.b $5A ; Z
		dc.b $22 ; "
		dc.b $4B ; K
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b $40 ; @
		dc.b $61 ; a
		dc.b   0
		dc.b   7
		dc.b $D4 ; Ô
		dc.b $22 ; "
		dc.b $4B ; K
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b $20
		dc.b $61 ; a
		dc.b   0
		dc.b  $A
		dc.b $96 ; –
		dc.b $66 ; f
		dc.b   0
		dc.b   0
		dc.b $3E ; >
		dc.b $D4 ; Ô
		dc.b $C1 ; Á
		dc.b $51 ; Q
		dc.b $C8 ; È
		dc.b $FF
		dc.b $E4 ; ä
		dc.b $60 ; `
		dc.b $24 ; $
		dc.b $26 ; &
		dc.b $6D ; m
		dc.b   0
		dc.b $5A ; Z
		dc.b $53 ; S
		dc.b $40 ; @
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b $40 ; @
		dc.b $22 ; "
		dc.b $4B ; K
		dc.b $61 ; a
		dc.b   0
		dc.b   8
		dc.b $F6 ; ö
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b $40 ; @
		dc.b $22 ; "
		dc.b $4B ; K
		dc.b $61 ; a
		dc.b   0
		dc.b  $A
		dc.b $70 ; p
		dc.b $66 ; f
		dc.b $18
		dc.b $D4 ; Ô
		dc.b $FC ; ü
		dc.b   0
		dc.b $40 ; @
		dc.b $51 ; Q
		dc.b $C8 ; È
		dc.b $FF
		dc.b $E4 ; ä
		dc.b $44 ; D
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b $4C ; L
		dc.b $DF ; ß
		dc.b $48 ; H
		dc.b   4
		dc.b $4E ; N
		dc.b $75 ; u
		dc.b $30 ; 0
		dc.b $3C ; <
		dc.b   0
		dc.b   0
		dc.b $60 ; `
		dc.b   4
		dc.b $30 ; 0
		dc.b $3C ; <
		dc.b $FF
		dc.b $FF
		dc.b $44 ; D
		dc.b $FC ; ü
		dc.b   0
		dc.b   1
		dc.b $60 ; `
		dc.b $EA ; ê
		dc.b $48 ; H
		dc.b $E7 ; ç
		dc.b $20
		dc.b   2
		dc.b $48 ; H
		dc.b $E7 ; ç
		dc.b   0
		dc.b $40 ; @
		dc.b $61 ; a
		dc.b   0
		dc.b $FE ; þ
		dc.b $FC ; ü
		dc.b $4C ; L
		dc.b $DF ; ß
		dc.b   2
		dc.b   0
		dc.b $48 ; H
		dc.b $A7 ; §
		dc.b $C0 ; À
		dc.b   0
		dc.b $65 ; e
		dc.b   0
		dc.b   0
		dc.b $48 ; H
		dc.b $4A ; J
		dc.b   1
		dc.b $67 ; g
		dc.b   0
		dc.b   0
		dc.b $26 ; &
		dc.b $4D ; M
		dc.b $ED ; í
		dc.b   0
		dc.b $1C
		dc.b $42 ; B
		dc.b $96 ; –
		dc.b $53 ; S
		dc.b $40 ; @
		dc.b $34 ; 4
		dc.b   0
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b $40 ; @
		dc.b $61 ; a
		dc.b   0
		dc.b   7
		dc.b $50 ; P
		dc.b $51 ; Q
		dc.b $C8 ; È
		dc.b $FF
		dc.b $F6 ; ö
		dc.b $41 ; A
		dc.b $ED ; í
		dc.b   0
		dc.b $1C
		dc.b   8
		dc.b $28 ; (
		dc.b   0
		dc.b   7
		dc.b   0
		dc.b   0
		dc.b $67 ; g
		dc.b $10
		dc.b $60 ; `
		dc.b $1C
		dc.b $53 ; S
		dc.b $40 ; @
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b $40 ; @
		dc.b $61 ; a
		dc.b   0
		dc.b   8
		dc.b $7C ; |
		dc.b $51 ; Q
		dc.b $C8 ; È
		dc.b $FF
		dc.b $F6 ; ö
		dc.b $44 ; D
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b $4C ; L
		dc.b $9F ; Ÿ
		dc.b   0
		dc.b   3
		dc.b $4C ; L
		dc.b $DF ; ß
		dc.b $40 ; @
		dc.b   4
		dc.b $4E ; N
		dc.b $75 ; u
		dc.b $44 ; D
		dc.b $FC ; ü
		dc.b   0
		dc.b   1
		dc.b $60 ; `
		dc.b $F0 ; ð
		dc.b $48 ; H
		dc.b $E7 ; ç
		dc.b $3F ; ?
		dc.b $3A ; :
		dc.b $24 ; $
		dc.b $7A ; z
		dc.b $FC ; ü
		dc.b $3A ; :
		dc.b   8
		dc.b $D2 ; Ò
		dc.b   0
		dc.b   0
		dc.b $2B ; +
		dc.b $48 ; H
		dc.b   0
		dc.b $42 ; B
		dc.b $2B ; +
		dc.b $49 ; I
		dc.b   0
		dc.b $46 ; F
		dc.b $61 ; a
		dc.b   0
		dc.b  $B
		dc.b $D6 ; Ö
		dc.b $65 ; e
		dc.b   0
		dc.b   1
		dc.b $1E
		dc.b $3A ; :
		dc.b   0
		dc.b $61 ; a
		dc.b   0
		dc.b $FE ; þ
		dc.b $82 ; ‚
		dc.b $65 ; e
		dc.b $14
		dc.b $DA ; Ú
		dc.b $40 ; @
		dc.b $20
		dc.b $6D ; m
		dc.b   0
		dc.b $42 ; B
		dc.b $BA ; º
		dc.b $68 ; h
		dc.b   0
		dc.b  $C
		dc.b $6D ; m
		dc.b   0
		dc.b   1
		dc.b   8
		dc.b $61 ; a
		dc.b   0
		dc.b   1
		dc.b  $A
		dc.b $60 ; `
		dc.b  $C
		dc.b $20
		dc.b $6D ; m
		dc.b   0
		dc.b $42 ; B
		dc.b $BA ; º
		dc.b $68 ; h
		dc.b   0
		dc.b  $C
		dc.b $6D ; m
		dc.b   0
		dc.b   0
		dc.b $F6 ; ö
		dc.b $61 ; a
		dc.b   0
		dc.b  $B
		dc.b $7A ; z
		dc.b $65 ; e
		dc.b   0
		dc.b   0
		dc.b $EE ; î
		dc.b $20
		dc.b $6D ; m
		dc.b   0
		dc.b $38 ; 8
		dc.b $32 ; 2
		dc.b   0
		dc.b $6E ; n
		dc.b   4
		dc.b $7C ; |
		dc.b   1
		dc.b $60 ; `
		dc.b $2C ; ,
		dc.b $53 ; S
		dc.b $41 ; A
		dc.b $91 ; ‘
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $40 ; @
		dc.b $51 ; Q
		dc.b $C9 ; É
		dc.b $FF
		dc.b $F8 ; ø
		dc.b $22 ; "
		dc.b $6D ; m
		dc.b   0
		dc.b $5A ; Z
		dc.b $4D ; M
		dc.b $ED ; í
		dc.b   0
		dc.b $1C
		dc.b $42 ; B
		dc.b $96 ; –
		dc.b $24 ; $
		dc.b $49 ; I
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b $20
		dc.b $61 ; a
		dc.b   0
		dc.b   6
		dc.b $A4 ; ¤
		dc.b $65 ; e
		dc.b   0
		dc.b   0
		dc.b $BE ; ¾
		dc.b $3C ; <
		dc.b $2A ; *
		dc.b   0
		dc.b  $C
		dc.b $DC ; Ü
		dc.b $6A ; j
		dc.b   0
		dc.b  $E
		dc.b $20
		dc.b $7A ; z
		dc.b $FB ; û
		dc.b $B6 ; ¶
		dc.b $34 ; 4
		dc.b   6
		dc.b $6F ; o
		dc.b  $C
		dc.b $53 ; S
		dc.b $42 ; B
		dc.b $D1 ; Ñ
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $80 ; €
		dc.b $51 ; Q
		dc.b $CA ; Ê
		dc.b $FF
		dc.b $F8 ; ø
		dc.b $24 ; $
		dc.b $6D ; m
		dc.b   0
		dc.b $42 ; B
		dc.b $22 ; "
		dc.b $6D ; m
		dc.b   0
		dc.b $46 ; F
		dc.b $30 ; 0
		dc.b $2A ; *
		dc.b   0
		dc.b  $C
		dc.b $6F ; o
		dc.b   0
		dc.b   0
		dc.b $92 ; ’
		dc.b $4A ; J
		dc.b $2A ; *
		dc.b   0
		dc.b  $B
		dc.b $67 ; g
		dc.b   0
		dc.b   0
		dc.b $16
		dc.b $53 ; S
		dc.b $40 ; @
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b $40 ; @
		dc.b $61 ; a
		dc.b   0
		dc.b   7
		dc.b $D0 ; Ð
		dc.b $65 ; e
		dc.b   0
		dc.b   0
		dc.b $7C ; |
		dc.b $51 ; Q
		dc.b $C8 ; È
		dc.b $FF
		dc.b $F6 ; ö
		dc.b $60 ; `
		dc.b  $E
		dc.b $53 ; S
		dc.b $40 ; @
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b $40 ; @
		dc.b $61 ; a
		dc.b   0
		dc.b   8
		dc.b $F4 ; ô
		dc.b $51 ; Q
		dc.b $C8 ; È
		dc.b $FF
		dc.b $F6 ; ö
		dc.b $61 ; a
		dc.b   0
		dc.b  $A
		dc.b $EC ; ì
		dc.b $65 ; e
		dc.b   0
		dc.b   0
		dc.b $60 ; `
		dc.b $52 ; R
		dc.b $40 ; @
		dc.b $20
		dc.b $6D ; m
		dc.b   0
		dc.b $38 ; 8
		dc.b $32 ; 2
		dc.b   0
		dc.b $53 ; S
		dc.b $41 ; A
		dc.b $91 ; ‘
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $40 ; @
		dc.b $51 ; Q
		dc.b $C9 ; É
		dc.b $FF
		dc.b $F8 ; ø
		dc.b $22 ; "
		dc.b $6D ; m
		dc.b   0
		dc.b $42 ; B
		dc.b $45 ; E
		dc.b $ED ; í
		dc.b   0
		dc.b $4A ; J
		dc.b $43 ; C
		dc.b $E9 ; é
		dc.b   0
		dc.b   0
		dc.b $45 ; E
		dc.b $EA ; ê
		dc.b   0
		dc.b   0
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b  $B
		dc.b $61 ; a
		dc.b   0
		dc.b   9
		dc.b $18
		dc.b $24 ; $
		dc.b $6D ; m
		dc.b   0
		dc.b $42 ; B
		dc.b $43 ; C
		dc.b $ED ; í
		dc.b   0
		dc.b $4A ; J
		dc.b $13
		dc.b $6A ; j
		dc.b   0
		dc.b  $B
		dc.b   0
		dc.b  $B
		dc.b $33 ; 3
		dc.b $46 ; F
		dc.b   0
		dc.b  $C
		dc.b $33 ; 3
		dc.b $6A ; j
		dc.b   0
		dc.b  $C
		dc.b   0
		dc.b  $E
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b $20
		dc.b $61 ; a
		dc.b   0
		dc.b   7
		dc.b $64 ; d
		dc.b $65 ; e
		dc.b $10
		dc.b $43 ; C
		dc.b $ED ; í
		dc.b   0
		dc.b $4A ; J
		dc.b $70 ; p
		dc.b   0
		dc.b $61 ; a
		dc.b   0
		dc.b   9
		dc.b $28 ; (
		dc.b $4C ; L
		dc.b $DF ; ß
		dc.b $5C ; \
		dc.b $FC ; ü
		dc.b $4E ; N
		dc.b $75 ; u
		dc.b $44 ; D
		dc.b $FC ; ü
		dc.b   0
		dc.b   1
		dc.b $60 ; `
		dc.b $F4 ; ô
		dc.b $48 ; H
		dc.b $E7 ; ç
		dc.b $38 ; 8
		dc.b $3E ; >
		dc.b $24 ; $
		dc.b $7A ; z
		dc.b $FA ; ú
		dc.b $FC ; ü
		dc.b   8
		dc.b $D2 ; Ò
		dc.b   0
		dc.b   0
		dc.b $26 ; &
		dc.b $48 ; H
		dc.b $61 ; a
		dc.b   0
		dc.b  $A
		dc.b $72 ; r
		dc.b $4A ; J
		dc.b $40 ; @
		dc.b $6F ; o
		dc.b   0
		dc.b   1
		dc.b   8
		dc.b $20
		dc.b $6D ; m
		dc.b   0
		dc.b $38 ; 8
		dc.b $32 ; 2
		dc.b   0
		dc.b $53 ; S
		dc.b $41 ; A
		dc.b $91 ; ‘
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $40 ; @
		dc.b $51 ; Q
		dc.b $C9 ; É
		dc.b $FF
		dc.b $F8 ; ø
		dc.b $34 ; 4
		dc.b   0
		dc.b $53 ; S
		dc.b $42 ; B
		dc.b $24 ; $
		dc.b $6D ; m
		dc.b   0
		dc.b $5A ; Z
		dc.b $4D ; M
		dc.b $ED ; í
		dc.b   0
		dc.b $1C
		dc.b $42 ; B
		dc.b $96 ; –
		dc.b $22 ; "
		dc.b $4A ; J
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b $20
		dc.b $61 ; a
		dc.b   0
		dc.b   5
		dc.b $9C ; œ
		dc.b $65 ; e
		dc.b  $C
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b  $B
		dc.b $22 ; "
		dc.b $4B ; K
		dc.b $61 ; a
		dc.b   0
		dc.b   8
		dc.b $5C ; \
		dc.b $67 ; g
		dc.b   8
		dc.b $51 ; Q
		dc.b $CA ; Ê
		dc.b $FF
		dc.b $E6 ; æ
		dc.b $60 ; `
		dc.b   0
		dc.b   0
		dc.b $C8 ; È
		dc.b $22 ; "
		dc.b $4A ; J
		dc.b $48 ; H
		dc.b $E7 ; ç
		dc.b $80 ; €
		dc.b $20
		dc.b $45 ; E
		dc.b $ED ; í
		dc.b   0
		dc.b $4A ; J
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b $10
		dc.b $61 ; a
		dc.b   0
		dc.b   8
		dc.b $76 ; v
		dc.b $4C ; L
		dc.b $DF ; ß
		dc.b   4
		dc.b   1
		dc.b $36 ; 6
		dc.b   0
		dc.b $96 ; –
		dc.b $42 ; B
		dc.b $55 ; U
		dc.b $43 ; C
		dc.b $65 ; e
		dc.b   0
		dc.b   0
		dc.b $96 ; –
		dc.b $26 ; &
		dc.b $7A ; z
		dc.b $FA ; ú
		dc.b $84 ; „
		dc.b $34 ; 4
		dc.b $2A ; *
		dc.b   0
		dc.b  $C
		dc.b $53 ; S
		dc.b $42 ; B
		dc.b $D7 ; ×
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $80 ; €
		dc.b $51 ; Q
		dc.b $CA ; Ê
		dc.b $FF
		dc.b $F8 ; ø
		dc.b $4D ; M
		dc.b $ED ; í
		dc.b   0
		dc.b $1C
		dc.b $42 ; B
		dc.b $96 ; –
		dc.b $91 ; ‘
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $80 ; €
		dc.b $22 ; "
		dc.b $4A ; J
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b $20
		dc.b $61 ; a
		dc.b   0
		dc.b   5
		dc.b $3C ; <
		dc.b $65 ; e
		dc.b   0
		dc.b   0
		dc.b $7A ; z
		dc.b $28 ; (
		dc.b $7A ; z
		dc.b $FA ; ú
		dc.b $56 ; V
		dc.b $34 ; 4
		dc.b $2A ; *
		dc.b   0
		dc.b  $C
		dc.b $53 ; S
		dc.b $42 ; B
		dc.b $D9 ; Ù
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $80 ; €
		dc.b $51 ; Q
		dc.b $CA ; Ê
		dc.b $FF
		dc.b $F8 ; ø
		dc.b $74 ; t
		dc.b   0
		dc.b $34 ; 4
		dc.b $2A ; *
		dc.b   0
		dc.b  $E
		dc.b $C4 ; Ä
		dc.b $FC ; ü
		dc.b   0
		dc.b $40 ; @
		dc.b $D4 ; Ô
		dc.b $42 ; B
		dc.b $22 ; "
		dc.b  $B
		dc.b $92 ; ’
		dc.b $BA ; º
		dc.b $FA ; ú
		dc.b $34 ; 4
		dc.b $82 ; ‚
		dc.b $FC ; ü
		dc.b   0
		dc.b $80 ; €
		dc.b $48 ; H
		dc.b $41 ; A
		dc.b $4A ; J
		dc.b $41 ; A
		dc.b $67 ; g
		dc.b   6
		dc.b   6
		dc.b $81 ; 
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b   0
		dc.b $48 ; H
		dc.b $41 ; A
		dc.b $35 ; 5
		dc.b $41 ; A
		dc.b   0
		dc.b  $C
		dc.b $48 ; H
		dc.b $E7 ; ç
		dc.b   0
		dc.b $80 ; €
		dc.b $22 ; "
		dc.b $4A ; J
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b $20
		dc.b $61 ; a
		dc.b   0
		dc.b   6
		dc.b $5C ; \
		dc.b $65 ; e
		dc.b $2C ; ,
		dc.b $35 ; 5
		dc.b $44 ; D
		dc.b   0
		dc.b  $C
		dc.b $C7 ; Ç
		dc.b $4A ; J
		dc.b $22 ; "
		dc.b $4C ; L
		dc.b $32 ; 2
		dc.b   2
		dc.b $61 ; a
		dc.b   0
		dc.b   7
		dc.b $FC ; ü
		dc.b $C7 ; Ç
		dc.b $4A ; J
		dc.b $D6 ; Ö
		dc.b $C2 ; Â
		dc.b $4C ; L
		dc.b $DF ; ß
		dc.b   1
		dc.b   0
		dc.b $51 ; Q
		dc.b $CB ; Ë
		dc.b $FF
		dc.b $88 ; ˆ
		dc.b $10
		dc.b $3C ; <
		dc.b   0
		dc.b   1
		dc.b $43 ; C
		dc.b $ED ; í
		dc.b   0
		dc.b $4A ; J
		dc.b $61 ; a
		dc.b   0
		dc.b   8
		dc.b   4
; ---------------------------------------------------------------------------

loc_8EF0:				; CODE XREF: ROM:00008EFAj
		movem.l	(sp)+,d2-d4/a2-a6
		rts
; ---------------------------------------------------------------------------
		move	#1,ccr
		bra.s	loc_8EF0
; ---------------------------------------------------------------------------
		movem.l	a3,-(sp)
		bsr.w	sub_98B2
		bcs.w	loc_8F8C
		bsr.w	sub_9922
		bcs.w	loc_8F8C
		movea.l	off_88DA,a3
		bset	#0,(a3)
		lea	a___________,a1	; "___________"
		movea.l	$38(a5),a0
		move.w	#$10,d1
		bsr.w	sub_965A
		moveq	#0,d0
		movea.l	$38(a5),a0
		lea	$30(a0),a0
		move.w	d0,d0
		move.w	d0,-(sp)
		swap	d0
		move.w	(sp)+,d0
		movea.l	a0,a0
		movep.l	d0,1(a0)
		adda.l	#8,a0
		movep.l	d0,1(a0)
		move.w	$2E(a5),d0
		movea.l	$38(a5),a0
		lea	$20(a0),a0
		move.w	d0,d0
		move.w	d0,-(sp)
		swap	d0
		move.w	(sp)+,d0
		movea.l	a0,a0
		movep.l	d0,1(a0)
		adda.l	#8,a0
		movep.l	d0,1(a0)
		lea	aSega_cd_rom,a1	; "SEGA_CD_ROM"
		movea.l	$38(a5),a0
		lea	$40(a0),a0
		move.w	#$20,d1	; ' '
		bsr.w	sub_965A
		move	#0,ccr

loc_8F86:				; CODE XREF: ROM:00008F90j
		movem.l	(sp)+,a3
		rts
; ---------------------------------------------------------------------------

loc_8F8C:				; CODE XREF: ROM:00008F04j
					; ROM:00008F0Cj
		move	#1,ccr
		bra.s	loc_8F86
; ---------------------------------------------------------------------------
		movem.l	d2-d5/a2-a4/a6,-(sp)
		movea.l	a1,a4
		move.w	d1,d4
		swap	d1
		move.w	d1,d5
		moveq	#0,d2
		moveq	#$A,d3
		movea.l	a0,a2

loc_8FA4:				; CODE XREF: ROM:00008FACj
		cmpi.b	#$2A,(a2)+ ; '*'
		beq.s	loc_8FB0
		addq.w	#1,d2
		dbf	d3,loc_8FA4

loc_8FB0:				; CODE XREF: ROM:00008FA8j
		movea.l	a0,a2
		bsr.w	sub_985A
		move.w	d0,d3
		ble.w	loc_9012
		subq.w	#1,d3
		movea.l	$38(a5),a0
		suba.l	#$40,a0	; '@'
		movea.l	$5A(a5),a1
		lea	$1C(a5),a6
		clr.l	(a6)
		movea.l	a1,a3

loc_8FD4:				; CODE XREF: ROM:loc_900Ej
		tst.w	d4
		ble.s	loc_901C
		move.w	#$20,d1	; ' '
		bsr.w	sub_93B4
		movea.l	a3,a1
		move.w	d2,d1
		beq.s	loc_8FEC
		bsr.w	sub_9680
		bne.s	loc_900A

loc_8FEC:				; CODE XREF: ROM:00008FE4j
		tst.w	d5
		ble.s	loc_8FF4
		subq.w	#1,d5
		bra.s	loc_9004
; ---------------------------------------------------------------------------

loc_8FF4:				; CODE XREF: ROM:00008FEEj
		move.w	#$10,d1
		exg	a2,a4
		bsr.w	sub_96B6
		exg	a2,a4
		adda.w	d1,a4
		subq.w	#1,d4

loc_9004:				; CODE XREF: ROM:00008FF2j
		cmpi.w	#$B,d2
		beq.s	loc_9012

loc_900A:				; CODE XREF: ROM:00008FEAj
		suba.w	#$80,a0	; '€'

loc_900E:
		dbf	d3,loc_8FD4

loc_9012:				; CODE XREF: ROM:00008FB8j
					; ROM:00009008j
		move	#0,ccr

loc_9016:				; CODE XREF: ROM:00009020j
		movem.l	(sp)+,d2-d5/a2-a4/a6
		rts
; ---------------------------------------------------------------------------

loc_901C:				; CODE XREF: ROM:00008FD6j
		move	#1,ccr
		bra.s	loc_9016
; ---------------------------------------------------------------------------
		movem.l	d2/d7,-(sp)
		move.w	d2,-(sp)
		move.w	d1,d0
		move.w	#$10,d2
		move.w	#$1F,d7
		bsr.s	sub_905C
		move.w	#1,d7
		movea.l	sp,a0
		bsr.s	sub_905C
		addq.w	#2,sp

loc_903E:				; CODE XREF: ROM:00009040j
		bsr.s	sub_9050
		bhi.s	loc_903E
		clr.l	(a1)+
		clr.l	(a1)+
		clr.l	(a1)+
		clr.l	(a1)+
		movem.l	(sp)+,d2/d7
		rts

; =============== S U B	R O U T	I N E =======================================


sub_9050:				; CODE XREF: ROM:loc_903Ep sub_905Cp
		move.w	d0,d1
		lsr.w	#8,d1
		move.b	d1,(a1)+
		lsl.w	#6,d0
		subq.w	#6,d2
		rts
; End of function sub_9050


; =============== S U B	R O U T	I N E =======================================


sub_905C:				; CODE XREF: ROM:00009032p
					; ROM:0000903Ap ...
		bsr.s	sub_9050
		cmpi.w	#8,d2
		bcc.s	sub_905C
		moveq	#8,d1
		sub.w	d2,d1
		lsr.w	d1,d0
		move.b	(a0)+,d0
		lsl.w	d1,d0
		addq.w	#8,d2
		subq.w	#1,d7
		bcc.s	sub_905C
		rts
; End of function sub_905C


; =============== S U B	R O U T	I N E =======================================


sub_9076:				; CODE XREF: sub_93B4+C0p
		movem.l	d2/d7,-(sp)
		move.b	(a1)+,d0
		lsl.w	#6,d0
		move.b	(a1)+,d0
		lsl.w	#2,d0
		move.w	d0,$2A(a5)
		lsl.w	#4,d0
		move.b	(a1)+,d0
		ror.w	#4,d0
		move.b	d0,$2B(a5)
		move.w	#$2A,d7	; '*'
		moveq	#2,d2
		bsr.s	sub_90C0
		bsr.s	sub_90B4
		lsr.w	#4,d0
		move.b	(a1)+,d0
		lsl.w	#4,d0
		move.w	d0,$2C(a5)
		lsl.w	#2,d0
		move.b	(a1)+,d0
		lsr.w	#2,d0
		move.b	d0,$2D(a5)
		movem.l	(sp)+,d2/d7
		rts
; End of function sub_9076


; =============== S U B	R O U T	I N E =======================================


sub_90B4:				; CODE XREF: sub_9076+22p
					; sub_90C0:loc_90C2p
		move.w	d0,d1
		lsr.w	#8,d1
		move.b	d1,(a0)+
		lsl.w	#8,d0
		subq.w	#8,d2
		rts
; End of function sub_90B4


; =============== S U B	R O U T	I N E =======================================


sub_90C0:				; CODE XREF: sub_9076+20p
		bra.s	loc_90C4
; ---------------------------------------------------------------------------

loc_90C2:				; CODE XREF: sub_90C0+8j
		bsr.s	sub_90B4

loc_90C4:				; CODE XREF: sub_90C0j	sub_90C0+1Aj
		cmpi.w	#8,d2
		bhi.s	loc_90C2
		move.w	#8,d1
		sub.w	d2,d1
		lsr.w	d1,d0
		move.b	(a1)+,d0
		lsl.w	d1,d0
		addq.w	#6,d2
		subq.w	#1,d7
		bcc.s	loc_90C4
		rts
; End of function sub_90C0


; =============== S U B	R O U T	I N E =======================================


sub_90DE:				; CODE XREF: sub_93B4+62p
		movem.l	d6-d7,-(sp)
		movea.l	4(a5),a0
		adda.w	d0,a0
		lea	$20(a5),a1
		moveq	#7,d7

loc_90EE:				; CODE XREF: sub_90DE+2Aj
		movem.l	a1,-(sp)
		move.b	(a0),d0
		moveq	#7,d6

loc_90F6:				; CODE XREF: sub_90DE:loc_90FEj
		move.b	(a1),d1
		lsl.b	#1,d0
		roxl.b	#1,d1
		move.b	d1,(a1)+

loc_90FE:
		dbf	d6,loc_90F6
		movem.l	(sp)+,a1
		addq.w	#8,a0
		dbf	d7,loc_90EE
		movem.l	(sp)+,d6-d7
		rts
; End of function sub_90DE


; =============== S U B	R O U T	I N E =======================================


sub_9112:				; CODE XREF: sub_93B4+6Cp
		movem.l	d6-d7,-(sp)
		movea.l	4(a5),a0
		adda.w	d0,a0
		lea	$20(a5),a1
		moveq	#7,d7

loc_9122:				; CODE XREF: sub_9112+2Aj
		movem.l	a0,-(sp)
		move.b	(a1)+,d0
		moveq	#7,d6

loc_912A:				; CODE XREF: sub_9112+22j
		move.b	(a0),d1
		lsl.b	#1,d0
		roxl.b	#1,d1
		move.b	d1,(a0)
		addq.w	#8,a0
		dbf	d6,loc_912A
		movem.l	(sp)+,a0
		dbf	d7,loc_9122
		movem.l	(sp)+,d6-d7
		rts
; End of function sub_9112


; =============== S U B	R O U T	I N E =======================================


sub_9146:				; CODE XREF: sub_93B4+98p
		movea.l	4(a5),a0
		lea	$20(a5),a1
		movem.l	d0/a0,-(sp)
		adda.w	d0,a0
		moveq	#4,d1

loc_9156:				; CODE XREF: sub_9146+18j
		move.b	(a0)+,d0
		lsr.b	#2,d0
		move.b	d0,(a1)+
		addq.w	#8,a0
		dbf	d1,loc_9156
		movem.l	(sp)+,d0/a0
		moveq	#0,d1
		move.b	loc_9186(pc,d0.w),d1
		move.b	(a0,d1.w),d1
		lsr.b	#2,d1
		move.b	d1,(a1)+
		move.b	$30(a0,d0.w),d1
		lsr.b	#2,d1
		move.b	d1,(a1)+
		move.b	$38(a0,d0.w),d1
		lsr.b	#2,d1
		move.b	d1,(a1)
		rts
; End of function sub_9146

; ---------------------------------------------------------------------------

loc_9186:
		move.l	$2F08(a6),-(a6)
		move.b	(a2)+,-(a0)

loc_918C:				; CODE XREF: sub_93B4+A2p
		move.l	$206D(a4),-(a1)
		dc.w $4
		dc.w $43ED
		dc.w $20
		dc.w $48E7
		or.l	d0,d0
		adda.w	d0,a0
		moveq	#4,d1

loc_919E:				; CODE XREF: ROM:000091A6j
		move.b	(a1)+,d0
		lsl.b	#2,d0
		move.b	d0,(a0)+
		addq.w	#8,a0
		dbf	d1,loc_919E
		movem.l	(sp)+,d0/a0
		move.w	d0,-(sp)
		moveq	#0,d1
		move.b	loc_9186(pc,d0.w),d1
		move.b	(a1)+,d0
		lsl.b	#2,d0
		move.b	d0,(a0,d1.w)
		move.w	(sp)+,d0
		movea.l	4(a5),a0
		move.b	$26(a5),d1
		lsl.b	#2,d1
		move.b	d1,$30(a0,d0.w)
		move.b	$27(a5),d1
		lsl.b	#2,d1
		move.b	d1,$38(a0,d0.w)
		rts

; =============== S U B	R O U T	I N E =======================================


sub_91DA:				; CODE XREF: sub_93B4+C6p
		movem.l	d7/a2,-(sp)
		movea.l	0(a5),a2
		moveq	#0,d1
		moveq	#$1F,d7

loc_91E6:				; CODE XREF: sub_91DA+10j
		move.b	(a0)+,d0
		bsr.s	sub_91F8
		dbf	d7,loc_91E6
		move.w	d1,d2
		not.w	d2
		movem.l	(sp)+,d7/a2
		rts
; End of function sub_91DA


; =============== S U B	R O U T	I N E =======================================


sub_91F8:				; CODE XREF: sub_91DA+Ep
		rol.w	#8,d1
		clr.w	d2
		move.b	d0,d2
		eor.b	d1,d2

loc_9200:
		add.w	d2,d2
		clr.b	d1
		move.w	(a2,d2.w),d2
		eor.w	d2,d1
		rts
; End of function sub_91F8

; ---------------------------------------------------------------------------
		movem.l	d7,-(sp)
		moveq	#0,d7

loc_9212:				; CODE XREF: ROM:0000922Cj
		move.w	d7,d0
		lsl.w	#8,d0
		moveq	#7,d1

loc_9218:				; CODE XREF: ROM:loc_9220j
		lsl.w	#1,d0
		bcc.s	loc_9220
		eori.w	#$1021,d0

loc_9220:				; CODE XREF: ROM:0000921Aj
		dbf	d1,loc_9218
		move.w	d0,(a0)+
		addq.w	#1,d7
		cmpi.w	#$100,d7
		bcs.s	loc_9212
		movem.l	(sp)+,d7
		rts
; ---------------------------------------------------------------------------
		movem.l	d6-d7,-(sp)
		swap	d2
		moveq	#0,d7
		move.b	d7,(a3)
		move.b	d7,(a0)
		move.b	d7,(a4)
		moveq	#1,d0
		moveq	#1,d7

loc_9246:				; CODE XREF: ROM:00009258j
		move.b	d0,(a3,d7.w)
		move.b	d0,(a0,d7.w)
		lsl.b	#1,d0
		move.b	d7,(a4,d7.w)
		addq.w	#1,d7
		cmp.w	d7,d2
		bcc.s	loc_9246
		swap	d2

loc_925C:				; CODE XREF: ROM:00009290j
		clr.b	(a3,d7.w)
		swap	d2
		moveq	#0,d6

loc_9264:				; CODE XREF: ROM:0000927Ej
		moveq	#0,d0
		tst.b	(a1,d6.w)
		beq.s	loc_927A
		move.w	d7,d1
		sub.w	d6,d1
		subq.w	#1,d1
		move.b	(a3,d1.w),d0
		eor.b	d0,(a3,d7.w)

loc_927A:				; CODE XREF: ROM:0000926Aj
		addq.w	#1,d6
		cmp.w	d2,d6
		bcs.s	loc_9264
		swap	d2
		move.b	(a3,d7.w),(a0,d7.w)
		move.b	d7,(a4,d7.w)
		addq.w	#1,d7
		cmp.w	d2,d7
		bcs.s	loc_925C
		move.w	d2,d1
		subq.w	#1,d1
		moveq	#0,d7

loc_9298:				; CODE XREF: ROM:000092C8j
		move.w	d7,d6
		addq.w	#1,d6

loc_929C:				; CODE XREF: ROM:000092C2j
		move.b	(a0,d7.w),d0
		cmp.b	(a0,d6.w),d0
		bcs.s	loc_92BE
		move.b	(a0,d6.w),(a0,d7.w)
		move.b	d0,(a0,d6.w)
		move.b	(a4,d7.w),d0
		move.b	(a4,d6.w),(a4,d7.w)
		move.b	d0,(a4,d6.w)

loc_92BE:				; CODE XREF: ROM:000092A4j
		addq.w	#1,d6
		cmp.w	d2,d6
		bcs.s	loc_929C
		addq.w	#1,d7
		cmp.w	d1,d7
		bcs.s	loc_9298
		movem.l	(sp)+,d6-d7
		rts
; ---------------------------------------------------------------------------
		movem.l	d2/d7,-(sp)
		lea	$20(a5),a0
		clr.w	$26(a5)
		subq.w	#1,d2
		moveq	#0,d7

loc_92E0:				; CODE XREF: ROM:00009308j
		moveq	#0,d0
		moveq	#0,d1
		move.b	(a0,d7.w),d0
		tst.w	d0
		beq.s	loc_9302
		move.b	(a4,d0.w),d1
		subq.w	#1,d1
		bsr.s	sub_9310
		eor.b	d0,$26(a5)
		dc.w $C549
		bsr.s	sub_9310
		eor.b	d0,$27(a5)
		dc.w $C549

loc_9302:				; CODE XREF: ROM:000092EAj
		addq.w	#1,d7
		cmpi.w	#6,d7
		bcs.s	loc_92E0
		movem.l	(sp)+,d2/d7
		rts

; =============== S U B	R O U T	I N E =======================================


sub_9310:				; CODE XREF: ROM:000092F2p
					; ROM:000092FAp
		move.b	(a1,d7.w),d0
		add.w	d1,d0
		bra.s	loc_931A
; ---------------------------------------------------------------------------

loc_9318:				; CODE XREF: sub_9310+Cj
		sub.w	d2,d0

loc_931A:				; CODE XREF: sub_9310+6j
		cmp.w	d2,d0
		bcc.s	loc_9318
		addq.w	#1,d0
		move.b	(a3,d0.w),d0
		rts
; End of function sub_9310


; =============== S U B	R O U T	I N E =======================================


sub_9326:				; CODE XREF: sub_93B4+66p sub_93B4+9Cp
		movem.l	d2/d7,-(sp)
		lea	$20(a5),a0
		subq.w	#1,d2
		clr.w	$28(a5)
		moveq	#0,d7

loc_9336:				; CODE XREF: sub_9326+3Ej
		moveq	#0,d0
		move.b	(a0,d7.w),d0
		eor.b	d0,$28(a5)
		tst.b	d0
		beq.s	loc_935E
		move.b	(a4,d0.w),d0
		addq.w	#6,d0
		sub.w	d7,d0
		bra.s	loc_9350
; ---------------------------------------------------------------------------

loc_934E:				; CODE XREF: sub_9326+2Cj
		sub.w	d2,d0

loc_9350:				; CODE XREF: sub_9326+26j
		cmp.w	d2,d0
		bcc.s	loc_934E
		addq.w	#1,d0
		move.b	(a3,d0.w),d0
		eor.b	d0,$29(a5)

loc_935E:				; CODE XREF: sub_9326+1Cj
		addq.w	#1,d7
		cmpi.w	#8,d7
		bcs.s	loc_9336
		tst.w	$28(a5)
		beq.s	loc_93AE
		moveq	#0,d1
		move.w	d2,d0
		move.b	$29(a5),d1
		move.b	(a4,d1.w),d1
		add.w	d1,d0
		move.b	$28(a5),d1
		move.b	(a4,d1.w),d1
		sub.w	d1,d0
		bra.s	loc_9388
; ---------------------------------------------------------------------------

loc_9386:				; CODE XREF: sub_9326+64j
		sub.w	d2,d0

loc_9388:				; CODE XREF: sub_9326+5Ej
		cmp.w	d2,d0
		bcc.s	loc_9386
		cmpi.w	#8,d0
		bcc.s	loc_93AA
		moveq	#7,d1
		sub.w	d0,d1
		move.b	$28(a5),d0
		eor.b	d0,(a0,d1.w)
		bset	#3,0(a6)
		addq.b	#1,$6F(a5)
		bra.s	loc_93AE
; ---------------------------------------------------------------------------

loc_93AA:				; CODE XREF: sub_9326+6Aj
		bset	#4,(a6)

loc_93AE:				; CODE XREF: sub_9326+44j sub_9326+82j
		movem.l	(sp)+,d2/d7
		rts
; End of function sub_9326


; =============== S U B	R O U T	I N E =======================================


sub_93B4:				; CODE XREF: ROM:00008FDCp
		movem.l	d0-d3/d7/a2-a4,-(sp)
		movem.l	d1/a0-a1,-(sp)
		moveq	#0,d0
		move.w	a0,d0
		move.l	a0,d2
		move.w	#0,d2
		divu.w	#$80,d0	; '€'
		mulu.w	#$80,d0	; '€'
		add.w	d0,d2
		movea.l	d2,a0
		cmpa.l	$66(a5),a0
		beq.w	loc_94C4
		move.l	a0,$66(a5)
		movea.l	a0,a1
		movea.l	$6A(a5),a0
		clr.b	$6E(a5)
		move.l	a0,-(sp)
		movea.l	4(a5),a0
		move.w	#$40,d1	; '@'
		exg	a0,a1
		bsr.w	sub_94FC
		exg	a0,a1
		movea.l	(sp)+,a0
		move.l	a1,-(sp)
		move.l	a0,-(sp)
		move.w	#$100,d2
		movea.l	8(a5),a3
		movea.l	$C(a5),a4
		clr.b	$6F(a5)
		moveq	#7,d7
		moveq	#0,d3

loc_9414:				; CODE XREF: sub_93B4+72j
		move.w	d3,d0
		bsr.w	sub_90DE
		bsr.w	sub_9326
		move.w	d3,d0
		bsr.w	sub_9112
		addq.w	#1,d3
		dbf	d7,loc_9414
		tst.b	$6F(a5)
		beq.s	loc_9436
		move.b	$6F(a5),1(a6)

loc_9436:				; CODE XREF: sub_93B4+7Aj
		move.w	#$40,d2	; '@'
		movea.l	$10(a5),a3
		movea.l	$14(a5),a4
		clr.b	$6F(a5)
		moveq	#7,d7
		moveq	#0,d3

loc_944A:				; CODE XREF: sub_93B4+A8j
		move.w	d3,d0
		bsr.w	sub_9146
		bsr.w	sub_9326
		move.w	d3,d0
		bsr.w	loc_918C+2
		addq.w	#1,d3
		dbf	d7,loc_944A
		tst.b	$6F(a5)
		beq.s	loc_946C
		move.b	$6F(a5),1(a6)

loc_946C:				; CODE XREF: sub_93B4+B0j
		movea.l	(sp)+,a0
		move.l	a0,-(sp)
		movea.l	4(a5),a1
		bsr.w	sub_9076
		movea.l	(sp)+,a0
		bsr.w	sub_91DA
		cmp.w	$2A(a5),d1
		beq.s	loc_9490
		bset	#5,0(a6)
		bset	#5,$6E(a5)

loc_9490:				; CODE XREF: sub_93B4+CEj
		cmp.w	$2C(a5),d2
		beq.s	loc_94A2
		bset	#6,0(a6)
		bset	#6,$6E(a5)

loc_94A2:				; CODE XREF: sub_93B4+E0j
		movea.l	(sp)+,a1
		btst	#5,$6E(a5)
		beq.s	loc_94C4
		btst	#6,$6E(a5)
		beq.s	loc_94C4
		bset	#7,0(a6)
		bset	#7,$6E(a5)
		addq.w	#1,2(a6)

loc_94C4:				; CODE XREF: sub_93B4+22j sub_93B4+F6j ...
		movem.l	(sp)+,d1/a0-a1
		movea.l	a1,a2
		move.w	$68(a5),d3
		move.w	a0,d2
		sub.w	d3,d2
		asr.w	#2,d2
		movea.l	$6A(a5),a1
		adda.w	d2,a1
		asr.w	#1,d1
		bsr.w	sub_96B6
		movea.l	a2,a1
		adda.w	d1,a1
		add.w	d1,d1
		adda.w	d1,a0
		adda.w	d1,a0
		btst	#7,$6E(a5)
		beq.s	loc_94F6
		move	#1,ccr

loc_94F6:				; CODE XREF: sub_93B4+13Cj
		movem.l	(sp)+,d0-d3/d7/a2-a4
		rts
; End of function sub_93B4


; =============== S U B	R O U T	I N E =======================================


sub_94FC:				; CODE XREF: sub_93B4+40p sub_985A+18p
		movem.l	d2,-(sp)

loc_9500:				; CODE XREF: sub_94FC+10j
		subq.w	#4,d1
		blt.s	loc_950E
		movep.l	1(a0),d2
		move.l	d2,(a1)+
		addq.l	#8,a0
		bra.s	loc_9500
; ---------------------------------------------------------------------------

loc_950E:				; CODE XREF: sub_94FC+6j
		addq.w	#4,d1

loc_9510:				; CODE XREF: sub_94FC+1Ej
		subq.w	#1,d1
		blt.s	loc_951C
		move.b	1(a0),(a1)+
		addq.l	#2,a0
		bra.s	loc_9510
; ---------------------------------------------------------------------------

loc_951C:				; CODE XREF: sub_94FC+16j
		movem.l	(sp)+,d2
		rts
; End of function sub_94FC

; ---------------------------------------------------------------------------
		dc.b $48 ; H
		dc.b $E7 ; ç
		dc.b $F1 ; ñ
		dc.b $38 ; 8
		dc.b $48 ; H
		dc.b $E7 ; ç
		dc.b $40 ; @
		dc.b $C0 ; À
		dc.b  $C
		dc.b $41 ; A
		dc.b   0
		dc.b $40 ; @
		dc.b $6C ; l
		dc.b   0
		dc.b   0
		dc.b $88 ; ˆ
		dc.b $48 ; H
		dc.b $E7 ; ç
		dc.b $40 ; @
		dc.b $40 ; @
		dc.b $24 ; $
		dc.b   8
		dc.b $26 ; &
		dc.b   8
		dc.b $70 ; p
		dc.b   0
		dc.b $30 ; 0
		dc.b   8
		dc.b $36 ; 6
		dc.b $3C ; <
		dc.b   0
		dc.b   0
		dc.b $80 ; €
		dc.b $FC ; ü
		dc.b   0
		dc.b $80 ; €
		dc.b $C0 ; À
		dc.b $FC ; ü
		dc.b   0
		dc.b $80 ; €
		dc.b $D6 ; Ö
		dc.b $40 ; @
		dc.b $20
		dc.b $43 ; C
		dc.b $94 ; ”
		dc.b $88 ; ˆ
		dc.b $E4 ; ä
		dc.b $82 ; ‚
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b $40 ; @
		dc.b $22 ; "
		dc.b $6D ; m
		dc.b   0
		dc.b $6A ; j
		dc.b $24 ; $
		dc.b $49 ; I
		dc.b $26 ; &
		dc.b $48 ; H
		dc.b $4D ; M
		dc.b $ED ; í
		dc.b   0
		dc.b $1C
		dc.b $26 ; &
		dc.b $16
		dc.b $42 ; B
		dc.b $96 ; –
		dc.b $70 ; p
		dc.b   0
		dc.b $61 ; a
		dc.b   0
		dc.b   2
		dc.b $F0 ; ð
		dc.b $4A ; J
		dc.b $40 ; @
		dc.b $6F ; o
		dc.b $20
		dc.b $80 ; €
		dc.b $FC ; ü
		dc.b   0
		dc.b   2
		dc.b $32 ; 2
		dc.b   0
		dc.b $48 ; H
		dc.b $40 ; @
		dc.b $4A ; J
		dc.b $40 ; @
		dc.b $67 ; g
		dc.b   2
		dc.b $52 ; R
		dc.b $41 ; A
		dc.b $C2 ; Â
		dc.b $FC ; ü
		dc.b   0
		dc.b $80 ; €
		dc.b $20
		dc.b $2D ; -
		dc.b   0
		dc.b $38 ; 8
		dc.b $90 ; 
		dc.b $81 ; 
		dc.b $B0 ; °
		dc.b $88 ; ˆ
		dc.b $6E ; n
		dc.b   4
		dc.b $61 ; a
		dc.b   0
		dc.b $FE ; þ
		dc.b $26 ; &
		dc.b $10
		dc.b $2E ; .
		dc.b   0
		dc.b   0
		dc.b $2C ; ,
		dc.b $83 ; ƒ
		dc.b $42 ; B
		dc.b $AD ; ­
		dc.b   0
		dc.b $66 ; f
		dc.b $4C ; L
		dc.b $DF ; ß
		dc.b   2
		dc.b   2
		dc.b   8
		dc.b   0
		dc.b   0
		dc.b   7
		dc.b $66 ; f
		dc.b   0
		dc.b   0
		dc.b $B0 ; °
		dc.b $D4 ; Ô
		dc.b $C2 ; Â
		dc.b $D4 ; Ô
		dc.b $42 ; B
		dc.b $E2 ; â
		dc.b $41 ; A
		dc.b $61 ; a
		dc.b   0
		dc.b   1
		dc.b   8
		dc.b $D2 ; Ò
		dc.b $41 ; A
		dc.b $22 ; "
		dc.b $6D ; m
		dc.b   0
		dc.b $6A ; j
		dc.b $20
		dc.b $4B ; K
		dc.b $C1 ; Á
		dc.b $49 ; I
		dc.b $2F ; /
		dc.b   9
		dc.b $2F ; /
		dc.b   8
		dc.b $61 ; a
		dc.b   0
		dc.b $FC ; ü
		dc.b $1A
		dc.b $20
		dc.b $5F ; _
		dc.b $22 ; "
		dc.b $6D ; m
		dc.b   0
		dc.b   4
		dc.b $61 ; a
		dc.b   0
		dc.b $FA ; ú
		dc.b $58 ; X
		dc.b $34 ; 4
		dc.b $3C ; <
		dc.b   0
		dc.b $40 ; @
		dc.b $45 ; E
		dc.b $FA ; ú
		dc.b $F2 ; ò
		dc.b $CE ; Î
		dc.b $26 ; &
		dc.b $6D ; m
		dc.b   0
		dc.b $10
		dc.b $28 ; (
		dc.b $6D ; m
		dc.b   0
		dc.b $14
		dc.b $7E ; ~
		dc.b   7
		dc.b $76 ; v
		dc.b   0
		dc.b $30 ; 0
		dc.b   3
		dc.b $61 ; a
		dc.b   0
		dc.b $FB ; û
		dc.b $62 ; b
		dc.b $43 ; C
		dc.b $FA ; ú
		dc.b $F2 ; ò
		dc.b $B2 ; ²
		dc.b $61 ; a
		dc.b   0
		dc.b $FC ; ü
		dc.b $E4 ; ä
		dc.b $30 ; 0
		dc.b   3
		dc.b $61 ; a
		dc.b   0
		dc.b $FB ; û
		dc.b $CE ; Î
		dc.b $52 ; R
		dc.b $43 ; C
		dc.b $51 ; Q
		dc.b $CF ; Ï
		dc.b $FF
		dc.b $E8 ; è
		dc.b $34 ; 4
		dc.b $3C ; <
		dc.b   1
		dc.b   0
		dc.b $45 ; E
		dc.b $FA ; ú
		dc.b $F2 ; ò
		dc.b $8E ; Ž
		dc.b $26 ; &
		dc.b $6D ; m
		dc.b   0
		dc.b   8
		dc.b $28 ; (
		dc.b $6D ; m
		dc.b   0
		dc.b  $C
		dc.b $7E ; ~
		dc.b   7
		dc.b $76 ; v
		dc.b   0
		dc.b $30 ; 0
		dc.b   3
		dc.b $61 ; a
		dc.b   0
		dc.b $FA ; ú
		dc.b $CC ; Ì
		dc.b $43 ; C
		dc.b $FA ; ú
		dc.b $F2 ; ò
		dc.b $72 ; r
		dc.b $61 ; a
		dc.b   0
		dc.b $FC ; ü
		dc.b $B6 ; ¶
		dc.b $30 ; 0
		dc.b   3
		dc.b $61 ; a
		dc.b   0
		dc.b $FA ; ú
		dc.b $F2 ; ò
		dc.b $52 ; R
		dc.b $43 ; C
		dc.b $51 ; Q
		dc.b $CF ; Ï
		dc.b $FF
		dc.b $E8 ; è
		dc.b $22 ; "
		dc.b $5F ; _
		dc.b $20
		dc.b $6D ; m
		dc.b   0
		dc.b   4
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b $40 ; @
		dc.b $C1 ; Á
		dc.b $49 ; I
		dc.b $61 ; a
		dc.b   0
		dc.b   0
		dc.b $24 ; $
		dc.b $C1 ; Á
		dc.b $49 ; I
		dc.b $44 ; D
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b $4C ; L
		dc.b $DF ; ß
		dc.b   3
		dc.b   2
		dc.b $40 ; @
		dc.b $E7 ; ç
		dc.b $D0 ; Ð
		dc.b $C1 ; Á
		dc.b $D0 ; Ð
		dc.b $C1 ; Á
		dc.b $E2 ; â
		dc.b $41 ; A
		dc.b $D2 ; Ò
		dc.b $C1 ; Á
		dc.b $46 ; F
		dc.b $DF ; ß
		dc.b $4C ; L
		dc.b $DF ; ß
		dc.b $1C
		dc.b $8F ; 
		dc.b $4E ; N
		dc.b $75 ; u
		dc.b $44 ; D
		dc.b $FC ; ü
		dc.b   0
		dc.b   1
		dc.b $60 ; `
		dc.b $E4 ; ä

; =============== S U B	R O U T	I N E =======================================


sub_965A:				; CODE XREF: ROM:00008F24p
					; ROM:00008F7Ep
		movem.l	d2,-(sp)

loc_965E:				; CODE XREF: sub_965A+10j
		subq.w	#4,d1
		blt.s	loc_966C
		move.l	(a1)+,d2
		movep.l	d2,1(a0)
		addq.l	#8,a0
		bra.s	loc_965E
; ---------------------------------------------------------------------------

loc_966C:				; CODE XREF: sub_965A+6j
		addq.w	#4,d1

loc_966E:				; CODE XREF: sub_965A+1Ej
		subq.w	#1,d1
		blt.s	loc_967A
		move.b	(a1)+,1(a0)
		addq.l	#2,a0
		bra.s	loc_966E
; ---------------------------------------------------------------------------

loc_967A:				; CODE XREF: sub_965A+16j
		movem.l	(sp)+,d2
		rts
; End of function sub_965A


; =============== S U B	R O U T	I N E =======================================


sub_9680:				; CODE XREF: ROM:00008FE6p
		movem.l	d1/a1-a2,-(sp)

loc_9684:				; CODE XREF: sub_9680+Cj
		subq.w	#4,d1
		blt.s	loc_968E
		cmpm.l	(a1)+,(a2)+
		bne.s	loc_969E
		bra.s	loc_9684
; ---------------------------------------------------------------------------

loc_968E:				; CODE XREF: sub_9680+6j
		addq.w	#4,d1

loc_9690:				; CODE XREF: sub_9680+18j
		subq.w	#1,d1
		blt.s	loc_969A
		cmpm.b	(a1)+,(a2)+
		bne.s	loc_969E
		bra.s	loc_9690
; ---------------------------------------------------------------------------

loc_969A:				; CODE XREF: sub_9680+12j
		move	#4,ccr

loc_969E:				; CODE XREF: sub_9680+Aj sub_9680+16j
		movem.l	(sp)+,d1/a1-a2
		rts
; End of function sub_9680

; ---------------------------------------------------------------------------
		dc.b $48 ; H
		dc.b $E7 ; ç
		dc.b $40 ; @
		dc.b $60 ; `
		dc.b $53 ; S
		dc.b $41 ; A
		dc.b $14
		dc.b $D9 ; Ù
		dc.b $51 ; Q
		dc.b $C9 ; É
		dc.b $FF
		dc.b $FC ; ü
		dc.b $4C ; L
		dc.b $DF ; ß
		dc.b   6
		dc.b   2
		dc.b $4E ; N
		dc.b $75 ; u

; =============== S U B	R O U T	I N E =======================================


sub_96B6:				; CODE XREF: ROM:00008FFAp
					; sub_93B4+128p
		movem.l	d1/a1-a2,-(sp)

loc_96BA:				; CODE XREF: sub_96B6+Aj
		subq.w	#4,d1
		blt.s	loc_96C2
		move.l	(a1)+,(a2)+
		bra.s	loc_96BA
; ---------------------------------------------------------------------------

loc_96C2:				; CODE XREF: sub_96B6+6j
		addq.w	#4,d1

loc_96C4:				; CODE XREF: sub_96B6+14j
		subq.w	#1,d1
		blt.s	loc_96CC
		move.b	(a1)+,(a2)+
		bra.s	loc_96C4
; ---------------------------------------------------------------------------

loc_96CC:				; CODE XREF: sub_96B6+10j
		movem.l	(sp)+,d1/a1-a2
		rts
; End of function sub_96B6

; ---------------------------------------------------------------------------
		dc.b $48 ; H
		dc.b $E7 ; ç
		dc.b $40 ; @
		dc.b $60 ; `
		dc.b $D3 ; Ó
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   1
		dc.b $D5 ; Õ
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   1
		dc.b $14
		dc.b $91 ; ‘
		dc.b $54 ; T
		dc.b $49 ; I
		dc.b $54 ; T
		dc.b $4A ; J
		dc.b $55 ; U
		dc.b $41 ; A
		dc.b $6E ; n
		dc.b $F6 ; ö
		dc.b $4C ; L
		dc.b $DF ; ß
		dc.b   6
		dc.b   2
		dc.b $4E ; N
		dc.b $75 ; u
		dc.b $48 ; H
		dc.b $E7 ; ç
		dc.b $F8 ; ø
		dc.b $E0 ; à
		dc.b $4A ; J
		dc.b   0
		dc.b $67 ; g
		dc.b   0
		dc.b   0
		dc.b $76 ; v
		dc.b $76 ; v
		dc.b   0
		dc.b $61 ; a
		dc.b   0
		dc.b   1
		dc.b $5A ; Z
		dc.b $65 ; e
		dc.b   0
		dc.b   0
		dc.b $E8 ; è
		dc.b $36 ; 6
		dc.b   0
		dc.b $53 ; S
		dc.b $40 ; @
		dc.b $20
		dc.b $6D ; m
		dc.b   0
		dc.b $38 ; 8
		dc.b $45 ; E
		dc.b $E8 ; è
		dc.b   0
		dc.b $30 ; 0
		dc.b $38 ; 8
		dc.b   0
		dc.b $61 ; a
		dc.b   0
		dc.b   1
		dc.b $70 ; p
		dc.b $65 ; e
		dc.b   0
		dc.b   0
		dc.b $D2 ; Ò
		dc.b $86 ; †
		dc.b $FC ; ü
		dc.b   0
		dc.b   2
		dc.b $48 ; H
		dc.b $43 ; C
		dc.b $4A ; J
		dc.b $43 ; C
		dc.b $66 ; f
		dc.b   2
		dc.b $52 ; R
		dc.b $40 ; @
		dc.b $D0 ; Ð
		dc.b $69 ; i
		dc.b   0
		dc.b  $E
		dc.b $20
		dc.b $6D ; m
		dc.b   0
		dc.b $38 ; 8
		dc.b $41 ; A
		dc.b $E8 ; è
		dc.b   0
		dc.b $20
		dc.b $40 ; @
		dc.b $E7 ; ç
		dc.b $46 ; F
		dc.b $FC ; ü
		dc.b $27 ; '
		dc.b   0
		dc.b $30 ; 0
		dc.b   0
		dc.b $3F ; ?
		dc.b   0
		dc.b $48 ; H
		dc.b $40 ; @
		dc.b $30 ; 0
		dc.b $1F
		dc.b $20
		dc.b $48 ; H
		dc.b   1
		dc.b $C8 ; È
		dc.b   0
		dc.b   1
		dc.b $D1 ; Ñ
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   8
		dc.b   1
		dc.b $C8 ; È
		dc.b   0
		dc.b   1
		dc.b $30 ; 0
		dc.b   4
		dc.b $3F ; ?
		dc.b   4
		dc.b $48 ; H
		dc.b $40 ; @
		dc.b $30 ; 0
		dc.b $1F
		dc.b $20
		dc.b $4A ; J
		dc.b   1
		dc.b $C8 ; È
		dc.b   0
		dc.b   1
		dc.b $D1 ; Ñ
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   8
		dc.b   1
		dc.b $C8 ; È
		dc.b   0
		dc.b   1
		dc.b $46 ; F
		dc.b $DF ; ß
		dc.b $60 ; `
		dc.b   0
		dc.b   0
		dc.b $74 ; t
		dc.b $76 ; v
		dc.b   0
		dc.b $61 ; a
		dc.b   0
		dc.b   0
		dc.b $E6 ; æ
		dc.b $65 ; e
		dc.b   0
		dc.b   0
		dc.b $74 ; t
		dc.b $36 ; 6
		dc.b   0
		dc.b $52 ; R
		dc.b $40 ; @
		dc.b $52 ; R
		dc.b $43 ; C
		dc.b $20
		dc.b $6D ; m
		dc.b   0
		dc.b $38 ; 8
		dc.b $45 ; E
		dc.b $E8 ; è
		dc.b   0
		dc.b $30 ; 0
		dc.b $38 ; 8
		dc.b   0
		dc.b $61 ; a
		dc.b   0
		dc.b   0
		dc.b $FA ; ú
		dc.b $65 ; e
		dc.b   0
		dc.b   0
		dc.b $5C ; \
		dc.b $86 ; †
		dc.b $FC ; ü
		dc.b   0
		dc.b   2
		dc.b $48 ; H
		dc.b $43 ; C
		dc.b $4A ; J
		dc.b $43 ; C
		dc.b $66 ; f
		dc.b   2
		dc.b $53 ; S
		dc.b $40 ; @
		dc.b $90 ; 
		dc.b $69 ; i
		dc.b   0
		dc.b  $E
		dc.b $20
		dc.b $6D ; m
		dc.b   0
		dc.b $38 ; 8
		dc.b $41 ; A
		dc.b $E8 ; è
		dc.b   0
		dc.b $20
		dc.b $40 ; @
		dc.b $E7 ; ç
		dc.b $46 ; F
		dc.b $FC ; ü
		dc.b $27 ; '
		dc.b   0
		dc.b $30 ; 0
		dc.b   0
		dc.b $3F ; ?
		dc.b   0
		dc.b $48 ; H
		dc.b $40 ; @
		dc.b $30 ; 0
		dc.b $1F
		dc.b $20
		dc.b $48 ; H
		dc.b   1
		dc.b $C8 ; È
		dc.b   0
		dc.b   1
		dc.b $D1 ; Ñ
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   8
		dc.b   1
		dc.b $C8 ; È
		dc.b   0
		dc.b   1
		dc.b $30 ; 0
		dc.b   4
		dc.b $3F ; ?
		dc.b   4
		dc.b $48 ; H
		dc.b $40 ; @
		dc.b $30 ; 0
		dc.b $1F
		dc.b $20
		dc.b $4A ; J
		dc.b   1
		dc.b $C8 ; È
		dc.b   0
		dc.b   1
		dc.b $D1 ; Ñ
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   8
		dc.b   1
		dc.b $C8 ; È
		dc.b   0
		dc.b   1
		dc.b $46 ; F
		dc.b $DF ; ß
		dc.b $44 ; D
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b $4C ; L
		dc.b $DF ; ß
		dc.b   7
		dc.b $1F
		dc.b $4E ; N
		dc.b $75 ; u
		dc.b $44 ; D
		dc.b $FC ; ü
		dc.b   0
		dc.b   1
		dc.b $60 ; `
		dc.b $F4 ; ô

; =============== S U B	R O U T	I N E =======================================


sub_97F2:				; CODE XREF: sub_985A+22p
		movem.l	d1-d5/a1-a4,-(sp)
		moveq	#0,d2
		moveq	#1,d3
		moveq	#2,d4
		movea.l	a1,a2

loc_97FE:				; CODE XREF: sub_97F2+4Ej
		movea.l	a2,a3

loc_9800:				; CODE XREF: sub_97F2+3Cj
		adda.l	#2,a3
		movea.l	a3,a4

loc_9808:				; CODE XREF: sub_97F2+30j
		adda.l	#2,a4
		move.w	(a3),d0
		cmp.w	(a2),d0
		bne.s	loc_981E
		move.w	(a4),d0
		cmp.w	(a2),d0
		bne.s	loc_981E
		move.w	(a2),d0
		bra.s	loc_9846
; ---------------------------------------------------------------------------

loc_981E:				; CODE XREF: sub_97F2+20j sub_97F2+26j
		addq.w	#1,d4
		cmp.w	d4,d1
		bgt.w	loc_9808
		addq.w	#1,d3
		move.w	d3,d5
		addq.w	#1,d5
		cmp.w	d5,d1
		bgt.w	loc_9800
		adda.l	#2,a2
		addq.w	#1,d2
		move.w	d2,d5
		addq.w	#2,d5
		cmp.w	d5,d1
		bgt.w	loc_97FE
		bra.s	loc_9850
; ---------------------------------------------------------------------------

loc_9846:				; CODE XREF: sub_97F2+2Aj
		move	#0,ccr

loc_984A:				; CODE XREF: sub_97F2+66j
		movem.l	(sp)+,d1-d5/a1-a4
		rts
; ---------------------------------------------------------------------------

loc_9850:				; CODE XREF: sub_97F2+52j
		move.w	#$FFFF,d0
		move	#1,ccr
		bra.s	loc_984A
; End of function sub_97F2


; =============== S U B	R O U T	I N E =======================================


sub_985A:				; CODE XREF: ROM:00008FB2p
		movem.l	d1-d2/a0-a2,-(sp)
		move.w	#8,d1
		move.w	d1,d2
		movea.l	$38(a5),a0
		lea	$30(a0),a0
		lea	$5E(a5),a1
		movea.l	a1,a2
		bsr.w	sub_94FC
		move.w	d2,d1
		asr.w	#1,d1
		movea.l	a2,a1
		bsr.w	sub_97F2
		movem.l	(sp)+,d1-d2/a0-a2
		rts
; End of function sub_985A

; ---------------------------------------------------------------------------
		dc.b $48 ; H
		dc.b $E7 ; ç
		dc.b $20
		dc.b $E0 ; à
		dc.b $32 ; 2
		dc.b $3C ; <
		dc.b   0
		dc.b   8
		dc.b $34 ; 4
		dc.b   1
		dc.b $20
		dc.b $6D ; m
		dc.b   0
		dc.b $38 ; 8
		dc.b $41 ; A
		dc.b $E8 ; è
		dc.b   0
		dc.b $20
		dc.b $43 ; C
		dc.b $ED ; í
		dc.b   0
		dc.b $5E ; ^
		dc.b $24 ; $
		dc.b $49 ; I
		dc.b $61 ; a
		dc.b   0
		dc.b $FC ; ü
		dc.b $5C ; \
		dc.b $32 ; 2
		dc.b   2
		dc.b $E2 ; â
		dc.b $41 ; A
		dc.b $22 ; "
		dc.b $4A ; J
		dc.b $61 ; a
		dc.b   0
		dc.b $FF
		dc.b $48 ; H
		dc.b $4C ; L
		dc.b $DF ; ß
		dc.b   7
		dc.b   4
		dc.b $4E ; N
		dc.b $75 ; u

; =============== S U B	R O U T	I N E =======================================


sub_98B2:				; CODE XREF: ROM:00008F00p
		movem.l	d0-d1,-(sp)
		moveq	#0,d0
		move.b	(byte_400001).l,d0
		btst	#7,d0
		bne.w	loc_991C
		move.l	#$2000,d1
		andi.b	#7,d0

loc_98D0:				; CODE XREF: sub_98B2+20j
		asl.l	#1,d1
		dbf	d0,loc_98D0
		cmp.l	$30(a5),d1
		bne.s	loc_98E2
		cmp.l	$34(a5),d1
		beq.s	loc_9916

loc_98E2:				; CODE XREF: sub_98B2+28j
		move.l	d1,$30(a5)
		move.l	d1,$34(a5)
		move.l	off_88D6,$3C(a5)
		add.l	d1,$3C(a5)
		move.l	$3C(a5),$38(a5)
		subi.l	#$80,$38(a5) ; '€'
		move.w	#$FFFD,$2E(a5)
		asr.l	#1,d1

loc_990A:				; CODE XREF: sub_98B2+62j
		addq.w	#1,$2E(a5)
		subi.l	#$40,d1	; '@'
		bgt.s	loc_990A

loc_9916:				; CODE XREF: sub_98B2+2Ej sub_98B2+6Ej
		movem.l	(sp)+,d0-d1
		rts
; ---------------------------------------------------------------------------

loc_991C:				; CODE XREF: sub_98B2+10j
		move	#1,ccr
		bra.s	loc_9916
; End of function sub_98B2


; =============== S U B	R O U T	I N E =======================================


sub_9922:				; CODE XREF: ROM:00008F08p
		movem.l	d0/a1-a2,-(sp)
		movea.l	off_88DA,a2
		bset	#0,(a2)
		movea.l	off_88D6,a1
		adda.l	#1,a1
		move.b	(a1),d0
		move.b	#$5A,(a1) ; 'Z'
		cmpi.b	#$5A,(a1) ; 'Z'
		bne.s	loc_9962
		move.b	#$A5,(a1)
		cmpi.b	#$A5,(a1)
		bne.s	loc_9962
		move.b	d0,(a1)
		move	#0,ccr

loc_9954:				; CODE XREF: sub_9922+44j
		move	sr,-(sp)
		bclr	#0,(a2)
		move	(sp)+,sr
		movem.l	(sp)+,d0/a1-a2
		rts
; ---------------------------------------------------------------------------

loc_9962:				; CODE XREF: sub_9922+20j sub_9922+2Aj
		move	#1,ccr
		bra.s	loc_9954
; End of function sub_9922

; ---------------------------------------------------------------------------
		dc.b $48 ; H
		dc.b $E7 ; ç
		dc.b $E0 ; à
		dc.b $C0 ; À
		dc.b $53 ; S
		dc.b $41 ; A
		dc.b $14
		dc.b $19
		dc.b $41 ; A
		dc.b $FA ; ú
		dc.b   0
		dc.b $26 ; &
		dc.b $30 ; 0
		dc.b $18
		dc.b $B4 ; ´
		dc.b $18
		dc.b $65 ; e
		dc.b $18
		dc.b $B4 ; ´
		dc.b $18
		dc.b $63 ; c
		dc.b   6
		dc.b $51 ; Q
		dc.b $C8 ; È
		dc.b $FF
		dc.b $F6 ; ö
		dc.b $60 ; `
		dc.b  $E
		dc.b $51 ; Q
		dc.b $C9 ; É
		dc.b $FF
		dc.b $E8 ; è
		dc.b $44 ; D
		dc.b $FC ; ü
		dc.b   0
		dc.b   0
		dc.b $4C ; L
		dc.b $DF ; ß
		dc.b   3
		dc.b   7
		dc.b $4E ; N
		dc.b $75 ; u
		dc.b $44 ; D
		dc.b $FC ; ü
		dc.b   0
		dc.b   1
		dc.b $60 ; `
		dc.b $F4 ; ô
		dc.b   0
		dc.b   2
		dc.b $30 ; 0
		dc.b $39 ; 9
		dc.b $41 ; A
		dc.b $5A ; Z
		dc.b $5F ; _
		dc.b $5F ; _

	dcb.b 608, $FF

unk_9C00:
	incbin "misc\nemesis_9C00.bin"

unk_B9DA:
	incbin "misc\enigma_B9DA.bin"

unk_BAAE:
	incbin "misc\nemesis_BAAE.bin"

unk_BAC8:
	incbin "misc\enigma_BAC8.bin"

unk_BAEC:
	incbin "misc\enigma_BAEC.bin"

unk_BB06:
	incbin "misc\enigma_BB06.bin"

dword_BB46:	dc.l 0			; DATA XREF: sub_1CFA+250o
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AAA
		dc.l $AADDD
		dc.l $ADDDDD
		dc.l $AEDDDDD
		dc.l $AEEDDDDD
		dc.l $AEEEDDDD
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AAAAAAAA
		dc.l $CCCCCCBB
		dc.l $DCCCCCCB
		dc.l $DCCCCCCB
		dc.l $DDCCCCCC
		dc.l $DDCCCCCC
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AAAAAAAA
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AAAAAAAA
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AA00000A
		dc.l $BA000AAD
		dc.l $BA00ADDD
		dc.l $BA0AEDDD
		dc.l $BAAEEEDD
		dc.l $BAAEEEDD
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AAAAAAAA
		dc.l $DDDCCCCC
		dc.l $DDDCCCCC
		dc.l $DDDDCCCC
		dc.l $DDDDCCCC
		dc.l $DDDDDCCC
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AAAAAAAA
		dc.l $CBBBBBBB
		dc.l $CBBBBBBB
		dc.l $CCBBBBBB
		dc.l $CCBBBBBB
		dc.l $CCCBBBBB
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AAAAAAAA
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AAAAA000
		dc.l $BBBBA000
		dc.l $BBBBA000
		dc.l $BBBBA00A
		dc.l $BBBBA0AE
		dc.l $BBBBAAEE
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AAAAA
		dc.l $AADDDCC
		dc.l $ADDDDDCC
		dc.l $DDDDDDDC
		dc.l $EDDDDDDC
		dc.l $EDDDDDDD
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AAAAAAAA
		dc.l $CCCCBBBB
		dc.l $CCCCBBBB
		dc.l $CCCCCBBB
		dc.l $CCCCCBBB
		dc.l $CCCCCCBB
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AAAAAAAA
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AAAAAAAA
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $A0000000
		dc.l $A0000000
		dc.l $A0000000
		dc.l $A0000000
		dc.l $A0000000
		dc.l $A0000000
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AA
		dc.l $ACB
		dc.l $ACCC
		dc.l $ACCCC
		dc.l $ACCCC
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AAAAAAAA
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $CBBBBBBB
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $A0000AAA
		dc.l $BAA0000A
		dc.l $BBBA000A
		dc.l $BBBBA00A
		dc.l $BBBBBA0A
		dc.l $BBBBBA0A
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AA0AA000
		dc.l $A0A0A
		dc.l $A0A0A
		dc.l $A00A0
		dc.l $A0000
		dc.l $A0000
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AA000000
		dc.l $A000000
		dc.l $A000000
		dc.l $A000000
		dc.l $A000000
		dc.l $A000000
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $A
		dc.l $A
		dc.l $A
		dc.l $A
		dc.l $A
		dc.l $A
		dc.l $A
		dc.l $A
		dc.l $A
		dc.l $A
		dc.l $A
		dc.l $A
		dc.l $A
		dc.l $A
		dc.l 0
		dc.l $AEEEDDDD
		dc.l $EEEEEDDD
		dc.l $EEEEEDDD
		dc.l $EEEEEEDD
		dc.l $EEEEEEDA
		dc.l $EEEEEEEA
		dc.l $EEEEEEEA
		dc.l $FEEEEEEA
		dc.l $FEEEEEEA
		dc.l $FFEEEEEA
		dc.l $FFEEEEEA
		dc.l $FFFEEEEA
		dc.l $FFFEEEEA
		dc.l $FFFFEEEA
dword_C0FE:	dc.l $FFFFEEEE
		dc.l $AFFFFEEE
		dc.l $DDDCCCCC
		dc.l $DDAAAAAA
		dc.l $DADDCCCC
		dc.l $ADDDCCCC
		dc.l $DDDDDCCC
		dc.l $DDDDDCCC
		dc.l $DDDDDDCC
		dc.l $DDDDDDCC
		dc.l $DDDDDDDA
		dc.l $EDDDDDDC
		dc.l $EDDDDDDD
		dc.l $EEDDDDDD
		dc.l $EEDDDDDD
		dc.l $EEEDDDDD
		dc.l $AAEDDDDD
		dc.l $EEAAAAAA
		dc.l $CBBBBBBB
		dc.l $AAAAAAAA
		dc.l $CCBBBBBB
		dc.l $CCBBBBBB
		dc.l $CCCBBBBB
		dc.l $CCCBBBBB
		dc.l $CCCCBBBB
		dc.l $CCCCBBBB
		dc.l $AAAAAAAA
		dc.l $CCCCCBBB
		dc.l $CCCCCCBB
		dc.l $CCCCCCBB
		dc.l $DCCCCCCB
		dc.l $DCCCCCCB
		dc.l $DDCCCCCC
		dc.l $AAAAAACC
		dc.l $BBBBBBBB
		dc.l $AAAAAAAA
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $AAAAAAAA
		dc.l $AA000000
		dc.l $BBAA0000
		dc.l $BBBBA000
		dc.l $BBBBBA00
		dc.l $BBBBBBA0
		dc.l $BBBBBBBA
		dc.l $BBBBBBBB
		dc.l $BAEEEEED
		dc.l $AAEEEEED
		dc.l $BAEEEEEE
		dc.l $BAEEEEEE
		dc.l $BAEEEEEE
		dc.l $BAEEEEEE
		dc.l $BAFEEEEE
		dc.l $BAFEEEEE
		dc.l $AAFFEEEE
		dc.l $AFFEEEE
		dc.l $AFFFEEE
		dc.l $AFFFEEE
		dc.l $AFFFFEE
		dc.l $AFFFFEE
		dc.l $AFFFFFE
		dc.l $AAFFFFFE
		dc.l $DDDDDCCC
		dc.l $DDDDDAAA
		dc.l $DDDDADCC
		dc.l $DDDADDDC
		dc.l $EDADDDDC
		dc.l $EDADDDDD
		dc.l $EEADDDDD
		dc.l $EEADDDDD
		dc.l $EEADDDDD
		dc.l $EEADDDDD
		dc.l $EEAEDDDD
		dc.l $EEAEDDDD
		dc.l $EEAEEDDD
		dc.l $EEAEEDDD
		dc.l $EEAEEEDD
		dc.l $EEAAAAAA
		dc.l $CCCBBBBB
		dc.l $AAAAAAAA
		dc.l $CCCCBBBB
		dc.l $CCCCCBBB
		dc.l $CCCCCBBB
		dc.l $CCCCCCBB
		dc.l $CCCCCCBB
		dc.l $DCCCCCCB
		dc.l $AAAAAAAA
		dc.l $DDCCCCCC
		dc.l $DDCCCCCC
		dc.l $DDDCCCCC
		dc.l $DDDCCCCC
		dc.l $DDDDCCCC
		dc.l $DDDDCCCC
		dc.l $AAAAAAAA
		dc.l $BBBBBBBB
		dc.l $AAAAAAAA
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $AAAAAAAA
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $CBBBBBBB
		dc.l $CBBBBBBB
		dc.l $CCBBBBBB
		dc.l $CCBBBBBB
		dc.l $AAAAAAAA
		dc.l $BBBBAAEE
		dc.l $AAAAAEEE
		dc.l $BBBBAEEE
		dc.l $BBBBAEEE
		dc.l $BBBBAEEE
		dc.l $BBBBAEEE
		dc.l $BBBBAFEE
		dc.l $BBBBAFEE
		dc.l $AAAAAFFE
		dc.l $A000AFFE
		dc.l $A000AFFF
		dc.l $A000AFFF
		dc.l $A000AFFF
		dc.l $A000AFFF
		dc.l $A000AFFF
		dc.l $A000AFFF
		dc.l $EEDDDDDD
		dc.l $EEDDDDDA
		dc.l $EEEDDDAD
		dc.l $EEEDDADD
		dc.l $EEEEADDD
		dc.l $EEEEADDD
		dc.l $EEEEADDD
		dc.l $EEEEADDD
		dc.l $EEEEAEDD
		dc.l $EEEEAEDD
		dc.l $EEEEAEED
		dc.l $EEEEAEED
		dc.l $FEEEAEEE
		dc.l $FEEEAEEE
		dc.l $FFEEAEEE
		dc.l $FFEEAEEE
		dc.l $CCCCCCBB
		dc.l $AAAAAAAA
		dc.l $DCCCCCCB
		dc.l $DDCCCCCC
		dc.l $DDCCCCCC
		dc.l $DDDCCCCC
		dc.l $DDDCCCCC
		dc.l $DDDDCCCC
		dc.l $DDDDCAAA
		dc.l $DDDDACCC
		dc.l $DDDDACCC
		dc.l $DDDDADCC
		dc.l $DDDDADCC
		dc.l $DDDDADDC
		dc.l $EDDDADDC
		dc.l $EDDDAAAA
		dc.l $BBBBBBBB
		dc.l $AAAAAAAA
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $CBBBBBBB
		dc.l $CBBBBBBB
		dc.l $CCBBBBBB
		dc.l $AAAAAAAA
		dc.l $CCCBBBBB
		dc.l $CCCBBBBB
		dc.l $CCCCBBBB
		dc.l $CCCCBBBB
		dc.l $CCCCCBBB
		dc.l $CCCCCBBB
		dc.l $AAAAAAAA
		dc.l $BBBBBBBB
		dc.l $AAAAAAAA
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $AAAAAAAA
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $A0000000
		dc.l $A0000000
		dc.l $A0000000
		dc.l $A0000000
		dc.l $A0000000
		dc.l $A0000000
		dc.l $A0000000
		dc.l $A000000A
		dc.l $A000000A
		dc.l $A00000AE
		dc.l $A00000AE
		dc.l $A00000AE
		dc.l $A0000AEE
		dc.l $A0000AEE
		dc.l $A0000AEE
		dc.l $A000AEEE
		dc.l $ACCCCC
		dc.l $ADCCCC
		dc.l $ADDCCCC
		dc.l $ADDDCCC
		dc.l $ADDDDCCC
		dc.l $ADDDDDCC
		dc.l $ADDDDDCC
		dc.l $DDDDDDDC
		dc.l $EDDDDDDC
		dc.l $EDDDDDDD
		dc.l $EEDDDDDD
		dc.l $EEDDDDDD
		dc.l $EEEDDDDD
		dc.l $EEEDDDDA
		dc.l $EEEEDDDA
		dc.l $EEEEDDDA
		dc.l $CBBBBBBB
		dc.l $CCBBBBBB
		dc.l $CCBBAABB
		dc.l $CCCABBAB
		dc.l $CCCABBAB
		dc.l $CCACBBBA
		dc.l $CCACBBBA
		dc.l $CACCCBBB
		dc.l $CACCCBBB
		dc.l $CACCCCBB
		dc.l $ACCCCCBB
		dc.l $ACCCCCCB
		dc.l $ACCCCCCB
		dc.l $DDCCCCCC
		dc.l $DDCCCCCC
		dc.l $DDDCCCCC
		dc.l $BBBBBBA0
		dc.l $BBBBBBA0
		dc.l $BBBBBBBA
		dc.l $BBBBBBBA
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $ABBBBBBB
		dc.l $ABBBBBBB
		dc.l $ABBBBBBB
		dc.l $BABBBBBB
		dc.l $BABBBBBB
		dc.l $BABBBBBB
		dc.l $BBABBBBB
		dc.l $BBABBBBB
		dc.l $CBABBBBB
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $A0000000
		dc.l $A0000000
		dc.l $A0000000
		dc.l $BA000000
		dc.l $BA000000
		dc.l $BBA00000
		dc.l $BBA00000
		dc.l $BBA00000
		dc.l $BBBA0000
		dc.l $BBBA0000
		dc.l $BBBA0000
		dc.l $BBBBA000
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AA
		dc.l $AF
		dc.l $AF
		dc.l $AF
		dc.l $AF
		dc.l $AF
		dc.l $AF
		dc.l $AA
		dc.l $AF
		dc.l $AF
		dc.l $AFFFFEEE
		dc.l $AFFFFEE
		dc.l $AFFFFEE
		dc.l $AFFFFE
		dc.l $AFFFE
		dc.l $AAAF
		dc.l $AAAAAAAA
		dc.l $FFFFFFFF
		dc.l $FFFFFFFF
		dc.l $FFFFFFFF
		dc.l $FFFFFFFF
		dc.l $FFFFFFFF
		dc.l $FFFFFFFF
		dc.l $AAAAAAAA
		dc.l $FFFFFFFF
		dc.l $FFFFFFFF
		dc.l $EEEEDDDD
		dc.l $EEEEEDDD
		dc.l $EEEEEDDD
		dc.l $EEEEEEDD
		dc.l $EEEEEEDD
		dc.l $EEEEEEED
		dc.l $AAAAAAAA
		dc.l $FEEEEEEE
		dc.l $FEEEEEEE
		dc.l $FFEEEEEE
		dc.l $FFEEEEEE
		dc.l $FFFEEEEE
		dc.l $FFFEEEEE
		dc.l $AAAAAAAA
		dc.l $FFFFEEEE
		dc.l $FFFFFEEE
		dc.l $DDDCCCAC
		dc.l $DDDCCCCA
		dc.l $DDDDCCCC
		dc.l $DDDDCCCC
		dc.l $DDDDDCCC
		dc.l $DDDDDCCC
		dc.l $ADDDDDCC
		dc.l $DDDDDDCC
		dc.l $DDDDDDDC
		dc.l $EDDDDDDC
		dc.l $EDDDDDDD
		dc.l $EEDDDDDD
		dc.l $EEDDDDDA
		dc.l $AAAAAAAD
		dc.l $EEEDDDDD
		dc.l $EEEEDDDD
		dc.l $CBBBBBBB
		dc.l $CBBBBBBB
		dc.l $ACBBBBBB
		dc.l $ACBBBBBB
		dc.l $ACCBBBBB
		dc.l $ACCBBBBB
		dc.l $ACCCBBBB
		dc.l $ACCCBBBB
		dc.l $ACCCCBBB
		dc.l $ACCCCBBB
		dc.l $ACCCCCBB
		dc.l $ACCCCCBB
		dc.l $DCCCCCCB
		dc.l $DCCCCCCB
		dc.l $DDCCCCCC
		dc.l $DDCCCCCC
		dc.l $AAFFFFFF
		dc.l $BAFFFFFF
		dc.l $BAFFFFFF
		dc.l $BAFFFFFF
		dc.l $BAFFFFFF
		dc.l $BAFFFFFF
		dc.l $BAFFFFFF
		dc.l $BAFFFFFF
		dc.l $BAFFFFFF
		dc.l $BAFFFFFF
		dc.l $BAFFFFFF
		dc.l $BAFFFFFF
		dc.l $BAFFFFFF
		dc.l $BAFFFFFF
		dc.l $BAFFFFFF
		dc.l $A0AFFFFF
		dc.l $EEAEEEED
		dc.l $EEAEEEED
		dc.l $FEAEEEEE
		dc.l $FEAEEEEE
		dc.l $FFAEEEEE
		dc.l $FFAEEEEE
		dc.l $FFAEEEEE
		dc.l $FFAEEEEE
		dc.l $FFAFEEEE
		dc.l $FFAFEEEE
		dc.l $FFAFFEEE
		dc.l $FFFAFEEE
		dc.l $FFFFAFEE
		dc.l $FFFFFAAA
		dc.l $FFFFFFFE
		dc.l $FFFFFFFE
		dc.l $DDDDDCCC
		dc.l $DDDDDDCC
		dc.l $DDDDDDCC
		dc.l $DDDDDDDC
		dc.l $EDDDDDDC
		dc.l $EDDDDDDD
		dc.l $AAAAAAAA
		dc.l $EEDDDDDD
		dc.l $EEEDDDDD
		dc.l $EEEDDDDD
		dc.l $EEEEDDDD
		dc.l $EEEEDDDD
		dc.l $EEEEEDDD
		dc.l $AAAAAAAA
		dc.l $EEEEEEDD
		dc.l $EEEEEEDD
		dc.l $CCCBBBBB
		dc.l $CCCCBBBB
		dc.l $CCCCBBBB
		dc.l $CCCCCBBB
		dc.l $CCCCCBBB
		dc.l $CCCCCCBB
		dc.l $AAAAAAAA
		dc.l $DCCCCCCB
		dc.l $DCCCCCCB
		dc.l $DDCCCCCC
		dc.l $DDCCCCCC
		dc.l $DDDCCCCC
		dc.l $DDDCCCCC
		dc.l $AAAAAAAA
		dc.l $DDDDCCCC
		dc.l $DDDDDCCC
		dc.l $A000AFFF
		dc.l $A000AFFF
		dc.l $A000AFFF
		dc.l $A000AFFF
		dc.l $A000AFFF
		dc.l $A000AFFF
		dc.l $AAAAAFFF
		dc.l $BBBBAFFF
		dc.l $BBBBAFFF
		dc.l $BBBBAFFF
		dc.l $BBBBAFFF
		dc.l $CBBBAFFF
		dc.l $CBBBAFFF
		dc.l $AAAAAFFF
		dc.l $CCBBAFFF
		dc.l $CCCBAAFF
		dc.l $FFFEAEEE
		dc.l $FFFEAEEE
		dc.l $FFFFAEEE
		dc.l $FFFFAEEE
		dc.l $FFFFAEEE
		dc.l $FFFFAEEE
		dc.l $FFFFAFEE
		dc.l $FFFFAFEE
		dc.l $FFFFAFFE
		dc.l $FFFFAFFE
		dc.l $FFFFAFFF
		dc.l $FFFFFAFF
		dc.l $FFFFFFAF
		dc.l $FFFFFFFA
		dc.l $FFFFFFFF
		dc.l $FFFFFFFF
		dc.l $EEDDADDD
		dc.l $EEDDADDD
		dc.l $EEEDADDD
		dc.l $EEEDADDD
		dc.l $EEEEADDD
		dc.l $EEEEADDD
		dc.l $EEEEAAAA
		dc.l $EEEEEDDD
		dc.l $EEEEEEDD
		dc.l $EEEEEEDD
		dc.l $EEEEEEED
		dc.l $EEEEEEED
		dc.l $FEEEEEEE
		dc.l $AAAAAAAA
		dc.l $FFEEEEEE
		dc.l $FFEEEEEE
		dc.l $CCCCCCBA
		dc.l $DCCCCCCA
		dc.l $DCCCCCCA
		dc.l $DDCCCCCA
		dc.l $DDCCCCCA
		dc.l $DDDCCCCA
		dc.l $DDDCCCCA
		dc.l $DDDDCCCA
		dc.l $DDDDCCCA
		dc.l $DDDDDCCA
		dc.l $DDDDDCCA
		dc.l $DDDDDDCA
		dc.l $DDDDDDCA
		dc.l $AAAAAAAA
		dc.l $EDDDDDDC
		dc.l $EDDDDDDD
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $CBBBBBBB
		dc.l $CBBBBBBB
		dc.l $CCBBBBBB
		dc.l $CCBBBBBB
		dc.l $CCCBBBBB
		dc.l $CCCBBBBB
		dc.l $CCCCBBBB
		dc.l $CCCCBBBB
		dc.l $CCCCCBBB
		dc.l $CCCCCBBB
		dc.l $CCCCCCBB
		dc.l $A000AFEE
		dc.l $A000AFEE
		dc.l $A00AFFFE
		dc.l $A00AFFFE
		dc.l $A0AFFFFF
		dc.l $A0AFFFFF
		dc.l $A0AFFFFF
		dc.l $AAFFFFFF
		dc.l $AAFFFFFF
		dc.l $AAFFFFFF
		dc.l $AFFFFFFF
		dc.l $AFFFFFFF
		dc.l $AFFFFFFF
		dc.l $AFFFFFFF
		dc.l $AFFFFFFF
		dc.l $AFFFFFFF
		dc.l $EEEEEDAD
		dc.l $EEEEEDAD
		dc.l $EEEEEEAD
		dc.l $EEEEEADD
		dc.l $EEEEEAED
		dc.l $EEEEEAED
		dc.l $FEEEAEEE
		dc.l $FEEEAEEE
		dc.l $FFEEAEEE
		dc.l $FFEEAEEE
		dc.l $FFFAEEEE
		dc.l $FFFAEEEE
		dc.l $FFFAEEEE
		dc.l $FFAFEEEE
		dc.l $FFAFFEEE
		dc.l $FFAFFEEE
		dc.l $DDDCCCCC
		dc.l $DDDDCCCC
		dc.l $DDDDCCCC
		dc.l $DDDDDACC
		dc.l $DDDDAAAC
		dc.l $DDDDAAAC
		dc.l $DDDDAAAC
		dc.l $DDDDDDDC
		dc.l $EDDDDDDC
		dc.l $EDDDDDDD
		dc.l $EEDDDDDD
		dc.l $EEDDDDDD
		dc.l $EEEDDDDD
		dc.l $EEAAAAAA
		dc.l $EEAEDDDD
		dc.l $EEAEDDDD
		dc.l $CBBABBBB
		dc.l $CCBABBBB
		dc.l $CCBABBBB
		dc.l $CCCBABBB
		dc.l $CCCBABBB
		dc.l $CCCCABBB
		dc.l $CCCCBABB
		dc.l $CCCCCABB
		dc.l $CCCCCABB
		dc.l $CCCCCABB
		dc.l $CCCCCCAB
		dc.l $DCCCCCAB
		dc.l $DCCCCCAB
		dc.l $AAAAAAAC
		dc.l $DDCCCCCC
		dc.l $DDDCCCCC
		dc.l $BBBBA000
		dc.l $BBBBA000
		dc.l $BBBBBA00
		dc.l $BBBBBA00
		dc.l $BBBBBBA0
		dc.l $BBBBBBA0
		dc.l $BBBBBBA0
		dc.l $BBBBBBBA
		dc.l $BBBBBBBA
		dc.l $BBBBBBBA
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $CBBBBBBB
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $A0000000
		dc.l $A0000000
		dc.l $A0000000
		dc.l $A0000000
		dc.l $BA000000
		dc.l $BA000000
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AF
		dc.l $AF
		dc.l $AF
		dc.l $AF
		dc.l $AA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $FFFFFFFF
		dc.l $FFFFFFFF
		dc.l $FFFFFFFF
		dc.l $FFFFFFFF
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $FFFFFEEE
		dc.l $FFFFFFEE
		dc.l $FFFFFFEE
		dc.l $FFFFFFFE
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $EEEEDDDD
		dc.l $EEEEEDDD
		dc.l $EEEEEDDD
		dc.l $EEEEEEDD
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $DDDCCCCA
		dc.l $DDDCCCA0
		dc.l $DDDDCA00
		dc.l $DDDAA000
		dc.l $AAA00000
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AFFFFF
		dc.l $AFFFF
		dc.l $AFFF
		dc.l $AAF
		dc.l $A
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $FFFFFFFF
		dc.l $FFFFFFFF
		dc.l $FFFFFFFF
		dc.l $FFFFFFFF
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $EEEEEEED
		dc.l $EEEEEEED
		dc.l $FEEEEEEE
		dc.l $FEEEEEEE
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $DDDDDCCC
		dc.l $DDDDDDCC
		dc.l $DDDDDDCC
		dc.l $DDDDDDDC
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $CCCBAAFF
		dc.l $CCCCA0AF
		dc.l $CCCCA00A
		dc.l $CCCCA000
		dc.l $AAAAA000
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $FFFFFFFF
		dc.l $FFFFFFFF
		dc.l $FFFFFFFF
		dc.l $AAFFFFFF
		dc.l $AAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $FFFEEEEE
		dc.l $FFFEEEEE
		dc.l $FFFFEEEE
		dc.l $FFFFEEEE
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $EEDDDDDD
		dc.l $EEDDDDDD
		dc.l $EEEDDDDD
		dc.l $EEEDDDDD
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $CCCCCCBB
		dc.l $DCCCCCCB
		dc.l $DCCCCCCB
		dc.l $DDCCCCCC
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AFFFFFFF
		dc.l $AFFFFFFF
		dc.l $AFFFFFFF
		dc.l $AFFFFFFF
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $FAFFFFEE
		dc.l $FAFFFFEE
		dc.l $FAFFFFFE
		dc.l $FAFFFFFE
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $EEAEEDDD
		dc.l $EEAEEDDD
		dc.l $EEAEEEDD
		dc.l $EEAEEEDD
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $DDDCCCCC
		dc.l $DDDDCCCC
		dc.l $DDDDCCCC
		dc.l $DDDDDCCC
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $CBBBBBBB
		dc.l $CCBBBBBB
		dc.l $CCBBBBBB
		dc.l $CCCBBBBB
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $BA000000
		dc.l $BBA00000
		dc.l $BBA00000
		dc.l $BBA00000
		dc.l $AAA00000
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
dword_D046:	dc.l 1			; DATA XREF: sub_1CFA+27Co
		dc.l $20003
		dc.l $40005
		dc.l $60007
		dc.l $80009
		dc.l $A000B
		dc.l $C000D
		dc.l $E000F
		dc.l $100011
		dc.l $120013
		dc.l $140000
		dc.l $150016
		dc.l $170018
		dc.l $19001A
		dc.l $1B001C
		dc.l $1D001E
		dc.l $1F0020
		dc.l unk_210022
		dc.l unk_230024
		dc.l $250026
		dc.l $270028
		dc.l $29002A
dword_D09E:	dc.l 0			; DATA XREF: sub_1CFA+266o
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AAAAAAAA
		dc.l $AEEEEEEE
		dc.l $AEBBBBBB
		dc.l $AEBBBBBB
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AAAAAAAA
		dc.l $EEEEEEEE
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AAAAAAAA
		dc.l $EEEEEEEE
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AEBBBBBB
		dc.l $AEBBBBBB
		dc.l $AEBBBBBB
		dc.l $AEBBBBBB
		dc.l $AEBBBBBB
		dc.l $AEBBBBBB
		dc.l $AEBBBBB1
		dc.l $AEBBBBB1
		dc.l $AEBBBBB1
		dc.l $AEBBBBB1
		dc.l $AEBBBBB1
		dc.l $AEBBBBB1
		dc.l $AEBBBBBB
		dc.l $AEBBBBBB
		dc.l $AEBBBBBB
		dc.l $AEBBBBBB
		dc.l $BBBBBBB1
		dc.l $BBBB1111
		dc.l $BB111111
		dc.l $B1111121
		dc.l $11111112
		dc.l $11112129
		dc.l $11111999
		dc.l $11219999
		dc.l $11129999
		dc.l $2121999B
		dc.l $1212199B
		dc.l $21222229
		dc.l $12122222
		dc.l $22222222
		dc.l $B2222222
		dc.l $BBB22222
		dc.l $11121222
		dc.l $21212122
		dc.l $12122222
		dc.l $21212222
		dc.l $12222222
		dc.l $99999999
		dc.l $99999999
		dc.l $99BBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $22323232
		dc.l $22232333
		dc.l $32323233
		dc.l $23233333
		dc.l $222BBBBB
		dc.l $222323BB
		dc.l $22223232
		dc.l $23232323
		dc.l $22323233
		dc.l $99992323
		dc.l $99999933
		dc.l $BBBBBBB3
		dc.l $BBBBBBB3
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $333BBBBB
		dc.l $33333333
		dc.l $33333434
		dc.l $33333343
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $3BBBBBBB
		dc.l $23333BBB
		dc.l $33339999
		dc.l $33399999
		dc.l $3399999B
		dc.l $399999BB
		dc.l $B9999BBB
		dc.l $BB99BBBB
		dc.l $BB9BBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $349BBBBB
		dc.l $43499BBB
		dc.l $BBBBBBBB
		dc.l $33434343
		dc.l $B3343444
		dc.l $BB434344
		dc.l $BB344444
		dc.l $BB434444
		dc.l $BB444444
		dc.l $BB444444
		dc.l $BB444445
		dc.l $BB444444
		dc.l $BB444545
		dc.l $BB444454
		dc.l $BB454545
		dc.l $BB445454
		dc.l $BB454545
		dc.l $BB545455
		dc.l $BBBBBBBB
		dc.l $44444545
		dc.l $44444454
		dc.l $44454545
		dc.l $44445454
		dc.l $45454545
		dc.l $99999999
		dc.l $99999999
		dc.l $999BBBBB
		dc.l $999BBBBB
		dc.l $999BBBBB
		dc.l $999BBBBB
		dc.l $999BBBBB
		dc.l $999BBBBB
		dc.l $55555556
		dc.l $55555555
		dc.l $BBBBBBBB
		dc.l $45455555
		dc.l $54555555
		dc.l $45455556
		dc.l $55555555
		dc.l $45555656
		dc.l $99999999
		dc.l $99999999
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBB6B
		dc.l $BBBBB66B
		dc.l $5656566B
		dc.l $65666669
		dc.l $BBBB65BB
		dc.l $565656B9
		dc.l $55656699
		dc.l $56565699
		dc.l $65666699
		dc.l $56566699
		dc.l $99996699
		dc.l $99999699
		dc.l $BBBBBBB9
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $B9BBBBBB
		dc.l $99BBBBBB
		dc.l $99BBBBBB
		dc.l $BBBBBBBB
		dc.l $9BBBBBBB
		dc.l $9BBBBBBB
		dc.l $9BBBBBBB
		dc.l $9BBBBBB7
		dc.l $9BBBBB77
		dc.l $9BBBB777
		dc.l $9BBB7777
		dc.l $9BBB7777
		dc.l $9BB77777
		dc.l $BBB77777
		dc.l $BBB77777
		dc.l $BB777787
		dc.l $BB777778
		dc.l $BB778787
		dc.l $BB777878
		dc.l $BBBBBBBB
		dc.l $BBBBB777
		dc.l $BB777777
		dc.l $77777777
		dc.l $77777787
		dc.l $77777779
		dc.l $77778999
		dc.l $77799999
		dc.l $77999999
		dc.l $799999BB
		dc.l $89999BBB
		dc.l $9999BBBB
		dc.l $9999BBBB
		dc.l $999BBBBB
		dc.l $999BBBBB
		dc.l $999BBBBB
		dc.l $77878787
		dc.l $77787888
		dc.l $87878788
		dc.l $78788888
		dc.l $87878888
		dc.l $99999999
		dc.l $99999999
		dc.l $99BBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBB8BB
		dc.l $BBBBB88B
		dc.l $BBBBB818
		dc.l $BBBBB881
		dc.l $BBBBB811
		dc.l $8888BBBB
		dc.l $88888181
		dc.l $88888818
		dc.l $88818181
		dc.l $88881818
		dc.l $99999181
		dc.l $99999999
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $9BBBBBBB
		dc.l $11111111
		dc.l $81111111
		dc.l $11111111
		dc.l $BBBBBBBB
		dc.l $8BBBBB1B
		dc.l $1818111B
		dc.l $81111199
		dc.l $18111999
		dc.l $11119999
		dc.l $11199999
		dc.l $9199999B
		dc.l $BBB999BB
		dc.l $BBBB9BBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $1111111B
		dc.l $11111199
		dc.l $11111199
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $B9BBBBBB
		dc.l $99BBBBBB
		dc.l $99BBBBBB
		dc.l $9BBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBB1
		dc.l $99BBBBB2
		dc.l $99BBBB22
		dc.l $BBBBBBBB
		dc.l $BBBBBB11
		dc.l $BBBBB112
		dc.l $BBBBB121
		dc.l $BBBB1212
		dc.l $BBBB2121
		dc.l $BBB21222
		dc.l $BBB12122
		dc.l $BB122222
		dc.l $B1212229
		dc.l $B2222229
		dc.l $21222299
		dc.l $22222299
		dc.l $22222999
		dc.l $22222999
		dc.l $22229999
		dc.l $BBBBBBBB
		dc.l $212122BB
		dc.l $12222299
		dc.l $21222229
		dc.l $22222229
		dc.l $22222222
		dc.l $22222232
		dc.l $29222222
		dc.l $99922323
		dc.l $99992232
		dc.l $999B2323
		dc.l $99BBB233
		dc.l $99BBB323
		dc.l $9BBBBB33
		dc.l $9BBBBB33
		dc.l $BBBBBBB3
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $9BBBBBBB
		dc.l $9BBBBBBB
		dc.l $99BBBBBB
		dc.l $99BBBBBB
		dc.l $999BBBBB
		dc.l $399BBBBB
		dc.l $2999BBBB
		dc.l $3399BBBB
		dc.l $23999BBB
		dc.l $33399BBB
		dc.l $333999BB
		dc.l $333399BB
		dc.l $3333999B
		dc.l $3333499B
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBB33
		dc.l $BBBB3333
		dc.l $BBB33333
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBB44
		dc.l $BBB44444
		dc.l $B3434444
		dc.l $33343434
		dc.l $33333333
		dc.l $33333333
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBB5556
		dc.l $B5555555
		dc.l $44545455
		dc.l $44444445
		dc.l $44445599
		dc.l $44559999
		dc.l $34999999
		dc.l $5999999B
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBB6667
		dc.l $66666666
		dc.l $56565677
		dc.l $55566999
		dc.l $55999999
		dc.l $9999999B
		dc.l $99999BBB
		dc.l $999BBBBB
		dc.l $9BBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBB77777
		dc.l $67677779
		dc.l $77799999
		dc.l $99999999
		dc.l $99999BBB
		dc.l $99BBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBB111
		dc.l $7BB77771
		dc.l $9999BB99
		dc.l $9999BB99
		dc.l $9BBBB2BB
		dc.l $BBBBB2BB
		dc.l $BBBBB33B
		dc.l $BBBBB33B
		dc.l $BBBBB43B
		dc.l $BBBBB444
		dc.l $BBBBB454
		dc.l $BBBBB545
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BB212233
		dc.l $11122233
		dc.l $11222333
		dc.l $99999999
		dc.l $99999999
		dc.l $BBBBBBBB
		dc.l $9BBBBBBB
		dc.l $9BBBBBBB
		dc.l $99BBBBBB
		dc.l $99BBBBBB
		dc.l $99BBBBBB
		dc.l $999BBBBB
		dc.l $999BBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BB344454
		dc.l $33444545
		dc.l $33445455
		dc.l $34454555
		dc.l $22222222
		dc.l $99999999
		dc.l $BBB99999
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $55565656
		dc.l $55656666
		dc.l $56666667
		dc.l $66667677
		dc.l $66677777
		dc.l $22211717
		dc.l $99999772
		dc.l $BBB99996
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBB44
		dc.l $BBBBB454
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $66666666
		dc.l $66767676
		dc.l $67777777
		dc.l $77777771
		dc.l $77717111
		dc.l $17111111
		dc.l $11112121
		dc.l $22121222
		dc.l $62222223
		dc.l $B2323232
		dc.l $B3333333
		dc.l $44434343
		dc.l $44444444
		dc.l $54444444
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $6BBBBBBB
		dc.l $77777BBB
		dc.l $77777777
		dc.l $71711111
		dc.l $11111111
		dc.l $11111212
		dc.l $21212222
		dc.l $22222232
		dc.l $23232323
		dc.l $32323233
		dc.l $33333333
		dc.l $43333377
		dc.l $44441199
		dc.l $44229999
		dc.l $BAAAAABA
		dc.l $BBBABBBA
		dc.l $BBBABBBA
		dc.l $BBBABBBA
		dc.l $BBBABBBA
		dc.l $199BBBBB
		dc.l $1199BBBB
		dc.l $12199BBB
		dc.l $222999BB
		dc.l $324999BB
		dc.l $239999BB
		dc.l $359999BB
		dc.l $69999BBB
		dc.l $99999BBB
		dc.l $9999BBBB
		dc.l $99BBBBBB
		dc.l $BBBABBEA
		dc.l $ABAABBEA
		dc.l $BABABBEA
		dc.l $BBBABBEA
		dc.l $BBBABBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $AEBBBBBB
		dc.l $AEBBBBBB
		dc.l $AEBBBBBB
		dc.l $AEBBBBBB
		dc.l $AEBBBBBB
		dc.l $AEBBBBBB
		dc.l $AEBBBBBB
		dc.l $AEBBBBBB
		dc.l $AEBBBBB2
		dc.l $AEBBBB23
		dc.l $AEBBB222
		dc.l $AEBBBBB3
		dc.l $AEBBBBBB
		dc.l $AEBBBBBB
		dc.l $AEBBBBBB
		dc.l $AEBBBBBB
		dc.l $BBBB9232
		dc.l $BBBBBB99
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $B2BBBBBB
		dc.l $232B9BBB
		dc.l $223239BB
		dc.l $23232333
		dc.l $32333333
		dc.l $23233333
		dc.l $99333333
		dc.l $BB999333
		dc.l $BBBBB999
		dc.l $BBBBBBBB
		dc.l $32323333
		dc.l $23333333
		dc.l $99999999
		dc.l $BBB99999
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $3BBBBBBB
		dc.l $33333434
		dc.l $33434343
		dc.l $33343444
		dc.l $43434344
		dc.l $94344444
		dc.l $99999999
		dc.l $33343434
		dc.l $33334343
		dc.l $99943444
		dc.l $99999944
		dc.l $BBBBBB94
		dc.l $BBBBBBB4
		dc.l $BBBBBBB4
		dc.l $BBBBBB44
		dc.l $BBBBB444
		dc.l $BB444444
		dc.l $44444444
		dc.l $44444444
		dc.l $44444449
		dc.l $44444999
		dc.l $44999999
		dc.l $99999999
		dc.l $444499BB
		dc.l $4444999B
		dc.l $4444499B
		dc.l $44444999
		dc.l $44444999
		dc.l $44444999
		dc.l $44444999
		dc.l $44449999
		dc.l $44449999
		dc.l $4449999B
		dc.l $4499999B
		dc.l $499999BB
		dc.l $99999BBB
		dc.l $9999BBBB
		dc.l $99BBBBBB
		dc.l $BBBBBBBB
		dc.l $BB454545
		dc.l $BB545555
		dc.l $BB454555
		dc.l $BB555555
		dc.l $BB455555
		dc.l $BB555555
		dc.l $BB555556
		dc.l $BB555555
		dc.l $BB555656
		dc.l $BB555565
		dc.l $BB565656
		dc.l $BB556566
		dc.l $BB565656
		dc.l $B5656666
		dc.l $66565666
		dc.l $BBB99999
		dc.l $55555656
		dc.l $55555565
		dc.l $99999999
		dc.l $99999999
		dc.l $999BBBBB
		dc.l $999BBBBB
		dc.l $999BBBBB
		dc.l $999BBBBB
		dc.l $999BBBBB
		dc.l $999BBBBB
		dc.l $56666666
		dc.l $66666666
		dc.l $66666676
		dc.l $66666667
		dc.l $66667676
		dc.l $99999999
		dc.l $56566669
		dc.l $66666669
		dc.l $99999669
		dc.l $99999969
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $76767777
		dc.l $67677777
		dc.l $76767777
		dc.l $67777777
		dc.l $76777777
		dc.l $99999999
		dc.l $99BBBBBB
		dc.l $99BBBBBB
		dc.l $99BBBBBB
		dc.l $99BBBBBB
		dc.l $99BBBBBB
		dc.l $B9BBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBB7BB
		dc.l $BBBB87BB
		dc.l $777778B9
		dc.l $77878799
		dc.l $77787899
		dc.l $87878899
		dc.l $78788799
		dc.l $99998899
		dc.l $BB878787
		dc.l $BB787878
		dc.l $BB878788
		dc.l $BBB87878
		dc.l $BBB78888
		dc.l $BBB87888
		dc.l $BBBB8888
		dc.l $BBBB8888
		dc.l $BBBBB888
		dc.l $9BBBBB88
		dc.l $9BBBBBB8
		dc.l $9BBBBBBB
		dc.l $9BBBBBBB
		dc.l $9BBBBBBB
		dc.l $9BBBBBBB
		dc.l $9BBBBBBB
		dc.l $999BBBBB
		dc.l $999BBBBB
		dc.l $999BBBBB
		dc.l $899BBBBB
		dc.l $8999BBBB
		dc.l $8899BBBB
		dc.l $88899BBB
		dc.l $888899BB
		dc.l $8818199B
		dc.l $88818181
		dc.l $18181111
		dc.l $81818111
		dc.l $BB111111
		dc.l $BBB99111
		dc.l $BBBBB999
		dc.l $BBBBBBBB
		dc.l $BBBBB881
		dc.l $BBBBB811
		dc.l $BBBBB88B
		dc.l $BBBBB8BB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $11111111
		dc.l $11111111
		dc.l $11111111
		dc.l $11111111
		dc.l $11111111
		dc.l $99999999
		dc.l $11111111
		dc.l $11111111
		dc.l $99999999
		dc.l $99999999
		dc.l $99BBBBBB
		dc.l $9BBBBBBB
		dc.l $BBBBBBB1
		dc.l $BBBBBBB1
		dc.l $BBBBB111
		dc.l $BBB11111
		dc.l $11111111
		dc.l $11111111
		dc.l $11111111
		dc.l $11111999
		dc.l $11999999
		dc.l $99999999
		dc.l $11111999
		dc.l $11111999
		dc.l $11111999
		dc.l $11111999
		dc.l $11111999
		dc.l $11111999
		dc.l $11111999
		dc.l $11111999
		dc.l $11111199
		dc.l $11111119
		dc.l $11111999
		dc.l $11199999
		dc.l $19999999
		dc.l $999999B2
		dc.l $9999BB23
		dc.l $BBBBBBBB
		dc.l $9BBBBB22
		dc.l $9BBBB222
		dc.l $BBBBB222
		dc.l $BBBB2222
		dc.l $BBBB2222
		dc.l $BBB22222
		dc.l $BBB22223
		dc.l $BB222222
		dc.l $BB222323
		dc.l $92222239
		dc.l $92232329
		dc.l $22223299
		dc.l $23232399
		dc.l $22323999
		dc.l $23232999
		dc.l $B9999999
		dc.l $22222323
		dc.l $22222232
		dc.l $22232323
		dc.l $22223232
		dc.l $23232323
		dc.l $22323233
		dc.l $29999999
		dc.l $99999999
		dc.l $9999BBBB
		dc.l $999BBBBB
		dc.l $999BBBBB
		dc.l $99BBBBBB
		dc.l $99BBBBBB
		dc.l $9BBBBBBB
		dc.l $9BBBBBBB
		dc.l $BBBBBBBB
		dc.l $23232333
		dc.l $32333333
		dc.l $23233333
		dc.l $33333333
		dc.l $23333333
		dc.l $33333343
		dc.l $99999999
		dc.l $99999999
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $33333999
		dc.l $33434399
		dc.l $33343499
		dc.l $43434349
		dc.l $34343439
		dc.l $43434444
		dc.l $99343444
		dc.l $99944444
		dc.l $BBB44444
		dc.l $BBBB4444
		dc.l $BBBB4444
		dc.l $BBBBB444
		dc.l $BBBBB444
		dc.l $BBBBBB45
		dc.l $BBBBBB44
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $9BBBBBB3
		dc.l $9BBBBB32
		dc.l $99BBBB22
		dc.l $99BBBB22
		dc.l $999BBB22
		dc.l $499BBB52
		dc.l $4999BBB4
		dc.l $4499BBBB
		dc.l $44999BBB
		dc.l $45499BBB
		dc.l $445999BB
		dc.l $454599BB
		dc.l $5455599B
		dc.l $B9999999
		dc.l $B3333333
		dc.l $33333333
		dc.l $33332323
		dc.l $32222222
		dc.l $22222222
		dc.l $22222222
		dc.l $22212121
		dc.l $12111111
		dc.l $41111111
		dc.l $B3311111
		dc.l $BB922221
		dc.l $BBBB9992
		dc.l $BBBBBB99
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $33333334
		dc.l $32323224
		dc.l $22222224
		dc.l $22222222
		dc.l $22222121
		dc.l $12111111
		dc.l $11111111
		dc.l $11111111
		dc.l $11111717
		dc.l $11717177
		dc.l $17177777
		dc.l $22211111
		dc.l $99999999
		dc.l $BB999999
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $99999BBB
		dc.l $9999BBBB
		dc.l $999BBBBB
		dc.l $499BBBBB
		dc.l $2299BBBB
		dc.l $11229BBB
		dc.l $11172276
		dc.l $71717777
		dc.l $77777777
		dc.l $77777676
		dc.l $77776767
		dc.l $11117777
		dc.l $99999999
		dc.l $99999999
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $6BBBBBBB
		dc.l $767666BB
		dc.l $67666655
		dc.l $76666555
		dc.l $77777666
		dc.l $99999999
		dc.l $99999999
		dc.l $999BBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $5555BBBB
		dc.l $55555555
		dc.l $66999999
		dc.l $99999999
		dc.l $99999BBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBB555
		dc.l $BBBBB656
		dc.l $BBBBB565
		dc.l $BBBBB666
		dc.l $BBBBB767
		dc.l $BBBBB676
		dc.l $BBBBB777
		dc.l $BBBBB777
		dc.l $BBBBB777
		dc.l $55BBB555
		dc.l $99999BBB
		dc.l $99999BBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $699BBBBB
		dc.l $5999BBBB
		dc.l $6999BBBB
		dc.l $6699BBBB
		dc.l $67999B76
		dc.l $76767777
		dc.l $77777777
		dc.l $77777773
		dc.l $74444449
		dc.l $59999999
		dc.l $99999999
		dc.l $9999BBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBB656
		dc.l $BB676666
		dc.l $76767676
		dc.l $77676767
		dc.l $77772222
		dc.l $33339999
		dc.l $99999999
		dc.l $9999999B
		dc.l $99BBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBB55545
		dc.l $65655555
		dc.l $56565655
		dc.l $66656566
		dc.l $66667779
		dc.l $11199999
		dc.l $99999999
		dc.l $999999BB
		dc.l $999BBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $45454444
		dc.l $54545444
		dc.l $55555999
		dc.l $66999999
		dc.l $99999999
		dc.l $99999BBB
		dc.l $99BBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $33999999
		dc.l $9999999B
		dc.l $99999BBB
		dc.l $999BBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $9BBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l $BBBBBBEA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $EEEEEEEE
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $BBBB9999
		dc.l $BBBBBBBB
		dc.l $EEEEEEEE
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $99999BBB
		dc.l $BBBBBBBB
		dc.l $EEEEEEEE
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $EEEEEEEE
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $BBB99999
		dc.l $BBBBBBBB
		dc.l $EEEEEEEE
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $99999999
		dc.l $BBBBBBBB
		dc.l $EEEEEEEE
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $99999999
		dc.l $BBBBBBBB
		dc.l $EEEEEEEE
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $99999899
		dc.l $BBBBBBB9
		dc.l $EEEEEEEE
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $9BBBBBBB
		dc.l $9BBBBBBB
		dc.l $EEEEEEEE
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $EEEEEEEE
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $BBB99999
		dc.l $BBBBBBBB
		dc.l $EEEEEEEE
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $99999BBB
		dc.l $BBBBBBBB
		dc.l $EEEEEEEE
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $BBBBBBBB
		dc.l $BBBBBBBB
		dc.l $EEEEEEEE
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $B9999999
		dc.l $BBBBBBBB
		dc.l $EEEEEEEE
		dc.l $AAAAAAAA
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
dword_E61E:	dc.l $310032		; DATA XREF: sub_1CFA+294o
		dc.l $320032
		dc.l $320032
		dc.l $320032
		dc.l $320032
		dc.l $320032
		dc.l $320032
		dc.l $320032
		dc.l $80310033
		dc.l $340035
		dc.l $360037
		dc.l $380039
		dc.l $3A003B
		dc.l $3C003D
		dc.l $3E003F
		dc.l $400041
		dc.l $420043
		dc.l $440045
		dc.l $460047
		dc.l $480049
		dc.l $4A004B
		dc.l $4C004D
		dc.l $4E004F
		dc.l $500051
		dc.l $520053
		dc.l $54C031
		dc.l $550056
		dc.l $570058
		dc.l $59005A
		dc.l $5B4032
		dc.l $5B4032
		dc.l $40324032
		dc.b $40 ; @
		dc.b $32 ; 2
		dc.b $40 ; @
		dc.b $32 ; 2
		dc.b $40 ; @
		dc.b $32 ; 2
		dc.b $40 ; @
		dc.b $31 ; 1
unk_E6A6:	dc.b   0		; DATA XREF: sub_238C+4o
		dc.b $1E
		dc.b $80 ; €
		dc.b   4
		dc.b  $C
		dc.b $13
		dc.b   4
		dc.b $25 ; %
		dc.b $1C
		dc.b $35 ; 5
		dc.b $1B
		dc.b $46 ; F
		dc.b $3D ; =
		dc.b $54 ; T
		dc.b  $B
		dc.b $65 ; e
		dc.b $1D
		dc.b $72 ; r
		dc.b   1
		dc.b $81 ; 
		dc.b   4
		dc.b  $A
		dc.b $12
		dc.b   0
		dc.b $28 ; (
		dc.b $FB ; û
		dc.b $36 ; 6
		dc.b $3C ; <
		dc.b $47 ; G
		dc.b $7C ; |
		dc.b $58 ; X
		dc.b $FA ; ú
		dc.b $83 ; ƒ
		dc.b   5
		dc.b $1A
		dc.b $FF
		dc.b $56 ; V
		dc.b $F5 ; õ
		dc.b $5E ; ^
		dc.b $E8 ; è
		dc.b $F4 ; ô
		dc.b $B2 ; ²
		dc.b $C5 ; Å
		dc.b $73 ; s
		dc.b $C8 ; È
		dc.b $4D ; M
		dc.b $18
		dc.b $59 ; Y
		dc.b $65 ; e
		dc.b $8A ; Š
		dc.b $EC ; ì
		dc.b $CA ; Ê
		dc.b $D9 ; Ù
		dc.b $95 ; •
		dc.b $B3 ; ³
		dc.b $2B ; +
		dc.b $66 ; f
		dc.b $56 ; V
		dc.b $CC ; Ì
		dc.b $A5 ; ¥
		dc.b $7E ; ~
		dc.b $A5 ; ¥
		dc.b $5E ; ^
		dc.b $AA ; ª
		dc.b $CB ; Ë
		dc.b $2E ; .
		dc.b $95 ; •
		dc.b $D7 ; ×
		dc.b $C8 ; È
		dc.b $4D ; M
		dc.b $19
		dc.b $5D ; ]
		dc.b $AE ; ®
		dc.b $D2 ; Ò
		dc.b $BD ; ½
		dc.b $37 ; 7
		dc.b $E7 ; ç
		dc.b  $C
		dc.b $21 ; !
		dc.b  $C
		dc.b $39 ; 9
		dc.b $E2 ; â
		dc.b $B6 ; ¶
		dc.b $42 ; B
		dc.b $10
		dc.b $84 ; „
		dc.b $21 ; !
		dc.b   8
		dc.b $41 ; A
		dc.b $5D ; ]
		dc.b $6C ; l
		dc.b $CA ; Ê
		dc.b $D9 ; Ù
		dc.b $95 ; •
		dc.b $AE ; ®
		dc.b $18
		dc.b $70 ; p
		dc.b $84 ; „
		dc.b $15
		dc.b $E7 ; ç
		dc.b $C8 ; È
		dc.b $73 ; s
		dc.b $CB ; Ë
		dc.b $2C ; ,
		dc.b $55 ; U
		dc.b $55 ; U
		dc.b $55 ; U
		dc.b $FA ; ú
		dc.b $84 ; „
		dc.b $D5 ; Õ
		dc.b $43 ; C
		dc.b $9A ; š
		dc.b $85 ; …
		dc.b $8A ; Š
		dc.b $A4 ; ¤
		dc.b $AE ; ®
		dc.b $10
		dc.b $84 ; „
		dc.b $21 ; !
		dc.b   8
		dc.b $2B ; +
		dc.b $BF ; ¿
		dc.b $38 ; 8
		dc.b $43 ; C
		dc.b  $D
		dc.b $F9 ; ù
		dc.b $D1 ; Ñ
		dc.b $5E ; ^
		dc.b $EB ; ë
		dc.b $E6 ; æ
		dc.b $68 ; h
		dc.b $9A ; š
		dc.b $AC ; ¬
		dc.b $2C ; ,
		dc.b $B1 ; ±
		dc.b $57 ; W
		dc.b $DA ; Ú
		dc.b $55 ; U
		dc.b $D9 ; Ù
		dc.b $65 ; e
		dc.b $96 ; –
		dc.b $5E ; ^
		dc.b $8B ; ‹
		dc.b $D5 ; Õ
		dc.b $2D ; -
		dc.b $96 ; –
		dc.b $59 ; Y
		dc.b $64 ; d
		dc.b $D1 ; Ñ
		dc.b $9F ; Ÿ
		dc.b $50 ; P
		dc.b $5F ; _
		dc.b $AC ; ¬
		dc.b $AD ; ­
		dc.b $99 ; ™
		dc.b $5B ; [
		dc.b $32 ; 2
		dc.b $B6 ; ¶
		dc.b $65 ; e
		dc.b $6C ; l
		dc.b $CA ; Ê
		dc.b $D9 ; Ù
		dc.b $94 ; ”
		dc.b $BF ; ¿
		dc.b $21 ; !
		dc.b $65 ; e
		dc.b $96 ; –
		dc.b $5E ; ^
		dc.b $BE ; ¾
		dc.b $96 ; –
		dc.b $57 ; W
		dc.b $6B ; k
		dc.b $B5 ; µ
		dc.b $DA ; Ú
		dc.b $E9 ; é
		dc.b $34 ; 4
		dc.b $66 ; f
		dc.b $BE ; ¾
		dc.b $2C ; ,
		dc.b $FB ; û
		dc.b $F7 ; ÷
		dc.b $CD ; Í
		dc.b $98 ; ˜
		dc.b $70 ; p
		dc.b $84 ; „
		dc.b $38 ; 8
		dc.b $61 ; a
		dc.b $B1 ; ±
		dc.b $61 ; a
		dc.b   8
		dc.b $42 ; B
		dc.b $10
		dc.b $84 ; „
		dc.b $21 ; !
		dc.b   8
		dc.b $41 ; A
		dc.b $61 ; a
		dc.b $87 ; ‡
		dc.b $35 ; 5
		dc.b $5A ; Z
		dc.b $37 ; 7
		dc.b $E7 ; ç
		dc.b $BF ; ¿
		dc.b $7E ; ~
		dc.b $E8 ; è
		dc.b $B1 ; ±
		dc.b $70 ; p
		dc.b $9F ; Ÿ
		dc.b $5E ; ^
		dc.b $FD ; ý
		dc.b $FB ; û
		dc.b $F7 ; ÷
		dc.b $ED ; í
		dc.b $61 ; a
		dc.b $C2 ; Â
		dc.b $7C ; |
		dc.b $5C ; \
		dc.b $AE ; ®
		dc.b $D7 ; ×
		dc.b $6B ; k
		dc.b $B4 ; ´
		dc.b $AA ; ª
		dc.b $E1 ; á
		dc.b $65 ; e
		dc.b $96 ; –
		dc.b $73 ; s
		dc.b $50 ; P
		dc.b $9A ; š
		dc.b $A9 ; ©
		dc.b $F4 ; ô
		dc.b $A4 ; ¤
		dc.b $21 ; !
		dc.b   8
		dc.b $42 ; B
		dc.b $10
		dc.b $95 ; •
		dc.b $C2 ; Â
		dc.b $C5 ; Å
		dc.b $DF ; ß
		dc.b $9D ; 
		dc.b $3B ; ;
		dc.b $E6 ; æ
		dc.b $CC ; Ì
		dc.b $21 ; !
		dc.b $CF ; Ï
		dc.b $17
		dc.b $85 ; …
		dc.b $96 ; –
		dc.b $59 ; Y
		dc.b $7A ; z
		dc.b $26 ; &
		dc.b $AA ; ª
		dc.b $6B ; k
		dc.b $E2 ; â
		dc.b $AA ; ª
		dc.b $D2 ; Ò
		dc.b $BD ; ½
		dc.b   0
unk_E7A8:	dc.b   0		; DATA XREF: sub_238C+1Eo
		dc.b $1A
		dc.b $80 ; €
		dc.b   5
		dc.b $1A
		dc.b $14
		dc.b  $B
		dc.b $24 ; $
		dc.b  $C
		dc.b $35 ; 5
		dc.b $1C
		dc.b $45 ; E
		dc.b $1D
		dc.b $53 ; S
		dc.b   4
		dc.b $66 ; f
		dc.b $3D ; =
		dc.b $72 ; r
		dc.b   1
		dc.b $81 ; 
		dc.b   4
		dc.b  $A
		dc.b $12
		dc.b   0
		dc.b $27 ; '
		dc.b $7C ; |
		dc.b $36 ; 6
		dc.b $3C ; <
		dc.b $58 ; X
		dc.b $FB ; û
		dc.b $68 ; h
		dc.b $FA ; ú
		dc.b $83 ; ƒ
		dc.b   5
		dc.b $1B
		dc.b $FF
		dc.b $57 ; W
		dc.b $BF ; ¿
		dc.b $3A ; :
		dc.b $42 ; B
		dc.b $10
		dc.b $57 ; W
		dc.b $5F ; _
		dc.b $30 ; 0
		dc.b $B2 ; ²
		dc.b $CC ; Ì
		dc.b $34 ; 4
		dc.b $61 ; a
		dc.b $A3 ; £
		dc.b  $D
		dc.b  $A
		dc.b $C2 ; Â
		dc.b $10
		dc.b $84 ; „
		dc.b $15
		dc.b $FE ; þ
		dc.b  $A
		dc.b $AA ; ª
		dc.b $BD ; ½
		dc.b $21 ; !
		dc.b $DD ; Ý
		dc.b $9B ; ›
		dc.b $E7 ; ç
		dc.b $9C ; œ
		dc.b $AF ; ¯
		dc.b $C9 ; É
		dc.b $D2 ; Ò
		dc.b $B3 ; ³
		dc.b $CC ; Ì
		dc.b $2C ; ,
		dc.b $D1 ; Ñ
		dc.b $CA ; Ê
		dc.b $D1 ; Ñ
		dc.b $E8 ; è
		dc.b $AC ; ¬
		dc.b $FB ; û
		dc.b $B3 ; ³
		dc.b $95 ; •
		dc.b $A2 ; ¢
		dc.b $10
		dc.b $57 ; W
		dc.b $94 ; ”
		dc.b $AA ; ª
		dc.b $AB ; «
		dc.b $AA ; ª
		dc.b $DC ; Ü
		dc.b $3D ; =
		dc.b $AD ; ­
		dc.b $DD ; Ý
		dc.b $61 ; a
		dc.b $75 ; u
		dc.b $9B ; ›
		dc.b $AD ; ­
		dc.b $EA ; ê
		dc.b $95 ; •
		dc.b $E6 ; æ
		dc.b $EA ; ê
		dc.b $17
		dc.b $57 ; W
		dc.b $BA ; º
		dc.b $CA ; Ê
		dc.b $B3 ; ³
		dc.b $2B ; +
		dc.b $5B ; [
		dc.b $AD ; ­
		dc.b $AB ; «
		dc.b   8
		dc.b $77 ; w
		dc.b $66 ; f
		dc.b $F9 ; ù
		dc.b $E7 ; ç
		dc.b $2B ; +
		dc.b $F2 ; ò
		dc.b $74 ; t
		dc.b $AF ; ¯
		dc.b $4B ; K
		dc.b $AC ; ¬
		dc.b $21 ; !
		dc.b   8
		dc.b $2B ; +
		dc.b $9F ; Ÿ
		dc.b $58 ; X
		dc.b $42 ; B
		dc.b $10
		dc.b $74 ; t
		dc.b $4F ; O
		dc.b $9D ; 
		dc.b $21 ; !
		dc.b   8
		dc.b $2E ; .
		dc.b $17
		dc.b $FC ; ü
		dc.b $1C
		dc.b $21 ; !
		dc.b   8
		dc.b $41 ; A
		dc.b $61 ; a
		dc.b   8
		dc.b $42 ; B
		dc.b $7D ; }
		dc.b $68 ; h
		dc.b $5F ; _
		dc.b $17
		dc.b $2B ; +
		dc.b $DA ; Ú
		dc.b $9F ; Ÿ
		dc.b $5A ; Z
		dc.b $14
		dc.b $B2 ; ²
		dc.b $CB ; Ë
		dc.b $2F ; /
		dc.b $EB ; ë
		dc.b $55 ; U
		dc.b $C3 ; Ã
		dc.b $D2 ; Ò
		dc.b  $B
		dc.b $9E ; ž
		dc.b $7A ; z
		dc.b $7B ; {
		dc.b $5A ; Z
		dc.b $39 ; 9
		dc.b $56 ; V
		dc.b $59 ; Y
		dc.b $9E ; ž
		dc.b $2E ; .
		dc.b $7D ; }
		dc.b $D9 ; Ù
		dc.b $CA ; Ê
		dc.b $D1 ; Ñ
		dc.b $CA ; Ê
		dc.b $D1 ; Ñ
		dc.b   9
		dc.b $F6 ; ö
		dc.b $AA ; ª
		dc.b $AD ; ­
		dc.b $2B ; +
		dc.b $86 ; †
		dc.b $EB ; ë
		dc.b $9E ; ž
		dc.b $73 ; s
		dc.b $66 ; f
		dc.b $FA ; ú
		dc.b $42 ; B
		dc.b $6E ; n
		dc.b $97 ; —
		dc.b $55 ; U
		dc.b $B3 ; ³
		dc.b $9E ; ž
		dc.b $73 ; s
		dc.b $66 ; f
		dc.b $FA ; ú
		dc.b $43 ; C
		dc.b $95 ; •
		dc.b $AA ; ª
		dc.b $DF ; ß
		dc.b $29 ; )
		dc.b $74 ; t
		dc.b $59 ; Y
		dc.b $65 ; e
		dc.b $9A ; š
		dc.b $FF
		dc.b $89 ; ‰
		dc.b $CF ; Ï
		dc.b $90 ; 
		dc.b $94 ; ”
		dc.b $B8 ; ¸
		dc.b $42 ; B
		dc.b $10
		dc.b $CA ; Ê
		dc.b $B3 ; ³
		dc.b $2A ; *
		dc.b $C5 ; Å
		dc.b $E9 ; é
		dc.b   8
		dc.b $42 ; B
		dc.b $10
		dc.b $5E ; ^
		dc.b   0
unk_E882:	dc.b   0		; DATA XREF: sub_238C+38o
		dc.b $34 ; 4
		dc.b $80 ; €
		dc.b   4
		dc.b  $A
		dc.b $15
		dc.b $18
		dc.b $24 ; $
		dc.b  $B
		dc.b $35 ; 5
		dc.b $19
		dc.b $45 ; E
		dc.b $1C
		dc.b $53 ; S
		dc.b   4
		dc.b $65 ; e
		dc.b $1D
		dc.b $72 ; r
		dc.b   1
		dc.b $81 ; 
		dc.b   5
		dc.b $1A
		dc.b $12
		dc.b   0
		dc.b $25 ; %
		dc.b $1E
		dc.b $35 ; 5
		dc.b $1B
		dc.b $48 ; H
		dc.b $FA ; ú
		dc.b $83 ; ƒ
		dc.b   7
		dc.b $7C ; |
		dc.b $FF
		dc.b $57 ; W
		dc.b $9E ; ž
		dc.b $E1 ; á
		dc.b   8
		dc.b $41 ; A
		dc.b $5A ; Z
		dc.b $F5 ; õ
		dc.b $98 ; ˜
		dc.b $30 ; 0
		dc.b $59 ; Y
		dc.b $45 ; E
		dc.b $94 ; ”
		dc.b $59 ; Y
		dc.b $42 ; B
		dc.b $BB ; »
		dc.b $E9 ; é
		dc.b $D2 ; Ò
		dc.b $10
		dc.b $57 ; W
		dc.b $1F
		dc.b $E1 ; á
		dc.b $A2 ; ¢
		dc.b $10
		dc.b $82 ; ‚
		dc.b $AE ; ®
		dc.b $EC ; ì
		dc.b $C1 ; Á
		dc.b $46 ; F
		dc.b $77 ; w
		dc.b $D1 ; Ñ
		dc.b $57 ; W
		dc.b $76 ; v
		dc.b $60 ; `
		dc.b $A3 ; £
		dc.b $3A ; :
		dc.b $A3 ; £
		dc.b $A2 ; ¢
		dc.b $AB ; «
		dc.b $9D ; 
		dc.b $2A ; *
		dc.b $AD ; ­
		dc.b $7F ; 
		dc.b $47 ; G
		dc.b $84 ; „
		dc.b $21 ; !
		dc.b   5
		dc.b $68 ; h
		dc.b $A2 ; ¢
		dc.b $10
		dc.b $84 ; „
		dc.b $15
		dc.b $C9 ; É
		dc.b $5B ; [
		dc.b $A2 ; ¢
		dc.b $8B ; ‹
		dc.b $28 ; (
		dc.b $B2 ; ²
		dc.b $8B ; ‹
		dc.b $28 ; (
		dc.b $57 ; W
		dc.b $1E
		dc.b $55 ; U
		dc.b $55 ; U
		dc.b $B3 ; ³
		dc.b $87 ; ‡
		dc.b   8
		dc.b $74 ; t
		dc.b $56 ; V
		dc.b $8B ; ‹
		dc.b $F5 ; õ
		dc.b $1D
		dc.b $15
		dc.b $5C ; \
		dc.b $FD ; ý
		dc.b $59 ; Y
		dc.b   8
		dc.b $41 ; A
		dc.b $54 ; T
		dc.b $87 ; ‡
		dc.b $3E ; >
		dc.b $1F
		dc.b $33 ; 3
		dc.b $BC ; ¼
		dc.b $EB ; ë
		dc.b $F2 ; ò
		dc.b $7A ; z
		dc.b $57 ; W
		dc.b $3F ; ?
		dc.b $D1 ; Ñ
		dc.b $C1 ; Á
		dc.b $65 ; e
		dc.b $19
		dc.b $D5 ; Õ
		dc.b $19
		dc.b $D5 ; Õ
		dc.b $19
		dc.b $D2 ; Ò
		dc.b $B7 ; ·
		dc.b $F5 ; õ
		dc.b $3D ; =
		dc.b $CF ; Ï
		dc.b $73 ; s
		dc.b $DC ; Ü
		dc.b $15
		dc.b $F2 ; ò
		dc.b $AA ; ª
		dc.b $AD ; ­
		dc.b $6F ; o
		dc.b $24 ; $
		dc.b $21 ; !
		dc.b $36 ; 6
		dc.b $A9 ; ©
		dc.b $65 ; e
		dc.b $7C ; |
		dc.b $30 ; 0
		dc.b $60 ; `
		dc.b $C1 ; Á
		dc.b $5F ; _
		dc.b  $C
		dc.b $14
		dc.b $58 ; X
		dc.b $AF ; ¯
		dc.b  $A
		dc.b $D6 ; Ö
		dc.b $48 ; H
		dc.b $42 ; B
		dc.b  $A
		dc.b $E3 ; ã
		dc.b $FC ; ü
		dc.b $36 ; 6
		dc.b $42 ; B
		dc.b $10
		dc.b $57 ; W
		dc.b $3F ; ?
		dc.b $F1 ; ñ
		dc.b $B2 ; ²
		dc.b $10
		dc.b $82 ; ‚
		dc.b $B3 ; ³
		dc.b $EB ; ë
		dc.b   5
		dc.b $EA ; ê
		dc.b $88 ; ˆ
		dc.b $41 ; A
		dc.b $54 ; T
		dc.b $F9 ; ù
		dc.b $8D ; 
		dc.b $63 ; c
		dc.b $D8 ; Ø
		dc.b $2B ; +
		dc.b $DF ; ß
		dc.b $28 ; (
		dc.b $AD ; ­
		dc.b $D1 ; Ñ
		dc.b $45 ; E
		dc.b  $A
		dc.b $E0 ; à
		dc.b $84 ; „
		dc.b $21 ; !
		dc.b   6
		dc.b $89 ; ‰
		dc.b $EE ; î
		dc.b $10
		dc.b $84 ; „
		dc.b $16
		dc.b $CC ; Ì
		dc.b $7D ; }
		dc.b $59 ; Y
		dc.b   8
		dc.b $42 ; B
		dc.b  $B
		dc.b $65 ; e
		dc.b $EE ; î
		dc.b $1D
		dc.b $3A ; :
		dc.b $74 ; t
		dc.b $5A ; Z
		dc.b $FE ; þ
		dc.b $8E ; Ž
		dc.b   8
		dc.b $42 ; B
		dc.b $13
		dc.b $FC ; ü
		dc.b $2B ; +
		dc.b $7B ; {
		dc.b $E9 ; é
		dc.b $DD ; Ý
		dc.b $E4 ; ä
		dc.b $A3 ; £
		dc.b   5
		dc.b $ED ; í
		dc.b $79 ; y
		dc.b $BE ; ¾
		dc.b $9D ; 
		dc.b $D5 ; Õ
		dc.b $19
		dc.b $D6 ; Ö
		dc.b  $C
		dc.b $17
		dc.b $B5 ; µ
		dc.b $5A ; Z
		dc.b $D7 ; ×
		dc.b $74 ; t
		dc.b $AA ; ª
		dc.b $E4 ; ä
		dc.b $84 ; „
		dc.b $21 ; !
		dc.b   8
		dc.b $2E ; .
		dc.b $7E ; ~
		dc.b $AC ; ¬
		dc.b $84 ; „
		dc.b $21 ; !
		dc.b   5
		dc.b $BF ; ¿
		dc.b $56 ; V
		dc.b $E8 ; è
		dc.b $A2 ; ¢
		dc.b $CA ; Ê
		dc.b $2C ; ,
		dc.b $A2 ; ¢
		dc.b $CA ; Ê
		dc.b $2C ; ,
		dc.b $AD ; ­
		dc.b $A8 ; ¨
		dc.b $AB ; «
		dc.b $3C ; <
		dc.b $AD ; ­
		dc.b $8B ; ‹
		dc.b $93 ; “
		dc.b $A7 ; §
		dc.b $45 ; E
		dc.b $3A ; :
		dc.b $74 ; t
		dc.b $87 ; ‡
		dc.b  $E
		dc.b  $B
		dc.b   8
		dc.b $43 ; C
		dc.b $9E ; ž
		dc.b $E7 ; ç
		dc.b $B3 ; ³
		dc.b $BC ; ¼
		dc.b $8A ; Š
		dc.b $60 ; `
		dc.b $C1 ; Á
		dc.b $83 ; ƒ
		dc.b $1F
		dc.b $E1 ; á
		dc.b $AD ; ­
		dc.b $64 ; d
		dc.b $E9 ; é
		dc.b   5
		dc.b $A2 ; ¢
		dc.b $CA ; Ê
		dc.b $FE ; þ
		dc.b $8E ; Ž
		dc.b  $C
		dc.b $18
		dc.b $2C ; ,
		dc.b $A3 ; £
		dc.b $3A ; :
		dc.b $A1 ; ¡
		dc.b $5B ; [
		dc.b $21 ; !
		dc.b   9
		dc.b $EE ; î
		dc.b $6F ; o
		dc.b $22 ; "
		dc.b $AA ; ª
		dc.b $AA ; ª
		dc.b $E4 ; ä
		dc.b $84 ; „
		dc.b $21 ; !
		dc.b   9
		dc.b $B5 ; µ
		dc.b $F8 ; ø
		dc.b $60 ; `
		dc.b $C7 ; Ç
		dc.b $C2 ; Â
		dc.b $8B ; ‹
		dc.b $28 ; (
		dc.b $C7 ; Ç
		dc.b $C2 ; Â
		dc.b $BE ; ¾
		dc.b $6A ; j
		dc.b $BE ; ¾
		dc.b $17
		dc.b $BE ; ¾
		dc.b $69 ; i
		dc.b $72 ; r
		dc.b $42 ; B
		dc.b $13
		dc.b $5F ; _
		dc.b $38 ; 8
		dc.b $5E ; ^
		dc.b $D6 ; Ö
		dc.b $10
		dc.b $84 ; „
		dc.b $21 ; !
		dc.b   5
		dc.b $E9 ; é
		dc.b   8
		dc.b $42 ; B
		dc.b $10
		dc.b $5C ; \
		dc.b $90 ; 
		dc.b $84 ; „
		dc.b $3A ; :
		dc.b $5E ; ^
		dc.b $AF ; ¯
		dc.b $E9 ; é
		dc.b $4A ; J
		dc.b $31 ; 1
		dc.b $EA ; ê
		dc.b $31 ; 1
		dc.b $F0 ; ð
		dc.b $A2 ; ¢
		dc.b $CA ; Ê
		dc.b $2F ; /
		dc.b $58 ; X
		dc.b $20
		dc.b $B7 ; ·
		dc.b $AA ; ª
		dc.b $33 ; 3
		dc.b $AF ; ¯
		dc.b $86 ; †
		dc.b $77 ; w
		dc.b $CF ; Ï
		dc.b $73 ; s
		dc.b $E1 ; á
		dc.b   5
		dc.b $C8 ; È
		dc.b   0
		
unk_E9F2:
	incbin "misc\nemesis_E9F2.bin"

word_EB12:	dc.w 0			; DATA XREF: sub_1CFA+15Eo
		dc.w $11
		dc.w 0
		dc.w $100
		dc.w 0
		dc.w $1001
		dc.w 0
		dc.w $1010
		dc.w 0
		dc.w $1010
		dc.w 0
		dc.w $1001
		dc.w 0
		dc.w $100
		dc.w 0
		dc.w $11
		dc.w $1100
		dc.w 0
		dc.w $10
		dc.w 0
		dc.w $1001
		dc.w 0
		dc.w 1
		dc.w 0
		dc.w 1
		dc.w 0
		dc.w $1001
		dc.w 0
		dc.w $10
		dc.w 0
		dc.w $1100
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $100
		dc.w 0
		dc.w $1100
		dc.w 0
		dc.w $100
		dc.w 0
		dc.w $100
		dc.w 0
		dc.w $100
		dc.w 0
		dc.w $100
		dc.w 0
		dc.w $100
		dc.w 0
		dc.w 0
		dc.w $11
		dc.w $1000
		dc.w $100
		dc.w $100
		dc.w $100
		dc.w $100
		dc.w $11
		dc.w $1100
		dc.w 0
		dc.w $100
		dc.w $100
		dc.w $100
		dc.w $11
		dc.w $1000
		dc.w 0
		dc.w 0
		dc.w $11
		dc.w $1000
		dc.w $100
		dc.w $100
		dc.w $100
		dc.w $100
		dc.w $11
		dc.w $1100
		dc.w 0
		dc.w $100
		dc.w $100
		dc.w $100
		dc.w $11
		dc.w $1000
		dc.w 0
		dc.w 0
		dc.w $11
		dc.w $1000
		dc.w $100
		dc.w $100
		dc.w 0
		dc.w $100
		dc.w 1
		dc.w $1000
		dc.w 0
		dc.w $100
		dc.w $100
		dc.w $100
		dc.w $11
		dc.w $1000
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $11
		dc.w $1100
		dc.w $100
		dc.w $100
		dc.w $100
		dc.w 0
		dc.w $11
		dc.w $1000
		dc.w 0
		dc.w $100
		dc.w $100
		dc.w $100
		dc.w $111
		dc.w $1000
		dc.w 0
		dc.w 0
		dc.w $111
		dc.w $1100
		dc.w $100
		dc.w 0
		dc.w $100
		dc.w 0
		dc.w $111
		dc.w $1000
		dc.w $100
		dc.w 0
		dc.w $100
		dc.w 0
		dc.w $111
		dc.w $1100
		dc.w 0
		dc.w 0
		dc.w $11
		dc.w $1100
		dc.w $100
		dc.w $10
		dc.w $100
		dc.w 0
		dc.w $100
		dc.w $1110
		dc.w $100
		dc.w $10
		dc.w $100
		dc.w $10
		dc.w $11
		dc.w $1100
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $1000
		dc.w 1
		dc.w $100
		dc.w 1
		dc.w $100
		dc.w $10
		dc.w $10
		dc.w $11
		dc.w $1110
		dc.w $100
		dc.w 1
		dc.w $100
		dc.w 1
dword_EC72:	dc.l $1000100		; DATA XREF: sub_1CFA+198o
		dc.l $1000100
		dc.l $1000100
		dc.l $1000101
		dc.l $1000101
		dc.l $101001
		dc.l $10000
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $11001010
		dc.l $101100
		dc.l $11101000
		dc.l $1000
		dc.l $11001000
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l $10000000
		dc.l 0
		dc.l $1110000
		dc.l $10001000
		dc.l $10001000
		dc.l $10000
		dc.l $100000
		dc.l $1000000
		dc.l $11111001
		dc.l 0
word_ECF2:	dc.w 1			; DATA XREF: sub_1CFA+1D0o
		dc.w $1100
		dc.w $10
		dc.w $10
		dc.w $10
		dc.w $10
		dc.w $10
		dc.w $10
		dc.w $10
		dc.w $10
		dc.w $10
		dc.w $10
		dc.w 1
		dc.w $1100
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $1000
		dc.w 1
		dc.w $1000
		dc.w 0
		dc.w $1000
		dc.w 0
		dc.w $1000
		dc.w 0
		dc.w $1000
		dc.w 0
		dc.w $1000
		dc.w 1
		dc.w $1100
		dc.w 0
		dc.w 0
		dc.w 1
		dc.w $1100
		dc.w $10
		dc.w $10
		dc.w 0
		dc.w $10
		dc.w 0
		dc.w $100
		dc.w 0
		dc.w $1000
		dc.w 1
		dc.w 0
		dc.w $11
		dc.w $1110
		dc.w 0
		dc.w 0
		dc.w 1
		dc.w $1100
		dc.w $10
		dc.w $10
		dc.w 0
		dc.w $10
		dc.w 0
		dc.w $1100
		dc.w 0
		dc.w $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b   1
		dc.b $11
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $11
		dc.b   0
		dc.b   0
		dc.b   1
		dc.b   1
		dc.b   0
		dc.b   0
		dc.b $10
		dc.b   1
		dc.b   0
		dc.b   0
		dc.b $11
		dc.b $11
		dc.b $10
		dc.b   0
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $11
		dc.b $11
		dc.b   0
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $11
		dc.b $11
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $11
		dc.b $11
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   1
		dc.b $11
		dc.b   0
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $11
		dc.b $11
		dc.b   0
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b   1
		dc.b $11
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $11
		dc.b $11
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   1
		dc.b $11
		dc.b   0
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b   1
		dc.b $11
		dc.b   0
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b   1
		dc.b $11
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   1
		dc.b $11
		dc.b   0
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b   1
		dc.b $11
		dc.b $10
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b   1
		dc.b $11
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0

	dcb.b 462, $FF

Z80_PRG_Base0:			; DATA XREF: loadZ80Prg+22o
					; loadZ80Prg0+22o
	incbin "programs\z80_prog0.bin"

Z80_PRG_Base1:			; DATA XREF: loadZ80Prg+38o
	incbin "programs\z80_prog1.bin"

Z80_PRG_Base2:			; DATA XREF: loadZ80Prg+4Eo
	incbin "programs\z80_prog2.bin"

	dcb.b 1324, $FF

		dc.b $80 ; €
		dc.b   6
		dc.b $80 ; €
		dc.b   3
		dc.b   2
		dc.b $14
		dc.b  $C
		dc.b $24 ; $
		dc.b   7
		dc.b $35 ; 5
		dc.b $1A
		dc.b $55 ; U
		dc.b $1B
		dc.b $65 ; e
		dc.b $14
		dc.b $74 ; t
		dc.b   8
		dc.b $81 ; 
		dc.b   5
		dc.b $1E
		dc.b $82 ; ‚
		dc.b   7
		dc.b $7C ; |
		dc.b $84 ; „
		dc.b   4
		dc.b   6
		dc.b $86 ; †
		dc.b   4
		dc.b   9
		dc.b $87 ; ‡
		dc.b $14
		dc.b  $E
		dc.b $88 ; ˆ
		dc.b   7
		dc.b $7D ; }
		dc.b $8B ; ‹
		dc.b   3
		dc.b   0
		dc.b $13
		dc.b   1
		dc.b $8E ; Ž
		dc.b   4
		dc.b  $B
		dc.b $8F ; 
		dc.b   5
		dc.b $15
		dc.b $FF
		dc.b $34 ; 4
		dc.b $FC ; ü
		dc.b $61 ; a
		dc.b $D0 ; Ð
		dc.b $FC ; ü
		dc.b $E7 ; ç
		dc.b $E0 ; à
		dc.b $CE ; Î
		dc.b $9A ; š
		dc.b $BC ; ¼
		dc.b $50 ; P
		dc.b $FA ; ú
		dc.b $C1 ; Á
		dc.b $73 ; s
		dc.b $CB ; Ë
		dc.b   6
		dc.b $71 ; q
		dc.b $72 ; r
		dc.b $D5 ; Õ
		dc.b $DC ; Ü
		dc.b $B0 ; °
		dc.b $71 ; q
		dc.b $79 ; y
		dc.b $ED ; í
		dc.b $CF ; Ï
		dc.b $E1 ; á
		dc.b $74 ; t
		dc.b $2E ; .
		dc.b $14
		dc.b $FF
		dc.b   0
		dc.b $5C ; \
		dc.b $50 ; P
		dc.b $5C ; \
		dc.b $50 ; P
		dc.b $44 ; D
		dc.b $41 ; A
		dc.b $DF ; ß
		dc.b $1D
		dc.b $32 ; 2
		dc.b $E3 ; ã
		dc.b $95 ; •
		dc.b $7E ; ~
		dc.b $28 ; (
		dc.b $BF ; ¿
		dc.b $38 ; 8
		dc.b $83 ; ƒ
		dc.b $8D ; 
		dc.b $FC ; ü
		dc.b   3
		dc.b $BF ; ¿
		dc.b $34 ; 4
		dc.b $B3 ; ³
		dc.b $FB ; û
		dc.b $E7 ; ç
		dc.b $E1 ; á
		dc.b $F5 ; õ
		dc.b $EF ; ï
		dc.b $8F ; 
		dc.b $2C ; ,
		dc.b $BE ; ¾
		dc.b $65 ; e
		dc.b $6F ; o
		dc.b $3D ; =
		dc.b $95 ; •
		dc.b $19
		dc.b $3F ; ?
		dc.b $85 ; …
		dc.b $55 ; U
		dc.b   8
		dc.b $5C ; \
		dc.b $50 ; P
		dc.b $5A ; Z
		dc.b $AC ; ¬
		dc.b  $D
		dc.b  $F
		dc.b $B4 ; ´
		dc.b $2E ; .
		dc.b $77 ; w
		dc.b $C7 ; Ç
		dc.b $7C ; |
		dc.b $73 ; s
		dc.b $F6 ; ö
		dc.b $9F ; Ÿ
		dc.b $93 ; “
		dc.b   8
		dc.b $7E ; ~
		dc.b $AB ; «
		dc.b $F2 ; ò
		dc.b $6F ; o
		dc.b $FA ; ú
		dc.b $94 ; ”
		dc.b $57 ; W
		dc.b $DF ; ß
		dc.b $DD ; Ý
		dc.b $B8 ; ¸
		dc.b $A0 ;  
		dc.b $81 ; 
		dc.b $E8 ; è
		dc.b $80 ; €
		dc.b   3
		dc.b   0
		dc.b $14
		dc.b   5
		dc.b $25 ; %
		dc.b $10
		dc.b $35 ; 5
		dc.b $14
		dc.b $46 ; F
		dc.b $2A ; *
		dc.b $56 ; V
		dc.b $2B ; +
		dc.b $66 ; f
		dc.b $30 ; 0
		dc.b $73 ; s
		dc.b   1
		dc.b $81 ; 
		dc.b   4
		dc.b   4
		dc.b $17
		dc.b $67 ; g
		dc.b $78 ; x
		dc.b $DF ; ß
		dc.b $82 ; ‚
		dc.b   5
		dc.b $11
		dc.b $18
		dc.b $E3 ; ã
		dc.b $83 ; ƒ
		dc.b   4
		dc.b   6
		dc.b $16
		dc.b $2F ; /
		dc.b $28 ; (
		dc.b $DE ; Þ
		dc.b $38 ; 8
		dc.b $E8 ; è
		dc.b $78 ; x
		dc.b $E2 ; â
		dc.b $84 ; „
		dc.b   6
		dc.b $2D ; -
		dc.b $18
		dc.b $EC ; ì
		dc.b $85 ; …
		dc.b   6
		dc.b $2E ; .
		dc.b $18
		dc.b $E7 ; ç
		dc.b $77 ; w
		dc.b $69 ; i
		dc.b $86 ; †
		dc.b   5
		dc.b $12
		dc.b $17
		dc.b $6A ; j
		dc.b $87 ; ‡
		dc.b   5
		dc.b  $F
		dc.b $17
		dc.b $6B ; k
		dc.b $88 ; ˆ
		dc.b   7
		dc.b $68 ; h
		dc.b $18
		dc.b $EB ; ë
		dc.b $28 ; (
		dc.b $EE ; î
		dc.b $78 ; x
		dc.b $E9 ; é
		dc.b $89 ; ‰
		dc.b   8
		dc.b $E6 ; æ
		dc.b $8A ; Š
		dc.b   7
		dc.b $66 ; f
		dc.b $17
		dc.b $6C ; l
		dc.b $28 ; (
		dc.b $F0 ; ð
		dc.b $8B ; ‹
		dc.b   7
		dc.b $72 ; r
		dc.b $8C ; Œ
		dc.b   5
		dc.b  $E
		dc.b $16
		dc.b $2C ; ,
		dc.b $27 ; '
		dc.b $6E ; n
		dc.b $37 ; 7
		dc.b $70 ; p
		dc.b $8D ; 
		dc.b   6
		dc.b $32 ; 2
		dc.b $78 ; x
		dc.b $EA ; ê
		dc.b $8E ; Ž
		dc.b   5
		dc.b $13
		dc.b $17
		dc.b $6D ; m
		dc.b $8F ; 
		dc.b   6
		dc.b $31 ; 1
		dc.b $FF
		dc.b $24 ; $
		dc.b $92 ; ’
		dc.b $49 ; I
		dc.b $26 ; &
		dc.b $B7 ; ·
		dc.b $CA ; Ê
		dc.b $A7 ; §
		dc.b $84 ; „
		dc.b $A4 ; ¤
		dc.b $92 ; ’
		dc.b $92 ; ’
		dc.b $B9 ; ¹
		dc.b $82 ; ‚
		dc.b $2B ; +
		dc.b $D9 ; Ù
		dc.b   3
		dc.b   4
		dc.b $11
		dc.b $40 ; @
		dc.b $81 ; 
		dc.b $96 ; –
		dc.b $EB ; ë
		dc.b $77 ; w
		dc.b $9C ; œ
		dc.b $AF ; ¯
		dc.b $B9 ; ¹
		dc.b $22 ; "
		dc.b $31 ; 1
		dc.b $12
		dc.b $8E ; Ž
		dc.b $F4 ; ô
		dc.b $12
		dc.b $F1 ; ñ
		dc.b $D0 ; Ð
		dc.b $AC ; ¬
		dc.b $BF ; ¿
		dc.b $A1 ; ¡
		dc.b   9
		dc.b $47 ; G
		dc.b $D1 ; Ñ
		dc.b $82 ; ‚
		dc.b $6B ; k
		dc.b $40 ; @
		dc.b $81 ; 
		dc.b $A1 ; ¡
		dc.b $8A ; Š
		dc.b $4F ; O
		dc.b $F3 ; ó
		dc.b $EE ; î
		dc.b $CB ; Ë
		dc.b $36 ; 6
		dc.b $23 ; #
		dc.b $FB ; û
		dc.b $E7 ; ç
		dc.b $8B ; ‹
		dc.b $7C ; |
		dc.b $3C ; <
		dc.b $3C ; <
		dc.b $3C ; <
		dc.b $6B ; k
		dc.b  $F
		dc.b  $F
		dc.b  $F
		dc.b $23 ; #
		dc.b $FF
		dc.b $5F ; _
		dc.b $FF
		dc.b $3C ; <
		dc.b $5B ; [
		dc.b $E1 ; á
		dc.b $E1 ; á
		dc.b $E1 ; á
		dc.b $E3 ; ã
		dc.b $58 ; X
		dc.b $78 ; x
		dc.b $78 ; x
		dc.b $79 ; y
		dc.b $16
		dc.b $FF
		dc.b $1F
		dc.b $54 ; T
		dc.b $7F ; 
		dc.b $4E ; N
		dc.b $A8 ; ¨
		dc.b $1F
		dc.b  $D
		dc.b $61 ; a
		dc.b   7
		dc.b $E8 ; è
		dc.b $57 ; W
		dc.b $5D ; ]
		dc.b $33 ; 3
		dc.b $C1 ; Á
		dc.b $A8 ; ¨
		dc.b $8B ; ‹
		dc.b $78 ; x
		dc.b $65 ; e
		dc.b $41 ; A
		dc.b $FC ; ü
		dc.b $30 ; 0
		dc.b $D6 ; Ö
		dc.b $BE ; ¾
		dc.b $E9 ; é
		dc.b $5B ; [
		dc.b $AE ; ®
		dc.b $E6 ; æ
		dc.b   8
		dc.b $10
		dc.b $36 ; 6
		dc.b $7B ; {
		dc.b $D0 ; Ð
		dc.b $25 ; %
		dc.b $AF ; ¯
		dc.b   8
		dc.b $19
		dc.b $2E ; .
		dc.b $57 ; W
		dc.b $84 ; „
		dc.b $16
		dc.b $D1 ; Ñ
		dc.b $E1 ; á
		dc.b $28 ; (
		dc.b $81 ; 
		dc.b $F2 ; ò
		dc.b $AB ; «
		dc.b $3D ; =
		dc.b $59 ; Y
		dc.b $FF
		dc.b $A7 ; §
		dc.b $9F ; Ÿ
		dc.b $FA ; ú
		dc.b $64 ; d
		dc.b $93 ; “
		dc.b $56 ; V
		dc.b $F4 ; ô
		dc.b $2F ; /
		dc.b $86 ; †
		dc.b $F5 ; õ
		dc.b $5C ; \
		dc.b $44 ; D
		dc.b $93 ; “
		dc.b $C4 ; Ä
		dc.b $59 ; Y
		dc.b $58 ; X
		dc.b $30 ; 0
		dc.b $68 ; h
		dc.b $30 ; 0
		dc.b $DE ; Þ
		dc.b $AE ; ®
		dc.b $FC ; ü
		dc.b $18
		dc.b $92 ; ’
		dc.b $78 ; x
		dc.b $AF ; ¯
		dc.b $AF ; ¯
		dc.b $7A ; z
		dc.b $BB ; »
		dc.b $F0 ; ð
		dc.b $62 ; b
		dc.b $4D ; M
		dc.b $57 ; W
		dc.b $8F ; 
		dc.b $E1 ; á
		dc.b $86 ; †
		dc.b $84 ; „
		dc.b $79 ; y
		dc.b $E9 ; é
		dc.b $17
		dc.b $EC ; ì
		dc.b $65 ; e
		dc.b $8B ; ‹
		dc.b $F3 ; ó
		dc.b $52 ; R
		dc.b $2F ; /
		dc.b $CC ; Ì
		dc.b $AC ; ¬
		dc.b $AF ; ¯
		dc.b $CC ; Ì
		dc.b $AD ; ­
		dc.b $5B ; [
		dc.b $1A
		dc.b $5D ; ]
		dc.b $F9 ; ù
		dc.b $FD ; ý
		dc.b $DA ; Ú
		dc.b $7F ; 
		dc.b $F4 ; ô
		dc.b $78 ; x
		dc.b $89 ; ‰
		dc.b $3F ; ?
		dc.b $FC ; ü
		dc.b $D3 ; Ó
		dc.b $FF
		dc.b $A3 ; £
		dc.b $C4 ; Ä
		dc.b $4F ; O
		dc.b $FF
		dc.b $BF ; ¿
		dc.b $A5 ; ¥
		dc.b $9F ; Ÿ
		dc.b $9E ; ž
		dc.b $30 ; 0
		dc.b $61 ; a
		dc.b $B1 ; ±
		dc.b $F1 ; ñ
		dc.b $AF ; ¯
		dc.b $33 ; 3
		dc.b $E2 ; â
		dc.b $B7 ; ·
		dc.b $AE ; ®
		dc.b $67 ; g
		dc.b $C6 ; Æ
		dc.b  $C
		dc.b $B9 ; ¹
		dc.b $9F ; Ÿ
		dc.b $46 ; F
		dc.b $AA ; ª
		dc.b $78 ; x
		dc.b $25 ; %
		dc.b $9F ; Ÿ
		dc.b $9F ; Ÿ
		dc.b $B8 ; ¸
		dc.b $92 ; ’
		dc.b $49 ; I
		dc.b $2A ; *
		dc.b $CB ; Ë
		dc.b $FC ; ü
		dc.b $32 ; 2
		dc.b $49 ; I
		dc.b $24 ; $
		dc.b $AD ; ­
		dc.b $D6 ; Ö
		dc.b $7E ; ~
		dc.b $BC ; ¼
		dc.b $92 ; ’
		dc.b $49 ; I
		dc.b $36 ; 6
		dc.b $73 ; s
		dc.b $5E ; ^
		dc.b $49 ; I
		dc.b $24 ; $
		dc.b $92 ; ’
		dc.b $B3 ; ³
		dc.b $24 ; $
		dc.b $92 ; ’
		dc.b $4C ; L
		dc.b $D6 ; Ö
		dc.b $FE ; þ
		dc.b $67 ; g
		dc.b $44 ; D
		dc.b $92 ; ’
		dc.b $49 ; I
		dc.b $29 ; )
		dc.b $F9 ; ù
		dc.b $FB ; û
		dc.b $1F
		dc.b $7F ; 
		dc.b $E7 ; ç
		dc.b $C7 ; Ç
		dc.b $E7 ; ç
		dc.b $D3 ; Ó
		dc.b $F3 ; ó
		dc.b $E6 ; æ
		dc.b $BF ; ¿
		dc.b $CF ; Ï
		dc.b $D7 ; ×
		dc.b $89 ; ‰
		dc.b $C4 ; Ä
		dc.b $AE ; ®
		dc.b $2B ; +
		dc.b $8A ; Š
		dc.b $E2 ; â
		dc.b $3F ; ?
		dc.b $7F ; 
		dc.b $57 ; W
		dc.b $E7 ; ç
		dc.b $D7 ; ×
		dc.b $13
		dc.b  $F
		dc.b $CF ; Ï
		dc.b $C3 ; Ã
		dc.b $15
		dc.b $FC ; ü
		dc.b $FC ; ü
		dc.b $31 ; 1
		dc.b $35 ; 5
		dc.b $FE ; þ
		dc.b $7C ; |
		dc.b $62 ; b
		dc.b $B8 ; ¸
		dc.b $AF ; ¯
		dc.b $EB ; ë
		dc.b $C6 ; Æ
		dc.b $2B ; +
		dc.b $FB ; û
		dc.b $F3 ; ó
		dc.b  $F
		dc.b $CF ; Ï
		dc.b $D5 ; Õ
		dc.b $F9 ; ù
		dc.b $FA ; ú
		dc.b $D3 ; Ó
		dc.b $1A
		dc.b $E6 ; æ
		dc.b $9F ; Ÿ
		dc.b $BF ; ¿
		dc.b $84 ; „
		dc.b $C7 ; Ç
		dc.b $EB ; ë
		dc.b $C6 ; Æ
		dc.b $2B ; +
		dc.b $88 ; ˆ
		dc.b $FE ; þ
		dc.b $78 ; x
		dc.b $C4 ; Ä
		dc.b $7E ; ~
		dc.b $7C ; |
		dc.b $7E ; ~
		dc.b $7C ; |
		dc.b $62 ; b
		dc.b $49 ; I
		dc.b $38 ; 8
		dc.b $63 ; c
		dc.b  $C
		dc.b $61 ; a
		dc.b $FA ; ú
		dc.b $F1 ; ñ
		dc.b $8C ; Œ
		dc.b $31 ; 1
		dc.b $18
		dc.b $AC ; ¬
		dc.b $C4 ; Ä
		dc.b $EA ; ê
		dc.b $40 ; @
		dc.b $95 ; •
		dc.b $26 ; &
		dc.b $29 ; )
		dc.b $54 ; T
		dc.b $D2 ; Ò
		dc.b $75 ; u
		dc.b $CE ; Î
		dc.b $18
		dc.b $D7 ; ×
		dc.b $F9 ; ù
		dc.b $F1 ; ñ
		dc.b $8C ; Œ
		dc.b $31 ; 1
		dc.b $1F
		dc.b $BF ; ¿
		dc.b $AB ; «
		dc.b $F5 ; õ
		dc.b $E6 ; æ
		dc.b $AF ; ¯
		dc.b $CF ; Ï
		dc.b $D7 ; ×
		dc.b $F9 ; ù
		dc.b $F3 ; ó
		dc.b $5F ; _
		dc.b $EB ; ë
		dc.b $E9 ; é
		dc.b $FB ; û
		dc.b $F2 ; ò
		dc.b $49 ; I
		dc.b $24 ; $
		dc.b $C3 ; Ã
		dc.b $FF
		dc.b $DF ; ß
		dc.b $EE ; î
		dc.b $24 ; $
		dc.b $92 ; ’
		dc.b $47 ; G
		dc.b $FB ; û
		dc.b $87 ; ‡
		dc.b $FF
		dc.b $89 ; ‰
		dc.b $87 ; ‡
		dc.b $E7 ; ç
		dc.b $CD ; Í
		dc.b $7F ; 
		dc.b $9F ; Ÿ
		dc.b $26 ; &
		dc.b $16
		dc.b $73 ; s
		dc.b $6F ; o
		dc.b $1B
		dc.b $D5 ; Õ
		dc.b $F9 ; ù
		dc.b $AB ; «
		dc.b $8B ; ‹
		dc.b $F3 ; ó
		dc.b $7E ; ~
		dc.b $AE ; ®
		dc.b $11
		dc.b $BB ; »
		dc.b $F4 ; ô
		dc.b $8C ; Œ
		dc.b $58 ; X
		dc.b $DF ; ß
		dc.b $4F ; O
		dc.b $D8 ; Ø
		dc.b $FE ; þ
		dc.b $CB ; Ë
		dc.b $A8 ; ¨
		dc.b $FF
		dc.b $EF ; ï
		dc.b $FE ; þ
		dc.b $84 ; „
		dc.b $98 ; ˜
		dc.b $BB ; »
		dc.b $F5 ; õ
		dc.b $F7 ; ÷
		dc.b $2E ; .
		dc.b $4C ; L
		dc.b $57 ; W
		dc.b $33 ; 3
		dc.b $D7 ; ×
		dc.b $F5 ; õ
		dc.b $79 ; y
		dc.b $9F ; Ÿ
		dc.b $15
		dc.b $FD ; ý
		dc.b $25 ; %
		dc.b $D1 ; Ñ
		dc.b $2A ; *
		dc.b $D5 ; Õ
		dc.b $B5 ; µ
		dc.b $57 ; W
		dc.b $D4 ; Ô
		dc.b $C7 ; Ç
		dc.b   6
		dc.b $24 ; $
		dc.b $B1 ; ±
		dc.b $30 ; 0
		dc.b $FE ; þ
		dc.b $19
		dc.b $24 ; $
		dc.b $AB ; «
		dc.b $EB ; ë
		dc.b $7B ; {
		dc.b $54 ; T
		dc.b $F6 ; ö
		dc.b $4A ; J
		dc.b $3D ; =
		dc.b $B3 ; ³
		dc.b $D2 ; Ò
		dc.b $57 ; W
		dc.b $5B ; [
		dc.b $74 ; t
		dc.b $25 ; %
		dc.b $FB ; û
		dc.b $71 ; q
		dc.b $AF ; ¯
		dc.b $F8 ; ø
		dc.b $2F ; /
		dc.b $E2 ; â
		dc.b $DF ; ß
		dc.b $DF ; ß
		dc.b $38 ; 8
		dc.b $69 ; i
		dc.b $FF
		dc.b $BE ; ¾
		dc.b $FF
		dc.b $16
		dc.b $FE ; þ
		dc.b $FF
		dc.b $FD ; ý
		dc.b $CF ; Ï
		dc.b $FC ; ü
		dc.b $BF ; ¿
		dc.b $EF ; ï
		dc.b $BF ; ¿
		dc.b $C5 ; Å
		dc.b $FD ; ý
		dc.b $1D
		dc.b $7F ; 
		dc.b $D1 ; Ñ
		dc.b $12
		dc.b $FD ; ý
		dc.b $BC ; ¼
		dc.b $13
		dc.b   7
		dc.b $FE ; þ
		dc.b $CB ; Ë
		dc.b $9F ; Ÿ
		dc.b $8F ; 
		dc.b $FE ; þ
		dc.b $FB ; û
		dc.b $FC ; ü
		dc.b $5A ; Z
		dc.b $FF
		dc.b $A3 ; £
		dc.b $FA ; ú
		dc.b $6F ; o
		dc.b $F0 ; ð
		dc.b $D7 ; ×
		dc.b $AE ; ®
		dc.b $55 ; U
		dc.b $30 ; 0
		dc.b $97 ; —
		dc.b $F1 ; ñ
		dc.b $C9 ; É
		dc.b  $D
		dc.b $5C ; \
		dc.b $49 ; I
		dc.b  $D
		dc.b $5C ; \
		dc.b $6B ; k
		dc.b $CE ; Î
		dc.b $D0 ; Ð
		dc.b $BC ; ¼
		dc.b $D6 ; Ö
		dc.b $C4 ; Ä
		dc.b $B1 ; ±
		dc.b $27 ; '
		dc.b $A2 ; ¢
		dc.b $D9 ; Ù
		dc.b $6B ; k
		dc.b $24 ; $
		dc.b $96 ; –
		dc.b $25 ; %
		dc.b $AB ; «
		dc.b $D7 ; ×
		dc.b $D8 ; Ø
		dc.b $C8 ; È
		dc.b $48 ; H
		dc.b $6A ; j
		dc.b $D9 ; Ù
		dc.b  $D
		dc.b $4C ; L
		dc.b $8F ; 
		dc.b $35 ; 5
		dc.b $32 ; 2
		dc.b $3E ; >
		dc.b $B6 ; ¶
		dc.b $8F ; 
		dc.b $11
		dc.b   8
		dc.b $10
		dc.b $20
		dc.b $CE ; Î
		dc.b $10
		dc.b $20
		dc.b $42 ; B
		dc.b $AF ; ¯
		dc.b  $F
		dc.b  $F
		dc.b $1A
		dc.b $C3 ; Ã
		dc.b $C3 ; Ã
		dc.b $C3 ; Ã
		dc.b $C7 ; Ç
		dc.b $F5 ; õ
		dc.b $63 ; c
		dc.b $77 ; w
		dc.b $F0 ; ð
		dc.b $D5 ; Õ
		dc.b $AA ; ª
		dc.b $47 ; G
		dc.b $AA ; ª
		dc.b   4
		dc.b $17
		dc.b $E7 ; ç
		dc.b   8
		dc.b $10
		dc.b $21 ; !
		dc.b $57 ; W
		dc.b $87 ; ‡
		dc.b $87 ; ‡
		dc.b $8D ; 
		dc.b $61 ; a
		dc.b $E1 ; á
		dc.b $E1 ; á
		dc.b $E2 ; â
		dc.b $E8 ; è
		dc.b $FF
		dc.b $55 ; U
		dc.b $B5 ; µ
		dc.b $FF
		dc.b  $C
		dc.b $33 ; 3
		dc.b $EB ; ë
		dc.b $46 ; F
		dc.b $40 ; @
		dc.b $83 ; ƒ
		dc.b $38 ; 8
		dc.b $40 ; @
		dc.b $81 ; 
		dc.b  $A
		dc.b $BC ; ¼
		dc.b $3C ; <
		dc.b $3C ; <
		dc.b $6B ; k
		dc.b  $F
		dc.b  $F
		dc.b  $F
		dc.b $17
		dc.b $E7 ; ç
		dc.b $FD ; ý
		dc.b $91 ; ‘
		dc.b $58 ; X
		dc.b $86 ; †
		dc.b $35 ; 5
		dc.b $C4 ; Ä
		dc.b $35 ; 5
		dc.b $71 ; q
		dc.b  $C
		dc.b $6B ; k
		dc.b $88 ; ˆ
		dc.b $6F ; o
		dc.b $E8 ; è
		dc.b $DE ; Þ
		dc.b $49 ; I
		dc.b $24 ; $
		dc.b $98 ; ˜
		dc.b $35 ; 5
		dc.b $B2 ; ²
		dc.b $D7 ; ×
		dc.b   6
		dc.b $24 ; $
		dc.b $7E ; ~
		dc.b $86 ; †
		dc.b $BC ; ¼
		dc.b $E4 ; ä
		dc.b $9F ; Ÿ
		dc.b $DB ; Û
		dc.b $B0 ; °
		dc.b $68 ; h
		dc.b $D6 ; Ö
		dc.b $C9 ; É
		dc.b $83 ; ƒ
		dc.b $1D
		dc.b $FD ; ý
		dc.b $F2 ; ò
		dc.b $74 ; t
		dc.b $FF
		dc.b $DF ; ß
		dc.b $7F ; 
		dc.b $8B ; ‹
		dc.b $FA ; ú
		dc.b $2F ; /
		dc.b $FF
		dc.b   8
		dc.b $4F ; O
		dc.b $DB ; Û
		dc.b $9A ; š
		dc.b $7E ; ~
		dc.b $CB ; Ë
		dc.b $9E ; ž
		dc.b $37 ; 7
		dc.b $7F ; 
		dc.b $DF ; ß
		dc.b $7F ; 
		dc.b $8B ; ‹
		dc.b $7F ; 
		dc.b $7C ; |
		dc.b $9F ; Ÿ
		dc.b $EB ; ë
		dc.b $76 ; v
		dc.b $57 ; W
		dc.b $13
		dc.b $12
		dc.b $49 ; I
		dc.b $31 ; 1
		dc.b $FF
		dc.b   8
		dc.b $63 ; c
		dc.b $5C ; \
		dc.b $45 ; E
		dc.b $F5 ; õ
		dc.b $45 ; E
		dc.b $5A ; Z
		dc.b $A8 ; ¨
		dc.b $98 ; ˜
		dc.b $86 ; †
		dc.b $AE ; ®
		dc.b $22 ; "
		dc.b $FF
		dc.b $D8 ; Ø
		dc.b $DD ; Ý
		dc.b $FA ; ú
		dc.b $4A ; J
		dc.b $B7 ; ·
		dc.b $8D ; 
		dc.b $48 ; H
		dc.b $12
		dc.b $B4 ; ´
		dc.b $35 ; 5
		dc.b $BC ; ¼
		dc.b $3E ; >
		dc.b $B7 ; ·
		dc.b $8F ; 
		dc.b $DB ; Û
		dc.b $B5 ; µ
		dc.b $D1 ; Ñ
		dc.b $BB ; »
		dc.b $F8 ; ø
		dc.b $6A ; j
		dc.b $FA ; ú
		dc.b $93 ; “
		dc.b $58 ; X
		dc.b $40 ; @
		dc.b $82 ; ‚
		dc.b $F8 ; ø
		dc.b $A0 ;  
		dc.b $40 ; @
		dc.b $81 ; 
		dc.b  $A
		dc.b $BC ; ¼
		dc.b $3C ; <
		dc.b $3C ; <
		dc.b $6B ; k
		dc.b  $F
		dc.b  $F
		dc.b  $F
		dc.b $1A
		dc.b $7F ; 
		dc.b $4F ; O
		dc.b $FC ; ü
		dc.b $3F ; ?
		dc.b $D3 ; Ó
		dc.b $D4 ; Ô
		dc.b $D1 ; Ñ
		dc.b $64 ; d
		dc.b   8
		dc.b $33 ; 3
		dc.b $84 ; „
		dc.b   8
		dc.b $10
		dc.b $AB ; «
		dc.b $C3 ; Ã
		dc.b $C3 ; Ã
		dc.b $C6 ; Æ
		dc.b $B0 ; °
		dc.b $F0 ; ð
		dc.b $F0 ; ð
		dc.b $F1 ; ñ
		dc.b $FE ; þ
		dc.b $34 ; 4
		dc.b $C2 ; Â
		dc.b $24 ; $
		dc.b $92 ; ’
		dc.b $4F ; O
		dc.b $1E
		dc.b $7B ; {
		dc.b $B7 ; ·
		dc.b $95 ; •
		dc.b $95 ; •
		dc.b   2
		dc.b $71 ; q
		dc.b $86 ; †
		dc.b $54 ; T
		dc.b $87 ; ‡
		dc.b $18
		dc.b $60 ; `
		dc.b $D4 ; Ô
		dc.b $BA ; º
		dc.b $D6 ; Ö
		dc.b $AE ; ®
		dc.b $EE ; î
		dc.b $CA ; Ê
		dc.b $F9 ; ù
		dc.b $CF ; Ï
		dc.b $10
		dc.b $40 ; @
		dc.b $81 ; 
		dc.b   6
		dc.b $70 ; p
		dc.b $81 ; 
		dc.b   2
		dc.b $2B ; +
		dc.b   6
		dc.b  $C
		dc.b $2F ; /
		dc.b  $C
		dc.b $18
		dc.b $30 ; 0
		dc.b $FF
		dc.b $A6 ; ¦
		dc.b $93 ; “
		dc.b $FF
		dc.b $21 ; !
		dc.b $C5 ; Å
		dc.b $FE ; þ
		dc.b $32 ; 2
		dc.b $49 ; I
		dc.b $2D ; -
		dc.b $87 ; ‡
		dc.b $17
		dc.b $11
		dc.b $24 ; $
		dc.b $93 ; “
		dc.b $C5 ; Å
		dc.b $C5 ; Å
		dc.b $83 ; ƒ
		dc.b $56 ; V
		dc.b $C4 ; Ä
		dc.b $9C ; œ
		dc.b $38 ; 8
		dc.b $AF ; ¯
		dc.b $23 ; #
		dc.b $B1 ; ±
		dc.b $F2 ; ò
		dc.b $7C ; |
		dc.b $9F ; Ÿ
		dc.b $72 ; r
		dc.b   6
		dc.b $FD ; ý
		dc.b $8A ; Š
		dc.b $DE ; Þ
		dc.b $10
		dc.b $21 ; !
		dc.b $3A ; :
		dc.b $BF ; ¿
		dc.b $A9 ; ©
		dc.b $C4 ; Ä
		dc.b $64 ; d
		dc.b $F9 ; ù
		dc.b $3E ; >
		dc.b $4F ; O
		dc.b $93 ; “
		dc.b $F7 ; ÷
		dc.b $C2 ; Â
		dc.b   4
		dc.b   8
		dc.b $10
		dc.b $D6 ; Ö
		dc.b $8F ; 
		dc.b $FE ; þ
		dc.b $A5 ; ¥
		dc.b $DC ; Ü
		dc.b $4C ; L
		dc.b $5F ; _
		dc.b $27 ; '
		dc.b $C9 ; É
		dc.b $F2 ; ò
		dc.b $7C ; |
		dc.b $B7 ; ·
		dc.b $D0 ; Ð
		dc.b $20
		dc.b $40 ; @
		dc.b $84 ; „
		dc.b $5D ; ]
		dc.b $84 ; „
		dc.b $7B ; {
		dc.b $3F ; ?
		dc.b $8E ; Ž
		dc.b $AD ; ­
		dc.b $5B ; [
		dc.b $2F ; /
		dc.b $64 ; d
		dc.b $9F ; Ÿ
		dc.b  $B
		dc.b $90 ; 
		dc.b $45 ; E
		dc.b $2A ; *
		dc.b $BD ; ½
		dc.b   9
		dc.b $C1 ; Á
		dc.b $F0 ; ð
		dc.b $E7 ; ç
		dc.b $D6 ; Ö
		dc.b $44 ; D
		dc.b $9F ; Ÿ
		dc.b $27 ; '
		dc.b $C9 ; É
		dc.b $FA ; ú
		dc.b $BF ; ¿
		dc.b $C2 ; Â
		dc.b $A8 ; ¨
		dc.b $10
		dc.b $20
		dc.b $42 ; B
		dc.b $5E ; ^
		dc.b $B7 ; ·
		dc.b $3D ; =
		dc.b $6E ; n
		dc.b $1D
		dc.b $88 ; ˆ
		dc.b $D6 ; Ö
		dc.b $BE ; ¾
		dc.b $21 ; !
		dc.b $AB ; «
		dc.b $E6 ; æ
		dc.b  $D
		dc.b $5F ; _
		dc.b $30 ; 0
		dc.b $65 ; e
		dc.b $61 ; a
		dc.b $3C ; <
		dc.b $64 ; d
		dc.b $19
		dc.b $58 ; X
		dc.b $67 ; g
		dc.b $90 ; 
		dc.b $6A ; j
		dc.b $91 ; ‘
		dc.b $E1 ; á
		dc.b $83 ; ƒ
		dc.b $E8 ; è
		dc.b $F0 ; ð
		dc.b $D7 ; ×
		dc.b $46 ; F
		dc.b $9A ; š
		dc.b $CE ; Î
		dc.b $AA ; ª
		dc.b $D8 ; Ø
		dc.b $5B ; [
		dc.b $5B ; [
		dc.b  $B
		dc.b $68 ; h
		dc.b $C1 ; Á
		dc.b $85 ; …
		dc.b $B4 ; ´
		dc.b $60 ; `
		dc.b $C2 ; Â
		dc.b $DA ; Ú
		dc.b $30 ; 0
		dc.b $61 ; a
		dc.b $6D ; m
		dc.b $DF ; ß
		dc.b $A4 ; ¤
		dc.b $D7 ; ×
		dc.b $6D ; m
		dc.b $D1 ; Ñ
		dc.b $24 ; $
		dc.b $E1 ; á
		dc.b $CD ; Í
		dc.b $5A ; Z
		dc.b $4C ; L
		dc.b $E9 ; é
		dc.b $88 ; ˆ
		dc.b $FE ; þ
		dc.b $A8 ; ¨
		dc.b $8B ; ‹
		dc.b $EB ; ë
		dc.b $8C ; Œ
		dc.b $AA ; ª
		dc.b $8D ; 
		dc.b $A9 ; ©
		dc.b $57 ; W
		dc.b $24 ; $
		dc.b $AE ; ®
		dc.b $67 ; g
		dc.b  $D
		dc.b $3F ; ?
		dc.b $A2 ; ¢
		dc.b $D7 ; ×
		dc.b $CF ; Ï
		dc.b $12
		dc.b $4E ; N
		dc.b $12
		dc.b $C1 ; Á
		dc.b  $C
		dc.b $35 ; 5
		dc.b $7E ; ~
		dc.b $94 ; ”
		dc.b $3E ; >
		dc.b $37 ; 7
		dc.b $DC ; Ü
		dc.b $22 ; "
		dc.b $1F
		dc.b $15
		dc.b $7C ; |
		dc.b $57 ; W
		dc.b $9A ; š
		dc.b $2B ; +
		dc.b $CD ; Í
		dc.b $15
		dc.b $9D ; 
		dc.b $B1 ; ±
		dc.b $13
		dc.b $B6 ; ¶
		dc.b $32 ; 2
		dc.b   9
		dc.b $6C ; l
		dc.b $82 ; ‚
		dc.b $5A ; Z
		dc.b $8B ; ‹
		dc.b $9D ; 
		dc.b $50 ; P
		dc.b $E9 ; é
		dc.b $8F ; 
		dc.b $F5 ; õ
		dc.b $63 ; c
		dc.b $5B ; [
		dc.b $3F ; ?
		dc.b   6
		dc.b $32 ; 2
		dc.b $C1 ; Á
		dc.b  $D
		dc.b $72 ; r
		dc.b $FE ; þ
		dc.b $AC ; ¬
		dc.b $84 ; „
		dc.b $7F ; 
		dc.b $43 ; C
		dc.b $C6 ; Æ
		dc.b $8B ; ‹
		dc.b $BC ; ¼
		dc.b $AD ; ­
		dc.b $13
		dc.b  $E
		dc.b $C7 ; Ç
		dc.b $C9 ; É
		dc.b $EB ; ë
		dc.b $72 ; r
		dc.b   6
		dc.b $CF ; Ï
		dc.b $4B ; K
		dc.b $C2 ; Â
		dc.b $13
		dc.b $C7 ; Ç
		dc.b $AF ; ¯
		dc.b $F6 ; ö
		dc.b $BF ; ¿
		dc.b $F2 ; ò
		dc.b $32 ; 2
		dc.b $7C ; |
		dc.b $9F ; Ÿ
		dc.b $27 ; '
		dc.b $C9 ; É
		dc.b $FB ; û
		dc.b $E1 ; á
		dc.b   2
		dc.b   4
		dc.b   8
		dc.b $6A ; j
		dc.b $4F ; O
		dc.b $D3 ; Ó
		dc.b $DB ; Û
		dc.b $AF ; ¯
		dc.b $B3 ; ³
		dc.b $8E ; Ž
		dc.b $8D ; 
		dc.b $FA ; ú
		dc.b $20
		dc.b $CB ; Ë
		dc.b $D9 ; Ù
		dc.b $27 ; '
		dc.b $C2 ; Â
		dc.b $E4 ; ä
		dc.b $11
		dc.b $4A ; J
		dc.b $AF ; ¯
		dc.b $42 ; B
		dc.b $4F ; O
		dc.b $E8 ; è
		dc.b $B5 ; µ
		dc.b $FE ; þ
		dc.b $97 ; —
		dc.b $FE ; þ
		dc.b $52 ; R
		dc.b $7C ; |
		dc.b $9F ; Ÿ
		dc.b $27 ; '
		dc.b $C9 ; É
		dc.b $FB ; û
		dc.b $E1 ; á
		dc.b   2
		dc.b   4
		dc.b   8
		dc.b $61 ; a
		dc.b $73 ; s
		dc.b $D6 ; Ö
		dc.b $E5 ; å
		dc.b $BA ; º
		dc.b $2B ; +
		dc.b $74 ; t
		dc.b $79 ; y
		dc.b $C7 ; Ç
		dc.b $1D
		dc.b $CB ; Ë
		dc.b $FE ; þ
		dc.b $21 ; !
		dc.b $27 ; '
		dc.b $C9 ; É
		dc.b $FA ; ú
		dc.b $B9 ; ¹
		dc.b $87 ; ‡
		dc.b $F0 ; ð
		dc.b $57 ; W
		dc.b $98 ; ˜
		dc.b $20
		dc.b $40 ; @
		dc.b $9F ; Ÿ
		dc.b $9F ; Ÿ
		dc.b $AD ; ­
		dc.b   3
		dc.b $EA ; ê
		dc.b $64 ; d
		dc.b $C1 ; Á
		dc.b $83 ; ƒ
		dc.b $F8 ; ø
		dc.b $D6 ; Ö
		dc.b $F2 ; ò
		dc.b $49 ; I
		dc.b $25 ; %
		dc.b $75 ; u
		dc.b $7E ; ~
		dc.b $D7 ; ×
		dc.b $5F ; _
		dc.b $65 ; e
		dc.b $D6 ; Ö
		dc.b $F1 ; ñ
		dc.b $93 ; “
		dc.b $5F ; _
		dc.b $E6 ; æ
		dc.b $6A ; j
		dc.b $4D ; M
		dc.b $A4 ; ¤
		dc.b $E9 ; é
		dc.b $FD ; ý
		dc.b $16
		dc.b $BF ; ¿
		dc.b $D2 ; Ò
		dc.b $92 ; ’
		dc.b $49 ; I
		dc.b $30 ; 0
		dc.b $D5 ; Õ
		dc.b $FA ; ú
		dc.b $59 ; Y
		dc.b $2D ; -
		dc.b $FF
		dc.b $A2 ; ¢
		dc.b $4E ; N
		dc.b $68 ; h
		dc.b $AF ; ¯
		dc.b $34 ; 4
		dc.b $56 ; V
		dc.b $76 ; v
		dc.b $C4 ; Ä
		dc.b $4E ; N
		dc.b $D8 ; Ø
		dc.b $AA ; ª
		dc.b $5B ; [
		dc.b $20
		dc.b $96 ; –
		dc.b $C3 ; Ã
		dc.b $3A ; :
		dc.b $A1 ; ¡
		dc.b $3A ; :
		dc.b $63 ; c
		dc.b $FC ; ü
		dc.b $5D ; ]
		dc.b $58 ; X
		dc.b $4A ; J
		dc.b $AB ; «
		dc.b $A5 ; ¥
		dc.b $19
		dc.b $42 ; B
		dc.b $E1 ; á
		dc.b $10
		dc.b $8B ; ‹
		dc.b $70 ; p
		dc.b $88 ; ˆ
		dc.b $65 ; e
		dc.b $B8 ; ¸
		dc.b $44 ; D
		dc.b $32 ; 2
		dc.b $DC ; Ü
		dc.b $22 ; "
		dc.b $18
		dc.b $35 ; 5
		dc.b $C2 ; Â
		dc.b $21 ; !
		dc.b $83 ; ƒ
		dc.b  $E
		dc.b $30 ; 0
		dc.b $D9 ; Ù
		dc.b $F8 ; ø
		dc.b $E0 ; à
		dc.b $DF ; ß
		dc.b $B2 ; ²
		dc.b $17
		dc.b $D4 ; Ô
		dc.b $C1 ; Á
		dc.b $97 ; —
		dc.b $B1 ; ±
		dc.b $E1 ; á
		dc.b $96 ; –
		dc.b $D5 ; Õ
		dc.b $BD ; ½
		dc.b $6D ; m
		dc.b $1B
		dc.b $CB ; Ë
		dc.b $68 ; h
		dc.b $6A ; j
		dc.b $5C ; \
		dc.b $1A
		dc.b $91 ; ‘
		dc.b $7C ; |
		dc.b $BF ; ¿
		dc.b $8B ; ‹
		dc.b $FF
		dc.b $22 ; "
		dc.b $F9 ; ù
		dc.b $3E ; >
		dc.b $4F ; O
		dc.b $93 ; “
		dc.b $E5 ; å
		dc.b $BE ; ¾
		dc.b $81 ; 
		dc.b   2
		dc.b   4
		dc.b $34 ; 4
		dc.b $4D ; M
		dc.b $6A ; j
		dc.b $FB ; û
		dc.b $5F ; _
		dc.b $26 ; &
		dc.b $8F ; 
		dc.b $3A ; :
		dc.b $B0 ; °
		dc.b $6F ; o
		dc.b $D1 ; Ñ
		dc.b $41 ; A
		dc.b $8F ; 
		dc.b $41 ; A
		dc.b $24 ; $
		dc.b $C7 ; Ç
		dc.b $FC ; ü
		dc.b $3F ; ?
		dc.b $F2 ; ò
		dc.b $3C ; <
		dc.b $44 ; D
		dc.b $92 ; ’
		dc.b $97 ; —
		dc.b $C2 ; Â
		dc.b $F8 ; ø
		dc.b $86 ; †
		dc.b $AD ; ­
		dc.b $AB ; «
		dc.b $62 ; b
		dc.b $49 ; I
		dc.b $A9 ; ©
		dc.b $86 ; †
		dc.b $AF ; ¯
		dc.b $E2 ; â
		dc.b $3C ; <
		dc.b $92 ; ’
		dc.b $4E ; N
		dc.b $AA ; ª
		dc.b $D8 ; Ø
		dc.b $5B ; [
		dc.b $FC ; ü
		dc.b $57 ; W
		dc.b $FE ; þ
		dc.b $93 ; “
		dc.b $8F ; 
		dc.b $9C ; œ
		dc.b $93 ; “
		dc.b $4E ; N
		dc.b $69 ; i
		dc.b $54 ; T
		dc.b $93 ; “
		dc.b $42 ; B
		dc.b $BA ; º
		dc.b $63 ; c
		dc.b $FE ; þ
		dc.b $12
		dc.b $49 ; I
		dc.b $24 ; $
		dc.b $B1 ; ±
		dc.b $24 ; $
		dc.b $92 ; ’
		dc.b $49 ; I
		dc.b $5F ; _
		dc.b $E1 ; á
		dc.b $AB ; «
		dc.b $56 ; V
		dc.b $CB ; Ë
		dc.b $D9 ; Ù
		dc.b $27 ; '
		dc.b $C2 ; Â
		dc.b $E4 ; ä
		dc.b $11
		dc.b $46 ; F
		dc.b $84 ; „
		dc.b $6F ; o
		dc.b $45 ; E
		dc.b $B8 ; ¸
		dc.b $E1 ; á
		dc.b $27 ; '
		dc.b $FE ; þ
		dc.b $D5 ; Õ
		dc.b $5B ; [
		dc.b $F8 ; ø
		dc.b $46 ; F
		dc.b $4F ; O
		dc.b $93 ; “
		dc.b $E4 ; ä
		dc.b $F9 ; ù
		dc.b $3F ; ?
		dc.b $7D ; }
		dc.b $24 ; $
		dc.b $F9 ; ù
		dc.b $3C ; <
		dc.b $3E ; >
		dc.b $4B ; K
		dc.b $AA ; ª
		dc.b $12
		dc.b $5D ; ]
		dc.b $50 ; P
		dc.b $95 ; •
		dc.b $BF ; ¿
		dc.b $B2 ; ²
		dc.b $B7 ; ·
		dc.b $FE ; þ
		dc.b $5C ; \
		dc.b $66 ; f
		dc.b $4F ; O
		dc.b $93 ; “
		dc.b $E4 ; ä
		dc.b $F9 ; ù
		dc.b $3F ; ?
		dc.b $7D ; }
		dc.b $F2 ; ò
		dc.b $49 ; I
		dc.b $3E ; >
		dc.b $4F ; O
		dc.b $1A
		dc.b $97 ; —
		dc.b $5A ; Z
		dc.b $C9 ; É
		dc.b $17
		dc.b $5A ; Z
		dc.b $C6 ; Æ
		dc.b $EB ; ë
		dc.b $7F ; 
		dc.b $65 ; e
		dc.b $6F ; o
		dc.b $FC ; ü
		dc.b $8C ; Œ
		dc.b $9F ; Ÿ
		dc.b $27 ; '
		dc.b $C9 ; É
		dc.b $F2 ; ò
		dc.b $7E ; ~
		dc.b $FB ; û
		dc.b $E4 ; ä
		dc.b $F9 ; ù
		dc.b  $C
		dc.b $F2 ; ò
		dc.b $1F
		dc.b $A7 ; §
		dc.b   9
		dc.b $26 ; &
		dc.b $1A
		dc.b $C2 ; Â
		dc.b $49 ; I
		dc.b $AE ; ®
		dc.b $FD ; ý
		dc.b $15
		dc.b $D6 ; Ö
		dc.b $DF ; ß
		dc.b $2F ; /
		dc.b $E1 ; á
		dc.b $31 ; 1
		dc.b $59 ; Y
		dc.b $3E ; >
		dc.b $4F ; O
		dc.b $93 ; “
		dc.b $E4 ; ä
		dc.b $FD ; ý
		dc.b $F5 ; õ
		dc.b $7C ; |
		dc.b $9F ; Ÿ
		dc.b $27 ; '
		dc.b $A3 ; £
		dc.b $D3 ; Ó
		dc.b $50 ; P
		dc.b $D4 ; Ô
		dc.b $19
		dc.b $E8 ; è
		dc.b $B9 ; ¹
		dc.b $C5 ; Å
		dc.b $F6 ; ö
		dc.b $DC ; Ü
		dc.b $DF ; ß
		dc.b $A4 ; ¤
		dc.b $24 ; $
		dc.b $93 ; “
		dc.b $7E ; ~
		dc.b $1F
		dc.b $E3 ; ã
		dc.b $5F ; _
		dc.b $E9 ; é
		dc.b $92 ; ’
		dc.b $49 ; I
		dc.b $3C ; <
		dc.b $4B ; K
		dc.b $CF ; Ï
		dc.b $FB ; û
		dc.b $75 ; u
		dc.b $D5 ; Õ
		dc.b $46 ; F
		dc.b  $C
		dc.b $2D ; -
		dc.b $A3 ; £
		dc.b   6
		dc.b $16
		dc.b $F3 ; ó
		dc.b $AB ; «
		dc.b   6
		dc.b $AD ; ­
		dc.b $83 ; ƒ
		dc.b $71 ; q
		dc.b $D1 ; Ñ
		dc.b $A1 ; ¡
		dc.b $FC ; ü
		dc.b $38 ; 8
		dc.b $48 ; H
		dc.b $48 ; H
		dc.b $6A ; j
		dc.b  $F
		dc.b $54 ; T
		dc.b $7C ; |
		dc.b $95 ; •
		dc.b $E3 ; ã
		dc.b $99 ; ™
		dc.b $79 ; y
		dc.b $87 ; ‡
		dc.b $34 ; 4
		dc.b $AD ; ­
		dc.b $E5 ; å
		dc.b $CF ; Ï
		dc.b $CA ; Ê
		dc.b $DE ; Þ
		dc.b $56 ; V
		dc.b $9F ; Ÿ
		dc.b $F9 ; ù
		dc.b $13
		dc.b $AE ; ®
		dc.b $43 ; C
		dc.b $53 ; S
		dc.b $E5 ; å
		dc.b $AD ; ­
		dc.b $73 ; s
		dc.b $AE ; ®
		dc.b $A1 ; ¡
		dc.b $CD ; Í
		dc.b $4F ; O
		dc.b $D2 ; Ò
		dc.b $72 ; r
		dc.b $FD ; ý
		dc.b $2D ; -
		dc.b $A7 ; §
		dc.b $FE ; þ
		dc.b $44 ; D
		dc.b $8F ; 
		dc.b $D3 ; Ó
		dc.b $CA ; Ê
		dc.b $9F ; Ÿ
		dc.b $A7 ; §
		dc.b $59 ; Y
		dc.b $3F ; ?
		dc.b $9B ; ›
		dc.b $F4 ; ô
		dc.b $C3 ; Ã
		dc.b $99 ; ™
		dc.b   7
		dc.b $2F ; /
		dc.b $DA ; Ú
		dc.b $72 ; r
		dc.b $E7 ; ç
		dc.b $3F ; ?
		dc.b $F2 ; ò
		dc.b $25 ; %
		dc.b $5F ; _
		dc.b $21 ; !
		dc.b $FA ; ú
		dc.b $79 ; y
		dc.b $60 ; `
		dc.b $9C ; œ
		dc.b $CB ; Ë
		dc.b $CD ; Í
		dc.b  $B
		dc.b $B9 ; ¹
		dc.b $5D ; ]
		dc.b $6F ; o
		dc.b $2F ; /
		dc.b $D2 ; Ò
		dc.b $9F ; Ÿ
		dc.b $F9 ; ù
		dc.b $13
		dc.b $FE ; þ
		dc.b $32 ; 2
		dc.b $49 ; I
		dc.b $C2 ; Â
		dc.b $FA ; ú
		dc.b $9A ; š
		dc.b $23 ; #
		dc.b $F8 ; ø
		dc.b $71 ; q
		dc.b $5B ; [
		dc.b $E3 ; ã
		dc.b $CF ; Ï
		dc.b $AE ; ®
		dc.b $50 ; P
		dc.b $7D ; }
		dc.b $68 ; h
		dc.b $1F
		dc.b $46 ; F
		dc.b   8
		dc.b $1F
		dc.b $46 ; F
		dc.b   8
		dc.b $1F
		dc.b $46 ; F
		dc.b   8
		dc.b $1F
		dc.b $46 ; F
		dc.b   9
		dc.b $5B ; [
		dc.b   4
		dc.b $97 ; —
		dc.b $F1 ; ñ
		dc.b $75 ; u
		dc.b $12
		dc.b $49 ; I
		dc.b $78 ; x
		dc.b $78 ; x
		dc.b $78 ; x
		dc.b $7A ; z
		dc.b $BC ; ¼
		dc.b $3C ; <
		dc.b $3C ; <
		dc.b $7F ; 
		dc.b $DD ; Ý
		dc.b $E4 ; ä
		dc.b $9C ; œ
		dc.b $12
		dc.b $B4 ; ´
		dc.b  $F
		dc.b  $F
		dc.b  $F
		dc.b $40 ; @
		dc.b $C1 ; Á
		dc.b $E1 ; á
		dc.b $F2 ; ò
		dc.b  $C
		dc.b $3F ; ?
		dc.b $4F ; O
		dc.b $20
		dc.b $DC ; Ü
		dc.b $EA ; ê
		dc.b $81 ; 
		dc.b $84 ; „
		dc.b $95 ; •
		dc.b   3
		dc.b   6
		dc.b $40 ; @
		dc.b $81 ; 
		dc.b $83 ; ƒ
		dc.b $23 ; #
		dc.b $D5 ; Õ
		dc.b $83 ; ƒ
		dc.b $23 ; #
		dc.b $D5 ; Õ
		dc.b $83 ; ƒ
		dc.b $23 ; #
		dc.b $E8 ; è
		dc.b $C8 ; È
		dc.b $FA ; ú
		dc.b $32 ; 2
		dc.b $3E ; >
		dc.b $A7 ; §
		dc.b $DD ; Ý
		dc.b $FC ; ü
		dc.b $24 ; $
		dc.b $C1 ; Á
		dc.b $89 ; ‰
		dc.b $24 ; $
		dc.b $91 ; ‘
		dc.b $FC ; ü
		dc.b $3C ; <
		dc.b $2D ; -
		dc.b $D7 ; ×
		dc.b  $D
		dc.b $7B ; {
		dc.b $CB ; Ë
		dc.b $FD ; ý
		dc.b $15
		dc.b $4F ; O
		dc.b $E3 ; ã
		dc.b $C3 ; Ã
		dc.b $F8 ; ø
		dc.b $2B ; +
		dc.b $FD ; ý
		dc.b $35 ; 5
		dc.b $6A ; j
		dc.b $B7 ; ·
		dc.b $B0 ; °
		dc.b $FE ; þ
		dc.b $A8 ; ¨
		dc.b $E6 ; æ
		dc.b $8B ; ‹
		dc.b $A2 ; ¢
		dc.b $E8 ; è
		dc.b $B8 ; ¸
		dc.b $24 ; $
		dc.b $D2 ; Ò
		dc.b $69 ; i
		dc.b $34 ; 4
		dc.b $19
		dc.b $3B ; ;
		dc.b $F3 ; ó
		dc.b $BF ; ¿
		dc.b $9F ; Ÿ
		dc.b $5F ; _
		dc.b $D3 ; Ó
		dc.b $CA ; Ê
		dc.b $EB ; ë
		dc.b $73 ; s
		dc.b  $F
		dc.b $F7 ; ÷
		dc.b $8C ; Œ
		dc.b $B9 ; ¹
		dc.b $87 ; ‡
		dc.b $30 ; 0
		dc.b $E6 ; æ
		dc.b $85 ; …
		dc.b $B9 ; ¹
		dc.b $5B ; [
		dc.b $95 ; •
		dc.b $B9 ; ¹
		dc.b $69 ; i
		dc.b $8B ; ‹
		dc.b $A2 ; ¢
		dc.b $E8 ; è
		dc.b $BA ; º
		dc.b $2E ; .
		dc.b $9A ; š
		dc.b $4D ; M
		dc.b $26 ; &
		dc.b $93 ; “
		dc.b $CE ; Î
		dc.b $10
		dc.b $20
		dc.b $49 ; I
		dc.b $FF
		dc.b $AA ; ª
		dc.b $DF ; ß
		dc.b $FF
		dc.b $F3 ; ó
		dc.b  $E
		dc.b $61 ; a
		dc.b $CC ; Ì
		dc.b $39 ; 9
		dc.b $85 ; …
		dc.b $B9 ; ¹
		dc.b $5B ; [
		dc.b $95 ; •
		dc.b $B9 ; ¹
		dc.b $5B ; [
		dc.b $97 ; —
		dc.b $F5 ; õ
		dc.b $56 ; V
		dc.b $2E ; .
		dc.b $8B ; ‹
		dc.b $A2 ; ¢
		dc.b $E7 ; ç
		dc.b $89 ; ‰
		dc.b $A4 ; ¤
		dc.b $D2 ; Ò
		dc.b $69 ; i
		dc.b $31 ; 1
		dc.b $3B ; ;
		dc.b $33 ; 3
		dc.b $72 ; r
		dc.b $CD ; Í
		dc.b $C8 ; È
		dc.b $5D ; ]
		dc.b $27 ; '
		dc.b $D5 ; Õ
		dc.b $FE ; þ
		dc.b $F1 ; ñ
		dc.b $CC ; Ì
		dc.b $39 ; 9
		dc.b $87 ; ‡
		dc.b $30 ; 0
		dc.b $C8 ; È
		dc.b $3E ; >
		dc.b $6F ; o
		dc.b $9C ; œ
		dc.b $B4 ; ´
		dc.b $76 ; v
		dc.b $51 ; Q
		dc.b $1F
		dc.b $9E ; ž
		dc.b $A4 ; ¤
		dc.b $D7 ; ×
		dc.b $5A ; Z
		dc.b $14
		dc.b $27 ; '
		dc.b   4
		dc.b $97 ; —
		dc.b $F4 ; ô
		dc.b $43 ; C
		dc.b $CD ; Í
		dc.b $6F ; o
		dc.b $C1 ; Á
		dc.b $30 ; 0
		dc.b $6C ; l
		dc.b $25 ; %
		dc.b $5B ; [
		dc.b $F0 ; ð
		dc.b $41 ; A
		dc.b $FC ; ü
		dc.b $18
		dc.b $DA ; Ú
		dc.b $95 ; •
		dc.b $6F ; o
		dc.b $53 ; S
		dc.b $F7 ; ÷
		dc.b $55 ; U
		dc.b $EC ; ì
		dc.b $35 ; 5
		dc.b $EC ; ì
		dc.b $AF ; ¯
		dc.b $65 ; e
		dc.b $36 ; 6
		dc.b $2F ; /
		dc.b $17
		dc.b $16
		dc.b $68 ; h
		dc.b $7E ; ~
		dc.b $E8 ; è
		dc.b $5B ; [
		dc.b $4D ; M
		dc.b $87 ; ‡
		dc.b $2B ; +
		dc.b $69 ; i
		dc.b $B1 ; ±
		dc.b $F5 ; õ
		dc.b $6C ; l
		dc.b $A6 ; ¦
		dc.b $C5 ; Å
		dc.b $E2 ; â
		dc.b $E2 ; â
		dc.b $CD ; Í
		dc.b $4F ; O
		dc.b   1
		dc.b $6A ; j
		dc.b $E6 ; æ
		dc.b $1B
		dc.b $2A ; *
		dc.b $C9 ; É
		dc.b $72 ; r
		dc.b $B6 ; ¶
		dc.b $19
		dc.b $2E ; .
		dc.b $59 ; Y
		dc.b $97 ; —
		dc.b $30 ; 0
		dc.b $FD ; ý
		dc.b $D4 ; Ô
		dc.b $3C ; <
		dc.b $38 ; 8
		dc.b $B8 ; ¸
		dc.b $9F ; Ÿ
		dc.b $47 ; G
		dc.b $EC ; ì
		dc.b $CA ; Ê
		dc.b $D5 ; Õ
		dc.b $B7 ; ·
		dc.b $F3 ; ó
		dc.b $B9 ; ¹
		dc.b $B2 ; ²
		dc.b $9A ; š
		dc.b $CC ; Ì
		dc.b $3C ; <
		dc.b $65 ; e
		dc.b $35 ; 5
		dc.b $98 ; ˜
		dc.b $78 ; x
		dc.b $CA ; Ê
		dc.b $D5 ; Õ
		dc.b $B7 ; ·
		dc.b $F3 ; ó
		dc.b $B9 ; ¹
		dc.b $9F ; Ÿ
		dc.b $47 ; G
		dc.b $EC ; ì
		dc.b $DE ; Þ
		dc.b $AB ; «
		dc.b $7A ; z
		dc.b $AF ; ¯
		dc.b  $A
		dc.b $BC ; ¼
		dc.b $2A ; *
		dc.b $F0 ; ð
		dc.b $AB ; «
		dc.b $65 ; e
		dc.b $7B ; {
		dc.b $21 ; !
		dc.b $99 ; ™
		dc.b $7C ; |
		dc.b $17
		dc.b $31 ; 1
		dc.b   8
		dc.b $6B ; k
		dc.b $42 ; B
		dc.b $95 ; •
		dc.b $36 ; 6
		dc.b $7A ; z
		dc.b $5F ; _
		dc.b $9E ; ž
		dc.b $17
		dc.b $84 ; „
		dc.b $A5 ; ¥
		dc.b $E1 ; á
		dc.b $87 ; ‡
		dc.b $EC ; ì
		dc.b $62 ; b
		dc.b $8F ; 
		dc.b $8D ; 
		dc.b $72 ; r
		dc.b $A9 ; ©
		dc.b $28 ; (
		dc.b $83 ; ƒ
		dc.b $3B ; ;
		dc.b $D7 ; ×
		dc.b $F4 ; ô
		dc.b $2A ; *
		dc.b $8B ; ‹
		dc.b $9C ; œ
		dc.b $23 ; #
		dc.b $D9 ; Ù
		dc.b $52 ; R
		dc.b   9
		dc.b $25 ; %
		dc.b $60 ; `
		dc.b $8D ; 
		dc.b $74 ; t
		dc.b $18
		dc.b $27 ; '
		dc.b $F0 ; ð
		dc.b $89 ; ‰
		dc.b $38 ; 8
		dc.b $35 ; 5
		dc.b $48 ; H
		dc.b $D5 ; Õ
		dc.b $24 ; $
		dc.b $69 ; i
		dc.b $9E ; ž
		dc.b $35 ; 5
		dc.b $24 ; $
		dc.b $58 ; X
		dc.b $34 ; 4
		dc.b $3F ; ?
		dc.b $A6 ; ¦
		dc.b $3F ; ?
		dc.b $A6 ; ¦
		dc.b $3F ; ?
		dc.b $C6 ; Æ
		dc.b $BF ; ¿
		dc.b $D3 ; Ó
		dc.b $41 ; A
		dc.b $FC ; ü
		dc.b $34 ; 4
		dc.b $61 ; a
		dc.b $D0 ; Ð
		dc.b $8C ; Œ
		dc.b $BB ; »
		dc.b $D4 ; Ô
		dc.b $61 ; a
		dc.b $FA ; ú
		dc.b $26 ; &
		dc.b $82 ; ‚
		dc.b $35 ; 5
		dc.b $48 ; H
		dc.b $C6 ; Æ
		dc.b $B6 ; ¶
		dc.b $24 ; $
		dc.b $E1 ; á
		dc.b $FC ; ü
		dc.b $2F ; /
		dc.b $D0 ; Ð
		dc.b $D5 ; Õ
		dc.b $BD ; ½
		dc.b $57 ; W
		dc.b $85 ; …
		dc.b $33 ; 3
		dc.b  $D
		dc.b $86 ; †
		dc.b   9
		dc.b $46 ; F
		dc.b   8
		dc.b $FE ; þ
		dc.b $43 ; C
		dc.b $60 ; `
		dc.b $64 ; d
		dc.b $D7 ; ×
		dc.b $F9 ; ù
		dc.b $BC ; ¼
		dc.b $CA ; Ê
		dc.b $D1 ; Ñ
		dc.b $BB ; »
		dc.b $8F ; 
		dc.b $89 ; ‰
		dc.b $B3 ; ³
		dc.b $5B ; [
		dc.b $7F ; 
		dc.b $F2 ; ò
		dc.b $AD ; ­
		dc.b $A6 ; ¦
		dc.b $67 ; g
		dc.b $61 ; a
		dc.b $2C ; ,
		dc.b $25 ; %
		dc.b $9A ; š
		dc.b $DA ; Ú
		dc.b $66 ; f
		dc.b $76 ; v
		dc.b $6B ; k
		dc.b $6F ; o
		dc.b $FD ; ý
		dc.b $D7 ; ×
		dc.b $17
		dc.b $13
		dc.b $F0 ; ð
		dc.b $CA ; Ê
		dc.b $D8 ; Ø
		dc.b $66 ; f
		dc.b $B4 ; ´
		dc.b $66 ; f
		dc.b $98 ; ˜
		dc.b $7E ; ~
		dc.b $61 ; a
		dc.b $3D ; =
		dc.b $93 ; “
		dc.b  $F
		dc.b $CC ; Ì
		dc.b $27 ; '
		dc.b $9B ; ›
		dc.b $2B ; +
		dc.b $61 ; a
		dc.b $9A ; š
		dc.b $D0 ; Ð
		dc.b $FC ; ü
		dc.b $38 ; 8
		dc.b $B8 ; ¸
		dc.b $A0 ;  
		dc.b $FF
		dc.b $DD ; Ý
		dc.b $2D ; -
		dc.b $BF ; ¿
		dc.b $9D ; 
		dc.b $F0 ; ð
		dc.b $78 ; x
		dc.b $98 ; ˜
		dc.b $78 ; x
		dc.b $D8 ; Ø
		dc.b $F1 ; ñ
		dc.b $30 ; 0
		dc.b $F1 ; ñ
		dc.b $B1 ; ±
		dc.b $6D ; m
		dc.b $FC ; ü
		dc.b $EF ; ï
		dc.b $84 ; „
		dc.b $1F
		dc.b $FB ; û
		dc.b $AD ; ­
		dc.b $EA ; ê
		dc.b $B7 ; ·
		dc.b $AA ; ª
		dc.b $CD ; Í
		dc.b $86 ; †
		dc.b $6C ; l
		dc.b $33 ; 3
		dc.b $13
		dc.b $86 ; †
		dc.b $6A ; j
		dc.b $B3 ; ³
		dc.b $D7 ; ×
		dc.b $9E ; ž
		dc.b $BC ; ¼
		dc.b $F5 ; õ
		dc.b $26 ; &
		dc.b $BA ; º
		dc.b $27 ; '
		dc.b $E9 ; é
		dc.b $E0 ; à
		dc.b $9A ; š
		dc.b $F8 ; ø
		dc.b $C2 ; Â
		dc.b $4B ; K
		dc.b $5C ; \
		dc.b $55 ; U
		dc.b $3F ; ?
		dc.b $4F ; O
		dc.b $18
		dc.b $6B ; k
		dc.b $E3 ; ã
		dc.b $A3 ; £
		dc.b $C4 ; Ä
		dc.b $6A ; j
		dc.b $78 ; x
		dc.b $8D ; 
		dc.b $4F ; O
		dc.b $8D ; 
		dc.b $71 ; q
		dc.b $AD ; ­
		dc.b $AB ; «
		dc.b $62 ; b
		dc.b $95 ; •
		dc.b $32 ; 2
		dc.b $34 ; 4
		dc.b $2F ; /
		dc.b $46 ; F
		dc.b  $C
		dc.b $18
		dc.b $23 ; #
		dc.b $2D ; -
		dc.b $E1 ; á
		dc.b $1A
		dc.b  $C
		dc.b $11
		dc.b $AA ; ª
		dc.b $46 ; F
		dc.b $A9 ; ©
		dc.b $1A
		dc.b $B6 ; ¶
		dc.b $27 ; '
		dc.b   8
		dc.b $FF
		dc.b $84 ; „
		dc.b $92 ; ’
		dc.b $43 ; C
		dc.b $57 ; W
		dc.b $11
		dc.b $1A
		dc.b $E2 ; â
		dc.b $2E ; .
		dc.b $A6 ; ¦
		dc.b $78 ; x
		dc.b $CA ; Ê
		dc.b $3C ; <
		dc.b $F1 ; ñ
		dc.b $83 ; ƒ
		dc.b $47 ; G
		dc.b $F4 ; ô
		dc.b $F5 ; õ
		dc.b $71 ; q
		dc.b $BF ; ¿
		dc.b   8
		dc.b $92 ; ’
		dc.b $4F ; O
		dc.b $FC ; ü
		dc.b $BF ; ¿
		dc.b $EF ; ï
		dc.b $FF
		dc.b $7F ; 
		dc.b $F9 ; ù
		dc.b $12
		dc.b $4F ; O
		dc.b $F4 ; ô
		dc.b $B9 ; ¹
		dc.b $FF
		dc.b $EF ; ï
		dc.b $FD ; ý
		dc.b $7F ; 
		dc.b $F9 ; ù
		dc.b $12
		dc.b $4A ; J
		dc.b $C7 ; Ç
		dc.b   8
		dc.b $93 ; “
		dc.b $5B ; [
		dc.b $56 ; V
		dc.b $C9 ; É
		dc.b $53 ; S
		dc.b $23 ; #
		dc.b $42 ; B
		dc.b $F4 ; ô
		dc.b $68 ; h
		dc.b $32 ; 2
		dc.b $45 ; E
		dc.b $AA ; ª
		dc.b $46 ; F
		dc.b $A3 ; £
		dc.b $24 ; $
		dc.b $5A ; Z
		dc.b  $C
		dc.b $8D ; 
		dc.b $52 ; R
		dc.b $35 ; 5
		dc.b $6C ; l
		dc.b $49 ; I
		dc.b $2B ; +
		dc.b $D9 ; Ù
		dc.b $FA ; ú
		dc.b $18
		dc.b $5A ; Z
		dc.b $97 ; —
		dc.b $71 ; q
		dc.b $D2 ; Ò
		dc.b $EB ; ë
		dc.b $6F ; o
		dc.b $24 ; $
		dc.b $93 ; “
		dc.b $BF ; ¿
		dc.b $C5 ; Å
		dc.b $FF
		dc.b $22 ; "
		dc.b $49 ; I
		dc.b $3F ; ?
		dc.b $E1 ; á
		dc.b $8F ; 
		dc.b $F8 ; ø
		dc.b $D3 ; Ó
		dc.b $FC ; ü
		dc.b $4C ; L
		dc.b $49 ; I
		dc.b $27 ; '
		dc.b $8D ; 
		dc.b $AA ; ª
		dc.b $E3 ; ã
		dc.b $62 ; b
		dc.b $49 ; I
		dc.b $24 ; $
		dc.b $92 ; ’
		dc.b $BF ; ¿
		dc.b $A6 ; ¦
		dc.b $A4 ; ¤
		dc.b $B8 ; ¸
		dc.b $DA ; Ú
		dc.b $1C
		dc.b $EA ; ê
		dc.b $8B ; ‹
		dc.b $74 ; t
		dc.b $86 ; †
		dc.b $B5 ; µ
		dc.b $69 ; i
		dc.b $43 ; C
		dc.b $5B ; [
		dc.b $20
		dc.b $45 ; E
		dc.b $D6 ; Ö
		dc.b $D1 ; Ñ
		dc.b $68 ; h
		dc.b $EF ; ï
		dc.b $5A ; Z
		dc.b $7F ; 
		dc.b $ED ; í
		dc.b $C4 ; Ä
		dc.b $77 ; w
		dc.b $CB ; Ë
		dc.b $F0 ; ð
		dc.b $6F ; o
		dc.b $F2 ; ò
		dc.b $1F
		dc.b $FB ; û
		dc.b $71 ; q
		dc.b $1D
		dc.b $F2 ; ò
		dc.b $7F ; 
		dc.b $E8 ; è
		dc.b $7F ; 
		dc.b $8D ; 
		dc.b  $F
		dc.b $E1 ; á
		dc.b $FE ; þ
		dc.b $94 ; ”
		dc.b $EF ; ï
		dc.b $9C ; œ
		dc.b $13
		dc.b $FC ; ü
		dc.b $97 ; —
		dc.b $13
		dc.b $71 ; q
		dc.b $FD ; ý
		dc.b $AC ; ¬
		dc.b $10
		dc.b $22 ; "
		dc.b $DC ; Ü
		dc.b $BF ; ¿
		dc.b $A1 ; ¡
		dc.b $56 ; V
		dc.b $BA ; º
		dc.b $59 ; Y
		dc.b $D7 ; ×
		dc.b $A2 ; ¢
		dc.b $DF ; ß
		dc.b $D2 ; Ò
		dc.b $CA ; Ê
		dc.b $E9 ; é
		dc.b $5C ; \
		dc.b $49 ; I
		dc.b $26 ; &
		dc.b $EC ; ì
		dc.b $1A
		dc.b $57 ; W
		dc.b $55 ; U
		dc.b $6D ; m
		dc.b $CF ; Ï
		dc.b $68 ; h
		dc.b $EF ; ï
		dc.b  $F
		dc.b $E0 ; à
		dc.b $C3 ; Ã
		dc.b $FA ; ú
		dc.b $2B ; +
		dc.b $FE ; þ
		dc.b $11
		dc.b $FE ; þ
		dc.b $11
		dc.b $11
		dc.b $FC ; ü
		dc.b $11
		dc.b $78 ; x
		dc.b $41 ; A
		dc.b $9C ; œ
		dc.b $6F ; o
		dc.b $52 ; R
		dc.b $51 ; Q
		dc.b $95 ; •
		dc.b $DF ; ß
		dc.b $A6 ; ¦
		dc.b $FD ; ý
		dc.b $BD ; ½
		dc.b $7F ; 
		dc.b $A7 ; §
		dc.b $AF ; ¯
		dc.b $F4 ; ô
		dc.b $F0 ; ð
		dc.b $45 ; E
		dc.b $78 ; x
		dc.b $FD ; ý
		dc.b $3E ; >
		dc.b $71 ; q
		dc.b $FD ; ý
		dc.b $10
		dc.b $86 ; †
		dc.b $AF ; ¯
		dc.b $FB ; û
		dc.b $12
		dc.b $7F ; 
		dc.b $EF ; ï
		dc.b $BE ; ¾
		dc.b $4F ; O
		dc.b $FD ; ý
		dc.b $B0 ; °
		dc.b $4A ; J
		dc.b $F3 ; ó
		dc.b $D6 ; Ö
		dc.b $83 ; ƒ
		dc.b $FE ; þ
		dc.b $FB ; û
		dc.b $E4 ; ä
		dc.b $BE ; ¾
		dc.b $5F ; _
		dc.b $A7 ; §
		dc.b $B5 ; µ
		dc.b $F6 ; ö
		dc.b $E7 ; ç
		dc.b $5E ; ^
		dc.b $84 ; „
		dc.b $87 ; ‡
		dc.b $47 ; G
		dc.b $E8 ; è
		dc.b $56 ; V
		dc.b $F1 ; ñ
		dc.b $FA ; ú
		dc.b $7D ; }
		dc.b $4C ; L
		dc.b $BF ; ¿
		dc.b $B1 ; ±
		dc.b $1C
		dc.b $F5 ; õ
		dc.b $67 ; g
		dc.b $17
		dc.b $56 ; V
		dc.b $81 ; 
		dc.b $FF
		dc.b $A4 ; ¤
		dc.b $FD ; ý
		dc.b $15
		dc.b $E1 ; á
		dc.b   4
		dc.b $AE ; ®
		dc.b $87 ; ‡
		dc.b $EC ; ì
		dc.b $63 ; c
		dc.b $25 ; %
		dc.b $CF ; Ï
		dc.b   4
		dc.b $90 ; 
		dc.b $CF ; Ï
		dc.b  $C
		dc.b $50 ; P
		dc.b $67 ; g
		dc.b $5F ; _
		dc.b $D7 ; ×
		dc.b $AA ; ª
		dc.b $2F ; /
		dc.b $EB ; ë
		dc.b $F9 ; ù
		dc.b $D1 ; Ñ
		dc.b $7F ; 
		dc.b $5F ; _
		dc.b $7F ; 
		dc.b $E9 ; é
		dc.b $F4 ; ô
		dc.b $3F ; ?
		dc.b $41 ; A
		dc.b $2F ; /
		dc.b $C3 ; Ã
		dc.b $17
		dc.b $D7 ; ×
		dc.b $F9 ; ù
		dc.b $FE ; þ
		dc.b $BA ; º
		dc.b $63 ; c
		dc.b  $D
		dc.b   7
		dc.b $42 ; B
		dc.b $EC ; ì
		dc.b $E6 ; æ
		dc.b $CD ; Í
		dc.b $CD ; Í
		dc.b $99 ; ™
		dc.b $22 ; "
		dc.b $3F ; ?
		dc.b $C6 ; Æ
		dc.b $3F ; ?
		dc.b $C6 ; Æ
		dc.b $3F ; ?
		dc.b $C6 ; Æ
		dc.b $3F ; ?
		dc.b $C6 ; Æ
		dc.b $3F ; ?
		dc.b $C6 ; Æ
		dc.b $BF ; ¿
		dc.b $D3 ; Ó
		dc.b $87 ; ‡
		dc.b $F0 ; ð
		dc.b $C7 ; Ç
		dc.b $E8 ; è
		dc.b $B3 ; ³
		dc.b $4B ; K
		dc.b $37 ; 7
		dc.b $30 ; 0
		dc.b $CE ; Î
		dc.b $39 ; 9
		dc.b $63 ; c
		dc.b $52 ; R
		dc.b  $E
		dc.b $4E ; N
		dc.b $A9 ; ©
		dc.b   3
		dc.b $F9 ; ù
		dc.b $55 ; U
		dc.b $9C ; œ
		dc.b $A1 ; ¡
		dc.b $3F ; ?
		dc.b $EA ; ê
		dc.b $8E ; Ž
		dc.b $1A
		dc.b  $E
		dc.b $18
		dc.b $F2 ; ò
		dc.b $86 ; †
		dc.b $23 ; #
		dc.b $F3 ; ó
		dc.b $E3 ; ã
		dc.b $90 ; 
		dc.b $FE ; þ
		dc.b $7A ; z
		dc.b  $E
		dc.b $5F ; _
		dc.b $BF ; ¿
		dc.b $54 ; T
		dc.b $1C
		dc.b $86 ; †
		dc.b $2B ; +
		dc.b $C7 ; Ç
		dc.b $7F ; 
		dc.b $ED ; í
		dc.b $CB ; Ë
		dc.b $F0 ; ð
		dc.b $C5 ; Å
		dc.b $F5 ; õ
		dc.b $E2 ; â
		dc.b $1E
		dc.b $65 ; e
		dc.b $82 ; ‚
		dc.b $4B ; K
		dc.b   4
		dc.b $92 ; ’
		dc.b $FF
		dc.b $15
		dc.b $F9 ; ù
		dc.b $EA ; ê
		dc.b $DE ; Þ
		dc.b $AB ; «
		dc.b $C2 ; Â
		dc.b $99 ; ™
		dc.b $86 ; †
		dc.b $C2 ; Â
		dc.b $69 ; i
		dc.b $98 ; ˜
		dc.b $6C ; l
		dc.b $AB ; «
		dc.b $C3 ; Ã
		dc.b $8B ; ‹
		dc.b $8A ; Š
		dc.b $DB ; Û
		dc.b $FF
		dc.b $95 ; •
		dc.b $6D ; m
		dc.b $36 ; 6
		dc.b $1C
		dc.b $D8 ; Ø
		dc.b $66 ; f
		dc.b $B6 ; ¶
		dc.b $F5 ; õ
		dc.b $D8 ; Ø
		dc.b $2D ; -
		dc.b $5F ; _
		dc.b $E5 ; å
		dc.b $71 ; q
		dc.b $71 ; q
		dc.b $61 ; a
		dc.b $9A ; š
		dc.b $DC ; Ü
		dc.b $26 ; &
		dc.b $BB ; »
		dc.b $21 ; !
		dc.b $35 ; 5
		dc.b $D9 ; Ù
		dc.b  $B
		dc.b $4D ; M
		dc.b $79 ; y
		dc.b $B8 ; ¸
		dc.b $B8 ; ¸
		dc.b $BF ; ¿
		dc.b $75 ; u
		dc.b $56 ; V
		dc.b $C1 ; Á
		dc.b $6A ; j
		dc.b $E6 ; æ
		dc.b $23 ; #
		dc.b $66 ; f
		dc.b $56 ; V
		dc.b $D3 ; Ó
		dc.b $66 ; f
		dc.b $59 ; Y
		dc.b $97 ; —
		dc.b $62 ; b
		dc.b $EC ; ì
		dc.b $86 ; †
		dc.b $F5 ; õ
		dc.b $5B ; [
		dc.b $D5 ; Õ
		dc.b $7E ; ~
		dc.b $EA ; ê
		dc.b $19
		dc.b $86 ; †
		dc.b $C1 ; Á
		dc.b $6C ; l
		dc.b $32 ; 2
		dc.b $5C ; \
		dc.b $D3 ; Ó
		dc.b $86 ; †
		dc.b $4B ; K
		dc.b $9A ; š
		dc.b $74 ; t
		dc.b $D8 ; Ø
		dc.b $2D ; -
		dc.b $87 ; ‡
		dc.b $EE ; î
		dc.b $A1 ; ¡
		dc.b $98 ; ˜
		dc.b $97 ; —
		dc.b $C1 ; Á
		dc.b $F9 ; ù
		dc.b $97 ; —
		dc.b $27 ; '
		dc.b $87 ; ‡
		dc.b $E5 ; å
		dc.b $4C ; L
		dc.b $A5 ; ¥
		dc.b $95 ; •
		dc.b $59 ; Y
		dc.b $9D ; 
		dc.b $9A ; š
		dc.b $BC ; ¼
		dc.b $D5 ; Õ
		dc.b $66 ; f
		dc.b $86 ; †
		dc.b $CA ; Ê
		dc.b $B3 ; ³
		dc.b $F3 ; ó
		dc.b $DB ; Û
		dc.b   4
		dc.b $16
		dc.b $E7 ; ç
		dc.b $A2 ; ¢
		dc.b  $B
		dc.b $93 ; “
		dc.b   8
		dc.b $D4 ; Ô
		dc.b $81 ; 
		dc.b $F5 ; õ
		dc.b $A1 ; ¡
		dc.b $43 ; C
		dc.b $75 ; u
		dc.b $B7 ; ·
		dc.b $5B ; [
		dc.b $CF ; Ï
		dc.b $6C ; l
		dc.b $7F ; 
		dc.b $82 ; ‚
		dc.b $11
		dc.b $50 ; P
		dc.b $7E ; ~
		dc.b $C6 ; Æ
		dc.b $54 ; T
		dc.b $4A ; J
		dc.b $D8 ; Ø
		dc.b $30 ; 0
		dc.b $6B ; k
		dc.b $87 ; ‡
		dc.b $F4 ; ô
		dc.b $C5 ; Å
		dc.b $DF ; ß
		dc.b $D3 ; Ó
		dc.b $41 ; A
		dc.b $77 ; w
		dc.b $F0 ; ð
		dc.b $E3 ; ã
		dc.b $7C ; |
		dc.b $AE ; ®
		dc.b $95 ; •
		dc.b $D2 ; Ò
		dc.b $26 ; &
		dc.b $EC ; ì
		dc.b $1B
		dc.b   6
		dc.b $95 ; •
		dc.b $77 ; w
		dc.b $CA ; Ê
		dc.b $AD ; ­
		dc.b $EA ; ê
		dc.b $9F ; Ÿ
		dc.b $6C ; l
		dc.b $9B ; ›
		dc.b $F6 ; ö
		dc.b $A5 ; ¥
		dc.b $50 ; P
		dc.b $4A ; J
		dc.b $B4 ; ´
		dc.b $12
		dc.b $4A ; J
		dc.b $90 ; 
		dc.b $67 ; g
		dc.b $A9 ; ©
		dc.b $24 ; $
		dc.b $70 ; p
		dc.b $4F ; O
		dc.b $DB ; Û
		dc.b $DB ; Û
		dc.b $FA ; ú
		dc.b $26 ; &
		dc.b $83 ; ƒ
		dc.b $54 ; T
		dc.b $81 ; 
		dc.b $2E ; .
		dc.b $87 ; ‡
		dc.b $F0 ; ð
		dc.b $61 ; a
		dc.b $FC ; ü
		dc.b $18
		dc.b $20
		dc.b $40 ; @
		dc.b $96 ; –
		dc.b $98 ; ˜
		dc.b $3C ; <
		dc.b $3D ; =
		dc.b $6E ; n
		dc.b $12
		dc.b $49 ; I
		dc.b $24 ; $
		dc.b $AE ; ®
		dc.b $B5 ; µ
		dc.b $2A ; *
		dc.b $DE ; Þ
		dc.b $A6 ; ¦
		dc.b $67 ; g
		dc.b $E1 ; á
		dc.b $93 ; “
		dc.b $F0 ; ð
		dc.b $CA ; Ê
		dc.b $55 ; U
		dc.b $E6 ; æ
		dc.b $76 ; v
		dc.b $19
		dc.b $A9 ; ©
		dc.b $B1 ; ±
		dc.b $78 ; x
		dc.b $B8 ; ¸
		dc.b $83 ; ƒ
		dc.b $F3 ; ó
		dc.b $2F ; /
		dc.b $83 ; ƒ
		dc.b $F2 ; ò
		dc.b $AB ; «
		dc.b $36 ; 6
		dc.b $55 ; U
		dc.b $EC ; ì
		dc.b $AF ; ¯
		dc.b $36 ; 6
		dc.b $19
		dc.b $86 ; †
		dc.b $C5 ; Å
		dc.b $F0 ; ð
		dc.b $E2 ; â
		dc.b $E2 ; â
		dc.b $F0 ; ð
		dc.b $5C ; \
		dc.b $CF ; Ï
		dc.b $1E
		dc.b $10
		dc.b $C9 ; É
		dc.b $FB ; û
		dc.b $2A ; *
		dc.b $CB ; Ë
		dc.b $65 ; e
		dc.b $5F ; _
		dc.b $BA ; º
		dc.b $AB ; «
		dc.b $C1 ; Á
		dc.b $76 ; v
		dc.b  $E
		dc.b $2E ; .
		dc.b $25 ; %
		dc.b $7E ; ~
		dc.b $68 ; h
		dc.b $66 ; f
		dc.b  $F
		dc.b $CA ; Ê
		dc.b $19
		dc.b $84 ; „
		dc.b $B2 ; ²
		dc.b $AB ; «
		dc.b $27 ; '
		dc.b $66 ; f
		dc.b $AB ; «
		dc.b $2C ; ,
		dc.b $D5 ; Õ
		dc.b $66 ; f
		dc.b $86 ; †
		dc.b $C8 ; È
		dc.b $66 ; f
		dc.b $DE ; Þ
		dc.b $AB ; «
		dc.b $7A ; z
		dc.b $AD ; ­
		dc.b $8F ; 
		dc.b $87 ; ‡
		dc.b $EE ; î
		dc.b $B2 ; ²
		dc.b $B6 ; ¶
		dc.b $BC ; ¼
		dc.b $D3 ; Ó
		dc.b $AF ; ¯
		dc.b $34 ; 4
		dc.b $E9 ; é
		dc.b $B3 ; ³
		dc.b $2B ; +
		dc.b $69 ; i
		dc.b $B1 ; ±
		dc.b $F0 ; ð
		dc.b $D8 ; Ø
		dc.b $4F ; O
		dc.b $82 ; ‚
		dc.b $E6 ; æ
		dc.b $78 ; x
		dc.b $D8 ; Ø
		dc.b $2D ; -
		dc.b $19
		dc.b $B2 ; ²
		dc.b $7D ; }
		dc.b $79 ; y
		dc.b $B2 ; ²
		dc.b $D9 ; Ù
		dc.b $95 ; •
		dc.b $B4 ; ´
		dc.b $D9 ; Ù
		dc.b $96 ; –
		dc.b $6A ; j
		dc.b $F6 ; ö
		dc.b $43 ; C
		dc.b $31 ; 1
		dc.b $21 ; !
		dc.b $F9 ; ù
		dc.b $AA ; ª
		dc.b $7E ; ~
		dc.b $59 ; Y
		dc.b $AA ; ª
		dc.b $CB ; Ë
		dc.b $31 ; 1
		dc.b $35 ; 5
		dc.b $E6 ; æ
		dc.b $35 ; 5
		dc.b $A1 ; ¡
		dc.b $C1 ; Á
		dc.b   9
		dc.b $24 ; $
		dc.b $A4 ; ¤
		dc.b $92 ; ’
		dc.b $49 ; I
		dc.b $24 ; $
		dc.b $8F ; 
		dc.b $F5 ; õ
		dc.b $D7 ; ×
		dc.b $F4 ; ô
		dc.b $E1 ; á
		dc.b $F4 ; ô
		dc.b $79 ; y
		dc.b $35 ; 5
		dc.b $5C ; \
		dc.b $70 ; p
		dc.b $CF ; Ï
		dc.b $FD ; ý
		dc.b $29 ; )
		dc.b $57 ; W
		dc.b $7D ; }
		dc.b $5B ; [
		dc.b $D4 ; Ô
		dc.b $E8 ; è
		dc.b $87 ; ‡
		dc.b $44 ; D
		dc.b $3A ; :
		dc.b $21 ; !
		dc.b $D1 ; Ñ
		dc.b $55 ; U
		dc.b $F4 ; ô
		dc.b $60 ; `
		dc.b $D5 ; Õ
		dc.b $5F ; _
		dc.b $5B ; [
		dc.b $12
		dc.b $49 ; I
		dc.b $30 ; 0
		dc.b $60 ; `
		dc.b $D5 ; Õ
		dc.b $74 ; t
		dc.b $55 ; U
		dc.b $BD ; ½
		dc.b $5D ; ]
		dc.b $F8 ; ø
		dc.b $31 ; 1
		dc.b $25 ; %
		dc.b $BF ; ¿
		dc.b $A5 ; ¥
		dc.b $73 ; s
		dc.b $25 ; %
		dc.b $4F ; O
		dc.b $BD ; ½
		dc.b $2A ; *
		dc.b $DE ; Þ
		dc.b $48 ; H
		dc.b $27 ; '
		dc.b $42 ; B
		dc.b $43 ; C
		dc.b $F8 ; ø
		dc.b $69 ; i
		dc.b  $F
		dc.b $E1 ; á
		dc.b $A4 ; ¤
		dc.b $3A ; :
		dc.b $17
		dc.b $78 ; x
		dc.b $31 ; 1
		dc.b $3F ; ?
		dc.b $AB ; «
		dc.b $A7 ; §
		dc.b $21 ; !
		dc.b $F9 ; ù
		dc.b $BA ; º
		dc.b $BF ; ¿
		dc.b $56 ; V
		dc.b $4D ; M
		dc.b $5F ; _
		dc.b $AB ; «
		dc.b $A7 ; §
		dc.b $E6 ; æ
		dc.b $CA ; Ê
		dc.b $FF
		dc.b $2E ; .
		dc.b $1F
		dc.b $CB ; Ë
		dc.b $5F ; _
		dc.b $ED ; í
		dc.b $C3 ; Ã
		dc.b $F9 ; ù
		dc.b $10
		dc.b $FD ; ý
		dc.b $C3 ; Ã
		dc.b $43 ; C
		dc.b $F5 ; õ
		dc.b $63 ; c
		dc.b $92 ; ’
		dc.b $55 ; U
		dc.b $F9 ; ù
		dc.b $B4 ; ´
		dc.b $1C
		dc.b $8F ; 
		dc.b $FE ; þ
		dc.b $C7 ; Ç
		dc.b $FE ; þ
		dc.b $FF
		dc.b $D7 ; ×
		dc.b  $F
		dc.b $E4 ; ä
		dc.b $43 ; C
		dc.b $F7 ; ÷
		dc.b  $C
		dc.b $3F ; ?
		dc.b $B6 ; ¶
		dc.b $4D ; M
		dc.b $3F ; ?
		dc.b $96 ; –
		dc.b $BC ; ¼
		dc.b $87 ; ‡
		dc.b $EE ; î
		dc.b $E1 ; á
		dc.b $FC ; ü
		dc.b $BA ; º
		dc.b $B9 ; ¹
		dc.b $75 ; u
		dc.b $D7 ; ×
		dc.b $D7 ; ×
		dc.b $5F ; _
		dc.b $E6 ; æ
		dc.b $D7 ; ×
		dc.b $90 ; 
		dc.b $E4 ; ä
		dc.b $61 ; a
		dc.b $FA ; ú
		dc.b $BA ; º
		dc.b $BF ; ¿
		dc.b $57 ; W
		dc.b $47 ; G
		dc.b $FE ; þ
		dc.b $AE ; ®
		dc.b $8E ; Ž
		dc.b $EE ; î
		dc.b $82 ; ‚
		dc.b  $E
		dc.b $E4 ; ä
		dc.b $59 ; Y
		dc.b $3B ; ;
		dc.b $F3 ; ó
		dc.b $70 ; p
		dc.b $47 ; G
		dc.b $3D ; =
		dc.b $79 ; y
		dc.b $27 ; '
		dc.b $2C ; ,
		dc.b $C3 ; Ã
		dc.b $95 ; •
		dc.b $3F ; ?
		dc.b $36 ; 6
		dc.b $3F ; ?
		dc.b $97 ; —
		dc.b $57 ; W
		dc.b $E6 ; æ
		dc.b $C3 ; Ã
		dc.b $E1 ; á
		dc.b $CB ; Ë
		dc.b $5F ; _
		dc.b $27 ; '
		dc.b  $E
		dc.b $4B ; K
		dc.b $62 ; b
		dc.b $A5 ; ¥
		dc.b $48 ; H
		dc.b $E9 ; é
		dc.b $2B ; +
		dc.b $DD ; Ý
		dc.b $B1 ; ±
		dc.b $EE ; î
		dc.b $57 ; W
		dc.b $3F ; ?
		dc.b $37 ; 7
		dc.b $21 ; !
		dc.b $F9 ; ù
		dc.b $B1 ; ±
		dc.b $C9 ; É
		dc.b $79 ; y
		dc.b  $E
		dc.b $55 ; U
		dc.b $7E ; ~
		dc.b $AE ; ®
		dc.b $BE ; ¾
		dc.b $55 ; U
		dc.b $72 ; r
		dc.b $87 ; ‡
		dc.b $22 ; "
		dc.b $4D ; M
		dc.b $7F ; 
		dc.b $AB ; «
		dc.b $AB ; «
		dc.b $BA ; º
		dc.b $9C ; œ
		dc.b $BB ; »
		dc.b $A9 ; ©
		dc.b $FB ; û
		dc.b $BA ; º
		dc.b $7E ; ~
		dc.b $EE ; î
		dc.b $9F ; Ÿ
		dc.b $B8 ; ¸
		dc.b $A7 ; §
		dc.b $41 ; A
		dc.b $FD ; ý
		dc.b $58 ; X
		dc.b $E4 ; ä
		dc.b $83 ; ƒ
		dc.b $96 ; –
		dc.b $8C ; Œ
		dc.b $34 ; 4
		dc.b $61 ; a
		dc.b $FB ; û
		dc.b $BA ; º
		dc.b $7E ; ~
		dc.b $AC ; ¬
		dc.b $72 ; r
		dc.b $41 ; A
		dc.b $CB ; Ë
		dc.b $F7 ; ÷
		dc.b  $D
		dc.b  $F
		dc.b $E1 ; á
		dc.b $9A ; š
		dc.b $7F ; 
		dc.b $6E ; n
		dc.b $9F ; Ÿ
		dc.b $B8 ; ¸
		dc.b $A7 ; §
		dc.b $EE ; î
		dc.b $3F ; ?
		dc.b $F7 ; ÷
		dc.b $C8 ; È
		dc.b $7F ; 
		dc.b $EF ; ï
		dc.b $FD ; ý
		dc.b   3
		dc.b $FC ; ü
		dc.b $65 ; e
		dc.b $79 ; y
		dc.b  $E
		dc.b $43 ; C
		dc.b $F3 ; ó
		dc.b $75 ; u
		dc.b $F2 ; ò
		dc.b $AF ; ¯
		dc.b $F3 ; ó
		dc.b $74 ; t
		dc.b $FE ; þ
		dc.b $5A ; Z
		dc.b $F2 ; ò
		dc.b $1F
		dc.b $BB ; »
		dc.b $87 ; ‡
		dc.b $F2 ; ò
		dc.b $21 ; !
		dc.b $FC ; ü
		dc.b $33 ; 3
		dc.b $C8 ; È
		dc.b $72 ; r
		dc.b $FD ; ý
		dc.b  $F
		dc.b $2A ; *
		dc.b $E4 ; ä
		dc.b $EA ; ê
		dc.b $DD ; Ý
		dc.b $AF ; ¯
		dc.b $95 ; •
		dc.b $6E ; n
		dc.b $FC ; ü
		dc.b $DA ; Ú
		dc.b $C9 ; É
		dc.b $CB ; Ë
		dc.b $D7 ; ×
		dc.b $CA ; Ê
		dc.b $3D ; =
		dc.b $83 ; ƒ
		dc.b $45 ; E
		dc.b $E3 ; ã
		dc.b $78 ; x
		dc.b $31 ; 1
		dc.b $E4 ; ä
		dc.b $83 ; ƒ
		dc.b $90 ; 
		dc.b $E4 ; ä
		dc.b $95 ; •
		dc.b $BA ; º
		dc.b $41 ; A
		dc.b $C3 ; Ã
		dc.b $90 ; 
		dc.b $E4 ; ä
		dc.b $F7 ; ÷
		dc.b   9
		dc.b $27 ; '
		dc.b $EA ; ê
		dc.b $D7 ; ×
		dc.b $3F ; ?
		dc.b $F2 ; ò
		dc.b $E1 ; á
		dc.b $FD ; ý
		dc.b $84 ; „
		dc.b $1F
		dc.b $D3 ; Ó
		dc.b $23 ; #
		dc.b $FC ; ü
		dc.b $57 ; W
		dc.b $51 ; Q
		dc.b $FA ; ú
		dc.b $91 ; ‘
		dc.b $5F ; _
		dc.b $A2 ; ¢
		dc.b  $C
		dc.b $1F
		dc.b $88 ; ˆ
		dc.b $C5 ; Å
		dc.b   3
		dc.b $3D ; =
		dc.b $A7 ; §
		dc.b $88 ; ˆ
		dc.b $C5 ; Å
		dc.b   6
		dc.b $70 ; p
		dc.b $98 ; ˜
		dc.b $8C ; Œ
		dc.b $51 ; Q
		dc.b $83 ; ƒ
		dc.b   4
		dc.b $C4 ; Ä
		dc.b $62 ; b
		dc.b $10
		dc.b $5E ; ^
		dc.b $98 ; ˜
		dc.b $86 ; †
		dc.b $CB ; Ë
		dc.b $76 ; v
		dc.b $33 ; 3
		dc.b $41 ; A
		dc.b $FE ; þ
		dc.b $FE ; þ
		dc.b $28 ; (
		dc.b $7F ; 
		dc.b   5
		dc.b $52 ; R
		dc.b $8F ; 
		dc.b $6A ; j
		dc.b $6B ; k
		dc.b   8
		dc.b $C8 ; È
		dc.b $35 ; 5
		dc.b $F3 ; ó
		dc.b $E2 ; â
		dc.b $8C ; Œ
		dc.b $97 ; —
		dc.b $71 ; q
		dc.b $DA ; Ú
		dc.b $93 ; “
		dc.b $C5 ; Å
		dc.b $DF ; ß
		dc.b $9F ; Ÿ
		dc.b $CB ; Ë
		dc.b $97 ; —
		dc.b $FF
		dc.b $F8 ; ø
		dc.b $B7 ; ·
		dc.b $FF
		dc.b $EE ; î
		dc.b $FF
		dc.b $D2 ; Ò
		dc.b $EA ; ê
		dc.b $D6 ; Ö
		dc.b $9F ; Ÿ
		dc.b $A4 ; ¤
		dc.b $D7 ; ×
		dc.b $A9 ; ©
		dc.b $F8 ; ø
		dc.b $7F ; 
		dc.b $EF ; ï
		dc.b $FF
		dc.b $FC ; ü
		dc.b $5B ; [
		dc.b $FF
		dc.b $F7 ; ÷
		dc.b $AB ; «
		dc.b $7C ; |
		dc.b $C3 ; Ã
		dc.b $FF
		dc.b $7F ; 
		dc.b $FF
		dc.b $E2 ; â
		dc.b $DF ; ß
		dc.b $FF
		dc.b $BE ; ¾
		dc.b $F9 ; ù
		dc.b $2F ; /
		dc.b $FD ; ý
		dc.b $36 ; 6
		dc.b $BB ; »
		dc.b $6E ; n
		dc.b  $F
		dc.b $5C ; \
		dc.b $EC ; ì
		dc.b $8B ; ‹
		dc.b $FB ; û
		dc.b $74 ; t
		dc.b $60 ; `
		dc.b $94 ; ”
		dc.b $7A ; z
		dc.b $2F ; /
		dc.b $E8 ; è
		dc.b $55 ; U
		dc.b $F5 ; õ
		dc.b $67 ; g
		dc.b $28 ; (
		dc.b $37 ; 7
		dc.b $A9 ; ©
		dc.b $1F
		dc.b $CC ; Ì
		dc.b $BE ; ¾
		dc.b $50 ; P
		dc.b $4F ; O
		dc.b $CF ; Ï
		dc.b $C6 ; Æ
		dc.b $55 ; U
		dc.b $5B ; [
		dc.b $2A ; *
		dc.b $5D ; ]
		dc.b $14
		dc.b $AA ; ª
		dc.b $4F ; O
		dc.b $35 ; 5
		dc.b $A1 ; ¡
		dc.b $C2 ; Â
		dc.b $44 ; D
		dc.b $D6 ; Ö
		dc.b $95 ; •
		dc.b $A4 ; ¤
		dc.b $6A ; j
		dc.b $48 ; H
		dc.b $DC ; Ü
		dc.b $6A ; j
		dc.b $8D ; 
		dc.b $D2 ; Ò
		dc.b $2A ; *
		dc.b $97 ; —
		dc.b $8B ; ‹
		dc.b $99 ; ™
		dc.b $19
		dc.b $FF
		dc.b $C5 ; Å
		dc.b $8D ; 
		dc.b $DF ; ß
		dc.b $DD ; Ý
		dc.b $BB ; »
		dc.b $2B ; +
		dc.b $31 ; 1
		dc.b $EE ; î
		dc.b $C9 ; É
		dc.b $C1 ; Á
		dc.b $A9 ; ©
		dc.b $8D ; 
		dc.b $E1 ; á
		dc.b   4
		dc.b $9F ; Ÿ
		dc.b $FB ; û
		dc.b $18
		dc.b $27 ; '
		dc.b $F3 ; ó
		dc.b $86 ; †
		dc.b $AF ; ¯
		dc.b $E4 ; ä
		dc.b $43 ; C
		dc.b $4F ; O
		dc.b $56 ; V
		dc.b $89 ; ‰
		dc.b $E8 ; è
		dc.b $B3 ; ³
		dc.b $44 ; D
		dc.b $F4 ; ô
		dc.b $19
		dc.b $1C
		dc.b $25 ; %
		dc.b $31 ; 1
		dc.b $D8 ; Ø
		dc.b $26 ; &
		dc.b $BA ; º
		dc.b $29 ; )
		dc.b $A0 ;  
		dc.b $69 ; i
		dc.b $EA ; ê
		dc.b $B3 ; ³
		dc.b $44 ; D
		dc.b $FF
		dc.b $70 ; p
		dc.b $6A ; j
		dc.b $7C ; |
		dc.b $9F ; Ÿ
		dc.b $52 ; R
		dc.b   4
		dc.b $84 ; „
		dc.b $C6 ; Æ
		dc.b $A9 ; ©
		dc.b $F6 ; ö
		dc.b  $D
		dc.b $10
		dc.b $D1 ; Ñ
		dc.b $A7 ; §
		dc.b $AB ; «
		dc.b $1F
		dc.b $DC ; Ü
		dc.b $3B ; ;
		dc.b $43 ; C
		dc.b $8A ; Š
		dc.b   9
		dc.b $3E ; >
		dc.b $4C ; L
		dc.b $1A
		dc.b   8
		dc.b $10
		dc.b $24 ; $
		dc.b $C6 ; Æ
		dc.b $AD ; ­
		dc.b $A2 ; ¢
		dc.b $7A ; z
		dc.b $21 ; !
		dc.b $D6 ; Ö
		dc.b $34 ; 4
		dc.b $69 ; i
		dc.b $EA ; ê
		dc.b $C5 ; Å
		dc.b $D8 ; Ø
		dc.b $FE ; þ
		dc.b $E1 ; á
		dc.b $C1 ; Á
		dc.b $AA ; ª
		dc.b $64 ; d
		dc.b   8
		dc.b $24 ; $
		dc.b $F9 ; ù
		dc.b $2A ; *
		dc.b $41 ; A
		dc.b   2
		dc.b $7E ; ~
		dc.b $B8 ; ¸
		dc.b $6A ; j
		dc.b $DB ; Û
		dc.b $DC ; Ü
		dc.b $22 ; "
		dc.b $DF ; ß
		dc.b $9B ; ›
		dc.b $FD ; ý
		dc.b $AB ; «
		dc.b $D9 ; Ù
		dc.b   7
		dc.b $F3 ; ó
		dc.b $6E ; n
		dc.b $8A ; Š
		dc.b $62 ; b
		dc.b $EC ; ì
		dc.b $6C ; l
		dc.b $CA ; Ê
		dc.b $E8 ; è
		dc.b $86 ; †
		dc.b  $C
		dc.b $1D
		dc.b $95 ; •
		dc.b $C8 ; È
		dc.b $10
		dc.b $5F ; _
		dc.b $8A ; Š
		dc.b $A0 ;  
		dc.b $FD ; ý
		dc.b $8C ; Œ
		dc.b $BF ; ¿
		dc.b $DC ; Ü
		dc.b $3F ; ?
		dc.b $D6 ; Ö
		dc.b $4E ; N
		dc.b $7A ; z
		dc.b $93 ; “
		dc.b $8D ; 
		dc.b $20
		dc.b $91 ; ‘
		dc.b $B8 ; ¸
		dc.b $DD ; Ý
		dc.b $18
		dc.b $46 ; F
		dc.b $E9 ; é
		dc.b $19
		dc.b $32 ; 2
		dc.b $5E ; ^
		dc.b $2E ; .
		dc.b $64 ; d
		dc.b $67 ; g
		dc.b $FF
		dc.b $16
		dc.b $37 ; 7
		dc.b $7F ; 
		dc.b $76 ; v
		dc.b $EC ; ì
		dc.b $9D ; 
		dc.b $D7 ; ×
		dc.b $8B ; ‹
		dc.b $B1 ; ±
		dc.b $C9 ; É
		dc.b $D6 ; Ö
		dc.b $AB ; «
		dc.b $D8 ; Ø
		dc.b $62 ; b
		dc.b $C2 ; Â
		dc.b $4F ; O
		dc.b $5F ; _
		dc.b $D0 ; Ð
		dc.b $AA ; ª
		dc.b   4
		dc.b $1B
		dc.b $46 ; F
		dc.b $A1 ; ¡
		dc.b $39 ; 9
		dc.b $75 ; u
		dc.b $D3 ; Ó
		dc.b $40 ; @
		dc.b $D3 ; Ó
		dc.b $D4 ; Ô
		dc.b $EC ; ì
		dc.b $7B ; {
		dc.b $B1 ; ±
		dc.b $B1 ; ±
		dc.b $A8 ; ¨
		dc.b $FB ; û
		dc.b $C2 ; Â
		dc.b   9
		dc.b $3E ; >
		dc.b   9
		dc.b   4
		dc.b $19
		dc.b $E5 ; å
		dc.b $31 ; 1
		dc.b $A8 ; ¨
		dc.b $6D ; m
		dc.b $1A
		dc.b $29 ; )
		dc.b $D7 ; ×
		dc.b $A7 ; §
		dc.b $AB ; «
		dc.b $B9 ; ¹
		dc.b $D8 ; Ø
		dc.b $F7 ; ÷
		dc.b $42 ; B
		dc.b $DA ; Ú
		dc.b $9F ; Ÿ
		dc.b $20
		dc.b $82 ; ‚
		dc.b $4F ; O
		dc.b   9
		dc.b $52 ; R
		dc.b  $D
		dc.b $42 ; B
		dc.b $63 ; c
		dc.b $55 ; U
		dc.b $34 ; 4
		dc.b $43 ; C
		dc.b $4F ; O
		dc.b $56 ; V
		dc.b $87 ; ‡
		dc.b $77 ; w
		dc.b $3B ; ;
		dc.b $1D
		dc.b   1
		dc.b $A1 ; ¡
		dc.b $6A ; j
		dc.b $C9 ; É
		dc.b $5F ; _
		dc.b $20
		dc.b $8A ; Š
		dc.b $81 ; 
		dc.b $29 ; )
		dc.b $B4 ; ´
		dc.b $6A ; j
		dc.b $13
		dc.b $1D
		dc.b $74 ; t
		dc.b $D0 ; Ð
		dc.b $34 ; 4
		dc.b $F5 ; õ
		dc.b $77 ; w
		dc.b $3B ; ;
		dc.b $1E
		dc.b $B7 ; ·
		dc.b $41 ; A
		dc.b $9E ; ž
		dc.b $B6 ; ¶
		dc.b $C9 ; É
		dc.b $F2 ; ò
		dc.b $57 ; W
		dc.b $C9 ; É
		dc.b $50 ; P
		dc.b $20
		dc.b $45 ; E
		dc.b $D5 ; Õ
		dc.b $B4 ; ´
		dc.b $6A ; j
		dc.b $87 ; ‡
		dc.b $5C ; \
		dc.b $77 ; w
		dc.b $BF ; ¿
		dc.b $6A ; j
		dc.b $F6 ; ö
		dc.b $41 ; A
		dc.b $FC ; ü
		dc.b $DB ; Û
		dc.b $A2 ; ¢
		dc.b $9F ; Ÿ
		dc.b $C8 ; È
		dc.b $CA ; Ê
		dc.b $E8 ; è
		dc.b $BE ; ¾
		dc.b $16
		dc.b $BB ; »
		dc.b $2B ; +
		dc.b $92 ; ’
		dc.b $41 ; A
		dc.b $F7 ; ÷
		dc.b $E3 ; ã
		dc.b $5E ; ^
		dc.b $79 ; y
		dc.b $6D ; m
		dc.b $1F
		dc.b $9F ; Ÿ
		dc.b $DA ; Ú
		dc.b $3F ; ?
		dc.b $37 ; 7
		dc.b $1F
		dc.b $DC ; Ü
		dc.b $32 ; 2
		dc.b $33 ; 3
		dc.b $FF
		dc.b $8B ; ‹
		dc.b $1B
		dc.b $BF ; ¿
		dc.b $BB ; »
		dc.b $76 ; v
		dc.b $5D ; ]
		dc.b $CE ; Î
		dc.b $C7 ; Ç
		dc.b $46 ; F
		dc.b $4E ; N
		dc.b $85 ; …
		dc.b $AB ; «
		dc.b $8B ; ‹
		dc.b   7
		dc.b $C8 ; È
		dc.b $20
		dc.b $CE ; Î
		dc.b $12
		dc.b $9B ; ›
		dc.b $46 ; F
		dc.b $A1 ; ¡
		dc.b $31 ; 1
		dc.b $D7 ; ×
		dc.b $4D ; M
		dc.b   3
		dc.b $4F ; O
		dc.b $56 ; V
		dc.b $2E ; .
		dc.b $C5 ; Å
		dc.b $DD ; Ý
		dc.b $78 ; x
		dc.b $B8 ; ¸
		dc.b $30 ; 0
		dc.b $B5 ; µ
		dc.b $5E ; ^
		dc.b $C8 ; È
		dc.b $10
		dc.b $49 ; I
		dc.b $F0 ; ð
		dc.b $48 ; H
		dc.b $20
		dc.b $4F ; O
		dc.b $D7 ; ×
		dc.b  $D
		dc.b $42 ; B
		dc.b $7D ; }
		dc.b $D4 ; Ô
		dc.b $D1 ; Ñ
		dc.b $A7 ; §
		dc.b $AB ; «
		dc.b $43 ; C
		dc.b $B1 ; ±
		dc.b $76 ; v
		dc.b $87 ; ‡
		dc.b $63 ; c
		dc.b $A1 ; ¡
		dc.b $59 ; Y
		dc.b $5A ; Z
		dc.b $1F
		dc.b $A4 ; ¤
		dc.b $54 ; T
		dc.b $12
		dc.b $84 ; „
		dc.b $91 ; ‘
		dc.b $67 ; g
		dc.b $A0 ;  
		dc.b $68 ; h
		dc.b $FD ; ý
		dc.b $70 ; p
		dc.b $EB ; ë
		dc.b $1F
		dc.b $B8 ; ¸
		dc.b $1A
		dc.b $7A ; z
		dc.b $BA ; º
		dc.b $F1 ; ñ
		dc.b $77 ; w
		dc.b $73 ; s
		dc.b $95 ; •
		dc.b $ED ; í
		dc.b  $B
		dc.b $64 ; d
		dc.b $F8 ; ø
		dc.b $3E ; >
		dc.b $4A ; J
		dc.b $81 ; 
		dc.b   2
		dc.b $2E ; .
		dc.b $A1 ; ¡
		dc.b $31 ; 1
		dc.b $AA ; ª
		dc.b $9A ; š
		dc.b $29 ; )
		dc.b $A7 ; §
		dc.b $AB ; «
		dc.b $17
		dc.b $75 ; u
		dc.b $E2 ; â
		dc.b $EC ; ì
		dc.b $74 ; t
		dc.b  $B
		dc.b $55 ; U
		dc.b $EC ; ì
		dc.b $F0 ; ð
		dc.b $82 ; ‚
		dc.b $4F ; O
		dc.b $83 ; ƒ
		dc.b $E0 ; à
		dc.b $81 ; 
		dc.b   2
		dc.b $4C ; L
		dc.b $6D ; m
		dc.b $13
		dc.b $13
		dc.b $D0 ; Ð
		dc.b $3A ; :
		dc.b $E3 ; ã
		dc.b $C9 ; É
		dc.b $B9 ; ¹
		dc.b $7E ; ~
		dc.b $D5 ; Õ
		dc.b $EC ; ì
		dc.b $83 ; ƒ
		dc.b $F9 ; ù
		dc.b $B7 ; ·
		dc.b $45 ; E
		dc.b $34 ; 4
		dc.b $70 ; p
		dc.b $CA ; Ê
		dc.b $E8 ; è
		dc.b $8B ; ‹
		dc.b $6F ; o
		dc.b  $E
		dc.b $CA ; Ê
		dc.b $E9 ; é
		dc.b $3D ; =
		dc.b $6F ; o
		dc.b $C5 ; Å
		dc.b $7F ; 
		dc.b $A3 ; £
		dc.b $FA ; ú
		dc.b $6F ; o
		dc.b $E7 ; ç
		dc.b  $B
		dc.b $FF
		dc.b $96 ; –
		dc.b $48 ; H
		dc.b $4C ; L
		dc.b $22 ; "
		dc.b $86 ; †
		dc.b $BB ; »
		dc.b $A2 ; ¢
		dc.b $6B ; k
		dc.b $41 ; A
		dc.b $D0 ; Ð
		dc.b $58 ; X
		dc.b $B1 ; ±
		dc.b $24 ; $
		dc.b $94 ; ”
		dc.b $FF
		dc.b $19
		dc.b $25 ; %
		dc.b $E4 ; ä
		dc.b $9C ; œ
		dc.b $12
		dc.b $8D ; 
		dc.b $23 ; #
		dc.b $5F ; _
		dc.b $3C ; <
		dc.b $8D ; 
		dc.b $52 ; R
		dc.b $E7 ; ç
		dc.b $AE ; ®
		dc.b $57 ; W
		dc.b $61 ; a
		dc.b $23 ; #
		dc.b $FD ; ý
		dc.b $5B ; [
		dc.b $FF
		dc.b $A3 ; £
		dc.b $AF ; ¯
		dc.b $37 ; 7
		dc.b $F8 ; ø
		dc.b $EA ; ê
		dc.b $FD ; ý
		dc.b $26 ; &
		dc.b $8E ; Ž
		dc.b $6D ; m
		dc.b $E8 ; è
		dc.b $5D ; ]
		dc.b $A3 ; £
		dc.b $C3 ; Ã
		dc.b $F5 ; õ
		dc.b $BC ; ¼
		dc.b $FF
		dc.b $D8 ; Ø
		dc.b $97 ; —
		dc.b $F9 ; ù
		dc.b $6F ; o
		dc.b $A4 ; ¤
		dc.b $A9 ; ©
		dc.b $D8 ; Ø
		dc.b $49 ; I
		dc.b $57 ; W
		dc.b $E5 ; å
		dc.b $CB ; Ë
		dc.b $2F ; /
		dc.b $CC ; Ì
		dc.b $E5 ; å
		dc.b $CB ; Ë
		dc.b $37 ; 7
		dc.b $4E ; N
		dc.b $9E ; ž
		dc.b $C1 ; Á
		dc.b $28 ; (
		dc.b $4A ; J
		dc.b $AD ; ­
		dc.b $69 ; i
		dc.b $56 ; V
		dc.b $F7 ; ÷
		dc.b $61 ; a
		dc.b $7A ; z
		dc.b  $D
		dc.b $EF ; ï
		dc.b $CE ; Î
		dc.b $EC ; ì
		dc.b $CB ; Ë
		dc.b $C3 ; Ã
		dc.b $A7 ; §
		dc.b $4C ; L
		dc.b $A1 ; ¡
		dc.b $A8 ; ¨
		dc.b $49 ; I
		dc.b   6
		dc.b $BC ; ¼
		dc.b $E1 ; á
		dc.b $18
		dc.b $74 ; t
		dc.b   6
		dc.b $C2 ; Â
		dc.b $D6 ; Ö
		dc.b $1D
		dc.b  $B
		dc.b $9B ; ›
		dc.b $2F ; /
		dc.b $DD ; Ý
		dc.b $7E ; ~
		dc.b $77 ; w
		dc.b $A7 ; §
		dc.b $4F ; O
		dc.b $E9 ; é
		dc.b $A1 ; ¡
		dc.b $AB ; «
		dc.b $F4 ; ô
		dc.b $23 ; #
		dc.b $5E ; ^
		dc.b $7D ; }
		dc.b $E1 ; á
		dc.b $D1 ; Ñ
		dc.b $D8 ; Ø
		dc.b $BF ; ¿
		dc.b $A4 ; ¤
		dc.b $83 ; ƒ
		dc.b $51 ; Q
		dc.b $BF ; ¿
		dc.b $3B ; ;
		dc.b $9B ; ›
		dc.b $F7 ; ÷
		dc.b $B9 ; ¹
		dc.b $BA ; º
		dc.b $74 ; t
		dc.b $FF
		dc.b $99 ; ™
		dc.b $BF ; ¿
		dc.b $C2 ; Â
		dc.b $3F ; ?
		dc.b $A7 ; §
		dc.b $9A ; š
		dc.b $47 ; G
		dc.b $F8 ; ø
		dc.b $7C ; |
		dc.b $DA ; Ú
		dc.b $2E ; .
		dc.b $FE ; þ
		dc.b $56 ; V
		dc.b $8E ; Ž
		dc.b $7F ; 
		dc.b $E4 ; ä
		dc.b $73 ; s
		dc.b $CB ; Ë
		dc.b $FA ; ú
		dc.b $B2 ; ²
		dc.b $17
		dc.b  $D
		dc.b $EB ; ë
		dc.b $A4 ; ¤
		dc.b $47 ; G
		dc.b $3C ; <
		dc.b $39 ; 9
		dc.b $E4 ; ä
		dc.b $6E ; n
		dc.b $94 ; ”
		dc.b $25 ; %
		dc.b $CF ; Ï
		dc.b $2A ; *
		dc.b $A5 ; ¥
		dc.b $76 ; v
		dc.b $12
		dc.b $3C ; <
		dc.b $FD ; ý
		dc.b $17
		dc.b $36 ; 6
		dc.b $71 ; q
		dc.b $AC ; ¬
		dc.b $23 ; #
		dc.b $F3 ; ó
		dc.b $30 ; 0
		dc.b $BC ; ¼
		dc.b $5E ; ^
		dc.b $74 ; t
		dc.b $73 ; s
		dc.b  $B
		dc.b $C5 ; Å
		dc.b $F7 ; ÷
		dc.b $68 ; h
		dc.b $CB ; Ë
		dc.b $66 ; f
		dc.b $5B ; [
		dc.b $39 ; 9
		dc.b $FF
		dc.b $B1 ; ±
		dc.b $2F ; /
		dc.b $F2 ; ò
		dc.b $DF ; ß
		dc.b $4D ; M
		dc.b $4F ; O
		dc.b $41 ; A
		dc.b $AC ; ¬
		dc.b $67 ; g
		dc.b $BC ; ¼
		dc.b $5E ; ^
		dc.b $2F ; /
		dc.b $87 ; ‡
		dc.b $64 ; d
		dc.b $2F ; /
		dc.b $83 ; ƒ
		dc.b $EF ; ï
		dc.b $D9 ; Ù
		dc.b $FA ; ú
		dc.b $DF ; ß
		dc.b  $E
		dc.b $9D ; 
		dc.b $30 ; 0
		dc.b $D5 ; Õ
		dc.b $47 ; G
		dc.b $8C ; Œ
		dc.b $E3 ; ã
		dc.b $58 ; X
		dc.b $61 ; a
		dc.b $78 ; x
		dc.b $BD ; ½
		dc.b $7B ; {
		dc.b $17
		dc.b $B0 ; °
		dc.b $5E ; ^
		dc.b $1A
		dc.b $19
		dc.b $6C ; l
		dc.b $CB ; Ë
		dc.b $37 ; 7
		dc.b $EB ; ë
		dc.b $7A ; z
		dc.b $74 ; t
		dc.b $EA ; ê
		dc.b $86 ; †
		dc.b $A1 ; ¡
		dc.b $9C ; œ
		dc.b $6B ; k
		dc.b $CE ; Î
		dc.b $2F ; /
		dc.b $1D
		dc.b   2
		dc.b $D2 ; Ò
		dc.b $C3 ; Ã
		dc.b $A0 ;  
		dc.b $65 ; e
		dc.b $9B ; ›
		dc.b $2F ; /
		dc.b $DD ; Ý
		dc.b $65 ; e
		dc.b $D3 ; Ó
		dc.b $A5 ; ¥
		dc.b $75 ; u
		dc.b $53 ; S
		dc.b $5E ; ^
		dc.b $71 ; q
		dc.b $AC ; ¬
		dc.b $74 ; t
		dc.b  $B
		dc.b $C7 ; Ç
		dc.b $E9 ; é
		dc.b  $B
		dc.b  $B
		dc.b $C7 ; Ç
		dc.b $EB ; ë
		dc.b $73 ; s
		dc.b $65 ; e
		dc.b $B3 ; ³
		dc.b $2E ; .
		dc.b $9D ; 
		dc.b $3A ; :
		dc.b $87 ; ‡
		dc.b $ED ; í
		dc.b $9B ; ›
		dc.b $38 ; 8
		dc.b $FD ; ý
		dc.b $88 ; ˆ
		dc.b $BC ; ¼
		dc.b $6F ; o
		dc.b $66 ; f
		dc.b $91 ; ‘
		dc.b $BC ; ¼
		dc.b $5F ; _
		dc.b $CD ; Í
		dc.b $A2 ; ¢
		dc.b $ED ; í
		dc.b $99 ; ™
		dc.b $6C ; l
		dc.b $D1 ; Ñ
		dc.b $CF ; Ï
		dc.b $FC ; ü
		dc.b $8E ; Ž
		dc.b $79 ; y
		dc.b $7F ; 
		dc.b $56 ; V
		dc.b $43 ; C
		dc.b $54 ; T
		dc.b $1A
		dc.b $E6 ; æ
		dc.b $CE ; Î
		dc.b $35 ; 5
		dc.b $E7 ; ç
		dc.b $19
		dc.b $98 ; ˜
		dc.b $74 ; t
		dc.b $11
		dc.b $A3 ; £
		dc.b $98 ; ˜
		dc.b $74 ; t
		dc.b  $B
		dc.b $B4 ; ´
		dc.b $65 ; e
		dc.b $FB ; û
		dc.b $AC ; ¬
		dc.b $B9 ; ¹
		dc.b $FF
		dc.b $B1 ; ±
		dc.b $2D ; -
		dc.b $2D ; -
		dc.b $2A ; *
		dc.b $4B ; K
		dc.b $F4 ; ô
		dc.b $23 ; #
		dc.b $58 ; X
		dc.b $4D ; M
		dc.b $E1 ; á
		dc.b $78 ; x
		dc.b $6E ; n
		dc.b $C2 ; Â
		dc.b $C2 ; Â
		dc.b $F0 ; ð
		dc.b $DF ; ß
		dc.b $9D ; 
		dc.b $CD ; Í
		dc.b $96 ; –
		dc.b $CC ; Ì
		dc.b $B3 ; ³
		dc.b $74 ; t
		dc.b $E9 ; é
		dc.b $D4 ; Ô
		dc.b $3F ; ?
		dc.b $6C ; l
		dc.b $33 ; 3
		dc.b $8F ; 
		dc.b $D8 ; Ø
		dc.b $8B ; ‹
		dc.b $C7 ; Ç
		dc.b $41 ; A
		dc.b $17
		dc.b $8E ; Ž
		dc.b $81 ; 
		dc.b $B3 ; ³
		dc.b $2F ; /
		dc.b $DD ; Ý
		dc.b $65 ; e
		dc.b $D3 ; Ó
		dc.b $A5 ; ¥
		dc.b $75 ; u
		dc.b $42 ; B
		dc.b $5A ; Z
		dc.b $F3 ; ó
		dc.b $87 ; ‡
		dc.b $84 ; „
		dc.b $E8 ; è
		dc.b  $C
		dc.b $1A
		dc.b $BE ; ¾
		dc.b $CE ; Î
		dc.b $81 ; 
		dc.b $78 ; x
		dc.b $FD ; ý
		dc.b $D6 ; Ö
		dc.b $5B ; [
		dc.b $32 ; 2
		dc.b $E9 ; é
		dc.b $D3 ; Ó
		dc.b $21 ; !
		dc.b $A8 ; ¨
		dc.b $48 ; H
		dc.b $49 ; I
		dc.b   6
		dc.b $70 ; p
		dc.b $81 ; 
		dc.b $18
		dc.b $5E ; ^
		dc.b $18
		dc.b $32 ; 2
		dc.b $F6 ; ö
		dc.b $42 ; B
		dc.b $D6 ; Ö
		dc.b $7A ; z
		dc.b $BD ; ½
		dc.b $9E ; ž
		dc.b $36 ; 6
		dc.b $7E ; ~
		dc.b $77 ; w
		dc.b $C3 ; Ã
		dc.b $2E ; .
		dc.b $9D ; 
		dc.b $32 ; 2
		dc.b $1F
		dc.b $C6 ; Æ
		dc.b $64 ; d
		dc.b $1F
		dc.b $C1 ; Á
		dc.b  $C
		dc.b $3A ; :
		dc.b $33 ; 3
		dc.b $4A ; J
		dc.b $D5 ; Õ
		dc.b $EC ; ì
		dc.b $A3 ; £
		dc.b $D9 ; Ù
		dc.b $79 ; y
		dc.b $B4 ; ´
		dc.b $5D ; ]
		dc.b $96 ; –
		dc.b $CF ; Ï
		dc.b $CE ; Î
		dc.b $E8 ; è
		dc.b $E7 ; ç
		dc.b $FE ; þ
		dc.b $47 ; G
		dc.b $3C ; <
		dc.b $BF ; ¿
		dc.b $AB ; «
		dc.b $21 ; !
		dc.b $70 ; p
		dc.b $DE ; Þ
		dc.b $91 ; ‘
		dc.b $5E ; ^
		dc.b $73 ; s
		dc.b $5D ; ]
		dc.b $D2 ; Ò
		dc.b $AE ; ®
		dc.b $44 ; D
		dc.b $E0 ; à
		dc.b $FF
		dc.b $F1 ; ñ
		dc.b $92 ; ’
		dc.b $49 ; I
		dc.b $26 ; &
		dc.b $5F ; _
		dc.b $E3 ; ã
		dc.b $24 ; $
		dc.b $92 ; ’
		dc.b $4A ; J
		dc.b   4
		dc.b $FE ; þ
		dc.b $1A
		dc.b $33 ; 3
		dc.b $FF
		dc.b $8B ; ‹
		dc.b $1B
		dc.b $BF ; ¿
		dc.b $BB ; »
		dc.b $76 ; v
		dc.b $56 ; V
		dc.b $62 ; b
		dc.b $EC ; ì
		dc.b $5D ; ]
		dc.b $93 ; “
		dc.b $83 ; ƒ
		dc.b   6
		dc.b  $D
		dc.b $8D ; 
		dc.b $E1 ; á
		dc.b   2
		dc.b  $F
		dc.b $D8 ; Ø
		dc.b $84 ; „
		dc.b   9
		dc.b $FF
		dc.b $EE ; î
		dc.b $9D ; 
		dc.b $3D ; =
		dc.b $5D ; ]
		dc.b $CE ; Î
		dc.b $D0 ; Ð
		dc.b $EC ; ì
		dc.b $5D ; ]
		dc.b   6
		dc.b $16
		dc.b $86 ; †
		dc.b $90 ; 
		dc.b $94 ; ”
		dc.b $12
		dc.b $89 ; ‰
		dc.b   4
		dc.b $98 ; ˜
		dc.b $DA ; Ú
		dc.b $34 ; 4
		dc.b $4A ; J
		dc.b $7A ; z
		dc.b   7
		dc.b $58 ; X
		dc.b $D0 ; Ð
		dc.b $34 ; 4
		dc.b $69 ; i
		dc.b $EA ; ê
		dc.b $D0 ; Ð
		dc.b $EF ; ï
		dc.b $E4 ; ä
		dc.b $38 ; 8
		dc.b $35 ; 5
		dc.b $4C ; L
		dc.b $B2 ; ²
		dc.b $78 ; x
		dc.b $7C ; |
		dc.b $95 ; •
		dc.b   2
		dc.b   4
		dc.b   8
		dc.b $3F ; ?
		dc.b $5C ; \
		dc.b $3F ; ?
		dc.b $5C ; \
		dc.b $3B ; ;
		dc.b $87 ; ‡
		dc.b $76 ; v
		dc.b $9E ; ž
		dc.b $AE ; ®
		dc.b $E7 ; ç
		dc.b $62 ; b
		dc.b $EC ; ì
		dc.b $74 ; t
		dc.b $42 ; B
		dc.b $D0 ; Ð
		dc.b $CF ; Ï
		dc.b $57 ; W
		dc.b $C8 ; È
		dc.b $22 ; "
		dc.b $BC ; ¼
		dc.b $24 ; $
		dc.b $10
		dc.b $20
		dc.b $D4 ; Ô
		dc.b $36 ; 6
		dc.b $89 ; ‰
		dc.b $D3 ; Ó
		dc.b $AC ; ¬
		dc.b $68 ; h
		dc.b $D3 ; Ó
		dc.b $D5 ; Õ
		dc.b $A1 ; ¡
		dc.b $D8 ; Ø
		dc.b $BB ; »
		dc.b $17
		dc.b $62 ; b
		dc.b $E1 ; á
		dc.b $68 ; h
		dc.b $60 ; `
		dc.b $C1 ; Á
		dc.b $A4 ; ¤
		dc.b $10
		dc.b $20
		dc.b $4A ; J
		dc.b $20
		dc.b $40 ; @
		dc.b $93 ; “
		dc.b $1F
		dc.b $DE ; Þ
		dc.b $D0 ; Ð
		dc.b $3F ; ?
		dc.b $B1 ; ±
		dc.b $A7 ; §
		dc.b $AB ; «
		dc.b $17
		dc.b $7F ; 
		dc.b $23 ; #
		dc.b $10
		dc.b $D5 ; Õ
		dc.b $A0 ;  
		dc.b $93 ; “
		dc.b $C3 ; Ã
		dc.b $E4 ; ä
		dc.b $A8 ; ¨
		dc.b $10
		dc.b $20
		dc.b $4F ; O
		dc.b $DF ; ß
		dc.b  $F
		dc.b $D7 ; ×
		dc.b $7E ; ~
		dc.b $E0 ; à
		dc.b $77 ; w
		dc.b $69 ; i
		dc.b $EA ; ê
		dc.b $C7 ; Ç
		dc.b $BB ; »
		dc.b $F3 ; ó
		dc.b $FA ; ú
		dc.b $31 ; 1
		dc.b $C1 ; Á
		dc.b $E8 ; è
		dc.b $F0 ; ð
		dc.b $FC ; ü
		dc.b $F0 ; ð
		dc.b $40 ; @
		dc.b $94 ; ”
		dc.b $DA ; Ú
		dc.b $3F ; ?
		dc.b $5C ; \
		dc.b $3B ; ;
		dc.b $87 ; ‡
		dc.b $70 ; p
		dc.b $D1 ; Ñ
		dc.b $A7 ; §
		dc.b $A9 ; ©
		dc.b $D8 ; Ø
		dc.b $BB ; »
		dc.b $1D
		dc.b $1F
		dc.b $9F ; Ÿ
		dc.b $D0 ; Ð
		dc.b $C1 ; Á
		dc.b $9F ; Ÿ
		dc.b $52 ; R
		dc.b $43 ; C
		dc.b $38 ; 8
		dc.b $78 ; x
		dc.b $7D ; }
		dc.b $72 ; r
		dc.b $1A
		dc.b   6
		dc.b $DA ; Ú
		dc.b $68 ; h
		dc.b $1D
		dc.b $63 ; c
		dc.b $4F ; O
		dc.b $57 ; W
		dc.b $EE ; î
		dc.b $31 ; 1
		dc.b $76 ; v
		dc.b $2E ; .
		dc.b $A9 ; ©
		dc.b $83 ; ƒ
		dc.b $49 ; I
		dc.b $F2 ; ò
		dc.b $7A ; z
		dc.b   4
		dc.b $54 ; T
		dc.b   8
		dc.b $10
		dc.b $27 ; '
		dc.b $E9 ; é
		dc.b $BF ; ¿
		dc.b $9D ; 
		dc.b $7C ; |
		dc.b $7F ; 
		dc.b $90 ; 
		dc.b $8C ; Œ
		dc.b $FF
		dc.b $E2 ; â
		dc.b $C6 ; Æ
		dc.b $EF ; ï
		dc.b $EE ; î
		dc.b $DD ; Ý
		dc.b $95 ; •
		dc.b $98 ; ˜
		dc.b $F5 ; õ
		dc.b $BB ; »
		dc.b $27 ; '
		dc.b   6
		dc.b $7A ; z
		dc.b $DB ; Û
		dc.b $8D ; 
		dc.b $EA ; ê
		dc.b $F9 ; ù
		dc.b $3F ; ?
		dc.b $F6 ; ö
		dc.b $21 ; !
		dc.b   2
		dc.b $7E ; ~
		dc.b $F8 ; ø
		dc.b $6A ; j
		dc.b $9F ; Ÿ
		dc.b $EE ; î
		dc.b $21 ; !
		dc.b $A3 ; £
		dc.b $4F ; O
		dc.b $56 ; V
		dc.b $3F ; ?
		dc.b $B8 ; ¸
		dc.b $77 ; w
		dc.b $5D ; ]
		dc.b $4C ; L
		dc.b $A8 ; ¨
		dc.b $24 ; $
		dc.b $F9 ; ù
		dc.b   9
		dc.b $3E ; >
		dc.b   8
		dc.b $10
		dc.b $24 ; $
		dc.b $C6 ; Æ
		dc.b $AF ; ¯
		dc.b $DF ; ß
		dc.b $68 ; h
		dc.b $87 ; ‡
		dc.b $EE ; î
		dc.b $34 ; 4
		dc.b $F5 ; õ
		dc.b $77 ; w
		dc.b $3B ; ;
		dc.b $17
		dc.b $63 ; c
		dc.b $A2 ; ¢
		dc.b  $C
		dc.b $1A
		dc.b  $F
		dc.b $90 ; 
		dc.b $40 ; @
		dc.b $8A ; Š
		dc.b $81 ; 
		dc.b   2
		dc.b $43 ; C
		dc.b $FB ; û
		dc.b $C2 ; Â
		dc.b $3F ; ?
		dc.b $DB ; Û
		dc.b $62 ; b
		dc.b $49 ; I
		dc.b $25 ; %
		dc.b $30 ; 0
		dc.b $D3 ; Ó
		dc.b $BF ; ¿
		dc.b $9B ; ›
		dc.b $FC ; ü
		dc.b $67 ; g
		dc.b $47 ; G
		dc.b $37 ; 7
		dc.b $F4 ; ô
		dc.b $EE ; î
		dc.b $D1 ; Ñ
		dc.b $FD ; ý
		dc.b $AE ; ®
		dc.b $7F ; 
		dc.b $EC ; ì
		dc.b $4B ; K
		dc.b $4D ; M
		dc.b $DA ; Ú
		dc.b $84 ; „
		dc.b $84 ; „
		dc.b $90 ; 
		dc.b $67 ; g
		dc.b   8
		dc.b $11
		dc.b $85 ; …
		dc.b $E1 ; á
		dc.b $AD ; ­
		dc.b $7D ; }
		dc.b $A2 ; ¢
		dc.b $D2 ; Ò
		dc.b $C2 ; Â
		dc.b $F7 ; ÷
		dc.b $FE ; þ
		dc.b $B7 ; ·
		dc.b $36 ; 6
		dc.b $5E ; ^
		dc.b $1D
		dc.b $3A ; :
		dc.b $47 ; G
		dc.b $E9 ; é
		dc.b $87 ; ‡
		dc.b $E9 ; é
		dc.b $87 ; ‡
		dc.b $E8 ; è
		dc.b $47 ; G
		dc.b $E8 ; è
		dc.b $46 ; F
		dc.b $F0 ; ð
		dc.b $DE ; Þ
		dc.b $23 ; #
		dc.b $78 ; x
		dc.b $6F ; o
		dc.b $65 ; e
		dc.b $E1 ; á
		dc.b $97 ; —
		dc.b $87 ; ‡
		dc.b $4E ; N
		dc.b $98 ; ˜
		dc.b $7E ; ~
		dc.b $98 ; ˜
		dc.b $48 ; H
		dc.b $3C ; <
		dc.b $7E ; ~
		dc.b $84 ; „
		dc.b $20
		dc.b $61 ; a
		dc.b $BC ; ¼
		dc.b $19
		dc.b $7B ; {
		dc.b $21 ; !
		dc.b $68 ; h
		dc.b $BC ; ¼
		dc.b $5E ; ^
		dc.b $F1 ; ñ
		dc.b $96 ; –
		dc.b $CC ; Ì
		dc.b $BC ; ¼
		dc.b $32 ; 2
		dc.b $E9 ; é
		dc.b $D3 ; Ó
		dc.b $21 ; !
		dc.b $FD ; ý
		dc.b $64 ; d
		dc.b $1F
		dc.b $D1 ; Ñ
		dc.b $61 ; a
		dc.b $FD ; ý
		dc.b $3B ; ;
		dc.b $4B ; K
		dc.b $FF
		dc.b $A7 ; §
		dc.b $97 ; —
		dc.b $FA ; ú
		dc.b $BA ; º
		dc.b $74 ; t
		dc.b $FE ; þ
		dc.b $D8 ; Ø
		dc.b $7E ; ~
		dc.b $9B ; ›
		dc.b $F6 ; ö
		dc.b $23 ; #
		dc.b $F4 ; ô
		dc.b $3D ; =
		dc.b   3
		dc.b $78 ; x
		dc.b $F4 ; ô
		dc.b  $D
		dc.b $EF ; ï
		dc.b $DD ; Ý
		dc.b $65 ; e
		dc.b $E1 ; á
		dc.b $D3 ; Ó
		dc.b $A7 ; §
		dc.b $50 ; P
		dc.b $FD ; ý
		dc.b $30 ; 0
		dc.b $96 ; –
		dc.b $71 ; q
		dc.b $FA ; ú
		dc.b $10
		dc.b $97 ; —
		dc.b $8D ; 
		dc.b $E0 ; à
		dc.b $C2 ; Â
		dc.b $D1 ; Ñ
		dc.b $6D ; m
		dc.b $1A
		dc.b $17
		dc.b $86 ; †
		dc.b $CD ; Í
		dc.b $FA ; ú
		dc.b $DD ; Ý
		dc.b $99 ; ™
		dc.b $66 ; f
		dc.b $E9 ; é
		dc.b $D3 ; Ó
		dc.b $21 ; !
		dc.b $A8 ; ¨
		dc.b $6A ; j
		dc.b   8
		dc.b $FC ; ü
		dc.b $E3 ; ã
		dc.b $38 ; 8
		dc.b $E8 ; è
		dc.b $17
		dc.b $91 ; ‘
		dc.b $D0 ; Ð
		dc.b $2F ; /
		dc.b $1F
		dc.b $BA ; º
		dc.b $CB ; Ë
		dc.b $66 ; f
		dc.b $5D ; ]
		dc.b $3A ; :
		dc.b $61 ; a
		dc.b $FC ; ü
		dc.b $6F ; o
		dc.b $D3 ; Ó
		dc.b $FF
		dc.b   7
		dc.b $8B ; ‹
		dc.b $F6 ; ö
		dc.b $87 ; ‡
		dc.b $A3 ; £
		dc.b $F7 ; ÷
		dc.b $BF ; ¿
		dc.b $BA ; º
		dc.b $E9 ; é
		dc.b $D3 ; Ó
		dc.b $FC ; ü
		dc.b $68 ; h
		dc.b $7F ; 
		dc.b   7
		dc.b $58 ; X
		dc.b $CD ; Í
		dc.b $FD ; ý
		dc.b $3A ; :
		dc.b $BF ; ¿
		dc.b $48 ; H
		dc.b $34 ; 4
		dc.b $73 ; s
		dc.b $5E ; ^
		dc.b $F5 ; õ
		dc.b $7D ; }
		dc.b $DA ; Ú
		dc.b $3C ; <
		dc.b $3F ; ?
		dc.b $3B ; ;
		dc.b $9B ; ›
		dc.b $9F ; Ÿ
		dc.b $FB ; û
		dc.b $12
		dc.b $D3 ; Ó
		dc.b $72 ; r
		dc.b $FE ; þ
		dc.b $D9 ; Ù
		dc.b   6
		dc.b $BF ; ¿
		dc.b $D8 ; Ø
		dc.b $B0 ; °
		dc.b $FE ; þ
		dc.b $9A ; š
		dc.b $FE ; þ
		dc.b $92 ; ’
		dc.b  $D
		dc.b $4D ; M
		dc.b $EC ; ì
		dc.b $DF ; ß
		dc.b $BD ; ½
		dc.b $F0 ; ð
		dc.b $E9 ; é
		dc.b $D2 ; Ò
		dc.b $3F ; ?
		dc.b $AC ; ¬
		dc.b $BF ; ¿
		dc.b $D1 ; Ñ
		dc.b $5F ; _
		dc.b $E9 ; é
		dc.b $95 ; •
		dc.b $FE ; þ
		dc.b $98 ; ˜
		dc.b $CB ; Ë
		dc.b $FB ; û
		dc.b $59 ; Y
		dc.b $74 ; t
		dc.b $E9 ; é
		dc.b $B4 ; ´
		dc.b $92 ; ’
		dc.b $4E ; N
		dc.b   8
		dc.b $5A ; Z
		dc.b $B9 ; ¹
		dc.b  $F
		dc.b $E9 ; é
		dc.b $92 ; ’
		dc.b $58 ; X
		dc.b $B2 ; ²
		dc.b $A5 ; ¥
		dc.b $4C ; L
		dc.b $33 ; 3
		dc.b $D4 ; Ô
		dc.b $C3 ; Ã
		dc.b $3D ; =
		dc.b $57 ; W
		dc.b $C5 ; Å
		dc.b $B4 ; ´
		dc.b $F5 ; õ
		dc.b $62 ; b
		dc.b $EC ; ì
		dc.b $7A ; z
		dc.b $DD ; Ý
		dc.b $8E ; Ž
		dc.b $80 ; €
		dc.b $CF ; Ï
		dc.b $5B ; [
		dc.b $55 ; U
		dc.b $15
		dc.b $F2 ; ò
		dc.b $7A ; z
		dc.b $2A ; *
		dc.b   4
		dc.b   8
		dc.b $BB ; »
		dc.b $46 ; F
		dc.b $AD ; ­
		dc.b $A3 ; £
		dc.b $AE ; ®
		dc.b $1D
		dc.b $63 ; c
		dc.b $4F ; O
		dc.b $57 ; W
		dc.b $5E ; ^
		dc.b $2E ; .
		dc.b $C7 ; Ç
		dc.b $AD ; ­
		dc.b $CA ; Ê
		dc.b $F6 ; ö
		dc.b $7A ; z
		dc.b $DB ; Û
		dc.b $27 ; '
		dc.b $C1 ; Á
		dc.b $F2 ; ò
		dc.b $54 ; T
		dc.b   8
		dc.b $11
		dc.b $75 ; u
		dc.b   9
		dc.b $8D ; 
		dc.b $54 ; T
		dc.b $D1 ; Ñ
		dc.b $4D ; M
		dc.b $3D ; =
		dc.b $53 ; S
		dc.b $77 ; w
		dc.b $5E ; ^
		dc.b $2E ; .
		dc.b $EB ; ë
		dc.b $16
		dc.b $AB ; «
		dc.b $DA ; Ú
		dc.b $92 ; ’
		dc.b $7C ; |
		dc.b $95 ; •
		dc.b $F0 ; ð
		dc.b $40 ; @
		dc.b $81 ; 
		dc.b $26 ; &
		dc.b $3F ; ?
		dc.b $7C ; |
		dc.b $25 ; %
		dc.b $A0 ;  
		dc.b $7E ; ~
		dc.b $E1 ; á
		dc.b $74 ; t
		dc.b $F5 ; õ
		dc.b $75 ; u
		dc.b $E2 ; â
		dc.b $EC ; ì
		dc.b $5D ; ]
		dc.b $8B ; ‹
		dc.b $A0 ;  
		dc.b $C1 ; Á
		dc.b $83 ; ƒ
		dc.b $49 ; I
		dc.b $E8 ; è
		dc.b $10
		dc.b $22 ; "
		dc.b $A0 ;  
		dc.b $40 ; @
		dc.b $81 ; 
		dc.b $25 ; %
		dc.b $FE ; þ
		dc.b $E1 ; á
		dc.b $FE ; þ
		dc.b $8D ; 
		dc.b $3D ; =
		dc.b $58 ; X
		dc.b $BB ; »
		dc.b $B9 ; ¹
		dc.b $D8 ; Ø
		dc.b $E8 ; è
		dc.b $16
		dc.b $C2 ; Â
		dc.b $D5 ; Õ
		dc.b $41 ; A
		dc.b $27 ; '
		dc.b $C9 ; É
		dc.b $E9 ; é
		dc.b $44 ; D
		dc.b   8
		dc.b $B3 ; ³
		dc.b $1F
		dc.b $CE ; Î
		dc.b $1A
		dc.b   7
		dc.b $F2 ; ò
		dc.b   6
		dc.b $9E ; ž
		dc.b $AC ; ¬
		dc.b $5D ; ]
		dc.b $8B ; ‹
		dc.b $BF ; ¿
		dc.b $70 ; p
		dc.b $18
		dc.b $35 ; 5
		dc.b $10
		dc.b $22 ; "
		dc.b $BE ; ¾
		dc.b $4F ; O
		dc.b   8
		dc.b $10
		dc.b $20
		dc.b $4F ; O
		dc.b $DF ; ß
		dc.b  $D
		dc.b $53 ; S
		dc.b $FD ; ý
		dc.b $C4 ; Ä
		dc.b $34 ; 4
		dc.b $69 ; i
		dc.b $EA ; ê
		dc.b $C5 ; Å
		dc.b $DD ; Ý
		dc.b $78 ; x
		dc.b $BB ; »
		dc.b $AC ; ¬
		dc.b $5A ; Z
		dc.b $AF ; ¯
		dc.b $65 ; e
		dc.b $41 ; A
		dc.b $27 ; '
		dc.b $C1 ; Á
		dc.b $F0 ; ð
		dc.b $40 ; @
		dc.b $81 ; 
		dc.b $26 ; &
		dc.b $35 ; 5
		dc.b   9
		dc.b $89 ; ‰
		dc.b $68 ; h
		dc.b $A6 ; ¦
		dc.b $85 ; …
		dc.b $D3 ; Ó
		dc.b $D5 ; Õ
		dc.b $A1 ; ¡
		dc.b $D8 ; Ø
		dc.b $BB ; »
		dc.b $17
		dc.b $62 ; b
		dc.b $E1 ; á
		dc.b $68 ; h
		dc.b $60 ; `
		dc.b $C1 ; Á
		dc.b $A4 ; ¤
		dc.b $10
		dc.b $20
		dc.b $4A ; J
		dc.b $20
		dc.b $40 ; @
		dc.b $92 ; ’
		dc.b $1F
		dc.b $DE ; Þ
		dc.b $5F ; _
		dc.b $EC ; ì
		dc.b $69 ; i
		dc.b $EA ; ê
		dc.b $C5 ; Å
		dc.b $DA ; Ú
		dc.b $1D
		dc.b $8B ; ‹
		dc.b $B4 ; ´
		dc.b $38 ; 8
		dc.b $30 ; 0
		dc.b $60 ; `
		dc.b $C1 ; Á
		dc.b $90 ; 
		dc.b $33 ; 3
		dc.b $D1 ; Ñ
		dc.b $EC ; ì
		dc.b $A9 ; ©
		dc.b $70 ; p
		dc.b $B8 ; ¸
		dc.b $5C ; \
		dc.b $9F ; Ÿ
		dc.b $AE ; ®
		dc.b $DE ; Þ
		dc.b $DB ; Û
		dc.b $DC ; Ü
		dc.b $C1 ; Á
		dc.b $BA ; º
		dc.b $F4 ; ô
		dc.b $F5 ; õ
		dc.b $63 ; c
		dc.b $DD ; Ý
		dc.b $8B ; ‹
		dc.b $BA ; º
		dc.b $EA ; ê
		dc.b $65 ; e
		dc.b $47 ; G
		dc.b $87 ; ‡
		dc.b $A0 ;  
		dc.b $93 ; “
		dc.b $C2 ; Â
		dc.b   4
		dc.b   8
		dc.b $13
		dc.b $68 ; h
		dc.b $FE ; þ
		dc.b $77 ; w
		dc.b $58 ; X
		dc.b $FE ; þ
		dc.b $46 ; F
		dc.b $9E ; ž
		dc.b $AE ; ®
		dc.b $E7 ; ç
		dc.b $62 ; b
		dc.b $EC ; ì
		dc.b $5D ; ]
		dc.b   6
		dc.b  $C
		dc.b $18
		dc.b $3E ; >
		dc.b $41 ; A
		dc.b   2
		dc.b $2A ; *
		dc.b   4
		dc.b   8
		dc.b $10
		dc.b $7F ; 
		dc.b $BA ; º
		dc.b $EC ; ì
		dc.b $DF ; ß
		dc.b $D8 ; Ø
		dc.b $56 ; V
		dc.b $AA ; ª
		dc.b $D7 ; ×
		dc.b $A3 ; £
		dc.b $55 ; U
		dc.b $6B ; k
		dc.b $D1 ; Ñ
		dc.b $AA ; ª
		dc.b $B5 ; µ
		dc.b $E8 ; è
		dc.b $D5 ; Õ
		dc.b $5A ; Z
		dc.b $F4 ; ô
		dc.b $6A ; j
		dc.b $AD ; ­
		dc.b $7A ; z
		dc.b $35 ; 5
		dc.b $56 ; V
		dc.b $BF ; ¿
		dc.b $FA ; ú
		dc.b $31 ; 1
		dc.b $95 ; •
		dc.b $6C ; l
		dc.b $12
		dc.b $B6 ; ¶
		dc.b $2C ; ,
		dc.b $49 ; I
		dc.b $63 ; c
		dc.b $D0 ; Ð
		dc.b $2E ; .
		dc.b $64 ; d
		dc.b $C3 ; Ã
		dc.b $3C ; <
		dc.b $39 ; 9
		dc.b $E4 ; ä
		dc.b $33 ; 3
		dc.b $D5 ; Õ
		dc.b $7E ; ~
		dc.b $71 ; q
		dc.b $2E ; .
		dc.b $75 ; u
		dc.b $6C ; l
		dc.b $E2 ; â
		dc.b $57 ; W
		dc.b $41 ; A
		dc.b $91 ; ‘
		dc.b $65 ; e
		dc.b $46 ; F
		dc.b $86 ; †
		dc.b $A7 ; §
		dc.b $AB ; «
		dc.b $5C ; \
		dc.b $D9 ; Ù
		dc.b $C6 ; Æ
		dc.b $B0 ; °
		dc.b $83 ; ƒ
		dc.b $F8 ; ø
		dc.b $61 ; a
		dc.b $A1 ; ¡
		dc.b $FA ; ú
		dc.b $48 ; H
		dc.b $5E ; ^
		dc.b $F5 ; õ
		dc.b $7B ; {
		dc.b  $F
		dc.b  $F
		dc.b $CE ; Î
		dc.b $EC ; ì
		dc.b $CB ; Ë
		dc.b $A7 ; §
		dc.b $4A ; J
		dc.b $EA ; ê
		dc.b $A6 ; ¦
		dc.b $BC ; ¼
		dc.b $E3 ; ã
		dc.b $58 ; X
		dc.b $E8 ; è
		dc.b $17
		dc.b $91 ; ‘
		dc.b $D0 ; Ð
		dc.b $2F ; /
		dc.b $1F
		dc.b $BA ; º
		dc.b $CB ; Ë
		dc.b $66 ; f
		dc.b $5D ; ]
		dc.b $3A ; :
		dc.b $64 ; d
		dc.b $3F ; ?
		dc.b $6D ; m
		dc.b $4F ; O
		dc.b $D8 ; Ø
		dc.b $87 ; ‡
		dc.b $AF ; ¯
		dc.b $40 ; @
		dc.b $65 ; e
		dc.b $FD ; ý
		dc.b $22 ; "
		dc.b $DA ; Ú
		dc.b $24 ; $
		dc.b $AF ; ¯
		dc.b $65 ; e
		dc.b $FC ; ü
		dc.b $DF ; ß
		dc.b $E7 ; ç
		dc.b $76 ; v
		dc.b $7E ; ~
		dc.b $77 ; w
		dc.b $A7 ; §
		dc.b $48 ; H
		dc.b $FF
		dc.b $33 ; 3
		dc.b $FF
		dc.b $C3 ; Ã
		dc.b $C5 ; Å
		dc.b $D8 ; Ø
		dc.b $7F ; 
		dc.b $A7 ; §
		dc.b $F9 ; ù
		dc.b $DF ; ß
		dc.b $ED ; í
		dc.b $74 ; t
		dc.b $E9 ; é
		dc.b $90 ; 
		dc.b $FE ; þ
		dc.b $30 ; 0
		dc.b $41 ; A
		dc.b $FC ; ü
		dc.b $10
		dc.b $C3 ; Ã
		dc.b $F8 ; ø
		dc.b $70 ; p
		dc.b $FD ; ý
		dc.b $A2 ; ¢
		dc.b $B3 ; ³
		dc.b $E0 ; à
		dc.b $F6 ; ö
		dc.b $1B
		dc.b $3F ; ?
		dc.b $5B ; [
		dc.b $B3 ; ³
		dc.b $2E ; .
		dc.b $9D ; 
		dc.b $3F ; ?
		dc.b $B6 ; ¶
		dc.b $84 ; „
		dc.b $BF ; ¿
		dc.b $62 ; b
		dc.b $35 ; 5
		dc.b $A7 ; §
		dc.b $40 ; @
		dc.b $DE ; Þ
		dc.b $FD ; ý
		dc.b $22 ; "
		dc.b $FE ; þ
		dc.b $92 ; ’
		dc.b  $D
		dc.b $4F ; O
		dc.b $D6 ; Ö
		dc.b $E6 ; æ
		dc.b $FD ; ý
		dc.b $EF ; ï
		dc.b $4E ; N
		dc.b $99 ; ™
		dc.b $52 ; R
		dc.b $4A ; J
		dc.b $83 ; ƒ
		dc.b $58 ; X
		dc.b $40 ; @
		dc.b $F6 ; ö
		dc.b $17
		dc.b $86 ; †
		dc.b  $C
		dc.b $58 ; X
		dc.b $5E ; ^
		dc.b $18
		dc.b $36 ; 6
		dc.b $6C ; l
		dc.b $B6 ; ¶
		dc.b $65 ; e
		dc.b $9B ; ›
		dc.b $2C ; ,
		dc.b $DD ; Ý
		dc.b $3A ; :
		dc.b $57 ; W
		dc.b $FA ; ú
		dc.b $C1 ; Á
		dc.b $FF
		dc.b $D1 ; Ñ
		dc.b $1F
		dc.b $E3 ; ã
		dc.b $EC ; ì
		dc.b $AD ; ­
		dc.b $87 ; ‡
		dc.b $F4 ; ô
		dc.b $F3 ; ó
		dc.b $65 ; e
		dc.b $FD ; ý
		dc.b $AE ; ®
		dc.b $9D ; 
		dc.b $3F ; ?
		dc.b $B6 ; ¶
		dc.b $84 ; „
		dc.b $BF ; ¿
		dc.b $62 ; b
		dc.b $35 ; 5
		dc.b $A7 ; §
		dc.b $40 ; @
		dc.b $DE ; Þ
		dc.b $AB ; «
		dc.b $F4 ; ô
		dc.b $9D ; 
		dc.b $14
		dc.b $FD ; ý
		dc.b $D7 ; ×
		dc.b $EF ; ï
		dc.b $7A ; z
		dc.b $74 ; t
		dc.b $FE ; þ
		dc.b $99 ; ™
		dc.b $83 ; ƒ
		dc.b $6A ; j
		dc.b $FD ; ý
		dc.b  $E
		dc.b $F6 ; ö
		dc.b $7B ; {
		dc.b $ED ; í
		dc.b  $F
		dc.b $16
		dc.b $B2 ; ²
		dc.b $B5 ; µ
		dc.b $A2 ; ¢
		dc.b $D6 ; Ö
		dc.b $17
		dc.b $8D ; 
		dc.b $E0 ; à
		dc.b $DB ; Û
		dc.b $32 ; 2
		dc.b $F0 ; ð
		dc.b $CB ; Ë
		dc.b $37 ; 7
		dc.b $4E ; N
		dc.b $9D ; 
		dc.b $43 ; C
		dc.b $F8 ; ø
		dc.b $D9 ; Ù
		dc.b $C7 ; Ç
		dc.b $F0 ; ð
		dc.b $6F ; o
		dc.b $1F
		dc.b $C3 ; Ã
		dc.b $16
		dc.b $8B ; ‹
		dc.b $68 ; h
		dc.b $D0 ; Ð
		dc.b $E8 ; è
		dc.b $CD ; Í
		dc.b $FA ; ú
		dc.b $DF ; ß
		dc.b $DD ; Ý
		dc.b $74 ; t
		dc.b $E9 ; é
		dc.b $1F
		dc.b $E6 ; æ
		dc.b $1F
		dc.b $E1 ; á
		dc.b $1F
		dc.b $E3 ; ã
		dc.b $23 ; #
		dc.b $FC ; ü
		dc.b $79 ; y
		dc.b $7F ; 
		dc.b $AB ; «
		dc.b $A7 ; §
		dc.b $4D ; M
		dc.b $C3 ; Ã
		dc.b $FA ; ú
		dc.b $78 ; x
		dc.b $27 ; '
		dc.b $3D ; =
		dc.b $33 ; 3
		dc.b $D5 ; Õ
		dc.b $9C ; œ
		dc.b $5D ; ]
		dc.b $25 ; %
		dc.b $CF ; Ï
		dc.b $7C ; |
		dc.b $97 ; —
		dc.b $3B ; ;
		dc.b $41 ; A
		dc.b   2
		dc.b $34 ; 4
		dc.b $33 ; 3
		dc.b $DF ; ß
		dc.b $46 ; F
		dc.b $8F ; 
		dc.b $F0 ; ð
		dc.b $6E ; n
		dc.b $C2 ; Â
		dc.b $D2 ; Ò
		dc.b $49 ; I
		dc.b $25 ; %
		dc.b $A3 ; £
		dc.b $FD ; ý
		dc.b $17
		dc.b $A3 ; £
		dc.b $55 ; U
		dc.b $6B ; k
		dc.b $D1 ; Ñ
		dc.b $AA ; ª
		dc.b $B5 ; µ
		dc.b $E8 ; è
		dc.b $D5 ; Õ
		dc.b $5A ; Z
		dc.b $D2 ; Ò
		dc.b $8B ; ‹
		dc.b $55 ; U
		dc.b $6B ; k
		dc.b $4A ; J
		dc.b $35 ; 5
		dc.b $DA ; Ú
		dc.b $C7 ; Ç
		dc.b $FC ; ü
		dc.b $31 ; 1
		dc.b $C1 ; Á
		dc.b $89 ; ‰
		dc.b $2D ; -
		dc.b $84 ; „
		dc.b $A2 ; ¢
		dc.b $D5 ; Õ
		dc.b $5A ; Z
		dc.b $D2 ; Ò
		dc.b $8B ; ‹
		dc.b $43 ; C
		dc.b $8E ; Ž
		dc.b $48 ; H
		dc.b $3A ; :
		dc.b $17
		dc.b $3D ; =
		dc.b $2F ; /
		dc.b $FD ; ý
		dc.b $8D ; 
		dc.b $2F ; /
		dc.b $FD ; ý
		dc.b  $D
		dc.b $57 ; W
		dc.b $A6 ; ¦
		dc.b  $C
		dc.b $4F ; O
		dc.b $11
		dc.b $39 ; 9
		dc.b $EB ; ë
		dc.b $FF
		dc.b   8
		dc.b $BF ; ¿
		dc.b $FA ; ú
		dc.b $2B ; +
		dc.b $FC ; ü
		dc.b $38 ; 8
		dc.b $9E ; ž
		dc.b $22 ; "
		dc.b $49 ; I
		dc.b $CF ; Ï
		dc.b $5F ; _
		dc.b $1F
		dc.b $F4 ; ô
		dc.b $CF ; Ï
		dc.b $11
		dc.b $24 ; $
		dc.b $9E ; ž
		dc.b $23 ; #
		dc.b $FD ; ý
		dc.b $38 ; 8
		dc.b $B4 ; ´
		dc.b $33 ; 3
		dc.b $84 ; „
		dc.b $61 ; a
		dc.b $FB ; û
		dc.b $1B
		dc.b $C7 ; Ç
		dc.b $E8 ; è
		dc.b $6F ; o
		dc.b $82 ; ‚
		dc.b $5F ; _
		dc.b $53 ; S
		dc.b $13
		dc.b $87 ; ‡
		dc.b $EC ; ì
		dc.b $6E ; n
		dc.b $8B ; ‹
		dc.b $55 ; U
		dc.b $6B ; k
		dc.b $4A ; J
		dc.b $35 ; 5
		dc.b $DA ; Ú
		dc.b $C4 ; Ä
		dc.b $92 ; ’
		dc.b $77 ; w
		dc.b $EF ; ï
		dc.b $AE ; ®
		dc.b $32 ; 2
		dc.b $8D ; 
		dc.b $F4 ; ô
		dc.b $B5 ; µ
		dc.b $B5 ; µ
		dc.b $71 ; q
		dc.b $B4 ; ´
		dc.b $3B ; ;
		dc.b $2F ; /
		dc.b $89 ; ‰
		dc.b $27 ; '
		dc.b $7C ; |
		dc.b $96 ; –
		dc.b $C2 ; Â
		dc.b $3F ; ?
		dc.b $E1 ; á
		dc.b $24 ; $
		dc.b $EF ; ï
		dc.b $92 ; ’
		dc.b $77 ; w
		dc.b $C9 ; É
		dc.b $3B ; ;
		dc.b $FA ; ú
		dc.b $7A ; z
		dc.b $B1 ; ±
		dc.b $EE ; î
		dc.b $C7 ; Ç
		dc.b $46 ; F
		dc.b $2E ; .
		dc.b $AD ; ­
		dc.b $EC ; ì
		dc.b $8F ; 
		dc.b  $F
		dc.b $4A ; J
		dc.b $20
		dc.b $45 ; E
		dc.b $B9 ; ¹
		dc.b $FB ; û
		dc.b $46 ; F
		dc.b $D8 ; Ø
		dc.b $75 ; u
		dc.b $8E ; Ž
		dc.b $B1 ; ±
		dc.b $70 ; p
		dc.b $D3 ; Ó
		dc.b $D5 ; Õ
		dc.b $8E ; Ž
		dc.b $89 ; ‰
		dc.b $FE ; þ
		dc.b $E1 ; á
		dc.b $D8 ; Ø
		dc.b $32 ; 2
		dc.b $42 ; B
		dc.b $4F ; O
		dc.b $95 ; •
		dc.b $68 ; h
		dc.b $11
		dc.b $84 ; „
		dc.b $C7 ; Ç
		dc.b $E9 ; é
		dc.b $A7 ; §
		dc.b $70 ; p
		dc.b $D1 ; Ñ
		dc.b $4D ; M
		dc.b $1A
		dc.b $7A ; z
		dc.b $BF ; ¿
		dc.b $71 ; q
		dc.b $97 ; —
		dc.b $71 ; q
		dc.b  $F
		dc.b $93 ; “
		dc.b $D6 ; Ö
		dc.b $4F ; O
		dc.b   8
		dc.b $12
		dc.b   8
		dc.b $35 ; 5
		dc.b $32 ; 2
		dc.b $EA ; ê
		dc.b $87 ; ‡
		dc.b $3C ; <
		dc.b $34 ; 4
		dc.b $F5 ; õ
		dc.b $59 ; Y
		dc.b $FC ; ü
		dc.b $87 ; ‡
		dc.b $5A ; Z
		dc.b $D5 ; Õ
		dc.b $32 ; 2
		dc.b $C9 ; É
		dc.b $E1 ; á
		dc.b $F2 ; ò
		dc.b $54 ; T
		dc.b   8
		dc.b $10
		dc.b $20
		dc.b $FD ; ý
		dc.b $70 ; p
		dc.b $FD ; ý
		dc.b $70 ; p
		dc.b $EE ; î
		dc.b $1D
		dc.b $DA ; Ú
		dc.b $7A ; z
		dc.b $BB ; »
		dc.b $9D ; 
		dc.b $3E ; >
		dc.b $E8 ; è
		dc.b $5B ; [
		dc.b $53 ; S
		dc.b $E5 ; å
		dc.b   9
		dc.b $3C ; <
		dc.b $25 ; %
		dc.b $48 ; H
		dc.b $36 ; 6
		dc.b $89 ; ‰
		dc.b $8D ; 
		dc.b $43 ; C
		dc.b $AC ; ¬
		dc.b $68 ; h
		dc.b $86 ; †
		dc.b $9E ; ž
		dc.b $AD ; ­
		dc.b $19
		dc.b $68 ; h
		dc.b $CB ; Ë
		dc.b $17
		dc.b $63 ; c
		dc.b $A2 ; ¢
		dc.b $A6 ; ¦
		dc.b $59 ; Y
		dc.b $44 ; D
		dc.b $45 ; E
		dc.b   2
		dc.b $2A ; *
		dc.b   4
		dc.b   8
		dc.b $BB ; »
		dc.b $47 ; G
		dc.b $EF ; ï
		dc.b $87 ; ‡
		dc.b $58 ; X
		dc.b $FD ; ý
		dc.b $C0 ; À
		dc.b $D3 ; Ó
		dc.b $D5 ; Õ
		dc.b $DD ; Ý
		dc.b $3F ; ?
		dc.b $DC ; Ü
		dc.b $19
		dc.b $3E ; >
		dc.b $49 ; I
		dc.b $27 ; '
		dc.b $87 ; ‡
		dc.b $84 ; „
		dc.b   8
		dc.b $10
		dc.b $26 ; &
		dc.b $AF ; ¯
		dc.b $DF ; ß
		dc.b   9
		dc.b $AF ; ¯
		dc.b $EE ; î
		dc.b   6
		dc.b $8D ; 
		dc.b $3D ; =
		dc.b $5A ; Z
		dc.b $27 ; '
		dc.b $FB ; û
		dc.b $8C ; Œ
		dc.b $5D ; ]
		dc.b $83 ; ƒ
		dc.b $49 ; I
		dc.b   3
		dc.b $E4 ; ä
		dc.b $F4 ; ô
		dc.b $54 ; T
		dc.b   8
		dc.b $10
		dc.b $26 ; &
		dc.b $D1 ; Ñ
		dc.b $AB ; «
		dc.b $F9 ; ù
		dc.b $C3 ; Ã
		dc.b $56 ; V
		dc.b $8C ; Œ
		dc.b $B4 ; ´
		dc.b $67 ; g
		dc.b $19
		dc.b $D6 ; Ö
		dc.b $EB ; ë
		dc.b $C5 ; Å
		dc.b $E3 ; ã
		dc.b $38 ; 8
		dc.b $B4 ; ´
		dc.b $5B ; [
		dc.b $46 ; F
		dc.b $83 ; ƒ
		dc.b  $B
		dc.b $F3 ; ó
		dc.b $7E ; ~
		dc.b $B7 ; ·
		dc.b $36 ; 6
		dc.b $5B ; [
		dc.b $3A ; :
		dc.b $74 ; t
		dc.b $DC ; Ü
		dc.b $35 ; 5
		dc.b $42 ; B
		dc.b $57 ; W
		dc.b $2A ; *
		dc.b $6B ; k
		dc.b   9
		dc.b  $D
		dc.b $E0 ; à
		dc.b $D0 ; Ð
		dc.b $FD ; ý
		dc.b $22 ; "
		dc.b $BE ; ¾
		dc.b $B6 ; ¶
		dc.b $CD ; Í
		dc.b $97 ; —
		dc.b $2F ; /
		dc.b $DE ; Þ
		dc.b $E6 ; æ
		dc.b $E9 ; é
		dc.b $D3 ; Ó
		dc.b  $E
		dc.b $7A ; z
		dc.b $6B ; k
		dc.b $8A ; Š
		dc.b $BD ; ½
		dc.b $77 ; w
		dc.b $AA ; ª
		dc.b $FD ; ý
		dc.b $22 ; "
		dc.b $B3 ; ³
		dc.b $EB ; ë
		dc.b $61 ; a
		dc.b $FB ; û
		dc.b $DD ; Ý
		dc.b $19
		dc.b $6C ; l
		dc.b $E9 ; é
		dc.b $D3 ; Ó
		dc.b $FB ; û
		dc.b $61 ; a
		dc.b $FA ; ú
		dc.b $6F ; o
		dc.b $D8 ; Ø
		dc.b $8F ; 
		dc.b $D0 ; Ð
		dc.b $F4 ; ô
		dc.b  $D
		dc.b $EB ; ë
		dc.b $4E ; N
		dc.b $F0 ; ð
		dc.b $DE ; Þ
		dc.b $CB ; Ë
		dc.b $C3 ; Ã
		dc.b $2F ; /
		dc.b  $E
		dc.b $9D ; 
		dc.b $23 ; #
		dc.b $50 ; P
		dc.b $95 ; •
		dc.b $33 ; 3
		dc.b $C3 ; Ã
		dc.b $58 ; X
		dc.b $BE ; ¾
		dc.b $17
		dc.b $8E ; Ž
		dc.b $C8 ; È
		dc.b $76 ; v
		dc.b $41 ; A
		dc.b $E9 ; é
		dc.b  $F
		dc.b $D6 ; Ö
		dc.b $EC ; ì
		dc.b $FD ; ý
		dc.b $6F ; o
		dc.b $4E ; N
		dc.b $9D ; 
		dc.b $43 ; C
		dc.b $F6 ; ö
		dc.b $C3 ; Ã
		dc.b $38 ; 8
		dc.b $FD ; ý
		dc.b $88 ; ˆ
		dc.b $BC ; ¼
		dc.b $74 ; t
		dc.b  $B
		dc.b $62 ; b
		dc.b $3F ; ?
		dc.b $49 ; I
		dc.b $15
		dc.b $4A ; J
		dc.b $20
		dc.b $CB ; Ë
		dc.b $37 ; 7
		dc.b $EF ; ï
		dc.b $73 ; s
		dc.b $65 ; e
		dc.b $D3 ; Ó
		dc.b $A5 ; ¥
		dc.b $7F ; 
		dc.b $6C ; l
		dc.b $25 ; %
		dc.b $AF ; ¯
		dc.b $F6 ; ö
		dc.b $21 ; !
		dc.b $3F ; ?
		dc.b $A6 ; ¦
		dc.b $1B
		dc.b $F4 ; ô
		dc.b $87 ; ‡
		dc.b $78 ; x
		dc.b $37 ; 7
		dc.b $EB ; ë
		dc.b $7C ; |
		dc.b $32 ; 2
		dc.b $CD ; Í
		dc.b $D3 ; Ó
		dc.b $A7 ; §
		dc.b $54 ; T
		dc.b $3F ; ?
		dc.b $4D ; M
		dc.b $9C ; œ
		dc.b $6B ; k
		dc.b $FD ; ý
		dc.b  $D
		dc.b $E3 ; ã
		dc.b $F8 ; ø
		dc.b $70 ; p
		dc.b $FD ; ý
		dc.b $22 ; "
		dc.b $DF ; ß
		dc.b $4B ; K
		dc.b $F6 ; ö
		dc.b $7E ; ~
		dc.b $F7 ; ÷
		dc.b $67 ; g
		dc.b $4E ; N
		dc.b $9F ; Ÿ
		dc.b $F9 ; ù
		dc.b  $F
		dc.b $F7 ; ÷
		dc.b $11
		dc.b $FE ; þ
		dc.b $E2 ; â
		dc.b $47 ; G
		dc.b $FB ; û
		dc.b $88 ; ˆ
		dc.b $FF
		dc.b $F7 ; ÷
		dc.b $FB ; û
		dc.b $8F ; 
		dc.b $FF
		dc.b $89 ; ‰
		dc.b $FF
		dc.b $F1 ; ñ
		dc.b $FF
		dc.b $F2 ; ò
		dc.b $FF
		dc.b $3A ; :
		dc.b $1B
		dc.b $46 ; F
		dc.b $D2 ; Ò
		dc.b $49 ; I
		dc.b $AA ; ª
		dc.b $66 ; f
		dc.b $1F
		dc.b $BE ; ¾
		dc.b $5D ; ]
		dc.b $A3 ; £
		dc.b $19
		dc.b $88 ; ˆ
		dc.b $FE ; þ
		dc.b $B8 ; ¸
		dc.b $63 ; c
		dc.b $3A ; :
		dc.b $E6 ; æ
		dc.b $27 ; '
		dc.b $11
		dc.b $B5 ; µ
		dc.b $76 ; v
		dc.b $A0 ;  
		dc.b $DA ; Ú
		dc.b $66 ; f
		dc.b $B3 ; ³
		dc.b $49 ; I
		dc.b $9A ; š
		dc.b $BF ; ¿
		dc.b $5C ; \
		dc.b $9B ; ›
		dc.b $53 ; S
		dc.b $F7 ; ÷
		dc.b $C8 ; È
		dc.b $49 ; I
		dc.b $87 ; ‡
		dc.b $EF ; ï
		dc.b $90 ; 
		dc.b $4D ; M
		dc.b   7
		dc.b $EB ; ë
		dc.b $92 ; ’
		dc.b $65 ; e
		dc.b $67 ; g
		dc.b $5E ; ^
		dc.b $DA ; Ú
		dc.b $B6 ; ¶
		dc.b $D7 ; ×
		dc.b $B7 ; ·
		dc.b  $D
		dc.b $A7 ; §
		dc.b   9
		dc.b $9A ; š
		dc.b $BF ; ¿
		dc.b $7C ; |
		dc.b $9F ; Ÿ
		dc.b $AE ; ®
		dc.b $1F
		dc.b $AE ; ®
		dc.b $5C ; \
		dc.b $66 ; f
		dc.b $27 ; '
		dc.b $4C ; L
		dc.b $7F ; 
		dc.b $9C ; œ
		dc.b $BB ; »
		dc.b $56 ; V
		dc.b $75 ; u
		dc.b $7E ; ~
		dc.b $BA ; º
		dc.b $1F
		dc.b $DE ; Þ
		dc.b $4F ; O
		dc.b $D7 ; ×
		dc.b $19
		dc.b $A4 ; ¤
		dc.b $E9 ; é
		dc.b $B4 ; ´
		dc.b $93 ; “
		dc.b $84 ; „
		dc.b $D7 ; ×
		dc.b $F5 ; õ
		dc.b $C8 ; È
		dc.b $26 ; &
		dc.b $9F ; Ÿ
		dc.b $BE ; ¾
		dc.b $49 ; I
		dc.b $9F ; Ÿ
		dc.b $D7 ; ×
		dc.b $27 ; '
		dc.b $EF ; ï
		dc.b $B1 ; ±
		dc.b $DA ; Ú
		dc.b $BF ; ¿
		dc.b $AE ; ®
		dc.b $C6 ; Æ
		dc.b $75 ; u
		dc.b $ED ; í
		dc.b $35 ; 5
		dc.b $FE ; þ
		dc.b $B9 ; ¹
		dc.b $7F ; 
		dc.b $BC ; ¼
		dc.b $9F ; Ÿ
		dc.b $BE ; ¾
		dc.b $29 ; )
		dc.b $FC ; ü
		dc.b $E5 ; å
		dc.b $4D ; M
		dc.b $A3 ; £
		dc.b $69 ; i
		dc.b $24 ; $
		dc.b $D5 ; Õ
		dc.b $3A ; :
		dc.b $6F ; o
		dc.b $92 ; ’
		dc.b $70 ; p
		dc.b $6A ; j
		dc.b $DA ; Ú
		dc.b $B6 ; ¶
		dc.b $AD ; ­
		dc.b $B0 ; °
		dc.b $E8 ; è
		dc.b $4C ; L
		dc.b $33 ; 3
		dc.b $E1 ; á
		dc.b $9E ; ž
		dc.b $AB ; «
		dc.b $F3 ; ó
		dc.b $D6 ; Ö
		dc.b $DF ; ß
		dc.b $A1 ; ¡
		dc.b $A9 ; ©
		dc.b $BF ; ¿
		dc.b $43 ; C
		dc.b $55 ; U
		dc.b $F9 ; ù
		dc.b $FF
		dc.b $A4 ; ¤
		dc.b $83 ; ƒ
		dc.b $7C ; |
		dc.b $92 ; ’
		dc.b $4A ; J
		dc.b $1D
		dc.b $FF
		dc.b $F0 ; ð
		dc.b $92 ; ’
		dc.b $49 ; I
		dc.b $24 ; $
		dc.b $9A ; š
		dc.b $92 ; ’
		dc.b $BC ; ¼
		dc.b $F7 ; ÷
		dc.b $AF ; ¯
		dc.b $E8 ; è
		dc.b $5A ; Z
		dc.b $1F
		dc.b $A1 ; ¡
		dc.b $68 ; h
		dc.b $67 ; g
		dc.b $BE ; ¾
		dc.b $88 ; ˆ
		dc.b $1B
		dc.b   6
		dc.b $AD ; ­
		dc.b $AB ; «
		dc.b $62 ; b
		dc.b $49 ; I
		dc.b $AE ; ®
		dc.b $FE ; þ
		dc.b $3E ; >
		dc.b $80 ; €
		dc.b $DF ; ß
		dc.b $B1 ; ±
		dc.b $A5 ; ¥
		dc.b $FF
		dc.b $B1 ; ±
		dc.b $A5 ; ¥
		dc.b $FF
		dc.b $A1 ; ¡
		dc.b $AA ; ª
		dc.b $F4 ; ô
		dc.b $C1 ; Á
		dc.b $89 ; ‰
		dc.b $FF
		dc.b $97 ; —
		dc.b $FC ; ü
		dc.b $A4 ; ¤
		dc.b $F9 ; ù
		dc.b $3E ; >
		dc.b $4F ; O
		dc.b $93 ; “
		dc.b $F7 ; ÷
		dc.b $C2 ; Â
		dc.b   4
		dc.b   8
		dc.b $10
		dc.b $A4 ; ¤
		dc.b $FF
		dc.b $A2 ; ¢
		dc.b $39 ; 9
		dc.b $BF ; ¿
		dc.b $AD ; ­
		dc.b $6F ; o
		dc.b $F4 ; ô
		dc.b $87 ; ‡
		dc.b $F8 ; ø
		dc.b $84 ; „
		dc.b $9F ; Ÿ
		dc.b $27 ; '
		dc.b $EA ; ê
		dc.b $E6 ; æ
		dc.b $1F
		dc.b $C1 ; Á
		dc.b $5E ; ^
		dc.b $60 ; `
		dc.b $81 ; 
		dc.b   2
		dc.b $7E ; ~
		dc.b $7E ; ~
		dc.b $B4 ; ´
		dc.b $C1 ; Á
		dc.b $93 ; “
		dc.b   6
		dc.b   9
		dc.b $6F ; o
		dc.b $ED ; í
		dc.b $D8 ; Ø
		dc.b $25 ; %
		dc.b $CC ; Ì
		dc.b $1A
		dc.b $D8 ; Ø
		dc.b $25 ; %
		dc.b $C2 ; Â
		dc.b $DA ; Ú
		dc.b $91 ; ‘
		dc.b $E4 ; ä
		dc.b $98 ; ˜
		dc.b $69 ; i
		dc.b $FE ; þ
		dc.b $AE ; ®
		dc.b $AC ; ¬
		dc.b $25 ; %
		dc.b $55 ; U
		dc.b $D2 ; Ò
		dc.b $8D ; 
		dc.b $2E ; .
		dc.b $11
		dc.b $A5 ; ¥
		dc.b $C2 ; Â
		dc.b $21 ; !
		dc.b $96 ; –
		dc.b $E1 ; á
		dc.b $10
		dc.b $CB ; Ë
		dc.b $70 ; p
		dc.b $88 ; ˆ
		dc.b $60 ; `
		dc.b $D7 ; ×
		dc.b   8
		dc.b $86 ; †
		dc.b  $D
		dc.b  $E
		dc.b $3C ; <
		dc.b $FF
		dc.b $F2 ; ò
		dc.b $E3 ; ã
		dc.b $7C ; |
		dc.b $9F ; Ÿ
		dc.b $27 ; '
		dc.b $C9 ; É
		dc.b $F2 ; ò
		dc.b $DF ; ß
		dc.b $40 ; @
		dc.b $81 ; 
		dc.b   2
		dc.b $18
		dc.b $23 ; #
		dc.b $EA ; ê
		dc.b $4B ; K
		dc.b $85 ; …
		dc.b $B0 ; °
		dc.b $68 ; h
		dc.b $DA ; Ú
		dc.b $FB ; û
		dc.b $61 ; a
		dc.b $2A ; *
		dc.b $D2 ; Ò
		dc.b $32 ; 2
		dc.b $BA ; º
		dc.b $B8 ; ¸
		dc.b $8B ; ‹
		dc.b $A0 ;  
		dc.b $8C ; Œ
		dc.b $22 ; "
		dc.b $2E ; .
		dc.b $A3 ; £
		dc.b   8
		dc.b $8B ; ‹
		dc.b $95 ; •
		dc.b $83 ; ƒ
		dc.b   8
		dc.b $8B ; ‹
		dc.b $95 ; •
		dc.b $83 ; ƒ
		dc.b   8
		dc.b $8B ; ‹
		dc.b $A5 ; ¥
		dc.b $BC ; ¼
		dc.b $1B
		dc.b $9E ; ž
		dc.b $4D ; M
		dc.b   6
		dc.b $78 ; x
		dc.b $E6 ; æ
		dc.b $FE ; þ
		dc.b $B0 ; °
		dc.b $9F ; Ÿ
		dc.b $F4 ; ô
		dc.b $49 ; I
		dc.b $23 ; #
		dc.b $49 ; I
		dc.b $FF
		dc.b $BE ; ¾
		dc.b $FF
		dc.b $16
		dc.b $FE ; þ
		dc.b $FB ; û
		dc.b $DC ; Ü
		dc.b $F7 ; ÷
		dc.b $3D ; =
		dc.b $DA ; Ú
		dc.b $F9 ; ù
		dc.b  $E
		dc.b $43 ; C
		dc.b $90 ; 
		dc.b $E4 ; ä
		dc.b $3F ; ?
		dc.b $D3 ; Ó
		dc.b $1F
		dc.b $FB ; û
		dc.b $EF ; ï
		dc.b $F1 ; ñ
		dc.b $6F ; o
		dc.b $EF ; ï
		dc.b $FF
		dc.b $DF ; ß
		dc.b $FD ; ý
		dc.b $C3 ; Ã
		dc.b $FC ; ü
		dc.b $4E ; N
		dc.b $87 ; ‡
		dc.b  $A
		dc.b $B7 ; ·
		dc.b $55 ; U
		dc.b $65 ; e
		dc.b $76 ; v
		dc.b $57 ; W
		dc.b $BA ; º
		dc.b $9C ; œ
		dc.b   9
		dc.b  $E
		dc.b $AA ; ª
		dc.b $CA ; Ê
		dc.b $B7 ; ·
		dc.b $57 ; W
		dc.b $65 ; e
		dc.b $76 ; v
		dc.b  $D
		dc.b $D4 ; Ô
		dc.b $E0 ; à
		dc.b $1C
		dc.b $4D ; M
		dc.b $38 ; 8
		dc.b  $B
		dc.b $16
		dc.b $CA ; Ê
		dc.b $EC ; ì
		dc.b $AF ; ¯
		dc.b $70 ; p
		dc.b $76 ; v
		dc.b $16
		dc.b   7
		dc.b $51 ; Q
		dc.b $C4 ; Ä
		dc.b $EE ; î
		dc.b $1F
		dc.b $EC ; ì
		dc.b $5F ; _
		dc.b $EE ; î
		dc.b $2D ; -
		dc.b $82 ; ‚
		dc.b $C8 ; È
		dc.b $58 ; X
		dc.b $2C ; ,
		dc.b $87 ; ‡
		dc.b $F7 ; ÷
		dc.b   7
		dc.b   2
		dc.b $46 ; F
		dc.b $EA ; ê
		dc.b $F7 ; ÷
		dc.b $13
		dc.b $56 ; V
		dc.b $EA ; ê
		dc.b $6E ; n
		dc.b $27 ; '
		dc.b  $F
		dc.b $E6 ; æ
		dc.b $42 ; B
		dc.b $C1 ; Á
		dc.b $61 ; a
		dc.b $26 ; &
		dc.b $A7 ; §
		dc.b $13
		dc.b $57 ; W
		dc.b  $A
		dc.b $B7 ; ·
		dc.b  $B
		dc.b $16
		dc.b $C5 ; Å
		dc.b $B1 ; ±
		dc.b $6C ; l
		dc.b $AF ; ¯
		dc.b $75 ; u
		dc.b $38 ; 8
		dc.b $13
		dc.b $4E ; N
		dc.b $15
		dc.b $59 ; Y
		dc.b $5D ; ]
		dc.b $95 ; •
		dc.b $B8 ; ¸
		dc.b $3A ; :
		dc.b $BB ; »
		dc.b $28 ; (
		dc.b $E5 ; å
		dc.b $71 ; q
		dc.b $23 ; #
		dc.b $80 ; €
		dc.b $74 ; t
		dc.b $37 ; 7
		dc.b $2B ; +
		dc.b $96 ; –
		dc.b $C8 ; È
		dc.b $58 ; X
		dc.b $2C ; ,
		dc.b $A3 ; £
		dc.b $86 ; †
		dc.b $EA ; ê
		dc.b $70 ; p
		dc.b  $E
		dc.b $26 ; &
		dc.b  $E
		dc.b $5B ; [
		dc.b $15
		dc.b $CB ; Ë
		dc.b $C0 ; À
		dc.b $3A ; :
		dc.b $16
		dc.b $57 ; W
		dc.b $61 ; a
		dc.b $83 ; ƒ
		dc.b $83 ; ƒ
		dc.b $95 ; •
		dc.b $C4 ; Ä
		dc.b $8D ; 
		dc.b $C1 ; Á
		dc.b $CB ; Ë
		dc.b $60 ; `
		dc.b $72 ; r
		dc.b $B8 ; ¸
		dc.b $E1 ; á
		dc.b $60 ; `
		dc.b $70 ; p
		dc.b $74 ; t
		dc.b $1C
		dc.b $37 ; 7
		dc.b   7
		dc.b $2B ; +
		dc.b $89 ; ‰
		dc.b $87 ; ‡
		dc.b  $A
		dc.b $AC ; ¬
		dc.b $5B ; [
		dc.b $16
		dc.b $C5 ; Å
		dc.b $B1 ; ±
		dc.b $5C ; \
		dc.b $1D
		dc.b $5D ; ]
		dc.b $94 ; ”
		dc.b $72 ; r
		dc.b $B8 ; ¸
		dc.b $9A ; š
		dc.b $6E ; n
		dc.b $A3 ; £
		dc.b $83 ; ƒ
		dc.b $83 ; ƒ
		dc.b $95 ; •
		dc.b $C1 ; Á
		dc.b $C4 ; Ä
		dc.b $93 ; “
		dc.b $55 ; U
		dc.b $8B ; ‹
		dc.b $65 ; e
		dc.b $2C ; ,
		dc.b $A9 ; ©
		dc.b $D8 ; Ø
		dc.b $38 ; 8
		dc.b $92 ; ’
		dc.b $49 ; I
		dc.b $24 ; $
		dc.b $9C ; œ
		dc.b $1C
		dc.b $AE ; ®
		dc.b $A7 ; §
		dc.b   3
		dc.b $4E ; N
		dc.b $10
		dc.b $70 ; p
		dc.b $B0 ; °
		dc.b $38 ; 8
		dc.b $AD ; ­
		dc.b $84 ; „
		dc.b $87 ; ‡
		dc.b   7
		dc.b $1A
		dc.b $38 ; 8
		dc.b $38 ; 8
		dc.b $D1 ; Ñ
		dc.b $C1 ; Á
		dc.b $C6 ; Æ
		dc.b $8E ; Ž
		dc.b  $E
		dc.b $57 ; W
		dc.b $56 ; V
		dc.b $EA ; ê
		dc.b $AC ; ¬
		dc.b $A7 ; §
		dc.b $F7 ; ÷
		dc.b  $C
		dc.b $38 ; 8
		dc.b $41 ; A
		dc.b $C2 ; Â
		dc.b $C0 ; À
		dc.b $E2 ; â
		dc.b $B6 ; ¶
		dc.b $12
		dc.b $6C ; l
		dc.b  $E
		dc.b $A5 ; ¥
		dc.b $81 ; 
		dc.b $C4 ; Ä
		dc.b $95 ; •
		dc.b $B0 ; °
		dc.b $D6 ; Ö
		dc.b $E1 ; á
		dc.b $60 ; `
		dc.b $74 ; t
		dc.b $38 ; 8
		dc.b $1A
		dc.b $AC ; ¬
		dc.b $35 ; 5
		dc.b $38 ; 8
		dc.b $38 ; 8
		dc.b $93 ; “
		dc.b $47 ; G
		dc.b  $D
		dc.b $C4 ; Ä
		dc.b $9A ; š
		dc.b $9C ; œ
		dc.b $AE ; ®
		dc.b $5D ; ]
		dc.b $CA ; Ê
		dc.b $E2 ; â
		dc.b $6A ; j
		dc.b $B0 ; °
		dc.b $C2 ; Â
		dc.b $C3 ; Ã
		dc.b $C2 ; Â
		dc.b $9C ; œ
		dc.b   9
		dc.b $34 ; 4
		dc.b $DD ; Ý
		dc.b $55 ; U
		dc.b $81 ; 
		dc.b $CB ; Ë
		dc.b $61 ; a
		dc.b $35 ; 5
		dc.b $D8 ; Ø
		dc.b $6B ; k
		dc.b $70 ; p
		dc.b $B0 ; °
		dc.b $3A ; :
		dc.b $1C
		dc.b  $D
		dc.b $76 ; v
		dc.b $54 ; T
		dc.b $E0 ; à
		dc.b $EA ; ê
		dc.b $38 ; 8
		dc.b $38 ; 8
		dc.b $9A ; š
		dc.b $38 ; 8
		dc.b $3B ; ;
		dc.b  $D
		dc.b $D5 ; Õ
		dc.b $58 ; X
		dc.b $1C
		dc.b $49 ; I
		dc.b $25 ; %
		dc.b $5C ; \
		dc.b $2C ; ,
		dc.b  $E
		dc.b $87 ; ‡
		dc.b   3
		dc.b  $F
		dc.b $EE ; î
		dc.b $52 ; R
		dc.b $C3 ; Ã
		dc.b $4B ; K
		dc.b   3
		dc.b $83 ; ƒ
		dc.b $89 ; ‰
		dc.b $34 ; 4
		dc.b $70 ; p
		dc.b $71 ; q
		dc.b $24 ; $
		dc.b $93 ; “
		dc.b $55 ; U
		dc.b $86 ; †
		dc.b $AE ; ®
		dc.b $10
		dc.b $70 ; p
		dc.b $B0 ; °
		dc.b $38 ; 8
		dc.b $92 ; ’
		dc.b $AE ; ®
		dc.b $57 ; W
		dc.b   7
		dc.b $52 ; R
		dc.b $CA ; Ê
		dc.b $DC ; Ü
		dc.b $AE ; ®
		dc.b $57 ; W
		dc.b $12
		dc.b $70 ; p
		dc.b $71 ; q
		dc.b $16
		dc.b   7
		dc.b $43 ; C
		dc.b $85 ; …
		dc.b $3F ; ?
		dc.b $99 ; ™
		dc.b  $D
		dc.b $C4 ; Ä
		dc.b $E0 ; à
		dc.b $E0 ; à
		dc.b $EA ; ê
		dc.b $38 ; 8
		dc.b $3A ; :
		dc.b $8E ; Ž
		dc.b  $E
		dc.b $AA ; ª
		dc.b $C2 ; Â
		dc.b $49 ; I
		dc.b $24 ; $
		dc.b $D5 ; Õ
		dc.b $FD ; ý
		dc.b $C1 ; Á
		dc.b $3F ; ?
		dc.b $E9 ; é
		dc.b $7E ; ~
		dc.b $BB ; »
		dc.b $F6 ; ö
		dc.b $5B ; [
		dc.b $43 ; C
		dc.b $85 ; …
		dc.b $81 ; 
		dc.b $C4 ; Ä
		dc.b $92 ; ’
		dc.b $AE ; ®
		dc.b $16
		dc.b   7
		dc.b  $D
		dc.b $BF ; ¿
		dc.b $B2 ; ²
		dc.b $FE ; þ
		dc.b $77 ; w
		dc.b $1F
		dc.b $EB ; ë
		dc.b $95 ; •
		dc.b $D8 ; Ø
		dc.b $38 ; 8
		dc.b $93 ; “
		dc.b $83 ; ƒ
		dc.b $95 ; •
		dc.b $CB ; Ë
		dc.b $B7 ; ·
		dc.b $F6 ; ö
		dc.b $5F ; _
		dc.b $BE ; ¾
		dc.b $FD ; ý
		dc.b $96 ; –
		dc.b $D0 ; Ð
		dc.b $E1 ; á
		dc.b $60 ; `
		dc.b $71 ; q
		dc.b $5B ; [
		dc.b   3
		dc.b $83 ; ƒ
		dc.b $A8 ; ¨
		dc.b $E0 ; à
		dc.b $EA ; ê
		dc.b $38 ; 8
		dc.b $3A ; :
		dc.b $8E ; Ž
		dc.b $5D ; ]
		dc.b $C2 ; Â
		dc.b $7F ; 
		dc.b $D2 ; Ò
		dc.b $FD ; ý
		dc.b $77 ; w
		dc.b $EC ; ì
		dc.b $B6 ; ¶
		dc.b $87 ; ‡
		dc.b  $B
		dc.b   3
		dc.b $96 ; –
		dc.b $C3 ; Ã
		dc.b $60 ; `
		dc.b $75 ; u
		dc.b $2C ; ,
		dc.b  $E
		dc.b $5B ; [
		dc.b $2B ; +
		dc.b $70 ; p
		dc.b $B0 ; °
		dc.b $38 ; 8
		dc.b $6D ; m
		dc.b $FD ; ý
		dc.b $97 ; —
		dc.b $F7 ; ÷
		dc.b $B8 ; ¸
		dc.b $F6 ; ö
		dc.b $C1 ; Á
		dc.b $C6 ; Æ
		dc.b $BB ; »
		dc.b $2A ; *
		dc.b $71 ; q
		dc.b  $E
		dc.b $57 ; W
		dc.b $2E ; .
		dc.b $E5 ; å
		dc.b $70 ; p
		dc.b $FD ; ý
		dc.b $F7 ; ÷
		dc.b $1F
		dc.b $EB ; ë
		dc.b $BF ; ¿
		dc.b $A5 ; ¥
		dc.b $38 ; 8
		dc.b $70 ; p
		dc.b $A6 ; ¦
		dc.b $E8 ; è
		dc.b $70 ; p
		dc.b  $E
		dc.b $2B ; +
		dc.b $65 ; e
		dc.b $6E ; n
		dc.b $16
		dc.b   7
		dc.b  $D
		dc.b $BF ; ¿
		dc.b $B2 ; ²
		dc.b $FD ; ý
		dc.b $F7 ; ÷
		dc.b $EC ; ì
		dc.b $B6 ; ¶
		dc.b $87 ; ‡
		dc.b  $B
		dc.b   3
		dc.b $AB ; «
		dc.b $B2 ; ²
		dc.b $9B ; ›
		dc.b $AA ; ª
		dc.b $B0 ; °
		dc.b $38 ; 8
		dc.b $AB ; «
		dc.b $85 ; …
		dc.b $81 ; 
		dc.b $C3 ; Ã
		dc.b $6F ; o
		dc.b $EC ; ì
		dc.b $BF ; ¿
		dc.b $5D ; ]
		dc.b $FD ; ý
		dc.b $29 ; )
		dc.b $8E ; Ž
		dc.b $18
		dc.b $38 ; 8
		dc.b $3A ; :
		dc.b $8E ; Ž
		dc.b  $E
		dc.b $24 ; $
		dc.b $AF ; ¯
		dc.b $EB ; ë
		dc.b $B8 ; ¸
		dc.b $FF
		dc.b $9D ; 
		dc.b $FB ; û
		dc.b $2D ; -
		dc.b $A1 ; ¡
		dc.b $C2 ; Â
		dc.b $C0 ; À
		dc.b $E2 ; â
		dc.b $AE ; ®
		dc.b $16
		dc.b   7
		dc.b $2B ; +
		dc.b $85 ; …
		dc.b $81 ; 
		dc.b $C5 ; Å
		dc.b $5C ; \
		dc.b $2C ; ,
		dc.b  $E
		dc.b $1B
		dc.b $7F ; 
		dc.b $65 ; e
		dc.b $FB ; û
		dc.b $EF ; ï
		dc.b $D9 ; Ù
		dc.b $6D ; m
		dc.b  $E
		dc.b $16
		dc.b   7
		dc.b $15
		dc.b $70 ; p
		dc.b $B2 ; ²
		dc.b $AD ; ­
		dc.b $C6 ; Æ
		dc.b $AD ; ­
		dc.b $C1 ; Á
		dc.b $C3 ; Ã
		dc.b $6F ; o
		dc.b $EC ; ì
		dc.b $B6 ; ¶
		dc.b $8D ; 
		dc.b $BC ; ¼
		dc.b $7F ; 
		dc.b $AE ; ®
		dc.b $57 ; W
		dc.b $60 ; `
		dc.b $E2 ; â
		dc.b $4E ; N
		dc.b  $E
		dc.b $57 ; W
		dc.b $42 ; B
		dc.b $7F ; 
		dc.b $B2 ; ²
		dc.b $DA ; Ú
		dc.b $27 ; '
		dc.b $FB ; û
		dc.b $2D ; -
		dc.b $A1 ; ¡
		dc.b $C2 ; Â
		dc.b $C0 ; À
		dc.b $E2 ; â
		dc.b $B6 ; ¶
		dc.b   7
		dc.b   7
		dc.b $51 ; Q
		dc.b $C1 ; Á
		dc.b $D4 ; Ô
		dc.b $70 ; p
		dc.b $75 ; u
		dc.b $1C
		dc.b $BB ; »
		dc.b $97 ; —
		dc.b $FA ; ú
		dc.b $53 ; S
		dc.b $13
		dc.b $FD ; ý
		dc.b $96 ; –
		dc.b $D0 ; Ð
		dc.b $E1 ; á
		dc.b $60 ; `
		dc.b $72 ; r
		dc.b $D8 ; Ø
		dc.b $6C ; l
		dc.b  $E
		dc.b $A5 ; ¥
		dc.b $81 ; 
		dc.b $CB ; Ë
		dc.b $65 ; e
		dc.b $6E ; n
		dc.b $16
		dc.b   7
		dc.b $2C ; ,
		dc.b $FF
		dc.b $65 ; e
		dc.b $B4 ; ´
		dc.b $7E ; ~
		dc.b $BB ; »
		dc.b $8F ; 
		dc.b $6C ; l
		dc.b $1C
		dc.b $6B ; k
		dc.b $B2 ; ²
		dc.b $A7 ; §
		dc.b $10
		dc.b $E5 ; å
		dc.b $72 ; r
		dc.b $EE ; î
		dc.b $57 ; W
		dc.b $2F ; /
		dc.b $EB ; ë
		dc.b $B8 ; ¸
		dc.b $F6 ; ö
		dc.b $8F ; 
		dc.b $E9 ; é
		dc.b $4E ; N
		dc.b $1C
		dc.b $29 ; )
		dc.b $BA ; º
		dc.b $1C
		dc.b   3
		dc.b $8A ; Š
		dc.b $D9 ; Ù
		dc.b $5B ; [
		dc.b $85 ; …
		dc.b $81 ; 
		dc.b $CB ; Ë
		dc.b $3F ; ?
		dc.b $D9 ; Ù
		dc.b $6D ; m
		dc.b $13
		dc.b $FD ; ý
		dc.b $96 ; –
		dc.b $D0 ; Ð
		dc.b $E1 ; á
		dc.b $60 ; `
		dc.b $75 ; u
		dc.b $76 ; v
		dc.b $53 ; S
		dc.b $75 ; u
		dc.b $56 ; V
		dc.b   7
		dc.b $15
		dc.b $70 ; p
		dc.b $B0 ; °
		dc.b $39 ; 9
		dc.b $67 ; g
		dc.b $FB ; û
		dc.b $2D ; -
		dc.b $A3 ; £
		dc.b $FA ; ú
		dc.b $53 ; S
		dc.b $1C
		dc.b $30 ; 0
		dc.b $70 ; p
		dc.b $75 ; u
		dc.b $1C
		dc.b $1C
		dc.b $49 ; I
		dc.b $86 ; †
		dc.b $DE ; Þ
		dc.b $3F ; ?
		dc.b $D7 ; ×
		dc.b   9
		dc.b $FE ; þ
		dc.b $CB ; Ë
		dc.b $68 ; h
		dc.b $70 ; p
		dc.b $B0 ; °
		dc.b $38 ; 8
		dc.b $AB ; «
		dc.b $85 ; …
		dc.b $81 ; 
		dc.b $CA ; Ê
		dc.b $E1 ; á
		dc.b $60 ; `
		dc.b $71 ; q
		dc.b $57 ; W
		dc.b  $B
		dc.b   3
		dc.b $96 ; –
		dc.b $7F ; 
		dc.b $B2 ; ²
		dc.b $DA ; Ú
		dc.b $27 ; '
		dc.b $FB ; û
		dc.b $2D ; -
		dc.b $A1 ; ¡
		dc.b $C2 ; Â
		dc.b $C0 ; À
		dc.b $E2 ; â
		dc.b $AE ; ®
		dc.b $16
		dc.b $55 ; U
		dc.b $B8 ; ¸
		dc.b $D5 ; Õ
		dc.b $B8 ; ¸
		dc.b $38 ; 8
		dc.b $4C ; L
		dc.b $70 ; p
		dc.b $26 ; &
		dc.b $AB ; «
		dc.b  $D
		dc.b $85 ; …
		dc.b $C4 ; Ä
		dc.b $C3 ; Ã
		dc.b $84 ; „
		dc.b $49 ; I
		dc.b $25 ; %
		dc.b $C6 ; Æ
		dc.b $C2 ; Â
		dc.b $EA ; ê
		dc.b $70 ; p
		dc.b $84 ; „
		dc.b $C9 ; É
		dc.b $1F
		dc.b $CC ; Ì
		dc.b $2E ; .
		dc.b $84 ; „
		dc.b $77 ; w
		dc.b $1A
		dc.b $47 ; G
		dc.b $74 ; t
		dc.b $3F ; ?
		dc.b $B8 ; ¸
		dc.b $4A ; J
		dc.b $BA ; º
		dc.b $64 ; d
		dc.b $93 ; “
		dc.b $5B ; [
		dc.b $A6 ; ¦
		dc.b $49 ; I
		dc.b $B2 ; ²
		dc.b $A7 ; §
		dc.b $2B ; +
		dc.b $A0 ;  
		dc.b $E1 ; á
		dc.b $60 ; `
		dc.b $74 ; t
		dc.b $22 ; "
		dc.b $B1 ; ±
		dc.b $A4 ; ¤
		dc.b $6C ; l
		dc.b $8C ; Œ
		dc.b $3F ; ?
		dc.b $B8 ; ¸
		dc.b $4A ; J
		dc.b $BA ; º
		dc.b $6B ; k
		dc.b $37 ; 7
		dc.b $13
		dc.b   8
		dc.b $AC ; ¬
		dc.b $60 ; `
		dc.b $E1 ; á
		dc.b $60 ; `
		dc.b $74 ; t
		dc.b $38 ; 8
		dc.b $13
		dc.b $4E ; N
		dc.b   6
		dc.b $8E ; Ž
		dc.b $57 ; W
		dc.b $13
		dc.b $55 ; U
		dc.b $84 ; „
		dc.b $D1 ; Ñ
		dc.b $D3 ; Ó
		dc.b $59 ; Y
		dc.b $BA ; º
		dc.b $11
		dc.b $33 ; 3
		dc.b $AF ; ¯
		dc.b $8C ; Œ
		dc.b $CE ; Î
		dc.b $8E ; Ž
		dc.b $9B ; ›
		dc.b $B6 ; ¶
		dc.b $B8 ; ¸
		dc.b $98 ; ˜
		dc.b $70 ; p
		dc.b $83 ; ƒ
		dc.b $A8 ; ¨
		dc.b $E8 ; è
		dc.b $47 ; G
		dc.b $71 ; q
		dc.b $75 ; u
		dc.b $5B ; [
		dc.b $A1 ; ¡
		dc.b $17
		dc.b $2B ; +
		dc.b $A1 ; ¡
		dc.b $1D
		dc.b $C4 ; Ä
		dc.b $C1 ; Á
		dc.b $D3 ; Ó
		dc.b $24 ; $
		dc.b $D6 ; Ö
		dc.b $E9 ; é
		dc.b $9C ; œ
		dc.b $23 ; #
		dc.b $C0 ; À
		dc.b $AF ; ¯
		dc.b $F7 ; ÷
		dc.b   9
		dc.b $2B ; +
		dc.b $FD ; ý
		dc.b $C8 ; È
		dc.b $46 ; F
		dc.b $C8 ; È
		dc.b $93 ; “
		dc.b   7
		dc.b $4D ; M
		dc.b $66 ; f
		dc.b $E2 ; â
		dc.b $4D ; M
		dc.b $2C ; ,
		dc.b $24 ; $
		dc.b $D7 ; ×
		dc.b $61 ; a
		dc.b $26 ; &
		dc.b $BB ; »
		dc.b  $D
		dc.b $4E ; N
		dc.b $57 ; W
		dc.b $1A
		dc.b $70 ; p
		dc.b $24 ; $
		dc.b $C1 ; Á
		dc.b $DB ; Û
		dc.b $5D ; ]
		dc.b $37 ; 7
		dc.b $52 ; R
		dc.b $62 ; b
		dc.b $35 ; 5
		dc.b $C7 ; Ç
		dc.b   9
		dc.b $C6 ; Æ
		dc.b  $E
		dc.b $9A ; š
		dc.b $CD ; Í
		dc.b $C4 ; Ä
		dc.b $95 ; •
		dc.b $74 ; t
		dc.b $C6 ; Æ
		dc.b $EA ; ê
		dc.b $AC ; ¬
		dc.b $A4 ; ¤
		dc.b $77 ; w
		dc.b $41 ; A
		dc.b $D4 ; Ô
		dc.b $74 ; t
		dc.b $38 ; 8
		dc.b $12
		dc.b $49 ; I
		dc.b $26 ; &
		dc.b $BD ; ½
		dc.b $C4 ; Ä
		dc.b $9A ; š
		dc.b $B7 ; ·
		dc.b $4C ; L
		dc.b $92 ; ’
		dc.b $37 ; 7
		dc.b $12
		dc.b $6A ; j
		dc.b $DD ; Ý
		dc.b   9
		dc.b $92 ; ’
		dc.b $1D
		dc.b $35 ; 5
		dc.b $9B ; ›
		dc.b $89 ; ‰
		dc.b $25 ; %
		dc.b $5D ; ]
		dc.b $35 ; 5
		dc.b $9B ; ›
		dc.b $89 ; ‰
		dc.b $87 ; ‡
		dc.b   8
		dc.b $3A ; :
		dc.b $8E ; Ž
		dc.b $84 ; „
		dc.b $78 ; x
		dc.b $15
		dc.b $E3 ; ã
		dc.b $DD ; Ý
		dc.b $35 ; 5
		dc.b $9F ; Ÿ
		dc.b   9
		dc.b $92 ; ’
		dc.b $BF ; ¿
		dc.b $DC ; Ü
		dc.b $30 ; 0
		dc.b $8F ; 
		dc.b   3
		dc.b   8
		dc.b $EE ; î
		dc.b $87 ; ‡
		dc.b $F3 ; ó
		dc.b   9
		dc.b $87 ; ‡
		dc.b   9
		dc.b $E1 ; á
		dc.b $19
		dc.b $C2 ; Â
		dc.b $2E ; .
		dc.b $FD ; ý
		dc.b $15
		dc.b $53 ; S
		dc.b $24 ; $
		dc.b $D5 ; Õ
		dc.b $1B
		dc.b $23 ; #
		dc.b   7
		dc.b $51 ; Q
		dc.b $D0 ; Ð
		dc.b $E0 ; à
		dc.b $49 ; I
		dc.b $C2 ; Â
		dc.b $6E ; n
		dc.b $2B ; +
		dc.b $C2 ; Â
		dc.b $30 ; 0
		dc.b $75 ; u
		dc.b $1D
		dc.b  $E
		dc.b   4
		dc.b $98 ; ˜
		dc.b $3A ; :
		dc.b $6B ; k
		dc.b $37 ; 7
		dc.b $55 ; U
		dc.b $3A ; :
		dc.b $A2 ; ¢
		dc.b $EF ; ï
		dc.b $D1 ; Ñ
		dc.b $57 ; W
		dc.b $19
		dc.b $AF ; ¯
		dc.b   9
		dc.b $92 ; ’
		dc.b $49 ; I
		dc.b $26 ; &
		dc.b $BE ; ¾
		dc.b   4
		dc.b $9A ; š
		dc.b $6E ; n
		dc.b $89 ; ‰
		dc.b $27 ; '
		dc.b $81 ; 
		dc.b $26 ; &
		dc.b $9C ; œ
		dc.b $21 ; !
		dc.b $32 ; 2
		dc.b $47 ; G
		dc.b $F7 ; ÷
		dc.b  $A
		dc.b $D8 ; Ø
		dc.b $B6 ; ¶
		dc.b $13
		dc.b $4B ; K
		dc.b   9
		dc.b $AA ; ª
		dc.b $76 ; v
		dc.b $4E ; N
		dc.b $13
		dc.b $8A ; Š
		dc.b $C6 ; Æ
		dc.b $6B ; k
		dc.b $C7 ; Ç
		dc.b $67 ; g
		dc.b $19
		dc.b $24 ; $
		dc.b $AF ; ¯
		dc.b $1D
		dc.b $9C ; œ
		dc.b $6B ; k
		dc.b $38 ; 8
		dc.b $AC ; ¬
		dc.b $67 ; g
		dc.b   9
		dc.b $D9 ; Ù
		dc.b $32 ; 2
		dc.b $49 ; I
		dc.b $26 ; &
		dc.b $9C ; œ
		dc.b $20
		dc.b $EA ; ê
		dc.b $3A ; :
		dc.b $11
		dc.b $B2 ; ²
		dc.b $38 ; 8
		dc.b $4D ; M
		dc.b $C4 ; Ä
		dc.b $D7 ; ×
		dc.b $37 ; 7
		dc.b $42 ; B
		dc.b $36 ; 6
		dc.b $46 ; F
		dc.b  $E
		dc.b $A3 ; £
		dc.b $A1 ; ¡
		dc.b $C0 ; À
		dc.b $92 ; ’
		dc.b $49 ; I
		dc.b $A7 ; §
		dc.b   8
		dc.b $3A ; :
		dc.b $11
		dc.b $74 ; t
		dc.b $23 ; #
		dc.b $61 ; a
		dc.b $9B ; ›
		dc.b $8A ; Š
		dc.b $BA ; º
		dc.b $64 ; d
		dc.b $D6 ; Ö
		dc.b $E9 ; é
		dc.b $AC ; ¬
		dc.b $DC ; Ü
		dc.b $49 ; I
		dc.b $84 ; „
		dc.b $6C ; l
		dc.b $8C ; Œ
		dc.b $3F ; ?
		dc.b $B8 ; ¸
		dc.b $4A ; J
		dc.b $F0 ; ð
		dc.b $9E ; ž
		dc.b $11
		dc.b $9C ; œ
		dc.b $23 ; #
		dc.b $BA ; º
		dc.b $26 ; &
		dc.b $11
		dc.b $DC ; Ü
		dc.b $5D ; ]
		dc.b   8
		dc.b $D8 ; Ø
		dc.b $27 ; '
		dc.b $84 ; „
		dc.b $6B ; k
		dc.b $8C ; Œ
		dc.b $1D
		dc.b $35 ; 5
		dc.b $9B ; ›
		dc.b $89 ; ‰
		dc.b $24 ; $
		dc.b $91 ; ‘
		dc.b $C2 ; Â
		dc.b $78 ; x
		dc.b $46 ; F
		dc.b $62 ; b
		dc.b $62 ; b
		dc.b $3B ; ;
		dc.b $A2 ; ¢
		dc.b $22 ; "
		dc.b $44 ; D
		dc.b $77 ; w
		dc.b $43 ; C
		dc.b $FB ; û
		dc.b $81 ; 
		dc.b $C4 ; Ä
		dc.b $CE ; Î
		dc.b $C9 ; É
		dc.b $C1 ; Á
		dc.b $D1 ; Ñ
		dc.b $58 ; X
		dc.b $CC ; Ì
		dc.b $38 ; 8
		dc.b $46 ; F
		dc.b $CE ; Î
		dc.b $35 ; 5
		dc.b $89 ; ‰
		dc.b $33 ; 3
		dc.b $59 ; Y
		dc.b $B8 ; ¸
		dc.b $3A ; :
		dc.b $64 ; d
		dc.b $EE ; î
		dc.b $5D ; ]
		dc.b $D0 ; Ð
		dc.b $75 ; u
		dc.b $37 ; 7
		dc.b $42 ; B
		dc.b $2E ; .
		dc.b $83 ; ƒ
		dc.b $AA ; ª
		dc.b $DC ; Ü
		dc.b $B1 ; ±
		dc.b $70 ; p
		dc.b $DC ; Ü
		dc.b $37 ; 7
		dc.b $12
		dc.b $E9 ; é
		dc.b $D2 ; Ò
		dc.b $C1 ; Á
		dc.b $19
		dc.b $AB ; «
		dc.b $96 ; –
		dc.b $C8 ; È
		dc.b $87 ; ‡
		dc.b  $B
		dc.b $2A ; *
		dc.b $8A ; Š
		dc.b $D9 ; Ù
		dc.b   8
		dc.b $FF
		dc.b $30 ; 0
		dc.b $70 ; p
		dc.b $26 ; &
		dc.b  $E
		dc.b $9C ; œ
		dc.b $1D
		dc.b   8
		dc.b $D1 ; Ñ
		dc.b $D0 ; Ð
		dc.b $98 ; ˜
		dc.b $9C ; œ
		dc.b $61 ; a
		dc.b $74 ; t
		dc.b $67 ; g
		dc.b $C7 ; Ç
		dc.b $85 ; …
		dc.b $81 ; 
		dc.b $DC ; Ü
		dc.b $CE ; Î
		dc.b $9B ; ›
		dc.b $89 ; ‰
		dc.b $9B ; ›
		dc.b $83 ; ƒ
		dc.b $A7 ; §
		dc.b   8
		dc.b $C2 ; Â
		dc.b $26 ; &
		dc.b $62 ; b
		dc.b $77 ; w
		dc.b $42 ; B
		dc.b $E8 ; è
		dc.b $CE ; Î
		dc.b $27 ; '
		dc.b $99 ; ™
		dc.b $C1 ; Á
		dc.b $DC ; Ü
		dc.b $CE ; Î
		dc.b $9B ; ›
		dc.b $89 ; ‰
		dc.b $9B ; ›
		dc.b $87 ; ‡
		dc.b   1
		dc.b $12
		dc.b $AE ; ®
		dc.b $57 ; W
		dc.b  $B
		dc.b $8E ; Ž
		dc.b $1C
		dc.b $CE ; Î
		dc.b $5B ; [
		dc.b   9
		dc.b $57 ; W
		dc.b $4D ; M
		dc.b $66 ; f
		dc.b $E8 ; è
		dc.b $46 ; F
		dc.b $A7 ; §
		dc.b $2C ; ,
		dc.b $EB ; ë
		dc.b $E3 ; ã
		dc.b $33 ; 3
		dc.b $A3 ; £
		dc.b $A6 ; ¦
		dc.b $ED ; í
		dc.b $AE ; ®
		dc.b  $E
		dc.b $27 ; '
		dc.b $81 ; 
		dc.b $74 ; t
		dc.b $23 ; #
		dc.b $B8 ; ¸
		dc.b $BA ; º
		dc.b $AD ; ­
		dc.b $D0 ; Ð
		dc.b $8B ; ‹
		dc.b $AA ; ª
		dc.b $70 ; p
		dc.b $8D ; 
		dc.b $82 ; ‚
		dc.b $78 ; x
		dc.b $44 ; D
		dc.b $46 ; F
		dc.b $91 ; ‘
		dc.b $59 ; Y
		dc.b $BA ; º
		dc.b $6B ; k
		dc.b $37 ; 7
		dc.b $12
		dc.b $56 ; V
		dc.b $6B ; k
		dc.b $37 ; 7
		dc.b   7
		dc.b $4C ; L
		dc.b $C6 ; Æ
		dc.b $CE ; Î
		dc.b $35 ; 5
		dc.b $E3 ; ã
		dc.b $58 ; X
		dc.b $CC ; Ì
		dc.b $38 ; 8
		dc.b $4E ; N
		dc.b $C9 ; É
		dc.b $C1 ; Á
		dc.b $C4 ; Ä
		dc.b $91 ; ‘
		dc.b $B8 ; ¸
		dc.b $6E ; n
		dc.b $16
		dc.b $42 ; B
		dc.b $3C ; <
		dc.b  $B
		dc.b $A9 ; ©
		dc.b $B9 ; ¹
		dc.b $5D ; ]
		dc.b $32 ; 2
		dc.b $48 ; H
		dc.b $B1 ; ±
		dc.b $7F ; 
		dc.b $98 ; ˜
		dc.b $26 ; &
		dc.b $B1 ; ±
		dc.b $B1 ; ±
		dc.b $63 ; c
		dc.b $5C ; \
		dc.b $70 ; p
		dc.b $9B ; ›
		dc.b $83 ; ƒ
		dc.b $A6 ; ¦
		dc.b $49 ; I
		dc.b $5B ; [
		dc.b   3
		dc.b $A7 ; §
		dc.b $A1 ; ¡
		dc.b $DA ; Ú
		dc.b $23 ; #
		dc.b $4D ; M
		dc.b   3
		dc.b $45 ; E
		dc.b $6E ; n
		dc.b $22 ; "
		dc.b $6E ; n
		dc.b  $E
		dc.b $99 ; ™
		dc.b $26 ; &
		dc.b $13
		dc.b $70 ; p
		dc.b $74 ; t
		dc.b $F4 ; ô
		dc.b $3B ; ;
		dc.b $45 ; E
		dc.b $5A ; Z
		dc.b   6
		dc.b $8A ; Š
		dc.b $DC ; Ü
		dc.b $44 ; D
		dc.b $DC ; Ü
		dc.b $1D
		dc.b $32 ; 2
		dc.b $4C ; L
		dc.b $26 ; &
		dc.b $E5 ; å
		dc.b $B0 ; °
		dc.b $D4 ; Ô
		dc.b $E5 ; å
		dc.b $71 ; q
		dc.b $13
		dc.b $70 ; p
		dc.b $E0 ; à
		dc.b $49 ; I
		dc.b  $E
		dc.b $DA ; Ú
		dc.b $E9 ; é
		dc.b $B8 ; ¸
		dc.b $39 ; 9
		dc.b $66 ; f
		dc.b $23 ; #
		dc.b $5C ; \
		dc.b $70 ; p
		dc.b $9C ; œ
		dc.b $56 ; V
		dc.b $C9 ; É
		dc.b $AC ; ¬
		dc.b $DC ; Ü
		dc.b $49 ; I
		dc.b $59 ; Y
		dc.b $8D ; 
		dc.b $D5 ; Õ
		dc.b $59 ; Y
		dc.b $48 ; H
		dc.b $EE ; î
		dc.b $2E ; .
		dc.b $87 ; ‡
		dc.b   2
		dc.b $49 ; I
		dc.b $24 ; $
		dc.b $9D ; 
		dc.b $D4 ; Ô
		dc.b $E1 ; á
		dc.b  $B
		dc.b  $D
		dc.b $6E ; n
		dc.b $26 ; &
		dc.b $AF ; ¯
		dc.b $EE ; î
		dc.b   7
		dc.b $11
		dc.b $1E
		dc.b   6
		dc.b $11
		dc.b $DD ; Ý
		dc.b  $F
		dc.b $E6 ; æ
		dc.b $2B ; +
		dc.b $89 ; ‰
		dc.b $E0 ; à
		dc.b $B6 ; ¶
		dc.b $51 ; Q
		dc.b $D0 ; Ð
		dc.b $8E ; Ž
		dc.b $E8 ; è
		dc.b $44 ; D
		dc.b $C7 ; Ç
		dc.b $74 ; t
		dc.b $23 ; #
		dc.b $FC ; ü
		dc.b $C1 ; Á
		dc.b $61 ; a
		dc.b $3C ; <
		dc.b $20
		dc.b $EA ; ê
		dc.b $DC ; Ü
		dc.b $38 ; 8
		dc.b   7
		dc.b   7
		dc.b $57 ; W
		dc.b $11
		dc.b $BA ; º
		dc.b $11
		dc.b $E0 ; à
		dc.b $BB ; »
		dc.b $89 ; ‰
		dc.b $72 ; r
		dc.b $FF
		dc.b $30 ; 0
		dc.b $3A ; :
		dc.b $B7 ; ·
		dc.b  $D
		dc.b $CA ; Ê
		dc.b $E1 ; á
		dc.b $1A
		dc.b $DD ; Ý
		dc.b $1A
		dc.b $F7 ; ÷
		dc.b $2D ; -
		dc.b $84 ; „
		dc.b $87 ; ‡
		dc.b $42 ; B
		dc.b $76 ; v
		dc.b $4E ; N
		dc.b $13
		dc.b $8A ; Š
		dc.b $C5 ; Å
		dc.b $CB ; Ë
		dc.b $C7 ; Ç
		dc.b $64 ; d
		dc.b $49 ; I
		dc.b $83 ; ƒ
		dc.b $A6 ; ¦
		dc.b $B3 ; ³
		dc.b $25 ; %
		dc.b $5D ; ]
		dc.b $35 ; 5
		dc.b $9B ; ›
		dc.b $A6 ; ¦
		dc.b $B1 ; ±
		dc.b $A4 ; ¤
		dc.b $61 ; a
		dc.b $3A ; :
		dc.b $F8 ; ø
		dc.b $CC ; Ì
		dc.b $D5 ; Õ
		dc.b $CB ; Ë
		dc.b $37 ; 7
		dc.b $6D ; m
		dc.b $71 ; q
		dc.b $2B ; +
		dc.b $66 ; f
		dc.b $1F
		dc.b $CC ; Ì
		dc.b $A7 ; §
		dc.b   3
		dc.b $FF
		dc.b $EF ; ï
		dc.b $F7 ; ÷
		dc.b $18
		dc.b $38 ; 8
		dc.b $D9 ; Ù
		dc.b  $B
		dc.b $20
		dc.b $E5 ; å
		dc.b $FE ; þ
		dc.b $E1 ; á
		dc.b $5F ; _
		dc.b $F7 ; ÷
		dc.b   9
		dc.b $FF
		dc.b  $B
		dc.b $6A ; j
		dc.b $C6 ; Æ
		dc.b $C1 ; Á
		dc.b $3C ; <
		dc.b $23 ; #
		dc.b $5C ; \
		dc.b $60 ; `
		dc.b $E9 ; é
		dc.b $AC ; ¬
		dc.b $DC ; Ü
		dc.b $48 ; H
		dc.b $FF
		dc.b $F4 ; ô
		dc.b $47 ; G
		dc.b $F3 ; ó
		dc.b $A2 ; ¢
		dc.b $44 ; D
		dc.b $78 ; x
		dc.b $15
		dc.b $FE ; þ
		dc.b $E0 ; à
		dc.b $71 ; q
		dc.b $3F ; ?
		dc.b $FE ; þ
		dc.b $FD ; ý
		dc.b $96 ; –
		dc.b $D8 ; Ø
		dc.b $88 ; ˆ
		dc.b $EE ; î
		dc.b $30 ; 0
		dc.b $89 ; ‰
		dc.b $9D ; 
		dc.b $56 ; V
		dc.b $13
		dc.b $FF
		dc.b $EF ; ï
		dc.b $E7 ; ç
		dc.b $7E ; ~
		dc.b $8A ; Š
		dc.b $B8 ; ¸
		dc.b $FF
		dc.b $30 ; 0
		dc.b $D3 ; Ó
		dc.b $80 ; €
		dc.b $74 ; t
		dc.b $C9 ; É
		dc.b $1F
		dc.b $FE ; þ
		dc.b $FD ; ý
		dc.b $16
		dc.b $DE ; Þ
		dc.b $39 ; 9
		dc.b $BA ; º
		dc.b $24 ; $
		dc.b $E1 ; á
		dc.b $37 ; 7
		dc.b $2D ; -
		dc.b $84 ; „
		dc.b $8F ; 
		dc.b $FF
		dc.b $7E ; ~
		dc.b $BA ; º
		dc.b $23 ; #
		dc.b $69 ; i
		dc.b $A7 ; §
		dc.b $1D
		dc.b $91 ; ‘
		dc.b $84 ; „
		dc.b $E2 ; â
		dc.b $B1 ; ±
		dc.b $A4 ; ¤
		dc.b $EC ; ì
		dc.b $99 ; ™
		dc.b $3F ; ?
		dc.b $FE ; þ
		dc.b $8C ; Œ
		dc.b $E2 ; â
		dc.b $B1 ; ±
		dc.b $11
		dc.b $A4 ; ¤
		dc.b $C4 ; Ä
		dc.b $44 ; D
		dc.b $69 ; i
		dc.b $15
		dc.b $9D ; 
		dc.b $27 ; '
		dc.b $18
		dc.b $3A ; :
		dc.b $6B ; k
		dc.b $37 ; 7
		dc.b $13
		dc.b $FF
		dc.b $E9 ; é
		dc.b $C4 ; Ä
		dc.b $7F ; 
		dc.b $38 ; 8
		dc.b $AC ; ¬
		dc.b $78 ; x
		dc.b $15
		dc.b $FE ; þ
		dc.b $E1 ; á
		dc.b $23 ; #
		dc.b $FF
		dc.b $DF ; ß
		dc.b $FE ; þ
		dc.b $25 ; %
		dc.b $7F ; 
		dc.b $B8 ; ¸
		dc.b $AE ; ®
		dc.b $85 ; …
		dc.b $90 ; 
		dc.b $B0 ; °
		dc.b $B8 ; ¸
		dc.b $91 ; ‘
		dc.b $32 ; 2
		dc.b $78 ; x
		dc.b $53 ; S
		dc.b $F9 ; ù
		dc.b $98 ; ˜
		dc.b $58 ; X
		dc.b $4E ; N
		dc.b  $E
		dc.b $13
		dc.b $25 ; %
		dc.b $D4 ; Ô
		dc.b $B2 ; ²
		dc.b $A7 ; §
		dc.b $2D ; -
		dc.b $8A ; Š
		dc.b $E1 ; á
		dc.b $65 ; e
		dc.b $51 ; Q
		dc.b $58 ; X
		dc.b $D2 ; Ò
		dc.b $36 ; 6
		dc.b $46 ; F
		dc.b $1F
		dc.b $CC ; Ì
		dc.b $25 ; %
		dc.b $5D ; ]
		dc.b $33 ; 3
		dc.b $47 ; G
		dc.b $13
		dc.b $83 ; ƒ
		dc.b $83 ; ƒ
		dc.b $A3 ; £
		dc.b $C2 ; Â
		dc.b $91 ; ‘
		dc.b $B2 ; ²
		dc.b $24 ; $
		dc.b $C1 ; Á
		dc.b $D3 ; Ó
		dc.b $59 ; Y
		dc.b $93 ; “
		dc.b $FF
		dc.b $E8 ; è
		dc.b $CE ; Î
		dc.b $23 ; #
		dc.b $F7 ; ÷
		dc.b $C6 ; Æ
		dc.b $11
		dc.b $E0 ; à
		dc.b $5C ; \
		dc.b $3F ; ?
		dc.b $B8 ; ¸
		dc.b $4F ; O
		dc.b $FF
		dc.b $80 ; €
		dc.b $80 ; €
		dc.b   7
		dc.b $80 ; €
		dc.b   2
		dc.b   0
		dc.b $72 ; r
		dc.b   1
		dc.b $81 ; 
		dc.b   3
		dc.b   4
		dc.b $74 ; t
		dc.b  $D
		dc.b $83 ; ƒ
		dc.b   3
		dc.b   5
		dc.b $87 ; ‡
		dc.b   4
		dc.b  $E
		dc.b $8E ; Ž
		dc.b   4
		dc.b  $C
		dc.b $75 ; u
		dc.b $1E
		dc.b $FF
		dc.b $55 ; U
		dc.b $55 ; U
		dc.b $FF
		dc.b $99 ; ™
		dc.b $C7 ; Ç
		dc.b $1C
		dc.b $7E ; ~
		dc.b $5C ; \
		dc.b $E3 ; ã
		dc.b $8E ; Ž
		dc.b $FC ; ü
		dc.b $84 ; „
		dc.b $21 ; !
		dc.b  $D
		dc.b $84 ; „
		dc.b $21 ; !
		dc.b   8
		dc.b $D2 ; Ò
		dc.b $94 ; ”
		dc.b $A7 ; §
		dc.b $FC ; ü
		dc.b $E9 ; é
		dc.b $4A ; J
		dc.b $57 ; W
		dc.b $F2 ; ò
		dc.b $10
		dc.b $84 ; „
		dc.b $37 ; 7
		dc.b $7F ; 
		dc.b $22 ; "
		dc.b $42 ; B
		dc.b $11
		dc.b $55 ; U
		dc.b $30 ; 0
		dc.b $C3 ; Ã
		dc.b  $C
		dc.b $3D ; =
		dc.b $EF ; ï
		dc.b $61 ; a
		dc.b $86 ; †
		dc.b $18
		dc.b $AA ; ª
		dc.b $AA ; ª
		dc.b $90 ; 
		dc.b $84 ; „
		dc.b $21 ; !
		dc.b $BB ; »
		dc.b $BB ; »
		dc.b $B0 ; °
		dc.b $84 ; „
		dc.b $22 ; "
		dc.b $AA ; ª
		dc.b $A0 ;  
		dc.b   0
		dc.b   0
		dc.b $38 ; 8
		dc.b $44 ; D
		dc.b $44 ; D
		dc.b $44 ; D
		dc.b $44 ; D
		dc.b $38 ; 8
		dc.b   0
		dc.b   0
		dc.b   8
		dc.b $18
		dc.b   8
		dc.b   8
		dc.b   8
		dc.b $1C
		dc.b   0
		dc.b   0
		dc.b $38 ; 8
		dc.b $44 ; D
		dc.b   4
		dc.b   8
		dc.b $30 ; 0
		dc.b $7C ; |
		dc.b   0
		dc.b   0
		dc.b $78 ; x
		dc.b   4
		dc.b $38 ; 8
		dc.b   4
		dc.b   4
		dc.b $78 ; x
		dc.b   0
		dc.b   0
		dc.b $48 ; H
		dc.b $48 ; H
		dc.b $48 ; H
		dc.b $7C ; |
		dc.b   8
		dc.b   8
		dc.b   0
		dc.b   0
		dc.b $7C ; |
		dc.b $40 ; @
		dc.b $78 ; x
		dc.b $44 ; D
		dc.b   4
		dc.b $78 ; x
		dc.b   0
		dc.b   0
		dc.b $38 ; 8
		dc.b $40 ; @
		dc.b $78 ; x
		dc.b $44 ; D
		dc.b $44 ; D
		dc.b $38 ; 8
		dc.b   0
		dc.b   0
		dc.b $7C ; |
		dc.b   4
		dc.b   8
		dc.b   8
		dc.b $10
		dc.b $10
		dc.b   0
		dc.b   0
		dc.b $38 ; 8
		dc.b $44 ; D
		dc.b $38 ; 8
		dc.b $44 ; D
		dc.b $44 ; D
		dc.b $38 ; 8
		dc.b   0
		dc.b   0
		dc.b $38 ; 8
		dc.b $44 ; D
		dc.b $44 ; D
		dc.b $3C ; <
		dc.b   4
		dc.b $38 ; 8
		dc.b   0
		dc.b   0
		dc.b $3E ; >
		dc.b   8
		dc.b   8
		dc.b   8
		dc.b   8
		dc.b   8
		dc.b   0
		dc.b   0
		dc.b $F0 ; ð
		dc.b $88 ; ˆ
		dc.b $88 ; ˆ
		dc.b $F0 ; ð
		dc.b $90 ; 
		dc.b $88 ; ˆ
		dc.b   0
		dc.b   0
		dc.b $1C
		dc.b $22 ; "
		dc.b $20
		dc.b $20
		dc.b $22 ; "
		dc.b $1C
		dc.b   0
		dc.b   0
		dc.b $88 ; ˆ
		dc.b $88 ; ˆ
		dc.b $F8 ; ø
		dc.b $88 ; ˆ
		dc.b $88 ; ˆ
		dc.b $88 ; ˆ
		dc.b   0
		dc.b   0
		dc.b $88 ; ˆ
		dc.b $D8 ; Ø
		dc.b $A8 ; ¨
		dc.b $A8 ; ¨
		dc.b $88 ; ˆ
		dc.b $88 ; ˆ
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $18
		dc.b $18
		dc.b   0
		dc.b $18
		dc.b $18
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $7E ; ~
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   6
		dc.b   3
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $12
		dc.b  $E
		dc.b $78 ; x
		dc.b $24 ; $
		dc.b $30 ; 0
		dc.b $4C ; L
		dc.b $28 ; (
		dc.b $41 ; A
		dc.b $CF ; Ï
		dc.b   8
		dc.b $84 ; „
		dc.b $11
		dc.b $89 ; ‰
		dc.b $1C
		dc.b $39 ; 9
		dc.b $41 ; A
		dc.b $80 ; €
		dc.b $46 ; F
		dc.b  $D
		dc.b   3
		dc.b  $A
		dc.b $50 ; P
		dc.b $6C ; l
		dc.b $80 ; €
		dc.b $B8 ; ¸
		dc.b $18
		dc.b $54 ; T
		dc.b $29 ; )
		dc.b   7
		dc.b $84 ; „
		dc.b $80 ; €
		dc.b $49 ; I
		dc.b   3
		dc.b $1C
		dc.b $6F ; o
		dc.b $90 ; 
		dc.b $A2 ; ¢
		dc.b $82 ; ‚
		dc.b $7D ; }
		dc.b $30 ; 0
		dc.b $F5 ; õ
		dc.b   0
		dc.b $47 ; G
		dc.b   8
		dc.b $9B ; ›
		dc.b $1C
		dc.b $85 ; …
		dc.b $14
		dc.b $13
		dc.b $E9 ; é
		dc.b $87 ; ‡
		dc.b $A9 ; ©
		dc.b $C0 ; À
		dc.b $75 ; u
		dc.b $1C
		dc.b $22 ; "
		dc.b $6C ; l
		dc.b $72 ; r
		dc.b $14
		dc.b $50 ; P
		dc.b $4F ; O
		dc.b $A4 ; ¤
		dc.b $1F
		dc.b $FB ; û
		dc.b $72 ; r
		dc.b $6F ; o
		dc.b $72 ; r
		dc.b $6F ; o
		dc.b $72 ; r
		dc.b $6F ; o
		dc.b $72 ; r
		dc.b $6F ; o
		dc.b $72 ; r
		dc.b $6F ; o
		dc.b $72 ; r
		dc.b $6F ; o
		dc.b $72 ; r
		dc.b $6F ; o
		dc.b $73 ; s
		dc.b $BC ; ¼
		dc.b $DE ; Þ
		dc.b $E4 ; ä
		dc.b $DE ; Þ
		dc.b $E4 ; ä
		dc.b $D8 ; Ø
		dc.b $A2 ; ¢
		dc.b $82 ; ‚
		dc.b $7D ; }
		dc.b $20
		dc.b $FF
		dc.b $DB ; Û
		dc.b $93 ; “
		dc.b $7B ; {
		dc.b $93 ; “
		dc.b $7B ; {
		dc.b $93 ; “
		dc.b $7B ; {
		dc.b $93 ; “
		dc.b $7B ; {
		dc.b $93 ; “
		dc.b $7B ; {
		dc.b $93 ; “
		dc.b $7B ; {
		dc.b $93 ; “
		dc.b $7B ; {
		dc.b $9E ; ž
		dc.b $66 ; f
		dc.b $F7 ; ÷
		dc.b $26 ; &
		dc.b $F7 ; ÷
		dc.b $26 ; &
		dc.b $C5 ; Å
		dc.b $14
		dc.b $13
		dc.b $C3 ; Ã
		dc.b $C4 ; Ä
		dc.b   1
		dc.b $9E ; ž
		dc.b $3F ; ?
		dc.b   8
		dc.b $7C ; |
		dc.b  $C
		dc.b $2A ; *
		dc.b $10
		dc.b   3
		dc.b $C3 ; Ã
		dc.b $9C ; œ
		dc.b $48 ; H
		dc.b  $E
		dc.b $26 ; &
		dc.b $38 ; 8
		dc.b   9
		dc.b $E2 ; â
		dc.b $4E ; N
		dc.b $2B ; +
		dc.b   7
		dc.b $1B
		dc.b $50 ; P
		dc.b $73 ; s
		dc.b $C9 ; É
		dc.b   1
		dc.b $C2 ; Â
		dc.b $E3 ; ã
		dc.b $C4 ; Ä
		dc.b $BD ; ½
		dc.b $B8 ; ¸
		dc.b $29 ; )
		dc.b $E5 ; å
		dc.b $70 ; p
		dc.b  $A
		dc.b $C1 ; Á
		dc.b $E0 ; à
		dc.b $57 ; W
		dc.b $89 ; ‰
		dc.b $DA ; Ú
		dc.b   0
		dc.b   0
		dc.b $53 ; S
		dc.b $CE ; Î
		dc.b $E1 ; á
		dc.b $1D
		dc.b $E1 ; á
		dc.b $7A ; z
		dc.b $80 ; €
		dc.b   1
		dc.b $FC ; ü
		dc.b   0
		dc.b   8
		dc.b   1
		dc.b   0
		dc.b  $F
		dc.b   0
		dc.b $5D ; ]
		dc.b $AA ; ª
		dc.b $3C ; <
		dc.b $C3 ; Ã
		dc.b $3F ; ?
		dc.b $E2 ; â
		dc.b $3D ; =
		dc.b $9E ; ž
		dc.b $55 ; U
		dc.b $21 ; !
		dc.b $63 ; c
		dc.b $A2 ; ¢
		dc.b $D4 ; Ô
		dc.b $24 ; $
		dc.b $64 ; d
		dc.b $A6 ; ¦
		dc.b $54 ; T
		dc.b $26 ; &
		dc.b $E4 ; ä
		dc.b $A8 ; ¨
		dc.b $D4 ; Ô
		dc.b $29 ; )
		dc.b $64 ; d
		dc.b $AB ; «
		dc.b $54 ; T
		dc.b $2B ; +
		dc.b $E2 ; â
		dc.b $AD ; ­
		dc.b $F1 ; ñ
		dc.b $2C ; ,
		dc.b $55 ; U
		dc.b $EB ; ë
		dc.b $17
		dc.b $39 ; 9
		dc.b $57 ; W
		dc.b $8B ; ‹
		dc.b $B5 ; µ
		dc.b $CA ; Ê
		dc.b $C6 ; Æ
		dc.b $3E ; >
		dc.b $36 ; 6
		dc.b $53 ; S
		dc.b $25 ; %
		dc.b $23 ; #
		dc.b $54 ; T
		dc.b $53 ; S
		dc.b $65 ; e
		dc.b $63 ; c
		dc.b $6F ; o
		dc.b  $B
		dc.b $82 ; ‚
		dc.b $34 ; 4
		dc.b $4E ; N
		dc.b $80 ; €
		dc.b $54 ; T
		dc.b $3B ; ;
		dc.b $23 ; #
		dc.b $44 ; D
		dc.b $F7 ; ÷
		dc.b $C0 ; À
		dc.b $1F
		dc.b $4C ; L
		dc.b $E1 ; á
		dc.b $C6 ; Æ
		dc.b $E0 ; à
		dc.b $5D ; ]
		dc.b $A4 ; ¤
		dc.b $7D ; }
		dc.b $E0 ; à
		dc.b  $F
		dc.b $AE ; ®
		dc.b $80 ; €
		dc.b $E0 ; à
		dc.b   0
		dc.b $A4 ; ¤
		dc.b $88 ; ˆ
		dc.b $82 ; ‚
		dc.b $8A ; Š
		dc.b $A4 ; ¤
		dc.b $8B ; ‹
		dc.b $82 ; ‚
		dc.b   0
		dc.b $A2 ; ¢
		dc.b $8E ; Ž
		dc.b $84 ; „
		dc.b $8F ; 
		dc.b $A2 ; ¢
		dc.b $90 ; 
		dc.b $84 ; „
		dc.b   0
		dc.b $A4 ; ¤
		dc.b $92 ; ’
		dc.b $A6 ; ¦
		dc.b $94 ; ”
		dc.b $84 ; „
		dc.b   0
		dc.b $A4 ; ¤
		dc.b $98 ; ˜
		dc.b $A8 ; ¨
		dc.b $9A ; š
		dc.b $82 ; ‚
		dc.b   0
		dc.b $E0 ; à
		dc.b $9F ; Ÿ
		dc.b $A6 ; ¦
		dc.b $70 ; p
		dc.b $E1 ; á
		dc.b $70 ; p
		dc.b $A4 ; ¤
		dc.b $A0 ;  
		dc.b $E2 ; â
		dc.b   0
		dc.b   7
		dc.b $D8 ; Ø
		dc.b $51 ; Q
		dc.b $F0 ; ð
		dc.b   7
		dc.b $D3 ; Ó
		dc.b $38 ; 8
		dc.b $70 ; p
		dc.b $B8 ; ¸
		dc.b $23 ; #
		dc.b $45 ; E
		dc.b $59 ; Y
		dc.b $C0 ; À
		dc.b $1F
		dc.b $69 ; i
		dc.b $5D ; ]
		dc.b $14
		dc.b $5F ; _
		dc.b $45 ; E
		dc.b $73 ; s
		dc.b $49 ; I
		dc.b $25 ; %
		dc.b $4D ; M
		dc.b $29 ; )
		dc.b   8
		dc.b   1
		dc.b $49 ; I
		dc.b $31 ; 1
		dc.b $51 ; Q
		dc.b $35 ; 5
		dc.b   4
		dc.b   1
		dc.b $C1 ; Á
		dc.b $3E ; >
		dc.b $A5 ; ¥
		dc.b $25 ; %
		dc.b   7
		dc.b $10
		dc.b   0
		dc.b $3D ; =
		dc.b $5A ; Z
		dc.b $4A ; J
		dc.b $9E ; ž
		dc.b   0
		dc.b $FA ; ú
		dc.b $CB ; Ë
		dc.b $BA ; º
		dc.b $2A ; *
		dc.b $CE ; Î
		dc.b   0
		dc.b $FA ; ú
		dc.b $AC ; ¬
		dc.b $24 ; $
		dc.b $29 ; )
		dc.b $AD ; ­
		dc.b $62 ; b
		dc.b $8B ; ‹
		dc.b $E8 ; è
		dc.b $AE ; ®
		dc.b $7F ; 
		dc.b $80 ; €
		dc.b   9
		dc.b   3
		dc.b   0
		dc.b $5D ; ]
		dc.b   0
		dc.b $CC ; Ì
		dc.b $A8 ; ¨
		dc.b $32 ; 2
		dc.b $1F
		dc.b $43 ; C
		dc.b $1A
		dc.b $CB ; Ë
		dc.b $BE ; ¾
		dc.b $33 ; 3
		dc.b $78 ; x
		dc.b  $D
		dc.b $6A ; j
		dc.b $C3 ; Ã
		dc.b $77 ; w
		dc.b  $A
		dc.b $CE ; Î
		dc.b $BE ; ¾
		dc.b $39 ; 9
		dc.b $38 ; 8
		dc.b  $E
		dc.b $DA ; Ú
		dc.b $C3 ; Ã
		dc.b $D3 ; Ó
		dc.b  $A
		dc.b $E5 ; å
		dc.b $A2 ; ¢
		dc.b $3E ; >
		dc.b $F8 ; ø
		dc.b  $C
		dc.b $FA ; ú
		dc.b $83 ; ƒ
		dc.b $F6 ; ö
		dc.b $88 ; ˆ
		dc.b $D5 ; Õ
		dc.b $E0 ; à
		dc.b $3F ; ?
		dc.b $69 ; i
		dc.b $90 ; 
		dc.b $2A ; *
		dc.b $23 ; #
		dc.b $56 ; V
		dc.b $91 ; ‘
		dc.b   6
		dc.b $A6 ; ¦
		dc.b $38 ; 8
		dc.b $30 ; 0
		dc.b $AF ; ¯
		dc.b $CE ; Î
		dc.b $43 ; C
		dc.b $EC ; ì
		dc.b $84 ; „
		dc.b $8E ; Ž
		dc.b $6A ; j
		dc.b $84 ; „
		dc.b $2A ; *
		dc.b $88 ; ˆ
		dc.b $EC ; ì
		dc.b $E0 ; à
		dc.b $42 ; B
		dc.b $A9 ; ©
		dc.b $90 ; 
		dc.b $FA ; ú
		dc.b $23 ; #
		dc.b $B2 ; ²
		dc.b $91 ; ‘
		dc.b $13
		dc.b $A6 ; ¦
		dc.b $3D ; =
		dc.b $FA ; ú
		dc.b $B0 ; °
		dc.b $95 ; •
		dc.b $F6 ; ö
		dc.b $45 ; E
		dc.b $88 ; ˆ
		dc.b $B8 ; ¸
		dc.b $CF ; Ï
		dc.b $1F
		dc.b $B4 ; ´
		dc.b $C8 ; È
		dc.b $C5 ; Å
		dc.b $11
		dc.b $AB ; «
		dc.b $C0 ; À
		dc.b $7E ; ~
		dc.b $D3 ; Ó
		dc.b $23 ; #
		dc.b $94 ; ”
		dc.b $46 ; F
		dc.b $AF ; ¯
		dc.b $11
		dc.b $FA ; ú
		dc.b $47 ; G
		dc.b $69 ; i
		dc.b $12
		dc.b  $E
		dc.b $63 ; c
		dc.b $54 ; T
		dc.b $71 ; q
		dc.b $B1 ; ±
		dc.b $76 ; v
		dc.b $2D ; -
		dc.b $48 ; H
		dc.b $91 ; ‘
		dc.b $F0 ; ð
		dc.b $21 ; !
		dc.b $54 ; T
		dc.b $C9 ; É
		dc.b $35 ; 5
		dc.b $11
		dc.b $D9 ; Ù
		dc.b $C0 ; À
		dc.b $85 ; …
		dc.b $53 ; S
		dc.b $25 ; %
		dc.b $54 ; T
		dc.b $47 ; G
		dc.b $67 ; g
		dc.b   2
		dc.b $15
		dc.b $4C ; L
		dc.b $97 ; —
		dc.b $73 ; s
		dc.b $1D
		dc.b $84 ; „
		dc.b $C9 ; É
		dc.b $92 ; ’
		dc.b $32 ; 2
		dc.b $3A ; :
		dc.b $C4 ; Ä
		dc.b $CE ; Î
		dc.b $61 ; a
		dc.b $39 ; 9
		dc.b $C2 ; Â
		dc.b $CE ; Î
		dc.b $38 ; 8
		dc.b $13
		dc.b $AC ; ¬
		dc.b $4C ; L
		dc.b $D6 ; Ö
		dc.b   8
		dc.b   0
		dc.b $A6 ; ¦
		dc.b $4E ; N
		dc.b $E7 ; ç
		dc.b $13
		dc.b $EC ; ì
		dc.b $4C ; L
		dc.b $F6 ; ö
		dc.b   8
		dc.b   0
		dc.b $A8 ; ¨
		dc.b $32 ; 2
		dc.b $1F
		dc.b $43 ; C
		dc.b $1A
		dc.b $CB ; Ë
		dc.b $A4 ; ¤
		dc.b $33 ; 3
		dc.b $78 ; x
		dc.b  $F
		dc.b $DA ; Ú
		dc.b $64 ; d
		dc.b $FE ; þ
		dc.b $88 ; ˆ
		dc.b $D5 ; Õ
		dc.b $E0 ; à
		dc.b $3F ; ?
		dc.b $69 ; i
		dc.b $94 ; ”
		dc.b $3A ; :
		dc.b $23 ; #
		dc.b $57 ; W
		dc.b $88 ; ˆ
		dc.b $FD ; ý
		dc.b $23 ; #
		dc.b $B4 ; ´
		dc.b $89 ; ‰
		dc.b   7
		dc.b $31 ; 1
		dc.b $AA ; ª
		dc.b $38 ; 8
		dc.b $D6 ; Ö
		dc.b $72 ; r
		dc.b $CD ; Í
		dc.b $A4 ; ¤
		dc.b $39 ; 9
		dc.b $38 ; 8
		dc.b $10
		dc.b $AA ; ª
		dc.b $65 ; e
		dc.b $1E
		dc.b $88 ; ˆ
		dc.b $EC ; ì
		dc.b $E0 ; à
		dc.b $42 ; B
		dc.b $A9 ; ©
		dc.b $94 ; ”
		dc.b $BA ; º
		dc.b $23 ; #
		dc.b $B3 ; ³
		dc.b $81 ; 
		dc.b  $A
		dc.b $A6 ; ¦
		dc.b $4B ; K
		dc.b $BA ; º
		dc.b $8E ; Ž
		dc.b $C1 ; Á
		dc.b $F4 ; ô
		dc.b $B9 ; ¹
		dc.b $57 ; W
		dc.b $20
		dc.b $FB ; û
		dc.b $1F
		dc.b $80 ; €
		dc.b $7E ; ~
		dc.b $C3 ; Ã
		dc.b $90 ; 
		dc.b $6F ; o
		dc.b  $E
		dc.b $41 ; A
		dc.b $BC ; ¼
		dc.b $39 ; 9
		dc.b   6
		dc.b $F0 ; ð
		dc.b $E4 ; ä
		dc.b $1B
		dc.b $C3 ; Ã
		dc.b $90 ; 
		dc.b $6F ; o
		dc.b  $E
		dc.b $41 ; A
		dc.b $BC ; ¼
		dc.b $39 ; 9
		dc.b   6
		dc.b $F0 ; ð
		dc.b $E7 ; ç
		dc.b $B8 ; ¸
		dc.b $37 ; 7
		dc.b $87 ; ‡
		dc.b $20
		dc.b $DE ; Þ
		dc.b $1C
		dc.b $83 ; ƒ
		dc.b $81 ; 
		dc.b $75 ; u
		dc.b $7E ; ~
		dc.b $2F ; /
		dc.b $B1 ; ±
		dc.b $F6 ; ö
		dc.b $42 ; B
		dc.b $42 ; B
		dc.b $E9 ; é
		dc.b $4F ; O
		dc.b $88 ; ˆ
		dc.b $54 ; T
		dc.b $2B ; +
		dc.b $95 ; •
		dc.b $18
		dc.b $85 ; …
		dc.b $43 ; C
		dc.b $F3 ; ó
		dc.b $4F ; O
		dc.b  $B
		dc.b $AC ; ¬
		dc.b $25 ; %
		dc.b $7D ; }
		dc.b $91 ; ‘
		dc.b $62 ; b
		dc.b $2E ; .
		dc.b $17
		dc.b $70 ; p
		dc.b $E4 ; ä
		dc.b $1B
		dc.b $C3 ; Ã
		dc.b $90 ; 
		dc.b $6F ; o
		dc.b  $E
		dc.b $41 ; A
		dc.b $BC ; ¼
		dc.b $39 ; 9
		dc.b   6
		dc.b $FF
		dc.b $61 ; a
		dc.b $C8 ; È
		dc.b $37 ; 7
		dc.b $87 ; ‡
		dc.b $20
		dc.b $DE ; Þ
		dc.b $1C
		dc.b $83 ; ƒ
		dc.b $78 ; x
		dc.b $72 ; r
		dc.b  $D
		dc.b $E1 ; á
		dc.b $C8 ; È
		dc.b $37 ; 7
		dc.b $87 ; ‡
		dc.b $20
		dc.b $E0 ; à
		dc.b $5D ; ]
		dc.b $2B ; +
		dc.b $2C ; ,
		dc.b $5A ; Z
		dc.b $89 ; ‰
		dc.b $23 ; #
		dc.b $A4 ; ¤
		dc.b $56 ; V
		dc.b $A7 ; §
		dc.b $95 ; •
		dc.b $CE ; Î
		dc.b $85 ; …
		dc.b $71 ; q
		dc.b $AD ; ­
		dc.b $95 ; •
		dc.b $D2 ; Ò
		dc.b $BC ; ¼
		dc.b $C8 ; È
		dc.b $E9 ; é
		dc.b $13
		dc.b $3E ; >
		dc.b   5
		dc.b $7E ; ~
		dc.b $91 ; ‘
		dc.b $37 ; 7
		dc.b $98 ; ˜
		dc.b $4E ; N
		dc.b $70 ; p
		dc.b $B3 ; ³
		dc.b $8E ; Ž
		dc.b  $D
		dc.b $7F ; 
		dc.b $13
		dc.b $35 ; 5
		dc.b $82 ; ‚
		dc.b   0
		dc.b $29 ; )
		dc.b $93 ; “
		dc.b $B9 ; ¹
		dc.b $C4 ; Ä
		dc.b $FB ; û
		dc.b $13
		dc.b $3D ; =
		dc.b $82 ; ‚
		dc.b   0
		dc.b $3F ; ?
		dc.b $80 ; €
		dc.b   0
		dc.b   9
		dc.b   1
		dc.b   0
		dc.b $3F ; ?
		dc.b   0
		dc.b $4D ; M
		dc.b $A4 ; ¤
		dc.b $38 ; 8
		dc.b $85 ; …
		dc.b $C2 ; Â
		dc.b $3F ; ?
		dc.b $A4 ; ¤
		dc.b $22 ; "
		dc.b $FE ; þ
		dc.b $91 ; ‘
		dc.b $44 ; D
		dc.b $B1 ; ±
		dc.b $32 ; 2
		dc.b $4C ; L
		dc.b $92 ; ’
		dc.b $C5 ; Å
		dc.b   1
		dc.b $46 ; F
		dc.b $51 ; Q
		dc.b $94 ; ”
		dc.b   5
		dc.b $51 ; Q
		dc.b $5A ; Z
		dc.b $56 ; V
		dc.b $95 ; •
		dc.b $45 ; E
		dc.b $A1 ; ¡
		dc.b $6F ; o
		dc.b  $C
		dc.b $B6 ; ¶
		dc.b $15
		dc.b $21 ; !
		dc.b $23 ; #
		dc.b $14
		dc.b $89 ; ‰
		dc.b $8A ; Š
		dc.b $4A ; J
		dc.b $42 ; B
		dc.b $88 ; ˆ
		dc.b $9D ; 
		dc.b $48 ; H
		dc.b $52 ; R
		dc.b $C5 ; Å
		dc.b $27 ; '
		dc.b $E2 ; â
		dc.b $95 ; •
		dc.b $2A ; *
		dc.b  $B
		dc.b $DC ; Ü
		dc.b $25 ; %
		dc.b $EA ; ê
		dc.b $83 ; ƒ
		dc.b $2F ; /
		dc.b $C9 ; É
		dc.b $94 ; ”
		dc.b $4D ; M
		dc.b $58 ; X
		dc.b $16
		dc.b $11
		dc.b $49 ; I
		dc.b $62 ; b
		dc.b $58 ; X
		dc.b $F6 ; ö
		dc.b $15
		dc.b $92 ; ’
		dc.b $4D ; M
		dc.b $59 ; Y
		dc.b $56 ; V
		dc.b $69 ; i
		dc.b $4B ; K
		dc.b $F8 ; ø
		dc.b   9
		dc.b   0
		dc.b   0
		dc.b $D0 ; Ð
		dc.b   0
		dc.b $D5 ; Õ
		dc.b $E0 ; à
		dc.b $FD ; ý
		dc.b $A7 ; §
		dc.b $3F ; ?
		dc.b $43 ; C
		dc.b $84 ; „
		dc.b $2A ; *
		dc.b $9D ; 
		dc.b $1F
		dc.b $8B ; ‹
		dc.b $B1 ; ±
		dc.b $FB ; û
		dc.b $4E ; N
		dc.b $86 ; †
		dc.b $87 ; ‡
		dc.b   8
		dc.b $55 ; U
		dc.b $3A ; :
		dc.b $5F ; _
		dc.b $27 ; '
		dc.b $63 ; c
		dc.b $F6 ; ö
		dc.b $3B ; ;
		dc.b $4A ; J
		dc.b $40 ; @
		dc.b $87 ; ‡
		dc.b   8
		dc.b $55 ; U
		dc.b $39 ; 9
		dc.b $74 ; t
		dc.b   7
		dc.b $60 ; `
		dc.b $B5 ; µ
		dc.b $5C ; \
		dc.b $F5 ; õ
		dc.b $5A ; Z
		dc.b $F5 ; õ
		dc.b $5D ; ]
		dc.b $D5 ; Õ
		dc.b $5B ; [
		dc.b $B5 ; µ
		dc.b $5E ; ^
		dc.b $95 ; •
		dc.b $1F
		dc.b $A8 ; ¨
		dc.b $54 ; T
		dc.b $85 ; …
		dc.b $71 ; q
		dc.b $76 ; v
		dc.b $3F ; ?
		dc.b $69 ; i
		dc.b $C0 ; À
		dc.b $90 ; 
		dc.b $E1 ; á
		dc.b  $A
		dc.b $A7 ; §
		dc.b  $F
		dc.b $E0 ; à
		dc.b $EC ; ì
		dc.b $A5 ; ¥
		dc.b   6
		dc.b $A4 ; ¤
		dc.b $E0 ; à
		dc.b $A5 ; ¥
		dc.b $13
		dc.b $A4 ; ¤
		dc.b $F7 ; ÷
		dc.b $E0 ; à
		dc.b $FD ; ý
		dc.b $A7 ; §
		dc.b $18
		dc.b $43 ; C
		dc.b $84 ; „
		dc.b $2A ; *
		dc.b $9C ; œ
		dc.b $9B ; ›
		dc.b $8B ; ‹
		dc.b $B1 ; ±
		dc.b $FB ; û
		dc.b $4E ; N
		dc.b $38 ; 8
		dc.b $87 ; ‡
		dc.b   8
		dc.b $55 ; U
		dc.b $39 ; 9
		dc.b $57 ; W
		dc.b $27 ; '
		dc.b $63 ; c
		dc.b $F6 ; ö
		dc.b $3B ; ;
		dc.b $4A ; J
		dc.b $40 ; @
		dc.b $87 ; ‡
		dc.b   8
		dc.b $55 ; U
		dc.b $39 ; 9
		dc.b $74 ; t
		dc.b   7
		dc.b $67 ; g
		dc.b $F0 ; ð
		dc.b   9
		dc.b   0
		dc.b   0
		dc.b $24 ; $
		dc.b   0
		dc.b $24 ; $
		dc.b   1
		dc.b $E8 ; è
		dc.b $F6 ; ö
		dc.b $78 ; x
		dc.b $F6 ; ö
		dc.b $8F ; 
		dc.b $E0 ; à
		dc.b   0
		dc.b   9
		dc.b   0
		dc.b   0
		dc.b $12
		dc.b   0
		dc.b $12
		dc.b $A9 ; ©
		dc.b $69 ; i
		dc.b   2
		dc.b $8D ; 
		dc.b $BA ; º
		dc.b $9D ; 
		dc.b $AA ; ª
		dc.b $9D ; 
		dc.b $C1 ; Á
		dc.b $1E
		dc.b $36 ; 6
		dc.b $EB ; ë
		dc.b $A5 ; ¥
		dc.b $2B ; +
		dc.b $8A ; Š
		dc.b $1F
		dc.b $C0 ; À
		dc.b   0
		dc.b   9
		dc.b   3
		dc.b   0
		dc.b $12
		dc.b   0
		dc.b $12
		dc.b $E2 ; â
		dc.b $5D ; ]
		dc.b $7B ; {
		dc.b $AD ; ­
		dc.b $F2 ; ò
		dc.b $ED ; í
		dc.b $C6 ; Æ
		dc.b $C0 ; À
		dc.b $98 ; ˜
		dc.b $60 ; `
		dc.b $10
		dc.b $E2 ; â
		dc.b $61 ; a
		dc.b $EC ; ì
		dc.b $3F ; ?
		dc.b $F0 ; ð
		dc.b   9
		dc.b   2
		dc.b   0
		dc.b $12
		dc.b   0
		dc.b $12
		dc.b $B0 ; °
		dc.b $CD ; Í
		dc.b $81 ; 
		dc.b $47 ; G
		dc.b $9B ; ›
		dc.b $AC ; ¬
		dc.b $D2 ; Ò
		dc.b $21 ; !
		dc.b $45 ; E
		dc.b $AB ; «
		dc.b $E2 ; â
		dc.b $CE ; Î
		dc.b $B3 ; ³
		dc.b $F4 ; ô
		dc.b $DA ; Ú
		dc.b $D4 ; Ô
		dc.b $68 ; h
		dc.b $F5 ; õ
		dc.b $7D ; }
		dc.b $5A ; Z
		dc.b $46 ; F
		dc.b $99 ; ™
		dc.b $B1 ; ±
		dc.b $6C ; l
		dc.b $9A ; š
		dc.b $56 ; V
		dc.b $CD ; Í
		dc.b $1A
		dc.b $2D ; -
		dc.b $A7 ; §
		dc.b $36 ; 6
		dc.b $B9 ; ¹
		dc.b $B6 ; ¶
		dc.b $6D ; m
		dc.b $D9 ; Ù
		dc.b $D4 ; Ô
		dc.b $E8 ; è
		dc.b $F6 ; ö
		dc.b $9C ; œ
		dc.b $DB ; Û
		dc.b $26 ; &
		dc.b $9D ; 
		dc.b $B8 ; ¸
		dc.b $69 ; i
		dc.b $13
		dc.b $E8 ; è
		dc.b $D7 ; ×
		dc.b $33 ; 3
		dc.b $AC ; ¬
		dc.b $FB ; û
		dc.b $72 ; r
		dc.b $D7 ; ×
		dc.b $A2 ; ¢
		dc.b   2
		dc.b $3D ; =
		dc.b $1B
		dc.b $26 ; &
		dc.b $91 ; ‘
		dc.b $A6 ; ¦
		dc.b $6E ; n
		dc.b $9A ; š
		dc.b $54 ; T
		dc.b $70 ; p
		dc.b $82 ; ‚
		dc.b $68 ; h
		dc.b $51 ; Q
		dc.b $6E ; n
		dc.b $FA ; ú
		dc.b $B3 ; ³
		dc.b $ED ; í
		dc.b $13
		dc.b $44 ; D
		dc.b $D7 ; ×
		dc.b $B3 ; ³
		dc.b $C0 ; À
		dc.b $9A ; š
		dc.b $3D ; =
		dc.b $DB ; Û
		dc.b $A6 ; ¦
		dc.b $99 ; ™
		dc.b $A6 ; ¦
		dc.b $6A ; j
		dc.b $5A ; Z
		dc.b $96 ; –
		dc.b $95 ; •
		dc.b $A5 ; ¥
		dc.b   4
		dc.b $D1 ; Ñ
		dc.b $A2 ; ¢
		dc.b $D0 ; Ð
		dc.b $F2 ; ò
		dc.b $6D ; m
		dc.b $9B ; ›
		dc.b $D6 ; Ö
		dc.b $DD ; Ý
		dc.b $1C
		dc.b $20
		dc.b $9A ; š
		dc.b $14
		dc.b $5A ; Z
		dc.b $8E ; Ž
		dc.b $4D ; M
		dc.b $3B ; ;
		dc.b $7C ; |
		dc.b $DC ; Ü
		dc.b $23 ; #
		dc.b $84 ; „
		dc.b $13
		dc.b $43 ; C
		dc.b $83 ; ƒ
		dc.b $3B ; ;
		dc.b $61 ; a
		dc.b $BF ; ¿
		dc.b $E0 ; à
		dc.b $D2 ; Ò
		dc.b $59 ; Y
		dc.b $72 ; r
		dc.b $38 ; 8
		dc.b $82 ; ‚
		dc.b $6D ; m
		dc.b $ED ; í
		dc.b $57 ; W
		dc.b $4B ; K
		dc.b $83 ; ƒ
		dc.b $5F ; _
		dc.b $6D ; m
		dc.b $D8 ; Ø
		dc.b $E0 ; à
		dc.b $DE ; Þ
		dc.b $D3 ; Ó
		dc.b $74 ; t
		dc.b $A8 ; ¨
		dc.b $BC ; ¼
		dc.b $9C ; œ
		dc.b $19
		dc.b $EA ; ê
		dc.b $CE ; Î
		dc.b $C5 ; Å
		dc.b $17
		dc.b $9B ; ›
		dc.b $83 ; ƒ
		dc.b $C2 ; Â
		dc.b $97 ; —
		dc.b $36 ; 6
		dc.b $DD ; Ý
		dc.b $9D ; 
		dc.b $6B ; k
		dc.b $DA ; Ú
		dc.b $25 ; %
		dc.b $79 ; y
		dc.b $B7 ; ·
		dc.b  $D
		dc.b $23 ; #
		dc.b $4A ; J
		dc.b $D4 ; Ô
		dc.b $A7 ; §
		dc.b $D9 ; Ù
		dc.b $A2 ; ¢
		dc.b $6D ; m
		dc.b $C1 ; Á
		dc.b $26 ; &
		dc.b $C1 ; Á
		dc.b $A1 ; ¡
		dc.b $6B ; k
		dc.b $9B ; ›
		dc.b $94 ; ”
		dc.b $BB ; »
		dc.b $35 ; 5
		dc.b $2D ; -
		dc.b $C0 ; À
		dc.b $24 ; $
		dc.b $D9 ; Ù
		dc.b $B5 ; µ
		dc.b  $D
		dc.b $93 ; “
		dc.b $74 ; t
		dc.b $8F ; 
		dc.b $F0 ; ð
		dc.b   3
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   1
		dc.b $F7 ; ÷
		dc.b $DF ; ß
		dc.b $7D ; }
		dc.b $F7 ; ÷
		dc.b $DF ; ß
		dc.b $7D ; }
		dc.b $F7 ; ÷
		dc.b $DF ; ß
		dc.b $7D ; }
		dc.b $F7 ; ÷
		dc.b $DF ; ß
		dc.b $7D ; }
		dc.b $F7 ; ÷
		dc.b $DF ; ß
		dc.b $7D ; }
		dc.b $F7 ; ÷
		dc.b $DF ; ß
		dc.b $7D ; }
		dc.b $F7 ; ÷
		dc.b $DF ; ß
		dc.b $7D ; }
		dc.b $F7 ; ÷
		dc.b $DF ; ß
		dc.b $7D ; }
		dc.b $F7 ; ÷
		dc.b $DF ; ß
		dc.b $7D ; }
		dc.b $F7 ; ÷
		dc.b $DF ; ß
		dc.b $7D ; }
		dc.b $F7 ; ÷
		dc.b $DF ; ß
		dc.b $7D ; }
		dc.b $E0 ; à
		dc.b $27 ; '
		dc.b $99 ; ™
		dc.b $E6 ; æ
		dc.b $31 ; 1
		dc.b   2
		dc.b $7A ; z
		dc.b $9E ; ž
		dc.b $A3 ; £
		dc.b $20
		dc.b $27 ; '
		dc.b $B9 ; ¹
		dc.b $EE ; î
		dc.b $33 ; 3
		dc.b   2
		dc.b $7C ; |
		dc.b $9F ; Ÿ
		dc.b $23 ; #
		dc.b $40 ; @
		dc.b $27 ; '
		dc.b $D9 ; Ù
		dc.b $F6 ; ö
		dc.b $35 ; 5
		dc.b   2
		dc.b $7E ; ~
		dc.b $9F ; Ÿ
		dc.b $A7 ; §
		dc.b $E9 ; é
		dc.b $FA ; ú
		dc.b $7E ; ~
		dc.b $9F ; Ÿ
		dc.b $A7 ; §
		dc.b $E9 ; é
		dc.b $FA ; ú
		dc.b $7E ; ~
		dc.b $9F ; Ÿ
		dc.b $A7 ; §
		dc.b $E9 ; é
		dc.b $FA ; ú
		dc.b $36 ; 6
		dc.b $FE ; þ
unk_12BBD:	dc.b   2		; DATA XREF: sub_329A+Eo
		dc.b   0
		dc.b   0
		dc.b   5
		dc.b $47 ; G
		dc.b $EF ; ï
		dc.b   0
		dc.b $F0 ; ð
		dc.b $10
		dc.b   0
		dc.b $47 ; G
		dc.b $F3 ; ó
		dc.b   8
		dc.b $F0 ; ð
		dc.b   8
		dc.b   0
		dc.b $47 ; G
		dc.b $F4 ; ô
		dc.b $10
		dc.b $E8 ; è
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $FC ; ü
		dc.b   8
		dc.b $47 ; G
		dc.b $F5 ; õ
		dc.b $FE ; þ
		dc.b $EA ; ê
		dc.b   4
		dc.b   8
		dc.b $57 ; W
		dc.b $F5 ; õ
		dc.b $FE ; þ
		dc.b $EA ; ê
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $FF
		dc.b $80 ; €
		dc.b $80 ; €
		dc.b $80 ; €
		dc.b $80 ; €
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $FF
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $C0 ; À
		dc.b $40 ; @
		dc.b $40 ; @
		dc.b $40 ; @
		dc.b $40 ; @

	dcb.b 2056, $FF

unk_13400:			; DATA XREF: loadSubCpuPrg+28o
	incbin "programs\sub_cpu_prog1.bin"

defaultFontData:
	incbin "fonts\font_15000.bin"
word_15070:
	incbin "fonts\font_15070.bin"
word_15108:
	incbin "fonts\font_15108.bin"

unk_15300:
	incbin "misc\nemesis_15300.bin"

unk_1546E:
	incbin "misc\nemesis_1546E.bin"

off_15920:	dc.l unk_4C0078		; DATA XREF: sub_77FA+6o
		dc.b   0
		dc.b $90 ; 
		dc.b   0
		dc.b $AC ; ¬
		dc.b   0
		dc.b $C4 ; Ä
		dc.b   0
		dc.b $F2 ; ò
		dc.b   1
		dc.b   4
		dc.b   1
		dc.b $16
		dc.b   1
		dc.b $30 ; 0
		dc.b   1
		dc.b $4A ; J
		dc.b   1
		dc.b $62 ; b
		dc.b   1
		dc.b $7A ; z
		dc.b   1
		dc.b $84 ; „
		dc.b   1
		dc.b $B8 ; ¸
		dc.b   1
		dc.b $D2 ; Ò
		dc.b   1
		dc.b $E2 ; â
		dc.b   1
		dc.b $F2 ; ò
		dc.b   2
		dc.b $12
		dc.b   2
		dc.b $34 ; 4
		dc.b   2
		dc.b $56 ; V
		dc.b   2
		dc.b $90 ; 
		dc.b   2
		dc.b $B4 ; ´
		dc.b   2
		dc.b $B8 ; ¸
		dc.b   2
		dc.b $DA ; Ú
		dc.b   2
		dc.b $FC ; ü
		dc.b   3
		dc.b   6
		dc.b   3
		dc.b $60 ; `
		dc.b   3
		dc.b $7A ; z
		dc.b   3
		dc.b $C6 ; Æ
		dc.b   3
		dc.b $E2 ; â
		dc.b   3
		dc.b $FE ; þ
		dc.b   4
		dc.b $1E
		dc.b   4
		dc.b $50 ; P
		dc.b   4
		dc.b $72 ; r
		dc.b   3
		dc.b $38 ; 8
		dc.b   4
		dc.b $8E ; Ž
		dc.b   4
		dc.b $9C ; œ
		dc.b   3
		dc.b $A6 ; ¦
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $2A ; *
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $24 ; $
		dc.b   0
		dc.b $37 ; 7
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $2E ; .
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b  $F
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $30 ; 0
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $3B ; ;
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   0
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $28 ; (
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b $1C
		dc.b   0
		dc.b   2
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $38 ; 8
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $26 ; &
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b  $A
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b  $B
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $28 ; (
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $3B ; ;
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $2A ; *
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $25 ; %
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $26 ; &
		dc.b   0
		dc.b $29 ; )
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $3B ; ;
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   1
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $28 ; (
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   0
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $28 ; (
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   1
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   0
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   1
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $25 ; %
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $32 ; 2
		dc.b   0
		dc.b $3B ; ;
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   1
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $25 ; %
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $32 ; 2
		dc.b   0
		dc.b $3B ; ;
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   0
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $3A ; :
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $36 ; 6
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $28 ; (
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $30 ; 0
		dc.b   0
		dc.b $29 ; )
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $39 ; 9
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $2E ; .
		dc.b   0
		dc.b $2E ; .
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $2E ; .
		dc.b   0
		dc.b $2E ; .
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $38 ; 8
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $26 ; &
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b   3
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $28 ; (
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $21 ; !
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $3B ; ;
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $30 ; 0
		dc.b   0
		dc.b $31 ; 1
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $28 ; (
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $25 ; %
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $32 ; 2
		dc.b   0
		dc.b $2E ; .
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $27 ; '
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $32 ; 2
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $30 ; 0
		dc.b   0
		dc.b $3B ; ;
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $24 ; $
		dc.b   0
		dc.b $37 ; 7
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $30 ; 0
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $2A ; *
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $28 ; (
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b $1C
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $30 ; 0
		dc.b   0
		dc.b $37 ; 7
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $24 ; $
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $30 ; 0
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $37 ; 7
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $26 ; &
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $2D ; -
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b $27 ; '
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $21 ; !
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b $37 ; 7
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $25 ; %
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $32 ; 2
		dc.b   0
		dc.b $2E ; .
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $27 ; '
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $2A ; *
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $28 ; (
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b $1C
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $2F ; /
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $2A ; *
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $30 ; 0
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $30 ; 0
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $37 ; 7
		dc.b   0
		dc.b $29 ; )
		dc.b   0
		dc.b $2A ; *
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $28 ; (
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $27 ; '
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $3B ; ;
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $25 ; %
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $32 ; 2
		dc.b   0
		dc.b $3B ; ;
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $2F ; /
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $25 ; %
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $30 ; 0
		dc.b   0
		dc.b $30 ; 0
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $25 ; %
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $32 ; 2
		dc.b   0
		dc.b $3B ; ;
		dc.b   0
		dc.b $10
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $30 ; 0
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $39 ; 9
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $2A ; *
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $2A ; *
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $30 ; 0
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $27 ; '
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $2E ; .
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $26 ; &
		dc.b   0
		dc.b $3B ; ;
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $3A ; :
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b $10
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $25 ; %
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $32 ; 2
		dc.b   0
		dc.b $3B ; ;
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $25 ; %
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $32 ; 2
		dc.b   0
		dc.b $2E ; .
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $27 ; '
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $32 ; 2
		dc.b   0
		dc.b $2E ; .
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $28 ; (
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $36 ; 6
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $30 ; 0
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $32 ; 2
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $30 ; 0
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $10
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $26 ; &
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $29 ; )
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $30 ; 0
		dc.b   0
		dc.b $28 ; (
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $30 ; 0
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $35 ; 5
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $2B ; +
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $2D ; -
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $25 ; %
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $32 ; 2
		dc.b   0
		dc.b $3B ; ;
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $25 ; %
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $30 ; 0
		dc.b   0
		dc.b $30 ; 0
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b   2
		dc.b   0
		dc.b $28 ; (
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $23 ; #
		dc.b   0
		dc.b $36 ; 6
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $31 ; 1
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b $3B ; ;
		dc.b $FF
		dc.b $FF
		dc.b   0
		dc.b $2F ; /
		dc.b   0
		dc.b $27 ; '
		dc.b   0
		dc.b $30 ; 0
		dc.b   0
		dc.b $37 ; 7
		dc.b $FF
		dc.b $FF
unk_15DC6:	dc.b   0		; DATA XREF: sub_77EA+6o sub_77FA+Co
		dc.b   4
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   3
		dc.b   0
		dc.b   8
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b  $E
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $12
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $14
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $16
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $18
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $1A
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $1C
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $1E
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $20
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $22 ; "
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $24 ; $
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $26 ; &
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $28 ; (
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $2A ; *
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $2C ; ,
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $2E ; .
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $30 ; 0
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $32 ; 2
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $34 ; 4
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $36 ; 6
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $38 ; 8
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $3A ; :
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $3C ; <
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $3E ; >
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $40 ; @
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $42 ; B
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $44 ; D
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $46 ; F
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $48 ; H
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $4A ; J
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $4C ; L
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $4E ; N
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $50 ; P
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $52 ; R
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $54 ; T
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $56 ; V
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $58 ; X
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $5A ; Z
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $5C ; \
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $5E ; ^
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $60 ; `
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $62 ; b
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $64 ; d
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $66 ; f
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $68 ; h
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $6A ; j
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $6C ; l
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $6E ; n
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $70 ; p
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $72 ; r
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $74 ; t
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $76 ; v
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $78 ; x
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $7A ; z
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $7C ; |
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $7E ; ~
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $80 ; €
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $82 ; ‚
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $84 ; „
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $86 ; †
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $88 ; ˆ
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $8A ; Š
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b $8C ; Œ

	dcb.b 306, $FF

unk_16000:			; DATA XREF: loadSubCpuPrg+18o
	incbin "programs\sub_cpu_prog0.bin"

unk_1A000:			; DATA XREF: loadSubCpuPrg+38o
	incbin "programs\sub_cpu_prog2.bin"

	END
