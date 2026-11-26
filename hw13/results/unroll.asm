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
    13e7:	c5 fa 10 1d 1d 0c 00 	vmovss xmm3,DWORD PTR [rip+0xc1d]        # 200c <_IO_stdin_used+0xc>
    13ee:	00 
    13ef:	b9 b8 0b 00 00       	mov    ecx,0xbb8
    13f4:	c5 e8 57 d2          	vxorps xmm2,xmm2,xmm2
    13f8:	49 89 c4             	mov    r12,rax
    13fb:	c4 41 39 57 c0       	vxorpd xmm8,xmm8,xmm8
    1400:	45 31 d2             	xor    r10d,r10d
    1403:	e9 35 01 00 00       	jmp    153d <main+0x3dd>
    1408:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    140f:	00 
    1410:	c5 5a 5a dc          	vcvtss2sd xmm11,xmm4,xmm4
    1414:	c4 c1 3b 5c c3       	vsubsd xmm0,xmm8,xmm11
    1419:	49 8d 7a 01          	lea    rdi,[r10+0x1]
    141d:	c5 7a 10 2c bb       	vmovss xmm13,DWORD PTR [rbx+rdi*4]
    1422:	c5 12 59 f3          	vmulss xmm14,xmm13,xmm3
    1426:	c4 62 09 99 6c bd 00 	vfmadd132ss xmm13,xmm14,DWORD PTR [rbp+rdi*4+0x0]
    142d:	c5 78 2f ea          	vcomiss xmm13,xmm2
    1431:	0f 87 79 02 00 00    	ja     16b0 <main+0x550>
    1437:	c4 41 12 5a fd       	vcvtss2sd xmm15,xmm13,xmm13
    143c:	c4 c1 7b 5c f7       	vsubsd xmm6,xmm0,xmm15
    1441:	4c 8d 47 01          	lea    r8,[rdi+0x1]
    1445:	c4 a1 7a 10 3c 83    	vmovss xmm7,DWORD PTR [rbx+r8*4]
    144b:	c5 c2 59 eb          	vmulss xmm5,xmm7,xmm3
    144f:	c4 a2 51 99 7c 85 00 	vfmadd132ss xmm7,xmm5,DWORD PTR [rbp+r8*4+0x0]
    1456:	c5 f8 2f fa          	vcomiss xmm7,xmm2
    145a:	0f 87 30 02 00 00    	ja     1690 <main+0x530>
    1460:	c5 42 5a c7          	vcvtss2sd xmm8,xmm7,xmm7
    1464:	c4 c1 4b 5c e0       	vsubsd xmm4,xmm6,xmm8
    1469:	48 8d 77 02          	lea    rsi,[rdi+0x2]
    146d:	c5 7a 10 14 b3       	vmovss xmm10,DWORD PTR [rbx+rsi*4]
    1472:	c5 2a 59 db          	vmulss xmm11,xmm10,xmm3
    1476:	c4 62 21 99 54 b5 00 	vfmadd132ss xmm10,xmm11,DWORD PTR [rbp+rsi*4+0x0]
    147d:	c5 78 2f d2          	vcomiss xmm10,xmm2
    1481:	0f 87 e9 01 00 00    	ja     1670 <main+0x510>
    1487:	c4 c1 2a 5a c2       	vcvtss2sd xmm0,xmm10,xmm10
    148c:	c5 5b 5c e8          	vsubsd xmm13,xmm4,xmm0
    1490:	4c 8d 5f 03          	lea    r11,[rdi+0x3]
    1494:	c4 21 7a 10 34 9b    	vmovss xmm14,DWORD PTR [rbx+r11*4]
    149a:	c5 0a 59 fb          	vmulss xmm15,xmm14,xmm3
    149e:	c4 22 01 99 74 9d 00 	vfmadd132ss xmm14,xmm15,DWORD PTR [rbp+r11*4+0x0]
    14a5:	c5 78 2f f2          	vcomiss xmm14,xmm2
    14a9:	0f 87 a1 01 00 00    	ja     1650 <main+0x4f0>
    14af:	c4 c1 0a 5a ce       	vcvtss2sd xmm1,xmm14,xmm14
    14b4:	c5 93 5c f9          	vsubsd xmm7,xmm13,xmm1
    14b8:	4c 8d 4f 04          	lea    r9,[rdi+0x4]
    14bc:	c4 21 7a 10 04 8b    	vmovss xmm8,DWORD PTR [rbx+r9*4]
    14c2:	c5 ba 59 eb          	vmulss xmm5,xmm8,xmm3
    14c6:	c4 22 51 99 44 8d 00 	vfmadd132ss xmm8,xmm5,DWORD PTR [rbp+r9*4+0x0]
    14cd:	c5 78 2f c2          	vcomiss xmm8,xmm2
    14d1:	0f 87 59 01 00 00    	ja     1630 <main+0x4d0>
    14d7:	c4 41 3a 5a c8       	vcvtss2sd xmm9,xmm8,xmm8
    14dc:	c4 41 43 5c d1       	vsubsd xmm10,xmm7,xmm9
    14e1:	48 8d 47 05          	lea    rax,[rdi+0x5]
    14e5:	c5 7a 10 1c 83       	vmovss xmm11,DWORD PTR [rbx+rax*4]
    14ea:	c5 a2 59 c3          	vmulss xmm0,xmm11,xmm3
    14ee:	c4 62 79 99 5c 85 00 	vfmadd132ss xmm11,xmm0,DWORD PTR [rbp+rax*4+0x0]
    14f5:	c5 78 2f da          	vcomiss xmm11,xmm2
    14f9:	0f 87 11 01 00 00    	ja     1610 <main+0x4b0>
    14ff:	c4 41 22 5a e3       	vcvtss2sd xmm12,xmm11,xmm11
    1504:	c4 41 2b 5c f4       	vsubsd xmm14,xmm10,xmm12
    1509:	48 8d 57 06          	lea    rdx,[rdi+0x6]
    150d:	c5 7a 10 3c 93       	vmovss xmm15,DWORD PTR [rbx+rdx*4]
    1512:	c5 82 59 cb          	vmulss xmm1,xmm15,xmm3
    1516:	c4 62 71 99 7c 95 00 	vfmadd132ss xmm15,xmm1,DWORD PTR [rbp+rdx*4+0x0]
    151d:	c5 78 2f fa          	vcomiss xmm15,xmm2
    1521:	0f 87 c9 00 00 00    	ja     15f0 <main+0x490>
    1527:	c4 c1 02 5a f7       	vcvtss2sd xmm6,xmm15,xmm15
    152c:	c5 0b 5c c6          	vsubsd xmm8,xmm14,xmm6
    1530:	4c 8d 57 07          	lea    r10,[rdi+0x7]
    1534:	48 81 ff f9 ff 00 00 	cmp    rdi,0xfff9
    153b:	74 33                	je     1570 <main+0x410>
    153d:	c4 a1 7a 10 24 93    	vmovss xmm4,DWORD PTR [rbx+r10*4]
    1543:	c5 5a 59 d3          	vmulss xmm10,xmm4,xmm3
    1547:	c4 a2 29 99 64 95 00 	vfmadd132ss xmm4,xmm10,DWORD PTR [rbp+r10*4+0x0]
    154e:	c5 f8 2f e2          	vcomiss xmm4,xmm2
    1552:	0f 86 b8 fe ff ff    	jbe    1410 <main+0x2b0>
    1558:	c5 da 51 e4          	vsqrtss xmm4,xmm4,xmm4
    155c:	c5 5a 5a e4          	vcvtss2sd xmm12,xmm4,xmm4
    1560:	c4 c1 3b 58 c4       	vaddsd xmm0,xmm8,xmm12
    1565:	e9 af fe ff ff       	jmp    1419 <main+0x2b9>
    156a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1570:	ff c9                	dec    ecx
    1572:	0f 85 88 fe ff ff    	jne    1400 <main+0x2a0>
    1578:	c5 7b 11 44 24 08    	vmovsd QWORD PTR [rsp+0x8],xmm8
    157e:	e8 7d fb ff ff       	call   1100 <std::chrono::_V2::steady_clock::now()@plt>
    1583:	c5 d0 57 ed          	vxorps xmm5,xmm5,xmm5
    1587:	48 8d 35 82 0a 00 00 	lea    rsi,[rip+0xa82]        # 2010 <_IO_stdin_used+0x10>
    158e:	4c 29 e0             	sub    rax,r12
    1591:	bf 02 00 00 00       	mov    edi,0x2
    1596:	c5 fb 10 44 24 08    	vmovsd xmm0,QWORD PTR [rsp+0x8]
    159c:	c4 61 d3 2a c8       	vcvtsi2sd xmm9,xmm5,rax
    15a1:	b8 02 00 00 00       	mov    eax,0x2
    15a6:	c5 b3 5e 0d 82 0a 00 	vdivsd xmm1,xmm9,QWORD PTR [rip+0xa82]        # 2030 <_IO_stdin_used+0x30>
    15ad:	00 
    15ae:	e8 fd fa ff ff       	call   10b0 <__printf_chk@plt>
    15b3:	48 8d 7c 24 30       	lea    rdi,[rsp+0x30]
    15b8:	e8 23 02 00 00       	call   17e0 <std::vector<float, std::allocator<float> >::~vector()>
    15bd:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
    15c2:	e8 19 02 00 00       	call   17e0 <std::vector<float, std::allocator<float> >::~vector()>
    15c7:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
    15cc:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    15d3:	00 00 
    15d5:	0f 85 e8 00 00 00    	jne    16c3 <main+0x563>
    15db:	48 83 c4 50          	add    rsp,0x50
    15df:	31 c0                	xor    eax,eax
    15e1:	5b                   	pop    rbx
    15e2:	5d                   	pop    rbp
    15e3:	41 5c                	pop    r12
    15e5:	c3                   	ret
    15e6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    15ed:	00 00 00 
    15f0:	c4 41 02 51 ff       	vsqrtss xmm15,xmm15,xmm15
    15f5:	c4 c1 02 5a ff       	vcvtss2sd xmm7,xmm15,xmm15
    15fa:	c5 0b 58 c7          	vaddsd xmm8,xmm14,xmm7
    15fe:	e9 2d ff ff ff       	jmp    1530 <main+0x3d0>
    1603:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    160a:	00 00 00 00 
    160e:	66 90                	xchg   ax,ax
    1610:	c4 41 22 51 db       	vsqrtss xmm11,xmm11,xmm11
    1615:	c4 41 22 5a eb       	vcvtss2sd xmm13,xmm11,xmm11
    161a:	c4 41 2b 58 f5       	vaddsd xmm14,xmm10,xmm13
    161f:	e9 e5 fe ff ff       	jmp    1509 <main+0x3a9>
    1624:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    162b:	00 00 00 00 
    162f:	90                   	nop
    1630:	c4 41 3a 51 c0       	vsqrtss xmm8,xmm8,xmm8
    1635:	c4 c1 3a 5a e0       	vcvtss2sd xmm4,xmm8,xmm8
    163a:	c5 43 58 d4          	vaddsd xmm10,xmm7,xmm4
    163e:	e9 9e fe ff ff       	jmp    14e1 <main+0x381>
    1643:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    164a:	00 00 00 00 
    164e:	66 90                	xchg   ax,ax
    1650:	c4 41 0a 51 f6       	vsqrtss xmm14,xmm14,xmm14
    1655:	c4 c1 0a 5a f6       	vcvtss2sd xmm6,xmm14,xmm14
    165a:	c5 93 58 fe          	vaddsd xmm7,xmm13,xmm6
    165e:	e9 55 fe ff ff       	jmp    14b8 <main+0x358>
    1663:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    166a:	00 00 00 00 
    166e:	66 90                	xchg   ax,ax
    1670:	c4 41 2a 51 d2       	vsqrtss xmm10,xmm10,xmm10
    1675:	c4 41 2a 5a e2       	vcvtss2sd xmm12,xmm10,xmm10
    167a:	c4 41 5b 58 ec       	vaddsd xmm13,xmm4,xmm12
    167f:	e9 0c fe ff ff       	jmp    1490 <main+0x330>
    1684:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    168b:	00 00 00 00 
    168f:	90                   	nop
    1690:	c5 c2 51 ff          	vsqrtss xmm7,xmm7,xmm7
    1694:	c5 42 5a cf          	vcvtss2sd xmm9,xmm7,xmm7
    1698:	c4 c1 4b 58 e1       	vaddsd xmm4,xmm6,xmm9
    169d:	e9 c7 fd ff ff       	jmp    1469 <main+0x309>
    16a2:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    16a9:	00 00 00 00 
    16ad:	0f 1f 00             	nop    DWORD PTR [rax]
    16b0:	c4 41 12 51 ed       	vsqrtss xmm13,xmm13,xmm13
    16b5:	c4 c1 12 5a cd       	vcvtss2sd xmm1,xmm13,xmm13
    16ba:	c5 fb 58 f1          	vaddsd xmm6,xmm0,xmm1
    16be:	e9 7e fd ff ff       	jmp    1441 <main+0x2e1>
    16c3:	e8 28 fa ff ff       	call   10f0 <__stack_chk_fail@plt>
    16c8:	f3 0f 1e fa          	endbr64
    16cc:	48 89 c3             	mov    rbx,rax
    16cf:	e9 4c fa ff ff       	jmp    1120 <main.cold>
    16d4:	f3 0f 1e fa          	endbr64
    16d8:	48 89 c3             	mov    rbx,rax
    16db:	c5 f8 77             	vzeroupper
    16de:	e9 4a fa ff ff       	jmp    112d <main.cold+0xd>
    16e3:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    16ea:	00 00 00 
    16ed:	0f 1f 00             	nop    DWORD PTR [rax]

