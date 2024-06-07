EXTRN ExitProcess: PROC

.DATA

  a db 100 dup(2)
  b db 100 dup(?)
  
.CODE
Start PROC
  xor rax, rax
  xor rbx,rbx
  xor rcx,rcx
  xor rdx,rdx	; zerowanie rejstrów
  
  lea rsi, a		; zapisujemy adres a w rsi
  lea rdi, b		; zapisujemy adres b w rsi
  mov rcx, 100 	; przypisanie wartości 100 rcx

modyfi:		; etykieta modyfikująca blok
  lodsb		; załadowanie bajta z adresu RSI do AL
  add al, 5		; dodanie 5 do al
  stosb		; przechowanie adresu AL w rdi
  loop modyfi	; zapętlenie etykiety

  xor rax,rax
  xor rbx,rbx
  xor rcx,rcx
  xor rdx,rdx
	call ExitProcess
Start ENDP

END