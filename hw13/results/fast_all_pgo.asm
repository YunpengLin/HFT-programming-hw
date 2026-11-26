0000000000001220 <main>:
    1220:	f3 0f 1e fa          	endbr64
    1224:	41 54                	push   r12
    1226:	55                   	push   rbp
    1227:	53                   	push   rbx
    1228:	48 83 ec 50          	sub    rsp,0x50
    122c:	48 8d 5c 24 30       	lea    rbx,[rsp+0x30]
    1231:	48 8d 6c 24 10       	lea    rbp,[rsp+0x10]
    1236:	48 89 df             	mov    rdi,rbx
    1239:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    1240:	00 00 
    1242:	48 89 44 24 48       	mov    QWORD PTR [rsp+0x48],rax
    1247:	31 c0                	xor    eax,eax
    1249:	e8 b2 01 00 00       	call   1400 <std::vector<float, std::allocator<float> >::vector(unsigned long, std::allocator<float> const&) [clone .constprop.0]>
    124e:	48 89 ef             	mov    rdi,rbp
    1251:	e8 aa 01 00 00       	call   1400 <std::vector<float, std::allocator<float> >::vector(unsigned long, std::allocator<float> const&) [clone .constprop.0]>
    1256:	c5 fa 10 0d a6 0d 00 	vmovss xmm1,DWORD PTR [rip+0xda6]        # 2004 <_IO_stdin_used+0x4>
    125d:	00 
    125e:	4c 8b 4c 24 30       	mov    r9,QWORD PTR [rsp+0x30]
    1263:	31 c9                	xor    ecx,ecx
    1265:	bf b1 79 37 9e       	mov    edi,0x9e3779b1
    126a:	4c 8b 44 24 10       	mov    r8,QWORD PTR [rsp+0x10]
    126f:	be e8 03 00 00       	mov    esi,0x3e8
    1274:	c5 d8 57 e4          	vxorps xmm4,xmm4,xmm4
    1278:	48 89 c8             	mov    rax,rcx
    127b:	31 d2                	xor    edx,edx
    127d:	48 0f af c7          	imul   rax,rdi
    1281:	48 f7 f6             	div    rsi
    1284:	48 69 c1 37 9e 00 00 	imul   rax,rcx,0x9e37
    128b:	c4 e1 da 2a c2       	vcvtsi2ss xmm0,xmm4,rdx
    1290:	31 d2                	xor    edx,edx
    1292:	c4 e2 71 a9 05 6d 0d 	vfmadd213ss xmm0,xmm1,DWORD PTR [rip+0xd6d]        # 2008 <_IO_stdin_used+0x8>
    1299:	00 00 
    129b:	c4 c1 7a 11 04 89    	vmovss DWORD PTR [r9+rcx*4],xmm0
    12a1:	48 f7 f6             	div    rsi
    12a4:	c4 e1 da 2a d2       	vcvtsi2ss xmm2,xmm4,rdx
    12a9:	c5 ea 59 d9          	vmulss xmm3,xmm2,xmm1
    12ad:	c4 c1 7a 11 1c 88    	vmovss DWORD PTR [r8+rcx*4],xmm3
    12b3:	48 ff c1             	inc    rcx
    12b6:	48 81 f9 00 00 01 00 	cmp    rcx,0x10000
    12bd:	75 b9                	jne    1278 <main+0x58>
    12bf:	e8 1c fe ff ff       	call   10e0 <std::chrono::_V2::steady_clock::now()@plt>
    12c4:	4c 8b 44 24 38       	mov    r8,QWORD PTR [rsp+0x38]
    12c9:	4c 8b 4c 24 30       	mov    r9,QWORD PTR [rsp+0x30]
    12ce:	c5 fa 10 35 36 0d 00 	vmovss xmm6,DWORD PTR [rip+0xd36]        # 200c <_IO_stdin_used+0xc>
    12d5:	00 
    12d6:	48 8b 4c 24 10       	mov    rcx,QWORD PTR [rsp+0x10]
    12db:	49 89 c4             	mov    r12,rax
    12de:	bf b8 0b 00 00       	mov    edi,0xbb8
    12e3:	c5 d0 57 ed          	vxorps xmm5,xmm5,xmm5
    12e7:	c4 41 29 57 d2       	vxorpd xmm10,xmm10,xmm10
    12ec:	4d 89 c3             	mov    r11,r8
    12ef:	4d 29 cb             	sub    r11,r9
    12f2:	49 c1 fb 02          	sar    r11,0x2
    12f6:	45 31 d2             	xor    r10d,r10d
    12f9:	4d 39 c1             	cmp    r9,r8
    12fc:	74 2f                	je     132d <main+0x10d>
    12fe:	66 90                	xchg   ax,ax
    1300:	c4 a1 4a 58 3c 91    	vaddss xmm7,xmm6,DWORD PTR [rcx+r10*4]
    1306:	c4 01 42 59 04 91    	vmulss xmm8,xmm7,DWORD PTR [r9+r10*4]
    130c:	c5 78 2f c5          	vcomiss xmm8,xmm5
    1310:	0f 86 8a 00 00 00    	jbe    13a0 <main+0x180>
    1316:	49 ff c2             	inc    r10
    1319:	c4 41 3a 51 c0       	vsqrtss xmm8,xmm8,xmm8
    131e:	c4 41 3a 5a d8       	vcvtss2sd xmm11,xmm8,xmm8
    1323:	c4 41 2b 58 d3       	vaddsd xmm10,xmm10,xmm11
    1328:	4d 39 da             	cmp    r10,r11
    132b:	72 d3                	jb     1300 <main+0xe0>
    132d:	ff cf                	dec    edi
    132f:	75 c5                	jne    12f6 <main+0xd6>
    1331:	c5 7b 11 54 24 08    	vmovsd QWORD PTR [rsp+0x8],xmm10
    1337:	e8 a4 fd ff ff       	call   10e0 <std::chrono::_V2::steady_clock::now()@plt>
    133c:	c4 41 18 57 e4       	vxorps xmm12,xmm12,xmm12
    1341:	48 8d 35 c8 0c 00 00 	lea    rsi,[rip+0xcc8]        # 2010 <_IO_stdin_used+0x10>
    1348:	4c 29 e0             	sub    rax,r12
    134b:	bf 02 00 00 00       	mov    edi,0x2
    1350:	c5 fb 10 44 24 08    	vmovsd xmm0,QWORD PTR [rsp+0x8]
    1356:	c4 61 9b 2a e8       	vcvtsi2sd xmm13,xmm12,rax
    135b:	b8 02 00 00 00       	mov    eax,0x2
    1360:	c5 93 59 0d c8 0c 00 	vmulsd xmm1,xmm13,QWORD PTR [rip+0xcc8]        # 2030 <_IO_stdin_used+0x30>
    1367:	00 
    1368:	e8 33 fd ff ff       	call   10a0 <__printf_chk@plt>
    136d:	48 89 ef             	mov    rdi,rbp
    1370:	e8 db 00 00 00       	call   1450 <std::vector<float, std::allocator<float> >::~vector()>
    1375:	48 89 df             	mov    rdi,rbx
    1378:	e8 d3 00 00 00       	call   1450 <std::vector<float, std::allocator<float> >::~vector()>
    137d:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
    1382:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    1389:	00 00 
    138b:	75 54                	jne    13e1 <main+0x1c1>
    138d:	48 83 c4 50          	add    rsp,0x50
    1391:	31 c0                	xor    eax,eax
    1393:	5b                   	pop    rbx
    1394:	5d                   	pop    rbp
    1395:	41 5c                	pop    r12
    1397:	c3                   	ret
    1398:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    139f:	00 
    13a0:	49 ff c2             	inc    r10
    13a3:	c4 41 3a 5a c8       	vcvtss2sd xmm9,xmm8,xmm8
    13a8:	c4 41 2b 5c d1       	vsubsd xmm10,xmm10,xmm9
    13ad:	4d 39 da             	cmp    r10,r11
    13b0:	0f 82 4a ff ff ff    	jb     1300 <main+0xe0>
    13b6:	e9 72 ff ff ff       	jmp    132d <main+0x10d>
    13bb:	48 89 ef             	mov    rdi,rbp
    13be:	c5 f8 77             	vzeroupper
    13c1:	e8 8a 00 00 00       	call   1450 <std::vector<float, std::allocator<float> >::~vector()>
    13c6:	48 89 df             	mov    rdi,rbx
    13c9:	c5 f8 77             	vzeroupper
    13cc:	e8 7f 00 00 00       	call   1450 <std::vector<float, std::allocator<float> >::~vector()>
    13d1:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
    13d6:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    13dd:	00 00 
    13df:	74 17                	je     13f8 <main+0x1d8>
    13e1:	e8 ea fc ff ff       	call   10d0 <__stack_chk_fail@plt>
    13e6:	f3 0f 1e fa          	endbr64
    13ea:	49 89 c4             	mov    r12,rax
    13ed:	eb cc                	jmp    13bb <main+0x19b>
    13ef:	f3 0f 1e fa          	endbr64
    13f3:	49 89 c4             	mov    r12,rax
    13f6:	eb ce                	jmp    13c6 <main+0x1a6>
    13f8:	4c 89 e7             	mov    rdi,r12
    13fb:	e8 f0 fc ff ff       	call   10f0 <_Unwind_Resume@plt>

