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
  xor rbx, rbx	

  mov rbx, 01011010b
  mov rax, 11011000b
  and rax, rbx
	
  mov rbx, 01011010b
  mov rax, 11011000b
  test rax, rbx

  mov rax, 11011000b
  not rax 
 
  mov rax, 11011000b
  neg rax  

  mov rbx, 01011010b
  mov rax, 11011000b
  or rbx, rax

  mov rbx, 01011010b
  mov rax, 11011000b
  xor rax, rbx

  xor rax, rax	
  xor rbx, rbx	
  pop rdi
	call ExitProcess
Start ENDP

END