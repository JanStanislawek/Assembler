EXTRN ExitProcess: PROC

.DATA
  	xp dq -1.2		; początek przedziału
	xk dq 5.34	; koniec przedziału
	n dq 10		; ilość prostokątów
	temp dq ?		
	func dq ?
	calka dq 0.0
	przedzial dq ?
	
	;f(x) = 2x^2 - 3x + pi
.CODE

Start PROC
	xor rax, rax
	xor rbx, rbx
	xor rcx, rcx
	xor rdx, rdx

	finit
	
	fld qword ptr [xp]	; załadowanie wartości xp do ST(0)
	fld qword ptr [xk]	; załadowanie wartości xk do ST(1)
	fsub st(0),st(1)	; odejmowanie st(0) = st(1) - st(0) xp = xk-xp
	fild qword ptr [n]	; załadowanie ilości prostokątow do ST(0)
	fdiv 		; dzielenie wynikOdejmowania ST(1) / n ST(0)
	fst [przedzial]	; przesłanie wyniku

petla:
	lea rcx, [xp]	; pobranie adresu xp i zapisanie w rcx
	call funkcja	; wywołanie procedury funkcja
	call wynik		; wywołanie procedury wynik
	inc rax		; inkrementacja rax
	cmp rax, [n]	; porównanie rax z ilością prostokątów 	
	jne petla		; jesli nie jest równe zostaje wykonany skok do petla
	
	fld qword ptr [calka]	; w przeciwnym razie zostanie zwrócony wynik całki w st(0)

	call ExitProcess 	; wyjscie z programu
Start ENDP

funkcja PROC
	finit		
	mov [temp], 2	; przeniesienie 2 do temp aby wykonać operacje 2*x
	fld qword ptr [rcx]	; załadowanie xp do st(0)
	fmul st(0), st(0)	; potęga x^2
	fild [temp]		; załadowanie zmiennej do st(0)
	fmul st(0), st(1)	; mnożenie 
	fst [func]		; przesałanie wyniku do func

	mov [temp], -3	; przeniesienie -3 do temp aby wykonać operacje -3*x
	fld qword ptr [rcx]	; załadowanie xp do st(0)
	fild [temp]		; załadowanie -3 do temp aby wykonać operacje -3*x
	fmul st(0), st(1)	; mnożenie 
	fst [temp]		; przesałanie wyniku do temp 
	
	fld qword ptr [func]	; załadowanie func
	fld qword ptr [temp]	; załadowanie temp
	fadd st(0), st(1)	; dodanie
	fldpi		; załadowanie liczby pi 
	fadd st(0), st(1)	; dodanie 
	fst [func]		; przesłanie do func
	ret		; powrót do wywołania procedury
funkcja ENDP

wynik PROC
	finit
	fld qword ptr [func]	; załadowanie wartości zapisanej w func
	fld qword ptr [przedzial]	; załadowanie wartości zapisanej w przedzial
	fmul st(0), st(1)	; mnozenie
	fabs		; wartość bezwzględna aby pole nie wyszlo ujemne
	fld qword ptr [calka]	; zaladowanie wartości zapisanej w calka
	fadd st(0), st(1)	; dodawanie
	fst [calka]		; przesłanie wyniku do calka

	fld qword ptr [xp]	; załadowanie wartości zapisanej w xp 
	fld qword ptr [przedzial]	; załadowanie wartości zapisanej w przedzial  
	fadd st(0), st(1)	; dodawanie 
	fst [xp]		; przesłanie wyniku do xp
	ret		; powrot do wywołania funkcji
wynik ENDP

END