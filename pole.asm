EXTRN GetStdHandle: PROC
EXTRN WriteFile: PROC
EXTRN lstrlen: PROC
EXTRN ExitProcess: PROC

.DATA

  bokA dq 5
  bokB dq 10

.CODE
Start PROC
  xor rax, rax
  xor rbx,rbx
  xor rcx, rcx
  xor rdx,rdx	; czyszczenie rejestrów
  
  mov rcx, bokA  	
  mov rdx, bokB	; przeniesienie wartości do rejestrów
  call Prostokat	; wywołanie procedury Prostokat
Start ENDP

Prostokat PROC  	; pocedura Prostokat
  mov rax, rcx	; przeniesienie wartości z rcx do rax, ponieważ w nast.epnej linijece korzystamy z polecenia mul
  mul rdx		; mnożenie rejestrów
Prostokat ENDP	; zakończenie procedury
  call ExitProcess	; wyjście z programu
END