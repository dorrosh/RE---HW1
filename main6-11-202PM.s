main:
	push	ebp
	mov	ebp, esp
	push	esi
	push	ebx
	and	esp, -16
	sub	esp, 80
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
	
	push 0x0000706d 	# mp, null
	push 0x63727473		# c, r, t, s
	push esp            # push pointer for "strcmp"
	push [esp+68]            # push module handle for msvcrt
	call [esp+68]            # call GetProcAddress(msvcrt, "strcmp")
	add esp, 0x08       # clear stack (note arguments are cleared already)
	lea	ecx, [esp+60]	# ecx is not backed up - check cdecl convention
	push 0x00000000 # null
	push 0x64616f72 # d, a, o, r
	push esp
	push ecx
	call eax # call strcmp
	add esp, 0x10
	
	test eax, eax	 
	jne	L3
	mov	eax, DWORD PTR [esp+40]	 
	add	eax, 1
	mov	DWORD PTR [esp+40], eax	 
	mov	eax, DWORD PTR [esp+44]	 
	add	eax, 1	
	mov	DWORD PTR [esp+44], eax	 
	jmp	L4
L3:
	
	push 0x0000706d # mp, null
	push 0x63727473 # strc
	push esp            # push pointer for "strcmp"
	push edi            # push module handle for msvcrt
	call edx            # call GetProcAddress(msvcrt, "strcmp")
	add esp, 0x08       # clear stack (note arguments are cleared already)
	lea	ecx, [esp+60]	# ecx is not backed up - check cdecl convention
	mov	DWORD PTR [esp], ecx
	push 0x0000746e #
	push 0x656d656c # 
	push 0x74746573 # t ,t, e, s
	push esp
	push ecx
	call eax # call strcmp
	add esp, 0x0c
 
	test eax, eax
	jne	L5	 
	mov	eax, DWORD PTR [esp+40]	 # _7, resources
	add	eax, 1	 # _8,
	mov	DWORD PTR [esp+40], eax	 # resources, _8
	mov	eax, DWORD PTR [esp+44]	 # _9, resources
	add	eax, 1	 # _10,
	mov	DWORD PTR [esp+44], eax	 
	mov	eax, DWORD PTR [esp+48]	 
	add	eax, 1	 # _12,
	mov	DWORD PTR [esp+48], eax	 
	mov	eax, DWORD PTR [esp+52]	 
	add	eax, 1	 # _14,
	mov	DWORD PTR [esp+52], eax	 
	jmp	L4	 #
L5:

	push 0x0000706d # mp, null
	push 0x63727473 # strc
	push esp            # push pointer for "strcmp"
	push edi            # push module handle for msvcrt
	call edx            # call GetProcAddress(msvcrt, "strcmp")
	add esp, 0x08       # clear stack (note arguments are cleared already)
	lea	ecx, [esp+60]	# ecx is not backed up - check cdecl convention
	mov	DWORD PTR [esp], ecx
	push 0x00000000 # null
	push 0x79746963 # y, t, i, c
	push esp
	push ecx
	call eax # call strcmp
	add esp, 0x08
	
	test	eax, eax	
	jne	L4	
	mov	eax, DWORD PTR [esp+52]	 
	add	eax, 2	 
	mov	DWORD PTR [esp+52], eax	 
	mov	eax, DWORD PTR [esp+56]	 
	add	eax, 3	 
	mov	DWORD PTR [esp+56], eax	 
	
L4:

	push 0x0000706d 	# mp, null
	push 0x63727473 	# strc
	push esp            # push pointer for "strcmp"
	push edi            # push module handle for msvcrt
	call edx            # call GetProcAddress(msvcrt, "strcmp")
	add esp, 0x08       # clear stack (note arguments are cleared already)
	lea	ecx, [esp+60]	# ecx is not backed up - check cdecl convention
	mov	DWORD PTR [esp], ecx
	push 0x00746e65 # 
	push 0x6d706f6c # 
	push 0x65766564 #
	push esp
	push ecx
	call eax # call strcmp
	add esp, 0x0c
	
	test	eax, eax	
	jne	L2	 
	mov	eax, DWORD PTR [esp+48]	 
	add	eax, 1	 # _22,
	mov	DWORD PTR [esp+48], eax	 
	mov	eax, DWORD PTR [esp+52]	 
	add	eax, 1	 # _24,
	mov	DWORD PTR [esp+52], eax	 
	mov	eax, DWORD PTR [esp+56]	 
	add	eax, 1	 # _26,
	mov	DWORD PTR [esp+56], eax	 
L2:
	
	push 0x0       	# null	
	push 0x41797261		
	push 0x7262694c		
	push 0x64616f4c		
	push esp        # LoadLibraryA    

	call FindFunction   
	add esp, 0x14       

	push 0x00006c6c		#msvcrt # dll
	push 0x642e7472		
	push 0x6376736d		
	push esp

	call eax            
	add esp, 0x0c      

	push eax            
	push 0x00007373		# pushing null,s,s
	push 0x65726464		# pushing e,r,d,d
	push 0x41636f72		
	push 0x50746547		# GetProcAddress
	push esp            

	call FindFunction   # call FindFunction("GetProcAddress")
	add esp, 0x14       # clear stack
	pop ebx             # restore module handle for msvcrt
	mov [esp+56], ebx # 56 - msvcrt
	mov [esp+52], eax # 52 - GetProcAddress
	
	push 0x00000066
	push 0x6e616373
	push esp
	push [esp+68]
	#mov DWORD PTR [esp+12], 0x00000066		# pushing null,f
	#mov DWORD PTR [esp+8], 0x6e616373		# pushing n,a,c,s
	#mov edi, ebx 
	#mov edx, eax 		# save GetProcAddress address
	call [esp+68]           # call GetProcAddress(msvcrt, "scanf")
	#sub esp, 8
	add esp, 0x08      # clear stack (note arguments are cleared already)	
	#push ebx
	lea ebx, [esp+60]
	push ebx
	push 0x00007325
	push esp
	#mov	DWORD PTR [esp+8], 0x00007325 # "&s\0"
	#mov	ebx, DWORD PTR [esp+60]
	#mov	DWORD PTR [esp+4], ebx
	#lea ebx, [esp+8]
	#mov [esp], ebx

	call eax             # call scanf
	#add esp, 0x14       # clear stack
	#call	_scanf
	add esp, 0x0c
	cmp	eax, -1 #EOF
	jne	L6	 
 # mainShort:c:33:     printf("%02d %02d %02d %02d %02d",resources[0], resources[1], #resources[2], resources[3], resources[4])
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
	
	push 0x00000066		# pushing null,f,t
	push 0x6e616373		# pushing n,i,r,p
	push esp            # push pointer for "printf"
	push [esp+68]       # push module handle for msvcrt
	
	call [esp+68]       # call GetProcAddress(msvcrt, "printf")
	add esp, 0x08       # clear stack (note arguments are cleared already)

	push 0x00000000 # "null"
	push 0x64323025 # "%02d"
	push 0x20643230 # "02d "
	push 0x25206432 # "2d %"
	push 0x30252064 # "d %0"
	push 0x32302520 # " %02"
	push 0x64323025 # "%02d"
	lea ecx, [esp]
	push [esp+48]
	push [esp+44]
	push [esp+40]
	push [esp+36]
	push [esp+32]
	push ecx
	call eax		# call	printf
	mov	eax, 0 		# return 0
	lea	esp, [ebp-8]
	pop	ebx
	pop	esi
	pop	ebp
	ret
	
FindFunction:
	nop