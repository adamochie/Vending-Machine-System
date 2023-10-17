TITLE Project	(main.asm)

INCLUDE Irvine32.inc
INCLUDE Macros.inc

.data
money1 DWORD 0
money2 DWORD 0
money3 DWORD 0
totalmoney DWORD 0
opchoice DWORD 0
quantity DWORD 0
balance DWORD 0
op1 DWORD 0

.code
main PROC
	
MainMenu:
	call clrscr
	mov ecx, 64																;move the value 64 to ecx as a counter
	L1 :
		mov  eax,green														;move green to eax
		call SetTextColor													;set the output font colour to green 
		mWrite "*"															;write a character '*' 
		loop L1																;looping L1 until ecx deducted to 0
	
	call Crlf																;add newline
	mov  eax,white															;move white to eax
	call SetTextColor														;set the output font colour to white
	call Crlf																;add newline
	mWrite "                WELCOME TO PARGOY'S VENDING MACHINE"			;write the string
	call Crlf																;add newline
	call Crlf																;add newline

	mov  eax,green															;move green to eax
	call SetTextColor														;set the output font colour to green

	mov ecx, 64																;move 64 to ecx as a counter
	L2 :
		mWrite "*"															;write a character '*' 
		loop L2																;looping L2 until ecx deducted to 0

	call Crlf																;add newline
	call Crlf																;add newline

	mov ecx, 64																;move 64 to ecx as a counter
	L3 :
		mov  eax,green														;move green to eax
		call SetTextColor													;set the output font colour to green
		mWrite "*"															;write a character '*'
		loop L3																;looping L3 until ecx deducted to 0
	
	call Crlf																;add newline
	call Crlf																;add newline
	mov  eax,white															;move white to eax
	call SetTextColor														;set the output font colour to white
	mWrite "                IN OUR VENDING MACHINE, WE HAVE:"				;write the string
	call Crlf																;add newline
	mWrite "                     1 - TEA    : 60  CENTS"					;write the string
	call Crlf																;add newline
	mWrite "                     2 - CHOCO  : 70  CENTS"					;write the string
	call Crlf																;add newline
	mWrite "                     3 - COFFEE : 100 CENTS"					;write the string
	call Crlf																;add newline
	mWrite "                     4 - MOCHA  : 120 CENTS"					;write the string
	call Crlf																;add newline
	call Crlf																;add newline
	
	mov ecx, 64																;move 64 to ecx as a counter
	L4 :
		mov  eax,green														;move green to eax
		call SetTextColor													;set the output font colour to green
		mWrite "*"															;write a character '*'
		loop L4																;looping L4 until ecx deducted to 0

	mov  eax,white															;move white to eax
	call SetTextColor														;set the output font colour to white
	call Crlf																;add newline
	call Crlf																;add newline
	
	mWrite "PLEASE INPUT MONEY (CENTS):"									;write the string
	call Crlf																;add newline
	mWrite "10 CENT : "														;write the string
	call ReadInt															;read input
	mov ebx, 10																;move 10 to ebx
	mul ebx																	;multiply value that user input with ebx
	mov money1, eax															;move the product of multiplication to money1

	mWrite "20 CENT : "														;write the string
	call ReadInt															;read input
	mov ebx, 20																;move 20 to ebx
	mul ebx																	;multiply value that user input with ebx
	mov money2, eax															;move the product of multiplication to money2

	mWrite "50 CENT : "														;write the string
	call ReadInt															;read input
	mov ebx, 50																;move 50 to ebx
	mul ebx																	;multiply value that user input with ebx
	mov money3, eax															;move the product of multiplication to money

	mov ecx, totalmoney
	add ecx, money1
	add ecx, money2
	add ecx, money3
	mov totalmoney, ecx

	call Crlf
	mov eax, totalmoney
	mWrite "YOUR MONEY : "
	call WriteDec					;Write standard output decimal format
	mWrite " CENTS"
	call Crlf

	cmp totalmoney, 60				;compare 60 with total money
	jl VALIDATION1					;if value less than the price

	cmp totalmoney, 60
	jge ITEM						;jump if greater or equal
	
	call Crlf
	mov  eax,green
	call SetTextColor
	
	mov ecx, 64
	L5 :
		mWrite "*"
		loop L5
	call Crlf
	call Crlf

VALIDATION1:
	call Crlf
	mwrite "INSUFFICIENT MONEY!! TAKE BACK YOUR MONEY."
	call Crlf

	mWrite "HERE IS YOUR CHANGE : "
	call WriteDec
	mWrite " CENTS"
	call Crlf
	call Crlf

	mWrite "DO YOU WANT TO DO ANOTHER PURCHASE ? (0- YES || 1- NO) : "
	call ReadInt
	mov op1, eax

	cmp op1, 0
	mov totalmoney, 0
	jz MainMenu

	cmp op1, 1
	je exitCall

	cmp op1, 0
	jl VALIDATION2

	cmp op1, 1
	jg VALIDATION2

	mov totalmoney, 0
	mov eax, 2000
	call delay
	call clrscr
	jmp MainMenu
	
