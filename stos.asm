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

  mov rcx, 200  ;przypisanie rcx wartości 200
  push rcx  ;przepchnięcie rcx na wierzchołek stosu
  sub rcx,100 ;odjęcie 100 od rcx czyli wartość w rcx wynosi 100
  push rcx  ;przepchnięcie rcx na wierzchołek stosu czyli nasz wierzchołek stosu wynosi 100
  mov rbx, 120 ;przypisanie rbx wartości 120
  push rbx ;przepchnięcie rbx na wierzchołek stosu czyli nasz wierzchołek stosu wynosi 120

  pop rax ;zdjęcie ze stosu najwyższego adresu czyli w tym przypadku rbx i zapisanie wartości zdjętej w rax  
  pop rax ;zdjęcie ze stosu najwyższego adresu czyli w tym przypadku rcx o wartości 100 i zapisanie wartości zdjętej w rax
  pop rax ;zdjęcie ze stosu najwyższego adresu czyli w tym przypadku rcx o wartości 200 i zapisanie wartości zdjętej w rax

  xor rax,rax
  xor rcx,rcx
  xor rbx, rbx
	call ExitProcess
Start ENDP

END