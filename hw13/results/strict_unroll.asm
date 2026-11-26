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
    1278:	c5 f2 5e d8          	vdivss xmm3,xmm1,xmm0
    127c:	4c 8d 56 01          	lea    r10,[rsi+0x1]
    1280:	4d 29 e1             	sub    r9,r12
    1283:	4c 8d a7 37 9e 00 00 	lea    r12,[rdi+0x9e37]
    128a:	48 c1 ea 04          	shr    rdx,0x4
    128e:	c4 c1 da 2a f1       	vcvtsi2ss xmm6,xmm4,r9
    1293:	c5 ca 5e f8          	vdivss xmm7,xmm6,xmm0
    1297:	4c 69 ca e8 03 00 00 	imul   r9,rdx,0x3e8
    129e:	4c 29 c8             	sub    rax,r9
    12a1:	c4 61 da 2a c0       	vcvtsi2ss xmm8,xmm4,rax
    12a6:	4c 89 e0             	mov    rax,r12
    12a9:	c5 3a 5e c8          	vdivss xmm9,xmm8,xmm0
    12ad:	48 c1 e8 03          	shr    rax,0x3
    12b1:	c5 e2 5c ea          	vsubss xmm5,xmm3,xmm2
    12b5:	48 f7 e1             	mul    rcx
    12b8:	c5 fa 11 2c b3       	vmovss DWORD PTR [rbx+rsi*4],xmm5
    12bd:	48 c1 ea 04          	shr    rdx,0x4
    12c1:	c5 fa 11 7c b5 00    	vmovss DWORD PTR [rbp+rsi*4+0x0],xmm7
    12c7:	4c 69 ca e8 03 00 00 	imul   r9,rdx,0x3e8
    12ce:	c5 32 5c d2          	vsubss xmm10,xmm9,xmm2
    12d2:	4d 29 cc             	sub    r12,r9
    12d5:	4c 8d 8f 6e 3c 01 00 	lea    r9,[rdi+0x13c6e]
    12dc:	c4 41 da 2a dc       	vcvtsi2ss xmm11,xmm4,r12
    12e1:	c5 22 5e e0          	vdivss xmm12,xmm11,xmm0
    12e5:	4c 8d 66 02          	lea    r12,[rsi+0x2]
    12e9:	c4 21 7a 11 14 93    	vmovss DWORD PTR [rbx+r10*4],xmm10
    12ef:	c4 21 7a 11 64 95 00 	vmovss DWORD PTR [rbp+r10*4+0x0],xmm12
    12f6:	41 ba b1 79 37 9e    	mov    r10d,0x9e3779b1
    12fc:	4d 01 c2             	add    r10,r8
    12ff:	4c 89 d0             	mov    rax,r10
    1302:	48 c1 e8 03          	shr    rax,0x3
    1306:	48 f7 e1             	mul    rcx
    1309:	48 c1 ea 04          	shr    rdx,0x4
    130d:	48 69 c2 e8 03 00 00 	imul   rax,rdx,0x3e8
    1314:	49 29 c2             	sub    r10,rax
    1317:	4c 89 c8             	mov    rax,r9
    131a:	48 c1 e8 03          	shr    rax,0x3
    131e:	c4 41 da 2a ea       	vcvtsi2ss xmm13,xmm4,r10
    1323:	c5 12 5e f0          	vdivss xmm14,xmm13,xmm0
    1327:	48 f7 e1             	mul    rcx
    132a:	48 c1 ea 04          	shr    rdx,0x4
    132e:	4c 69 d2 e8 03 00 00 	imul   r10,rdx,0x3e8
    1335:	4d 29 d1             	sub    r9,r10
    1338:	49 ba 62 f3 6e 3c 01 	movabs r10,0x13c6ef362
    133f:	00 00 00 
    1342:	4d 01 c2             	add    r10,r8
    1345:	c4 c1 da 2a c9       	vcvtsi2ss xmm1,xmm4,r9
    134a:	4c 8d 8f a5 da 01 00 	lea    r9,[rdi+0x1daa5]
    1351:	c5 f2 5e d8          	vdivss xmm3,xmm1,xmm0
    1355:	4c 89 d0             	mov    rax,r10
    1358:	c5 0a 5c fa          	vsubss xmm15,xmm14,xmm2
    135c:	48 81 c7 dc 78 02 00 	add    rdi,0x278dc
    1363:	48 c1 e8 03          	shr    rax,0x3
    1367:	48 f7 e1             	mul    rcx
    136a:	c4 21 7a 11 3c a3    	vmovss DWORD PTR [rbx+r12*4],xmm15
    1370:	48 c1 ea 04          	shr    rdx,0x4
    1374:	48 69 c2 e8 03 00 00 	imul   rax,rdx,0x3e8
    137b:	c4 a1 7a 11 5c a5 00 	vmovss DWORD PTR [rbp+r12*4+0x0],xmm3
    1382:	4c 8d 66 03          	lea    r12,[rsi+0x3]
    1386:	48 83 c6 04          	add    rsi,0x4
    138a:	49 29 c2             	sub    r10,rax
    138d:	4c 89 c8             	mov    rax,r9
    1390:	48 c1 e8 03          	shr    rax,0x3
    1394:	c4 c1 da 2a ea       	vcvtsi2ss xmm5,xmm4,r10
    1399:	c5 d2 5e f0          	vdivss xmm6,xmm5,xmm0
    139d:	48 f7 e1             	mul    rcx
    13a0:	48 c1 ea 04          	shr    rdx,0x4
    13a4:	4c 69 d2 e8 03 00 00 	imul   r10,rdx,0x3e8
    13ab:	4d 29 d1             	sub    r9,r10
    13ae:	c4 41 da 2a c1       	vcvtsi2ss xmm8,xmm4,r9
    13b3:	c5 3a 5e c8          	vdivss xmm9,xmm8,xmm0
    13b7:	c5 ca 5c fa          	vsubss xmm7,xmm6,xmm2
    13bb:	c4 a1 7a 11 3c a3    	vmovss DWORD PTR [rbx+r12*4],xmm7
    13c1:	c4 21 7a 11 4c a5 00 	vmovss DWORD PTR [rbp+r12*4+0x0],xmm9
    13c8:	49 bc 13 6d a6 da 01 	movabs r12,0x1daa66d13
    13cf:	00 00 00 
    13d2:	4d 01 e0             	add    r8,r12
    13d5:	48 81 fe 00 00 01 00 	cmp    rsi,0x10000
    13dc:	0f 85 4e fe ff ff    	jne    1230 <main+0xd0>
    13e2:	e8 19 fd ff ff       	call   1100 <std::chrono::_V2::steady_clock::now()@plt>
    13e7:	c5 fa 10 15 1d 0c 00 	vmovss xmm2,DWORD PTR [rip+0xc1d]        # 200c <_IO_stdin_used+0xc>
    13ee:	00 
    13ef:	b9 b8 0b 00 00       	mov    ecx,0xbb8
    13f4:	c5 f0 57 c9          	vxorps xmm1,xmm1,xmm1
    13f8:	49 89 c4             	mov    r12,rax
    13fb:	c4 41 31 57 c9       	vxorpd xmm9,xmm9,xmm9
    1400:	45 31 d2             	xor    r10d,r10d
    1403:	e9 4d 01 00 00       	jmp    1555 <main+0x3f5>
    1408:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    140f:	00 
    1410:	c4 41 1a 5a ec       	vcvtss2sd xmm13,xmm12,xmm12
    1415:	c4 c1 33 5c c5       	vsubsd xmm0,xmm9,xmm13
    141a:	49 8d 7a 01          	lea    rdi,[r10+0x1]
    141e:	c5 7a 10 3c bb       	vmovss xmm15,DWORD PTR [rbx+rdi*4]
    1423:	c5 82 59 5c bd 00    	vmulss xmm3,xmm15,DWORD PTR [rbp+rdi*4+0x0]
    1429:	c5 82 59 ea          	vmulss xmm5,xmm15,xmm2
    142d:	c5 e2 58 f5          	vaddss xmm6,xmm3,xmm5
    1431:	c5 f8 2f f1          	vcomiss xmm6,xmm1
    1435:	0f 87 95 02 00 00    	ja     16d0 <main+0x570>
    143b:	c5 ca 5a fe          	vcvtss2sd xmm7,xmm6,xmm6
    143f:	c5 7b 5c cf          	vsubsd xmm9,xmm0,xmm7
    1443:	4c 8d 47 01          	lea    r8,[rdi+0x1]
    1447:	c4 a1 7a 10 24 83    	vmovss xmm4,DWORD PTR [rbx+r8*4]
    144d:	c4 21 5a 59 54 85 00 	vmulss xmm10,xmm4,DWORD PTR [rbp+r8*4+0x0]
    1454:	c5 5a 59 da          	vmulss xmm11,xmm4,xmm2
    1458:	c4 41 2a 58 e3       	vaddss xmm12,xmm10,xmm11
    145d:	c5 78 2f e1          	vcomiss xmm12,xmm1
    1461:	0f 87 49 02 00 00    	ja     16b0 <main+0x550>
    1467:	c4 41 1a 5a ec       	vcvtss2sd xmm13,xmm12,xmm12
    146c:	c4 41 33 5c f5       	vsubsd xmm14,xmm9,xmm13
    1471:	48 8d 77 02          	lea    rsi,[rdi+0x2]
    1475:	c5 7a 10 3c b3       	vmovss xmm15,DWORD PTR [rbx+rsi*4]
    147a:	c5 82 59 5c b5 00    	vmulss xmm3,xmm15,DWORD PTR [rbp+rsi*4+0x0]
    1480:	c5 82 59 ea          	vmulss xmm5,xmm15,xmm2
    1484:	c5 e2 58 f5          	vaddss xmm6,xmm3,xmm5
    1488:	c5 f8 2f f1          	vcomiss xmm6,xmm1
    148c:	0f 87 fe 01 00 00    	ja     1690 <main+0x530>
    1492:	c5 ca 5a fe          	vcvtss2sd xmm7,xmm6,xmm6
    1496:	c5 0b 5c cf          	vsubsd xmm9,xmm14,xmm7
    149a:	4c 8d 5f 03          	lea    r11,[rdi+0x3]
    149e:	c4 a1 7a 10 24 9b    	vmovss xmm4,DWORD PTR [rbx+r11*4]
    14a4:	c4 21 5a 59 54 9d 00 	vmulss xmm10,xmm4,DWORD PTR [rbp+r11*4+0x0]
    14ab:	c5 5a 59 da          	vmulss xmm11,xmm4,xmm2
    14af:	c4 41 2a 58 e3       	vaddss xmm12,xmm10,xmm11
    14b4:	c5 78 2f e1          	vcomiss xmm12,xmm1
    14b8:	0f 87 b2 01 00 00    	ja     1670 <main+0x510>
    14be:	c4 41 1a 5a ec       	vcvtss2sd xmm13,xmm12,xmm12
    14c3:	c4 41 33 5c f5       	vsubsd xmm14,xmm9,xmm13
    14c8:	4c 8d 4f 04          	lea    r9,[rdi+0x4]
    14cc:	c4 21 7a 10 3c 8b    	vmovss xmm15,DWORD PTR [rbx+r9*4]
    14d2:	c4 a1 02 59 5c 8d 00 	vmulss xmm3,xmm15,DWORD PTR [rbp+r9*4+0x0]
    14d9:	c5 82 59 ea          	vmulss xmm5,xmm15,xmm2
    14dd:	c5 e2 58 f5          	vaddss xmm6,xmm3,xmm5
    14e1:	c5 f8 2f f1          	vcomiss xmm6,xmm1
    14e5:	0f 87 65 01 00 00    	ja     1650 <main+0x4f0>
    14eb:	c5 ca 5a fe          	vcvtss2sd xmm7,xmm6,xmm6
    14ef:	c5 0b 5c cf          	vsubsd xmm9,xmm14,xmm7
    14f3:	48 8d 47 05          	lea    rax,[rdi+0x5]
    14f7:	c5 fa 10 24 83       	vmovss xmm4,DWORD PTR [rbx+rax*4]
    14fc:	c5 5a 59 54 85 00    	vmulss xmm10,xmm4,DWORD PTR [rbp+rax*4+0x0]
    1502:	c5 5a 59 da          	vmulss xmm11,xmm4,xmm2
    1506:	c4 41 2a 58 e3       	vaddss xmm12,xmm10,xmm11
    150b:	c5 78 2f e1          	vcomiss xmm12,xmm1
    150f:	0f 87 1b 01 00 00    	ja     1630 <main+0x4d0>
    1515:	c4 41 1a 5a ec       	vcvtss2sd xmm13,xmm12,xmm12
    151a:	c4 41 33 5c f5       	vsubsd xmm14,xmm9,xmm13
    151f:	48 8d 57 06          	lea    rdx,[rdi+0x6]
    1523:	c5 7a 10 3c 93       	vmovss xmm15,DWORD PTR [rbx+rdx*4]
    1528:	c5 82 59 5c 95 00    	vmulss xmm3,xmm15,DWORD PTR [rbp+rdx*4+0x0]
    152e:	c5 82 59 ea          	vmulss xmm5,xmm15,xmm2
    1532:	c5 e2 58 f5          	vaddss xmm6,xmm3,xmm5
    1536:	c5 f8 2f f1          	vcomiss xmm6,xmm1
    153a:	0f 87 d0 00 00 00    	ja     1610 <main+0x4b0>
    1540:	c5 ca 5a fe          	vcvtss2sd xmm7,xmm6,xmm6
    1544:	c5 0b 5c cf          	vsubsd xmm9,xmm14,xmm7
    1548:	4c 8d 57 07          	lea    r10,[rdi+0x7]
    154c:	48 81 ff f9 ff 00 00 	cmp    rdi,0xfff9
    1553:	74 3b                	je     1590 <main+0x430>
    1555:	c4 a1 7a 10 24 93    	vmovss xmm4,DWORD PTR [rbx+r10*4]
    155b:	c4 21 5a 59 54 95 00 	vmulss xmm10,xmm4,DWORD PTR [rbp+r10*4+0x0]
    1562:	c5 5a 59 da          	vmulss xmm11,xmm4,xmm2
    1566:	c4 41 2a 58 e3       	vaddss xmm12,xmm10,xmm11
    156b:	c5 78 2f e1          	vcomiss xmm12,xmm1
    156f:	0f 86 9b fe ff ff    	jbe    1410 <main+0x2b0>
    1575:	c4 41 1a 51 e4       	vsqrtss xmm12,xmm12,xmm12
    157a:	c4 41 1a 5a f4       	vcvtss2sd xmm14,xmm12,xmm12
    157f:	c4 c1 33 58 c6       	vaddsd xmm0,xmm9,xmm14
    1584:	e9 91 fe ff ff       	jmp    141a <main+0x2ba>
    1589:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1590:	ff c9                	dec    ecx
    1592:	0f 85 68 fe ff ff    	jne    1400 <main+0x2a0>
    1598:	c5 7b 11 4c 24 08    	vmovsd QWORD PTR [rsp+0x8],xmm9
    159e:	e8 5d fb ff ff       	call   1100 <std::chrono::_V2::steady_clock::now()@plt>
    15a3:	c5 d8 57 e4          	vxorps xmm4,xmm4,xmm4
    15a7:	48 8d 35 62 0a 00 00 	lea    rsi,[rip+0xa62]        # 2010 <_IO_stdin_used+0x10>
    15ae:	4c 29 e0             	sub    rax,r12
    15b1:	bf 02 00 00 00       	mov    edi,0x2
    15b6:	c5 fb 10 44 24 08    	vmovsd xmm0,QWORD PTR [rsp+0x8]
    15bc:	c4 61 db 2a d0       	vcvtsi2sd xmm10,xmm4,rax
    15c1:	b8 02 00 00 00       	mov    eax,0x2
    15c6:	c5 ab 5e 0d 62 0a 00 	vdivsd xmm1,xmm10,QWORD PTR [rip+0xa62]        # 2030 <_IO_stdin_used+0x30>
    15cd:	00 
    15ce:	e8 dd fa ff ff       	call   10b0 <__printf_chk@plt>
    15d3:	48 8d 7c 24 30       	lea    rdi,[rsp+0x30]
    15d8:	e8 23 02 00 00       	call   1800 <std::vector<float, std::allocator<float> >::~vector()>
    15dd:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
    15e2:	e8 19 02 00 00       	call   1800 <std::vector<float, std::allocator<float> >::~vector()>
    15e7:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
    15ec:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    15f3:	00 00 
    15f5:	0f 85 e7 00 00 00    	jne    16e2 <main+0x582>
    15fb:	48 83 c4 50          	add    rsp,0x50
    15ff:	31 c0                	xor    eax,eax
    1601:	5b                   	pop    rbx
    1602:	5d                   	pop    rbp
    1603:	41 5c                	pop    r12
    1605:	c3                   	ret
    1606:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    160d:	00 00 00 
    1610:	c5 ca 51 f6          	vsqrtss xmm6,xmm6,xmm6
    1614:	c5 4a 5a c6          	vcvtss2sd xmm8,xmm6,xmm6
    1618:	c4 41 0b 58 c8       	vaddsd xmm9,xmm14,xmm8
    161d:	e9 26 ff ff ff       	jmp    1548 <main+0x3e8>
    1622:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    1629:	00 00 00 00 
    162d:	0f 1f 00             	nop    DWORD PTR [rax]
    1630:	c4 41 1a 51 e4       	vsqrtss xmm12,xmm12,xmm12
    1635:	c4 c1 1a 5a c4       	vcvtss2sd xmm0,xmm12,xmm12
    163a:	c5 33 58 f0          	vaddsd xmm14,xmm9,xmm0
    163e:	e9 dc fe ff ff       	jmp    151f <main+0x3bf>
    1643:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    164a:	00 00 00 00 
    164e:	66 90                	xchg   ax,ax
    1650:	c5 ca 51 f6          	vsqrtss xmm6,xmm6,xmm6
    1654:	c5 4a 5a c6          	vcvtss2sd xmm8,xmm6,xmm6
    1658:	c4 41 0b 58 c8       	vaddsd xmm9,xmm14,xmm8
    165d:	e9 91 fe ff ff       	jmp    14f3 <main+0x393>
    1662:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    1669:	00 00 00 00 
    166d:	0f 1f 00             	nop    DWORD PTR [rax]
    1670:	c4 41 1a 51 e4       	vsqrtss xmm12,xmm12,xmm12
    1675:	c4 c1 1a 5a c4       	vcvtss2sd xmm0,xmm12,xmm12
    167a:	c5 33 58 f0          	vaddsd xmm14,xmm9,xmm0
    167e:	e9 45 fe ff ff       	jmp    14c8 <main+0x368>
    1683:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    168a:	00 00 00 00 
    168e:	66 90                	xchg   ax,ax
    1690:	c5 ca 51 f6          	vsqrtss xmm6,xmm6,xmm6
    1694:	c5 4a 5a c6          	vcvtss2sd xmm8,xmm6,xmm6
    1698:	c4 41 0b 58 c8       	vaddsd xmm9,xmm14,xmm8
    169d:	e9 f8 fd ff ff       	jmp    149a <main+0x33a>
    16a2:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    16a9:	00 00 00 00 
    16ad:	0f 1f 00             	nop    DWORD PTR [rax]
    16b0:	c4 41 1a 51 e4       	vsqrtss xmm12,xmm12,xmm12
    16b5:	c4 c1 1a 5a c4       	vcvtss2sd xmm0,xmm12,xmm12
    16ba:	c5 33 58 f0          	vaddsd xmm14,xmm9,xmm0
    16be:	e9 ae fd ff ff       	jmp    1471 <main+0x311>
    16c3:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    16ca:	00 00 00 00 
    16ce:	66 90                	xchg   ax,ax
    16d0:	c5 ca 51 f6          	vsqrtss xmm6,xmm6,xmm6
    16d4:	c5 4a 5a c6          	vcvtss2sd xmm8,xmm6,xmm6
    16d8:	c4 41 7b 58 c8       	vaddsd xmm9,xmm0,xmm8
    16dd:	e9 61 fd ff ff       	jmp    1443 <main+0x2e3>
    16e2:	e8 09 fa ff ff       	call   10f0 <__stack_chk_fail@plt>
    16e7:	f3 0f 1e fa          	endbr64
    16eb:	48 89 c3             	mov    rbx,rax
    16ee:	e9 2d fa ff ff       	jmp    1120 <main.cold>
    16f3:	f3 0f 1e fa          	endbr64
    16f7:	48 89 c3             	mov    rbx,rax
    16fa:	c5 f8 77             	vzeroupper
    16fd:	e9 2b fa ff ff       	jmp    112d <main.cold+0xd>
    1702:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    1709:	00 00 00 
    170c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

