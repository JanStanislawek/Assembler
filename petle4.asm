EXTRN GetStdHandle: PROC
EXTRN WriteFile: PROC
EXTRN lstrlen: PROC
EXTRN ExitProcess: PROC

.DATA

.CODE
Start PROC
  push rdi
  sub rsp,28h
  xor rax, rax
  xor rbx,rbx
  xor rcx,rcx
  
  mov rcx, 1

  petla:
  ;instrukcja do 
  inc rcx
  ;warunek while 
  cmp rcx, 5
  jne petla

  xor rax,rax
  xor rbx,rbx
  xor rcx,rcx
  pop rdi
	call ExitProcess
Start ENDP

END