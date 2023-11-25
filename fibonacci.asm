        %define  SYS_EXIT   1
        %define  SYS_READ   3
        %define  SYS_WRITE  4
        %define  STDIN      0
        %define  STDOUT     1
        %define  STDERR     2
        %define  MAX_NUMBER   5000


section .data
    somme dd 0
    u0 dd 0
    u1 dd 1
    utemp dd 0
    index dd 1
    ITERATION_MAX db 20 ;Not a constant because we assign it with aoi

    format: db "u %d = %d." , 10

SECTION .bss
    input: resd MAX_NUMBER

section .text
    global main
    extern printf   ;Needed to print integers
    extern atoi     ;Needed to convert string to int

main:

    ;Lecture argument
    mov EAX, SYS_READ
    mov EBX, STDIN
    mov ECX, input
    mov EDX, MAX_NUMBER 
    int 80H
    mov DWORD[input + EAX - 1], 0

    ;Convertion en caractères
    push dword input
	call atoi
	add ESP, 4

    ;MAJ du nombre d'itérations
    mov [ITERATION_MAX], DWORD eax

    
    
    ; Boucle for

    boucle_for:

        ; Calcul de la somme
        mov eax, [u0]
        mov ebx, [u1]

        add eax, ebx

        ;On ajoute temporairement le résultat
        mov [utemp], eax

        ;On assigne à u0 la valeur de u1
        mov eax,[u1]
        mov [u0],eax

        ;On assigne maintenant à u1 la valeur de utemp
        mov eax,[utemp]
        mov [u1],eax
        ; Appel système pour afficher le caractère
        
        mov eax, [u0]
        push eax
        mov eax,[index]
        push eax
        push format
        call printf
        add esp, 12
        

    

        ; Incrémentation
        mov eax, [index]
        add eax, 1
        mov [index], eax

        ; Vérification de l'index
        mov eax, [index]
        mov ebx, [ITERATION_MAX]

        cmp eax, ebx
        jl boucle_for

    fin_programme:
        mov eax, 1
        xor ebx, ebx
        int 0x80
