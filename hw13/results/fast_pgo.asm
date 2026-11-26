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
    121b:	c5 d8 57 e4          	vxorps xmm4,xmm4,xmm4
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
    1244:	c4 e1 da 2a c0       	vcvtsi2ss xmm0,xmm4,rax
    1249:	c4 e2 71 a9 05 b6 0d 	vfmadd213ss xmm0,xmm1,DWORD PTR [rip+0xdb6]        # 2008 <_IO_stdin_used+0x8>
    1250:	00 00 
    1252:	c5 fa 11 04 8b       	vmovss DWORD PTR [rbx+rcx*4],xmm0
    1257:	48 89 d0             	mov    rax,rdx
    125a:	49 f7 e0             	mul    r8
    125d:	48 89 f8             	mov    rax,rdi
    1260:	48 81 c7 37 9e 00 00 	add    rdi,0x9e37
    1267:	48 c1 ea 04          	shr    rdx,0x4
    126b:	48 69 d2 e8 03 00 00 	imul   rdx,rdx,0x3e8
    1272:	48 29 d0             	sub    rax,rdx
    1275:	c4 e1 da 2a c0       	vcvtsi2ss xmm0,xmm4,rax
    127a:	c5 fa 59 c1          	vmulss xmm0,xmm0,xmm1
    127e:	c5 fa 11 44 8d 00    	vmovss DWORD PTR [rbp+rcx*4+0x0],xmm0
    1284:	48 ff c1             	inc    rcx
    1287:	48 81 f9 00 00 01 00 	cmp    rcx,0x10000
    128e:	75 88                	jne    1218 <main+0xb8>
    1290:	e8 6b fe ff ff       	call   1100 <std::chrono::_V2::steady_clock::now()@plt>
    1295:	c5 fa 10 1d 6f 0d 00 	vmovss xmm3,DWORD PTR [rip+0xd6f]        # 200c <_IO_stdin_used+0xc>
    129c:	00 
    129d:	ba b8 0b 00 00       	mov    edx,0xbb8
    12a2:	c5 f0 57 c9          	vxorps xmm1,xmm1,xmm1
    12a6:	49 89 c4             	mov    r12,rax
    12a9:	c5 e9 57 d2          	vxorpd xmm2,xmm2,xmm2
    12ad:	31 c0                	xor    eax,eax
    12af:	90                   	nop
    12b0:	c5 e2 58 44 85 00    	vaddss xmm0,xmm3,DWORD PTR [rbp+rax*4+0x0]
    12b6:	c5 fa 59 04 83       	vmulss xmm0,xmm0,DWORD PTR [rbx+rax*4]
    12bb:	c5 f8 2f c1          	vcomiss xmm0,xmm1
    12bf:	0f 87 8b 00 00 00    	ja     1350 <main+0x1f0>
    12c5:	48 ff c0             	inc    rax
    12c8:	c5 fa 5a c0          	vcvtss2sd xmm0,xmm0,xmm0
    12cc:	c5 eb 5c d0          	vsubsd xmm2,xmm2,xmm0
    12d0:	48 3d 00 00 01 00    	cmp    rax,0x10000
    12d6:	75 d8                	jne    12b0 <main+0x150>
    12d8:	ff ca                	dec    edx
    12da:	75 d1                	jne    12ad <main+0x14d>
    12dc:	c5 fb 11 54 24 08    	vmovsd QWORD PTR [rsp+0x8],xmm2
    12e2:	e8 19 fe ff ff       	call   1100 <std::chrono::_V2::steady_clock::now()@plt>
    12e7:	c5 d1 57 ed          	vxorpd xmm5,xmm5,xmm5
    12eb:	48 8d 35 1e 0d 00 00 	lea    rsi,[rip+0xd1e]        # 2010 <_IO_stdin_used+0x10>
    12f2:	4c 29 e0             	sub    rax,r12
    12f5:	bf 02 00 00 00       	mov    edi,0x2
    12fa:	c5 fb 10 54 24 08    	vmovsd xmm2,QWORD PTR [rsp+0x8]
    1300:	c5 eb 10 c2          	vmovsd xmm0,xmm2,xmm2
    1304:	c4 e1 d3 2a c8       	vcvtsi2sd xmm1,xmm5,rax
    1309:	b8 02 00 00 00       	mov    eax,0x2
    130e:	c5 f3 59 0d 1a 0d 00 	vmulsd xmm1,xmm1,QWORD PTR [rip+0xd1a]        # 2030 <_IO_stdin_used+0x30>
    1315:	00 
    1316:	e8 95 fd ff ff       	call   10b0 <__printf_chk@plt>
    131b:	48 8d 7c 24 30       	lea    rdi,[rsp+0x30]
    1320:	e8 7b 01 00 00       	call   14a0 <std::vector<float, std::allocator<float> >::~vector()>
    1325:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
    132a:	e8 71 01 00 00       	call   14a0 <std::vector<float, std::allocator<float> >::~vector()>
    132f:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
    1334:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    133b:	00 00 
    133d:	75 31                	jne    1370 <main+0x210>
    133f:	48 83 c4 50          	add    rsp,0x50
    1343:	31 c0                	xor    eax,eax
    1345:	5b                   	pop    rbx
    1346:	5d                   	pop    rbp
    1347:	41 5c                	pop    r12
    1349:	c3                   	ret
    134a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1350:	48 ff c0             	inc    rax
    1353:	c5 fa 51 c0          	vsqrtss xmm0,xmm0,xmm0
    1357:	c5 fa 5a c0          	vcvtss2sd xmm0,xmm0,xmm0
    135b:	c5 eb 58 d0          	vaddsd xmm2,xmm2,xmm0
    135f:	48 3d 00 00 01 00    	cmp    rax,0x10000
    1365:	0f 85 45 ff ff ff    	jne    12b0 <main+0x150>
    136b:	e9 68 ff ff ff       	jmp    12d8 <main+0x178>
    1370:	e8 7b fd ff ff       	call   10f0 <__stack_chk_fail@plt>
    1375:	f3 0f 1e fa          	endbr64
    1379:	48 89 c3             	mov    rbx,rax
    137c:	e9 9f fd ff ff       	jmp    1120 <main.cold>
    1381:	f3 0f 1e fa          	endbr64
    1385:	48 89 c3             	mov    rbx,rax
    1388:	c5 f8 77             	vzeroupper
    138b:	e9 9d fd ff ff       	jmp    112d <main.cold+0xd>

