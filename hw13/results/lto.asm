0000000000001120 <main>:
    1120:	f3 0f 1e fa          	endbr64
    1124:	41 56                	push   r14
    1126:	41 55                	push   r13
    1128:	41 54                	push   r12
    112a:	55                   	push   rbp
    112b:	53                   	push   rbx
    112c:	48 83 ec 50          	sub    rsp,0x50
    1130:	48 8d 5c 24 30       	lea    rbx,[rsp+0x30]
    1135:	48 8d 6c 24 10       	lea    rbp,[rsp+0x10]
    113a:	48 89 df             	mov    rdi,rbx
    113d:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    1144:	00 00 
    1146:	48 89 44 24 48       	mov    QWORD PTR [rsp+0x48],rax
    114b:	31 c0                	xor    eax,eax
    114d:	e8 0e 03 00 00       	call   1460 <std::vector<float, std::allocator<float> >::vector(unsigned long, std::allocator<float> const&) [clone .constprop.0]>
    1152:	48 89 ef             	mov    rdi,rbp
    1155:	e8 06 03 00 00       	call   1460 <std::vector<float, std::allocator<float> >::vector(unsigned long, std::allocator<float> const&) [clone .constprop.0]>
    115a:	c5 fa 10 0d a2 0e 00 	vmovss xmm1,DWORD PTR [rip+0xea2]        # 2004 <_IO_stdin_used+0x4>
    1161:	00 
    1162:	c5 fa 10 15 9e 0e 00 	vmovss xmm2,DWORD PTR [rip+0xe9e]        # 2008 <_IO_stdin_used+0x8>
    1169:	00 
    116a:	31 ff                	xor    edi,edi
    116c:	31 f6                	xor    esi,esi
    116e:	4c 8b 6c 24 30       	mov    r13,QWORD PTR [rsp+0x30]
    1173:	4c 8b 74 24 10       	mov    r14,QWORD PTR [rsp+0x10]
    1178:	31 c9                	xor    ecx,ecx
    117a:	49 b8 cf f7 53 e3 a5 	movabs r8,0x20c49ba5e353f7cf
    1181:	9b c4 20 
    1184:	41 b9 b1 79 37 9e    	mov    r9d,0x9e3779b1
    118a:	c5 d0 57 ed          	vxorps xmm5,xmm5,xmm5
    118e:	66 90                	xchg   ax,ax
    1190:	48 89 f2             	mov    rdx,rsi
    1193:	48 c1 ea 03          	shr    rdx,0x3
    1197:	48 89 d0             	mov    rax,rdx
    119a:	49 f7 e0             	mul    r8
    119d:	48 89 f0             	mov    rax,rsi
    11a0:	4c 01 ce             	add    rsi,r9
    11a3:	48 c1 ea 04          	shr    rdx,0x4
    11a7:	48 69 d2 e8 03 00 00 	imul   rdx,rdx,0x3e8
    11ae:	48 29 d0             	sub    rax,rdx
    11b1:	48 89 fa             	mov    rdx,rdi
    11b4:	c4 e1 d2 2a c0       	vcvtsi2ss xmm0,xmm5,rax
    11b9:	c5 fa 5e c1          	vdivss xmm0,xmm0,xmm1
    11bd:	48 c1 ea 03          	shr    rdx,0x3
    11c1:	48 89 d0             	mov    rax,rdx
    11c4:	49 f7 e0             	mul    r8
    11c7:	48 89 f8             	mov    rax,rdi
    11ca:	48 81 c7 37 9e 00 00 	add    rdi,0x9e37
    11d1:	48 c1 ea 04          	shr    rdx,0x4
    11d5:	48 69 d2 e8 03 00 00 	imul   rdx,rdx,0x3e8
    11dc:	c5 fa 5c c2          	vsubss xmm0,xmm0,xmm2
    11e0:	48 29 d0             	sub    rax,rdx
    11e3:	c4 c1 7a 11 44 8d 00 	vmovss DWORD PTR [r13+rcx*4+0x0],xmm0
    11ea:	c4 e1 d2 2a c0       	vcvtsi2ss xmm0,xmm5,rax
    11ef:	c5 fa 5e c1          	vdivss xmm0,xmm0,xmm1
    11f3:	c4 c1 7a 11 04 8e    	vmovss DWORD PTR [r14+rcx*4],xmm0
    11f9:	48 ff c1             	inc    rcx
    11fc:	48 81 f9 00 00 01 00 	cmp    rcx,0x10000
    1203:	75 8b                	jne    1190 <main+0x70>
    1205:	e8 f6 fe ff ff       	call   1100 <std::chrono::_V2::steady_clock::now()@plt>
    120a:	48 8b 74 24 38       	mov    rsi,QWORD PTR [rsp+0x38]
    120f:	c5 fa 10 25 f5 0d 00 	vmovss xmm4,DWORD PTR [rip+0xdf5]        # 200c <_IO_stdin_used+0xc>
    1216:	00 
    1217:	b9 b8 0b 00 00       	mov    ecx,0xbb8
    121c:	49 89 c4             	mov    r12,rax
    121f:	c5 e0 57 db          	vxorps xmm3,xmm3,xmm3
    1223:	c5 e9 57 d2          	vxorpd xmm2,xmm2,xmm2
    1227:	48 89 f2             	mov    rdx,rsi
    122a:	4c 29 ea             	sub    rdx,r13
    122d:	48 c1 fa 02          	sar    rdx,0x2
    1231:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    1238:	00 00 00 00 
    123c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1240:	31 c0                	xor    eax,eax
    1242:	49 39 f5             	cmp    r13,rsi
    1245:	75 19                	jne    1260 <main+0x140>
    1247:	eb 42                	jmp    128b <main+0x16b>
    1249:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1250:	48 ff c0             	inc    rax
    1253:	c5 fa 5a c0          	vcvtss2sd xmm0,xmm0,xmm0
    1257:	c5 eb 5c d0          	vsubsd xmm2,xmm2,xmm0
    125b:	48 39 d0             	cmp    rax,rdx
    125e:	73 2b                	jae    128b <main+0x16b>
    1260:	c4 c1 7a 10 44 85 00 	vmovss xmm0,DWORD PTR [r13+rax*4+0x0]
    1267:	c5 fa 59 cc          	vmulss xmm1,xmm0,xmm4
    126b:	c4 c2 71 99 04 86    	vfmadd132ss xmm0,xmm1,DWORD PTR [r14+rax*4]
    1271:	c5 f8 2f c3          	vcomiss xmm0,xmm3
    1275:	76 d9                	jbe    1250 <main+0x130>
    1277:	48 ff c0             	inc    rax
    127a:	c5 fa 51 c0          	vsqrtss xmm0,xmm0,xmm0
    127e:	c5 fa 5a c0          	vcvtss2sd xmm0,xmm0,xmm0
    1282:	c5 eb 58 d0          	vaddsd xmm2,xmm2,xmm0
    1286:	48 39 d0             	cmp    rax,rdx
    1289:	72 d5                	jb     1260 <main+0x140>
    128b:	ff c9                	dec    ecx
    128d:	75 b1                	jne    1240 <main+0x120>
    128f:	c5 fb 11 54 24 08    	vmovsd QWORD PTR [rsp+0x8],xmm2
    1295:	e8 66 fe ff ff       	call   1100 <std::chrono::_V2::steady_clock::now()@plt>
    129a:	c5 d0 57 ed          	vxorps xmm5,xmm5,xmm5
    129e:	48 8d 35 6b 0d 00 00 	lea    rsi,[rip+0xd6b]        # 2010 <_IO_stdin_used+0x10>
    12a5:	4c 29 e0             	sub    rax,r12
    12a8:	bf 02 00 00 00       	mov    edi,0x2
    12ad:	c5 fb 10 54 24 08    	vmovsd xmm2,QWORD PTR [rsp+0x8]
    12b3:	c5 eb 10 c2          	vmovsd xmm0,xmm2,xmm2
    12b7:	c4 e1 d3 2a c8       	vcvtsi2sd xmm1,xmm5,rax
    12bc:	b8 02 00 00 00       	mov    eax,0x2
    12c1:	c5 f3 5e 0d 67 0d 00 	vdivsd xmm1,xmm1,QWORD PTR [rip+0xd67]        # 2030 <_IO_stdin_used+0x30>
    12c8:	00 
    12c9:	e8 e2 fd ff ff       	call   10b0 <__printf_chk@plt>
    12ce:	48 89 ef             	mov    rdi,rbp
    12d1:	e8 6a 01 00 00       	call   1440 <std::vector<float, std::allocator<float> >::~vector()>
    12d6:	48 89 df             	mov    rdi,rbx
    12d9:	e8 62 01 00 00       	call   1440 <std::vector<float, std::allocator<float> >::~vector()>
    12de:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
    12e3:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    12ea:	00 00 
    12ec:	75 35                	jne    1323 <main+0x203>
    12ee:	48 83 c4 50          	add    rsp,0x50
    12f2:	31 c0                	xor    eax,eax
    12f4:	5b                   	pop    rbx
    12f5:	5d                   	pop    rbp
    12f6:	41 5c                	pop    r12
    12f8:	41 5d                	pop    r13
    12fa:	41 5e                	pop    r14
    12fc:	c3                   	ret
    12fd:	48 89 ef             	mov    rdi,rbp
    1300:	c5 f8 77             	vzeroupper
    1303:	e8 38 01 00 00       	call   1440 <std::vector<float, std::allocator<float> >::~vector()>
    1308:	48 89 df             	mov    rdi,rbx
    130b:	c5 f8 77             	vzeroupper
    130e:	e8 2d 01 00 00       	call   1440 <std::vector<float, std::allocator<float> >::~vector()>
    1313:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
    1318:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    131f:	00 00 
    1321:	74 17                	je     133a <main+0x21a>
    1323:	e8 c8 fd ff ff       	call   10f0 <__stack_chk_fail@plt>
    1328:	f3 0f 1e fa          	endbr64
    132c:	49 89 c4             	mov    r12,rax
    132f:	eb cc                	jmp    12fd <main+0x1dd>
    1331:	f3 0f 1e fa          	endbr64
    1335:	49 89 c4             	mov    r12,rax
    1338:	eb ce                	jmp    1308 <main+0x1e8>
    133a:	4c 89 e7             	mov    rdi,r12
    133d:	e8 ce fd ff ff       	call   1110 <_Unwind_Resume@plt>
    1342:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    1349:	00 00 00 
    134c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

