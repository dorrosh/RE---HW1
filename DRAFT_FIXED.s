	.file	"mainShort.c"
	.intel_syntax noprefix
	.text
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "road\0"
LC1:
	.ascii "settlement\0"
LC2:
	.ascii "city\0"
LC3:
	.ascii "development\0"
LC4:
	.ascii "%s\0"
LC5:
	.ascii "%02d %02d %02d %02d %02d\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB16:
	push	ebp
	mov	ebp, esp
	push	esi
	push	ebx
	and	esp, -16
	sub	esp, 80
	call	___main
	mov	DWORD PTR [esp+60], 0
	mov	DWORD PTR [esp+64], 0
	mov	DWORD PTR [esp+68], 0
	mov	DWORD PTR [esp+72], 0
	mov	DWORD PTR [esp+76], 0
	mov	DWORD PTR [esp+40], 0
	mov	DWORD PTR [esp+44], 0
	mov	DWORD PTR [esp+48], 0
	mov	DWORD PTR [esp+52], 0
	mov	DWORD PTR [esp+56], 0
	jmp	L2
L6:

	push 0x0       		
	push 0x41797261		
	push 0x7262694c		
	push 0x64616f4c		
	push esp            

	call FindFunction   
	add esp, 0x14       

	push 0x00006c6c		
	push 0x642e7472		
	push 0x6376736d		
	push esp

	call eax            
	add esp, 0x0c      

	push eax            
	push 0x00007373		# pushing null,s,s
	push 0x65726464		# pushing e,r,d,d
	push 0x41636f72		
	push 0x50746547		
	push esp            

	call FindFunction   # call FindFunction("GetProcAddress")
	add esp, 0x14       # clear stack
	pop ebx             # restore module handle for msvcrt
	mov edi, ebx
	mov edx, eax
	
	push 0x0000706d # mp, null
	push 0x63727473 # strc
	push esp            # push pointer for "strcmp"
	push edi            # push module handle for msvcrt
	call edx            # call GetProcAddress(msvcrt, "strcmp")
	add esp, 0x08       # clear stack (note arguments are cleared already)
	lea	ecx, [esp+60]	 # ecx is not backed up - check cdecl convention
	mov	DWORD PTR [esp], ecx
	push 0x00000000 # null
	push 0x64616f72 # d, a, o, r
	call eax # call strcmp
	add esp, 0x08
	#call	_strcmp
	test	eax, eax	 
	jne	L3
	mov	eax, DWORD PTR [esp+40]	 # _2, resources
	add	eax, 1	 # _3,
	mov	DWORD PTR [esp+40], eax	 
	mov	eax, DWORD PTR [esp+44]	 # _4, resources
	add	eax, 1	 # _5,
	mov	DWORD PTR [esp+44], eax	 # resources, _5
	jmp	L4	 #
L3:
	
	push 0x0000706d # mp, null
	push 0x63727473 # strc
	push esp            # push pointer for "strcmp"
	push edi            # push module handle for msvcrt
	call edx            # call GetProcAddress(msvcrt, "strcmp")
	add esp, 0x08       # clear stack (note arguments are cleared already)
	lea	ecx, [esp+60]	 # ecx is not backed up - check cdecl convention
	mov	DWORD PTR [esp], ecx
	push 0x0000746e #
	push 0x656d656c # 
	push 0x74746573 # t ,t, e, s
	call eax # call strcmp
	add esp, 0x0c
 
	test	eax, eax	 # _6
	jne	L5	 
	mov	eax, DWORD PTR [esp+40]	 # _7, resources
	add	eax, 1	 # _8,
	mov	DWORD PTR [esp+40], eax	 # resources, _8
	mov	eax, DWORD PTR [esp+44]	 # _9, resources
	add	eax, 1	 # _10,
	mov	DWORD PTR [esp+44], eax	 # resources, _10
	mov	eax, DWORD PTR [esp+48]	 # _11, resources
	add	eax, 1	 # _12,
	mov	DWORD PTR [esp+48], eax	 # resources, _12
	mov	eax, DWORD PTR [esp+52]	 # _13, resources
	add	eax, 1	 # _14,
	mov	DWORD PTR [esp+52], eax	 # resources, _14
	jmp	L4	 #
