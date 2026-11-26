0000000000001160 <main>:
    1160:	f3 0f 1e fa          	endbr64
    1164:	41 54                	push   r12
    1166:	bf 00 00 04 00       	mov    edi,0x40000
    116b:	55                   	push   rbp
    116c:	53                   	push   rbx
    116d:	48 83 ec 50          	sub    rsp,0x50
    1171:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    1178:	00 00 
    117a:	48 89 44 24 48       	mov    QWORD PTR [rsp+0x48],rax
    117f:	31 c0                	xor    eax,eax
    1181:	e8 4a ff ff ff       	call   10d0 <operator new(unsigned long)@plt>
    1186:	ba fc ff 03 00       	mov    edx,0x3fffc
    118b:	31 f6                	xor    esi,esi
    118d:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    1193:	48 8d a8 00 00 04 00 	lea    rbp,[rax+0x40000]
    119a:	48 8d 78 04          	lea    rdi,[rax+0x4]
    119e:	48 89 c3             	mov    rbx,rax
    11a1:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
    11a6:	48 89 6c 24 20       	mov    QWORD PTR [rsp+0x20],rbp
    11ab:	e8 10 ff ff ff       	call   10c0 <memset@plt>
    11b0:	66 0f ef c0          	pxor   xmm0,xmm0
    11b4:	bf 00 00 04 00       	mov    edi,0x40000
    11b9:	48 89 6c 24 18       	mov    QWORD PTR [rsp+0x18],rbp
    11be:	0f 11 44 24 38       	movups XMMWORD PTR [rsp+0x38],xmm0
    11c3:	e8 08 ff ff ff       	call   10d0 <operator new(unsigned long)@plt>
    11c8:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    11ce:	48 8d 78 04          	lea    rdi,[rax+0x4]
    11d2:	31 f6                	xor    esi,esi
    11d4:	48 89 c5             	mov    rbp,rax
    11d7:	4c 8d a0 00 00 04 00 	lea    r12,[rax+0x40000]
    11de:	ba fc ff 03 00       	mov    edx,0x3fffc
    11e3:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
    11e8:	4c 89 64 24 40       	mov    QWORD PTR [rsp+0x40],r12
    11ed:	e8 ce fe ff ff       	call   10c0 <memset@plt>
    11f2:	4c 89 64 24 38       	mov    QWORD PTR [rsp+0x38],r12
    11f7:	31 ff                	xor    edi,edi
    11f9:	45 31 c0             	xor    r8d,r8d
    11fc:	f3 0f 10 1d 00 0e 00 	movss  xmm3,DWORD PTR [rip+0xe00]        # 2004 <_IO_stdin_used+0x4>
    1203:	00 
    1204:	31 f6                	xor    esi,esi
    1206:	f3 0f 10 15 fa 0d 00 	movss  xmm2,DWORD PTR [rip+0xdfa]        # 2008 <_IO_stdin_used+0x8>
    120d:	00 
    120e:	48 b9 cf f7 53 e3 a5 	movabs rcx,0x20c49ba5e353f7cf
    1215:	9b c4 20 
    1218:	41 bb b1 79 37 9e    	mov    r11d,0x9e3779b1
    121e:	66 90                	xchg   ax,ax
    1220:	4c 89 c0             	mov    rax,r8
    1223:	66 0f ef e4          	pxor   xmm4,xmm4
    1227:	66 0f ef ed          	pxor   xmm5,xmm5
    122b:	4d 89 c2             	mov    r10,r8
    122e:	48 c1 e8 03          	shr    rax,0x3
    1232:	66 0f ef f6          	pxor   xmm6,xmm6
    1236:	66 0f ef ff          	pxor   xmm7,xmm7
    123a:	4d 01 d8             	add    r8,r11
    123d:	48 f7 e1             	mul    rcx
    1240:	48 89 f8             	mov    rax,rdi
    1243:	66 45 0f ef c0       	pxor   xmm8,xmm8
    1248:	48 c1 e8 03          	shr    rax,0x3
    124c:	66 0f ef c9          	pxor   xmm1,xmm1
    1250:	66 45 0f ef c9       	pxor   xmm9,xmm9
    1255:	66 45 0f ef d2       	pxor   xmm10,xmm10
    125a:	48 c1 ea 04          	shr    rdx,0x4
    125e:	4c 69 ca e8 03 00 00 	imul   r9,rdx,0x3e8
    1265:	48 f7 e1             	mul    rcx
    1268:	4c 89 c0             	mov    rax,r8
    126b:	48 c1 e8 03          	shr    rax,0x3
    126f:	4d 29 ca             	sub    r10,r9
    1272:	49 89 f9             	mov    r9,rdi
    1275:	48 c1 ea 04          	shr    rdx,0x4
    1279:	f3 49 0f 2a ca       	cvtsi2ss xmm1,r10
    127e:	4c 8d 56 01          	lea    r10,[rsi+0x1]
    1282:	4c 69 e2 e8 03 00 00 	imul   r12,rdx,0x3e8
    1289:	48 f7 e1             	mul    rcx
    128c:	4c 89 c0             	mov    rax,r8
    128f:	f3 0f 5e cb          	divss  xmm1,xmm3
    1293:	4d 29 e1             	sub    r9,r12
    1296:	4c 8d a7 37 9e 00 00 	lea    r12,[rdi+0x9e37]
    129d:	48 c1 ea 04          	shr    rdx,0x4
    12a1:	f3 49 0f 2a e1       	cvtsi2ss xmm4,r9
    12a6:	4c 69 ca e8 03 00 00 	imul   r9,rdx,0x3e8
    12ad:	4c 29 c8             	sub    rax,r9
    12b0:	f3 48 0f 2a e8       	cvtsi2ss xmm5,rax
    12b5:	4c 89 e0             	mov    rax,r12
    12b8:	48 c1 e8 03          	shr    rax,0x3
    12bc:	48 f7 e1             	mul    rcx
    12bf:	48 c1 ea 04          	shr    rdx,0x4
    12c3:	4c 69 ca e8 03 00 00 	imul   r9,rdx,0x3e8
    12ca:	f3 0f 5e eb          	divss  xmm5,xmm3
    12ce:	4d 29 cc             	sub    r12,r9
    12d1:	4c 8d 8f 6e 3c 01 00 	lea    r9,[rdi+0x13c6e]
    12d8:	f3 49 0f 2a f4       	cvtsi2ss xmm6,r12
    12dd:	41 bc b1 79 37 9e    	mov    r12d,0x9e3779b1
    12e3:	4d 01 c4             	add    r12,r8
    12e6:	4c 89 e0             	mov    rax,r12
    12e9:	f3 0f 5c ca          	subss  xmm1,xmm2
    12ed:	48 c1 e8 03          	shr    rax,0x3
    12f1:	48 f7 e1             	mul    rcx
    12f4:	f3 0f 11 0c b3       	movss  DWORD PTR [rbx+rsi*4],xmm1
    12f9:	48 c1 ea 04          	shr    rdx,0x4
    12fd:	48 69 c2 e8 03 00 00 	imul   rax,rdx,0x3e8
    1304:	49 29 c4             	sub    r12,rax
    1307:	4c 89 c8             	mov    rax,r9
    130a:	f3 49 0f 2a fc       	cvtsi2ss xmm7,r12
    130f:	f3 0f 5e e3          	divss  xmm4,xmm3
    1313:	48 c1 e8 03          	shr    rax,0x3
    1317:	48 f7 e1             	mul    rcx
    131a:	48 c1 ea 04          	shr    rdx,0x4
    131e:	f3 0f 5c ea          	subss  xmm5,xmm2
    1322:	4c 69 e2 e8 03 00 00 	imul   r12,rdx,0x3e8
    1329:	f3 42 0f 11 2c 93    	movss  DWORD PTR [rbx+r10*4],xmm5
    132f:	4d 29 e1             	sub    r9,r12
    1332:	49 bc 62 f3 6e 3c 01 	movabs r12,0x13c6ef362
    1339:	00 00 00 
    133c:	4d 01 c4             	add    r12,r8
    133f:	f3 4d 0f 2a c1       	cvtsi2ss xmm8,r9
    1344:	4c 8d 8f a5 da 01 00 	lea    r9,[rdi+0x1daa5]
    134b:	48 81 c7 dc 78 02 00 	add    rdi,0x278dc
    1352:	4c 89 e0             	mov    rax,r12
    1355:	48 c1 e8 03          	shr    rax,0x3
    1359:	48 f7 e1             	mul    rcx
    135c:	f3 0f 5e fb          	divss  xmm7,xmm3
    1360:	48 c1 ea 04          	shr    rdx,0x4
    1364:	48 69 c2 e8 03 00 00 	imul   rax,rdx,0x3e8
    136b:	f3 0f 11 64 b5 00    	movss  DWORD PTR [rbp+rsi*4+0x0],xmm4
    1371:	49 29 c4             	sub    r12,rax
    1374:	4c 89 c8             	mov    rax,r9
    1377:	48 c1 e8 03          	shr    rax,0x3
    137b:	f3 4d 0f 2a cc       	cvtsi2ss xmm9,r12
    1380:	48 f7 e1             	mul    rcx
    1383:	48 c1 ea 04          	shr    rdx,0x4
    1387:	4c 69 e2 e8 03 00 00 	imul   r12,rdx,0x3e8
    138e:	f3 44 0f 5e cb       	divss  xmm9,xmm3
    1393:	4d 29 e1             	sub    r9,r12
    1396:	f3 4d 0f 2a d1       	cvtsi2ss xmm10,r9
    139b:	f3 0f 5c fa          	subss  xmm7,xmm2
    139f:	f3 0f 5e f3          	divss  xmm6,xmm3
    13a3:	f3 44 0f 5c ca       	subss  xmm9,xmm2
    13a8:	f3 44 0f 5e c3       	divss  xmm8,xmm3
    13ad:	f3 42 0f 11 74 95 00 	movss  DWORD PTR [rbp+r10*4+0x0],xmm6
    13b4:	4c 8d 56 02          	lea    r10,[rsi+0x2]
    13b8:	f3 42 0f 11 3c 93    	movss  DWORD PTR [rbx+r10*4],xmm7
    13be:	f3 44 0f 5e d3       	divss  xmm10,xmm3
    13c3:	f3 46 0f 11 44 95 00 	movss  DWORD PTR [rbp+r10*4+0x0],xmm8
    13ca:	4c 8d 56 03          	lea    r10,[rsi+0x3]
    13ce:	48 83 c6 04          	add    rsi,0x4
    13d2:	f3 46 0f 11 0c 93    	movss  DWORD PTR [rbx+r10*4],xmm9
    13d8:	f3 46 0f 11 54 95 00 	movss  DWORD PTR [rbp+r10*4+0x0],xmm10
    13df:	49 ba 13 6d a6 da 01 	movabs r10,0x1daa66d13
    13e6:	00 00 00 
    13e9:	4d 01 d0             	add    r8,r10
    13ec:	48 81 fe 00 00 01 00 	cmp    rsi,0x10000
    13f3:	0f 85 27 fe ff ff    	jne    1220 <main+0xc0>
    13f9:	e8 02 fd ff ff       	call   1100 <std::chrono::_V2::steady_clock::now()@plt>
    13fe:	ba b8 0b 00 00       	mov    edx,0xbb8
    1403:	66 0f ef c0          	pxor   xmm0,xmm0
    1407:	f3 0f 10 15 fd 0b 00 	movss  xmm2,DWORD PTR [rip+0xbfd]        # 200c <_IO_stdin_used+0xc>
    140e:	00 
    140f:	49 89 c4             	mov    r12,rax
    1412:	66 0f ef c9          	pxor   xmm1,xmm1
    1416:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    141d:	00 00 00 
    1420:	45 31 d2             	xor    r10d,r10d
    1423:	e9 a1 01 00 00       	jmp    15c9 <main+0x469>
    1428:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    142f:	00 
    1430:	66 45 0f ef ed       	pxor   xmm13,xmm13
    1435:	f3 45 0f 5a ec       	cvtss2sd xmm13,xmm12
    143a:	f2 41 0f 5c c5       	subsd  xmm0,xmm13
    143f:	49 8d 7a 01          	lea    rdi,[r10+0x1]
    1443:	f3 44 0f 10 3c bb    	movss  xmm15,DWORD PTR [rbx+rdi*4]
    1449:	f3 0f 10 5c bd 00    	movss  xmm3,DWORD PTR [rbp+rdi*4+0x0]
    144f:	f3 41 0f 59 df       	mulss  xmm3,xmm15
    1454:	f3 44 0f 59 fa       	mulss  xmm15,xmm2
    1459:	f3 41 0f 58 df       	addss  xmm3,xmm15
    145e:	0f 2f d9             	comiss xmm3,xmm1
    1461:	0f 87 e9 02 00 00    	ja     1750 <main+0x5f0>
    1467:	66 0f ef e4          	pxor   xmm4,xmm4
    146b:	f3 0f 5a e3          	cvtss2sd xmm4,xmm3
    146f:	f2 0f 5c c4          	subsd  xmm0,xmm4
    1473:	4c 8d 47 01          	lea    r8,[rdi+0x1]
    1477:	f3 42 0f 10 34 83    	movss  xmm6,DWORD PTR [rbx+r8*4]
    147d:	f3 42 0f 10 7c 85 00 	movss  xmm7,DWORD PTR [rbp+r8*4+0x0]
    1484:	f3 0f 59 fe          	mulss  xmm7,xmm6
    1488:	f3 0f 59 f2          	mulss  xmm6,xmm2
    148c:	f3 0f 58 fe          	addss  xmm7,xmm6
    1490:	0f 2f f9             	comiss xmm7,xmm1
    1493:	0f 87 97 02 00 00    	ja     1730 <main+0x5d0>
    1499:	66 45 0f ef c0       	pxor   xmm8,xmm8
    149e:	f3 44 0f 5a c7       	cvtss2sd xmm8,xmm7
    14a3:	f2 41 0f 5c c0       	subsd  xmm0,xmm8
    14a8:	48 8d 77 02          	lea    rsi,[rdi+0x2]
    14ac:	f3 44 0f 10 14 b3    	movss  xmm10,DWORD PTR [rbx+rsi*4]
    14b2:	f3 44 0f 10 5c b5 00 	movss  xmm11,DWORD PTR [rbp+rsi*4+0x0]
    14b9:	f3 45 0f 59 da       	mulss  xmm11,xmm10
    14be:	f3 44 0f 59 d2       	mulss  xmm10,xmm2
    14c3:	f3 45 0f 58 da       	addss  xmm11,xmm10
    14c8:	44 0f 2f d9          	comiss xmm11,xmm1
    14cc:	0f 87 3e 02 00 00    	ja     1710 <main+0x5b0>
    14d2:	66 45 0f ef e4       	pxor   xmm12,xmm12
    14d7:	f3 45 0f 5a e3       	cvtss2sd xmm12,xmm11
    14dc:	f2 41 0f 5c c4       	subsd  xmm0,xmm12
    14e1:	48 8d 4f 03          	lea    rcx,[rdi+0x3]
    14e5:	f3 44 0f 10 34 8b    	movss  xmm14,DWORD PTR [rbx+rcx*4]
    14eb:	f3 44 0f 10 7c 8d 00 	movss  xmm15,DWORD PTR [rbp+rcx*4+0x0]
    14f2:	f3 45 0f 59 fe       	mulss  xmm15,xmm14
    14f7:	f3 44 0f 59 f2       	mulss  xmm14,xmm2
    14fc:	f3 45 0f 58 fe       	addss  xmm15,xmm14
    1501:	44 0f 2f f9          	comiss xmm15,xmm1
    1505:	0f 87 e5 01 00 00    	ja     16f0 <main+0x590>
    150b:	66 0f ef db          	pxor   xmm3,xmm3
    150f:	f3 41 0f 5a df       	cvtss2sd xmm3,xmm15
    1514:	f2 0f 5c c3          	subsd  xmm0,xmm3
    1518:	4c 8d 5f 04          	lea    r11,[rdi+0x4]
    151c:	f3 42 0f 10 2c 9b    	movss  xmm5,DWORD PTR [rbx+r11*4]
    1522:	f3 42 0f 10 74 9d 00 	movss  xmm6,DWORD PTR [rbp+r11*4+0x0]
    1529:	f3 0f 59 f5          	mulss  xmm6,xmm5
    152d:	f3 0f 59 ea          	mulss  xmm5,xmm2
    1531:	f3 0f 58 f5          	addss  xmm6,xmm5
    1535:	0f 2f f1             	comiss xmm6,xmm1
    1538:	0f 87 92 01 00 00    	ja     16d0 <main+0x570>
    153e:	66 0f ef ff          	pxor   xmm7,xmm7
    1542:	f3 0f 5a fe          	cvtss2sd xmm7,xmm6
    1546:	f2 0f 5c c7          	subsd  xmm0,xmm7
    154a:	4c 8d 4f 05          	lea    r9,[rdi+0x5]
    154e:	f3 46 0f 10 0c 8b    	movss  xmm9,DWORD PTR [rbx+r9*4]
    1554:	f3 46 0f 10 54 8d 00 	movss  xmm10,DWORD PTR [rbp+r9*4+0x0]
    155b:	f3 45 0f 59 d1       	mulss  xmm10,xmm9
    1560:	f3 44 0f 59 ca       	mulss  xmm9,xmm2
    1565:	f3 45 0f 58 d1       	addss  xmm10,xmm9
    156a:	44 0f 2f d1          	comiss xmm10,xmm1
    156e:	0f 87 3c 01 00 00    	ja     16b0 <main+0x550>
    1574:	66 45 0f ef db       	pxor   xmm11,xmm11
    1579:	f3 45 0f 5a da       	cvtss2sd xmm11,xmm10
    157e:	f2 41 0f 5c c3       	subsd  xmm0,xmm11
    1583:	48 8d 47 06          	lea    rax,[rdi+0x6]
    1587:	f3 44 0f 10 2c 83    	movss  xmm13,DWORD PTR [rbx+rax*4]
    158d:	f3 44 0f 10 74 85 00 	movss  xmm14,DWORD PTR [rbp+rax*4+0x0]
    1594:	f3 45 0f 59 f5       	mulss  xmm14,xmm13
    1599:	f3 44 0f 59 ea       	mulss  xmm13,xmm2
    159e:	f3 45 0f 58 f5       	addss  xmm14,xmm13
    15a3:	44 0f 2f f1          	comiss xmm14,xmm1
    15a7:	0f 87 e3 00 00 00    	ja     1690 <main+0x530>
    15ad:	66 45 0f ef ff       	pxor   xmm15,xmm15
    15b2:	f3 45 0f 5a fe       	cvtss2sd xmm15,xmm14
    15b7:	f2 41 0f 5c c7       	subsd  xmm0,xmm15
    15bc:	4c 8d 57 07          	lea    r10,[rdi+0x7]
    15c0:	48 81 ff f9 ff 00 00 	cmp    rdi,0xfff9
    15c7:	74 47                	je     1610 <main+0x4b0>
    15c9:	f3 46 0f 10 1c 93    	movss  xmm11,DWORD PTR [rbx+r10*4]
    15cf:	f3 46 0f 10 64 95 00 	movss  xmm12,DWORD PTR [rbp+r10*4+0x0]
    15d6:	f3 45 0f 59 e3       	mulss  xmm12,xmm11
    15db:	f3 44 0f 59 da       	mulss  xmm11,xmm2
    15e0:	f3 45 0f 58 e3       	addss  xmm12,xmm11
    15e5:	44 0f 2f e1          	comiss xmm12,xmm1
    15e9:	0f 86 41 fe ff ff    	jbe    1430 <main+0x2d0>
    15ef:	f3 45 0f 51 e4       	sqrtss xmm12,xmm12
    15f4:	66 45 0f ef f6       	pxor   xmm14,xmm14
    15f9:	f3 45 0f 5a f4       	cvtss2sd xmm14,xmm12
    15fe:	f2 41 0f 58 c6       	addsd  xmm0,xmm14
    1603:	e9 37 fe ff ff       	jmp    143f <main+0x2df>
    1608:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    160f:	00 
    1610:	83 ea 01             	sub    edx,0x1
    1613:	0f 85 07 fe ff ff    	jne    1420 <main+0x2c0>
    1619:	f2 0f 11 44 24 08    	movsd  QWORD PTR [rsp+0x8],xmm0
    161f:	e8 dc fa ff ff       	call   1100 <std::chrono::_V2::steady_clock::now()@plt>
    1624:	66 0f ef c9          	pxor   xmm1,xmm1
    1628:	f2 0f 10 44 24 08    	movsd  xmm0,QWORD PTR [rsp+0x8]
    162e:	48 8d 35 db 09 00 00 	lea    rsi,[rip+0x9db]        # 2010 <_IO_stdin_used+0x10>
    1635:	4c 29 e0             	sub    rax,r12
    1638:	bf 02 00 00 00       	mov    edi,0x2
    163d:	f2 48 0f 2a c8       	cvtsi2sd xmm1,rax
    1642:	b8 02 00 00 00       	mov    eax,0x2
    1647:	f2 0f 5e 0d e1 09 00 	divsd  xmm1,QWORD PTR [rip+0x9e1]        # 2030 <_IO_stdin_used+0x30>
    164e:	00 
    164f:	e8 5c fa ff ff       	call   10b0 <__printf_chk@plt>
    1654:	48 8d 7c 24 30       	lea    rdi,[rsp+0x30]
    1659:	e8 22 02 00 00       	call   1880 <std::vector<float, std::allocator<float> >::~vector()>
    165e:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
    1663:	e8 18 02 00 00       	call   1880 <std::vector<float, std::allocator<float> >::~vector()>
    1668:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
    166d:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    1674:	00 00 
    1676:	0f 85 e9 00 00 00    	jne    1765 <main+0x605>
    167c:	48 83 c4 50          	add    rsp,0x50
    1680:	31 c0                	xor    eax,eax
    1682:	5b                   	pop    rbx
    1683:	5d                   	pop    rbp
    1684:	41 5c                	pop    r12
    1686:	c3                   	ret
    1687:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    168e:	00 00 
    1690:	f3 45 0f 51 f6       	sqrtss xmm14,xmm14
    1695:	66 0f ef db          	pxor   xmm3,xmm3
    1699:	f3 41 0f 5a de       	cvtss2sd xmm3,xmm14
    169e:	f2 0f 58 c3          	addsd  xmm0,xmm3
    16a2:	e9 15 ff ff ff       	jmp    15bc <main+0x45c>
    16a7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    16ae:	00 00 
    16b0:	f3 45 0f 51 d2       	sqrtss xmm10,xmm10
    16b5:	66 45 0f ef e4       	pxor   xmm12,xmm12
    16ba:	f3 45 0f 5a e2       	cvtss2sd xmm12,xmm10
    16bf:	f2 41 0f 58 c4       	addsd  xmm0,xmm12
    16c4:	e9 ba fe ff ff       	jmp    1583 <main+0x423>
    16c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    16d0:	f3 0f 51 f6          	sqrtss xmm6,xmm6
    16d4:	66 45 0f ef c0       	pxor   xmm8,xmm8
    16d9:	f3 44 0f 5a c6       	cvtss2sd xmm8,xmm6
    16de:	f2 41 0f 58 c0       	addsd  xmm0,xmm8
    16e3:	e9 62 fe ff ff       	jmp    154a <main+0x3ea>
    16e8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    16ef:	00 
    16f0:	f3 45 0f 51 ff       	sqrtss xmm15,xmm15
    16f5:	66 0f ef e4          	pxor   xmm4,xmm4
    16f9:	f3 41 0f 5a e7       	cvtss2sd xmm4,xmm15
    16fe:	f2 0f 58 c4          	addsd  xmm0,xmm4
    1702:	e9 11 fe ff ff       	jmp    1518 <main+0x3b8>
    1707:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    170e:	00 00 
    1710:	f3 45 0f 51 db       	sqrtss xmm11,xmm11
    1715:	66 45 0f ef ed       	pxor   xmm13,xmm13
    171a:	f3 45 0f 5a eb       	cvtss2sd xmm13,xmm11
    171f:	f2 41 0f 58 c5       	addsd  xmm0,xmm13
    1724:	e9 b8 fd ff ff       	jmp    14e1 <main+0x381>
    1729:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1730:	f3 0f 51 ff          	sqrtss xmm7,xmm7
    1734:	66 45 0f ef c9       	pxor   xmm9,xmm9
    1739:	f3 44 0f 5a cf       	cvtss2sd xmm9,xmm7
    173e:	f2 41 0f 58 c1       	addsd  xmm0,xmm9
    1743:	e9 60 fd ff ff       	jmp    14a8 <main+0x348>
    1748:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    174f:	00 
    1750:	f3 0f 51 db          	sqrtss xmm3,xmm3
    1754:	66 0f ef ed          	pxor   xmm5,xmm5
    1758:	f3 0f 5a eb          	cvtss2sd xmm5,xmm3
    175c:	f2 0f 58 c5          	addsd  xmm0,xmm5
    1760:	e9 0e fd ff ff       	jmp    1473 <main+0x313>
    1765:	e8 86 f9 ff ff       	call   10f0 <__stack_chk_fail@plt>
    176a:	f3 0f 1e fa          	endbr64
    176e:	48 89 c3             	mov    rbx,rax
    1771:	e9 aa f9 ff ff       	jmp    1120 <main.cold>
    1776:	f3 0f 1e fa          	endbr64
    177a:	48 89 c3             	mov    rbx,rax
    177d:	e9 a8 f9 ff ff       	jmp    112a <main.cold+0xa>
    1782:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    1789:	00 00 00 
    178c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

