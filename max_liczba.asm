EXTRN ExitProcess: PROC

.DATA
	dane dq 7, 64, 4,-2, 43, 5,-23, 1, 4, 2, 89, 0
.CODE

Start PROC
	xor rax, rax
	xor rbx, rbx
	xor rcx, rcx
	xor rdx, rdx

	lea rdx, dane		; pobranie adresu dane do rdx
	mov rax, [rdx + 8 * rcx]	; przypisanie pierwszej wartości ciągu do rax
	mov rbx, rax		; przeniesienie rax do rbx
		
porownanie:			; etykieta porównująca liczby
	cmp rax, 0 		; porównanie czy rax jest równe 0 
	je koniec			; jeśli jest równe 0 to skok do etykiety końcowej
	inc rcx			; inkrementacja rcx aby przesunąć się w ciągu
	mov rax, [rdx + 8 * rcx]	; przypisanie kolejnej wartości ciągu do rax
	cmp rax, rbx		; porównanie rax z rbx
	jle porownanie		; jeśli rax jest mniejsze lub równe to zostanie wykonany skok do etykiety porownanie
	mov rbx, rax		; jeśli rax nie jest mniejsze nastapi przeniesienie większej wartości do rbx
	jmp porownanie		; skok bezwarunkowy do etykiety porownanie

koniec:	
	call ExitProcess 	
Start ENDP

END