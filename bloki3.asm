EXTRN ExitProcess: PROC

.DATA

  a db 100 dup(3) 	; bloki nie różnią się 
  b db 100 dup(3)
  
.CODE
Start PROC
  xor rax, rax
  xor rbx,rbx
  xor rcx,rcx
  xor rdx,rdx	; zerowanie rejstrów
  
  lea rsi, a		; zapisujemy adres a w rsi
  lea rdi, b		; zapisujemy adres b w rsi
  mov rcx, 100 	; przypisanie wartości 100 rcx
  repe cmpsb	; porównanie bloków
  jne nierowne	; jesli bloki nie są równe zostanie wykonany skok do etykiety nierowne	

rowne :		; jesli bloki są rowne 
  mov rax, 2	; przypisanie wartości 2 do rax jesli są rowne
  jmp wyjscie	; skok do etykiety wyjściowej

nierowne:		; jesli bloki nie sa rowne
  mov rax,1	; przypisanie wartości 1 do rax jesli są rowne

wyjscie:		; wyjscie z programu
  xor rax,rax
  xor rbx,rbx
  xor rcx,rcx
  xor rdx,rdx
	call ExitProcess
Start ENDP

END