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
  rep movsb	; przenoszenie danych z rsi do rdi

  xor rax,rax
  xor rbx,rbx
  xor rcx,rcx
  xor rdx,rdx
	call ExitProcess
Start ENDP

END