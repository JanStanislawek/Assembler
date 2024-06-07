EXTRN GetStdHandle: PROC
EXTRN WriteFile: PROC
EXTRN lstrlen: PROC
EXTRN ExitProcess: PROC

.DATA

  silnia dq 5

.CODE
Start PROC
  xor rax, rax
  xor rbx,rbx
  xor rcx, rcx
  xor rdx,rdx	; czyszczenie rejstrów
  
  mov rcx, silnia	; przeniesienie wartości 5 do rcx
  call SilniaIter	; wywołanie procedury SilniaIter
Start ENDP

SilniaIter PROC	; procedura SilniaIter
  Porownanie:	; etykieta prównująca czy rcx = 0
  cmp rcx, 0	; porówanie
  jne Przeniesienie  	; jeśli rcx nie jest równe 0 zostanie wykonany skok do procedury przeniesienie
  mov rax, 1	; jeśli rcx = 0 to rax = 1
  call ExitProcess 	; zakończenie programu

  Przeniesienie:	;etykieta przeniesienie
  mov rax, 1	; przeniesienie wartości 1 do rax aby nie mnożyć przez 0

  Petla:		; etykieta petla
  mul rcx		; mnożenie rcx * rax
  loop Petla	; instrukcja loop, czyli pętla wykorzystuje rcx jako licznik i dekrementuje rcx po każdym przejściu 
SilniaIter ENDP	; zakończenie procedury
  call ExitProcess
END