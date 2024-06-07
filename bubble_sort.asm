Extrn ExitProcess: PROC
.data
 	arr dq 1.75, 2.4, 12.53, 1.2, 2.53, 4.54, 3.21
 	n dq 7

.code
Start PROC
	xor rax, rax
	xor rbx, rbx
	xor rcx, rcx
	xor rdx, rdx

	lea rdx, arr	; pobranie adresu arr do rdx
	mov rbx, n	; przeniesienie wartości n do rbx
	dec rbx		; dekrementacja rbx ponieważ indeksujemy od zera

zewPetla:
	xor rcx, rcx	; zerowanie rejestru rcx
	mov rax, rbx	; przeniesienie wartości rbx do rax, rax jest licznikiem dla tej petli
wewPetla:
	call sort		; wywołanie procedury sort
	dec rax		; dekrementacja rax 
	jne wewPetla	; jesli rax nie jest równe 0 to zosatnie wykonany skok do wewPetla

	dec rbx		; dekrementacja rbx poniewaz jest licznikiem tej petli
	jne zewPetla	; jesli rax nie jest równe 0 to zostanie wykonany skok do zewPetla
	
	call ExitProcess
Start ENDP

sort PROC
	finit			
	fld qword ptr [rdx + 8 *rcx]	; załadowanie pierwszej wartości
	inc rcx			; inkrementacja rcx
	fld qword ptr [rdx + 8 *rcx]	; załadowanie kolejnej wartości
	fcomi st(0), st(1)		; porownanie
	ja koniec			; jesli wartosc jest wieksza to skoczymy do etykiety koniec
	dec rcx			; dekrementacja rcx
	fstp qword ptr [rdx + 8 *rcx]	; wrzucenie do pamieci i zdjecie ze stosu 
	inc rcx			; inkrementacja rcx
	fstp qword ptr [rdx + 8 *rcx]	; wrzucenie do pamieci i zdjecie ze stosu 
koniec:		
	ret			; powrót do wywołania porcedury

sort ENDP
END

