0000000000001269 <kernel(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&)>:
    1269:	f3 0f 1e fa          	endbr64
    126d:	55                   	push   rbp
    126e:	48 89 e5             	mov    rbp,rsp
    1271:	48 83 ec 40          	sub    rsp,0x40
    1275:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    1279:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    127d:	66 0f ef c0          	pxor   xmm0,xmm0
    1281:	f2 0f 11 45 f0       	movsd  QWORD PTR [rbp-0x10],xmm0
    1286:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
    128d:	e9 e0 00 00 00       	jmp    1372 <kernel(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&)+0x109>
    1292:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
    1299:	00 
    129a:	e9 b4 00 00 00       	jmp    1353 <kernel(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&)+0xea>
    129f:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    12a3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    12a7:	48 89 d6             	mov    rsi,rdx
    12aa:	48 89 c7             	mov    rdi,rax
    12ad:	e8 4a 05 00 00       	call   17fc <std::vector<float, std::allocator<float> >::operator[](unsigned long) const>
    12b2:	f3 0f 10 18          	movss  xmm3,DWORD PTR [rax]
    12b6:	f3 0f 11 5d cc       	movss  DWORD PTR [rbp-0x34],xmm3
    12bb:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    12bf:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    12c3:	48 89 d6             	mov    rsi,rdx
    12c6:	48 89 c7             	mov    rdi,rax
    12c9:	e8 2e 05 00 00       	call   17fc <std::vector<float, std::allocator<float> >::operator[](unsigned long) const>
    12ce:	f3 0f 10 00          	movss  xmm0,DWORD PTR [rax]
    12d2:	f3 0f 59 45 cc       	mulss  xmm0,DWORD PTR [rbp-0x34]
    12d7:	f3 0f 11 45 cc       	movss  DWORD PTR [rbp-0x34],xmm0
    12dc:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    12e0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    12e4:	48 89 d6             	mov    rsi,rdx
    12e7:	48 89 c7             	mov    rdi,rax
    12ea:	e8 0d 05 00 00       	call   17fc <std::vector<float, std::allocator<float> >::operator[](unsigned long) const>
    12ef:	f3 0f 10 08          	movss  xmm1,DWORD PTR [rax]
    12f3:	f3 0f 10 05 65 1d 00 	movss  xmm0,DWORD PTR [rip+0x1d65]        # 3060 <std::__is_ratio_v<std::ratio<1000l, 1l> >+0x4>
    12fa:	00 
    12fb:	f3 0f 59 c1          	mulss  xmm0,xmm1
    12ff:	f3 0f 58 45 cc       	addss  xmm0,DWORD PTR [rbp-0x34]
    1304:	f3 0f 11 45 ec       	movss  DWORD PTR [rbp-0x14],xmm0
    1309:	f3 0f 10 45 ec       	movss  xmm0,DWORD PTR [rbp-0x14]
    130e:	66 0f ef c9          	pxor   xmm1,xmm1
    1312:	0f 2f c1             	comiss xmm0,xmm1
    1315:	76 20                	jbe    1337 <kernel(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&)+0xce>
    1317:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    131a:	66 0f 6e c0          	movd   xmm0,eax
    131e:	e8 e8 03 00 00       	call   170b <std::sqrt(float)>
    1323:	f3 0f 5a c0          	cvtss2sd xmm0,xmm0
    1327:	f2 0f 10 4d f0       	movsd  xmm1,QWORD PTR [rbp-0x10]
    132c:	f2 0f 58 c1          	addsd  xmm0,xmm1
    1330:	f2 0f 11 45 f0       	movsd  QWORD PTR [rbp-0x10],xmm0
    1335:	eb 17                	jmp    134e <kernel(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&)+0xe5>
    1337:	66 0f ef c9          	pxor   xmm1,xmm1
    133b:	f3 0f 5a 4d ec       	cvtss2sd xmm1,DWORD PTR [rbp-0x14]
    1340:	f2 0f 10 45 f0       	movsd  xmm0,QWORD PTR [rbp-0x10]
    1345:	f2 0f 5c c1          	subsd  xmm0,xmm1
    1349:	f2 0f 11 45 f0       	movsd  QWORD PTR [rbp-0x10],xmm0
    134e:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    1353:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    1357:	48 89 c7             	mov    rdi,rax
    135a:	e8 75 04 00 00       	call   17d4 <std::vector<float, std::allocator<float> >::size() const>
    135f:	48 39 45 f8          	cmp    QWORD PTR [rbp-0x8],rax
    1363:	0f 92 c0             	setb   al
    1366:	84 c0                	test   al,al
    1368:	0f 85 31 ff ff ff    	jne    129f <kernel(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&)+0x36>
    136e:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
    1372:	81 7d e8 b7 0b 00 00 	cmp    DWORD PTR [rbp-0x18],0xbb7
    1379:	0f 8e 13 ff ff ff    	jle    1292 <kernel(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&)+0x29>
    137f:	f2 0f 10 45 f0       	movsd  xmm0,QWORD PTR [rbp-0x10]
    1384:	c9                   	leave
    1385:	c3                   	ret


