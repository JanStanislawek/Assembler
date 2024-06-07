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
  
  mov rax, 0

  warunek:
  cmp rax, 5
  jb petla
  jmp wyj
  
  petla:
  ;intrukcje w petli
  inc rax  
  jmp warunek

  wyj:
  xor rax,rax
  xor rbx,rbx
  xor rcx,rcx
  pop rdi
	call ExitProcess
Start ENDP

END