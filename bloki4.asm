EXTRN ExitProcess: PROC

.DATA
  a byte 100 DUP(3)
  b byte 100 DUP(3)

.CODE
Start PROC

  xor rax, rax
  xor rbx,rbx
  xor rcx,rcx
  xor rdx,rdx	; zerowanie rejstrów
  
  mov rcx, 100	; przenosimy wartość 100 do rcx
  mov [b + 12], 5	; modyfikacja bloku 
  mov rax, 5	; przenosimy wartość 5 do rax aby zmodyfikować blok danych
  lea rsi, a		; zapisujemy adres a w rsi
  lea rdi, b		; zapisujemy adres b w rdi
  repne scasb	; porówananie al z bajtem w rdi
  mov rax, 100   	; przenosimy 100 do rax
  sbb rax, rcx	; odejmujemy aby odnaleźć miejsce modyfikacji

  xor rax,rax
  xor rbx,rbx
  xor rcx,rcx
  xor rdx,rdx
Start ENDP
call ExitProcess
END
