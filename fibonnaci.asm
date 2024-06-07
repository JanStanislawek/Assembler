EXTRN ExitProcess: PROC

.DATA
	ile dq 5
.CODE

Start PROC
	xor rax, rax
	xor rbx, rbx
	xor rcx, rcx
	xor rdx, rdx

	mov rax, 1	; przeniesienie do rax pierwszej wartości ciągu 
	mov rbx, 1	; przeniesienie do rax drugiej wartości ciągu 

petla:			; etykieta petla wykonująca dodawanie kolejnych wartości ciągu i wrzucanie ich na stos
	add rax, rbx 	; dodanie wartości ciągu i zapisanie w rax	
	push rax		; wepchanie wartości zapisanej w rax na górę stosu
	inc rcx		; inkrementacja rcx 
	add rbx, rax 	; dodanie kolejnych wartości ciągu i zapisanie w rbx
	push rbx		; wepchanie wartości zapisanej w rbx na górę stosu
	inc rcx		; inkrementacja rcx
	cmp rcx, [ile]	; porównanie rcx z wartością zapisną w ile
	jb petla		; jeśli rcx < ile to skok do petla

	mov rcx, 0 	; zerowanie rcx
wynik:			; etykieta wyświetlająca kolejne wartości
	pop rdx		; zepchnięcie wartości wierzchołka stosu do rdx
	inc rcx 		; inkrementacja rcx
	cmp rcx, [ile]	; porównanie rcx z wartością zapisną w ile
	jne wynik		; jeśli rcx != ile skok do etykiety wynik
	pop rdx		; zepchnięcie ostaniej wartości stosu do rdx
	
	call ExitProcess 	
Start ENDP

END