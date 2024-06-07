EXTRN GetStdHandle: PROC
EXTRN WriteFile: PROC
EXTRN lstrlen: PROC
EXTRN ExitProcess: PROC

.DATA

.CODE
Start PROC
  xor rax, rax
  xor rcx, rcx
  xor rbx, rbx ;zerowanie rejestrów

  mov rcx, 8d9bcah  ;przypisanie wartości do stosu rcx 64bit
  push cx  ;wepchnięcie na wierzcholek stosu 16 bitowej wartości
  push cx ;wepchnięcie na wierzcholek stosu 16 bitowej wartości
  push cx ;wepchnięcie na wierzcholek stosu 16 bitowej wartości
  push cx ;wepchnięcie na wierzcholek stosu 16 bitowej wartości
  pop rbx ;zdjęcie ze stosu całej 64 bitowej wartości na rbx
  pop rax 
  pop rax 
  pop rax
  pop rax 
  pop rax 
  pop rax
  pop rax 
  pop rax 
  pop rax ;zdjęcie ze stosu większej wartości niż jest na stosie

  xor rax,rax
  xor rcx,rcx
  xor rbx, rbx
	call ExitProcess
Start ENDP

END