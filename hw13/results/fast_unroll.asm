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
    11fb:	c5 fa 10 05 01 0e 00 	vmovss xmm0,DWORD PTR [rip+0xe01]        # 2004 <_IO_stdin_used+0x4>
    1202:	00 
    1203:	c5 fa 10 15 fd 0d 00 	vmovss xmm2,DWORD PTR [rip+0xdfd]        # 2008 <_IO_stdin_used+0x8>
    120a:	00 
    120b:	31 ff                	xor    edi,edi
    120d:	45 31 c0             	xor    r8d,r8d
    1210:	31 f6                	xor    esi,esi
    1212:	48 b9 cf f7 53 e3 a5 	movabs rcx,0x20c49ba5e353f7cf
    1219:	9b c4 20 
    121c:	41 bb b1 79 37 9e    	mov    r11d,0x9e3779b1
    1222:	4c 89 64 24 38       	mov    QWORD PTR [rsp+0x38],r12
    1227:	c5 d8 57 e4          	vxorps xmm4,xmm4,xmm4
    122b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    1230:	4c 89 c0             	mov    rax,r8
    1233:	4d 89 c2             	mov    r10,r8
    1236:	4d 01 d8             	add    r8,r11
    1239:	48 c1 e8 03          	shr    rax,0x3
    123d:	48 f7 e1             	mul    rcx
    1240:	48 89 f8             	mov    rax,rdi
    1243:	48 c1 e8 03          	shr    rax,0x3
    1247:	48 c1 ea 04          	shr    rdx,0x4
    124b:	4c 69 ca e8 03 00 00 	imul   r9,rdx,0x3e8
    1252:	48 f7 e1             	mul    rcx
    1255:	4c 89 c0             	mov    rax,r8
    1258:	48 c1 e8 03          	shr    rax,0x3
    125c:	48 c1 ea 04          	shr    rdx,0x4
    1260:	4c 69 e2 e8 03 00 00 	imul   r12,rdx,0x3e8
    1267:	4d 29 ca             	sub    r10,r9
    126a:	49 89 f9             	mov    r9,rdi
    126d:	48 f7 e1             	mul    rcx
    1270:	4c 89 c0             	mov    rax,r8
    1273:	c4 c1 da 2a ca       	vcvtsi2ss xmm1,xmm4,r10
    1278:	c4 e2 69 99 c8       	vfmadd132ss xmm1,xmm2,xmm0
    127d:	4c 8d 56 01          	lea    r10,[rsi+0x1]
    1281:	4d 29 e1             	sub    r9,r12
    1284:	4c 8d a7 37 9e 00 00 	lea    r12,[rdi+0x9e37]
    128b:	48 c1 ea 04          	shr    rdx,0x4
    128f:	c4 c1 da 2a d9       	vcvtsi2ss xmm3,xmm4,r9
    1294:	c5 e2 59 e8          	vmulss xmm5,xmm3,xmm0
    1298:	c5 fa 11 0c b3       	vmovss DWORD PTR [rbx+rsi*4],xmm1
    129d:	4c 69 ca e8 03 00 00 	imul   r9,rdx,0x3e8
    12a4:	c5 fa 11 6c b5 00    	vmovss DWORD PTR [rbp+rsi*4+0x0],xmm5
    12aa:	4c 29 c8             	sub    rax,r9
    12ad:	c4 e1 da 2a f0       	vcvtsi2ss xmm6,xmm4,rax
    12b2:	4c 89 e0             	mov    rax,r12
    12b5:	c4 e2 69 99 f0       	vfmadd132ss xmm6,xmm2,xmm0
    12ba:	48 c1 e8 03          	shr    rax,0x3
    12be:	48 f7 e1             	mul    rcx
    12c1:	c4 a1 7a 11 34 93    	vmovss DWORD PTR [rbx+r10*4],xmm6
    12c7:	48 c1 ea 04          	shr    rdx,0x4
    12cb:	4c 69 ca e8 03 00 00 	imul   r9,rdx,0x3e8
    12d2:	4d 29 cc             	sub    r12,r9
    12d5:	4c 8d 8f 6e 3c 01 00 	lea    r9,[rdi+0x13c6e]
    12dc:	c4 c1 da 2a fc       	vcvtsi2ss xmm7,xmm4,r12
    12e1:	c5 42 59 c0          	vmulss xmm8,xmm7,xmm0
    12e5:	4c 8d 66 02          	lea    r12,[rsi+0x2]
    12e9:	c4 21 7a 11 44 95 00 	vmovss DWORD PTR [rbp+r10*4+0x0],xmm8
    12f0:	41 ba b1 79 37 9e    	mov    r10d,0x9e3779b1
    12f6:	4d 01 c2             	add    r10,r8
    12f9:	4c 89 d0             	mov    rax,r10
    12fc:	48 c1 e8 03          	shr    rax,0x3
    1300:	48 f7 e1             	mul    rcx
    1303:	48 c1 ea 04          	shr    rdx,0x4
    1307:	48 69 c2 e8 03 00 00 	imul   rax,rdx,0x3e8
    130e:	49 29 c2             	sub    r10,rax
    1311:	4c 89 c8             	mov    rax,r9
    1314:	48 c1 e8 03          	shr    rax,0x3
    1318:	c4 41 da 2a ca       	vcvtsi2ss xmm9,xmm4,r10
    131d:	c4 62 69 99 c8       	vfmadd132ss xmm9,xmm2,xmm0
    1322:	48 f7 e1             	mul    rcx
    1325:	48 c1 ea 04          	shr    rdx,0x4
    1329:	c4 21 7a 11 0c a3    	vmovss DWORD PTR [rbx+r12*4],xmm9
    132f:	4c 69 d2 e8 03 00 00 	imul   r10,rdx,0x3e8
    1336:	4d 29 d1             	sub    r9,r10
    1339:	49 ba 62 f3 6e 3c 01 	movabs r10,0x13c6ef362
    1340:	00 00 00 
    1343:	4d 01 c2             	add    r10,r8
    1346:	c4 41 da 2a d1       	vcvtsi2ss xmm10,xmm4,r9
    134b:	4c 8d 8f a5 da 01 00 	lea    r9,[rdi+0x1daa5]
    1352:	c5 2a 59 d8          	vmulss xmm11,xmm10,xmm0
    1356:	4c 89 d0             	mov    rax,r10
    1359:	48 81 c7 dc 78 02 00 	add    rdi,0x278dc
    1360:	48 c1 e8 03          	shr    rax,0x3
    1364:	c4 21 7a 11 5c a5 00 	vmovss DWORD PTR [rbp+r12*4+0x0],xmm11
    136b:	48 f7 e1             	mul    rcx
    136e:	4c 8d 66 03          	lea    r12,[rsi+0x3]
    1372:	48 83 c6 04          	add    rsi,0x4
    1376:	48 c1 ea 04          	shr    rdx,0x4
    137a:	48 69 c2 e8 03 00 00 	imul   rax,rdx,0x3e8
    1381:	49 29 c2             	sub    r10,rax
    1384:	4c 89 c8             	mov    rax,r9
    1387:	48 c1 e8 03          	shr    rax,0x3
    138b:	c4 41 da 2a e2       	vcvtsi2ss xmm12,xmm4,r10
    1390:	c4 62 69 99 e0       	vfmadd132ss xmm12,xmm2,xmm0
    1395:	48 f7 e1             	mul    rcx
    1398:	48 c1 ea 04          	shr    rdx,0x4
    139c:	c4 21 7a 11 24 a3    	vmovss DWORD PTR [rbx+r12*4],xmm12
    13a2:	4c 69 d2 e8 03 00 00 	imul   r10,rdx,0x3e8
    13a9:	4d 29 d1             	sub    r9,r10
    13ac:	c4 41 da 2a e9       	vcvtsi2ss xmm13,xmm4,r9
    13b1:	c5 12 59 f0          	vmulss xmm14,xmm13,xmm0
    13b5:	c4 21 7a 11 74 a5 00 	vmovss DWORD PTR [rbp+r12*4+0x0],xmm14
    13bc:	49 bc 13 6d a6 da 01 	movabs r12,0x1daa66d13
    13c3:	00 00 00 
    13c6:	4d 01 e0             	add    r8,r12
    13c9:	48 81 fe 00 00 01 00 	cmp    rsi,0x10000
    13d0:	0f 85 5a fe ff ff    	jne    1230 <main+0xd0>
    13d6:	e8 25 fd ff ff       	call   1100 <std::chrono::_V2::steady_clock::now()@plt>
    13db:	c5 fa 10 1d 29 0c 00 	vmovss xmm3,DWORD PTR [rip+0xc29]        # 200c <_IO_stdin_used+0xc>
    13e2:	00 
    13e3:	be b8 0b 00 00       	mov    esi,0xbb8
    13e8:	c5 e8 57 d2          	vxorps xmm2,xmm2,xmm2
    13ec:	49 89 c4             	mov    r12,rax
    13ef:	c4 41 21 57 db       	vxorpd xmm11,xmm11,xmm11
    13f4:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    13fb:	00 00 00 00 
    13ff:	90                   	nop
    1400:	45 31 c0             	xor    r8d,r8d
    1403:	e9 f9 00 00 00       	jmp    1501 <main+0x3a1>
    1408:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    140f:	00 
    1410:	c5 c2 51 ff          	vsqrtss xmm7,xmm7,xmm7
    1414:	c5 42 5a d7          	vcvtss2sd xmm10,xmm7,xmm7
    1418:	c4 41 7b 58 ca       	vaddsd xmm9,xmm0,xmm10
    141d:	c5 62 58 5c bd 04    	vaddss xmm11,xmm3,DWORD PTR [rbp+rdi*4+0x4]
    1423:	c5 22 59 64 bb 04    	vmulss xmm12,xmm11,DWORD PTR [rbx+rdi*4+0x4]
    1429:	c5 78 2f e2          	vcomiss xmm12,xmm2
    142d:	0f 86 fd 01 00 00    	jbe    1630 <main+0x4d0>
    1433:	c4 41 1a 51 e4       	vsqrtss xmm12,xmm12,xmm12
    1438:	c4 41 1a 5a fc       	vcvtss2sd xmm15,xmm12,xmm12
    143d:	c4 41 33 58 f7       	vaddsd xmm14,xmm9,xmm15
    1442:	c5 e2 58 64 bd 08    	vaddss xmm4,xmm3,DWORD PTR [rbp+rdi*4+0x8]
    1448:	c5 da 59 4c bb 08    	vmulss xmm1,xmm4,DWORD PTR [rbx+rdi*4+0x8]
    144e:	c5 f8 2f ca          	vcomiss xmm1,xmm2
    1452:	0f 86 c8 01 00 00    	jbe    1620 <main+0x4c0>
    1458:	c5 f2 51 c9          	vsqrtss xmm1,xmm1,xmm1
    145c:	c5 f2 5a f1          	vcvtss2sd xmm6,xmm1,xmm1
    1460:	c5 8b 58 c6          	vaddsd xmm0,xmm14,xmm6
    1464:	c5 e2 58 7c bd 0c    	vaddss xmm7,xmm3,DWORD PTR [rbp+rdi*4+0xc]
    146a:	c5 42 59 44 bb 0c    	vmulss xmm8,xmm7,DWORD PTR [rbx+rdi*4+0xc]
    1470:	c5 78 2f c2          	vcomiss xmm8,xmm2
    1474:	0f 86 96 01 00 00    	jbe    1610 <main+0x4b0>
    147a:	c4 41 3a 51 c0       	vsqrtss xmm8,xmm8,xmm8
    147f:	c4 41 3a 5a d8       	vcvtss2sd xmm11,xmm8,xmm8
    1484:	c4 41 7b 58 d3       	vaddsd xmm10,xmm0,xmm11
    1489:	c5 62 58 64 bd 10    	vaddss xmm12,xmm3,DWORD PTR [rbp+rdi*4+0x10]
    148f:	c5 1a 59 6c bb 10    	vmulss xmm13,xmm12,DWORD PTR [rbx+rdi*4+0x10]
    1495:	c5 78 2f ea          	vcomiss xmm13,xmm2
    1499:	0f 86 61 01 00 00    	jbe    1600 <main+0x4a0>
    149f:	c4 41 12 51 ed       	vsqrtss xmm13,xmm13,xmm13
    14a4:	c4 c1 12 5a e5       	vcvtss2sd xmm4,xmm13,xmm13
    14a9:	c5 2b 58 fc          	vaddsd xmm15,xmm10,xmm4
    14ad:	c5 e2 58 4c bd 14    	vaddss xmm1,xmm3,DWORD PTR [rbp+rdi*4+0x14]
    14b3:	c5 f2 59 6c bb 14    	vmulss xmm5,xmm1,DWORD PTR [rbx+rdi*4+0x14]
    14b9:	c5 f8 2f ea          	vcomiss xmm5,xmm2
    14bd:	0f 86 2d 01 00 00    	jbe    15f0 <main+0x490>
    14c3:	c5 d2 51 ed          	vsqrtss xmm5,xmm5,xmm5
    14c7:	c5 d2 5a fd          	vcvtss2sd xmm7,xmm5,xmm5
    14cb:	c5 83 58 f7          	vaddsd xmm6,xmm15,xmm7
    14cf:	c5 62 58 44 bd 18    	vaddss xmm8,xmm3,DWORD PTR [rbp+rdi*4+0x18]
    14d5:	c5 3a 59 4c bb 18    	vmulss xmm9,xmm8,DWORD PTR [rbx+rdi*4+0x18]
    14db:	c5 78 2f ca          	vcomiss xmm9,xmm2
    14df:	0f 86 fb 00 00 00    	jbe    15e0 <main+0x480>
    14e5:	c4 41 32 51 c9       	vsqrtss xmm9,xmm9,xmm9
    14ea:	c4 41 32 5a e1       	vcvtss2sd xmm12,xmm9,xmm9
    14ef:	c4 41 4b 58 dc       	vaddsd xmm11,xmm6,xmm12
    14f4:	4c 8d 47 07          	lea    r8,[rdi+0x7]
    14f8:	48 81 ff f9 ff 00 00 	cmp    rdi,0xfff9
    14ff:	74 4f                	je     1550 <main+0x3f0>
    1501:	c4 21 62 58 7c 85 00 	vaddss xmm15,xmm3,DWORD PTR [rbp+r8*4+0x0]
    1508:	c4 a1 02 59 24 83    	vmulss xmm4,xmm15,DWORD PTR [rbx+r8*4]
    150e:	c5 f8 2f e2          	vcomiss xmm4,xmm2
    1512:	0f 86 b8 00 00 00    	jbe    15d0 <main+0x470>
    1518:	c5 da 51 e4          	vsqrtss xmm4,xmm4,xmm4
    151c:	c5 da 5a ec          	vcvtss2sd xmm5,xmm4,xmm4
    1520:	c5 a3 58 c5          	vaddsd xmm0,xmm11,xmm5
    1524:	c4 a1 62 58 74 85 04 	vaddss xmm6,xmm3,DWORD PTR [rbp+r8*4+0x4]
    152b:	49 8d 78 01          	lea    rdi,[r8+0x1]
    152f:	c4 a1 4a 59 7c 83 04 	vmulss xmm7,xmm6,DWORD PTR [rbx+r8*4+0x4]
    1536:	c5 f8 2f fa          	vcomiss xmm7,xmm2
    153a:	0f 87 d0 fe ff ff    	ja     1410 <main+0x2b0>
    1540:	c5 42 5a c7          	vcvtss2sd xmm8,xmm7,xmm7
    1544:	c4 41 7b 5c c8       	vsubsd xmm9,xmm0,xmm8
    1549:	e9 cf fe ff ff       	jmp    141d <main+0x2bd>
    154e:	66 90                	xchg   ax,ax
    1550:	ff ce                	dec    esi
    1552:	0f 85 a8 fe ff ff    	jne    1400 <main+0x2a0>
    1558:	c5 7b 11 5c 24 08    	vmovsd QWORD PTR [rsp+0x8],xmm11
    155e:	e8 9d fb ff ff       	call   1100 <std::chrono::_V2::steady_clock::now()@plt>
    1563:	c4 41 10 57 ed       	vxorps xmm13,xmm13,xmm13
    1568:	48 8d 35 a1 0a 00 00 	lea    rsi,[rip+0xaa1]        # 2010 <_IO_stdin_used+0x10>
    156f:	4c 29 e0             	sub    rax,r12
    1572:	bf 02 00 00 00       	mov    edi,0x2
    1577:	c5 fb 10 44 24 08    	vmovsd xmm0,QWORD PTR [rsp+0x8]
    157d:	c4 61 93 2a f0       	vcvtsi2sd xmm14,xmm13,rax
    1582:	b8 02 00 00 00       	mov    eax,0x2
    1587:	c5 8b 59 0d a1 0a 00 	vmulsd xmm1,xmm14,QWORD PTR [rip+0xaa1]        # 2030 <_IO_stdin_used+0x30>
    158e:	00 
    158f:	e8 1c fb ff ff       	call   10b0 <__printf_chk@plt>
    1594:	48 8d 7c 24 30       	lea    rdi,[rsp+0x30]
    1599:	e8 d2 01 00 00       	call   1770 <std::vector<float, std::allocator<float> >::~vector()>
    159e:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
    15a3:	e8 c8 01 00 00       	call   1770 <std::vector<float, std::allocator<float> >::~vector()>
    15a8:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
    15ad:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    15b4:	00 00 
    15b6:	0f 85 83 00 00 00    	jne    163f <main+0x4df>
    15bc:	48 83 c4 50          	add    rsp,0x50
    15c0:	31 c0                	xor    eax,eax
    15c2:	5b                   	pop    rbx
    15c3:	5d                   	pop    rbp
    15c4:	41 5c                	pop    r12
    15c6:	c3                   	ret
    15c7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    15ce:	00 00 
    15d0:	c5 da 5a cc          	vcvtss2sd xmm1,xmm4,xmm4
    15d4:	c5 a3 5c c1          	vsubsd xmm0,xmm11,xmm1
    15d8:	e9 47 ff ff ff       	jmp    1524 <main+0x3c4>
    15dd:	0f 1f 00             	nop    DWORD PTR [rax]
    15e0:	c4 41 32 5a d1       	vcvtss2sd xmm10,xmm9,xmm9
    15e5:	c4 41 4b 5c da       	vsubsd xmm11,xmm6,xmm10
    15ea:	e9 05 ff ff ff       	jmp    14f4 <main+0x394>
    15ef:	90                   	nop
    15f0:	c5 d2 5a c5          	vcvtss2sd xmm0,xmm5,xmm5
    15f4:	c5 83 5c f0          	vsubsd xmm6,xmm15,xmm0
    15f8:	e9 d2 fe ff ff       	jmp    14cf <main+0x36f>
    15fd:	0f 1f 00             	nop    DWORD PTR [rax]
    1600:	c4 41 12 5a f5       	vcvtss2sd xmm14,xmm13,xmm13
    1605:	c4 41 2b 5c fe       	vsubsd xmm15,xmm10,xmm14
    160a:	e9 9e fe ff ff       	jmp    14ad <main+0x34d>
    160f:	90                   	nop
    1610:	c4 41 3a 5a c8       	vcvtss2sd xmm9,xmm8,xmm8
    1615:	c4 41 7b 5c d1       	vsubsd xmm10,xmm0,xmm9
    161a:	e9 6a fe ff ff       	jmp    1489 <main+0x329>
    161f:	90                   	nop
    1620:	c5 f2 5a e9          	vcvtss2sd xmm5,xmm1,xmm1
    1624:	c5 8b 5c c5          	vsubsd xmm0,xmm14,xmm5
    1628:	e9 37 fe ff ff       	jmp    1464 <main+0x304>
    162d:	0f 1f 00             	nop    DWORD PTR [rax]
    1630:	c4 41 1a 5a ec       	vcvtss2sd xmm13,xmm12,xmm12
    1635:	c4 41 33 5c f5       	vsubsd xmm14,xmm9,xmm13
    163a:	e9 03 fe ff ff       	jmp    1442 <main+0x2e2>
    163f:	e8 ac fa ff ff       	call   10f0 <__stack_chk_fail@plt>
    1644:	f3 0f 1e fa          	endbr64
    1648:	48 89 c3             	mov    rbx,rax
    164b:	e9 d0 fa ff ff       	jmp    1120 <main.cold>
    1650:	f3 0f 1e fa          	endbr64
    1654:	48 89 c3             	mov    rbx,rax
    1657:	c5 f8 77             	vzeroupper
    165a:	e9 ce fa ff ff       	jmp    112d <main.cold+0xd>
    165f:	90                   	nop

