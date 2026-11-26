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
    11f9:	31 f6                	xor    esi,esi
    11fb:	f3 0f 10 0d 01 0e 00 	movss  xmm1,DWORD PTR [rip+0xe01]        # 2004 <_IO_stdin_used+0x4>
    1202:	00 
    1203:	31 c9                	xor    ecx,ecx
    1205:	f3 0f 10 15 fb 0d 00 	movss  xmm2,DWORD PTR [rip+0xdfb]        # 2008 <_IO_stdin_used+0x8>
    120c:	00 
    120d:	49 b8 cf f7 53 e3 a5 	movabs r8,0x20c49ba5e353f7cf
    1214:	9b c4 20 
    1217:	41 b9 b1 79 37 9e    	mov    r9d,0x9e3779b1
    121d:	0f 1f 00             	nop    DWORD PTR [rax]
    1220:	48 89 f2             	mov    rdx,rsi
    1223:	66 0f ef c0          	pxor   xmm0,xmm0
    1227:	48 c1 ea 03          	shr    rdx,0x3
    122b:	48 89 d0             	mov    rax,rdx
    122e:	49 f7 e0             	mul    r8
    1231:	48 89 f0             	mov    rax,rsi
    1234:	4c 01 ce             	add    rsi,r9
    1237:	48 c1 ea 04          	shr    rdx,0x4
    123b:	48 69 d2 e8 03 00 00 	imul   rdx,rdx,0x3e8
    1242:	48 29 d0             	sub    rax,rdx
    1245:	48 89 fa             	mov    rdx,rdi
    1248:	f3 48 0f 2a c0       	cvtsi2ss xmm0,rax
    124d:	48 c1 ea 03          	shr    rdx,0x3
    1251:	48 89 d0             	mov    rax,rdx
    1254:	49 f7 e0             	mul    r8
    1257:	48 89 f8             	mov    rax,rdi
    125a:	48 81 c7 37 9e 00 00 	add    rdi,0x9e37
    1261:	f3 0f 5e c1          	divss  xmm0,xmm1
    1265:	48 c1 ea 04          	shr    rdx,0x4
    1269:	48 69 d2 e8 03 00 00 	imul   rdx,rdx,0x3e8
    1270:	48 29 d0             	sub    rax,rdx
    1273:	f3 0f 5c c2          	subss  xmm0,xmm2
    1277:	f3 0f 11 04 8b       	movss  DWORD PTR [rbx+rcx*4],xmm0
    127c:	66 0f ef c0          	pxor   xmm0,xmm0
    1280:	f3 48 0f 2a c0       	cvtsi2ss xmm0,rax
    1285:	f3 0f 5e c1          	divss  xmm0,xmm1
    1289:	f3 0f 11 44 8d 00    	movss  DWORD PTR [rbp+rcx*4+0x0],xmm0
    128f:	48 83 c1 01          	add    rcx,0x1
    1293:	48 81 f9 00 00 01 00 	cmp    rcx,0x10000
    129a:	75 84                	jne    1220 <main+0xc0>
    129c:	e8 5f fe ff ff       	call   1100 <std::chrono::_V2::steady_clock::now()@plt>
    12a1:	ba b8 0b 00 00       	mov    edx,0xbb8
    12a6:	66 0f ef d2          	pxor   xmm2,xmm2
    12aa:	f3 0f 10 25 5a 0d 00 	movss  xmm4,DWORD PTR [rip+0xd5a]        # 200c <_IO_stdin_used+0xc>
    12b1:	00 
    12b2:	49 89 c4             	mov    r12,rax
    12b5:	66 0f ef db          	pxor   xmm3,xmm3
    12b9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    12c0:	31 c0                	xor    eax,eax
    12c2:	eb 18                	jmp    12dc <main+0x17c>
    12c4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    12c8:	48 83 c0 01          	add    rax,0x1
    12cc:	f3 0f 5a c0          	cvtss2sd xmm0,xmm0
    12d0:	f2 0f 5c d0          	subsd  xmm2,xmm0
    12d4:	48 3d 00 00 01 00    	cmp    rax,0x10000
    12da:	74 34                	je     1310 <main+0x1b0>
    12dc:	f3 0f 10 0c 83       	movss  xmm1,DWORD PTR [rbx+rax*4]
    12e1:	f3 0f 10 44 85 00    	movss  xmm0,DWORD PTR [rbp+rax*4+0x0]
    12e7:	f3 0f 59 c1          	mulss  xmm0,xmm1
    12eb:	f3 0f 59 cc          	mulss  xmm1,xmm4
    12ef:	f3 0f 58 c1          	addss  xmm0,xmm1
    12f3:	0f 2f c3             	comiss xmm0,xmm3
    12f6:	76 d0                	jbe    12c8 <main+0x168>
    12f8:	f3 0f 51 c0          	sqrtss xmm0,xmm0
    12fc:	48 83 c0 01          	add    rax,0x1
    1300:	f3 0f 5a c0          	cvtss2sd xmm0,xmm0
    1304:	f2 0f 58 d0          	addsd  xmm2,xmm0
    1308:	48 3d 00 00 01 00    	cmp    rax,0x10000
    130e:	75 cc                	jne    12dc <main+0x17c>
    1310:	83 ea 01             	sub    edx,0x1
    1313:	75 ab                	jne    12c0 <main+0x160>
    1315:	f2 0f 11 54 24 08    	movsd  QWORD PTR [rsp+0x8],xmm2
    131b:	e8 e0 fd ff ff       	call   1100 <std::chrono::_V2::steady_clock::now()@plt>
    1320:	f2 0f 10 54 24 08    	movsd  xmm2,QWORD PTR [rsp+0x8]
    1326:	66 0f ef c9          	pxor   xmm1,xmm1
    132a:	48 8d 35 df 0c 00 00 	lea    rsi,[rip+0xcdf]        # 2010 <_IO_stdin_used+0x10>
    1331:	4c 29 e0             	sub    rax,r12
    1334:	bf 02 00 00 00       	mov    edi,0x2
    1339:	f2 48 0f 2a c8       	cvtsi2sd xmm1,rax
    133e:	66 0f 28 c2          	movapd xmm0,xmm2
    1342:	b8 02 00 00 00       	mov    eax,0x2
    1347:	f2 0f 5e 0d e1 0c 00 	divsd  xmm1,QWORD PTR [rip+0xce1]        # 2030 <_IO_stdin_used+0x30>
    134e:	00 
    134f:	e8 5c fd ff ff       	call   10b0 <__printf_chk@plt>
    1354:	48 8d 7c 24 30       	lea    rdi,[rsp+0x30]
    1359:	e8 32 01 00 00       	call   1490 <std::vector<float, std::allocator<float> >::~vector()>
    135e:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
    1363:	e8 28 01 00 00       	call   1490 <std::vector<float, std::allocator<float> >::~vector()>
    1368:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
    136d:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    1374:	00 00 
    1376:	75 0b                	jne    1383 <main+0x223>
    1378:	48 83 c4 50          	add    rsp,0x50
    137c:	31 c0                	xor    eax,eax
    137e:	5b                   	pop    rbx
    137f:	5d                   	pop    rbp
    1380:	41 5c                	pop    r12
    1382:	c3                   	ret
    1383:	e8 68 fd ff ff       	call   10f0 <__stack_chk_fail@plt>
    1388:	f3 0f 1e fa          	endbr64
    138c:	48 89 c3             	mov    rbx,rax
    138f:	e9 8c fd ff ff       	jmp    1120 <main.cold>
    1394:	f3 0f 1e fa          	endbr64
    1398:	48 89 c3             	mov    rbx,rax
    139b:	e9 8a fd ff ff       	jmp    112a <main.cold+0xa>

