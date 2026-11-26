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
    11f5:	c5 fa 10 0d 07 0e 00 	vmovss xmm1,DWORD PTR [rip+0xe07]        # 2004 <_IO_stdin_used+0x4>
    11fc:	00 
    11fd:	31 ff                	xor    edi,edi
    11ff:	31 f6                	xor    esi,esi
    1201:	31 c9                	xor    ecx,ecx
    1203:	49 b8 cf f7 53 e3 a5 	movabs r8,0x20c49ba5e353f7cf
    120a:	9b c4 20 
    120d:	41 b9 b1 79 37 9e    	mov    r9d,0x9e3779b1
    1213:	4c 89 64 24 38       	mov    QWORD PTR [rsp+0x38],r12
    1218:	48 89 f2             	mov    rdx,rsi
    121b:	c5 d0 57 ed          	vxorps xmm5,xmm5,xmm5
    121f:	48 c1 ea 03          	shr    rdx,0x3
    1223:	48 89 d0             	mov    rax,rdx
    1226:	49 f7 e0             	mul    r8
    1229:	48 89 f0             	mov    rax,rsi
    122c:	4c 01 ce             	add    rsi,r9
    122f:	48 c1 ea 04          	shr    rdx,0x4
    1233:	48 69 d2 e8 03 00 00 	imul   rdx,rdx,0x3e8
    123a:	48 29 d0             	sub    rax,rdx
    123d:	48 89 fa             	mov    rdx,rdi
    1240:	48 c1 ea 03          	shr    rdx,0x3
    1244:	c4 e1 d2 2a c0       	vcvtsi2ss xmm0,xmm5,rax
    1249:	c5 fa 5e c1          	vdivss xmm0,xmm0,xmm1
    124d:	48 89 d0             	mov    rax,rdx
    1250:	49 f7 e0             	mul    r8
    1253:	48 89 f8             	mov    rax,rdi
    1256:	48 81 c7 37 9e 00 00 	add    rdi,0x9e37
    125d:	c5 fa 5c 05 a3 0d 00 	vsubss xmm0,xmm0,DWORD PTR [rip+0xda3]        # 2008 <_IO_stdin_used+0x8>
    1264:	00 
    1265:	48 c1 ea 04          	shr    rdx,0x4
    1269:	48 69 d2 e8 03 00 00 	imul   rdx,rdx,0x3e8
    1270:	48 29 d0             	sub    rax,rdx
    1273:	c5 fa 11 04 8b       	vmovss DWORD PTR [rbx+rcx*4],xmm0
    1278:	c4 e1 d2 2a c0       	vcvtsi2ss xmm0,xmm5,rax
    127d:	c5 fa 5e c1          	vdivss xmm0,xmm0,xmm1
    1281:	c5 fa 11 44 8d 00    	vmovss DWORD PTR [rbp+rcx*4+0x0],xmm0
    1287:	48 ff c1             	inc    rcx
    128a:	48 81 f9 00 00 01 00 	cmp    rcx,0x10000
    1291:	75 85                	jne    1218 <main+0xb8>
    1293:	e8 68 fe ff ff       	call   1100 <std::chrono::_V2::steady_clock::now()@plt>
    1298:	c5 fa 10 25 6c 0d 00 	vmovss xmm4,DWORD PTR [rip+0xd6c]        # 200c <_IO_stdin_used+0xc>
    129f:	00 
    12a0:	ba b8 0b 00 00       	mov    edx,0xbb8
    12a5:	c5 e0 57 db          	vxorps xmm3,xmm3,xmm3
    12a9:	49 89 c4             	mov    r12,rax
    12ac:	c5 e9 57 d2          	vxorpd xmm2,xmm2,xmm2
    12b0:	31 c0                	xor    eax,eax
    12b2:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    12b9:	00 00 00 00 
    12bd:	0f 1f 00             	nop    DWORD PTR [rax]
    12c0:	c5 fa 10 0c 83       	vmovss xmm1,DWORD PTR [rbx+rax*4]
    12c5:	c5 f2 59 44 85 00    	vmulss xmm0,xmm1,DWORD PTR [rbp+rax*4+0x0]
    12cb:	c5 f2 59 cc          	vmulss xmm1,xmm1,xmm4
    12cf:	c5 fa 58 c1          	vaddss xmm0,xmm0,xmm1
    12d3:	c5 f8 2f c3          	vcomiss xmm0,xmm3
    12d7:	0f 86 93 00 00 00    	jbe    1370 <main+0x210>
    12dd:	48 ff c0             	inc    rax
    12e0:	c5 fa 51 c0          	vsqrtss xmm0,xmm0,xmm0
    12e4:	c5 fa 5a c0          	vcvtss2sd xmm0,xmm0,xmm0
    12e8:	c5 eb 58 d0          	vaddsd xmm2,xmm2,xmm0
    12ec:	48 3d 00 00 01 00    	cmp    rax,0x10000
    12f2:	75 cc                	jne    12c0 <main+0x160>
    12f4:	ff ca                	dec    edx
    12f6:	75 b8                	jne    12b0 <main+0x150>
    12f8:	c5 fb 11 54 24 08    	vmovsd QWORD PTR [rsp+0x8],xmm2
    12fe:	e8 fd fd ff ff       	call   1100 <std::chrono::_V2::steady_clock::now()@plt>
    1303:	c5 c9 57 f6          	vxorpd xmm6,xmm6,xmm6
    1307:	48 8d 35 02 0d 00 00 	lea    rsi,[rip+0xd02]        # 2010 <_IO_stdin_used+0x10>
    130e:	4c 29 e0             	sub    rax,r12
    1311:	bf 02 00 00 00       	mov    edi,0x2
    1316:	c5 fb 10 54 24 08    	vmovsd xmm2,QWORD PTR [rsp+0x8]
    131c:	c5 eb 10 c2          	vmovsd xmm0,xmm2,xmm2
    1320:	c4 e1 cb 2a c8       	vcvtsi2sd xmm1,xmm6,rax
    1325:	b8 02 00 00 00       	mov    eax,0x2
    132a:	c5 f3 5e 0d fe 0c 00 	vdivsd xmm1,xmm1,QWORD PTR [rip+0xcfe]        # 2030 <_IO_stdin_used+0x30>
    1331:	00 
    1332:	e8 79 fd ff ff       	call   10b0 <__printf_chk@plt>
    1337:	48 8d 7c 24 30       	lea    rdi,[rsp+0x30]
    133c:	e8 5f 01 00 00       	call   14a0 <std::vector<float, std::allocator<float> >::~vector()>
    1341:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
    1346:	e8 55 01 00 00       	call   14a0 <std::vector<float, std::allocator<float> >::~vector()>
    134b:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
    1350:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    1357:	00 00 
    1359:	75 31                	jne    138c <main+0x22c>
    135b:	48 83 c4 50          	add    rsp,0x50
    135f:	31 c0                	xor    eax,eax
    1361:	5b                   	pop    rbx
    1362:	5d                   	pop    rbp
    1363:	41 5c                	pop    r12
    1365:	c3                   	ret
    1366:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    136d:	00 00 00 
    1370:	48 ff c0             	inc    rax
    1373:	c5 fa 5a c0          	vcvtss2sd xmm0,xmm0,xmm0
    1377:	c5 eb 5c d0          	vsubsd xmm2,xmm2,xmm0
    137b:	48 3d 00 00 01 00    	cmp    rax,0x10000
    1381:	0f 85 39 ff ff ff    	jne    12c0 <main+0x160>
    1387:	e9 68 ff ff ff       	jmp    12f4 <main+0x194>
    138c:	e8 5f fd ff ff       	call   10f0 <__stack_chk_fail@plt>
    1391:	f3 0f 1e fa          	endbr64
    1395:	48 89 c3             	mov    rbx,rax
    1398:	e9 83 fd ff ff       	jmp    1120 <main.cold>
    139d:	f3 0f 1e fa          	endbr64
    13a1:	48 89 c3             	mov    rbx,rax
    13a4:	c5 f8 77             	vzeroupper
    13a7:	e9 81 fd ff ff       	jmp    112d <main.cold+0xd>
    13ac:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

