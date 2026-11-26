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
    11b0:	31 c0                	xor    eax,eax
    11b2:	bf 00 00 04 00       	mov    edi,0x40000
    11b7:	48 89 6c 24 18       	mov    QWORD PTR [rsp+0x18],rbp
    11bc:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
    11c1:	48 89 44 24 40       	mov    QWORD PTR [rsp+0x40],rax
    11c6:	e8 05 ff ff ff       	call   10d0 <operator new(unsigned long)@plt>
    11cb:	4c 8d a0 00 00 04 00 	lea    r12,[rax+0x40000]
    11d2:	48 8d 78 04          	lea    rdi,[rax+0x4]
    11d6:	31 f6                	xor    esi,esi
    11d8:	ba fc ff 03 00       	mov    edx,0x3fffc
    11dd:	48 89 c5             	mov    rbp,rax
    11e0:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
    11e5:	4c 89 64 24 40       	mov    QWORD PTR [rsp+0x40],r12
    11ea:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    11f0:	e8 cb fe ff ff       	call   10c0 <memset@plt>
    11f5:	c5 fa 10 05 07 0e 00 	vmovss xmm0,DWORD PTR [rip+0xe07]        # 2004 <_IO_stdin_used+0x4>
    11fc:	00 
    11fd:	c5 fa 10 15 03 0e 00 	vmovss xmm2,DWORD PTR [rip+0xe03]        # 2008 <_IO_stdin_used+0x8>
    1204:	00 
    1205:	31 ff                	xor    edi,edi
    1207:	45 31 c0             	xor    r8d,r8d
    120a:	31 f6                	xor    esi,esi
    120c:	48 b9 cf f7 53 e3 a5 	movabs rcx,0x20c49ba5e353f7cf
    1213:	9b c4 20 
    1216:	41 bb b1 79 37 9e    	mov    r11d,0x9e3779b1
    121c:	4c 89 64 24 38       	mov    QWORD PTR [rsp+0x38],r12
    1221:	c5 d0 57 ed          	vxorps xmm5,xmm5,xmm5
    1225:	4c 89 c0             	mov    rax,r8
    1228:	4d 89 c2             	mov    r10,r8
    122b:	4d 01 d8             	add    r8,r11
    122e:	48 c1 e8 03          	shr    rax,0x3
    1232:	48 f7 e1             	mul    rcx
    1235:	48 89 f8             	mov    rax,rdi
    1238:	48 c1 e8 03          	shr    rax,0x3
    123c:	48 c1 ea 04          	shr    rdx,0x4
    1240:	4c 69 ca e8 03 00 00 	imul   r9,rdx,0x3e8
    1247:	48 f7 e1             	mul    rcx
    124a:	4c 89 c0             	mov    rax,r8
    124d:	48 c1 e8 03          	shr    rax,0x3
    1251:	48 c1 ea 04          	shr    rdx,0x4
    1255:	4c 69 e2 e8 03 00 00 	imul   r12,rdx,0x3e8
    125c:	4d 29 ca             	sub    r10,r9
    125f:	49 89 f9             	mov    r9,rdi
    1262:	48 f7 e1             	mul    rcx
    1265:	4c 89 c0             	mov    rax,r8
    1268:	c4 c1 d2 2a ca       	vcvtsi2ss xmm1,xmm5,r10
    126d:	c5 f2 5e d8          	vdivss xmm3,xmm1,xmm0
    1271:	4c 8d 56 01          	lea    r10,[rsi+0x1]
    1275:	4d 29 e1             	sub    r9,r12
    1278:	4c 8d a7 37 9e 00 00 	lea    r12,[rdi+0x9e37]
    127f:	48 c1 ea 04          	shr    rdx,0x4
    1283:	c4 c1 d2 2a f1       	vcvtsi2ss xmm6,xmm5,r9
    1288:	c5 ca 5e f8          	vdivss xmm7,xmm6,xmm0
    128c:	4c 69 ca e8 03 00 00 	imul   r9,rdx,0x3e8
    1293:	4c 29 c8             	sub    rax,r9
    1296:	c4 61 d2 2a c0       	vcvtsi2ss xmm8,xmm5,rax
    129b:	4c 89 e0             	mov    rax,r12
    129e:	c5 3a 5e c8          	vdivss xmm9,xmm8,xmm0
    12a2:	48 c1 e8 03          	shr    rax,0x3
    12a6:	c5 e2 5c e2          	vsubss xmm4,xmm3,xmm2
    12aa:	48 f7 e1             	mul    rcx
    12ad:	c5 fa 11 24 b3       	vmovss DWORD PTR [rbx+rsi*4],xmm4
    12b2:	48 c1 ea 04          	shr    rdx,0x4
    12b6:	c5 fa 11 7c b5 00    	vmovss DWORD PTR [rbp+rsi*4+0x0],xmm7
    12bc:	4c 69 ca e8 03 00 00 	imul   r9,rdx,0x3e8
    12c3:	c5 32 5c d2          	vsubss xmm10,xmm9,xmm2
    12c7:	4d 29 cc             	sub    r12,r9
    12ca:	4c 8d 8f 6e 3c 01 00 	lea    r9,[rdi+0x13c6e]
    12d1:	c4 41 d2 2a dc       	vcvtsi2ss xmm11,xmm5,r12
    12d6:	c5 22 5e e0          	vdivss xmm12,xmm11,xmm0
    12da:	4c 8d 66 02          	lea    r12,[rsi+0x2]
    12de:	c4 21 7a 11 14 93    	vmovss DWORD PTR [rbx+r10*4],xmm10
    12e4:	c4 21 7a 11 64 95 00 	vmovss DWORD PTR [rbp+r10*4+0x0],xmm12
    12eb:	41 ba b1 79 37 9e    	mov    r10d,0x9e3779b1
    12f1:	4d 01 c2             	add    r10,r8
    12f4:	4c 89 d0             	mov    rax,r10
    12f7:	48 c1 e8 03          	shr    rax,0x3
    12fb:	48 f7 e1             	mul    rcx
    12fe:	48 c1 ea 04          	shr    rdx,0x4
    1302:	48 69 c2 e8 03 00 00 	imul   rax,rdx,0x3e8
    1309:	49 29 c2             	sub    r10,rax
    130c:	4c 89 c8             	mov    rax,r9
    130f:	48 c1 e8 03          	shr    rax,0x3
    1313:	c4 41 d2 2a ea       	vcvtsi2ss xmm13,xmm5,r10
    1318:	c5 12 5e f0          	vdivss xmm14,xmm13,xmm0
    131c:	48 f7 e1             	mul    rcx
    131f:	48 c1 ea 04          	shr    rdx,0x4
    1323:	4c 69 d2 e8 03 00 00 	imul   r10,rdx,0x3e8
    132a:	4d 29 d1             	sub    r9,r10
    132d:	49 ba 62 f3 6e 3c 01 	movabs r10,0x13c6ef362
    1334:	00 00 00 
    1337:	4d 01 c2             	add    r10,r8
    133a:	c4 c1 d2 2a c9       	vcvtsi2ss xmm1,xmm5,r9
    133f:	4c 8d 8f a5 da 01 00 	lea    r9,[rdi+0x1daa5]
    1346:	c5 f2 5e d8          	vdivss xmm3,xmm1,xmm0
    134a:	4c 89 d0             	mov    rax,r10
    134d:	c5 0a 5c fa          	vsubss xmm15,xmm14,xmm2
    1351:	48 81 c7 dc 78 02 00 	add    rdi,0x278dc
    1358:	48 c1 e8 03          	shr    rax,0x3
    135c:	48 f7 e1             	mul    rcx
    135f:	c4 21 7a 11 3c a3    	vmovss DWORD PTR [rbx+r12*4],xmm15
    1365:	48 c1 ea 04          	shr    rdx,0x4
    1369:	48 69 c2 e8 03 00 00 	imul   rax,rdx,0x3e8
    1370:	c4 a1 7a 11 5c a5 00 	vmovss DWORD PTR [rbp+r12*4+0x0],xmm3
    1377:	4c 8d 66 03          	lea    r12,[rsi+0x3]
    137b:	48 83 c6 04          	add    rsi,0x4
    137f:	49 29 c2             	sub    r10,rax
    1382:	4c 89 c8             	mov    rax,r9
    1385:	48 c1 e8 03          	shr    rax,0x3
    1389:	c4 c1 d2 2a e2       	vcvtsi2ss xmm4,xmm5,r10
    138e:	c5 da 5e f0          	vdivss xmm6,xmm4,xmm0
    1392:	48 f7 e1             	mul    rcx
    1395:	48 c1 ea 04          	shr    rdx,0x4
    1399:	4c 69 d2 e8 03 00 00 	imul   r10,rdx,0x3e8
    13a0:	4d 29 d1             	sub    r9,r10
    13a3:	c4 41 d2 2a c1       	vcvtsi2ss xmm8,xmm5,r9
    13a8:	c5 3a 5e c8          	vdivss xmm9,xmm8,xmm0
    13ac:	c5 ca 5c fa          	vsubss xmm7,xmm6,xmm2
    13b0:	c4 a1 7a 11 3c a3    	vmovss DWORD PTR [rbx+r12*4],xmm7
    13b6:	c4 21 7a 11 4c a5 00 	vmovss DWORD PTR [rbp+r12*4+0x0],xmm9
    13bd:	49 bc 13 6d a6 da 01 	movabs r12,0x1daa66d13
    13c4:	00 00 00 
    13c7:	4d 01 e0             	add    r8,r12
    13ca:	48 81 fe 00 00 01 00 	cmp    rsi,0x10000
    13d1:	0f 85 4e fe ff ff    	jne    1225 <main+0xc5>
    13d7:	e8 24 fd ff ff       	call   1100 <std::chrono::_V2::steady_clock::now()@plt>
    13dc:	c5 7a 10 15 28 0c 00 	vmovss xmm10,DWORD PTR [rip+0xc28]        # 200c <_IO_stdin_used+0xc>
    13e3:	00 
    13e4:	41 b8 b8 0b 00 00    	mov    r8d,0xbb8
    13ea:	c5 d0 57 ed          	vxorps xmm5,xmm5,xmm5
    13ee:	49 89 c4             	mov    r12,rax
    13f1:	c5 e9 57 d2          	vxorpd xmm2,xmm2,xmm2
    13f5:	31 ff                	xor    edi,edi
    13f7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    13fe:	00 00 
    1400:	c5 7a 10 1c bb       	vmovss xmm11,DWORD PTR [rbx+rdi*4]
    1405:	c5 a2 59 44 bd 00    	vmulss xmm0,xmm11,DWORD PTR [rbp+rdi*4+0x0]
    140b:	c4 41 22 59 e2       	vmulss xmm12,xmm11,xmm10
    1410:	c4 41 7a 58 ec       	vaddss xmm13,xmm0,xmm12
    1415:	c5 78 2f ed          	vcomiss xmm13,xmm5
    1419:	0f 86 91 00 00 00    	jbe    14b0 <main+0x350>
    141f:	48 ff c7             	inc    rdi
    1422:	c4 41 12 51 ed       	vsqrtss xmm13,xmm13,xmm13
    1427:	c4 41 12 5a fd       	vcvtss2sd xmm15,xmm13,xmm13
    142c:	c4 c1 6b 58 d7       	vaddsd xmm2,xmm2,xmm15
    1431:	48 81 ff 00 00 01 00 	cmp    rdi,0x10000
    1438:	75 c6                	jne    1400 <main+0x2a0>
    143a:	41 ff c8             	dec    r8d
    143d:	75 b6                	jne    13f5 <main+0x295>
    143f:	c5 fb 11 54 24 08    	vmovsd QWORD PTR [rsp+0x8],xmm2
    1445:	e8 b6 fc ff ff       	call   1100 <std::chrono::_V2::steady_clock::now()@plt>
    144a:	c5 f0 57 c9          	vxorps xmm1,xmm1,xmm1
    144e:	48 8d 35 bb 0b 00 00 	lea    rsi,[rip+0xbbb]        # 2010 <_IO_stdin_used+0x10>
    1455:	4c 29 e0             	sub    rax,r12
    1458:	bf 02 00 00 00       	mov    edi,0x2
    145d:	c5 fb 10 44 24 08    	vmovsd xmm0,QWORD PTR [rsp+0x8]
    1463:	c4 e1 f3 2a d8       	vcvtsi2sd xmm3,xmm1,rax
    1468:	b8 02 00 00 00       	mov    eax,0x2
    146d:	c5 e3 5e 0d bb 0b 00 	vdivsd xmm1,xmm3,QWORD PTR [rip+0xbbb]        # 2030 <_IO_stdin_used+0x30>
    1474:	00 
    1475:	e8 36 fc ff ff       	call   10b0 <__printf_chk@plt>
    147a:	48 8d 7c 24 30       	lea    rdi,[rsp+0x30]
    147f:	e8 5c 01 00 00       	call   15e0 <std::vector<float, std::allocator<float> >::~vector()>
    1484:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
    1489:	e8 52 01 00 00       	call   15e0 <std::vector<float, std::allocator<float> >::~vector()>
    148e:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
    1493:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    149a:	00 00 
    149c:	75 31                	jne    14cf <main+0x36f>
    149e:	48 83 c4 50          	add    rsp,0x50
    14a2:	31 c0                	xor    eax,eax
    14a4:	5b                   	pop    rbx
    14a5:	5d                   	pop    rbp
    14a6:	41 5c                	pop    r12
    14a8:	c3                   	ret
    14a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    14b0:	48 ff c7             	inc    rdi
    14b3:	c4 41 12 5a f5       	vcvtss2sd xmm14,xmm13,xmm13
    14b8:	c4 c1 6b 5c d6       	vsubsd xmm2,xmm2,xmm14
    14bd:	48 81 ff 00 00 01 00 	cmp    rdi,0x10000
    14c4:	0f 85 36 ff ff ff    	jne    1400 <main+0x2a0>
    14ca:	e9 6b ff ff ff       	jmp    143a <main+0x2da>
    14cf:	e8 1c fc ff ff       	call   10f0 <__stack_chk_fail@plt>
    14d4:	f3 0f 1e fa          	endbr64
    14d8:	48 89 c3             	mov    rbx,rax
    14db:	e9 40 fc ff ff       	jmp    1120 <main.cold>
    14e0:	f3 0f 1e fa          	endbr64
    14e4:	48 89 c3             	mov    rbx,rax
    14e7:	c5 f8 77             	vzeroupper
    14ea:	e9 3e fc ff ff       	jmp    112d <main.cold+0xd>
    14ef:	90                   	nop