ITEM :
	mov  eax,white
	call SetTextColor
	mWrite "PLEASE CHOOSE ITEM : "
	call ReadInt
	mov opchoice, eax
	
	cmp opchoice, 1
	je opTea

	cmp opchoice, 2
	je opChoco

	cmp opchoice, 3
	je opCoffee

	cmp opchoice, 4
	je opMocha 


VALIDATION3:
	call Crlf
	mwrite "YOUR SELECTION IS NOT IN THE LIST!! PLEASE RE-ENTER."
	mov opchoice, 0
	call Crlf
	call Crlf
	jmp ITEM

;////////////////////////////////////////////////////////////
opTea :
	call Crlf
	mWrite "PLEASE ENTER THE QUANTITY : "
	call ReadInt
	mov quantity, eax 
	mov eax, 60
	mul quantity
	jmp BALANCE1

opChoco :
	call Crlf
	mWrite "PLEASE ENTER THE QUANTITY : "
	call ReadInt
	mov quantity, eax 
	mov eax, 70
	mul quantity
	jmp BALANCE2

opCoffee :
	call Crlf
	mWrite "PLEASE ENTER THE QUANTITY : "
	call ReadInt
	mov quantity, eax 
	mov eax, 100
	mul quantity
	jmp BALANCE3

opMocha :
	call Crlf
	mWrite "PLEASE ENTER THE QUANTITY : "
	call ReadInt
	mov quantity, eax 
	mov eax, 120
	mul quantity
	jmp BALANCE4

;/////////////////////////////////////////////////
BALANCE1 :
	call Crlf
	
	cmp totalmoney, eax
	jl VALIDATION6

	sub totalmoney, eax
	mov eax, totalmoney
	mWrite "HERE IS YOUR TEA"
	call Crlf
	mWrite "HERE IS YOUR CHANGE : "
	call WriteDec
	jmp STARTING

BALANCE2 :
	call Crlf

	cmp totalmoney, eax
	jl VALIDATION6

	sub totalmoney, eax
	mov eax, totalmoney
	mWrite "HERE IS YOUR CHOCO"
	call Crlf
	mWrite "HERE IS YOUR CHANGE : "
	call WriteDec
	jmp STARTING

BALANCE3 :
	call Crlf

	cmp totalmoney, eax
	jl VALIDATION6

	sub totalmoney, eax
	mov eax, totalmoney
	mWrite "HERE IS YOUR COFFEE"
	call Crlf
	mWrite "HERE IS YOUR CHANGE : "
	call WriteDec
	jmp STARTING

BALANCE4 :
	call Crlf

	cmp totalmoney, eax
	jl VALIDATION6

	sub totalmoney, eax
	mov eax, totalmoney
	mWrite "HERE IS YOUR MOCHA"
	call Crlf
	mWrite "HERE IS YOUR CHANGE : "
	call WriteDec
	jmp STARTING

;/////////////////////////////////////////////

VALIDATION6 :
	call Crlf
	mwrite "INSUFFICIENT MONEY!!"
	call Crlf
	mWrite "TAKE YOUR MONEY BACK, HERE IS YOUR BALANCE : "
	mov eax, totalmoney
	call WriteDec
	mWrite " CENTS"
	call Crlf 
	call Crlf
	mWrite "DO YOU WANT TO DO ANOTHER PURCHASE ? (0- YES || 1- NO) : "
	call ReadInt
	mov op1, eax

	cmp op1, 0
	mov totalmoney, 0
	jz MainMenu

	cmp op1, 1
	je exitCall

	cmp op1, 0
	jl VALIDATION2

	cmp op1, 1
	jg VALIDATION2
	

;/////////////////////////////////////////////

STARTING :
	call Crlf
	call Crlf
	mWrite "DO YOU WANT TO DO ANOTHER PURCHASE ? (0- YES || 1- NO) : "
	call ReadInt
	mov op1, eax

	cmp op1, 0
	mov totalmoney, 0
	jz MainMenu

	cmp op1, 1
	je exitCall

	cmp op1, 0
	jl VALIDATION2

	cmp op1, 1
	jg VALIDATION2

;//////////////////////////////////////////////////

VALIDATION2 :
	mov ecx, 64																;move 64 to ecx as a counter
	L7 :
		mov  eax,green														;move green to eax
		call SetTextColor													;set the output font colour to green
		mWrite "*"															;write a character '*'
		loop L7																;looping L4 until ecx deducted to 0
	call Crlf
	mov  eax,white														;move white to eax
		call SetTextColor
	mwrite "INVALID OPTION!! PLEASE RE-ENTER."
	jmp STARTING

	

exitCall:
	call Crlf
	call Crlf
	mWrite <"THANKS FOR USING PARGOY'S VENDING MACHINE. HAVE A GOOD DAY! :)", 0Dh, 0Ah, 0Dh, 0Ah>
	mov  eax,green
	call SetTextColor
	
	mov ecx, 64
	L6 :
		mWrite "*"
		loop L6
	call Crlf
	call WaitMsg


	
	exit
main ENDP

END main