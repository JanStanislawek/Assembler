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
  
  mov rax, 5
  mov rbx, 10
  sub rax, rbx
  
  xor rax,rax
  xor rbx,rbx

  mov rax, 25
  mov rbx, 10
  adc rax, rbx
  
  xor rax,rax
  xor rbx,rbx

  mov rax, 20
  mov rbx, 20
  adc rax, rbx
  
  xor rax,rax
  xor rbx,rbx

  mov rax,  10
  mov rbx, 10
  sub rax, rbx

  xor rax,rax
  xor rbx,rbx
  pop rdi
	call ExitProcess
Start ENDP

END