0000000000001386 <main>:
    1386:	f3 0f 1e fa          	endbr64
    138a:	55                   	push   rbp
    138b:	48 89 e5             	mov    rbp,rsp
    138e:	53                   	push   rbx
    138f:	48 81 ec a8 00 00 00 	sub    rsp,0xa8
    1396:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    139d:	00 00 
    139f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    13a3:	31 c0                	xor    eax,eax
    13a5:	48 c7 45 88 00 00 01 	mov    QWORD PTR [rbp-0x78],0x10000
    13ac:	00 
    13ad:	48 8d 45 d0          	lea    rax,[rbp-0x30]
    13b1:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
    13b5:	90                   	nop
    13b6:	90                   	nop
    13b7:	48 8d 55 d0          	lea    rdx,[rbp-0x30]
    13bb:	48 8d 45 b0          	lea    rax,[rbp-0x50]
    13bf:	be 00 00 01 00       	mov    esi,0x10000
    13c4:	48 89 c7             	mov    rdi,rax
    13c7:	e8 54 04 00 00       	call   1820 <std::vector<float, std::allocator<float> >::vector(unsigned long, std::allocator<float> const&)>
    13cc:	48 8d 45 d0          	lea    rax,[rbp-0x30]
    13d0:	48 89 c7             	mov    rdi,rax
    13d3:	e8 4e 06 00 00       	call   1a26 <std::__new_allocator<float>::~__new_allocator()>
    13d8:	90                   	nop
    13d9:	48 8d 85 78 ff ff ff 	lea    rax,[rbp-0x88]
    13e0:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    13e4:	90                   	nop
    13e5:	90                   	nop
    13e6:	48 8d 95 78 ff ff ff 	lea    rdx,[rbp-0x88]
    13ed:	48 8d 45 d0          	lea    rax,[rbp-0x30]
    13f1:	be 00 00 01 00       	mov    esi,0x10000
    13f6:	48 89 c7             	mov    rdi,rax
    13f9:	e8 22 04 00 00       	call   1820 <std::vector<float, std::allocator<float> >::vector(unsigned long, std::allocator<float> const&)>
    13fe:	48 8d 85 78 ff ff ff 	lea    rax,[rbp-0x88]
    1405:	48 89 c7             	mov    rdi,rax
    1408:	e8 19 06 00 00       	call   1a26 <std::__new_allocator<float>::~__new_allocator()>
    140d:	90                   	nop
    140e:	48 c7 45 80 00 00 00 	mov    QWORD PTR [rbp-0x80],0x0
    1415:	00 
    1416:	e9 34 01 00 00       	jmp    154f <main+0x1c9>
    141b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
    141f:	ba b1 79 37 9e       	mov    edx,0x9e3779b1
    1424:	48 0f af c2          	imul   rax,rdx
    1428:	48 89 c1             	mov    rcx,rax
    142b:	48 89 c8             	mov    rax,rcx
    142e:	48 c1 e8 03          	shr    rax,0x3
    1432:	48 ba cf f7 53 e3 a5 	movabs rdx,0x20c49ba5e353f7cf
    1439:	9b c4 20 
    143c:	48 f7 e2             	mul    rdx
    143f:	48 89 d0             	mov    rax,rdx
    1442:	48 c1 e8 04          	shr    rax,0x4
    1446:	48 69 d0 e8 03 00 00 	imul   rdx,rax,0x3e8
    144d:	48 89 c8             	mov    rax,rcx
    1450:	48 29 d0             	sub    rax,rdx
    1453:	48 85 c0             	test   rax,rax
    1456:	78 0b                	js     1463 <main+0xdd>
    1458:	66 0f ef c0          	pxor   xmm0,xmm0
    145c:	f3 48 0f 2a c0       	cvtsi2ss xmm0,rax
    1461:	eb 19                	jmp    147c <main+0xf6>
    1463:	48 89 c2             	mov    rdx,rax
    1466:	48 d1 ea             	shr    rdx,1
    1469:	83 e0 01             	and    eax,0x1
    146c:	48 09 c2             	or     rdx,rax
    146f:	66 0f ef c0          	pxor   xmm0,xmm0
    1473:	f3 48 0f 2a c2       	cvtsi2ss xmm0,rdx
    1478:	f3 0f 58 c0          	addss  xmm0,xmm0
    147c:	f3 0f 10 0d e0 1b 00 	movss  xmm1,DWORD PTR [rip+0x1be0]        # 3064 <std::__is_ratio_v<std::ratio<1000l, 1l> >+0x8>
    1483:	00 
    1484:	f3 0f 5e c1          	divss  xmm0,xmm1
    1488:	f3 0f 10 0d d8 1b 00 	movss  xmm1,DWORD PTR [rip+0x1bd8]        # 3068 <std::__is_ratio_v<std::ratio<1000l, 1l> >+0xc>
    148f:	00 
    1490:	f3 0f 5c c1          	subss  xmm0,xmm1
    1494:	f3 0f 11 85 5c ff ff 	movss  DWORD PTR [rbp-0xa4],xmm0
    149b:	ff 
    149c:	48 8b 55 80          	mov    rdx,QWORD PTR [rbp-0x80]
    14a0:	48 8d 45 b0          	lea    rax,[rbp-0x50]
    14a4:	48 89 d6             	mov    rsi,rdx
    14a7:	48 89 c7             	mov    rdi,rax
    14aa:	e8 49 04 00 00       	call   18f8 <std::vector<float, std::allocator<float> >::operator[](unsigned long)>
    14af:	f3 0f 10 85 5c ff ff 	movss  xmm0,DWORD PTR [rbp-0xa4]
    14b6:	ff 
    14b7:	f3 0f 11 00          	movss  DWORD PTR [rax],xmm0
    14bb:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
    14bf:	48 69 c8 37 9e 00 00 	imul   rcx,rax,0x9e37
    14c6:	48 89 c8             	mov    rax,rcx
    14c9:	48 c1 e8 03          	shr    rax,0x3
    14cd:	48 ba cf f7 53 e3 a5 	movabs rdx,0x20c49ba5e353f7cf
    14d4:	9b c4 20 
    14d7:	48 f7 e2             	mul    rdx
    14da:	48 89 d0             	mov    rax,rdx
    14dd:	48 c1 e8 04          	shr    rax,0x4
    14e1:	48 69 d0 e8 03 00 00 	imul   rdx,rax,0x3e8
    14e8:	48 89 c8             	mov    rax,rcx
    14eb:	48 29 d0             	sub    rax,rdx
    14ee:	48 85 c0             	test   rax,rax
    14f1:	78 0b                	js     14fe <main+0x178>
    14f3:	66 0f ef c0          	pxor   xmm0,xmm0
    14f7:	f3 48 0f 2a c0       	cvtsi2ss xmm0,rax
    14fc:	eb 19                	jmp    1517 <main+0x191>
    14fe:	48 89 c2             	mov    rdx,rax
    1501:	48 d1 ea             	shr    rdx,1
    1504:	83 e0 01             	and    eax,0x1
    1507:	48 09 c2             	or     rdx,rax
    150a:	66 0f ef c0          	pxor   xmm0,xmm0
    150e:	f3 48 0f 2a c2       	cvtsi2ss xmm0,rdx
    1513:	f3 0f 58 c0          	addss  xmm0,xmm0
    1517:	f3 0f 10 0d 45 1b 00 	movss  xmm1,DWORD PTR [rip+0x1b45]        # 3064 <std::__is_ratio_v<std::ratio<1000l, 1l> >+0x8>
    151e:	00 
    151f:	f3 0f 5e c1          	divss  xmm0,xmm1
    1523:	f3 0f 11 85 5c ff ff 	movss  DWORD PTR [rbp-0xa4],xmm0
    152a:	ff 
    152b:	48 8b 55 80          	mov    rdx,QWORD PTR [rbp-0x80]
    152f:	48 8d 45 d0          	lea    rax,[rbp-0x30]
    1533:	48 89 d6             	mov    rsi,rdx
    1536:	48 89 c7             	mov    rdi,rax
    1539:	e8 ba 03 00 00       	call   18f8 <std::vector<float, std::allocator<float> >::operator[](unsigned long)>
    153e:	f3 0f 10 85 5c ff ff 	movss  xmm0,DWORD PTR [rbp-0xa4]
    1545:	ff 
    1546:	f3 0f 11 00          	movss  DWORD PTR [rax],xmm0
    154a:	48 83 45 80 01       	add    QWORD PTR [rbp-0x80],0x1
    154f:	48 81 7d 80 ff ff 00 	cmp    QWORD PTR [rbp-0x80],0xffff
    1556:	00 
    1557:	0f 86 be fe ff ff    	jbe    141b <main+0x95>
    155d:	e8 ee fb ff ff       	call   1150 <std::chrono::_V2::steady_clock::now()@plt>
    1562:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    1569:	48 8d 55 d0          	lea    rdx,[rbp-0x30]
    156d:	48 8d 45 b0          	lea    rax,[rbp-0x50]
    1571:	48 89 d6             	mov    rsi,rdx
    1574:	48 89 c7             	mov    rdi,rax
    1577:	e8 ed fc ff ff       	call   1269 <kernel(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&)>
    157c:	66 48 0f 7e c0       	movq   rax,xmm0
    1581:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    1585:	e8 c6 fb ff ff       	call   1150 <std::chrono::_V2::steady_clock::now()@plt>
    158a:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    1591:	48 8d 95 60 ff ff ff 	lea    rdx,[rbp-0xa0]
    1598:	48 8d 85 68 ff ff ff 	lea    rax,[rbp-0x98]
    159f:	48 89 d6             	mov    rsi,rdx
    15a2:	48 89 c7             	mov    rdi,rax
    15a5:	e8 a8 01 00 00       	call   1752 <std::common_type<std::chrono::duration<long, std::ratio<1l, 1000000000l> >, std::chrono::duration<long, std::ratio<1l, 1000000000l> > >::type std::chrono::operator-<std::chrono::_V2::steady_clock, std::chrono::duration<long, std::ratio<1l, 1000000000l> >, std::chrono::duration<long, std::ratio<1l, 1000000000l> > >(std::chrono::time_point<std::chrono::_V2::steady_clock, std::chrono::duration<long, std::ratio<1l, 1000000000l> > > const&, std::chrono::time_point<std::chrono::_V2::steady_clock, std::chrono::duration<long, std::ratio<1l, 1000000000l> > > const&)>
    15aa:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    15b1:	48 8d 95 70 ff ff ff 	lea    rdx,[rbp-0x90]
    15b8:	48 8d 85 78 ff ff ff 	lea    rax,[rbp-0x88]
    15bf:	48 89 d6             	mov    rsi,rdx
    15c2:	48 89 c7             	mov    rdi,rax
    15c5:	e8 52 03 00 00       	call   191c <std::chrono::duration<double, std::ratio<1l, 1000l> >::duration<long, std::ratio<1l, 1000000000l>, void>(std::chrono::duration<long, std::ratio<1l, 1000000000l> > const&)>
    15ca:	48 8d 85 78 ff ff ff 	lea    rax,[rbp-0x88]
    15d1:	48 89 c7             	mov    rdi,rax
    15d4:	e8 a7 03 00 00       	call   1980 <std::chrono::duration<double, std::ratio<1l, 1000l> >::count() const>
    15d9:	66 48 0f 7e c0       	movq   rax,xmm0
    15de:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    15e2:	f2 0f 10 45 98       	movsd  xmm0,QWORD PTR [rbp-0x68]
    15e7:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    15eb:	66 0f 28 c8          	movapd xmm1,xmm0
    15ef:	66 48 0f 6e c0       	movq   xmm0,rax
    15f4:	48 8d 05 0d 1a 00 00 	lea    rax,[rip+0x1a0d]        # 3008 <_IO_stdin_used+0x8>
    15fb:	48 89 c7             	mov    rdi,rax
    15fe:	b8 02 00 00 00       	mov    eax,0x2
    1603:	e8 d8 fa ff ff       	call   10e0 <printf@plt>
    1608:	bb 00 00 00 00       	mov    ebx,0x0
    160d:	48 8d 45 d0          	lea    rax,[rbp-0x30]
    1611:	48 89 c7             	mov    rdi,rax
    1614:	e8 85 02 00 00       	call   189e <std::vector<float, std::allocator<float> >::~vector()>
    1619:	48 8d 45 b0          	lea    rax,[rbp-0x50]
    161d:	48 89 c7             	mov    rdi,rax
    1620:	e8 79 02 00 00       	call   189e <std::vector<float, std::allocator<float> >::~vector()>
    1625:	89 d8                	mov    eax,ebx
    1627:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    162b:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
    1632:	00 00 
    1634:	0f 84 94 00 00 00    	je     16ce <main+0x348>
    163a:	e9 8a 00 00 00       	jmp    16c9 <main+0x343>
    163f:	f3 0f 1e fa          	endbr64
    1643:	48 89 c3             	mov    rbx,rax
    1646:	48 8d 45 d0          	lea    rax,[rbp-0x30]
    164a:	48 89 c7             	mov    rdi,rax
    164d:	e8 d4 03 00 00       	call   1a26 <std::__new_allocator<float>::~__new_allocator()>
    1652:	90                   	nop
    1653:	48 89 d8             	mov    rax,rbx
    1656:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    165a:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
    1661:	00 00 
    1663:	74 05                	je     166a <main+0x2e4>
    1665:	e8 d6 fa ff ff       	call   1140 <__stack_chk_fail@plt>
    166a:	48 89 c7             	mov    rdi,rax
    166d:	e8 ee fa ff ff       	call   1160 <_Unwind_Resume@plt>
    1672:	f3 0f 1e fa          	endbr64
    1676:	48 89 c3             	mov    rbx,rax
    1679:	48 8d 85 78 ff ff ff 	lea    rax,[rbp-0x88]
    1680:	48 89 c7             	mov    rdi,rax
    1683:	e8 9e 03 00 00       	call   1a26 <std::__new_allocator<float>::~__new_allocator()>
    1688:	90                   	nop
    1689:	eb 13                	jmp    169e <main+0x318>
    168b:	f3 0f 1e fa          	endbr64
    168f:	48 89 c3             	mov    rbx,rax
    1692:	48 8d 45 d0          	lea    rax,[rbp-0x30]
    1696:	48 89 c7             	mov    rdi,rax
    1699:	e8 00 02 00 00       	call   189e <std::vector<float, std::allocator<float> >::~vector()>
    169e:	48 8d 45 b0          	lea    rax,[rbp-0x50]
    16a2:	48 89 c7             	mov    rdi,rax
    16a5:	e8 f4 01 00 00       	call   189e <std::vector<float, std::allocator<float> >::~vector()>
    16aa:	48 89 d8             	mov    rax,rbx
    16ad:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    16b1:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
    16b8:	00 00 
    16ba:	74 05                	je     16c1 <main+0x33b>
    16bc:	e8 7f fa ff ff       	call   1140 <__stack_chk_fail@plt>
    16c1:	48 89 c7             	mov    rdi,rax
    16c4:	e8 97 fa ff ff       	call   1160 <_Unwind_Resume@plt>
    16c9:	e8 72 fa ff ff       	call   1140 <__stack_chk_fail@plt>
    16ce:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
    16d2:	c9                   	leave
    16d3:	c3                   	ret