L5:

	push 0x0000706d # mp, null
	push 0x63727473 # strc
	push esp            # push pointer for "strcmp"
	push edi            # push module handle for msvcrt
	call edx            # call GetProcAddress(msvcrt, "strcmp")
	add esp, 0x08       # clear stack (note arguments are cleared already)
	lea	ecx, [esp+60]	 # ecx is not backed up - check cdecl convention
	mov	DWORD PTR [esp], ecx
	push 0x00000000 # null
	push 0x79746963 # y, t, i, c
	call eax # call strcmp
	add esp, 0x08
	
	test	eax, eax	 # _15
	jne	L4	
	mov	eax, DWORD PTR [esp+52]	 # _16, resources
	add	eax, 2	 # _17,
	mov	DWORD PTR [esp+52], eax	 # resources, _17
	mov	eax, DWORD PTR [esp+56]	 # _18, resources
	add	eax, 3	 # _19,
	mov	DWORD PTR [esp+56], eax	 # resources, _19
L4:

	push 0x0000706d # mp, null
	push 0x63727473 # strc
	push esp            # push pointer for "strcmp"
	push edi            # push module handle for msvcrt
	call edx            # call GetProcAddress(msvcrt, "strcmp")
	add esp, 0x08       # clear stack (note arguments are cleared already)
	lea	ecx, [esp+60]	 # ecx is not backed up - check cdecl convention
	mov	DWORD PTR [esp], ecx
	push 0x00746e65 # 
	push 0x6d706f6c # 
	push 0x65766564 #
	call eax # call strcmp
	add esp, 0x08
	
	test	eax, eax	 # _20
	jne	L2	 #,
	mov	eax, DWORD PTR [esp+48]	 # _21, resources
	add	eax, 1	 # _22,
	mov	DWORD PTR [esp+48], eax	 # resources, _22
	mov	eax, DWORD PTR [esp+52]	 # _23, resources
	add	eax, 1	 # _24,
	mov	DWORD PTR [esp+52], eax	 # resources, _24
	mov	eax, DWORD PTR [esp+56]	 # _25, resources
	add	eax, 1	 # _26,
	mov	DWORD PTR [esp+56], eax	 # resources, _26
L2:
	
	#check correctness??
	mov DWORD PTR [esp+12], 0x00000066		# pushing null,f
	mov DWORD PTR [esp+8], 0x6e616373		# pushing n,a,c,s
	push eax
	lea eax , [esp+8]
	mov [esp+4], eax            # push pointer for "scanf"
	pop eax
	mov [esp], ebx            # push module handle for msvcrt
	mov edi, ebx 
	mov edx, eax # save GetProcAddress address
	call eax            # call GetProcAddress(msvcrt, "scanf")
	add esp, 0x08       # clear stack (note arguments are cleared already)	
	# prepare parametes for scanf
	push ebx
	mov	ebx, DWORD PTR [esp+60]
	mov	DWORD PTR [esp+4], ebx
	pop ebx
	mov	DWORD PTR [esp], 0x00007325 # "&s\0"
	call eax            # call scanf
	#add esp, 0x14       # clear stack
	#call	_scanf
	
	cmp	eax, -1
	jne	L6	 
 # mainShort:c:33:     printf("%02d %02d %02d %02d %02d",resources[0], resources[1], resources[2], resources[3], resources[4])#
	mov	esi, DWORD PTR [esp+44]
	mov	DWORD PTR [esp+8], esi
	mov	esi, DWORD PTR [esp+56]	 
	mov	ebx, DWORD PTR [esp+52]	 
	mov	ecx, DWORD PTR [esp+48]	 
	mov	eax, DWORD PTR [esp+40]	 
	mov	DWORD PTR [esp+20], esi	 
	mov	DWORD PTR [esp+16], ebx	 
	mov	DWORD PTR [esp+12], ecx	
		 
	mov	DWORD PTR [esp+4], eax	 
	
	#check correctness??
	push 0x00000066		# pushing null,f,t
	push 0x6e616373		# pushing n,i,r,p
	push esp            # push pointer for "printf"
	push edi            # push module handle for msvcrt
	
	call edx            # call GetProcAddress(msvcrt, "printf")
	add esp, 0x08       # clear stack (note arguments are cleared already)

	#mov	DWORD PTR [esp], OFFSET FLAT:LC5
	push 0x00000000 # "null"
	push 0x64323025 # "%02d"
	push 0x20643230 # "02d "
	push 0x25206432 # "2d %"
	push 0x30252064 # "d %0"
	push 0x32302520 # " %02"
	push 0x64323025 # "%02d"
	
	call eax
	#call	_printf
	mov	eax, 0
	lea	esp, [ebp-8]
	pop	ebx
	pop	esi
	pop	ebp
	ret
	
FindFunction:
	nop
	