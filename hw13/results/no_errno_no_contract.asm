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
    1226:	c5 d0 57 ed          	vxorps xmm5,xmm5,xmm5
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
    1254:	c4 e1 d2 2a c0       	vcvtsi2ss xmm0,xmm5,rax
    1259:	c5 fa 5e c1          	vdivss xmm0,xmm0,xmm1
    125d:	48 c1 ea 03          	shr    rdx,0x3
    1261:	48 89 d0             	mov    rax,rdx
    1264:	49 f7 e0             	mul    r8
    1267:	48 89 f8             	mov    rax,rdi
    126a:	48 81 c7 37 9e 00 00 	add    rdi,0x9e37
    1271:	48 c1 ea 04          	shr    rdx,0x4
    1275:	48 69 d2 e8 03 00 00 	imul   rdx,rdx,0x3e8
    127c:	c5 fa 5c c2          	vsubss xmm0,xmm0,xmm2
    1280:	48 29 d0             	sub    rax,rdx
    1283:	c5 fa 11 04 8b       	vmovss DWORD PTR [rbx+rcx*4],xmm0
    1288:	c4 e1 d2 2a c0       	vcvtsi2ss xmm0,xmm5,rax
    128d:	c5 fa 5e c1          	vdivss xmm0,xmm0,xmm1
    1291:	c5 fa 11 44 8d 00    	vmovss DWORD PTR [rbp+rcx*4+0x0],xmm0
    1297:	48 ff c1             	inc    rcx
    129a:	48 81 f9 00 00 01 00 	cmp    rcx,0x10000
    12a1:	75 8d                	jne    1230 <main+0xd0>
    12a3:	e8 58 fe ff ff       	call   1100 <std::chrono::_V2::steady_clock::now()@plt>
    12a8:	c5 fa 10 25 5c 0d 00 	vmovss xmm4,DWORD PTR [rip+0xd5c]        # 200c <_IO_stdin_used+0xc>
    12af:	00 
    12b0:	ba b8 0b 00 00       	mov    edx,0xbb8
    12b5:	c5 e0 57 db          	vxorps xmm3,xmm3,xmm3
    12b9:	49 89 c4             	mov    r12,rax
    12bc:	c5 e9 57 d2          	vxorpd xmm2,xmm2,xmm2
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
    12e5:	74 2c                	je     1313 <main+0x1b3>
    12e7:	c5 fa 10 0c 83       	vmovss xmm1,DWORD PTR [rbx+rax*4]
    12ec:	c5 f2 59 44 85 00    	vmulss xmm0,xmm1,DWORD PTR [rbp+rax*4+0x0]
    12f2:	c5 f2 59 cc          	vmulss xmm1,xmm1,xmm4
    12f6:	c5 fa 58 c1          	vaddss xmm0,xmm0,xmm1
    12fa:	c5 f8 2f c3          	vcomiss xmm0,xmm3
    12fe:	77 d0                	ja     12d0 <main+0x170>
    1300:	48 ff c0             	inc    rax
    1303:	c5 fa 5a c0          	vcvtss2sd xmm0,xmm0,xmm0
    1307:	c5 eb 5c d0          	vsubsd xmm2,xmm2,xmm0
    130b:	48 3d 00 00 01 00    	cmp    rax,0x10000
    1311:	75 d4                	jne    12e7 <main+0x187>
    1313:	ff ca                	dec    edx
    1315:	75 a9                	jne    12c0 <main+0x160>
    1317:	c5 fb 11 54 24 08    	vmovsd QWORD PTR [rsp+0x8],xmm2
    131d:	e8 de fd ff ff       	call   1100 <std::chrono::_V2::steady_clock::now()@plt>
    1322:	c5 d0 57 ed          	vxorps xmm5,xmm5,xmm5
    1326:	48 8d 35 e3 0c 00 00 	lea    rsi,[rip+0xce3]        # 2010 <_IO_stdin_used+0x10>
    132d:	4c 29 e0             	sub    rax,r12
    1330:	bf 02 00 00 00       	mov    edi,0x2
    1335:	c5 fb 10 54 24 08    	vmovsd xmm2,QWORD PTR [rsp+0x8]
    133b:	c5 eb 10 c2          	vmovsd xmm0,xmm2,xmm2
    133f:	c4 e1 d3 2a c8       	vcvtsi2sd xmm1,xmm5,rax
    1344:	b8 02 00 00 00       	mov    eax,0x2
    1349:	c5 f3 5e 0d df 0c 00 	vdivsd xmm1,xmm1,QWORD PTR [rip+0xcdf]        # 2030 <_IO_stdin_used+0x30>
    1350:	00 
    1351:	e8 5a fd ff ff       	call   10b0 <__printf_chk@plt>
    1356:	48 8d 7c 24 30       	lea    rdi,[rsp+0x30]
    135b:	e8 40 01 00 00       	call   14a0 <std::vector<float, std::allocator<float> >::~vector()>
    1360:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
    1365:	e8 36 01 00 00       	call   14a0 <std::vector<float, std::allocator<float> >::~vector()>
    136a:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
    136f:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    1376:	00 00 
    1378:	75 0b                	jne    1385 <main+0x225>
    137a:	48 83 c4 50          	add    rsp,0x50
    137e:	31 c0                	xor    eax,eax
    1380:	5b                   	pop    rbx
    1381:	5d                   	pop    rbp
    1382:	41 5c                	pop    r12
    1384:	c3                   	ret
    1385:	e8 66 fd ff ff       	call   10f0 <__stack_chk_fail@plt>
    138a:	f3 0f 1e fa          	endbr64
    138e:	48 89 c3             	mov    rbx,rax
    1391:	e9 8a fd ff ff       	jmp    1120 <main.cold>
    1396:	f3 0f 1e fa          	endbr64
    139a:	48 89 c3             	mov    rbx,rax
    139d:	c5 f8 77             	vzeroupper
    13a0:	e9 88 fd ff ff       	jmp    112d <main.cold+0xd>
    13a5:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    13ac:	00 00 00 
    13af:	90                   	nop

