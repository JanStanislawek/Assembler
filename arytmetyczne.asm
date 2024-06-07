EXTRN GetStdHandle: PROC
EXTRN WriteFile: PROC
EXTRN lstrlen: PROC
EXTRN ExitProcess: PROC

.DATA
  A dq 800h
  B dq 600h

.CODE
Start PROC
  push rdi
  sub rsp,28h
  xor rax, rax      	
  xor rcx, rcx	

  mov rax, a   	
  add rax, b 	
  sub rax, 2000h 	
  mov rbx, 400h
  mul rbx 		
  mov rbx, 200h	
  dec rax 		
  inc rax 			
  adc rbx, 1000h	
  sbb rax, rbx 
  shl rax, 8	
  shr rax, 8	

  xor rax, rax	
  xor rcx, rcx	
  pop rdi
	call ExitProcess
Start ENDP

END