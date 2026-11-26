0000000000001200 <main>:
    1200:	f3 0f 1e fa          	endbr64
    1204:	41 54                	push   r12
    1206:	55                   	push   rbp
    1207:	53                   	push   rbx
    1208:	48 83 ec 50          	sub    rsp,0x50
    120c:	48 8d 5c 24 30       	lea    rbx,[rsp+0x30]
    1211:	48 8d 6c 24 10       	lea    rbp,[rsp+0x10]
    1216:	48 89 df             	mov    rdi,rbx
    1219:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    1220:	00 00 
    1222:	48 89 44 24 48       	mov    QWORD PTR [rsp+0x48],rax
    1227:	31 c0                	xor    eax,eax
    1229:	e8 d2 01 00 00       	call   1400 <std::vector<float, std::allocator<float> >::vector(unsigned long, std::allocator<float> const&) [clone .constprop.0]>
    122e:	48 89 ef             	mov    rdi,rbp
    1231:	e8 ca 01 00 00       	call   1400 <std::vector<float, std::allocator<float> >::vector(unsigned long, std::allocator<float> const&) [clone .constprop.0]>
    1236:	c5 fa 10 0d c6 0d 00 	vmovss xmm1,DWORD PTR [rip+0xdc6]        # 2004 <_IO_stdin_used+0x4>
    123d:	00 
    123e:	4c 8b 4c 24 30       	mov    r9,QWORD PTR [rsp+0x30]
    1243:	31 c9                	xor    ecx,ecx
    1245:	bf b1 79 37 9e       	mov    edi,0x9e3779b1
    124a:	4c 8b 44 24 10       	mov    r8,QWORD PTR [rsp+0x10]
    124f:	be e8 03 00 00       	mov    esi,0x3e8
    1254:	c5 d0 57 ed          	vxorps xmm5,xmm5,xmm5
    1258:	48 89 c8             	mov    rax,rcx
    125b:	31 d2                	xor    edx,edx
    125d:	48 0f af c7          	imul   rax,rdi
    1261:	48 f7 f6             	div    rsi
    1264:	48 69 c1 37 9e 00 00 	imul   rax,rcx,0x9e37
    126b:	c4 e1 d2 2a c2       	vcvtsi2ss xmm0,xmm5,rdx
    1270:	31 d2                	xor    edx,edx
    1272:	c5 fa 5e d1          	vdivss xmm2,xmm0,xmm1
    1276:	48 f7 f6             	div    rsi
    1279:	c5 ea 5c 1d 87 0d 00 	vsubss xmm3,xmm2,DWORD PTR [rip+0xd87]        # 2008 <_IO_stdin_used+0x8>
    1280:	00 
    1281:	c4 c1 7a 11 1c 89    	vmovss DWORD PTR [r9+rcx*4],xmm3
    1287:	c4 e1 d2 2a e2       	vcvtsi2ss xmm4,xmm5,rdx
    128c:	c5 da 5e f1          	vdivss xmm6,xmm4,xmm1
    1290:	c4 c1 7a 11 34 88    	vmovss DWORD PTR [r8+rcx*4],xmm6
    1296:	48 ff c1             	inc    rcx
    1299:	48 81 f9 00 00 01 00 	cmp    rcx,0x10000
    12a0:	75 b6                	jne    1258 <main+0x58>
    12a2:	e8 39 fe ff ff       	call   10e0 <std::chrono::_V2::steady_clock::now()@plt>
    12a7:	4c 8b 44 24 38       	mov    r8,QWORD PTR [rsp+0x38]
    12ac:	4c 8b 4c 24 30       	mov    r9,QWORD PTR [rsp+0x30]
    12b1:	c5 7a 10 05 53 0d 00 	vmovss xmm8,DWORD PTR [rip+0xd53]        # 200c <_IO_stdin_used+0xc>
    12b8:	00 
    12b9:	48 8b 4c 24 10       	mov    rcx,QWORD PTR [rsp+0x10]
    12be:	49 89 c4             	mov    r12,rax
    12c1:	bf b8 0b 00 00       	mov    edi,0xbb8
    12c6:	c5 c0 57 ff          	vxorps xmm7,xmm7,xmm7
    12ca:	c4 41 09 57 f6       	vxorpd xmm14,xmm14,xmm14
    12cf:	4d 89 c3             	mov    r11,r8
    12d2:	4d 29 cb             	sub    r11,r9
    12d5:	49 c1 fb 02          	sar    r11,0x2
    12d9:	45 31 d2             	xor    r10d,r10d
    12dc:	4d 39 c1             	cmp    r9,r8
    12df:	74 46                	je     1327 <main+0x127>
    12e1:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    12e8:	00 00 00 00 
    12ec:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    12f0:	c4 01 7a 10 0c 91    	vmovss xmm9,DWORD PTR [r9+r10*4]
    12f6:	c4 21 32 59 14 91    	vmulss xmm10,xmm9,DWORD PTR [rcx+r10*4]
    12fc:	c4 41 32 59 d8       	vmulss xmm11,xmm9,xmm8
    1301:	c4 41 2a 58 e3       	vaddss xmm12,xmm10,xmm11
    1306:	c5 78 2f e7          	vcomiss xmm12,xmm7
    130a:	0f 86 90 00 00 00    	jbe    13a0 <main+0x1a0>
    1310:	49 ff c2             	inc    r10
    1313:	c4 41 1a 51 e4       	vsqrtss xmm12,xmm12,xmm12
    1318:	c4 41 1a 5a fc       	vcvtss2sd xmm15,xmm12,xmm12
    131d:	c4 41 0b 58 f7       	vaddsd xmm14,xmm14,xmm15
    1322:	4d 39 da             	cmp    r10,r11
    1325:	72 c9                	jb     12f0 <main+0xf0>
    1327:	ff cf                	dec    edi
    1329:	75 ae                	jne    12d9 <main+0xd9>
    132b:	c5 7b 11 74 24 08    	vmovsd QWORD PTR [rsp+0x8],xmm14
    1331:	e8 aa fd ff ff       	call   10e0 <std::chrono::_V2::steady_clock::now()@plt>
    1336:	c5 d0 57 ed          	vxorps xmm5,xmm5,xmm5
    133a:	48 8d 35 cf 0c 00 00 	lea    rsi,[rip+0xccf]        # 2010 <_IO_stdin_used+0x10>
    1341:	4c 29 e0             	sub    rax,r12
    1344:	bf 02 00 00 00       	mov    edi,0x2
    1349:	c5 fb 10 44 24 08    	vmovsd xmm0,QWORD PTR [rsp+0x8]
    134f:	c4 e1 d3 2a c8       	vcvtsi2sd xmm1,xmm5,rax
    1354:	b8 02 00 00 00       	mov    eax,0x2
    1359:	c5 f3 5e 0d cf 0c 00 	vdivsd xmm1,xmm1,QWORD PTR [rip+0xccf]        # 2030 <_IO_stdin_used+0x30>
    1360:	00 
    1361:	e8 3a fd ff ff       	call   10a0 <__printf_chk@plt>
    1366:	48 89 ef             	mov    rdi,rbp
    1369:	e8 e2 00 00 00       	call   1450 <std::vector<float, std::allocator<float> >::~vector()>
    136e:	48 89 df             	mov    rdi,rbx
    1371:	e8 da 00 00 00       	call   1450 <std::vector<float, std::allocator<float> >::~vector()>
    1376:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
    137b:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    1382:	00 00 
    1384:	75 5b                	jne    13e1 <main+0x1e1>
    1386:	48 83 c4 50          	add    rsp,0x50
    138a:	31 c0                	xor    eax,eax
    138c:	5b                   	pop    rbx
    138d:	5d                   	pop    rbp
    138e:	41 5c                	pop    r12
    1390:	c3                   	ret
    1391:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    1398:	00 00 00 00 
    139c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    13a0:	49 ff c2             	inc    r10
    13a3:	c4 41 1a 5a ec       	vcvtss2sd xmm13,xmm12,xmm12
    13a8:	c4 41 0b 5c f5       	vsubsd xmm14,xmm14,xmm13
    13ad:	4d 39 da             	cmp    r10,r11
    13b0:	0f 82 3a ff ff ff    	jb     12f0 <main+0xf0>
    13b6:	e9 6c ff ff ff       	jmp    1327 <main+0x127>
    13bb:	48 89 ef             	mov    rdi,rbp
    13be:	c5 f8 77             	vzeroupper
    13c1:	e8 8a 00 00 00       	call   1450 <std::vector<float, std::allocator<float> >::~vector()>
    13c6:	48 89 df             	mov    rdi,rbx
    13c9:	c5 f8 77             	vzeroupper
    13cc:	e8 7f 00 00 00       	call   1450 <std::vector<float, std::allocator<float> >::~vector()>
    13d1:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
    13d6:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    13dd:	00 00 
    13df:	74 17                	je     13f8 <main+0x1f8>
    13e1:	e8 ea fc ff ff       	call   10d0 <__stack_chk_fail@plt>
    13e6:	f3 0f 1e fa          	endbr64
    13ea:	49 89 c4             	mov    r12,rax
    13ed:	eb cc                	jmp    13bb <main+0x1bb>
    13ef:	f3 0f 1e fa          	endbr64
    13f3:	49 89 c4             	mov    r12,rax
    13f6:	eb ce                	jmp    13c6 <main+0x1c6>
    13f8:	4c 89 e7             	mov    rdi,r12
    13fb:	e8 f0 fc ff ff       	call   10f0 <_Unwind_Resume@plt>

