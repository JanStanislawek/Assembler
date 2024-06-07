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
  xor rdx,rdx	; czyszcenie rejestrów

  mov rcx, silnia 	; przeniesienie wartości 5 do rcx
  call SilniaRek	; wywołanie procedury SilniaRek
  call ExitProcess	; wyjście z programu
Start ENDP

SilniaRek PROC 	; procedura SilniaRek
  cmp rcx, 0 	; porównanie czy rcx = 0
  jne obliczSilnia	; jeśli rcx nie jest równe 0 skok do etykiety obliczSilnia
  mov rax, 1	; przeniesienie wartości 1 do rax
  ret		; powrót do wywołania procedury

  obliczSilnia:	; etykieta obliczSilnia
  push rcx		; wypchnięcie rcx na górę stosu
  dec rcx 		; dekrementacja rcx
  call SilniaRek  	; wywołanie procedury SilniaRek
  pop rcx		; zdjęcie wartości z góry stosu do rcx
  mul rcx		; mnożenie rcx*rax
  ret		; powrót do wywołania procedury

SilniaRek ENDP
	
END