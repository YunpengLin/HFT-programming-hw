0000000000001160 <main>:
    1160:	f3 0f 1e fa          	endbr64
    1164:	41 54                	push   r12
    1166:	55                   	push   rbp
    1167:	53                   	push   rbx
    1168:	bf 00 00 04 00       	mov    edi,0x40000
    116d:	48 83 ec 50          	sub    rsp,0x50
    1171:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    1178:	00 00 
    117a:	48 89 44 24 48       	mov    QWORD PTR [rsp+0x48],rax
    117f:	31 c0                	xor    eax,eax
    1181:	e8 4a ff ff ff       	call   10d0 <operator new(unsigned long)@plt>
    1186:	ba fc ff 03 00       	mov    edx,0x3fffc
    118b:	31 f6                	xor    esi,esi
    118d:	48 8d a8 00 00 04 00 	lea    rbp,[rax+0x40000]
    1194:	48 8d 78 04          	lea    rdi,[rax+0x4]
    1198:	48 89 c3             	mov    rbx,rax
    119b:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
    11a0:	48 89 6c 24 20       	mov    QWORD PTR [rsp+0x20],rbp
    11a5:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    11ab:	e8 10 ff ff ff       	call   10c0 <memset@plt>
    11b0:	bf 00 00 04 00       	mov    edi,0x40000
    11b5:	48 89 6c 24 18       	mov    QWORD PTR [rsp+0x18],rbp
    11ba:	48 c7 44 24 38 00 00 	mov    QWORD PTR [rsp+0x38],0x0
    11c1:	00 00 
    11c3:	48 c7 44 24 40 00 00 	mov    QWORD PTR [rsp+0x40],0x0
    11ca:	00 00 
    11cc:	e8 ff fe ff ff       	call   10d0 <operator new(unsigned long)@plt>
    11d1:	4c 8d a0 00 00 04 00 	lea    r12,[rax+0x40000]
    11d8:	48 8d 78 04          	lea    rdi,[rax+0x4]
    11dc:	31 f6                	xor    esi,esi
    11de:	ba fc ff 03 00       	mov    edx,0x3fffc
    11e3:	48 89 c5             	mov    rbp,rax
    11e6:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
    11eb:	4c 89 64 24 40       	mov    QWORD PTR [rsp+0x40],r12
    11f0:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    11f6:	e8 c5 fe ff ff       	call   10c0 <memset@plt>
    11fb:	c5 fa 10 0d 01 0e 00 	vmovss xmm1,DWORD PTR [rip+0xe01]        # 2004 <_IO_stdin_used+0x4>
    1202:	00 
    1203:	c5 fa 10 15 fd 0d 00 	vmovss xmm2,DWORD PTR [rip+0xdfd]        # 2008 <_IO_stdin_used+0x8>
    120a:	00 
    120b:	31 ff                	xor    edi,edi
    120d:	31 f6                	xor    esi,esi
    120f:	31 c9                	xor    ecx,ecx
    1211:	49 b8 cf f7 53 e3 a5 	movabs r8,0x20c49ba5e353f7cf
    1218:	9b c4 20 
    121b:	41 b9 b1 79 37 9e    	mov    r9d,0x9e3779b1
    1221:	4c 89 64 24 38       	mov    QWORD PTR [rsp+0x38],r12
    1226:	c5 d8 57 e4          	vxorps xmm4,xmm4,xmm4
    122a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1230:	48 89 f2             	mov    rdx,rsi
    1233:	48 c1 ea 03          	shr    rdx,0x3
    1237:	48 89 d0             	mov    rax,rdx
    123a:	49 f7 e0             	mul    r8
    123d:	48 89 f0             	mov    rax,rsi
    1240:	4c 01 ce             	add    rsi,r9
    1243:	48 c1 ea 04          	shr    rdx,0x4
    1247:	48 69 d2 e8 03 00 00 	imul   rdx,rdx,0x3e8
    124e:	48 29 d0             	sub    rax,rdx
    1251:	48 89 fa             	mov    rdx,rdi
    1254:	48 c1 ea 03          	shr    rdx,0x3
    1258:	c4 e1 da 2a c0       	vcvtsi2ss xmm0,xmm4,rax
    125d:	c4 e2 69 99 c1       	vfmadd132ss xmm0,xmm2,xmm1
    1262:	48 89 d0             	mov    rax,rdx
    1265:	49 f7 e0             	mul    r8
    1268:	48 89 f8             	mov    rax,rdi
    126b:	48 81 c7 37 9e 00 00 	add    rdi,0x9e37
    1272:	c5 fa 11 04 8b       	vmovss DWORD PTR [rbx+rcx*4],xmm0
    1277:	48 c1 ea 04          	shr    rdx,0x4
    127b:	48 69 d2 e8 03 00 00 	imul   rdx,rdx,0x3e8
    1282:	48 29 d0             	sub    rax,rdx
    1285:	c4 e1 da 2a c0       	vcvtsi2ss xmm0,xmm4,rax
    128a:	c5 fa 59 c1          	vmulss xmm0,xmm0,xmm1
    128e:	c5 fa 11 44 8d 00    	vmovss DWORD PTR [rbp+rcx*4+0x0],xmm0
    1294:	48 ff c1             	inc    rcx
    1297:	48 81 f9 00 00 01 00 	cmp    rcx,0x10000
    129e:	75 90                	jne    1230 <main+0xd0>
    12a0:	e8 5b fe ff ff       	call   1100 <std::chrono::_V2::steady_clock::now()@plt>
    12a5:	c5 fa 10 1d 5f 0d 00 	vmovss xmm3,DWORD PTR [rip+0xd5f]        # 200c <_IO_stdin_used+0xc>
    12ac:	00 
    12ad:	ba b8 0b 00 00       	mov    edx,0xbb8
    12b2:	c5 f0 57 c9          	vxorps xmm1,xmm1,xmm1
    12b6:	49 89 c4             	mov    r12,rax
    12b9:	c5 e9 57 d2          	vxorpd xmm2,xmm2,xmm2
    12bd:	0f 1f 00             	nop    DWORD PTR [rax]
    12c0:	31 c0                	xor    eax,eax
    12c2:	eb 23                	jmp    12e7 <main+0x187>
    12c4:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    12cb:	00 00 00 00 
    12cf:	90                   	nop
    12d0:	48 ff c0             	inc    rax
    12d3:	c5 fa 51 c0          	vsqrtss xmm0,xmm0,xmm0
    12d7:	c5 fa 5a c0          	vcvtss2sd xmm0,xmm0,xmm0
    12db:	c5 eb 58 d0          	vaddsd xmm2,xmm2,xmm0
    12df:	48 3d 00 00 01 00    	cmp    rax,0x10000
    12e5:	74 24                	je     130b <main+0x1ab>
    12e7:	c5 e2 58 44 85 00    	vaddss xmm0,xmm3,DWORD PTR [rbp+rax*4+0x0]
    12ed:	c5 fa 59 04 83       	vmulss xmm0,xmm0,DWORD PTR [rbx+rax*4]
    12f2:	c5 f8 2f c1          	vcomiss xmm0,xmm1
    12f6:	77 d8                	ja     12d0 <main+0x170>
    12f8:	48 ff c0             	inc    rax
    12fb:	c5 fa 5a c0          	vcvtss2sd xmm0,xmm0,xmm0
    12ff:	c5 eb 5c d0          	vsubsd xmm2,xmm2,xmm0
    1303:	48 3d 00 00 01 00    	cmp    rax,0x10000
    1309:	75 dc                	jne    12e7 <main+0x187>
    130b:	ff ca                	dec    edx
    130d:	75 b1                	jne    12c0 <main+0x160>
    130f:	c5 fb 11 54 24 08    	vmovsd QWORD PTR [rsp+0x8],xmm2
    1315:	e8 e6 fd ff ff       	call   1100 <std::chrono::_V2::steady_clock::now()@plt>
    131a:	c5 d8 57 e4          	vxorps xmm4,xmm4,xmm4
    131e:	48 8d 35 eb 0c 00 00 	lea    rsi,[rip+0xceb]        # 2010 <_IO_stdin_used+0x10>
    1325:	4c 29 e0             	sub    rax,r12
    1328:	bf 02 00 00 00       	mov    edi,0x2
    132d:	c5 fb 10 54 24 08    	vmovsd xmm2,QWORD PTR [rsp+0x8]
    1333:	c5 eb 10 c2          	vmovsd xmm0,xmm2,xmm2
    1337:	c4 e1 db 2a c8       	vcvtsi2sd xmm1,xmm4,rax
    133c:	b8 02 00 00 00       	mov    eax,0x2
    1341:	c5 f3 59 0d e7 0c 00 	vmulsd xmm1,xmm1,QWORD PTR [rip+0xce7]        # 2030 <_IO_stdin_used+0x30>
    1348:	00 
    1349:	e8 62 fd ff ff       	call   10b0 <__printf_chk@plt>
    134e:	48 8d 7c 24 30       	lea    rdi,[rsp+0x30]
    1353:	e8 58 01 00 00       	call   14b0 <std::vector<float, std::allocator<float> >::~vector()>
    1358:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
    135d:	e8 4e 01 00 00       	call   14b0 <std::vector<float, std::allocator<float> >::~vector()>
    1362:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
    1367:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    136e:	00 00 
    1370:	75 0b                	jne    137d <main+0x21d>
    1372:	48 83 c4 50          	add    rsp,0x50
    1376:	31 c0                	xor    eax,eax
    1378:	5b                   	pop    rbx
    1379:	5d                   	pop    rbp
    137a:	41 5c                	pop    r12
    137c:	c3                   	ret
    137d:	e8 6e fd ff ff       	call   10f0 <__stack_chk_fail@plt>
    1382:	f3 0f 1e fa          	endbr64
    1386:	48 89 c3             	mov    rbx,rax
    1389:	e9 92 fd ff ff       	jmp    1120 <main.cold>
    138e:	f3 0f 1e fa          	endbr64
    1392:	48 89 c3             	mov    rbx,rax
    1395:	c5 f8 77             	vzeroupper
    1398:	e9 90 fd ff ff       	jmp    112d <main.cold+0xd>
    139d:	0f 1f 00             	nop    DWORD PTR [rax]

