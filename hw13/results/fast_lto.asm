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
    118a:	c5 d8 57 e4          	vxorps xmm4,xmm4,xmm4
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
    11b4:	48 c1 ea 03          	shr    rdx,0x3
    11b8:	c4 e1 da 2a c0       	vcvtsi2ss xmm0,xmm4,rax
    11bd:	c4 e2 69 99 c1       	vfmadd132ss xmm0,xmm2,xmm1
    11c2:	48 89 d0             	mov    rax,rdx
    11c5:	49 f7 e0             	mul    r8
    11c8:	48 89 f8             	mov    rax,rdi
    11cb:	48 81 c7 37 9e 00 00 	add    rdi,0x9e37
    11d2:	c4 c1 7a 11 44 8d 00 	vmovss DWORD PTR [r13+rcx*4+0x0],xmm0
    11d9:	48 c1 ea 04          	shr    rdx,0x4
    11dd:	48 69 d2 e8 03 00 00 	imul   rdx,rdx,0x3e8
    11e4:	48 29 d0             	sub    rax,rdx
    11e7:	c4 e1 da 2a c0       	vcvtsi2ss xmm0,xmm4,rax
    11ec:	c5 fa 59 c1          	vmulss xmm0,xmm0,xmm1
    11f0:	c4 c1 7a 11 04 8e    	vmovss DWORD PTR [r14+rcx*4],xmm0
    11f6:	48 ff c1             	inc    rcx
    11f9:	48 81 f9 00 00 01 00 	cmp    rcx,0x10000
    1200:	75 8e                	jne    1190 <main+0x70>
    1202:	e8 f9 fe ff ff       	call   1100 <std::chrono::_V2::steady_clock::now()@plt>
    1207:	48 8b 74 24 38       	mov    rsi,QWORD PTR [rsp+0x38]
    120c:	c5 fa 10 1d f8 0d 00 	vmovss xmm3,DWORD PTR [rip+0xdf8]        # 200c <_IO_stdin_used+0xc>
    1213:	00 
    1214:	b9 b8 0b 00 00       	mov    ecx,0xbb8
    1219:	49 89 c4             	mov    r12,rax
    121c:	c5 f0 57 c9          	vxorps xmm1,xmm1,xmm1
    1220:	c5 e9 57 d2          	vxorpd xmm2,xmm2,xmm2
    1224:	48 89 f2             	mov    rdx,rsi
    1227:	4c 29 ea             	sub    rdx,r13
    122a:	48 c1 fa 02          	sar    rdx,0x2
    122e:	66 90                	xchg   ax,ax
    1230:	31 c0                	xor    eax,eax
    1232:	49 39 f5             	cmp    r13,rsi
    1235:	75 1d                	jne    1254 <main+0x134>
    1237:	eb 3e                	jmp    1277 <main+0x157>
    1239:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1240:	48 ff c0             	inc    rax
    1243:	c5 fa 51 c0          	vsqrtss xmm0,xmm0,xmm0
    1247:	c5 fa 5a c0          	vcvtss2sd xmm0,xmm0,xmm0
    124b:	c5 eb 58 d0          	vaddsd xmm2,xmm2,xmm0
    124f:	48 39 d0             	cmp    rax,rdx
    1252:	73 23                	jae    1277 <main+0x157>
    1254:	c4 c1 62 58 04 86    	vaddss xmm0,xmm3,DWORD PTR [r14+rax*4]
    125a:	c4 c1 7a 59 44 85 00 	vmulss xmm0,xmm0,DWORD PTR [r13+rax*4+0x0]
    1261:	c5 f8 2f c1          	vcomiss xmm0,xmm1
    1265:	77 d9                	ja     1240 <main+0x120>
    1267:	48 ff c0             	inc    rax
    126a:	c5 fa 5a c0          	vcvtss2sd xmm0,xmm0,xmm0
    126e:	c5 eb 5c d0          	vsubsd xmm2,xmm2,xmm0
    1272:	48 39 d0             	cmp    rax,rdx
    1275:	72 dd                	jb     1254 <main+0x134>
    1277:	ff c9                	dec    ecx
    1279:	75 b5                	jne    1230 <main+0x110>
    127b:	c5 fb 11 54 24 08    	vmovsd QWORD PTR [rsp+0x8],xmm2
    1281:	e8 7a fe ff ff       	call   1100 <std::chrono::_V2::steady_clock::now()@plt>
    1286:	c5 d8 57 e4          	vxorps xmm4,xmm4,xmm4
    128a:	48 8d 35 7f 0d 00 00 	lea    rsi,[rip+0xd7f]        # 2010 <_IO_stdin_used+0x10>
    1291:	4c 29 e0             	sub    rax,r12
    1294:	bf 02 00 00 00       	mov    edi,0x2
    1299:	c5 fb 10 54 24 08    	vmovsd xmm2,QWORD PTR [rsp+0x8]
    129f:	c5 eb 10 c2          	vmovsd xmm0,xmm2,xmm2
    12a3:	c4 e1 db 2a c8       	vcvtsi2sd xmm1,xmm4,rax
    12a8:	b8 02 00 00 00       	mov    eax,0x2
    12ad:	c5 f3 59 0d 7b 0d 00 	vmulsd xmm1,xmm1,QWORD PTR [rip+0xd7b]        # 2030 <_IO_stdin_used+0x30>
    12b4:	00 
    12b5:	e8 f6 fd ff ff       	call   10b0 <__printf_chk@plt>
    12ba:	48 89 ef             	mov    rdi,rbp
    12bd:	e8 7e 01 00 00       	call   1440 <std::vector<float, std::allocator<float> >::~vector()>
    12c2:	48 89 df             	mov    rdi,rbx
    12c5:	e8 76 01 00 00       	call   1440 <std::vector<float, std::allocator<float> >::~vector()>
    12ca:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
    12cf:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    12d6:	00 00 
    12d8:	75 35                	jne    130f <main+0x1ef>
    12da:	48 83 c4 50          	add    rsp,0x50
    12de:	31 c0                	xor    eax,eax
    12e0:	5b                   	pop    rbx
    12e1:	5d                   	pop    rbp
    12e2:	41 5c                	pop    r12
    12e4:	41 5d                	pop    r13
    12e6:	41 5e                	pop    r14
    12e8:	c3                   	ret
    12e9:	48 89 ef             	mov    rdi,rbp
    12ec:	c5 f8 77             	vzeroupper
    12ef:	e8 4c 01 00 00       	call   1440 <std::vector<float, std::allocator<float> >::~vector()>
    12f4:	48 89 df             	mov    rdi,rbx
    12f7:	c5 f8 77             	vzeroupper
    12fa:	e8 41 01 00 00       	call   1440 <std::vector<float, std::allocator<float> >::~vector()>
    12ff:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
    1304:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    130b:	00 00 
    130d:	74 17                	je     1326 <main+0x206>
    130f:	e8 dc fd ff ff       	call   10f0 <__stack_chk_fail@plt>
    1314:	f3 0f 1e fa          	endbr64
    1318:	49 89 c4             	mov    r12,rax
    131b:	eb cc                	jmp    12e9 <main+0x1c9>
    131d:	f3 0f 1e fa          	endbr64
    1321:	49 89 c4             	mov    r12,rax
    1324:	eb ce                	jmp    12f4 <main+0x1d4>
    1326:	4c 89 e7             	mov    rdi,r12
    1329:	e8 e2 fd ff ff       	call   1110 <_Unwind_Resume@plt>
    132e:	66 90                	xchg   ax,ax

