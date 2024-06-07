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
  
  porownanie:
  mov rax, 5
  mov rbx, 10
  cmp rax, rbx
  ja to
  jbe lub 

  to:
  sub rax, rbx
  jmp wyj

  lub:
  adc rax, rbx 

  wyj:
  xor rax,rax
  xor rbx,rbx
  pop rdi
	call ExitProcess
Start ENDP

END