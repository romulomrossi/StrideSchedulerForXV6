
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc d0 b5 10 80       	mov    $0x8010b5d0,%esp
8010002d:	b8 90 2e 10 80       	mov    $0x80102e90,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx
80100044:	bb 14 b6 10 80       	mov    $0x8010b614,%ebx
80100049:	83 ec 0c             	sub    $0xc,%esp
8010004c:	68 e0 71 10 80       	push   $0x801071e0
80100051:	68 e0 b5 10 80       	push   $0x8010b5e0
80100056:	e8 e5 43 00 00       	call   80104440 <initlock>
8010005b:	c7 05 2c fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd2c
80100062:	fc 10 80 
80100065:	c7 05 30 fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd30
8010006c:	fc 10 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba dc fc 10 80       	mov    $0x8010fcdc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
8010008b:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
80100092:	68 e7 71 10 80       	push   $0x801071e7
80100097:	50                   	push   %eax
80100098:	e8 93 42 00 00       	call   80104330 <initsleeplock>
8010009d:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
801000b0:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30
801000b6:	3d dc fc 10 80       	cmp    $0x8010fcdc,%eax
801000bb:	75 c3                	jne    80100080 <binit+0x40>
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801000df:	68 e0 b5 10 80       	push   $0x8010b5e0
801000e4:	e8 77 43 00 00       	call   80104460 <acquire>
801000e9:	8b 1d 30 fd 10 80    	mov    0x8010fd30,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100120:	8b 1d 2c fd 10 80    	mov    0x8010fd2c,%ebx
80100126:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 e0 b5 10 80       	push   $0x8010b5e0
80100162:	e8 d9 44 00 00       	call   80104640 <release>
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 fe 41 00 00       	call   80104370 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 3d 1f 00 00       	call   801020c0 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 ee 71 10 80       	push   $0x801071ee
80100198:	e8 d3 01 00 00       	call   80100370 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 5d 42 00 00       	call   80104410 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
801001c4:	e9 f7 1e 00 00       	jmp    801020c0 <iderw>
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 ff 71 10 80       	push   $0x801071ff
801001d1:	e8 9a 01 00 00       	call   80100370 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 1c 42 00 00       	call   80104410 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 cc 41 00 00       	call   801043d0 <releasesleep>
80100204:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
8010020b:	e8 50 42 00 00       	call   80104460 <acquire>
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100213:	83 c4 10             	add    $0x10,%esp
80100216:	83 e8 01             	sub    $0x1,%eax
80100219:	85 c0                	test   %eax,%eax
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
80100232:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
80100237:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
80100241:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
80100249:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30
8010024f:	c7 45 08 e0 b5 10 80 	movl   $0x8010b5e0,0x8(%ebp)
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
8010025c:	e9 df 43 00 00       	jmp    80104640 <release>
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 06 72 10 80       	push   $0x80107206
80100269:	e8 02 01 00 00       	call   80100370 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010027f:	57                   	push   %edi
80100280:	e8 ab 14 00 00       	call   80101730 <iunlock>
80100285:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028c:	e8 cf 41 00 00       	call   80104460 <acquire>
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e 9a 00 00 00    	jle    8010033b <consoleread+0xcb>
801002a1:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801002a6:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801002ac:	74 24                	je     801002d2 <consoleread+0x62>
801002ae:	eb 58                	jmp    80100308 <consoleread+0x98>
801002b0:	83 ec 08             	sub    $0x8,%esp
801002b3:	68 20 a5 10 80       	push   $0x8010a520
801002b8:	68 c0 ff 10 80       	push   $0x8010ffc0
801002bd:	e8 be 3b 00 00       	call   80103e80 <sleep>
801002c2:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801002c7:	83 c4 10             	add    $0x10,%esp
801002ca:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801002d0:	75 36                	jne    80100308 <consoleread+0x98>
801002d2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801002d8:	8b 40 24             	mov    0x24(%eax),%eax
801002db:	85 c0                	test   %eax,%eax
801002dd:	74 d1                	je     801002b0 <consoleread+0x40>
801002df:	83 ec 0c             	sub    $0xc,%esp
801002e2:	68 20 a5 10 80       	push   $0x8010a520
801002e7:	e8 54 43 00 00       	call   80104640 <release>
801002ec:	89 3c 24             	mov    %edi,(%esp)
801002ef:	e8 5c 13 00 00       	call   80101650 <ilock>
801002f4:	83 c4 10             	add    $0x10,%esp
801002f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801002fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002ff:	5b                   	pop    %ebx
80100300:	5e                   	pop    %esi
80100301:	5f                   	pop    %edi
80100302:	5d                   	pop    %ebp
80100303:	c3                   	ret    
80100304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100308:	8d 50 01             	lea    0x1(%eax),%edx
8010030b:	89 15 c0 ff 10 80    	mov    %edx,0x8010ffc0
80100311:	89 c2                	mov    %eax,%edx
80100313:	83 e2 7f             	and    $0x7f,%edx
80100316:	0f be 92 40 ff 10 80 	movsbl -0x7fef00c0(%edx),%edx
8010031d:	83 fa 04             	cmp    $0x4,%edx
80100320:	74 39                	je     8010035b <consoleread+0xeb>
80100322:	83 c6 01             	add    $0x1,%esi
80100325:	83 eb 01             	sub    $0x1,%ebx
80100328:	83 fa 0a             	cmp    $0xa,%edx
8010032b:	88 56 ff             	mov    %dl,-0x1(%esi)
8010032e:	74 35                	je     80100365 <consoleread+0xf5>
80100330:	85 db                	test   %ebx,%ebx
80100332:	0f 85 69 ff ff ff    	jne    801002a1 <consoleread+0x31>
80100338:	8b 45 10             	mov    0x10(%ebp),%eax
8010033b:	83 ec 0c             	sub    $0xc,%esp
8010033e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100341:	68 20 a5 10 80       	push   $0x8010a520
80100346:	e8 f5 42 00 00       	call   80104640 <release>
8010034b:	89 3c 24             	mov    %edi,(%esp)
8010034e:	e8 fd 12 00 00       	call   80101650 <ilock>
80100353:	83 c4 10             	add    $0x10,%esp
80100356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100359:	eb a1                	jmp    801002fc <consoleread+0x8c>
8010035b:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010035e:	76 05                	jbe    80100365 <consoleread+0xf5>
80100360:	a3 c0 ff 10 80       	mov    %eax,0x8010ffc0
80100365:	8b 45 10             	mov    0x10(%ebp),%eax
80100368:	29 d8                	sub    %ebx,%eax
8010036a:	eb cf                	jmp    8010033b <consoleread+0xcb>
8010036c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100370 <panic>:
80100370:	55                   	push   %ebp
80100371:	89 e5                	mov    %esp,%ebp
80100373:	56                   	push   %esi
80100374:	53                   	push   %ebx
80100375:	83 ec 38             	sub    $0x38,%esp
80100378:	fa                   	cli    
80100379:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
8010037f:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
80100386:	00 00 00 
80100389:	8d 5d d0             	lea    -0x30(%ebp),%ebx
8010038c:	8d 75 f8             	lea    -0x8(%ebp),%esi
8010038f:	0f b6 00             	movzbl (%eax),%eax
80100392:	50                   	push   %eax
80100393:	68 0d 72 10 80       	push   $0x8010720d
80100398:	e8 c3 02 00 00       	call   80100660 <cprintf>
8010039d:	58                   	pop    %eax
8010039e:	ff 75 08             	pushl  0x8(%ebp)
801003a1:	e8 ba 02 00 00       	call   80100660 <cprintf>
801003a6:	c7 04 24 31 78 10 80 	movl   $0x80107831,(%esp)
801003ad:	e8 ae 02 00 00       	call   80100660 <cprintf>
801003b2:	5a                   	pop    %edx
801003b3:	8d 45 08             	lea    0x8(%ebp),%eax
801003b6:	59                   	pop    %ecx
801003b7:	53                   	push   %ebx
801003b8:	50                   	push   %eax
801003b9:	e8 72 41 00 00       	call   80104530 <getcallerpcs>
801003be:	83 c4 10             	add    $0x10,%esp
801003c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801003c8:	83 ec 08             	sub    $0x8,%esp
801003cb:	ff 33                	pushl  (%ebx)
801003cd:	83 c3 04             	add    $0x4,%ebx
801003d0:	68 29 72 10 80       	push   $0x80107229
801003d5:	e8 86 02 00 00       	call   80100660 <cprintf>
801003da:	83 c4 10             	add    $0x10,%esp
801003dd:	39 f3                	cmp    %esi,%ebx
801003df:	75 e7                	jne    801003c8 <panic+0x58>
801003e1:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
801003e8:	00 00 00 
801003eb:	eb fe                	jmp    801003eb <panic+0x7b>
801003ed:	8d 76 00             	lea    0x0(%esi),%esi

801003f0 <consputc>:
801003f0:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
801003f6:	85 d2                	test   %edx,%edx
801003f8:	74 06                	je     80100400 <consputc+0x10>
801003fa:	fa                   	cli    
801003fb:	eb fe                	jmp    801003fb <consputc+0xb>
801003fd:	8d 76 00             	lea    0x0(%esi),%esi
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 0c             	sub    $0xc,%esp
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 b8 00 00 00    	je     801004ce <consputc+0xde>
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 81 59 00 00       	call   80105da0 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
8010042f:	be d5 03 00 00       	mov    $0x3d5,%esi
80100434:	89 f2                	mov    %esi,%edx
80100436:	ec                   	in     (%dx),%al
80100437:	0f b6 c0             	movzbl %al,%eax
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	c1 e0 08             	shl    $0x8,%eax
8010043f:	89 c1                	mov    %eax,%ecx
80100441:	b8 0f 00 00 00       	mov    $0xf,%eax
80100446:	ee                   	out    %al,(%dx)
80100447:	89 f2                	mov    %esi,%edx
80100449:	ec                   	in     (%dx),%al
8010044a:	0f b6 c0             	movzbl %al,%eax
8010044d:	09 c8                	or     %ecx,%eax
8010044f:	83 fb 0a             	cmp    $0xa,%ebx
80100452:	0f 84 0b 01 00 00    	je     80100563 <consputc+0x173>
80100458:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045e:	0f 84 e6 00 00 00    	je     8010054a <consputc+0x15a>
80100464:	0f b6 d3             	movzbl %bl,%edx
80100467:	8d 78 01             	lea    0x1(%eax),%edi
8010046a:	80 ce 07             	or     $0x7,%dh
8010046d:	66 89 94 00 00 80 0b 	mov    %dx,-0x7ff48000(%eax,%eax,1)
80100474:	80 
80100475:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
8010047b:	0f 8f bc 00 00 00    	jg     8010053d <consputc+0x14d>
80100481:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100487:	7f 6f                	jg     801004f8 <consputc+0x108>
80100489:	89 f8                	mov    %edi,%eax
8010048b:	8d 8c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ecx
80100492:	89 fb                	mov    %edi,%ebx
80100494:	c1 e8 08             	shr    $0x8,%eax
80100497:	89 c6                	mov    %eax,%esi
80100499:	bf d4 03 00 00       	mov    $0x3d4,%edi
8010049e:	b8 0e 00 00 00       	mov    $0xe,%eax
801004a3:	89 fa                	mov    %edi,%edx
801004a5:	ee                   	out    %al,(%dx)
801004a6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004ab:	89 f0                	mov    %esi,%eax
801004ad:	ee                   	out    %al,(%dx)
801004ae:	b8 0f 00 00 00       	mov    $0xf,%eax
801004b3:	89 fa                	mov    %edi,%edx
801004b5:	ee                   	out    %al,(%dx)
801004b6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004bb:	89 d8                	mov    %ebx,%eax
801004bd:	ee                   	out    %al,(%dx)
801004be:	b8 20 07 00 00       	mov    $0x720,%eax
801004c3:	66 89 01             	mov    %ax,(%ecx)
801004c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c9:	5b                   	pop    %ebx
801004ca:	5e                   	pop    %esi
801004cb:	5f                   	pop    %edi
801004cc:	5d                   	pop    %ebp
801004cd:	c3                   	ret    
801004ce:	83 ec 0c             	sub    $0xc,%esp
801004d1:	6a 08                	push   $0x8
801004d3:	e8 c8 58 00 00       	call   80105da0 <uartputc>
801004d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004df:	e8 bc 58 00 00       	call   80105da0 <uartputc>
801004e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004eb:	e8 b0 58 00 00       	call   80105da0 <uartputc>
801004f0:	83 c4 10             	add    $0x10,%esp
801004f3:	e9 2a ff ff ff       	jmp    80100422 <consputc+0x32>
801004f8:	83 ec 04             	sub    $0x4,%esp
801004fb:	8d 5f b0             	lea    -0x50(%edi),%ebx
801004fe:	68 60 0e 00 00       	push   $0xe60
80100503:	68 a0 80 0b 80       	push   $0x800b80a0
80100508:	68 00 80 0b 80       	push   $0x800b8000
8010050d:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi
80100514:	e8 27 42 00 00       	call   80104740 <memmove>
80100519:	b8 80 07 00 00       	mov    $0x780,%eax
8010051e:	83 c4 0c             	add    $0xc,%esp
80100521:	29 d8                	sub    %ebx,%eax
80100523:	01 c0                	add    %eax,%eax
80100525:	50                   	push   %eax
80100526:	6a 00                	push   $0x0
80100528:	56                   	push   %esi
80100529:	e8 62 41 00 00       	call   80104690 <memset>
8010052e:	89 f1                	mov    %esi,%ecx
80100530:	83 c4 10             	add    $0x10,%esp
80100533:	be 07 00 00 00       	mov    $0x7,%esi
80100538:	e9 5c ff ff ff       	jmp    80100499 <consputc+0xa9>
8010053d:	83 ec 0c             	sub    $0xc,%esp
80100540:	68 2d 72 10 80       	push   $0x8010722d
80100545:	e8 26 fe ff ff       	call   80100370 <panic>
8010054a:	85 c0                	test   %eax,%eax
8010054c:	8d 78 ff             	lea    -0x1(%eax),%edi
8010054f:	0f 85 20 ff ff ff    	jne    80100475 <consputc+0x85>
80100555:	b9 00 80 0b 80       	mov    $0x800b8000,%ecx
8010055a:	31 db                	xor    %ebx,%ebx
8010055c:	31 f6                	xor    %esi,%esi
8010055e:	e9 36 ff ff ff       	jmp    80100499 <consputc+0xa9>
80100563:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100568:	f7 ea                	imul   %edx
8010056a:	89 d0                	mov    %edx,%eax
8010056c:	c1 e8 05             	shr    $0x5,%eax
8010056f:	8d 04 80             	lea    (%eax,%eax,4),%eax
80100572:	c1 e0 04             	shl    $0x4,%eax
80100575:	8d 78 50             	lea    0x50(%eax),%edi
80100578:	e9 f8 fe ff ff       	jmp    80100475 <consputc+0x85>
8010057d:	8d 76 00             	lea    0x0(%esi),%esi

80100580 <printint>:
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d6                	mov    %edx,%esi
80100588:	83 ec 2c             	sub    $0x2c,%esp
8010058b:	85 c9                	test   %ecx,%ecx
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
80100590:	74 0c                	je     8010059e <printint+0x1e>
80100592:	89 c7                	mov    %eax,%edi
80100594:	c1 ef 1f             	shr    $0x1f,%edi
80100597:	85 c0                	test   %eax,%eax
80100599:	89 7d d4             	mov    %edi,-0x2c(%ebp)
8010059c:	78 51                	js     801005ef <printint+0x6f>
8010059e:	31 ff                	xor    %edi,%edi
801005a0:	8d 5d d7             	lea    -0x29(%ebp),%ebx
801005a3:	eb 05                	jmp    801005aa <printint+0x2a>
801005a5:	8d 76 00             	lea    0x0(%esi),%esi
801005a8:	89 cf                	mov    %ecx,%edi
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 4f 01             	lea    0x1(%edi),%ecx
801005af:	f7 f6                	div    %esi
801005b1:	0f b6 92 58 72 10 80 	movzbl -0x7fef8da8(%edx),%edx
801005b8:	85 c0                	test   %eax,%eax
801005ba:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
801005bd:	75 e9                	jne    801005a8 <printint+0x28>
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
801005c6:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
801005cb:	8d 4f 02             	lea    0x2(%edi),%ecx
801005ce:	8d 74 0d d7          	lea    -0x29(%ebp,%ecx,1),%esi
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005d8:	0f be 06             	movsbl (%esi),%eax
801005db:	83 ee 01             	sub    $0x1,%esi
801005de:	e8 0d fe ff ff       	call   801003f0 <consputc>
801005e3:	39 de                	cmp    %ebx,%esi
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
801005ef:	f7 d8                	neg    %eax
801005f1:	eb ab                	jmp    8010059e <printint+0x1e>
801005f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100600 <consolewrite>:
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
80100609:	ff 75 08             	pushl  0x8(%ebp)
8010060c:	8b 75 10             	mov    0x10(%ebp),%esi
8010060f:	e8 1c 11 00 00       	call   80101730 <iunlock>
80100614:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010061b:	e8 40 3e 00 00       	call   80104460 <acquire>
80100620:	8b 7d 0c             	mov    0xc(%ebp),%edi
80100623:	83 c4 10             	add    $0x10,%esp
80100626:	85 f6                	test   %esi,%esi
80100628:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062b:	7e 12                	jle    8010063f <consolewrite+0x3f>
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 b5 fd ff ff       	call   801003f0 <consputc>
8010063b:	39 df                	cmp    %ebx,%edi
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 a5 10 80       	push   $0x8010a520
80100647:	e8 f4 3f 00 00       	call   80104640 <release>
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 fb 0f 00 00       	call   80101650 <ilock>
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
80100669:	a1 54 a5 10 80       	mov    0x8010a554,%eax
8010066e:	85 c0                	test   %eax,%eax
80100670:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100673:	0f 85 47 01 00 00    	jne    801007c0 <cprintf+0x160>
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c1                	mov    %eax,%ecx
80100680:	0f 84 4f 01 00 00    	je     801007d5 <cprintf+0x175>
80100686:	0f b6 00             	movzbl (%eax),%eax
80100689:	31 db                	xor    %ebx,%ebx
8010068b:	8d 75 0c             	lea    0xc(%ebp),%esi
8010068e:	89 cf                	mov    %ecx,%edi
80100690:	85 c0                	test   %eax,%eax
80100692:	75 55                	jne    801006e9 <cprintf+0x89>
80100694:	eb 68                	jmp    801006fe <cprintf+0x9e>
80100696:	8d 76 00             	lea    0x0(%esi),%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801006a0:	83 c3 01             	add    $0x1,%ebx
801006a3:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
801006a7:	85 d2                	test   %edx,%edx
801006a9:	74 53                	je     801006fe <cprintf+0x9e>
801006ab:	83 fa 70             	cmp    $0x70,%edx
801006ae:	74 7a                	je     8010072a <cprintf+0xca>
801006b0:	7f 6e                	jg     80100720 <cprintf+0xc0>
801006b2:	83 fa 25             	cmp    $0x25,%edx
801006b5:	0f 84 ad 00 00 00    	je     80100768 <cprintf+0x108>
801006bb:	83 fa 64             	cmp    $0x64,%edx
801006be:	0f 85 84 00 00 00    	jne    80100748 <cprintf+0xe8>
801006c4:	8d 46 04             	lea    0x4(%esi),%eax
801006c7:	b9 01 00 00 00       	mov    $0x1,%ecx
801006cc:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006d4:	8b 06                	mov    (%esi),%eax
801006d6:	e8 a5 fe ff ff       	call   80100580 <printint>
801006db:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801006de:	83 c3 01             	add    $0x1,%ebx
801006e1:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006e5:	85 c0                	test   %eax,%eax
801006e7:	74 15                	je     801006fe <cprintf+0x9e>
801006e9:	83 f8 25             	cmp    $0x25,%eax
801006ec:	74 b2                	je     801006a0 <cprintf+0x40>
801006ee:	e8 fd fc ff ff       	call   801003f0 <consputc>
801006f3:	83 c3 01             	add    $0x1,%ebx
801006f6:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006fa:	85 c0                	test   %eax,%eax
801006fc:	75 eb                	jne    801006e9 <cprintf+0x89>
801006fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100701:	85 c0                	test   %eax,%eax
80100703:	74 10                	je     80100715 <cprintf+0xb5>
80100705:	83 ec 0c             	sub    $0xc,%esp
80100708:	68 20 a5 10 80       	push   $0x8010a520
8010070d:	e8 2e 3f 00 00       	call   80104640 <release>
80100712:	83 c4 10             	add    $0x10,%esp
80100715:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100718:	5b                   	pop    %ebx
80100719:	5e                   	pop    %esi
8010071a:	5f                   	pop    %edi
8010071b:	5d                   	pop    %ebp
8010071c:	c3                   	ret    
8010071d:	8d 76 00             	lea    0x0(%esi),%esi
80100720:	83 fa 73             	cmp    $0x73,%edx
80100723:	74 5b                	je     80100780 <cprintf+0x120>
80100725:	83 fa 78             	cmp    $0x78,%edx
80100728:	75 1e                	jne    80100748 <cprintf+0xe8>
8010072a:	8d 46 04             	lea    0x4(%esi),%eax
8010072d:	31 c9                	xor    %ecx,%ecx
8010072f:	ba 10 00 00 00       	mov    $0x10,%edx
80100734:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100737:	8b 06                	mov    (%esi),%eax
80100739:	e8 42 fe ff ff       	call   80100580 <printint>
8010073e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80100741:	eb 9b                	jmp    801006de <cprintf+0x7e>
80100743:	90                   	nop
80100744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100748:	b8 25 00 00 00       	mov    $0x25,%eax
8010074d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100750:	e8 9b fc ff ff       	call   801003f0 <consputc>
80100755:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100758:	89 d0                	mov    %edx,%eax
8010075a:	e8 91 fc ff ff       	call   801003f0 <consputc>
8010075f:	e9 7a ff ff ff       	jmp    801006de <cprintf+0x7e>
80100764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100768:	b8 25 00 00 00       	mov    $0x25,%eax
8010076d:	e8 7e fc ff ff       	call   801003f0 <consputc>
80100772:	e9 7c ff ff ff       	jmp    801006f3 <cprintf+0x93>
80100777:	89 f6                	mov    %esi,%esi
80100779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100780:	8d 46 04             	lea    0x4(%esi),%eax
80100783:	8b 36                	mov    (%esi),%esi
80100785:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100788:	b8 40 72 10 80       	mov    $0x80107240,%eax
8010078d:	85 f6                	test   %esi,%esi
8010078f:	0f 44 f0             	cmove  %eax,%esi
80100792:	0f be 06             	movsbl (%esi),%eax
80100795:	84 c0                	test   %al,%al
80100797:	74 16                	je     801007af <cprintf+0x14f>
80100799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007a0:	83 c6 01             	add    $0x1,%esi
801007a3:	e8 48 fc ff ff       	call   801003f0 <consputc>
801007a8:	0f be 06             	movsbl (%esi),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
801007af:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801007b2:	e9 27 ff ff ff       	jmp    801006de <cprintf+0x7e>
801007b7:	89 f6                	mov    %esi,%esi
801007b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801007c0:	83 ec 0c             	sub    $0xc,%esp
801007c3:	68 20 a5 10 80       	push   $0x8010a520
801007c8:	e8 93 3c 00 00       	call   80104460 <acquire>
801007cd:	83 c4 10             	add    $0x10,%esp
801007d0:	e9 a4 fe ff ff       	jmp    80100679 <cprintf+0x19>
801007d5:	83 ec 0c             	sub    $0xc,%esp
801007d8:	68 47 72 10 80       	push   $0x80107247
801007dd:	e8 8e fb ff ff       	call   80100370 <panic>
801007e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801007f0 <consoleintr>:
801007f0:	55                   	push   %ebp
801007f1:	89 e5                	mov    %esp,%ebp
801007f3:	57                   	push   %edi
801007f4:	56                   	push   %esi
801007f5:	53                   	push   %ebx
801007f6:	31 f6                	xor    %esi,%esi
801007f8:	83 ec 18             	sub    $0x18,%esp
801007fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
801007fe:	68 20 a5 10 80       	push   $0x8010a520
80100803:	e8 58 3c 00 00       	call   80104460 <acquire>
80100808:	83 c4 10             	add    $0x10,%esp
8010080b:	90                   	nop
8010080c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100810:	ff d3                	call   *%ebx
80100812:	85 c0                	test   %eax,%eax
80100814:	89 c7                	mov    %eax,%edi
80100816:	78 48                	js     80100860 <consoleintr+0x70>
80100818:	83 ff 10             	cmp    $0x10,%edi
8010081b:	0f 84 3f 01 00 00    	je     80100960 <consoleintr+0x170>
80100821:	7e 5d                	jle    80100880 <consoleintr+0x90>
80100823:	83 ff 15             	cmp    $0x15,%edi
80100826:	0f 84 dc 00 00 00    	je     80100908 <consoleintr+0x118>
8010082c:	83 ff 7f             	cmp    $0x7f,%edi
8010082f:	75 54                	jne    80100885 <consoleintr+0x95>
80100831:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100836:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
8010083c:	74 d2                	je     80100810 <consoleintr+0x20>
8010083e:	83 e8 01             	sub    $0x1,%eax
80100841:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
80100846:	b8 00 01 00 00       	mov    $0x100,%eax
8010084b:	e8 a0 fb ff ff       	call   801003f0 <consputc>
80100850:	ff d3                	call   *%ebx
80100852:	85 c0                	test   %eax,%eax
80100854:	89 c7                	mov    %eax,%edi
80100856:	79 c0                	jns    80100818 <consoleintr+0x28>
80100858:	90                   	nop
80100859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100860:	83 ec 0c             	sub    $0xc,%esp
80100863:	68 20 a5 10 80       	push   $0x8010a520
80100868:	e8 d3 3d 00 00       	call   80104640 <release>
8010086d:	83 c4 10             	add    $0x10,%esp
80100870:	85 f6                	test   %esi,%esi
80100872:	0f 85 f8 00 00 00    	jne    80100970 <consoleintr+0x180>
80100878:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010087b:	5b                   	pop    %ebx
8010087c:	5e                   	pop    %esi
8010087d:	5f                   	pop    %edi
8010087e:	5d                   	pop    %ebp
8010087f:	c3                   	ret    
80100880:	83 ff 08             	cmp    $0x8,%edi
80100883:	74 ac                	je     80100831 <consoleintr+0x41>
80100885:	85 ff                	test   %edi,%edi
80100887:	74 87                	je     80100810 <consoleintr+0x20>
80100889:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
8010088e:	89 c2                	mov    %eax,%edx
80100890:	2b 15 c0 ff 10 80    	sub    0x8010ffc0,%edx
80100896:	83 fa 7f             	cmp    $0x7f,%edx
80100899:	0f 87 71 ff ff ff    	ja     80100810 <consoleintr+0x20>
8010089f:	8d 50 01             	lea    0x1(%eax),%edx
801008a2:	83 e0 7f             	and    $0x7f,%eax
801008a5:	83 ff 0d             	cmp    $0xd,%edi
801008a8:	89 15 c8 ff 10 80    	mov    %edx,0x8010ffc8
801008ae:	0f 84 c8 00 00 00    	je     8010097c <consoleintr+0x18c>
801008b4:	89 f9                	mov    %edi,%ecx
801008b6:	88 88 40 ff 10 80    	mov    %cl,-0x7fef00c0(%eax)
801008bc:	89 f8                	mov    %edi,%eax
801008be:	e8 2d fb ff ff       	call   801003f0 <consputc>
801008c3:	83 ff 0a             	cmp    $0xa,%edi
801008c6:	0f 84 c1 00 00 00    	je     8010098d <consoleintr+0x19d>
801008cc:	83 ff 04             	cmp    $0x4,%edi
801008cf:	0f 84 b8 00 00 00    	je     8010098d <consoleintr+0x19d>
801008d5:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801008da:	83 e8 80             	sub    $0xffffff80,%eax
801008dd:	39 05 c8 ff 10 80    	cmp    %eax,0x8010ffc8
801008e3:	0f 85 27 ff ff ff    	jne    80100810 <consoleintr+0x20>
801008e9:	83 ec 0c             	sub    $0xc,%esp
801008ec:	a3 c4 ff 10 80       	mov    %eax,0x8010ffc4
801008f1:	68 c0 ff 10 80       	push   $0x8010ffc0
801008f6:	e8 25 37 00 00       	call   80104020 <wakeup>
801008fb:	83 c4 10             	add    $0x10,%esp
801008fe:	e9 0d ff ff ff       	jmp    80100810 <consoleintr+0x20>
80100903:	90                   	nop
80100904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100908:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
8010090d:	39 05 c4 ff 10 80    	cmp    %eax,0x8010ffc4
80100913:	75 2b                	jne    80100940 <consoleintr+0x150>
80100915:	e9 f6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010091a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100920:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
80100925:	b8 00 01 00 00       	mov    $0x100,%eax
8010092a:	e8 c1 fa ff ff       	call   801003f0 <consputc>
8010092f:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100934:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
8010093a:	0f 84 d0 fe ff ff    	je     80100810 <consoleintr+0x20>
80100940:	83 e8 01             	sub    $0x1,%eax
80100943:	89 c2                	mov    %eax,%edx
80100945:	83 e2 7f             	and    $0x7f,%edx
80100948:	80 ba 40 ff 10 80 0a 	cmpb   $0xa,-0x7fef00c0(%edx)
8010094f:	75 cf                	jne    80100920 <consoleintr+0x130>
80100951:	e9 ba fe ff ff       	jmp    80100810 <consoleintr+0x20>
80100956:	8d 76 00             	lea    0x0(%esi),%esi
80100959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100960:	be 01 00 00 00       	mov    $0x1,%esi
80100965:	e9 a6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010096a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100970:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100973:	5b                   	pop    %ebx
80100974:	5e                   	pop    %esi
80100975:	5f                   	pop    %edi
80100976:	5d                   	pop    %ebp
80100977:	e9 94 37 00 00       	jmp    80104110 <procdump>
8010097c:	c6 80 40 ff 10 80 0a 	movb   $0xa,-0x7fef00c0(%eax)
80100983:	b8 0a 00 00 00       	mov    $0xa,%eax
80100988:	e8 63 fa ff ff       	call   801003f0 <consputc>
8010098d:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100992:	e9 52 ff ff ff       	jmp    801008e9 <consoleintr+0xf9>
80100997:	89 f6                	mov    %esi,%esi
80100999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801009a0 <consoleinit>:
801009a0:	55                   	push   %ebp
801009a1:	89 e5                	mov    %esp,%ebp
801009a3:	83 ec 10             	sub    $0x10,%esp
801009a6:	68 50 72 10 80       	push   $0x80107250
801009ab:	68 20 a5 10 80       	push   $0x8010a520
801009b0:	e8 8b 3a 00 00       	call   80104440 <initlock>
801009b5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801009bc:	c7 05 8c 09 11 80 00 	movl   $0x80100600,0x8011098c
801009c3:	06 10 80 
801009c6:	c7 05 88 09 11 80 70 	movl   $0x80100270,0x80110988
801009cd:	02 10 80 
801009d0:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
801009d7:	00 00 00 
801009da:	e8 71 28 00 00       	call   80103250 <picenable>
801009df:	58                   	pop    %eax
801009e0:	5a                   	pop    %edx
801009e1:	6a 00                	push   $0x0
801009e3:	6a 01                	push   $0x1
801009e5:	e8 96 18 00 00       	call   80102280 <ioapicenable>
801009ea:	83 c4 10             	add    $0x10,%esp
801009ed:	c9                   	leave  
801009ee:	c3                   	ret    
801009ef:	90                   	nop

801009f0 <exec>:
801009f0:	55                   	push   %ebp
801009f1:	89 e5                	mov    %esp,%ebp
801009f3:	57                   	push   %edi
801009f4:	56                   	push   %esi
801009f5:	53                   	push   %ebx
801009f6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
801009fc:	e8 7f 21 00 00       	call   80102b80 <begin_op>
80100a01:	83 ec 0c             	sub    $0xc,%esp
80100a04:	ff 75 08             	pushl  0x8(%ebp)
80100a07:	e8 74 14 00 00       	call   80101e80 <namei>
80100a0c:	83 c4 10             	add    $0x10,%esp
80100a0f:	85 c0                	test   %eax,%eax
80100a11:	0f 84 9f 01 00 00    	je     80100bb6 <exec+0x1c6>
80100a17:	83 ec 0c             	sub    $0xc,%esp
80100a1a:	89 c3                	mov    %eax,%ebx
80100a1c:	50                   	push   %eax
80100a1d:	e8 2e 0c 00 00       	call   80101650 <ilock>
80100a22:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a28:	6a 34                	push   $0x34
80100a2a:	6a 00                	push   $0x0
80100a2c:	50                   	push   %eax
80100a2d:	53                   	push   %ebx
80100a2e:	e8 dd 0e 00 00       	call   80101910 <readi>
80100a33:	83 c4 20             	add    $0x20,%esp
80100a36:	83 f8 34             	cmp    $0x34,%eax
80100a39:	74 25                	je     80100a60 <exec+0x70>
80100a3b:	83 ec 0c             	sub    $0xc,%esp
80100a3e:	53                   	push   %ebx
80100a3f:	e8 7c 0e 00 00       	call   801018c0 <iunlockput>
80100a44:	e8 a7 21 00 00       	call   80102bf0 <end_op>
80100a49:	83 c4 10             	add    $0x10,%esp
80100a4c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100a51:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a54:	5b                   	pop    %ebx
80100a55:	5e                   	pop    %esi
80100a56:	5f                   	pop    %edi
80100a57:	5d                   	pop    %ebp
80100a58:	c3                   	ret    
80100a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100a60:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a67:	45 4c 46 
80100a6a:	75 cf                	jne    80100a3b <exec+0x4b>
80100a6c:	e8 ef 60 00 00       	call   80106b60 <setupkvm>
80100a71:	85 c0                	test   %eax,%eax
80100a73:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a79:	74 c0                	je     80100a3b <exec+0x4b>
80100a7b:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a82:	00 
80100a83:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100a89:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100a90:	00 00 00 
80100a93:	0f 84 c5 00 00 00    	je     80100b5e <exec+0x16e>
80100a99:	31 ff                	xor    %edi,%edi
80100a9b:	eb 18                	jmp    80100ab5 <exec+0xc5>
80100a9d:	8d 76 00             	lea    0x0(%esi),%esi
80100aa0:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100aa7:	83 c7 01             	add    $0x1,%edi
80100aaa:	83 c6 20             	add    $0x20,%esi
80100aad:	39 f8                	cmp    %edi,%eax
80100aaf:	0f 8e a9 00 00 00    	jle    80100b5e <exec+0x16e>
80100ab5:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100abb:	6a 20                	push   $0x20
80100abd:	56                   	push   %esi
80100abe:	50                   	push   %eax
80100abf:	53                   	push   %ebx
80100ac0:	e8 4b 0e 00 00       	call   80101910 <readi>
80100ac5:	83 c4 10             	add    $0x10,%esp
80100ac8:	83 f8 20             	cmp    $0x20,%eax
80100acb:	75 7b                	jne    80100b48 <exec+0x158>
80100acd:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100ad4:	75 ca                	jne    80100aa0 <exec+0xb0>
80100ad6:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100adc:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100ae2:	72 64                	jb     80100b48 <exec+0x158>
80100ae4:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100aea:	72 5c                	jb     80100b48 <exec+0x158>
80100aec:	83 ec 04             	sub    $0x4,%esp
80100aef:	50                   	push   %eax
80100af0:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100af6:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100afc:	e8 1f 63 00 00       	call   80106e20 <allocuvm>
80100b01:	83 c4 10             	add    $0x10,%esp
80100b04:	85 c0                	test   %eax,%eax
80100b06:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100b0c:	74 3a                	je     80100b48 <exec+0x158>
80100b0e:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b14:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b19:	75 2d                	jne    80100b48 <exec+0x158>
80100b1b:	83 ec 0c             	sub    $0xc,%esp
80100b1e:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b24:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b2a:	53                   	push   %ebx
80100b2b:	50                   	push   %eax
80100b2c:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b32:	e8 29 62 00 00       	call   80106d60 <loaduvm>
80100b37:	83 c4 20             	add    $0x20,%esp
80100b3a:	85 c0                	test   %eax,%eax
80100b3c:	0f 89 5e ff ff ff    	jns    80100aa0 <exec+0xb0>
80100b42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100b48:	83 ec 0c             	sub    $0xc,%esp
80100b4b:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b51:	e8 fa 63 00 00       	call   80106f50 <freevm>
80100b56:	83 c4 10             	add    $0x10,%esp
80100b59:	e9 dd fe ff ff       	jmp    80100a3b <exec+0x4b>
80100b5e:	83 ec 0c             	sub    $0xc,%esp
80100b61:	53                   	push   %ebx
80100b62:	e8 59 0d 00 00       	call   801018c0 <iunlockput>
80100b67:	e8 84 20 00 00       	call   80102bf0 <end_op>
80100b6c:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100b72:	83 c4 0c             	add    $0xc,%esp
80100b75:	05 ff 0f 00 00       	add    $0xfff,%eax
80100b7a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80100b7f:	8d 90 00 20 00 00    	lea    0x2000(%eax),%edx
80100b85:	52                   	push   %edx
80100b86:	50                   	push   %eax
80100b87:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b8d:	e8 8e 62 00 00       	call   80106e20 <allocuvm>
80100b92:	83 c4 10             	add    $0x10,%esp
80100b95:	85 c0                	test   %eax,%eax
80100b97:	89 c6                	mov    %eax,%esi
80100b99:	75 2a                	jne    80100bc5 <exec+0x1d5>
80100b9b:	83 ec 0c             	sub    $0xc,%esp
80100b9e:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100ba4:	e8 a7 63 00 00       	call   80106f50 <freevm>
80100ba9:	83 c4 10             	add    $0x10,%esp
80100bac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bb1:	e9 9b fe ff ff       	jmp    80100a51 <exec+0x61>
80100bb6:	e8 35 20 00 00       	call   80102bf0 <end_op>
80100bbb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bc0:	e9 8c fe ff ff       	jmp    80100a51 <exec+0x61>
80100bc5:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100bcb:	83 ec 08             	sub    $0x8,%esp
80100bce:	31 ff                	xor    %edi,%edi
80100bd0:	89 f3                	mov    %esi,%ebx
80100bd2:	50                   	push   %eax
80100bd3:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100bd9:	e8 f2 63 00 00       	call   80106fd0 <clearpteu>
80100bde:	8b 45 0c             	mov    0xc(%ebp),%eax
80100be1:	83 c4 10             	add    $0x10,%esp
80100be4:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100bea:	8b 00                	mov    (%eax),%eax
80100bec:	85 c0                	test   %eax,%eax
80100bee:	74 6d                	je     80100c5d <exec+0x26d>
80100bf0:	89 b5 f0 fe ff ff    	mov    %esi,-0x110(%ebp)
80100bf6:	8b b5 f4 fe ff ff    	mov    -0x10c(%ebp),%esi
80100bfc:	eb 07                	jmp    80100c05 <exec+0x215>
80100bfe:	66 90                	xchg   %ax,%ax
80100c00:	83 ff 20             	cmp    $0x20,%edi
80100c03:	74 96                	je     80100b9b <exec+0x1ab>
80100c05:	83 ec 0c             	sub    $0xc,%esp
80100c08:	50                   	push   %eax
80100c09:	e8 c2 3c 00 00       	call   801048d0 <strlen>
80100c0e:	f7 d0                	not    %eax
80100c10:	01 c3                	add    %eax,%ebx
80100c12:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c15:	5a                   	pop    %edx
80100c16:	83 e3 fc             	and    $0xfffffffc,%ebx
80100c19:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c1c:	e8 af 3c 00 00       	call   801048d0 <strlen>
80100c21:	83 c0 01             	add    $0x1,%eax
80100c24:	50                   	push   %eax
80100c25:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c28:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c2b:	53                   	push   %ebx
80100c2c:	56                   	push   %esi
80100c2d:	e8 fe 64 00 00       	call   80107130 <copyout>
80100c32:	83 c4 20             	add    $0x20,%esp
80100c35:	85 c0                	test   %eax,%eax
80100c37:	0f 88 5e ff ff ff    	js     80100b9b <exec+0x1ab>
80100c3d:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c40:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
80100c47:	83 c7 01             	add    $0x1,%edi
80100c4a:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c50:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c53:	85 c0                	test   %eax,%eax
80100c55:	75 a9                	jne    80100c00 <exec+0x210>
80100c57:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c5d:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100c64:	89 d9                	mov    %ebx,%ecx
80100c66:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100c6d:	00 00 00 00 
80100c71:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100c78:	ff ff ff 
80100c7b:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
80100c81:	29 c1                	sub    %eax,%ecx
80100c83:	83 c0 0c             	add    $0xc,%eax
80100c86:	29 c3                	sub    %eax,%ebx
80100c88:	50                   	push   %eax
80100c89:	52                   	push   %edx
80100c8a:	53                   	push   %ebx
80100c8b:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100c91:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
80100c97:	e8 94 64 00 00       	call   80107130 <copyout>
80100c9c:	83 c4 10             	add    $0x10,%esp
80100c9f:	85 c0                	test   %eax,%eax
80100ca1:	0f 88 f4 fe ff ff    	js     80100b9b <exec+0x1ab>
80100ca7:	8b 45 08             	mov    0x8(%ebp),%eax
80100caa:	0f b6 10             	movzbl (%eax),%edx
80100cad:	84 d2                	test   %dl,%dl
80100caf:	74 19                	je     80100cca <exec+0x2da>
80100cb1:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100cb4:	83 c0 01             	add    $0x1,%eax
80100cb7:	80 fa 2f             	cmp    $0x2f,%dl
80100cba:	0f b6 10             	movzbl (%eax),%edx
80100cbd:	0f 44 c8             	cmove  %eax,%ecx
80100cc0:	83 c0 01             	add    $0x1,%eax
80100cc3:	84 d2                	test   %dl,%dl
80100cc5:	75 f0                	jne    80100cb7 <exec+0x2c7>
80100cc7:	89 4d 08             	mov    %ecx,0x8(%ebp)
80100cca:	50                   	push   %eax
80100ccb:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100cd1:	6a 10                	push   $0x10
80100cd3:	ff 75 08             	pushl  0x8(%ebp)
80100cd6:	83 c0 6c             	add    $0x6c,%eax
80100cd9:	50                   	push   %eax
80100cda:	e8 b1 3b 00 00       	call   80104890 <safestrcpy>
80100cdf:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100ce5:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
80100ceb:	8b 78 04             	mov    0x4(%eax),%edi
80100cee:	89 30                	mov    %esi,(%eax)
80100cf0:	89 48 04             	mov    %ecx,0x4(%eax)
80100cf3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100cf9:	8b 8d 3c ff ff ff    	mov    -0xc4(%ebp),%ecx
80100cff:	8b 50 18             	mov    0x18(%eax),%edx
80100d02:	89 4a 38             	mov    %ecx,0x38(%edx)
80100d05:	8b 50 18             	mov    0x18(%eax),%edx
80100d08:	89 5a 44             	mov    %ebx,0x44(%edx)
80100d0b:	c7 40 7c 64 00 00 00 	movl   $0x64,0x7c(%eax)
80100d12:	89 04 24             	mov    %eax,(%esp)
80100d15:	e8 f6 5e 00 00       	call   80106c10 <switchuvm>
80100d1a:	89 3c 24             	mov    %edi,(%esp)
80100d1d:	e8 2e 62 00 00       	call   80106f50 <freevm>
80100d22:	83 c4 10             	add    $0x10,%esp
80100d25:	31 c0                	xor    %eax,%eax
80100d27:	e9 25 fd ff ff       	jmp    80100a51 <exec+0x61>
80100d2c:	66 90                	xchg   %ax,%ax
80100d2e:	66 90                	xchg   %ax,%ax

80100d30 <fileinit>:
80100d30:	55                   	push   %ebp
80100d31:	89 e5                	mov    %esp,%ebp
80100d33:	83 ec 10             	sub    $0x10,%esp
80100d36:	68 69 72 10 80       	push   $0x80107269
80100d3b:	68 e0 ff 10 80       	push   $0x8010ffe0
80100d40:	e8 fb 36 00 00       	call   80104440 <initlock>
80100d45:	83 c4 10             	add    $0x10,%esp
80100d48:	c9                   	leave  
80100d49:	c3                   	ret    
80100d4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d50 <filealloc>:
80100d50:	55                   	push   %ebp
80100d51:	89 e5                	mov    %esp,%ebp
80100d53:	53                   	push   %ebx
80100d54:	bb 14 00 11 80       	mov    $0x80110014,%ebx
80100d59:	83 ec 10             	sub    $0x10,%esp
80100d5c:	68 e0 ff 10 80       	push   $0x8010ffe0
80100d61:	e8 fa 36 00 00       	call   80104460 <acquire>
80100d66:	83 c4 10             	add    $0x10,%esp
80100d69:	eb 10                	jmp    80100d7b <filealloc+0x2b>
80100d6b:	90                   	nop
80100d6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100d70:	83 c3 18             	add    $0x18,%ebx
80100d73:	81 fb 74 09 11 80    	cmp    $0x80110974,%ebx
80100d79:	74 25                	je     80100da0 <filealloc+0x50>
80100d7b:	8b 43 04             	mov    0x4(%ebx),%eax
80100d7e:	85 c0                	test   %eax,%eax
80100d80:	75 ee                	jne    80100d70 <filealloc+0x20>
80100d82:	83 ec 0c             	sub    $0xc,%esp
80100d85:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100d8c:	68 e0 ff 10 80       	push   $0x8010ffe0
80100d91:	e8 aa 38 00 00       	call   80104640 <release>
80100d96:	89 d8                	mov    %ebx,%eax
80100d98:	83 c4 10             	add    $0x10,%esp
80100d9b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100d9e:	c9                   	leave  
80100d9f:	c3                   	ret    
80100da0:	83 ec 0c             	sub    $0xc,%esp
80100da3:	68 e0 ff 10 80       	push   $0x8010ffe0
80100da8:	e8 93 38 00 00       	call   80104640 <release>
80100dad:	83 c4 10             	add    $0x10,%esp
80100db0:	31 c0                	xor    %eax,%eax
80100db2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100db5:	c9                   	leave  
80100db6:	c3                   	ret    
80100db7:	89 f6                	mov    %esi,%esi
80100db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100dc0 <filedup>:
80100dc0:	55                   	push   %ebp
80100dc1:	89 e5                	mov    %esp,%ebp
80100dc3:	53                   	push   %ebx
80100dc4:	83 ec 10             	sub    $0x10,%esp
80100dc7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100dca:	68 e0 ff 10 80       	push   $0x8010ffe0
80100dcf:	e8 8c 36 00 00       	call   80104460 <acquire>
80100dd4:	8b 43 04             	mov    0x4(%ebx),%eax
80100dd7:	83 c4 10             	add    $0x10,%esp
80100dda:	85 c0                	test   %eax,%eax
80100ddc:	7e 1a                	jle    80100df8 <filedup+0x38>
80100dde:	83 c0 01             	add    $0x1,%eax
80100de1:	83 ec 0c             	sub    $0xc,%esp
80100de4:	89 43 04             	mov    %eax,0x4(%ebx)
80100de7:	68 e0 ff 10 80       	push   $0x8010ffe0
80100dec:	e8 4f 38 00 00       	call   80104640 <release>
80100df1:	89 d8                	mov    %ebx,%eax
80100df3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100df6:	c9                   	leave  
80100df7:	c3                   	ret    
80100df8:	83 ec 0c             	sub    $0xc,%esp
80100dfb:	68 70 72 10 80       	push   $0x80107270
80100e00:	e8 6b f5 ff ff       	call   80100370 <panic>
80100e05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e10 <fileclose>:
80100e10:	55                   	push   %ebp
80100e11:	89 e5                	mov    %esp,%ebp
80100e13:	57                   	push   %edi
80100e14:	56                   	push   %esi
80100e15:	53                   	push   %ebx
80100e16:	83 ec 28             	sub    $0x28,%esp
80100e19:	8b 7d 08             	mov    0x8(%ebp),%edi
80100e1c:	68 e0 ff 10 80       	push   $0x8010ffe0
80100e21:	e8 3a 36 00 00       	call   80104460 <acquire>
80100e26:	8b 47 04             	mov    0x4(%edi),%eax
80100e29:	83 c4 10             	add    $0x10,%esp
80100e2c:	85 c0                	test   %eax,%eax
80100e2e:	0f 8e 9b 00 00 00    	jle    80100ecf <fileclose+0xbf>
80100e34:	83 e8 01             	sub    $0x1,%eax
80100e37:	85 c0                	test   %eax,%eax
80100e39:	89 47 04             	mov    %eax,0x4(%edi)
80100e3c:	74 1a                	je     80100e58 <fileclose+0x48>
80100e3e:	c7 45 08 e0 ff 10 80 	movl   $0x8010ffe0,0x8(%ebp)
80100e45:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e48:	5b                   	pop    %ebx
80100e49:	5e                   	pop    %esi
80100e4a:	5f                   	pop    %edi
80100e4b:	5d                   	pop    %ebp
80100e4c:	e9 ef 37 00 00       	jmp    80104640 <release>
80100e51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100e58:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100e5c:	8b 1f                	mov    (%edi),%ebx
80100e5e:	83 ec 0c             	sub    $0xc,%esp
80100e61:	8b 77 0c             	mov    0xc(%edi),%esi
80100e64:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
80100e6a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e6d:	8b 47 10             	mov    0x10(%edi),%eax
80100e70:	68 e0 ff 10 80       	push   $0x8010ffe0
80100e75:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100e78:	e8 c3 37 00 00       	call   80104640 <release>
80100e7d:	83 c4 10             	add    $0x10,%esp
80100e80:	83 fb 01             	cmp    $0x1,%ebx
80100e83:	74 13                	je     80100e98 <fileclose+0x88>
80100e85:	83 fb 02             	cmp    $0x2,%ebx
80100e88:	74 26                	je     80100eb0 <fileclose+0xa0>
80100e8a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e8d:	5b                   	pop    %ebx
80100e8e:	5e                   	pop    %esi
80100e8f:	5f                   	pop    %edi
80100e90:	5d                   	pop    %ebp
80100e91:	c3                   	ret    
80100e92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100e98:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100e9c:	83 ec 08             	sub    $0x8,%esp
80100e9f:	53                   	push   %ebx
80100ea0:	56                   	push   %esi
80100ea1:	e8 7a 25 00 00       	call   80103420 <pipeclose>
80100ea6:	83 c4 10             	add    $0x10,%esp
80100ea9:	eb df                	jmp    80100e8a <fileclose+0x7a>
80100eab:	90                   	nop
80100eac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100eb0:	e8 cb 1c 00 00       	call   80102b80 <begin_op>
80100eb5:	83 ec 0c             	sub    $0xc,%esp
80100eb8:	ff 75 e0             	pushl  -0x20(%ebp)
80100ebb:	e8 c0 08 00 00       	call   80101780 <iput>
80100ec0:	83 c4 10             	add    $0x10,%esp
80100ec3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ec6:	5b                   	pop    %ebx
80100ec7:	5e                   	pop    %esi
80100ec8:	5f                   	pop    %edi
80100ec9:	5d                   	pop    %ebp
80100eca:	e9 21 1d 00 00       	jmp    80102bf0 <end_op>
80100ecf:	83 ec 0c             	sub    $0xc,%esp
80100ed2:	68 78 72 10 80       	push   $0x80107278
80100ed7:	e8 94 f4 ff ff       	call   80100370 <panic>
80100edc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100ee0 <filestat>:
80100ee0:	55                   	push   %ebp
80100ee1:	89 e5                	mov    %esp,%ebp
80100ee3:	53                   	push   %ebx
80100ee4:	83 ec 04             	sub    $0x4,%esp
80100ee7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100eea:	83 3b 02             	cmpl   $0x2,(%ebx)
80100eed:	75 31                	jne    80100f20 <filestat+0x40>
80100eef:	83 ec 0c             	sub    $0xc,%esp
80100ef2:	ff 73 10             	pushl  0x10(%ebx)
80100ef5:	e8 56 07 00 00       	call   80101650 <ilock>
80100efa:	58                   	pop    %eax
80100efb:	5a                   	pop    %edx
80100efc:	ff 75 0c             	pushl  0xc(%ebp)
80100eff:	ff 73 10             	pushl  0x10(%ebx)
80100f02:	e8 d9 09 00 00       	call   801018e0 <stati>
80100f07:	59                   	pop    %ecx
80100f08:	ff 73 10             	pushl  0x10(%ebx)
80100f0b:	e8 20 08 00 00       	call   80101730 <iunlock>
80100f10:	83 c4 10             	add    $0x10,%esp
80100f13:	31 c0                	xor    %eax,%eax
80100f15:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f18:	c9                   	leave  
80100f19:	c3                   	ret    
80100f1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f25:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f28:	c9                   	leave  
80100f29:	c3                   	ret    
80100f2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100f30 <fileread>:
80100f30:	55                   	push   %ebp
80100f31:	89 e5                	mov    %esp,%ebp
80100f33:	57                   	push   %edi
80100f34:	56                   	push   %esi
80100f35:	53                   	push   %ebx
80100f36:	83 ec 0c             	sub    $0xc,%esp
80100f39:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f3c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f3f:	8b 7d 10             	mov    0x10(%ebp),%edi
80100f42:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f46:	74 60                	je     80100fa8 <fileread+0x78>
80100f48:	8b 03                	mov    (%ebx),%eax
80100f4a:	83 f8 01             	cmp    $0x1,%eax
80100f4d:	74 41                	je     80100f90 <fileread+0x60>
80100f4f:	83 f8 02             	cmp    $0x2,%eax
80100f52:	75 5b                	jne    80100faf <fileread+0x7f>
80100f54:	83 ec 0c             	sub    $0xc,%esp
80100f57:	ff 73 10             	pushl  0x10(%ebx)
80100f5a:	e8 f1 06 00 00       	call   80101650 <ilock>
80100f5f:	57                   	push   %edi
80100f60:	ff 73 14             	pushl  0x14(%ebx)
80100f63:	56                   	push   %esi
80100f64:	ff 73 10             	pushl  0x10(%ebx)
80100f67:	e8 a4 09 00 00       	call   80101910 <readi>
80100f6c:	83 c4 20             	add    $0x20,%esp
80100f6f:	85 c0                	test   %eax,%eax
80100f71:	89 c6                	mov    %eax,%esi
80100f73:	7e 03                	jle    80100f78 <fileread+0x48>
80100f75:	01 43 14             	add    %eax,0x14(%ebx)
80100f78:	83 ec 0c             	sub    $0xc,%esp
80100f7b:	ff 73 10             	pushl  0x10(%ebx)
80100f7e:	e8 ad 07 00 00       	call   80101730 <iunlock>
80100f83:	83 c4 10             	add    $0x10,%esp
80100f86:	89 f0                	mov    %esi,%eax
80100f88:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f8b:	5b                   	pop    %ebx
80100f8c:	5e                   	pop    %esi
80100f8d:	5f                   	pop    %edi
80100f8e:	5d                   	pop    %ebp
80100f8f:	c3                   	ret    
80100f90:	8b 43 0c             	mov    0xc(%ebx),%eax
80100f93:	89 45 08             	mov    %eax,0x8(%ebp)
80100f96:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f99:	5b                   	pop    %ebx
80100f9a:	5e                   	pop    %esi
80100f9b:	5f                   	pop    %edi
80100f9c:	5d                   	pop    %ebp
80100f9d:	e9 4e 26 00 00       	jmp    801035f0 <piperead>
80100fa2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100fa8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100fad:	eb d9                	jmp    80100f88 <fileread+0x58>
80100faf:	83 ec 0c             	sub    $0xc,%esp
80100fb2:	68 82 72 10 80       	push   $0x80107282
80100fb7:	e8 b4 f3 ff ff       	call   80100370 <panic>
80100fbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100fc0 <filewrite>:
80100fc0:	55                   	push   %ebp
80100fc1:	89 e5                	mov    %esp,%ebp
80100fc3:	57                   	push   %edi
80100fc4:	56                   	push   %esi
80100fc5:	53                   	push   %ebx
80100fc6:	83 ec 1c             	sub    $0x1c,%esp
80100fc9:	8b 75 08             	mov    0x8(%ebp),%esi
80100fcc:	8b 45 0c             	mov    0xc(%ebp),%eax
80100fcf:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
80100fd3:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100fd6:	8b 45 10             	mov    0x10(%ebp),%eax
80100fd9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100fdc:	0f 84 aa 00 00 00    	je     8010108c <filewrite+0xcc>
80100fe2:	8b 06                	mov    (%esi),%eax
80100fe4:	83 f8 01             	cmp    $0x1,%eax
80100fe7:	0f 84 c2 00 00 00    	je     801010af <filewrite+0xef>
80100fed:	83 f8 02             	cmp    $0x2,%eax
80100ff0:	0f 85 d8 00 00 00    	jne    801010ce <filewrite+0x10e>
80100ff6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100ff9:	31 ff                	xor    %edi,%edi
80100ffb:	85 c0                	test   %eax,%eax
80100ffd:	7f 34                	jg     80101033 <filewrite+0x73>
80100fff:	e9 9c 00 00 00       	jmp    801010a0 <filewrite+0xe0>
80101004:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101008:	01 46 14             	add    %eax,0x14(%esi)
8010100b:	83 ec 0c             	sub    $0xc,%esp
8010100e:	ff 76 10             	pushl  0x10(%esi)
80101011:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101014:	e8 17 07 00 00       	call   80101730 <iunlock>
80101019:	e8 d2 1b 00 00       	call   80102bf0 <end_op>
8010101e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101021:	83 c4 10             	add    $0x10,%esp
80101024:	39 d8                	cmp    %ebx,%eax
80101026:	0f 85 95 00 00 00    	jne    801010c1 <filewrite+0x101>
8010102c:	01 c7                	add    %eax,%edi
8010102e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101031:	7e 6d                	jle    801010a0 <filewrite+0xe0>
80101033:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101036:	b8 00 1a 00 00       	mov    $0x1a00,%eax
8010103b:	29 fb                	sub    %edi,%ebx
8010103d:	81 fb 00 1a 00 00    	cmp    $0x1a00,%ebx
80101043:	0f 4f d8             	cmovg  %eax,%ebx
80101046:	e8 35 1b 00 00       	call   80102b80 <begin_op>
8010104b:	83 ec 0c             	sub    $0xc,%esp
8010104e:	ff 76 10             	pushl  0x10(%esi)
80101051:	e8 fa 05 00 00       	call   80101650 <ilock>
80101056:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101059:	53                   	push   %ebx
8010105a:	ff 76 14             	pushl  0x14(%esi)
8010105d:	01 f8                	add    %edi,%eax
8010105f:	50                   	push   %eax
80101060:	ff 76 10             	pushl  0x10(%esi)
80101063:	e8 a8 09 00 00       	call   80101a10 <writei>
80101068:	83 c4 20             	add    $0x20,%esp
8010106b:	85 c0                	test   %eax,%eax
8010106d:	7f 99                	jg     80101008 <filewrite+0x48>
8010106f:	83 ec 0c             	sub    $0xc,%esp
80101072:	ff 76 10             	pushl  0x10(%esi)
80101075:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101078:	e8 b3 06 00 00       	call   80101730 <iunlock>
8010107d:	e8 6e 1b 00 00       	call   80102bf0 <end_op>
80101082:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101085:	83 c4 10             	add    $0x10,%esp
80101088:	85 c0                	test   %eax,%eax
8010108a:	74 98                	je     80101024 <filewrite+0x64>
8010108c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010108f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101094:	5b                   	pop    %ebx
80101095:	5e                   	pop    %esi
80101096:	5f                   	pop    %edi
80101097:	5d                   	pop    %ebp
80101098:	c3                   	ret    
80101099:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801010a0:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
801010a3:	75 e7                	jne    8010108c <filewrite+0xcc>
801010a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010a8:	89 f8                	mov    %edi,%eax
801010aa:	5b                   	pop    %ebx
801010ab:	5e                   	pop    %esi
801010ac:	5f                   	pop    %edi
801010ad:	5d                   	pop    %ebp
801010ae:	c3                   	ret    
801010af:	8b 46 0c             	mov    0xc(%esi),%eax
801010b2:	89 45 08             	mov    %eax,0x8(%ebp)
801010b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010b8:	5b                   	pop    %ebx
801010b9:	5e                   	pop    %esi
801010ba:	5f                   	pop    %edi
801010bb:	5d                   	pop    %ebp
801010bc:	e9 ff 23 00 00       	jmp    801034c0 <pipewrite>
801010c1:	83 ec 0c             	sub    $0xc,%esp
801010c4:	68 8b 72 10 80       	push   $0x8010728b
801010c9:	e8 a2 f2 ff ff       	call   80100370 <panic>
801010ce:	83 ec 0c             	sub    $0xc,%esp
801010d1:	68 91 72 10 80       	push   $0x80107291
801010d6:	e8 95 f2 ff ff       	call   80100370 <panic>
801010db:	66 90                	xchg   %ax,%ax
801010dd:	66 90                	xchg   %ax,%ax
801010df:	90                   	nop

801010e0 <balloc>:
801010e0:	55                   	push   %ebp
801010e1:	89 e5                	mov    %esp,%ebp
801010e3:	57                   	push   %edi
801010e4:	56                   	push   %esi
801010e5:	53                   	push   %ebx
801010e6:	83 ec 1c             	sub    $0x1c,%esp
801010e9:	8b 0d e0 09 11 80    	mov    0x801109e0,%ecx
801010ef:	89 45 d8             	mov    %eax,-0x28(%ebp)
801010f2:	85 c9                	test   %ecx,%ecx
801010f4:	0f 84 85 00 00 00    	je     8010117f <balloc+0x9f>
801010fa:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
80101101:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101104:	83 ec 08             	sub    $0x8,%esp
80101107:	89 f0                	mov    %esi,%eax
80101109:	c1 f8 0c             	sar    $0xc,%eax
8010110c:	03 05 f8 09 11 80    	add    0x801109f8,%eax
80101112:	50                   	push   %eax
80101113:	ff 75 d8             	pushl  -0x28(%ebp)
80101116:	e8 b5 ef ff ff       	call   801000d0 <bread>
8010111b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010111e:	a1 e0 09 11 80       	mov    0x801109e0,%eax
80101123:	83 c4 10             	add    $0x10,%esp
80101126:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101129:	31 c0                	xor    %eax,%eax
8010112b:	eb 2d                	jmp    8010115a <balloc+0x7a>
8010112d:	8d 76 00             	lea    0x0(%esi),%esi
80101130:	89 c1                	mov    %eax,%ecx
80101132:	ba 01 00 00 00       	mov    $0x1,%edx
80101137:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
8010113a:	83 e1 07             	and    $0x7,%ecx
8010113d:	d3 e2                	shl    %cl,%edx
8010113f:	89 c1                	mov    %eax,%ecx
80101141:	c1 f9 03             	sar    $0x3,%ecx
80101144:	0f b6 7c 0b 5c       	movzbl 0x5c(%ebx,%ecx,1),%edi
80101149:	85 d7                	test   %edx,%edi
8010114b:	74 43                	je     80101190 <balloc+0xb0>
8010114d:	83 c0 01             	add    $0x1,%eax
80101150:	83 c6 01             	add    $0x1,%esi
80101153:	3d 00 10 00 00       	cmp    $0x1000,%eax
80101158:	74 05                	je     8010115f <balloc+0x7f>
8010115a:	3b 75 e0             	cmp    -0x20(%ebp),%esi
8010115d:	72 d1                	jb     80101130 <balloc+0x50>
8010115f:	83 ec 0c             	sub    $0xc,%esp
80101162:	ff 75 e4             	pushl  -0x1c(%ebp)
80101165:	e8 76 f0 ff ff       	call   801001e0 <brelse>
8010116a:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101171:	83 c4 10             	add    $0x10,%esp
80101174:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101177:	39 05 e0 09 11 80    	cmp    %eax,0x801109e0
8010117d:	77 82                	ja     80101101 <balloc+0x21>
8010117f:	83 ec 0c             	sub    $0xc,%esp
80101182:	68 9b 72 10 80       	push   $0x8010729b
80101187:	e8 e4 f1 ff ff       	call   80100370 <panic>
8010118c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101190:	09 fa                	or     %edi,%edx
80101192:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101195:	83 ec 0c             	sub    $0xc,%esp
80101198:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
8010119c:	57                   	push   %edi
8010119d:	e8 be 1b 00 00       	call   80102d60 <log_write>
801011a2:	89 3c 24             	mov    %edi,(%esp)
801011a5:	e8 36 f0 ff ff       	call   801001e0 <brelse>
801011aa:	58                   	pop    %eax
801011ab:	5a                   	pop    %edx
801011ac:	56                   	push   %esi
801011ad:	ff 75 d8             	pushl  -0x28(%ebp)
801011b0:	e8 1b ef ff ff       	call   801000d0 <bread>
801011b5:	89 c3                	mov    %eax,%ebx
801011b7:	8d 40 5c             	lea    0x5c(%eax),%eax
801011ba:	83 c4 0c             	add    $0xc,%esp
801011bd:	68 00 02 00 00       	push   $0x200
801011c2:	6a 00                	push   $0x0
801011c4:	50                   	push   %eax
801011c5:	e8 c6 34 00 00       	call   80104690 <memset>
801011ca:	89 1c 24             	mov    %ebx,(%esp)
801011cd:	e8 8e 1b 00 00       	call   80102d60 <log_write>
801011d2:	89 1c 24             	mov    %ebx,(%esp)
801011d5:	e8 06 f0 ff ff       	call   801001e0 <brelse>
801011da:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011dd:	89 f0                	mov    %esi,%eax
801011df:	5b                   	pop    %ebx
801011e0:	5e                   	pop    %esi
801011e1:	5f                   	pop    %edi
801011e2:	5d                   	pop    %ebp
801011e3:	c3                   	ret    
801011e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801011ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801011f0 <iget>:
801011f0:	55                   	push   %ebp
801011f1:	89 e5                	mov    %esp,%ebp
801011f3:	57                   	push   %edi
801011f4:	56                   	push   %esi
801011f5:	53                   	push   %ebx
801011f6:	89 c7                	mov    %eax,%edi
801011f8:	31 f6                	xor    %esi,%esi
801011fa:	bb 34 0a 11 80       	mov    $0x80110a34,%ebx
801011ff:	83 ec 28             	sub    $0x28,%esp
80101202:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101205:	68 00 0a 11 80       	push   $0x80110a00
8010120a:	e8 51 32 00 00       	call   80104460 <acquire>
8010120f:	83 c4 10             	add    $0x10,%esp
80101212:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101215:	eb 1b                	jmp    80101232 <iget+0x42>
80101217:	89 f6                	mov    %esi,%esi
80101219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101220:	85 f6                	test   %esi,%esi
80101222:	74 44                	je     80101268 <iget+0x78>
80101224:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010122a:	81 fb 54 26 11 80    	cmp    $0x80112654,%ebx
80101230:	74 4e                	je     80101280 <iget+0x90>
80101232:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101235:	85 c9                	test   %ecx,%ecx
80101237:	7e e7                	jle    80101220 <iget+0x30>
80101239:	39 3b                	cmp    %edi,(%ebx)
8010123b:	75 e3                	jne    80101220 <iget+0x30>
8010123d:	39 53 04             	cmp    %edx,0x4(%ebx)
80101240:	75 de                	jne    80101220 <iget+0x30>
80101242:	83 ec 0c             	sub    $0xc,%esp
80101245:	83 c1 01             	add    $0x1,%ecx
80101248:	89 de                	mov    %ebx,%esi
8010124a:	68 00 0a 11 80       	push   $0x80110a00
8010124f:	89 4b 08             	mov    %ecx,0x8(%ebx)
80101252:	e8 e9 33 00 00       	call   80104640 <release>
80101257:	83 c4 10             	add    $0x10,%esp
8010125a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010125d:	89 f0                	mov    %esi,%eax
8010125f:	5b                   	pop    %ebx
80101260:	5e                   	pop    %esi
80101261:	5f                   	pop    %edi
80101262:	5d                   	pop    %ebp
80101263:	c3                   	ret    
80101264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101268:	85 c9                	test   %ecx,%ecx
8010126a:	0f 44 f3             	cmove  %ebx,%esi
8010126d:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101273:	81 fb 54 26 11 80    	cmp    $0x80112654,%ebx
80101279:	75 b7                	jne    80101232 <iget+0x42>
8010127b:	90                   	nop
8010127c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101280:	85 f6                	test   %esi,%esi
80101282:	74 2d                	je     801012b1 <iget+0xc1>
80101284:	83 ec 0c             	sub    $0xc,%esp
80101287:	89 3e                	mov    %edi,(%esi)
80101289:	89 56 04             	mov    %edx,0x4(%esi)
8010128c:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
80101293:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
8010129a:	68 00 0a 11 80       	push   $0x80110a00
8010129f:	e8 9c 33 00 00       	call   80104640 <release>
801012a4:	83 c4 10             	add    $0x10,%esp
801012a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012aa:	89 f0                	mov    %esi,%eax
801012ac:	5b                   	pop    %ebx
801012ad:	5e                   	pop    %esi
801012ae:	5f                   	pop    %edi
801012af:	5d                   	pop    %ebp
801012b0:	c3                   	ret    
801012b1:	83 ec 0c             	sub    $0xc,%esp
801012b4:	68 b1 72 10 80       	push   $0x801072b1
801012b9:	e8 b2 f0 ff ff       	call   80100370 <panic>
801012be:	66 90                	xchg   %ax,%ax

801012c0 <bmap>:
801012c0:	55                   	push   %ebp
801012c1:	89 e5                	mov    %esp,%ebp
801012c3:	57                   	push   %edi
801012c4:	56                   	push   %esi
801012c5:	53                   	push   %ebx
801012c6:	89 c6                	mov    %eax,%esi
801012c8:	83 ec 1c             	sub    $0x1c,%esp
801012cb:	83 fa 0b             	cmp    $0xb,%edx
801012ce:	77 18                	ja     801012e8 <bmap+0x28>
801012d0:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
801012d3:	8b 43 5c             	mov    0x5c(%ebx),%eax
801012d6:	85 c0                	test   %eax,%eax
801012d8:	74 76                	je     80101350 <bmap+0x90>
801012da:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012dd:	5b                   	pop    %ebx
801012de:	5e                   	pop    %esi
801012df:	5f                   	pop    %edi
801012e0:	5d                   	pop    %ebp
801012e1:	c3                   	ret    
801012e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801012e8:	8d 5a f4             	lea    -0xc(%edx),%ebx
801012eb:	83 fb 7f             	cmp    $0x7f,%ebx
801012ee:	0f 87 83 00 00 00    	ja     80101377 <bmap+0xb7>
801012f4:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
801012fa:	85 c0                	test   %eax,%eax
801012fc:	74 6a                	je     80101368 <bmap+0xa8>
801012fe:	83 ec 08             	sub    $0x8,%esp
80101301:	50                   	push   %eax
80101302:	ff 36                	pushl  (%esi)
80101304:	e8 c7 ed ff ff       	call   801000d0 <bread>
80101309:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010130d:	83 c4 10             	add    $0x10,%esp
80101310:	89 c7                	mov    %eax,%edi
80101312:	8b 1a                	mov    (%edx),%ebx
80101314:	85 db                	test   %ebx,%ebx
80101316:	75 1d                	jne    80101335 <bmap+0x75>
80101318:	8b 06                	mov    (%esi),%eax
8010131a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010131d:	e8 be fd ff ff       	call   801010e0 <balloc>
80101322:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101325:	83 ec 0c             	sub    $0xc,%esp
80101328:	89 c3                	mov    %eax,%ebx
8010132a:	89 02                	mov    %eax,(%edx)
8010132c:	57                   	push   %edi
8010132d:	e8 2e 1a 00 00       	call   80102d60 <log_write>
80101332:	83 c4 10             	add    $0x10,%esp
80101335:	83 ec 0c             	sub    $0xc,%esp
80101338:	57                   	push   %edi
80101339:	e8 a2 ee ff ff       	call   801001e0 <brelse>
8010133e:	83 c4 10             	add    $0x10,%esp
80101341:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101344:	89 d8                	mov    %ebx,%eax
80101346:	5b                   	pop    %ebx
80101347:	5e                   	pop    %esi
80101348:	5f                   	pop    %edi
80101349:	5d                   	pop    %ebp
8010134a:	c3                   	ret    
8010134b:	90                   	nop
8010134c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101350:	8b 06                	mov    (%esi),%eax
80101352:	e8 89 fd ff ff       	call   801010e0 <balloc>
80101357:	89 43 5c             	mov    %eax,0x5c(%ebx)
8010135a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010135d:	5b                   	pop    %ebx
8010135e:	5e                   	pop    %esi
8010135f:	5f                   	pop    %edi
80101360:	5d                   	pop    %ebp
80101361:	c3                   	ret    
80101362:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101368:	8b 06                	mov    (%esi),%eax
8010136a:	e8 71 fd ff ff       	call   801010e0 <balloc>
8010136f:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
80101375:	eb 87                	jmp    801012fe <bmap+0x3e>
80101377:	83 ec 0c             	sub    $0xc,%esp
8010137a:	68 c1 72 10 80       	push   $0x801072c1
8010137f:	e8 ec ef ff ff       	call   80100370 <panic>
80101384:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010138a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101390 <readsb>:
80101390:	55                   	push   %ebp
80101391:	89 e5                	mov    %esp,%ebp
80101393:	56                   	push   %esi
80101394:	53                   	push   %ebx
80101395:	8b 75 0c             	mov    0xc(%ebp),%esi
80101398:	83 ec 08             	sub    $0x8,%esp
8010139b:	6a 01                	push   $0x1
8010139d:	ff 75 08             	pushl  0x8(%ebp)
801013a0:	e8 2b ed ff ff       	call   801000d0 <bread>
801013a5:	89 c3                	mov    %eax,%ebx
801013a7:	8d 40 5c             	lea    0x5c(%eax),%eax
801013aa:	83 c4 0c             	add    $0xc,%esp
801013ad:	6a 1c                	push   $0x1c
801013af:	50                   	push   %eax
801013b0:	56                   	push   %esi
801013b1:	e8 8a 33 00 00       	call   80104740 <memmove>
801013b6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801013b9:	83 c4 10             	add    $0x10,%esp
801013bc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801013bf:	5b                   	pop    %ebx
801013c0:	5e                   	pop    %esi
801013c1:	5d                   	pop    %ebp
801013c2:	e9 19 ee ff ff       	jmp    801001e0 <brelse>
801013c7:	89 f6                	mov    %esi,%esi
801013c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801013d0 <bfree>:
801013d0:	55                   	push   %ebp
801013d1:	89 e5                	mov    %esp,%ebp
801013d3:	56                   	push   %esi
801013d4:	53                   	push   %ebx
801013d5:	89 d3                	mov    %edx,%ebx
801013d7:	89 c6                	mov    %eax,%esi
801013d9:	83 ec 08             	sub    $0x8,%esp
801013dc:	68 e0 09 11 80       	push   $0x801109e0
801013e1:	50                   	push   %eax
801013e2:	e8 a9 ff ff ff       	call   80101390 <readsb>
801013e7:	58                   	pop    %eax
801013e8:	5a                   	pop    %edx
801013e9:	89 da                	mov    %ebx,%edx
801013eb:	c1 ea 0c             	shr    $0xc,%edx
801013ee:	03 15 f8 09 11 80    	add    0x801109f8,%edx
801013f4:	52                   	push   %edx
801013f5:	56                   	push   %esi
801013f6:	e8 d5 ec ff ff       	call   801000d0 <bread>
801013fb:	89 d9                	mov    %ebx,%ecx
801013fd:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80101403:	ba 01 00 00 00       	mov    $0x1,%edx
80101408:	83 e1 07             	and    $0x7,%ecx
8010140b:	c1 fb 03             	sar    $0x3,%ebx
8010140e:	83 c4 10             	add    $0x10,%esp
80101411:	d3 e2                	shl    %cl,%edx
80101413:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101418:	85 d1                	test   %edx,%ecx
8010141a:	74 27                	je     80101443 <bfree+0x73>
8010141c:	89 c6                	mov    %eax,%esi
8010141e:	f7 d2                	not    %edx
80101420:	89 c8                	mov    %ecx,%eax
80101422:	83 ec 0c             	sub    $0xc,%esp
80101425:	21 d0                	and    %edx,%eax
80101427:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
8010142b:	56                   	push   %esi
8010142c:	e8 2f 19 00 00       	call   80102d60 <log_write>
80101431:	89 34 24             	mov    %esi,(%esp)
80101434:	e8 a7 ed ff ff       	call   801001e0 <brelse>
80101439:	83 c4 10             	add    $0x10,%esp
8010143c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010143f:	5b                   	pop    %ebx
80101440:	5e                   	pop    %esi
80101441:	5d                   	pop    %ebp
80101442:	c3                   	ret    
80101443:	83 ec 0c             	sub    $0xc,%esp
80101446:	68 d4 72 10 80       	push   $0x801072d4
8010144b:	e8 20 ef ff ff       	call   80100370 <panic>

80101450 <iinit>:
80101450:	55                   	push   %ebp
80101451:	89 e5                	mov    %esp,%ebp
80101453:	53                   	push   %ebx
80101454:	bb 40 0a 11 80       	mov    $0x80110a40,%ebx
80101459:	83 ec 0c             	sub    $0xc,%esp
8010145c:	68 e7 72 10 80       	push   $0x801072e7
80101461:	68 00 0a 11 80       	push   $0x80110a00
80101466:	e8 d5 2f 00 00       	call   80104440 <initlock>
8010146b:	83 c4 10             	add    $0x10,%esp
8010146e:	66 90                	xchg   %ax,%ax
80101470:	83 ec 08             	sub    $0x8,%esp
80101473:	68 ee 72 10 80       	push   $0x801072ee
80101478:	53                   	push   %ebx
80101479:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010147f:	e8 ac 2e 00 00       	call   80104330 <initsleeplock>
80101484:	83 c4 10             	add    $0x10,%esp
80101487:	81 fb 60 26 11 80    	cmp    $0x80112660,%ebx
8010148d:	75 e1                	jne    80101470 <iinit+0x20>
8010148f:	83 ec 08             	sub    $0x8,%esp
80101492:	68 e0 09 11 80       	push   $0x801109e0
80101497:	ff 75 08             	pushl  0x8(%ebp)
8010149a:	e8 f1 fe ff ff       	call   80101390 <readsb>
8010149f:	ff 35 f8 09 11 80    	pushl  0x801109f8
801014a5:	ff 35 f4 09 11 80    	pushl  0x801109f4
801014ab:	ff 35 f0 09 11 80    	pushl  0x801109f0
801014b1:	ff 35 ec 09 11 80    	pushl  0x801109ec
801014b7:	ff 35 e8 09 11 80    	pushl  0x801109e8
801014bd:	ff 35 e4 09 11 80    	pushl  0x801109e4
801014c3:	ff 35 e0 09 11 80    	pushl  0x801109e0
801014c9:	68 44 73 10 80       	push   $0x80107344
801014ce:	e8 8d f1 ff ff       	call   80100660 <cprintf>
801014d3:	83 c4 30             	add    $0x30,%esp
801014d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801014d9:	c9                   	leave  
801014da:	c3                   	ret    
801014db:	90                   	nop
801014dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801014e0 <ialloc>:
801014e0:	55                   	push   %ebp
801014e1:	89 e5                	mov    %esp,%ebp
801014e3:	57                   	push   %edi
801014e4:	56                   	push   %esi
801014e5:	53                   	push   %ebx
801014e6:	83 ec 1c             	sub    $0x1c,%esp
801014e9:	83 3d e8 09 11 80 01 	cmpl   $0x1,0x801109e8
801014f0:	8b 45 0c             	mov    0xc(%ebp),%eax
801014f3:	8b 75 08             	mov    0x8(%ebp),%esi
801014f6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801014f9:	0f 86 91 00 00 00    	jbe    80101590 <ialloc+0xb0>
801014ff:	bb 01 00 00 00       	mov    $0x1,%ebx
80101504:	eb 21                	jmp    80101527 <ialloc+0x47>
80101506:	8d 76 00             	lea    0x0(%esi),%esi
80101509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101510:	83 ec 0c             	sub    $0xc,%esp
80101513:	83 c3 01             	add    $0x1,%ebx
80101516:	57                   	push   %edi
80101517:	e8 c4 ec ff ff       	call   801001e0 <brelse>
8010151c:	83 c4 10             	add    $0x10,%esp
8010151f:	39 1d e8 09 11 80    	cmp    %ebx,0x801109e8
80101525:	76 69                	jbe    80101590 <ialloc+0xb0>
80101527:	89 d8                	mov    %ebx,%eax
80101529:	83 ec 08             	sub    $0x8,%esp
8010152c:	c1 e8 03             	shr    $0x3,%eax
8010152f:	03 05 f4 09 11 80    	add    0x801109f4,%eax
80101535:	50                   	push   %eax
80101536:	56                   	push   %esi
80101537:	e8 94 eb ff ff       	call   801000d0 <bread>
8010153c:	89 c7                	mov    %eax,%edi
8010153e:	89 d8                	mov    %ebx,%eax
80101540:	83 c4 10             	add    $0x10,%esp
80101543:	83 e0 07             	and    $0x7,%eax
80101546:	c1 e0 06             	shl    $0x6,%eax
80101549:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
8010154d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101551:	75 bd                	jne    80101510 <ialloc+0x30>
80101553:	83 ec 04             	sub    $0x4,%esp
80101556:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101559:	6a 40                	push   $0x40
8010155b:	6a 00                	push   $0x0
8010155d:	51                   	push   %ecx
8010155e:	e8 2d 31 00 00       	call   80104690 <memset>
80101563:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101567:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010156a:	66 89 01             	mov    %ax,(%ecx)
8010156d:	89 3c 24             	mov    %edi,(%esp)
80101570:	e8 eb 17 00 00       	call   80102d60 <log_write>
80101575:	89 3c 24             	mov    %edi,(%esp)
80101578:	e8 63 ec ff ff       	call   801001e0 <brelse>
8010157d:	83 c4 10             	add    $0x10,%esp
80101580:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101583:	89 da                	mov    %ebx,%edx
80101585:	89 f0                	mov    %esi,%eax
80101587:	5b                   	pop    %ebx
80101588:	5e                   	pop    %esi
80101589:	5f                   	pop    %edi
8010158a:	5d                   	pop    %ebp
8010158b:	e9 60 fc ff ff       	jmp    801011f0 <iget>
80101590:	83 ec 0c             	sub    $0xc,%esp
80101593:	68 f4 72 10 80       	push   $0x801072f4
80101598:	e8 d3 ed ff ff       	call   80100370 <panic>
8010159d:	8d 76 00             	lea    0x0(%esi),%esi

801015a0 <iupdate>:
801015a0:	55                   	push   %ebp
801015a1:	89 e5                	mov    %esp,%ebp
801015a3:	56                   	push   %esi
801015a4:	53                   	push   %ebx
801015a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801015a8:	83 ec 08             	sub    $0x8,%esp
801015ab:	8b 43 04             	mov    0x4(%ebx),%eax
801015ae:	83 c3 5c             	add    $0x5c,%ebx
801015b1:	c1 e8 03             	shr    $0x3,%eax
801015b4:	03 05 f4 09 11 80    	add    0x801109f4,%eax
801015ba:	50                   	push   %eax
801015bb:	ff 73 a4             	pushl  -0x5c(%ebx)
801015be:	e8 0d eb ff ff       	call   801000d0 <bread>
801015c3:	89 c6                	mov    %eax,%esi
801015c5:	8b 43 a8             	mov    -0x58(%ebx),%eax
801015c8:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
801015cc:	83 c4 0c             	add    $0xc,%esp
801015cf:	83 e0 07             	and    $0x7,%eax
801015d2:	c1 e0 06             	shl    $0x6,%eax
801015d5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801015d9:	66 89 10             	mov    %dx,(%eax)
801015dc:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
801015e0:	83 c0 0c             	add    $0xc,%eax
801015e3:	66 89 50 f6          	mov    %dx,-0xa(%eax)
801015e7:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
801015eb:	66 89 50 f8          	mov    %dx,-0x8(%eax)
801015ef:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
801015f3:	66 89 50 fa          	mov    %dx,-0x6(%eax)
801015f7:	8b 53 fc             	mov    -0x4(%ebx),%edx
801015fa:	89 50 fc             	mov    %edx,-0x4(%eax)
801015fd:	6a 34                	push   $0x34
801015ff:	53                   	push   %ebx
80101600:	50                   	push   %eax
80101601:	e8 3a 31 00 00       	call   80104740 <memmove>
80101606:	89 34 24             	mov    %esi,(%esp)
80101609:	e8 52 17 00 00       	call   80102d60 <log_write>
8010160e:	89 75 08             	mov    %esi,0x8(%ebp)
80101611:	83 c4 10             	add    $0x10,%esp
80101614:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101617:	5b                   	pop    %ebx
80101618:	5e                   	pop    %esi
80101619:	5d                   	pop    %ebp
8010161a:	e9 c1 eb ff ff       	jmp    801001e0 <brelse>
8010161f:	90                   	nop

80101620 <idup>:
80101620:	55                   	push   %ebp
80101621:	89 e5                	mov    %esp,%ebp
80101623:	53                   	push   %ebx
80101624:	83 ec 10             	sub    $0x10,%esp
80101627:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010162a:	68 00 0a 11 80       	push   $0x80110a00
8010162f:	e8 2c 2e 00 00       	call   80104460 <acquire>
80101634:	83 43 08 01          	addl   $0x1,0x8(%ebx)
80101638:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010163f:	e8 fc 2f 00 00       	call   80104640 <release>
80101644:	89 d8                	mov    %ebx,%eax
80101646:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101649:	c9                   	leave  
8010164a:	c3                   	ret    
8010164b:	90                   	nop
8010164c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101650 <ilock>:
80101650:	55                   	push   %ebp
80101651:	89 e5                	mov    %esp,%ebp
80101653:	56                   	push   %esi
80101654:	53                   	push   %ebx
80101655:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101658:	85 db                	test   %ebx,%ebx
8010165a:	0f 84 b4 00 00 00    	je     80101714 <ilock+0xc4>
80101660:	8b 43 08             	mov    0x8(%ebx),%eax
80101663:	85 c0                	test   %eax,%eax
80101665:	0f 8e a9 00 00 00    	jle    80101714 <ilock+0xc4>
8010166b:	8d 43 0c             	lea    0xc(%ebx),%eax
8010166e:	83 ec 0c             	sub    $0xc,%esp
80101671:	50                   	push   %eax
80101672:	e8 f9 2c 00 00       	call   80104370 <acquiresleep>
80101677:	83 c4 10             	add    $0x10,%esp
8010167a:	f6 43 4c 02          	testb  $0x2,0x4c(%ebx)
8010167e:	74 10                	je     80101690 <ilock+0x40>
80101680:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101683:	5b                   	pop    %ebx
80101684:	5e                   	pop    %esi
80101685:	5d                   	pop    %ebp
80101686:	c3                   	ret    
80101687:	89 f6                	mov    %esi,%esi
80101689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101690:	8b 43 04             	mov    0x4(%ebx),%eax
80101693:	83 ec 08             	sub    $0x8,%esp
80101696:	c1 e8 03             	shr    $0x3,%eax
80101699:	03 05 f4 09 11 80    	add    0x801109f4,%eax
8010169f:	50                   	push   %eax
801016a0:	ff 33                	pushl  (%ebx)
801016a2:	e8 29 ea ff ff       	call   801000d0 <bread>
801016a7:	89 c6                	mov    %eax,%esi
801016a9:	8b 43 04             	mov    0x4(%ebx),%eax
801016ac:	83 c4 0c             	add    $0xc,%esp
801016af:	83 e0 07             	and    $0x7,%eax
801016b2:	c1 e0 06             	shl    $0x6,%eax
801016b5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801016b9:	0f b7 10             	movzwl (%eax),%edx
801016bc:	83 c0 0c             	add    $0xc,%eax
801016bf:	66 89 53 50          	mov    %dx,0x50(%ebx)
801016c3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801016c7:	66 89 53 52          	mov    %dx,0x52(%ebx)
801016cb:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801016cf:	66 89 53 54          	mov    %dx,0x54(%ebx)
801016d3:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
801016d7:	66 89 53 56          	mov    %dx,0x56(%ebx)
801016db:	8b 50 fc             	mov    -0x4(%eax),%edx
801016de:	89 53 58             	mov    %edx,0x58(%ebx)
801016e1:	6a 34                	push   $0x34
801016e3:	50                   	push   %eax
801016e4:	8d 43 5c             	lea    0x5c(%ebx),%eax
801016e7:	50                   	push   %eax
801016e8:	e8 53 30 00 00       	call   80104740 <memmove>
801016ed:	89 34 24             	mov    %esi,(%esp)
801016f0:	e8 eb ea ff ff       	call   801001e0 <brelse>
801016f5:	83 4b 4c 02          	orl    $0x2,0x4c(%ebx)
801016f9:	83 c4 10             	add    $0x10,%esp
801016fc:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
80101701:	0f 85 79 ff ff ff    	jne    80101680 <ilock+0x30>
80101707:	83 ec 0c             	sub    $0xc,%esp
8010170a:	68 0c 73 10 80       	push   $0x8010730c
8010170f:	e8 5c ec ff ff       	call   80100370 <panic>
80101714:	83 ec 0c             	sub    $0xc,%esp
80101717:	68 06 73 10 80       	push   $0x80107306
8010171c:	e8 4f ec ff ff       	call   80100370 <panic>
80101721:	eb 0d                	jmp    80101730 <iunlock>
80101723:	90                   	nop
80101724:	90                   	nop
80101725:	90                   	nop
80101726:	90                   	nop
80101727:	90                   	nop
80101728:	90                   	nop
80101729:	90                   	nop
8010172a:	90                   	nop
8010172b:	90                   	nop
8010172c:	90                   	nop
8010172d:	90                   	nop
8010172e:	90                   	nop
8010172f:	90                   	nop

80101730 <iunlock>:
80101730:	55                   	push   %ebp
80101731:	89 e5                	mov    %esp,%ebp
80101733:	56                   	push   %esi
80101734:	53                   	push   %ebx
80101735:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101738:	85 db                	test   %ebx,%ebx
8010173a:	74 28                	je     80101764 <iunlock+0x34>
8010173c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010173f:	83 ec 0c             	sub    $0xc,%esp
80101742:	56                   	push   %esi
80101743:	e8 c8 2c 00 00       	call   80104410 <holdingsleep>
80101748:	83 c4 10             	add    $0x10,%esp
8010174b:	85 c0                	test   %eax,%eax
8010174d:	74 15                	je     80101764 <iunlock+0x34>
8010174f:	8b 43 08             	mov    0x8(%ebx),%eax
80101752:	85 c0                	test   %eax,%eax
80101754:	7e 0e                	jle    80101764 <iunlock+0x34>
80101756:	89 75 08             	mov    %esi,0x8(%ebp)
80101759:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010175c:	5b                   	pop    %ebx
8010175d:	5e                   	pop    %esi
8010175e:	5d                   	pop    %ebp
8010175f:	e9 6c 2c 00 00       	jmp    801043d0 <releasesleep>
80101764:	83 ec 0c             	sub    $0xc,%esp
80101767:	68 1b 73 10 80       	push   $0x8010731b
8010176c:	e8 ff eb ff ff       	call   80100370 <panic>
80101771:	eb 0d                	jmp    80101780 <iput>
80101773:	90                   	nop
80101774:	90                   	nop
80101775:	90                   	nop
80101776:	90                   	nop
80101777:	90                   	nop
80101778:	90                   	nop
80101779:	90                   	nop
8010177a:	90                   	nop
8010177b:	90                   	nop
8010177c:	90                   	nop
8010177d:	90                   	nop
8010177e:	90                   	nop
8010177f:	90                   	nop

80101780 <iput>:
80101780:	55                   	push   %ebp
80101781:	89 e5                	mov    %esp,%ebp
80101783:	57                   	push   %edi
80101784:	56                   	push   %esi
80101785:	53                   	push   %ebx
80101786:	83 ec 28             	sub    $0x28,%esp
80101789:	8b 75 08             	mov    0x8(%ebp),%esi
8010178c:	68 00 0a 11 80       	push   $0x80110a00
80101791:	e8 ca 2c 00 00       	call   80104460 <acquire>
80101796:	8b 46 08             	mov    0x8(%esi),%eax
80101799:	83 c4 10             	add    $0x10,%esp
8010179c:	83 f8 01             	cmp    $0x1,%eax
8010179f:	74 1f                	je     801017c0 <iput+0x40>
801017a1:	83 e8 01             	sub    $0x1,%eax
801017a4:	89 46 08             	mov    %eax,0x8(%esi)
801017a7:	c7 45 08 00 0a 11 80 	movl   $0x80110a00,0x8(%ebp)
801017ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
801017b1:	5b                   	pop    %ebx
801017b2:	5e                   	pop    %esi
801017b3:	5f                   	pop    %edi
801017b4:	5d                   	pop    %ebp
801017b5:	e9 86 2e 00 00       	jmp    80104640 <release>
801017ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801017c0:	f6 46 4c 02          	testb  $0x2,0x4c(%esi)
801017c4:	74 db                	je     801017a1 <iput+0x21>
801017c6:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
801017cb:	75 d4                	jne    801017a1 <iput+0x21>
801017cd:	83 ec 0c             	sub    $0xc,%esp
801017d0:	8d 5e 5c             	lea    0x5c(%esi),%ebx
801017d3:	8d be 8c 00 00 00    	lea    0x8c(%esi),%edi
801017d9:	68 00 0a 11 80       	push   $0x80110a00
801017de:	e8 5d 2e 00 00       	call   80104640 <release>
801017e3:	83 c4 10             	add    $0x10,%esp
801017e6:	eb 0f                	jmp    801017f7 <iput+0x77>
801017e8:	90                   	nop
801017e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801017f0:	83 c3 04             	add    $0x4,%ebx
801017f3:	39 fb                	cmp    %edi,%ebx
801017f5:	74 19                	je     80101810 <iput+0x90>
801017f7:	8b 13                	mov    (%ebx),%edx
801017f9:	85 d2                	test   %edx,%edx
801017fb:	74 f3                	je     801017f0 <iput+0x70>
801017fd:	8b 06                	mov    (%esi),%eax
801017ff:	e8 cc fb ff ff       	call   801013d0 <bfree>
80101804:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010180a:	eb e4                	jmp    801017f0 <iput+0x70>
8010180c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101810:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101816:	85 c0                	test   %eax,%eax
80101818:	75 46                	jne    80101860 <iput+0xe0>
8010181a:	83 ec 0c             	sub    $0xc,%esp
8010181d:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
80101824:	56                   	push   %esi
80101825:	e8 76 fd ff ff       	call   801015a0 <iupdate>
8010182a:	31 c0                	xor    %eax,%eax
8010182c:	66 89 46 50          	mov    %ax,0x50(%esi)
80101830:	89 34 24             	mov    %esi,(%esp)
80101833:	e8 68 fd ff ff       	call   801015a0 <iupdate>
80101838:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010183f:	e8 1c 2c 00 00       	call   80104460 <acquire>
80101844:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
8010184b:	8b 46 08             	mov    0x8(%esi),%eax
8010184e:	83 c4 10             	add    $0x10,%esp
80101851:	e9 4b ff ff ff       	jmp    801017a1 <iput+0x21>
80101856:	8d 76 00             	lea    0x0(%esi),%esi
80101859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101860:	83 ec 08             	sub    $0x8,%esp
80101863:	50                   	push   %eax
80101864:	ff 36                	pushl  (%esi)
80101866:	e8 65 e8 ff ff       	call   801000d0 <bread>
8010186b:	83 c4 10             	add    $0x10,%esp
8010186e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101871:	8d 58 5c             	lea    0x5c(%eax),%ebx
80101874:	8d b8 5c 02 00 00    	lea    0x25c(%eax),%edi
8010187a:	eb 0b                	jmp    80101887 <iput+0x107>
8010187c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101880:	83 c3 04             	add    $0x4,%ebx
80101883:	39 df                	cmp    %ebx,%edi
80101885:	74 0f                	je     80101896 <iput+0x116>
80101887:	8b 13                	mov    (%ebx),%edx
80101889:	85 d2                	test   %edx,%edx
8010188b:	74 f3                	je     80101880 <iput+0x100>
8010188d:	8b 06                	mov    (%esi),%eax
8010188f:	e8 3c fb ff ff       	call   801013d0 <bfree>
80101894:	eb ea                	jmp    80101880 <iput+0x100>
80101896:	83 ec 0c             	sub    $0xc,%esp
80101899:	ff 75 e4             	pushl  -0x1c(%ebp)
8010189c:	e8 3f e9 ff ff       	call   801001e0 <brelse>
801018a1:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
801018a7:	8b 06                	mov    (%esi),%eax
801018a9:	e8 22 fb ff ff       	call   801013d0 <bfree>
801018ae:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
801018b5:	00 00 00 
801018b8:	83 c4 10             	add    $0x10,%esp
801018bb:	e9 5a ff ff ff       	jmp    8010181a <iput+0x9a>

801018c0 <iunlockput>:
801018c0:	55                   	push   %ebp
801018c1:	89 e5                	mov    %esp,%ebp
801018c3:	53                   	push   %ebx
801018c4:	83 ec 10             	sub    $0x10,%esp
801018c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801018ca:	53                   	push   %ebx
801018cb:	e8 60 fe ff ff       	call   80101730 <iunlock>
801018d0:	89 5d 08             	mov    %ebx,0x8(%ebp)
801018d3:	83 c4 10             	add    $0x10,%esp
801018d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801018d9:	c9                   	leave  
801018da:	e9 a1 fe ff ff       	jmp    80101780 <iput>
801018df:	90                   	nop

801018e0 <stati>:
801018e0:	55                   	push   %ebp
801018e1:	89 e5                	mov    %esp,%ebp
801018e3:	8b 55 08             	mov    0x8(%ebp),%edx
801018e6:	8b 45 0c             	mov    0xc(%ebp),%eax
801018e9:	8b 0a                	mov    (%edx),%ecx
801018eb:	89 48 04             	mov    %ecx,0x4(%eax)
801018ee:	8b 4a 04             	mov    0x4(%edx),%ecx
801018f1:	89 48 08             	mov    %ecx,0x8(%eax)
801018f4:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
801018f8:	66 89 08             	mov    %cx,(%eax)
801018fb:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
801018ff:	66 89 48 0c          	mov    %cx,0xc(%eax)
80101903:	8b 52 58             	mov    0x58(%edx),%edx
80101906:	89 50 10             	mov    %edx,0x10(%eax)
80101909:	5d                   	pop    %ebp
8010190a:	c3                   	ret    
8010190b:	90                   	nop
8010190c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101910 <readi>:
80101910:	55                   	push   %ebp
80101911:	89 e5                	mov    %esp,%ebp
80101913:	57                   	push   %edi
80101914:	56                   	push   %esi
80101915:	53                   	push   %ebx
80101916:	83 ec 1c             	sub    $0x1c,%esp
80101919:	8b 45 08             	mov    0x8(%ebp),%eax
8010191c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010191f:	8b 75 10             	mov    0x10(%ebp),%esi
80101922:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101927:	89 7d e0             	mov    %edi,-0x20(%ebp)
8010192a:	8b 7d 14             	mov    0x14(%ebp),%edi
8010192d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101930:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101933:	0f 84 a7 00 00 00    	je     801019e0 <readi+0xd0>
80101939:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010193c:	8b 40 58             	mov    0x58(%eax),%eax
8010193f:	39 f0                	cmp    %esi,%eax
80101941:	0f 82 c1 00 00 00    	jb     80101a08 <readi+0xf8>
80101947:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010194a:	89 fa                	mov    %edi,%edx
8010194c:	01 f2                	add    %esi,%edx
8010194e:	0f 82 b4 00 00 00    	jb     80101a08 <readi+0xf8>
80101954:	89 c1                	mov    %eax,%ecx
80101956:	29 f1                	sub    %esi,%ecx
80101958:	39 d0                	cmp    %edx,%eax
8010195a:	0f 43 cf             	cmovae %edi,%ecx
8010195d:	31 ff                	xor    %edi,%edi
8010195f:	85 c9                	test   %ecx,%ecx
80101961:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101964:	74 6d                	je     801019d3 <readi+0xc3>
80101966:	8d 76 00             	lea    0x0(%esi),%esi
80101969:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101970:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80101973:	89 f2                	mov    %esi,%edx
80101975:	c1 ea 09             	shr    $0x9,%edx
80101978:	89 d8                	mov    %ebx,%eax
8010197a:	e8 41 f9 ff ff       	call   801012c0 <bmap>
8010197f:	83 ec 08             	sub    $0x8,%esp
80101982:	50                   	push   %eax
80101983:	ff 33                	pushl  (%ebx)
80101985:	bb 00 02 00 00       	mov    $0x200,%ebx
8010198a:	e8 41 e7 ff ff       	call   801000d0 <bread>
8010198f:	89 c2                	mov    %eax,%edx
80101991:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101994:	89 f1                	mov    %esi,%ecx
80101996:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
8010199c:	83 c4 0c             	add    $0xc,%esp
8010199f:	89 55 dc             	mov    %edx,-0x24(%ebp)
801019a2:	29 cb                	sub    %ecx,%ebx
801019a4:	29 f8                	sub    %edi,%eax
801019a6:	39 c3                	cmp    %eax,%ebx
801019a8:	0f 47 d8             	cmova  %eax,%ebx
801019ab:	8d 44 0a 5c          	lea    0x5c(%edx,%ecx,1),%eax
801019af:	53                   	push   %ebx
801019b0:	01 df                	add    %ebx,%edi
801019b2:	01 de                	add    %ebx,%esi
801019b4:	50                   	push   %eax
801019b5:	ff 75 e0             	pushl  -0x20(%ebp)
801019b8:	e8 83 2d 00 00       	call   80104740 <memmove>
801019bd:	8b 55 dc             	mov    -0x24(%ebp),%edx
801019c0:	89 14 24             	mov    %edx,(%esp)
801019c3:	e8 18 e8 ff ff       	call   801001e0 <brelse>
801019c8:	01 5d e0             	add    %ebx,-0x20(%ebp)
801019cb:	83 c4 10             	add    $0x10,%esp
801019ce:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
801019d1:	77 9d                	ja     80101970 <readi+0x60>
801019d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801019d6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801019d9:	5b                   	pop    %ebx
801019da:	5e                   	pop    %esi
801019db:	5f                   	pop    %edi
801019dc:	5d                   	pop    %ebp
801019dd:	c3                   	ret    
801019de:	66 90                	xchg   %ax,%ax
801019e0:	0f bf 40 52          	movswl 0x52(%eax),%eax
801019e4:	66 83 f8 09          	cmp    $0x9,%ax
801019e8:	77 1e                	ja     80101a08 <readi+0xf8>
801019ea:	8b 04 c5 80 09 11 80 	mov    -0x7feef680(,%eax,8),%eax
801019f1:	85 c0                	test   %eax,%eax
801019f3:	74 13                	je     80101a08 <readi+0xf8>
801019f5:	89 7d 10             	mov    %edi,0x10(%ebp)
801019f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801019fb:	5b                   	pop    %ebx
801019fc:	5e                   	pop    %esi
801019fd:	5f                   	pop    %edi
801019fe:	5d                   	pop    %ebp
801019ff:	ff e0                	jmp    *%eax
80101a01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101a08:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a0d:	eb c7                	jmp    801019d6 <readi+0xc6>
80101a0f:	90                   	nop

80101a10 <writei>:
80101a10:	55                   	push   %ebp
80101a11:	89 e5                	mov    %esp,%ebp
80101a13:	57                   	push   %edi
80101a14:	56                   	push   %esi
80101a15:	53                   	push   %ebx
80101a16:	83 ec 1c             	sub    $0x1c,%esp
80101a19:	8b 45 08             	mov    0x8(%ebp),%eax
80101a1c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a1f:	8b 7d 14             	mov    0x14(%ebp),%edi
80101a22:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101a27:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a2a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a2d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a30:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101a33:	0f 84 b7 00 00 00    	je     80101af0 <writei+0xe0>
80101a39:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a3c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a3f:	0f 82 eb 00 00 00    	jb     80101b30 <writei+0x120>
80101a45:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101a48:	89 f8                	mov    %edi,%eax
80101a4a:	01 f0                	add    %esi,%eax
80101a4c:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101a51:	0f 87 d9 00 00 00    	ja     80101b30 <writei+0x120>
80101a57:	39 c6                	cmp    %eax,%esi
80101a59:	0f 87 d1 00 00 00    	ja     80101b30 <writei+0x120>
80101a5f:	85 ff                	test   %edi,%edi
80101a61:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101a68:	74 78                	je     80101ae2 <writei+0xd2>
80101a6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101a70:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101a73:	89 f2                	mov    %esi,%edx
80101a75:	bb 00 02 00 00       	mov    $0x200,%ebx
80101a7a:	c1 ea 09             	shr    $0x9,%edx
80101a7d:	89 f8                	mov    %edi,%eax
80101a7f:	e8 3c f8 ff ff       	call   801012c0 <bmap>
80101a84:	83 ec 08             	sub    $0x8,%esp
80101a87:	50                   	push   %eax
80101a88:	ff 37                	pushl  (%edi)
80101a8a:	e8 41 e6 ff ff       	call   801000d0 <bread>
80101a8f:	89 c7                	mov    %eax,%edi
80101a91:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101a94:	2b 45 e4             	sub    -0x1c(%ebp),%eax
80101a97:	89 f1                	mov    %esi,%ecx
80101a99:	83 c4 0c             	add    $0xc,%esp
80101a9c:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80101aa2:	29 cb                	sub    %ecx,%ebx
80101aa4:	39 c3                	cmp    %eax,%ebx
80101aa6:	0f 47 d8             	cmova  %eax,%ebx
80101aa9:	8d 44 0f 5c          	lea    0x5c(%edi,%ecx,1),%eax
80101aad:	53                   	push   %ebx
80101aae:	ff 75 dc             	pushl  -0x24(%ebp)
80101ab1:	01 de                	add    %ebx,%esi
80101ab3:	50                   	push   %eax
80101ab4:	e8 87 2c 00 00       	call   80104740 <memmove>
80101ab9:	89 3c 24             	mov    %edi,(%esp)
80101abc:	e8 9f 12 00 00       	call   80102d60 <log_write>
80101ac1:	89 3c 24             	mov    %edi,(%esp)
80101ac4:	e8 17 e7 ff ff       	call   801001e0 <brelse>
80101ac9:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101acc:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101acf:	83 c4 10             	add    $0x10,%esp
80101ad2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101ad5:	39 55 e0             	cmp    %edx,-0x20(%ebp)
80101ad8:	77 96                	ja     80101a70 <writei+0x60>
80101ada:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101add:	3b 70 58             	cmp    0x58(%eax),%esi
80101ae0:	77 36                	ja     80101b18 <writei+0x108>
80101ae2:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101ae5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101ae8:	5b                   	pop    %ebx
80101ae9:	5e                   	pop    %esi
80101aea:	5f                   	pop    %edi
80101aeb:	5d                   	pop    %ebp
80101aec:	c3                   	ret    
80101aed:	8d 76 00             	lea    0x0(%esi),%esi
80101af0:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101af4:	66 83 f8 09          	cmp    $0x9,%ax
80101af8:	77 36                	ja     80101b30 <writei+0x120>
80101afa:	8b 04 c5 84 09 11 80 	mov    -0x7feef67c(,%eax,8),%eax
80101b01:	85 c0                	test   %eax,%eax
80101b03:	74 2b                	je     80101b30 <writei+0x120>
80101b05:	89 7d 10             	mov    %edi,0x10(%ebp)
80101b08:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b0b:	5b                   	pop    %ebx
80101b0c:	5e                   	pop    %esi
80101b0d:	5f                   	pop    %edi
80101b0e:	5d                   	pop    %ebp
80101b0f:	ff e0                	jmp    *%eax
80101b11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101b18:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b1b:	83 ec 0c             	sub    $0xc,%esp
80101b1e:	89 70 58             	mov    %esi,0x58(%eax)
80101b21:	50                   	push   %eax
80101b22:	e8 79 fa ff ff       	call   801015a0 <iupdate>
80101b27:	83 c4 10             	add    $0x10,%esp
80101b2a:	eb b6                	jmp    80101ae2 <writei+0xd2>
80101b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b35:	eb ae                	jmp    80101ae5 <writei+0xd5>
80101b37:	89 f6                	mov    %esi,%esi
80101b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b40 <namecmp>:
80101b40:	55                   	push   %ebp
80101b41:	89 e5                	mov    %esp,%ebp
80101b43:	83 ec 0c             	sub    $0xc,%esp
80101b46:	6a 0e                	push   $0xe
80101b48:	ff 75 0c             	pushl  0xc(%ebp)
80101b4b:	ff 75 08             	pushl  0x8(%ebp)
80101b4e:	e8 6d 2c 00 00       	call   801047c0 <strncmp>
80101b53:	c9                   	leave  
80101b54:	c3                   	ret    
80101b55:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b60 <dirlookup>:
80101b60:	55                   	push   %ebp
80101b61:	89 e5                	mov    %esp,%ebp
80101b63:	57                   	push   %edi
80101b64:	56                   	push   %esi
80101b65:	53                   	push   %ebx
80101b66:	83 ec 1c             	sub    $0x1c,%esp
80101b69:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101b6c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101b71:	0f 85 80 00 00 00    	jne    80101bf7 <dirlookup+0x97>
80101b77:	8b 53 58             	mov    0x58(%ebx),%edx
80101b7a:	31 ff                	xor    %edi,%edi
80101b7c:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101b7f:	85 d2                	test   %edx,%edx
80101b81:	75 0d                	jne    80101b90 <dirlookup+0x30>
80101b83:	eb 5b                	jmp    80101be0 <dirlookup+0x80>
80101b85:	8d 76 00             	lea    0x0(%esi),%esi
80101b88:	83 c7 10             	add    $0x10,%edi
80101b8b:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101b8e:	76 50                	jbe    80101be0 <dirlookup+0x80>
80101b90:	6a 10                	push   $0x10
80101b92:	57                   	push   %edi
80101b93:	56                   	push   %esi
80101b94:	53                   	push   %ebx
80101b95:	e8 76 fd ff ff       	call   80101910 <readi>
80101b9a:	83 c4 10             	add    $0x10,%esp
80101b9d:	83 f8 10             	cmp    $0x10,%eax
80101ba0:	75 48                	jne    80101bea <dirlookup+0x8a>
80101ba2:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101ba7:	74 df                	je     80101b88 <dirlookup+0x28>
80101ba9:	8d 45 da             	lea    -0x26(%ebp),%eax
80101bac:	83 ec 04             	sub    $0x4,%esp
80101baf:	6a 0e                	push   $0xe
80101bb1:	50                   	push   %eax
80101bb2:	ff 75 0c             	pushl  0xc(%ebp)
80101bb5:	e8 06 2c 00 00       	call   801047c0 <strncmp>
80101bba:	83 c4 10             	add    $0x10,%esp
80101bbd:	85 c0                	test   %eax,%eax
80101bbf:	75 c7                	jne    80101b88 <dirlookup+0x28>
80101bc1:	8b 45 10             	mov    0x10(%ebp),%eax
80101bc4:	85 c0                	test   %eax,%eax
80101bc6:	74 05                	je     80101bcd <dirlookup+0x6d>
80101bc8:	8b 45 10             	mov    0x10(%ebp),%eax
80101bcb:	89 38                	mov    %edi,(%eax)
80101bcd:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101bd1:	8b 03                	mov    (%ebx),%eax
80101bd3:	e8 18 f6 ff ff       	call   801011f0 <iget>
80101bd8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101bdb:	5b                   	pop    %ebx
80101bdc:	5e                   	pop    %esi
80101bdd:	5f                   	pop    %edi
80101bde:	5d                   	pop    %ebp
80101bdf:	c3                   	ret    
80101be0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101be3:	31 c0                	xor    %eax,%eax
80101be5:	5b                   	pop    %ebx
80101be6:	5e                   	pop    %esi
80101be7:	5f                   	pop    %edi
80101be8:	5d                   	pop    %ebp
80101be9:	c3                   	ret    
80101bea:	83 ec 0c             	sub    $0xc,%esp
80101bed:	68 35 73 10 80       	push   $0x80107335
80101bf2:	e8 79 e7 ff ff       	call   80100370 <panic>
80101bf7:	83 ec 0c             	sub    $0xc,%esp
80101bfa:	68 23 73 10 80       	push   $0x80107323
80101bff:	e8 6c e7 ff ff       	call   80100370 <panic>
80101c04:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c0a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101c10 <namex>:
80101c10:	55                   	push   %ebp
80101c11:	89 e5                	mov    %esp,%ebp
80101c13:	57                   	push   %edi
80101c14:	56                   	push   %esi
80101c15:	53                   	push   %ebx
80101c16:	89 cf                	mov    %ecx,%edi
80101c18:	89 c3                	mov    %eax,%ebx
80101c1a:	83 ec 1c             	sub    $0x1c,%esp
80101c1d:	80 38 2f             	cmpb   $0x2f,(%eax)
80101c20:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101c23:	0f 84 53 01 00 00    	je     80101d7c <namex+0x16c>
80101c29:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80101c2f:	83 ec 0c             	sub    $0xc,%esp
80101c32:	8b 70 68             	mov    0x68(%eax),%esi
80101c35:	68 00 0a 11 80       	push   $0x80110a00
80101c3a:	e8 21 28 00 00       	call   80104460 <acquire>
80101c3f:	83 46 08 01          	addl   $0x1,0x8(%esi)
80101c43:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101c4a:	e8 f1 29 00 00       	call   80104640 <release>
80101c4f:	83 c4 10             	add    $0x10,%esp
80101c52:	eb 07                	jmp    80101c5b <namex+0x4b>
80101c54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101c58:	83 c3 01             	add    $0x1,%ebx
80101c5b:	0f b6 03             	movzbl (%ebx),%eax
80101c5e:	3c 2f                	cmp    $0x2f,%al
80101c60:	74 f6                	je     80101c58 <namex+0x48>
80101c62:	84 c0                	test   %al,%al
80101c64:	0f 84 e3 00 00 00    	je     80101d4d <namex+0x13d>
80101c6a:	0f b6 03             	movzbl (%ebx),%eax
80101c6d:	89 da                	mov    %ebx,%edx
80101c6f:	84 c0                	test   %al,%al
80101c71:	0f 84 ac 00 00 00    	je     80101d23 <namex+0x113>
80101c77:	3c 2f                	cmp    $0x2f,%al
80101c79:	75 09                	jne    80101c84 <namex+0x74>
80101c7b:	e9 a3 00 00 00       	jmp    80101d23 <namex+0x113>
80101c80:	84 c0                	test   %al,%al
80101c82:	74 0a                	je     80101c8e <namex+0x7e>
80101c84:	83 c2 01             	add    $0x1,%edx
80101c87:	0f b6 02             	movzbl (%edx),%eax
80101c8a:	3c 2f                	cmp    $0x2f,%al
80101c8c:	75 f2                	jne    80101c80 <namex+0x70>
80101c8e:	89 d1                	mov    %edx,%ecx
80101c90:	29 d9                	sub    %ebx,%ecx
80101c92:	83 f9 0d             	cmp    $0xd,%ecx
80101c95:	0f 8e 8d 00 00 00    	jle    80101d28 <namex+0x118>
80101c9b:	83 ec 04             	sub    $0x4,%esp
80101c9e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101ca1:	6a 0e                	push   $0xe
80101ca3:	53                   	push   %ebx
80101ca4:	57                   	push   %edi
80101ca5:	e8 96 2a 00 00       	call   80104740 <memmove>
80101caa:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101cad:	83 c4 10             	add    $0x10,%esp
80101cb0:	89 d3                	mov    %edx,%ebx
80101cb2:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101cb5:	75 11                	jne    80101cc8 <namex+0xb8>
80101cb7:	89 f6                	mov    %esi,%esi
80101cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101cc0:	83 c3 01             	add    $0x1,%ebx
80101cc3:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101cc6:	74 f8                	je     80101cc0 <namex+0xb0>
80101cc8:	83 ec 0c             	sub    $0xc,%esp
80101ccb:	56                   	push   %esi
80101ccc:	e8 7f f9 ff ff       	call   80101650 <ilock>
80101cd1:	83 c4 10             	add    $0x10,%esp
80101cd4:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101cd9:	0f 85 7f 00 00 00    	jne    80101d5e <namex+0x14e>
80101cdf:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101ce2:	85 d2                	test   %edx,%edx
80101ce4:	74 09                	je     80101cef <namex+0xdf>
80101ce6:	80 3b 00             	cmpb   $0x0,(%ebx)
80101ce9:	0f 84 a3 00 00 00    	je     80101d92 <namex+0x182>
80101cef:	83 ec 04             	sub    $0x4,%esp
80101cf2:	6a 00                	push   $0x0
80101cf4:	57                   	push   %edi
80101cf5:	56                   	push   %esi
80101cf6:	e8 65 fe ff ff       	call   80101b60 <dirlookup>
80101cfb:	83 c4 10             	add    $0x10,%esp
80101cfe:	85 c0                	test   %eax,%eax
80101d00:	74 5c                	je     80101d5e <namex+0x14e>
80101d02:	83 ec 0c             	sub    $0xc,%esp
80101d05:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d08:	56                   	push   %esi
80101d09:	e8 22 fa ff ff       	call   80101730 <iunlock>
80101d0e:	89 34 24             	mov    %esi,(%esp)
80101d11:	e8 6a fa ff ff       	call   80101780 <iput>
80101d16:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d19:	83 c4 10             	add    $0x10,%esp
80101d1c:	89 c6                	mov    %eax,%esi
80101d1e:	e9 38 ff ff ff       	jmp    80101c5b <namex+0x4b>
80101d23:	31 c9                	xor    %ecx,%ecx
80101d25:	8d 76 00             	lea    0x0(%esi),%esi
80101d28:	83 ec 04             	sub    $0x4,%esp
80101d2b:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d2e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d31:	51                   	push   %ecx
80101d32:	53                   	push   %ebx
80101d33:	57                   	push   %edi
80101d34:	e8 07 2a 00 00       	call   80104740 <memmove>
80101d39:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101d3c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101d3f:	83 c4 10             	add    $0x10,%esp
80101d42:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101d46:	89 d3                	mov    %edx,%ebx
80101d48:	e9 65 ff ff ff       	jmp    80101cb2 <namex+0xa2>
80101d4d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101d50:	85 c0                	test   %eax,%eax
80101d52:	75 54                	jne    80101da8 <namex+0x198>
80101d54:	89 f0                	mov    %esi,%eax
80101d56:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d59:	5b                   	pop    %ebx
80101d5a:	5e                   	pop    %esi
80101d5b:	5f                   	pop    %edi
80101d5c:	5d                   	pop    %ebp
80101d5d:	c3                   	ret    
80101d5e:	83 ec 0c             	sub    $0xc,%esp
80101d61:	56                   	push   %esi
80101d62:	e8 c9 f9 ff ff       	call   80101730 <iunlock>
80101d67:	89 34 24             	mov    %esi,(%esp)
80101d6a:	e8 11 fa ff ff       	call   80101780 <iput>
80101d6f:	83 c4 10             	add    $0x10,%esp
80101d72:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d75:	31 c0                	xor    %eax,%eax
80101d77:	5b                   	pop    %ebx
80101d78:	5e                   	pop    %esi
80101d79:	5f                   	pop    %edi
80101d7a:	5d                   	pop    %ebp
80101d7b:	c3                   	ret    
80101d7c:	ba 01 00 00 00       	mov    $0x1,%edx
80101d81:	b8 01 00 00 00       	mov    $0x1,%eax
80101d86:	e8 65 f4 ff ff       	call   801011f0 <iget>
80101d8b:	89 c6                	mov    %eax,%esi
80101d8d:	e9 c9 fe ff ff       	jmp    80101c5b <namex+0x4b>
80101d92:	83 ec 0c             	sub    $0xc,%esp
80101d95:	56                   	push   %esi
80101d96:	e8 95 f9 ff ff       	call   80101730 <iunlock>
80101d9b:	83 c4 10             	add    $0x10,%esp
80101d9e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101da1:	89 f0                	mov    %esi,%eax
80101da3:	5b                   	pop    %ebx
80101da4:	5e                   	pop    %esi
80101da5:	5f                   	pop    %edi
80101da6:	5d                   	pop    %ebp
80101da7:	c3                   	ret    
80101da8:	83 ec 0c             	sub    $0xc,%esp
80101dab:	56                   	push   %esi
80101dac:	e8 cf f9 ff ff       	call   80101780 <iput>
80101db1:	83 c4 10             	add    $0x10,%esp
80101db4:	31 c0                	xor    %eax,%eax
80101db6:	eb 9e                	jmp    80101d56 <namex+0x146>
80101db8:	90                   	nop
80101db9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101dc0 <dirlink>:
80101dc0:	55                   	push   %ebp
80101dc1:	89 e5                	mov    %esp,%ebp
80101dc3:	57                   	push   %edi
80101dc4:	56                   	push   %esi
80101dc5:	53                   	push   %ebx
80101dc6:	83 ec 20             	sub    $0x20,%esp
80101dc9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101dcc:	6a 00                	push   $0x0
80101dce:	ff 75 0c             	pushl  0xc(%ebp)
80101dd1:	53                   	push   %ebx
80101dd2:	e8 89 fd ff ff       	call   80101b60 <dirlookup>
80101dd7:	83 c4 10             	add    $0x10,%esp
80101dda:	85 c0                	test   %eax,%eax
80101ddc:	75 67                	jne    80101e45 <dirlink+0x85>
80101dde:	8b 7b 58             	mov    0x58(%ebx),%edi
80101de1:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101de4:	85 ff                	test   %edi,%edi
80101de6:	74 29                	je     80101e11 <dirlink+0x51>
80101de8:	31 ff                	xor    %edi,%edi
80101dea:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101ded:	eb 09                	jmp    80101df8 <dirlink+0x38>
80101def:	90                   	nop
80101df0:	83 c7 10             	add    $0x10,%edi
80101df3:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101df6:	76 19                	jbe    80101e11 <dirlink+0x51>
80101df8:	6a 10                	push   $0x10
80101dfa:	57                   	push   %edi
80101dfb:	56                   	push   %esi
80101dfc:	53                   	push   %ebx
80101dfd:	e8 0e fb ff ff       	call   80101910 <readi>
80101e02:	83 c4 10             	add    $0x10,%esp
80101e05:	83 f8 10             	cmp    $0x10,%eax
80101e08:	75 4e                	jne    80101e58 <dirlink+0x98>
80101e0a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e0f:	75 df                	jne    80101df0 <dirlink+0x30>
80101e11:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e14:	83 ec 04             	sub    $0x4,%esp
80101e17:	6a 0e                	push   $0xe
80101e19:	ff 75 0c             	pushl  0xc(%ebp)
80101e1c:	50                   	push   %eax
80101e1d:	e8 0e 2a 00 00       	call   80104830 <strncpy>
80101e22:	8b 45 10             	mov    0x10(%ebp),%eax
80101e25:	6a 10                	push   $0x10
80101e27:	57                   	push   %edi
80101e28:	56                   	push   %esi
80101e29:	53                   	push   %ebx
80101e2a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
80101e2e:	e8 dd fb ff ff       	call   80101a10 <writei>
80101e33:	83 c4 20             	add    $0x20,%esp
80101e36:	83 f8 10             	cmp    $0x10,%eax
80101e39:	75 2a                	jne    80101e65 <dirlink+0xa5>
80101e3b:	31 c0                	xor    %eax,%eax
80101e3d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e40:	5b                   	pop    %ebx
80101e41:	5e                   	pop    %esi
80101e42:	5f                   	pop    %edi
80101e43:	5d                   	pop    %ebp
80101e44:	c3                   	ret    
80101e45:	83 ec 0c             	sub    $0xc,%esp
80101e48:	50                   	push   %eax
80101e49:	e8 32 f9 ff ff       	call   80101780 <iput>
80101e4e:	83 c4 10             	add    $0x10,%esp
80101e51:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101e56:	eb e5                	jmp    80101e3d <dirlink+0x7d>
80101e58:	83 ec 0c             	sub    $0xc,%esp
80101e5b:	68 35 73 10 80       	push   $0x80107335
80101e60:	e8 0b e5 ff ff       	call   80100370 <panic>
80101e65:	83 ec 0c             	sub    $0xc,%esp
80101e68:	68 86 79 10 80       	push   $0x80107986
80101e6d:	e8 fe e4 ff ff       	call   80100370 <panic>
80101e72:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101e79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101e80 <namei>:
80101e80:	55                   	push   %ebp
80101e81:	31 d2                	xor    %edx,%edx
80101e83:	89 e5                	mov    %esp,%ebp
80101e85:	83 ec 18             	sub    $0x18,%esp
80101e88:	8b 45 08             	mov    0x8(%ebp),%eax
80101e8b:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101e8e:	e8 7d fd ff ff       	call   80101c10 <namex>
80101e93:	c9                   	leave  
80101e94:	c3                   	ret    
80101e95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101e99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ea0 <nameiparent>:
80101ea0:	55                   	push   %ebp
80101ea1:	ba 01 00 00 00       	mov    $0x1,%edx
80101ea6:	89 e5                	mov    %esp,%ebp
80101ea8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101eab:	8b 45 08             	mov    0x8(%ebp),%eax
80101eae:	5d                   	pop    %ebp
80101eaf:	e9 5c fd ff ff       	jmp    80101c10 <namex>
80101eb4:	66 90                	xchg   %ax,%ax
80101eb6:	66 90                	xchg   %ax,%ax
80101eb8:	66 90                	xchg   %ax,%ax
80101eba:	66 90                	xchg   %ax,%ax
80101ebc:	66 90                	xchg   %ax,%ax
80101ebe:	66 90                	xchg   %ax,%ax

80101ec0 <idestart>:
80101ec0:	55                   	push   %ebp
80101ec1:	85 c0                	test   %eax,%eax
80101ec3:	89 e5                	mov    %esp,%ebp
80101ec5:	56                   	push   %esi
80101ec6:	53                   	push   %ebx
80101ec7:	0f 84 ad 00 00 00    	je     80101f7a <idestart+0xba>
80101ecd:	8b 58 08             	mov    0x8(%eax),%ebx
80101ed0:	89 c1                	mov    %eax,%ecx
80101ed2:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101ed8:	0f 87 8f 00 00 00    	ja     80101f6d <idestart+0xad>
80101ede:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101ee3:	90                   	nop
80101ee4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ee8:	ec                   	in     (%dx),%al
80101ee9:	83 e0 c0             	and    $0xffffffc0,%eax
80101eec:	3c 40                	cmp    $0x40,%al
80101eee:	75 f8                	jne    80101ee8 <idestart+0x28>
80101ef0:	31 f6                	xor    %esi,%esi
80101ef2:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101ef7:	89 f0                	mov    %esi,%eax
80101ef9:	ee                   	out    %al,(%dx)
80101efa:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101eff:	b8 01 00 00 00       	mov    $0x1,%eax
80101f04:	ee                   	out    %al,(%dx)
80101f05:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f0a:	89 d8                	mov    %ebx,%eax
80101f0c:	ee                   	out    %al,(%dx)
80101f0d:	89 d8                	mov    %ebx,%eax
80101f0f:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f14:	c1 f8 08             	sar    $0x8,%eax
80101f17:	ee                   	out    %al,(%dx)
80101f18:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f1d:	89 f0                	mov    %esi,%eax
80101f1f:	ee                   	out    %al,(%dx)
80101f20:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
80101f24:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101f29:	83 e0 01             	and    $0x1,%eax
80101f2c:	c1 e0 04             	shl    $0x4,%eax
80101f2f:	83 c8 e0             	or     $0xffffffe0,%eax
80101f32:	ee                   	out    %al,(%dx)
80101f33:	f6 01 04             	testb  $0x4,(%ecx)
80101f36:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f3b:	75 13                	jne    80101f50 <idestart+0x90>
80101f3d:	b8 20 00 00 00       	mov    $0x20,%eax
80101f42:	ee                   	out    %al,(%dx)
80101f43:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f46:	5b                   	pop    %ebx
80101f47:	5e                   	pop    %esi
80101f48:	5d                   	pop    %ebp
80101f49:	c3                   	ret    
80101f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101f50:	b8 30 00 00 00       	mov    $0x30,%eax
80101f55:	ee                   	out    %al,(%dx)
80101f56:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101f5b:	8d 71 5c             	lea    0x5c(%ecx),%esi
80101f5e:	b9 80 00 00 00       	mov    $0x80,%ecx
80101f63:	fc                   	cld    
80101f64:	f3 6f                	rep outsl %ds:(%esi),(%dx)
80101f66:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f69:	5b                   	pop    %ebx
80101f6a:	5e                   	pop    %esi
80101f6b:	5d                   	pop    %ebp
80101f6c:	c3                   	ret    
80101f6d:	83 ec 0c             	sub    $0xc,%esp
80101f70:	68 a0 73 10 80       	push   $0x801073a0
80101f75:	e8 f6 e3 ff ff       	call   80100370 <panic>
80101f7a:	83 ec 0c             	sub    $0xc,%esp
80101f7d:	68 97 73 10 80       	push   $0x80107397
80101f82:	e8 e9 e3 ff ff       	call   80100370 <panic>
80101f87:	89 f6                	mov    %esi,%esi
80101f89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f90 <ideinit>:
80101f90:	55                   	push   %ebp
80101f91:	89 e5                	mov    %esp,%ebp
80101f93:	83 ec 10             	sub    $0x10,%esp
80101f96:	68 b2 73 10 80       	push   $0x801073b2
80101f9b:	68 80 a5 10 80       	push   $0x8010a580
80101fa0:	e8 9b 24 00 00       	call   80104440 <initlock>
80101fa5:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
80101fac:	e8 9f 12 00 00       	call   80103250 <picenable>
80101fb1:	58                   	pop    %eax
80101fb2:	a1 5c 28 11 80       	mov    0x8011285c,%eax
80101fb7:	5a                   	pop    %edx
80101fb8:	83 e8 01             	sub    $0x1,%eax
80101fbb:	50                   	push   %eax
80101fbc:	6a 0e                	push   $0xe
80101fbe:	e8 bd 02 00 00       	call   80102280 <ioapicenable>
80101fc3:	83 c4 10             	add    $0x10,%esp
80101fc6:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fcb:	90                   	nop
80101fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101fd0:	ec                   	in     (%dx),%al
80101fd1:	83 e0 c0             	and    $0xffffffc0,%eax
80101fd4:	3c 40                	cmp    $0x40,%al
80101fd6:	75 f8                	jne    80101fd0 <ideinit+0x40>
80101fd8:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101fdd:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80101fe2:	ee                   	out    %al,(%dx)
80101fe3:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
80101fe8:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fed:	eb 06                	jmp    80101ff5 <ideinit+0x65>
80101fef:	90                   	nop
80101ff0:	83 e9 01             	sub    $0x1,%ecx
80101ff3:	74 0f                	je     80102004 <ideinit+0x74>
80101ff5:	ec                   	in     (%dx),%al
80101ff6:	84 c0                	test   %al,%al
80101ff8:	74 f6                	je     80101ff0 <ideinit+0x60>
80101ffa:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80102001:	00 00 00 
80102004:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102009:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
8010200e:	ee                   	out    %al,(%dx)
8010200f:	c9                   	leave  
80102010:	c3                   	ret    
80102011:	eb 0d                	jmp    80102020 <ideintr>
80102013:	90                   	nop
80102014:	90                   	nop
80102015:	90                   	nop
80102016:	90                   	nop
80102017:	90                   	nop
80102018:	90                   	nop
80102019:	90                   	nop
8010201a:	90                   	nop
8010201b:	90                   	nop
8010201c:	90                   	nop
8010201d:	90                   	nop
8010201e:	90                   	nop
8010201f:	90                   	nop

80102020 <ideintr>:
80102020:	55                   	push   %ebp
80102021:	89 e5                	mov    %esp,%ebp
80102023:	57                   	push   %edi
80102024:	56                   	push   %esi
80102025:	53                   	push   %ebx
80102026:	83 ec 18             	sub    $0x18,%esp
80102029:	68 80 a5 10 80       	push   $0x8010a580
8010202e:	e8 2d 24 00 00       	call   80104460 <acquire>
80102033:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
80102039:	83 c4 10             	add    $0x10,%esp
8010203c:	85 db                	test   %ebx,%ebx
8010203e:	74 34                	je     80102074 <ideintr+0x54>
80102040:	8b 43 58             	mov    0x58(%ebx),%eax
80102043:	a3 64 a5 10 80       	mov    %eax,0x8010a564
80102048:	8b 33                	mov    (%ebx),%esi
8010204a:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102050:	74 3e                	je     80102090 <ideintr+0x70>
80102052:	83 e6 fb             	and    $0xfffffffb,%esi
80102055:	83 ec 0c             	sub    $0xc,%esp
80102058:	83 ce 02             	or     $0x2,%esi
8010205b:	89 33                	mov    %esi,(%ebx)
8010205d:	53                   	push   %ebx
8010205e:	e8 bd 1f 00 00       	call   80104020 <wakeup>
80102063:	a1 64 a5 10 80       	mov    0x8010a564,%eax
80102068:	83 c4 10             	add    $0x10,%esp
8010206b:	85 c0                	test   %eax,%eax
8010206d:	74 05                	je     80102074 <ideintr+0x54>
8010206f:	e8 4c fe ff ff       	call   80101ec0 <idestart>
80102074:	83 ec 0c             	sub    $0xc,%esp
80102077:	68 80 a5 10 80       	push   $0x8010a580
8010207c:	e8 bf 25 00 00       	call   80104640 <release>
80102081:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102084:	5b                   	pop    %ebx
80102085:	5e                   	pop    %esi
80102086:	5f                   	pop    %edi
80102087:	5d                   	pop    %ebp
80102088:	c3                   	ret    
80102089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102090:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102095:	8d 76 00             	lea    0x0(%esi),%esi
80102098:	ec                   	in     (%dx),%al
80102099:	89 c1                	mov    %eax,%ecx
8010209b:	83 e1 c0             	and    $0xffffffc0,%ecx
8010209e:	80 f9 40             	cmp    $0x40,%cl
801020a1:	75 f5                	jne    80102098 <ideintr+0x78>
801020a3:	a8 21                	test   $0x21,%al
801020a5:	75 ab                	jne    80102052 <ideintr+0x32>
801020a7:	8d 7b 5c             	lea    0x5c(%ebx),%edi
801020aa:	b9 80 00 00 00       	mov    $0x80,%ecx
801020af:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020b4:	fc                   	cld    
801020b5:	f3 6d                	rep insl (%dx),%es:(%edi)
801020b7:	8b 33                	mov    (%ebx),%esi
801020b9:	eb 97                	jmp    80102052 <ideintr+0x32>
801020bb:	90                   	nop
801020bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801020c0 <iderw>:
801020c0:	55                   	push   %ebp
801020c1:	89 e5                	mov    %esp,%ebp
801020c3:	53                   	push   %ebx
801020c4:	83 ec 10             	sub    $0x10,%esp
801020c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801020ca:	8d 43 0c             	lea    0xc(%ebx),%eax
801020cd:	50                   	push   %eax
801020ce:	e8 3d 23 00 00       	call   80104410 <holdingsleep>
801020d3:	83 c4 10             	add    $0x10,%esp
801020d6:	85 c0                	test   %eax,%eax
801020d8:	0f 84 ad 00 00 00    	je     8010218b <iderw+0xcb>
801020de:	8b 03                	mov    (%ebx),%eax
801020e0:	83 e0 06             	and    $0x6,%eax
801020e3:	83 f8 02             	cmp    $0x2,%eax
801020e6:	0f 84 b9 00 00 00    	je     801021a5 <iderw+0xe5>
801020ec:	8b 53 04             	mov    0x4(%ebx),%edx
801020ef:	85 d2                	test   %edx,%edx
801020f1:	74 0d                	je     80102100 <iderw+0x40>
801020f3:	a1 60 a5 10 80       	mov    0x8010a560,%eax
801020f8:	85 c0                	test   %eax,%eax
801020fa:	0f 84 98 00 00 00    	je     80102198 <iderw+0xd8>
80102100:	83 ec 0c             	sub    $0xc,%esp
80102103:	68 80 a5 10 80       	push   $0x8010a580
80102108:	e8 53 23 00 00       	call   80104460 <acquire>
8010210d:	8b 15 64 a5 10 80    	mov    0x8010a564,%edx
80102113:	83 c4 10             	add    $0x10,%esp
80102116:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
8010211d:	85 d2                	test   %edx,%edx
8010211f:	75 09                	jne    8010212a <iderw+0x6a>
80102121:	eb 58                	jmp    8010217b <iderw+0xbb>
80102123:	90                   	nop
80102124:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102128:	89 c2                	mov    %eax,%edx
8010212a:	8b 42 58             	mov    0x58(%edx),%eax
8010212d:	85 c0                	test   %eax,%eax
8010212f:	75 f7                	jne    80102128 <iderw+0x68>
80102131:	83 c2 58             	add    $0x58,%edx
80102134:	89 1a                	mov    %ebx,(%edx)
80102136:	3b 1d 64 a5 10 80    	cmp    0x8010a564,%ebx
8010213c:	74 44                	je     80102182 <iderw+0xc2>
8010213e:	8b 03                	mov    (%ebx),%eax
80102140:	83 e0 06             	and    $0x6,%eax
80102143:	83 f8 02             	cmp    $0x2,%eax
80102146:	74 23                	je     8010216b <iderw+0xab>
80102148:	90                   	nop
80102149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102150:	83 ec 08             	sub    $0x8,%esp
80102153:	68 80 a5 10 80       	push   $0x8010a580
80102158:	53                   	push   %ebx
80102159:	e8 22 1d 00 00       	call   80103e80 <sleep>
8010215e:	8b 03                	mov    (%ebx),%eax
80102160:	83 c4 10             	add    $0x10,%esp
80102163:	83 e0 06             	and    $0x6,%eax
80102166:	83 f8 02             	cmp    $0x2,%eax
80102169:	75 e5                	jne    80102150 <iderw+0x90>
8010216b:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
80102172:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102175:	c9                   	leave  
80102176:	e9 c5 24 00 00       	jmp    80104640 <release>
8010217b:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
80102180:	eb b2                	jmp    80102134 <iderw+0x74>
80102182:	89 d8                	mov    %ebx,%eax
80102184:	e8 37 fd ff ff       	call   80101ec0 <idestart>
80102189:	eb b3                	jmp    8010213e <iderw+0x7e>
8010218b:	83 ec 0c             	sub    $0xc,%esp
8010218e:	68 b6 73 10 80       	push   $0x801073b6
80102193:	e8 d8 e1 ff ff       	call   80100370 <panic>
80102198:	83 ec 0c             	sub    $0xc,%esp
8010219b:	68 e1 73 10 80       	push   $0x801073e1
801021a0:	e8 cb e1 ff ff       	call   80100370 <panic>
801021a5:	83 ec 0c             	sub    $0xc,%esp
801021a8:	68 cc 73 10 80       	push   $0x801073cc
801021ad:	e8 be e1 ff ff       	call   80100370 <panic>
801021b2:	66 90                	xchg   %ax,%ax
801021b4:	66 90                	xchg   %ax,%ax
801021b6:	66 90                	xchg   %ax,%ax
801021b8:	66 90                	xchg   %ax,%ax
801021ba:	66 90                	xchg   %ax,%ax
801021bc:	66 90                	xchg   %ax,%ax
801021be:	66 90                	xchg   %ax,%ax

801021c0 <ioapicinit>:
801021c0:	a1 84 27 11 80       	mov    0x80112784,%eax
801021c5:	85 c0                	test   %eax,%eax
801021c7:	0f 84 a8 00 00 00    	je     80102275 <ioapicinit+0xb5>
801021cd:	55                   	push   %ebp
801021ce:	c7 05 54 26 11 80 00 	movl   $0xfec00000,0x80112654
801021d5:	00 c0 fe 
801021d8:	89 e5                	mov    %esp,%ebp
801021da:	56                   	push   %esi
801021db:	53                   	push   %ebx
801021dc:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
801021e3:	00 00 00 
801021e6:	8b 15 54 26 11 80    	mov    0x80112654,%edx
801021ec:	8b 72 10             	mov    0x10(%edx),%esi
801021ef:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
801021f5:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
801021fb:	0f b6 15 80 27 11 80 	movzbl 0x80112780,%edx
80102202:	89 f0                	mov    %esi,%eax
80102204:	c1 e8 10             	shr    $0x10,%eax
80102207:	0f b6 f0             	movzbl %al,%esi
8010220a:	8b 41 10             	mov    0x10(%ecx),%eax
8010220d:	c1 e8 18             	shr    $0x18,%eax
80102210:	39 d0                	cmp    %edx,%eax
80102212:	74 16                	je     8010222a <ioapicinit+0x6a>
80102214:	83 ec 0c             	sub    $0xc,%esp
80102217:	68 00 74 10 80       	push   $0x80107400
8010221c:	e8 3f e4 ff ff       	call   80100660 <cprintf>
80102221:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102227:	83 c4 10             	add    $0x10,%esp
8010222a:	83 c6 21             	add    $0x21,%esi
8010222d:	ba 10 00 00 00       	mov    $0x10,%edx
80102232:	b8 20 00 00 00       	mov    $0x20,%eax
80102237:	89 f6                	mov    %esi,%esi
80102239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102240:	89 11                	mov    %edx,(%ecx)
80102242:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102248:	89 c3                	mov    %eax,%ebx
8010224a:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102250:	83 c0 01             	add    $0x1,%eax
80102253:	89 59 10             	mov    %ebx,0x10(%ecx)
80102256:	8d 5a 01             	lea    0x1(%edx),%ebx
80102259:	83 c2 02             	add    $0x2,%edx
8010225c:	39 f0                	cmp    %esi,%eax
8010225e:	89 19                	mov    %ebx,(%ecx)
80102260:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102266:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
8010226d:	75 d1                	jne    80102240 <ioapicinit+0x80>
8010226f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102272:	5b                   	pop    %ebx
80102273:	5e                   	pop    %esi
80102274:	5d                   	pop    %ebp
80102275:	f3 c3                	repz ret 
80102277:	89 f6                	mov    %esi,%esi
80102279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102280 <ioapicenable>:
80102280:	8b 15 84 27 11 80    	mov    0x80112784,%edx
80102286:	55                   	push   %ebp
80102287:	89 e5                	mov    %esp,%ebp
80102289:	85 d2                	test   %edx,%edx
8010228b:	8b 45 08             	mov    0x8(%ebp),%eax
8010228e:	74 2b                	je     801022bb <ioapicenable+0x3b>
80102290:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102296:	8d 50 20             	lea    0x20(%eax),%edx
80102299:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
8010229d:	89 01                	mov    %eax,(%ecx)
8010229f:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
801022a5:	83 c0 01             	add    $0x1,%eax
801022a8:	89 51 10             	mov    %edx,0x10(%ecx)
801022ab:	8b 55 0c             	mov    0xc(%ebp),%edx
801022ae:	89 01                	mov    %eax,(%ecx)
801022b0:	a1 54 26 11 80       	mov    0x80112654,%eax
801022b5:	c1 e2 18             	shl    $0x18,%edx
801022b8:	89 50 10             	mov    %edx,0x10(%eax)
801022bb:	5d                   	pop    %ebp
801022bc:	c3                   	ret    
801022bd:	66 90                	xchg   %ax,%ax
801022bf:	90                   	nop

801022c0 <kfree>:
801022c0:	55                   	push   %ebp
801022c1:	89 e5                	mov    %esp,%ebp
801022c3:	53                   	push   %ebx
801022c4:	83 ec 04             	sub    $0x4,%esp
801022c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801022ca:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801022d0:	75 70                	jne    80102342 <kfree+0x82>
801022d2:	81 fb e8 50 11 80    	cmp    $0x801150e8,%ebx
801022d8:	72 68                	jb     80102342 <kfree+0x82>
801022da:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801022e0:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
801022e5:	77 5b                	ja     80102342 <kfree+0x82>
801022e7:	83 ec 04             	sub    $0x4,%esp
801022ea:	68 00 10 00 00       	push   $0x1000
801022ef:	6a 01                	push   $0x1
801022f1:	53                   	push   %ebx
801022f2:	e8 99 23 00 00       	call   80104690 <memset>
801022f7:	8b 15 94 26 11 80    	mov    0x80112694,%edx
801022fd:	83 c4 10             	add    $0x10,%esp
80102300:	85 d2                	test   %edx,%edx
80102302:	75 2c                	jne    80102330 <kfree+0x70>
80102304:	a1 98 26 11 80       	mov    0x80112698,%eax
80102309:	89 03                	mov    %eax,(%ebx)
8010230b:	a1 94 26 11 80       	mov    0x80112694,%eax
80102310:	89 1d 98 26 11 80    	mov    %ebx,0x80112698
80102316:	85 c0                	test   %eax,%eax
80102318:	75 06                	jne    80102320 <kfree+0x60>
8010231a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010231d:	c9                   	leave  
8010231e:	c3                   	ret    
8010231f:	90                   	nop
80102320:	c7 45 08 60 26 11 80 	movl   $0x80112660,0x8(%ebp)
80102327:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010232a:	c9                   	leave  
8010232b:	e9 10 23 00 00       	jmp    80104640 <release>
80102330:	83 ec 0c             	sub    $0xc,%esp
80102333:	68 60 26 11 80       	push   $0x80112660
80102338:	e8 23 21 00 00       	call   80104460 <acquire>
8010233d:	83 c4 10             	add    $0x10,%esp
80102340:	eb c2                	jmp    80102304 <kfree+0x44>
80102342:	83 ec 0c             	sub    $0xc,%esp
80102345:	68 32 74 10 80       	push   $0x80107432
8010234a:	e8 21 e0 ff ff       	call   80100370 <panic>
8010234f:	90                   	nop

80102350 <freerange>:
80102350:	55                   	push   %ebp
80102351:	89 e5                	mov    %esp,%ebp
80102353:	56                   	push   %esi
80102354:	53                   	push   %ebx
80102355:	8b 45 08             	mov    0x8(%ebp),%eax
80102358:	8b 75 0c             	mov    0xc(%ebp),%esi
8010235b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102361:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102367:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010236d:	39 de                	cmp    %ebx,%esi
8010236f:	72 23                	jb     80102394 <freerange+0x44>
80102371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102378:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010237e:	83 ec 0c             	sub    $0xc,%esp
80102381:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102387:	50                   	push   %eax
80102388:	e8 33 ff ff ff       	call   801022c0 <kfree>
8010238d:	83 c4 10             	add    $0x10,%esp
80102390:	39 f3                	cmp    %esi,%ebx
80102392:	76 e4                	jbe    80102378 <freerange+0x28>
80102394:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102397:	5b                   	pop    %ebx
80102398:	5e                   	pop    %esi
80102399:	5d                   	pop    %ebp
8010239a:	c3                   	ret    
8010239b:	90                   	nop
8010239c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801023a0 <kinit1>:
801023a0:	55                   	push   %ebp
801023a1:	89 e5                	mov    %esp,%ebp
801023a3:	56                   	push   %esi
801023a4:	53                   	push   %ebx
801023a5:	8b 75 0c             	mov    0xc(%ebp),%esi
801023a8:	83 ec 08             	sub    $0x8,%esp
801023ab:	68 38 74 10 80       	push   $0x80107438
801023b0:	68 60 26 11 80       	push   $0x80112660
801023b5:	e8 86 20 00 00       	call   80104440 <initlock>
801023ba:	8b 45 08             	mov    0x8(%ebp),%eax
801023bd:	83 c4 10             	add    $0x10,%esp
801023c0:	c7 05 94 26 11 80 00 	movl   $0x0,0x80112694
801023c7:	00 00 00 
801023ca:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023d0:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801023d6:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023dc:	39 de                	cmp    %ebx,%esi
801023de:	72 1c                	jb     801023fc <kinit1+0x5c>
801023e0:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801023e6:	83 ec 0c             	sub    $0xc,%esp
801023e9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023ef:	50                   	push   %eax
801023f0:	e8 cb fe ff ff       	call   801022c0 <kfree>
801023f5:	83 c4 10             	add    $0x10,%esp
801023f8:	39 de                	cmp    %ebx,%esi
801023fa:	73 e4                	jae    801023e0 <kinit1+0x40>
801023fc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023ff:	5b                   	pop    %ebx
80102400:	5e                   	pop    %esi
80102401:	5d                   	pop    %ebp
80102402:	c3                   	ret    
80102403:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102410 <kinit2>:
80102410:	55                   	push   %ebp
80102411:	89 e5                	mov    %esp,%ebp
80102413:	56                   	push   %esi
80102414:	53                   	push   %ebx
80102415:	8b 45 08             	mov    0x8(%ebp),%eax
80102418:	8b 75 0c             	mov    0xc(%ebp),%esi
8010241b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102421:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102427:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010242d:	39 de                	cmp    %ebx,%esi
8010242f:	72 23                	jb     80102454 <kinit2+0x44>
80102431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102438:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010243e:	83 ec 0c             	sub    $0xc,%esp
80102441:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102447:	50                   	push   %eax
80102448:	e8 73 fe ff ff       	call   801022c0 <kfree>
8010244d:	83 c4 10             	add    $0x10,%esp
80102450:	39 de                	cmp    %ebx,%esi
80102452:	73 e4                	jae    80102438 <kinit2+0x28>
80102454:	c7 05 94 26 11 80 01 	movl   $0x1,0x80112694
8010245b:	00 00 00 
8010245e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102461:	5b                   	pop    %ebx
80102462:	5e                   	pop    %esi
80102463:	5d                   	pop    %ebp
80102464:	c3                   	ret    
80102465:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102470 <kalloc>:
80102470:	55                   	push   %ebp
80102471:	89 e5                	mov    %esp,%ebp
80102473:	53                   	push   %ebx
80102474:	83 ec 04             	sub    $0x4,%esp
80102477:	a1 94 26 11 80       	mov    0x80112694,%eax
8010247c:	85 c0                	test   %eax,%eax
8010247e:	75 30                	jne    801024b0 <kalloc+0x40>
80102480:	8b 1d 98 26 11 80    	mov    0x80112698,%ebx
80102486:	85 db                	test   %ebx,%ebx
80102488:	74 1c                	je     801024a6 <kalloc+0x36>
8010248a:	8b 13                	mov    (%ebx),%edx
8010248c:	89 15 98 26 11 80    	mov    %edx,0x80112698
80102492:	85 c0                	test   %eax,%eax
80102494:	74 10                	je     801024a6 <kalloc+0x36>
80102496:	83 ec 0c             	sub    $0xc,%esp
80102499:	68 60 26 11 80       	push   $0x80112660
8010249e:	e8 9d 21 00 00       	call   80104640 <release>
801024a3:	83 c4 10             	add    $0x10,%esp
801024a6:	89 d8                	mov    %ebx,%eax
801024a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024ab:	c9                   	leave  
801024ac:	c3                   	ret    
801024ad:	8d 76 00             	lea    0x0(%esi),%esi
801024b0:	83 ec 0c             	sub    $0xc,%esp
801024b3:	68 60 26 11 80       	push   $0x80112660
801024b8:	e8 a3 1f 00 00       	call   80104460 <acquire>
801024bd:	8b 1d 98 26 11 80    	mov    0x80112698,%ebx
801024c3:	83 c4 10             	add    $0x10,%esp
801024c6:	a1 94 26 11 80       	mov    0x80112694,%eax
801024cb:	85 db                	test   %ebx,%ebx
801024cd:	75 bb                	jne    8010248a <kalloc+0x1a>
801024cf:	eb c1                	jmp    80102492 <kalloc+0x22>
801024d1:	66 90                	xchg   %ax,%ax
801024d3:	66 90                	xchg   %ax,%ax
801024d5:	66 90                	xchg   %ax,%ax
801024d7:	66 90                	xchg   %ax,%ax
801024d9:	66 90                	xchg   %ax,%ax
801024db:	66 90                	xchg   %ax,%ax
801024dd:	66 90                	xchg   %ax,%ax
801024df:	90                   	nop

801024e0 <kbdgetc>:
801024e0:	55                   	push   %ebp
801024e1:	ba 64 00 00 00       	mov    $0x64,%edx
801024e6:	89 e5                	mov    %esp,%ebp
801024e8:	ec                   	in     (%dx),%al
801024e9:	a8 01                	test   $0x1,%al
801024eb:	0f 84 af 00 00 00    	je     801025a0 <kbdgetc+0xc0>
801024f1:	ba 60 00 00 00       	mov    $0x60,%edx
801024f6:	ec                   	in     (%dx),%al
801024f7:	0f b6 d0             	movzbl %al,%edx
801024fa:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102500:	74 7e                	je     80102580 <kbdgetc+0xa0>
80102502:	84 c0                	test   %al,%al
80102504:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx
8010250a:	79 24                	jns    80102530 <kbdgetc+0x50>
8010250c:	f6 c1 40             	test   $0x40,%cl
8010250f:	75 05                	jne    80102516 <kbdgetc+0x36>
80102511:	89 c2                	mov    %eax,%edx
80102513:	83 e2 7f             	and    $0x7f,%edx
80102516:	0f b6 82 60 75 10 80 	movzbl -0x7fef8aa0(%edx),%eax
8010251d:	83 c8 40             	or     $0x40,%eax
80102520:	0f b6 c0             	movzbl %al,%eax
80102523:	f7 d0                	not    %eax
80102525:	21 c8                	and    %ecx,%eax
80102527:	a3 b4 a5 10 80       	mov    %eax,0x8010a5b4
8010252c:	31 c0                	xor    %eax,%eax
8010252e:	5d                   	pop    %ebp
8010252f:	c3                   	ret    
80102530:	f6 c1 40             	test   $0x40,%cl
80102533:	74 09                	je     8010253e <kbdgetc+0x5e>
80102535:	83 c8 80             	or     $0xffffff80,%eax
80102538:	83 e1 bf             	and    $0xffffffbf,%ecx
8010253b:	0f b6 d0             	movzbl %al,%edx
8010253e:	0f b6 82 60 75 10 80 	movzbl -0x7fef8aa0(%edx),%eax
80102545:	09 c1                	or     %eax,%ecx
80102547:	0f b6 82 60 74 10 80 	movzbl -0x7fef8ba0(%edx),%eax
8010254e:	31 c1                	xor    %eax,%ecx
80102550:	89 c8                	mov    %ecx,%eax
80102552:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
80102558:	83 e0 03             	and    $0x3,%eax
8010255b:	83 e1 08             	and    $0x8,%ecx
8010255e:	8b 04 85 40 74 10 80 	mov    -0x7fef8bc0(,%eax,4),%eax
80102565:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
80102569:	74 c3                	je     8010252e <kbdgetc+0x4e>
8010256b:	8d 50 9f             	lea    -0x61(%eax),%edx
8010256e:	83 fa 19             	cmp    $0x19,%edx
80102571:	77 1d                	ja     80102590 <kbdgetc+0xb0>
80102573:	83 e8 20             	sub    $0x20,%eax
80102576:	5d                   	pop    %ebp
80102577:	c3                   	ret    
80102578:	90                   	nop
80102579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102580:	31 c0                	xor    %eax,%eax
80102582:	83 0d b4 a5 10 80 40 	orl    $0x40,0x8010a5b4
80102589:	5d                   	pop    %ebp
8010258a:	c3                   	ret    
8010258b:	90                   	nop
8010258c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102590:	8d 48 bf             	lea    -0x41(%eax),%ecx
80102593:	8d 50 20             	lea    0x20(%eax),%edx
80102596:	5d                   	pop    %ebp
80102597:	83 f9 19             	cmp    $0x19,%ecx
8010259a:	0f 46 c2             	cmovbe %edx,%eax
8010259d:	c3                   	ret    
8010259e:	66 90                	xchg   %ax,%ax
801025a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801025a5:	5d                   	pop    %ebp
801025a6:	c3                   	ret    
801025a7:	89 f6                	mov    %esi,%esi
801025a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801025b0 <kbdintr>:
801025b0:	55                   	push   %ebp
801025b1:	89 e5                	mov    %esp,%ebp
801025b3:	83 ec 14             	sub    $0x14,%esp
801025b6:	68 e0 24 10 80       	push   $0x801024e0
801025bb:	e8 30 e2 ff ff       	call   801007f0 <consoleintr>
801025c0:	83 c4 10             	add    $0x10,%esp
801025c3:	c9                   	leave  
801025c4:	c3                   	ret    
801025c5:	66 90                	xchg   %ax,%ax
801025c7:	66 90                	xchg   %ax,%ax
801025c9:	66 90                	xchg   %ax,%ax
801025cb:	66 90                	xchg   %ax,%ax
801025cd:	66 90                	xchg   %ax,%ax
801025cf:	90                   	nop

801025d0 <lapicinit>:
801025d0:	a1 9c 26 11 80       	mov    0x8011269c,%eax
801025d5:	55                   	push   %ebp
801025d6:	89 e5                	mov    %esp,%ebp
801025d8:	85 c0                	test   %eax,%eax
801025da:	0f 84 c8 00 00 00    	je     801026a8 <lapicinit+0xd8>
801025e0:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
801025e7:	01 00 00 
801025ea:	8b 50 20             	mov    0x20(%eax),%edx
801025ed:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
801025f4:	00 00 00 
801025f7:	8b 50 20             	mov    0x20(%eax),%edx
801025fa:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102601:	00 02 00 
80102604:	8b 50 20             	mov    0x20(%eax),%edx
80102607:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010260e:	96 98 00 
80102611:	8b 50 20             	mov    0x20(%eax),%edx
80102614:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010261b:	00 01 00 
8010261e:	8b 50 20             	mov    0x20(%eax),%edx
80102621:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102628:	00 01 00 
8010262b:	8b 50 20             	mov    0x20(%eax),%edx
8010262e:	8b 50 30             	mov    0x30(%eax),%edx
80102631:	c1 ea 10             	shr    $0x10,%edx
80102634:	80 fa 03             	cmp    $0x3,%dl
80102637:	77 77                	ja     801026b0 <lapicinit+0xe0>
80102639:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102640:	00 00 00 
80102643:	8b 50 20             	mov    0x20(%eax),%edx
80102646:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010264d:	00 00 00 
80102650:	8b 50 20             	mov    0x20(%eax),%edx
80102653:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010265a:	00 00 00 
8010265d:	8b 50 20             	mov    0x20(%eax),%edx
80102660:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102667:	00 00 00 
8010266a:	8b 50 20             	mov    0x20(%eax),%edx
8010266d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102674:	00 00 00 
80102677:	8b 50 20             	mov    0x20(%eax),%edx
8010267a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102681:	85 08 00 
80102684:	8b 50 20             	mov    0x20(%eax),%edx
80102687:	89 f6                	mov    %esi,%esi
80102689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102690:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
80102696:	80 e6 10             	and    $0x10,%dh
80102699:	75 f5                	jne    80102690 <lapicinit+0xc0>
8010269b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801026a2:	00 00 00 
801026a5:	8b 40 20             	mov    0x20(%eax),%eax
801026a8:	5d                   	pop    %ebp
801026a9:	c3                   	ret    
801026aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801026b0:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
801026b7:	00 01 00 
801026ba:	8b 50 20             	mov    0x20(%eax),%edx
801026bd:	e9 77 ff ff ff       	jmp    80102639 <lapicinit+0x69>
801026c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801026c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801026d0 <cpunum>:
801026d0:	55                   	push   %ebp
801026d1:	89 e5                	mov    %esp,%ebp
801026d3:	83 ec 08             	sub    $0x8,%esp
801026d6:	9c                   	pushf  
801026d7:	58                   	pop    %eax
801026d8:	f6 c4 02             	test   $0x2,%ah
801026db:	74 12                	je     801026ef <cpunum+0x1f>
801026dd:	a1 b8 a5 10 80       	mov    0x8010a5b8,%eax
801026e2:	8d 50 01             	lea    0x1(%eax),%edx
801026e5:	85 c0                	test   %eax,%eax
801026e7:	89 15 b8 a5 10 80    	mov    %edx,0x8010a5b8
801026ed:	74 39                	je     80102728 <cpunum+0x58>
801026ef:	a1 9c 26 11 80       	mov    0x8011269c,%eax
801026f4:	85 c0                	test   %eax,%eax
801026f6:	74 28                	je     80102720 <cpunum+0x50>
801026f8:	8b 40 20             	mov    0x20(%eax),%eax
801026fb:	8b 15 5c 28 11 80    	mov    0x8011285c,%edx
80102701:	c1 e8 18             	shr    $0x18,%eax
80102704:	85 d2                	test   %edx,%edx
80102706:	7e 0b                	jle    80102713 <cpunum+0x43>
80102708:	0f b6 15 a0 27 11 80 	movzbl 0x801127a0,%edx
8010270f:	39 d0                	cmp    %edx,%eax
80102711:	74 0d                	je     80102720 <cpunum+0x50>
80102713:	83 ec 0c             	sub    $0xc,%esp
80102716:	68 8c 76 10 80       	push   $0x8010768c
8010271b:	e8 50 dc ff ff       	call   80100370 <panic>
80102720:	31 c0                	xor    %eax,%eax
80102722:	c9                   	leave  
80102723:	c3                   	ret    
80102724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102728:	83 ec 08             	sub    $0x8,%esp
8010272b:	ff 75 04             	pushl  0x4(%ebp)
8010272e:	68 60 76 10 80       	push   $0x80107660
80102733:	e8 28 df ff ff       	call   80100660 <cprintf>
80102738:	83 c4 10             	add    $0x10,%esp
8010273b:	eb b2                	jmp    801026ef <cpunum+0x1f>
8010273d:	8d 76 00             	lea    0x0(%esi),%esi

80102740 <lapiceoi>:
80102740:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102745:	55                   	push   %ebp
80102746:	89 e5                	mov    %esp,%ebp
80102748:	85 c0                	test   %eax,%eax
8010274a:	74 0d                	je     80102759 <lapiceoi+0x19>
8010274c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102753:	00 00 00 
80102756:	8b 40 20             	mov    0x20(%eax),%eax
80102759:	5d                   	pop    %ebp
8010275a:	c3                   	ret    
8010275b:	90                   	nop
8010275c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102760 <microdelay>:
80102760:	55                   	push   %ebp
80102761:	89 e5                	mov    %esp,%ebp
80102763:	5d                   	pop    %ebp
80102764:	c3                   	ret    
80102765:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102770 <lapicstartap>:
80102770:	55                   	push   %ebp
80102771:	ba 70 00 00 00       	mov    $0x70,%edx
80102776:	b8 0f 00 00 00       	mov    $0xf,%eax
8010277b:	89 e5                	mov    %esp,%ebp
8010277d:	53                   	push   %ebx
8010277e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102781:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102784:	ee                   	out    %al,(%dx)
80102785:	ba 71 00 00 00       	mov    $0x71,%edx
8010278a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010278f:	ee                   	out    %al,(%dx)
80102790:	31 c0                	xor    %eax,%eax
80102792:	c1 e3 18             	shl    $0x18,%ebx
80102795:	66 a3 67 04 00 80    	mov    %ax,0x80000467
8010279b:	89 c8                	mov    %ecx,%eax
8010279d:	c1 e9 0c             	shr    $0xc,%ecx
801027a0:	c1 e8 04             	shr    $0x4,%eax
801027a3:	89 da                	mov    %ebx,%edx
801027a5:	80 cd 06             	or     $0x6,%ch
801027a8:	66 a3 69 04 00 80    	mov    %ax,0x80000469
801027ae:	a1 9c 26 11 80       	mov    0x8011269c,%eax
801027b3:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
801027b9:	8b 58 20             	mov    0x20(%eax),%ebx
801027bc:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
801027c3:	c5 00 00 
801027c6:	8b 58 20             	mov    0x20(%eax),%ebx
801027c9:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
801027d0:	85 00 00 
801027d3:	8b 58 20             	mov    0x20(%eax),%ebx
801027d6:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801027dc:	8b 58 20             	mov    0x20(%eax),%ebx
801027df:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801027e5:	8b 58 20             	mov    0x20(%eax),%ebx
801027e8:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801027ee:	8b 50 20             	mov    0x20(%eax),%edx
801027f1:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801027f7:	8b 40 20             	mov    0x20(%eax),%eax
801027fa:	5b                   	pop    %ebx
801027fb:	5d                   	pop    %ebp
801027fc:	c3                   	ret    
801027fd:	8d 76 00             	lea    0x0(%esi),%esi

80102800 <cmostime>:
80102800:	55                   	push   %ebp
80102801:	ba 70 00 00 00       	mov    $0x70,%edx
80102806:	b8 0b 00 00 00       	mov    $0xb,%eax
8010280b:	89 e5                	mov    %esp,%ebp
8010280d:	57                   	push   %edi
8010280e:	56                   	push   %esi
8010280f:	53                   	push   %ebx
80102810:	83 ec 4c             	sub    $0x4c,%esp
80102813:	ee                   	out    %al,(%dx)
80102814:	ba 71 00 00 00       	mov    $0x71,%edx
80102819:	ec                   	in     (%dx),%al
8010281a:	83 e0 04             	and    $0x4,%eax
8010281d:	8d 75 d0             	lea    -0x30(%ebp),%esi
80102820:	31 db                	xor    %ebx,%ebx
80102822:	88 45 b7             	mov    %al,-0x49(%ebp)
80102825:	bf 70 00 00 00       	mov    $0x70,%edi
8010282a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102830:	89 d8                	mov    %ebx,%eax
80102832:	89 fa                	mov    %edi,%edx
80102834:	ee                   	out    %al,(%dx)
80102835:	b9 71 00 00 00       	mov    $0x71,%ecx
8010283a:	89 ca                	mov    %ecx,%edx
8010283c:	ec                   	in     (%dx),%al
8010283d:	0f b6 c0             	movzbl %al,%eax
80102840:	89 fa                	mov    %edi,%edx
80102842:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102845:	b8 02 00 00 00       	mov    $0x2,%eax
8010284a:	ee                   	out    %al,(%dx)
8010284b:	89 ca                	mov    %ecx,%edx
8010284d:	ec                   	in     (%dx),%al
8010284e:	0f b6 c0             	movzbl %al,%eax
80102851:	89 fa                	mov    %edi,%edx
80102853:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102856:	b8 04 00 00 00       	mov    $0x4,%eax
8010285b:	ee                   	out    %al,(%dx)
8010285c:	89 ca                	mov    %ecx,%edx
8010285e:	ec                   	in     (%dx),%al
8010285f:	0f b6 c0             	movzbl %al,%eax
80102862:	89 fa                	mov    %edi,%edx
80102864:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102867:	b8 07 00 00 00       	mov    $0x7,%eax
8010286c:	ee                   	out    %al,(%dx)
8010286d:	89 ca                	mov    %ecx,%edx
8010286f:	ec                   	in     (%dx),%al
80102870:	0f b6 c0             	movzbl %al,%eax
80102873:	89 fa                	mov    %edi,%edx
80102875:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102878:	b8 08 00 00 00       	mov    $0x8,%eax
8010287d:	ee                   	out    %al,(%dx)
8010287e:	89 ca                	mov    %ecx,%edx
80102880:	ec                   	in     (%dx),%al
80102881:	0f b6 c0             	movzbl %al,%eax
80102884:	89 fa                	mov    %edi,%edx
80102886:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102889:	b8 09 00 00 00       	mov    $0x9,%eax
8010288e:	ee                   	out    %al,(%dx)
8010288f:	89 ca                	mov    %ecx,%edx
80102891:	ec                   	in     (%dx),%al
80102892:	0f b6 c0             	movzbl %al,%eax
80102895:	89 fa                	mov    %edi,%edx
80102897:	89 45 cc             	mov    %eax,-0x34(%ebp)
8010289a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010289f:	ee                   	out    %al,(%dx)
801028a0:	89 ca                	mov    %ecx,%edx
801028a2:	ec                   	in     (%dx),%al
801028a3:	84 c0                	test   %al,%al
801028a5:	78 89                	js     80102830 <cmostime+0x30>
801028a7:	89 d8                	mov    %ebx,%eax
801028a9:	89 fa                	mov    %edi,%edx
801028ab:	ee                   	out    %al,(%dx)
801028ac:	89 ca                	mov    %ecx,%edx
801028ae:	ec                   	in     (%dx),%al
801028af:	0f b6 c0             	movzbl %al,%eax
801028b2:	89 fa                	mov    %edi,%edx
801028b4:	89 45 d0             	mov    %eax,-0x30(%ebp)
801028b7:	b8 02 00 00 00       	mov    $0x2,%eax
801028bc:	ee                   	out    %al,(%dx)
801028bd:	89 ca                	mov    %ecx,%edx
801028bf:	ec                   	in     (%dx),%al
801028c0:	0f b6 c0             	movzbl %al,%eax
801028c3:	89 fa                	mov    %edi,%edx
801028c5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
801028c8:	b8 04 00 00 00       	mov    $0x4,%eax
801028cd:	ee                   	out    %al,(%dx)
801028ce:	89 ca                	mov    %ecx,%edx
801028d0:	ec                   	in     (%dx),%al
801028d1:	0f b6 c0             	movzbl %al,%eax
801028d4:	89 fa                	mov    %edi,%edx
801028d6:	89 45 d8             	mov    %eax,-0x28(%ebp)
801028d9:	b8 07 00 00 00       	mov    $0x7,%eax
801028de:	ee                   	out    %al,(%dx)
801028df:	89 ca                	mov    %ecx,%edx
801028e1:	ec                   	in     (%dx),%al
801028e2:	0f b6 c0             	movzbl %al,%eax
801028e5:	89 fa                	mov    %edi,%edx
801028e7:	89 45 dc             	mov    %eax,-0x24(%ebp)
801028ea:	b8 08 00 00 00       	mov    $0x8,%eax
801028ef:	ee                   	out    %al,(%dx)
801028f0:	89 ca                	mov    %ecx,%edx
801028f2:	ec                   	in     (%dx),%al
801028f3:	0f b6 c0             	movzbl %al,%eax
801028f6:	89 fa                	mov    %edi,%edx
801028f8:	89 45 e0             	mov    %eax,-0x20(%ebp)
801028fb:	b8 09 00 00 00       	mov    $0x9,%eax
80102900:	ee                   	out    %al,(%dx)
80102901:	89 ca                	mov    %ecx,%edx
80102903:	ec                   	in     (%dx),%al
80102904:	0f b6 c0             	movzbl %al,%eax
80102907:	83 ec 04             	sub    $0x4,%esp
8010290a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010290d:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102910:	6a 18                	push   $0x18
80102912:	56                   	push   %esi
80102913:	50                   	push   %eax
80102914:	e8 c7 1d 00 00       	call   801046e0 <memcmp>
80102919:	83 c4 10             	add    $0x10,%esp
8010291c:	85 c0                	test   %eax,%eax
8010291e:	0f 85 0c ff ff ff    	jne    80102830 <cmostime+0x30>
80102924:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
80102928:	75 78                	jne    801029a2 <cmostime+0x1a2>
8010292a:	8b 45 b8             	mov    -0x48(%ebp),%eax
8010292d:	89 c2                	mov    %eax,%edx
8010292f:	83 e0 0f             	and    $0xf,%eax
80102932:	c1 ea 04             	shr    $0x4,%edx
80102935:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102938:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010293b:	89 45 b8             	mov    %eax,-0x48(%ebp)
8010293e:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102941:	89 c2                	mov    %eax,%edx
80102943:	83 e0 0f             	and    $0xf,%eax
80102946:	c1 ea 04             	shr    $0x4,%edx
80102949:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010294c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010294f:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102952:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102955:	89 c2                	mov    %eax,%edx
80102957:	83 e0 0f             	and    $0xf,%eax
8010295a:	c1 ea 04             	shr    $0x4,%edx
8010295d:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102960:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102963:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102966:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102969:	89 c2                	mov    %eax,%edx
8010296b:	83 e0 0f             	and    $0xf,%eax
8010296e:	c1 ea 04             	shr    $0x4,%edx
80102971:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102974:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102977:	89 45 c4             	mov    %eax,-0x3c(%ebp)
8010297a:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010297d:	89 c2                	mov    %eax,%edx
8010297f:	83 e0 0f             	and    $0xf,%eax
80102982:	c1 ea 04             	shr    $0x4,%edx
80102985:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102988:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010298b:	89 45 c8             	mov    %eax,-0x38(%ebp)
8010298e:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102991:	89 c2                	mov    %eax,%edx
80102993:	83 e0 0f             	and    $0xf,%eax
80102996:	c1 ea 04             	shr    $0x4,%edx
80102999:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010299c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010299f:	89 45 cc             	mov    %eax,-0x34(%ebp)
801029a2:	8b 75 08             	mov    0x8(%ebp),%esi
801029a5:	8b 45 b8             	mov    -0x48(%ebp),%eax
801029a8:	89 06                	mov    %eax,(%esi)
801029aa:	8b 45 bc             	mov    -0x44(%ebp),%eax
801029ad:	89 46 04             	mov    %eax,0x4(%esi)
801029b0:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029b3:	89 46 08             	mov    %eax,0x8(%esi)
801029b6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029b9:	89 46 0c             	mov    %eax,0xc(%esi)
801029bc:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029bf:	89 46 10             	mov    %eax,0x10(%esi)
801029c2:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029c5:	89 46 14             	mov    %eax,0x14(%esi)
801029c8:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
801029cf:	8d 65 f4             	lea    -0xc(%ebp),%esp
801029d2:	5b                   	pop    %ebx
801029d3:	5e                   	pop    %esi
801029d4:	5f                   	pop    %edi
801029d5:	5d                   	pop    %ebp
801029d6:	c3                   	ret    
801029d7:	66 90                	xchg   %ax,%ax
801029d9:	66 90                	xchg   %ax,%ax
801029db:	66 90                	xchg   %ax,%ax
801029dd:	66 90                	xchg   %ax,%ax
801029df:	90                   	nop

801029e0 <install_trans>:
801029e0:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
801029e6:	85 c9                	test   %ecx,%ecx
801029e8:	0f 8e 85 00 00 00    	jle    80102a73 <install_trans+0x93>
801029ee:	55                   	push   %ebp
801029ef:	89 e5                	mov    %esp,%ebp
801029f1:	57                   	push   %edi
801029f2:	56                   	push   %esi
801029f3:	53                   	push   %ebx
801029f4:	31 db                	xor    %ebx,%ebx
801029f6:	83 ec 0c             	sub    $0xc,%esp
801029f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102a00:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102a05:	83 ec 08             	sub    $0x8,%esp
80102a08:	01 d8                	add    %ebx,%eax
80102a0a:	83 c0 01             	add    $0x1,%eax
80102a0d:	50                   	push   %eax
80102a0e:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102a14:	e8 b7 d6 ff ff       	call   801000d0 <bread>
80102a19:	89 c7                	mov    %eax,%edi
80102a1b:	58                   	pop    %eax
80102a1c:	5a                   	pop    %edx
80102a1d:	ff 34 9d ec 26 11 80 	pushl  -0x7feed914(,%ebx,4)
80102a24:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102a2a:	83 c3 01             	add    $0x1,%ebx
80102a2d:	e8 9e d6 ff ff       	call   801000d0 <bread>
80102a32:	89 c6                	mov    %eax,%esi
80102a34:	8d 47 5c             	lea    0x5c(%edi),%eax
80102a37:	83 c4 0c             	add    $0xc,%esp
80102a3a:	68 00 02 00 00       	push   $0x200
80102a3f:	50                   	push   %eax
80102a40:	8d 46 5c             	lea    0x5c(%esi),%eax
80102a43:	50                   	push   %eax
80102a44:	e8 f7 1c 00 00       	call   80104740 <memmove>
80102a49:	89 34 24             	mov    %esi,(%esp)
80102a4c:	e8 4f d7 ff ff       	call   801001a0 <bwrite>
80102a51:	89 3c 24             	mov    %edi,(%esp)
80102a54:	e8 87 d7 ff ff       	call   801001e0 <brelse>
80102a59:	89 34 24             	mov    %esi,(%esp)
80102a5c:	e8 7f d7 ff ff       	call   801001e0 <brelse>
80102a61:	83 c4 10             	add    $0x10,%esp
80102a64:	39 1d e8 26 11 80    	cmp    %ebx,0x801126e8
80102a6a:	7f 94                	jg     80102a00 <install_trans+0x20>
80102a6c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a6f:	5b                   	pop    %ebx
80102a70:	5e                   	pop    %esi
80102a71:	5f                   	pop    %edi
80102a72:	5d                   	pop    %ebp
80102a73:	f3 c3                	repz ret 
80102a75:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102a79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102a80 <write_head>:
80102a80:	55                   	push   %ebp
80102a81:	89 e5                	mov    %esp,%ebp
80102a83:	53                   	push   %ebx
80102a84:	83 ec 0c             	sub    $0xc,%esp
80102a87:	ff 35 d4 26 11 80    	pushl  0x801126d4
80102a8d:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102a93:	e8 38 d6 ff ff       	call   801000d0 <bread>
80102a98:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
80102a9e:	83 c4 10             	add    $0x10,%esp
80102aa1:	89 c3                	mov    %eax,%ebx
80102aa3:	85 c9                	test   %ecx,%ecx
80102aa5:	89 48 5c             	mov    %ecx,0x5c(%eax)
80102aa8:	7e 1f                	jle    80102ac9 <write_head+0x49>
80102aaa:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80102ab1:	31 d2                	xor    %edx,%edx
80102ab3:	90                   	nop
80102ab4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102ab8:	8b 8a ec 26 11 80    	mov    -0x7feed914(%edx),%ecx
80102abe:	89 4c 13 60          	mov    %ecx,0x60(%ebx,%edx,1)
80102ac2:	83 c2 04             	add    $0x4,%edx
80102ac5:	39 c2                	cmp    %eax,%edx
80102ac7:	75 ef                	jne    80102ab8 <write_head+0x38>
80102ac9:	83 ec 0c             	sub    $0xc,%esp
80102acc:	53                   	push   %ebx
80102acd:	e8 ce d6 ff ff       	call   801001a0 <bwrite>
80102ad2:	89 1c 24             	mov    %ebx,(%esp)
80102ad5:	e8 06 d7 ff ff       	call   801001e0 <brelse>
80102ada:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102add:	c9                   	leave  
80102ade:	c3                   	ret    
80102adf:	90                   	nop

80102ae0 <initlog>:
80102ae0:	55                   	push   %ebp
80102ae1:	89 e5                	mov    %esp,%ebp
80102ae3:	53                   	push   %ebx
80102ae4:	83 ec 2c             	sub    $0x2c,%esp
80102ae7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102aea:	68 9c 76 10 80       	push   $0x8010769c
80102aef:	68 a0 26 11 80       	push   $0x801126a0
80102af4:	e8 47 19 00 00       	call   80104440 <initlock>
80102af9:	58                   	pop    %eax
80102afa:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102afd:	5a                   	pop    %edx
80102afe:	50                   	push   %eax
80102aff:	53                   	push   %ebx
80102b00:	e8 8b e8 ff ff       	call   80101390 <readsb>
80102b05:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102b08:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102b0b:	59                   	pop    %ecx
80102b0c:	89 1d e4 26 11 80    	mov    %ebx,0x801126e4
80102b12:	89 15 d8 26 11 80    	mov    %edx,0x801126d8
80102b18:	a3 d4 26 11 80       	mov    %eax,0x801126d4
80102b1d:	5a                   	pop    %edx
80102b1e:	50                   	push   %eax
80102b1f:	53                   	push   %ebx
80102b20:	e8 ab d5 ff ff       	call   801000d0 <bread>
80102b25:	8b 48 5c             	mov    0x5c(%eax),%ecx
80102b28:	83 c4 10             	add    $0x10,%esp
80102b2b:	85 c9                	test   %ecx,%ecx
80102b2d:	89 0d e8 26 11 80    	mov    %ecx,0x801126e8
80102b33:	7e 1c                	jle    80102b51 <initlog+0x71>
80102b35:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80102b3c:	31 d2                	xor    %edx,%edx
80102b3e:	66 90                	xchg   %ax,%ax
80102b40:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102b44:	83 c2 04             	add    $0x4,%edx
80102b47:	89 8a e8 26 11 80    	mov    %ecx,-0x7feed918(%edx)
80102b4d:	39 da                	cmp    %ebx,%edx
80102b4f:	75 ef                	jne    80102b40 <initlog+0x60>
80102b51:	83 ec 0c             	sub    $0xc,%esp
80102b54:	50                   	push   %eax
80102b55:	e8 86 d6 ff ff       	call   801001e0 <brelse>
80102b5a:	e8 81 fe ff ff       	call   801029e0 <install_trans>
80102b5f:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102b66:	00 00 00 
80102b69:	e8 12 ff ff ff       	call   80102a80 <write_head>
80102b6e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102b71:	c9                   	leave  
80102b72:	c3                   	ret    
80102b73:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102b80 <begin_op>:
80102b80:	55                   	push   %ebp
80102b81:	89 e5                	mov    %esp,%ebp
80102b83:	83 ec 14             	sub    $0x14,%esp
80102b86:	68 a0 26 11 80       	push   $0x801126a0
80102b8b:	e8 d0 18 00 00       	call   80104460 <acquire>
80102b90:	83 c4 10             	add    $0x10,%esp
80102b93:	eb 18                	jmp    80102bad <begin_op+0x2d>
80102b95:	8d 76 00             	lea    0x0(%esi),%esi
80102b98:	83 ec 08             	sub    $0x8,%esp
80102b9b:	68 a0 26 11 80       	push   $0x801126a0
80102ba0:	68 a0 26 11 80       	push   $0x801126a0
80102ba5:	e8 d6 12 00 00       	call   80103e80 <sleep>
80102baa:	83 c4 10             	add    $0x10,%esp
80102bad:	a1 e0 26 11 80       	mov    0x801126e0,%eax
80102bb2:	85 c0                	test   %eax,%eax
80102bb4:	75 e2                	jne    80102b98 <begin_op+0x18>
80102bb6:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102bbb:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102bc1:	83 c0 01             	add    $0x1,%eax
80102bc4:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102bc7:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102bca:	83 fa 1e             	cmp    $0x1e,%edx
80102bcd:	7f c9                	jg     80102b98 <begin_op+0x18>
80102bcf:	83 ec 0c             	sub    $0xc,%esp
80102bd2:	a3 dc 26 11 80       	mov    %eax,0x801126dc
80102bd7:	68 a0 26 11 80       	push   $0x801126a0
80102bdc:	e8 5f 1a 00 00       	call   80104640 <release>
80102be1:	83 c4 10             	add    $0x10,%esp
80102be4:	c9                   	leave  
80102be5:	c3                   	ret    
80102be6:	8d 76 00             	lea    0x0(%esi),%esi
80102be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102bf0 <end_op>:
80102bf0:	55                   	push   %ebp
80102bf1:	89 e5                	mov    %esp,%ebp
80102bf3:	57                   	push   %edi
80102bf4:	56                   	push   %esi
80102bf5:	53                   	push   %ebx
80102bf6:	83 ec 18             	sub    $0x18,%esp
80102bf9:	68 a0 26 11 80       	push   $0x801126a0
80102bfe:	e8 5d 18 00 00       	call   80104460 <acquire>
80102c03:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102c08:	8b 1d e0 26 11 80    	mov    0x801126e0,%ebx
80102c0e:	83 c4 10             	add    $0x10,%esp
80102c11:	83 e8 01             	sub    $0x1,%eax
80102c14:	85 db                	test   %ebx,%ebx
80102c16:	a3 dc 26 11 80       	mov    %eax,0x801126dc
80102c1b:	0f 85 23 01 00 00    	jne    80102d44 <end_op+0x154>
80102c21:	85 c0                	test   %eax,%eax
80102c23:	0f 85 f7 00 00 00    	jne    80102d20 <end_op+0x130>
80102c29:	83 ec 0c             	sub    $0xc,%esp
80102c2c:	c7 05 e0 26 11 80 01 	movl   $0x1,0x801126e0
80102c33:	00 00 00 
80102c36:	31 db                	xor    %ebx,%ebx
80102c38:	68 a0 26 11 80       	push   $0x801126a0
80102c3d:	e8 fe 19 00 00       	call   80104640 <release>
80102c42:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
80102c48:	83 c4 10             	add    $0x10,%esp
80102c4b:	85 c9                	test   %ecx,%ecx
80102c4d:	0f 8e 8a 00 00 00    	jle    80102cdd <end_op+0xed>
80102c53:	90                   	nop
80102c54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102c58:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102c5d:	83 ec 08             	sub    $0x8,%esp
80102c60:	01 d8                	add    %ebx,%eax
80102c62:	83 c0 01             	add    $0x1,%eax
80102c65:	50                   	push   %eax
80102c66:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102c6c:	e8 5f d4 ff ff       	call   801000d0 <bread>
80102c71:	89 c6                	mov    %eax,%esi
80102c73:	58                   	pop    %eax
80102c74:	5a                   	pop    %edx
80102c75:	ff 34 9d ec 26 11 80 	pushl  -0x7feed914(,%ebx,4)
80102c7c:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102c82:	83 c3 01             	add    $0x1,%ebx
80102c85:	e8 46 d4 ff ff       	call   801000d0 <bread>
80102c8a:	89 c7                	mov    %eax,%edi
80102c8c:	8d 40 5c             	lea    0x5c(%eax),%eax
80102c8f:	83 c4 0c             	add    $0xc,%esp
80102c92:	68 00 02 00 00       	push   $0x200
80102c97:	50                   	push   %eax
80102c98:	8d 46 5c             	lea    0x5c(%esi),%eax
80102c9b:	50                   	push   %eax
80102c9c:	e8 9f 1a 00 00       	call   80104740 <memmove>
80102ca1:	89 34 24             	mov    %esi,(%esp)
80102ca4:	e8 f7 d4 ff ff       	call   801001a0 <bwrite>
80102ca9:	89 3c 24             	mov    %edi,(%esp)
80102cac:	e8 2f d5 ff ff       	call   801001e0 <brelse>
80102cb1:	89 34 24             	mov    %esi,(%esp)
80102cb4:	e8 27 d5 ff ff       	call   801001e0 <brelse>
80102cb9:	83 c4 10             	add    $0x10,%esp
80102cbc:	3b 1d e8 26 11 80    	cmp    0x801126e8,%ebx
80102cc2:	7c 94                	jl     80102c58 <end_op+0x68>
80102cc4:	e8 b7 fd ff ff       	call   80102a80 <write_head>
80102cc9:	e8 12 fd ff ff       	call   801029e0 <install_trans>
80102cce:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102cd5:	00 00 00 
80102cd8:	e8 a3 fd ff ff       	call   80102a80 <write_head>
80102cdd:	83 ec 0c             	sub    $0xc,%esp
80102ce0:	68 a0 26 11 80       	push   $0x801126a0
80102ce5:	e8 76 17 00 00       	call   80104460 <acquire>
80102cea:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102cf1:	c7 05 e0 26 11 80 00 	movl   $0x0,0x801126e0
80102cf8:	00 00 00 
80102cfb:	e8 20 13 00 00       	call   80104020 <wakeup>
80102d00:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d07:	e8 34 19 00 00       	call   80104640 <release>
80102d0c:	83 c4 10             	add    $0x10,%esp
80102d0f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d12:	5b                   	pop    %ebx
80102d13:	5e                   	pop    %esi
80102d14:	5f                   	pop    %edi
80102d15:	5d                   	pop    %ebp
80102d16:	c3                   	ret    
80102d17:	89 f6                	mov    %esi,%esi
80102d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102d20:	83 ec 0c             	sub    $0xc,%esp
80102d23:	68 a0 26 11 80       	push   $0x801126a0
80102d28:	e8 f3 12 00 00       	call   80104020 <wakeup>
80102d2d:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d34:	e8 07 19 00 00       	call   80104640 <release>
80102d39:	83 c4 10             	add    $0x10,%esp
80102d3c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d3f:	5b                   	pop    %ebx
80102d40:	5e                   	pop    %esi
80102d41:	5f                   	pop    %edi
80102d42:	5d                   	pop    %ebp
80102d43:	c3                   	ret    
80102d44:	83 ec 0c             	sub    $0xc,%esp
80102d47:	68 a0 76 10 80       	push   $0x801076a0
80102d4c:	e8 1f d6 ff ff       	call   80100370 <panic>
80102d51:	eb 0d                	jmp    80102d60 <log_write>
80102d53:	90                   	nop
80102d54:	90                   	nop
80102d55:	90                   	nop
80102d56:	90                   	nop
80102d57:	90                   	nop
80102d58:	90                   	nop
80102d59:	90                   	nop
80102d5a:	90                   	nop
80102d5b:	90                   	nop
80102d5c:	90                   	nop
80102d5d:	90                   	nop
80102d5e:	90                   	nop
80102d5f:	90                   	nop

80102d60 <log_write>:
80102d60:	55                   	push   %ebp
80102d61:	89 e5                	mov    %esp,%ebp
80102d63:	53                   	push   %ebx
80102d64:	83 ec 04             	sub    $0x4,%esp
80102d67:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102d6d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102d70:	83 fa 1d             	cmp    $0x1d,%edx
80102d73:	0f 8f 97 00 00 00    	jg     80102e10 <log_write+0xb0>
80102d79:	a1 d8 26 11 80       	mov    0x801126d8,%eax
80102d7e:	83 e8 01             	sub    $0x1,%eax
80102d81:	39 c2                	cmp    %eax,%edx
80102d83:	0f 8d 87 00 00 00    	jge    80102e10 <log_write+0xb0>
80102d89:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102d8e:	85 c0                	test   %eax,%eax
80102d90:	0f 8e 87 00 00 00    	jle    80102e1d <log_write+0xbd>
80102d96:	83 ec 0c             	sub    $0xc,%esp
80102d99:	68 a0 26 11 80       	push   $0x801126a0
80102d9e:	e8 bd 16 00 00       	call   80104460 <acquire>
80102da3:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102da9:	83 c4 10             	add    $0x10,%esp
80102dac:	83 fa 00             	cmp    $0x0,%edx
80102daf:	7e 50                	jle    80102e01 <log_write+0xa1>
80102db1:	8b 4b 08             	mov    0x8(%ebx),%ecx
80102db4:	31 c0                	xor    %eax,%eax
80102db6:	3b 0d ec 26 11 80    	cmp    0x801126ec,%ecx
80102dbc:	75 0b                	jne    80102dc9 <log_write+0x69>
80102dbe:	eb 38                	jmp    80102df8 <log_write+0x98>
80102dc0:	39 0c 85 ec 26 11 80 	cmp    %ecx,-0x7feed914(,%eax,4)
80102dc7:	74 2f                	je     80102df8 <log_write+0x98>
80102dc9:	83 c0 01             	add    $0x1,%eax
80102dcc:	39 d0                	cmp    %edx,%eax
80102dce:	75 f0                	jne    80102dc0 <log_write+0x60>
80102dd0:	89 0c 95 ec 26 11 80 	mov    %ecx,-0x7feed914(,%edx,4)
80102dd7:	83 c2 01             	add    $0x1,%edx
80102dda:	89 15 e8 26 11 80    	mov    %edx,0x801126e8
80102de0:	83 0b 04             	orl    $0x4,(%ebx)
80102de3:	c7 45 08 a0 26 11 80 	movl   $0x801126a0,0x8(%ebp)
80102dea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102ded:	c9                   	leave  
80102dee:	e9 4d 18 00 00       	jmp    80104640 <release>
80102df3:	90                   	nop
80102df4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102df8:	89 0c 85 ec 26 11 80 	mov    %ecx,-0x7feed914(,%eax,4)
80102dff:	eb df                	jmp    80102de0 <log_write+0x80>
80102e01:	8b 43 08             	mov    0x8(%ebx),%eax
80102e04:	a3 ec 26 11 80       	mov    %eax,0x801126ec
80102e09:	75 d5                	jne    80102de0 <log_write+0x80>
80102e0b:	eb ca                	jmp    80102dd7 <log_write+0x77>
80102e0d:	8d 76 00             	lea    0x0(%esi),%esi
80102e10:	83 ec 0c             	sub    $0xc,%esp
80102e13:	68 af 76 10 80       	push   $0x801076af
80102e18:	e8 53 d5 ff ff       	call   80100370 <panic>
80102e1d:	83 ec 0c             	sub    $0xc,%esp
80102e20:	68 c5 76 10 80       	push   $0x801076c5
80102e25:	e8 46 d5 ff ff       	call   80100370 <panic>
80102e2a:	66 90                	xchg   %ax,%ax
80102e2c:	66 90                	xchg   %ax,%ax
80102e2e:	66 90                	xchg   %ax,%ax

80102e30 <mpmain>:
80102e30:	55                   	push   %ebp
80102e31:	89 e5                	mov    %esp,%ebp
80102e33:	83 ec 08             	sub    $0x8,%esp
80102e36:	e8 95 f8 ff ff       	call   801026d0 <cpunum>
80102e3b:	83 ec 08             	sub    $0x8,%esp
80102e3e:	50                   	push   %eax
80102e3f:	68 e0 76 10 80       	push   $0x801076e0
80102e44:	e8 17 d8 ff ff       	call   80100660 <cprintf>
80102e49:	e8 92 2b 00 00       	call   801059e0 <idtinit>
80102e4e:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80102e55:	b8 01 00 00 00       	mov    $0x1,%eax
80102e5a:	f0 87 82 a8 00 00 00 	lock xchg %eax,0xa8(%edx)
80102e61:	e8 da 0c 00 00       	call   80103b40 <scheduler>
80102e66:	8d 76 00             	lea    0x0(%esi),%esi
80102e69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102e70 <mpenter>:
80102e70:	55                   	push   %ebp
80102e71:	89 e5                	mov    %esp,%ebp
80102e73:	83 ec 08             	sub    $0x8,%esp
80102e76:	e8 75 3d 00 00       	call   80106bf0 <switchkvm>
80102e7b:	e8 90 3b 00 00       	call   80106a10 <seginit>
80102e80:	e8 4b f7 ff ff       	call   801025d0 <lapicinit>
80102e85:	e8 a6 ff ff ff       	call   80102e30 <mpmain>
80102e8a:	66 90                	xchg   %ax,%ax
80102e8c:	66 90                	xchg   %ax,%ax
80102e8e:	66 90                	xchg   %ax,%ax

80102e90 <main>:
80102e90:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102e94:	83 e4 f0             	and    $0xfffffff0,%esp
80102e97:	ff 71 fc             	pushl  -0x4(%ecx)
80102e9a:	55                   	push   %ebp
80102e9b:	89 e5                	mov    %esp,%ebp
80102e9d:	53                   	push   %ebx
80102e9e:	51                   	push   %ecx
80102e9f:	83 ec 08             	sub    $0x8,%esp
80102ea2:	68 00 00 40 80       	push   $0x80400000
80102ea7:	68 e8 50 11 80       	push   $0x801150e8
80102eac:	e8 ef f4 ff ff       	call   801023a0 <kinit1>
80102eb1:	e8 1a 3d 00 00       	call   80106bd0 <kvmalloc>
80102eb6:	e8 b5 01 00 00       	call   80103070 <mpinit>
80102ebb:	e8 10 f7 ff ff       	call   801025d0 <lapicinit>
80102ec0:	e8 4b 3b 00 00       	call   80106a10 <seginit>
80102ec5:	e8 06 f8 ff ff       	call   801026d0 <cpunum>
80102eca:	5a                   	pop    %edx
80102ecb:	59                   	pop    %ecx
80102ecc:	50                   	push   %eax
80102ecd:	68 f1 76 10 80       	push   $0x801076f1
80102ed2:	e8 89 d7 ff ff       	call   80100660 <cprintf>
80102ed7:	e8 a4 03 00 00       	call   80103280 <picinit>
80102edc:	e8 df f2 ff ff       	call   801021c0 <ioapicinit>
80102ee1:	e8 ba da ff ff       	call   801009a0 <consoleinit>
80102ee6:	e8 f5 2d 00 00       	call   80105ce0 <uartinit>
80102eeb:	e8 30 09 00 00       	call   80103820 <pinit>
80102ef0:	e8 4b 2a 00 00       	call   80105940 <tvinit>
80102ef5:	e8 46 d1 ff ff       	call   80100040 <binit>
80102efa:	e8 31 de ff ff       	call   80100d30 <fileinit>
80102eff:	e8 8c f0 ff ff       	call   80101f90 <ideinit>
80102f04:	8b 1d 84 27 11 80    	mov    0x80112784,%ebx
80102f0a:	83 c4 10             	add    $0x10,%esp
80102f0d:	85 db                	test   %ebx,%ebx
80102f0f:	0f 84 ca 00 00 00    	je     80102fdf <main+0x14f>
80102f15:	83 ec 04             	sub    $0x4,%esp
80102f18:	bb a0 27 11 80       	mov    $0x801127a0,%ebx
80102f1d:	68 8a 00 00 00       	push   $0x8a
80102f22:	68 8c a4 10 80       	push   $0x8010a48c
80102f27:	68 00 70 00 80       	push   $0x80007000
80102f2c:	e8 0f 18 00 00       	call   80104740 <memmove>
80102f31:	69 05 5c 28 11 80 bc 	imul   $0xbc,0x8011285c,%eax
80102f38:	00 00 00 
80102f3b:	83 c4 10             	add    $0x10,%esp
80102f3e:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102f43:	39 d8                	cmp    %ebx,%eax
80102f45:	76 7c                	jbe    80102fc3 <main+0x133>
80102f47:	89 f6                	mov    %esi,%esi
80102f49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102f50:	e8 7b f7 ff ff       	call   801026d0 <cpunum>
80102f55:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80102f5b:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102f60:	39 c3                	cmp    %eax,%ebx
80102f62:	74 46                	je     80102faa <main+0x11a>
80102f64:	e8 07 f5 ff ff       	call   80102470 <kalloc>
80102f69:	83 ec 08             	sub    $0x8,%esp
80102f6c:	05 00 10 00 00       	add    $0x1000,%eax
80102f71:	c7 05 f8 6f 00 80 70 	movl   $0x80102e70,0x80006ff8
80102f78:	2e 10 80 
80102f7b:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
80102f80:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102f87:	90 10 00 
80102f8a:	68 00 70 00 00       	push   $0x7000
80102f8f:	0f b6 03             	movzbl (%ebx),%eax
80102f92:	50                   	push   %eax
80102f93:	e8 d8 f7 ff ff       	call   80102770 <lapicstartap>
80102f98:	83 c4 10             	add    $0x10,%esp
80102f9b:	90                   	nop
80102f9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102fa0:	8b 83 a8 00 00 00    	mov    0xa8(%ebx),%eax
80102fa6:	85 c0                	test   %eax,%eax
80102fa8:	74 f6                	je     80102fa0 <main+0x110>
80102faa:	69 05 5c 28 11 80 bc 	imul   $0xbc,0x8011285c,%eax
80102fb1:	00 00 00 
80102fb4:	81 c3 bc 00 00 00    	add    $0xbc,%ebx
80102fba:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102fbf:	39 c3                	cmp    %eax,%ebx
80102fc1:	72 8d                	jb     80102f50 <main+0xc0>
80102fc3:	83 ec 08             	sub    $0x8,%esp
80102fc6:	68 00 00 00 8e       	push   $0x8e000000
80102fcb:	68 00 00 40 80       	push   $0x80400000
80102fd0:	e8 3b f4 ff ff       	call   80102410 <kinit2>
80102fd5:	e8 66 08 00 00       	call   80103840 <userinit>
80102fda:	e8 51 fe ff ff       	call   80102e30 <mpmain>
80102fdf:	e8 fc 28 00 00       	call   801058e0 <timerinit>
80102fe4:	e9 2c ff ff ff       	jmp    80102f15 <main+0x85>
80102fe9:	66 90                	xchg   %ax,%ax
80102feb:	66 90                	xchg   %ax,%ax
80102fed:	66 90                	xchg   %ax,%ax
80102fef:	90                   	nop

80102ff0 <mpsearch1>:
80102ff0:	55                   	push   %ebp
80102ff1:	89 e5                	mov    %esp,%ebp
80102ff3:	57                   	push   %edi
80102ff4:	56                   	push   %esi
80102ff5:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
80102ffb:	53                   	push   %ebx
80102ffc:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
80102fff:	83 ec 0c             	sub    $0xc,%esp
80103002:	39 de                	cmp    %ebx,%esi
80103004:	73 48                	jae    8010304e <mpsearch1+0x5e>
80103006:	8d 76 00             	lea    0x0(%esi),%esi
80103009:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103010:	83 ec 04             	sub    $0x4,%esp
80103013:	8d 7e 10             	lea    0x10(%esi),%edi
80103016:	6a 04                	push   $0x4
80103018:	68 08 77 10 80       	push   $0x80107708
8010301d:	56                   	push   %esi
8010301e:	e8 bd 16 00 00       	call   801046e0 <memcmp>
80103023:	83 c4 10             	add    $0x10,%esp
80103026:	85 c0                	test   %eax,%eax
80103028:	75 1e                	jne    80103048 <mpsearch1+0x58>
8010302a:	8d 7e 10             	lea    0x10(%esi),%edi
8010302d:	89 f2                	mov    %esi,%edx
8010302f:	31 c9                	xor    %ecx,%ecx
80103031:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103038:	0f b6 02             	movzbl (%edx),%eax
8010303b:	83 c2 01             	add    $0x1,%edx
8010303e:	01 c1                	add    %eax,%ecx
80103040:	39 fa                	cmp    %edi,%edx
80103042:	75 f4                	jne    80103038 <mpsearch1+0x48>
80103044:	84 c9                	test   %cl,%cl
80103046:	74 10                	je     80103058 <mpsearch1+0x68>
80103048:	39 fb                	cmp    %edi,%ebx
8010304a:	89 fe                	mov    %edi,%esi
8010304c:	77 c2                	ja     80103010 <mpsearch1+0x20>
8010304e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103051:	31 c0                	xor    %eax,%eax
80103053:	5b                   	pop    %ebx
80103054:	5e                   	pop    %esi
80103055:	5f                   	pop    %edi
80103056:	5d                   	pop    %ebp
80103057:	c3                   	ret    
80103058:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010305b:	89 f0                	mov    %esi,%eax
8010305d:	5b                   	pop    %ebx
8010305e:	5e                   	pop    %esi
8010305f:	5f                   	pop    %edi
80103060:	5d                   	pop    %ebp
80103061:	c3                   	ret    
80103062:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103069:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103070 <mpinit>:
80103070:	55                   	push   %ebp
80103071:	89 e5                	mov    %esp,%ebp
80103073:	57                   	push   %edi
80103074:	56                   	push   %esi
80103075:	53                   	push   %ebx
80103076:	83 ec 1c             	sub    $0x1c,%esp
80103079:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103080:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103087:	c1 e0 08             	shl    $0x8,%eax
8010308a:	09 d0                	or     %edx,%eax
8010308c:	c1 e0 04             	shl    $0x4,%eax
8010308f:	85 c0                	test   %eax,%eax
80103091:	75 1b                	jne    801030ae <mpinit+0x3e>
80103093:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010309a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
801030a1:	c1 e0 08             	shl    $0x8,%eax
801030a4:	09 d0                	or     %edx,%eax
801030a6:	c1 e0 0a             	shl    $0xa,%eax
801030a9:	2d 00 04 00 00       	sub    $0x400,%eax
801030ae:	ba 00 04 00 00       	mov    $0x400,%edx
801030b3:	e8 38 ff ff ff       	call   80102ff0 <mpsearch1>
801030b8:	85 c0                	test   %eax,%eax
801030ba:	89 c6                	mov    %eax,%esi
801030bc:	0f 84 66 01 00 00    	je     80103228 <mpinit+0x1b8>
801030c2:	8b 5e 04             	mov    0x4(%esi),%ebx
801030c5:	85 db                	test   %ebx,%ebx
801030c7:	0f 84 d2 00 00 00    	je     8010319f <mpinit+0x12f>
801030cd:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801030d3:	83 ec 04             	sub    $0x4,%esp
801030d6:	6a 04                	push   $0x4
801030d8:	68 0d 77 10 80       	push   $0x8010770d
801030dd:	50                   	push   %eax
801030de:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801030e1:	e8 fa 15 00 00       	call   801046e0 <memcmp>
801030e6:	83 c4 10             	add    $0x10,%esp
801030e9:	85 c0                	test   %eax,%eax
801030eb:	0f 85 ae 00 00 00    	jne    8010319f <mpinit+0x12f>
801030f1:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
801030f8:	3c 01                	cmp    $0x1,%al
801030fa:	74 08                	je     80103104 <mpinit+0x94>
801030fc:	3c 04                	cmp    $0x4,%al
801030fe:	0f 85 9b 00 00 00    	jne    8010319f <mpinit+0x12f>
80103104:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
8010310b:	85 ff                	test   %edi,%edi
8010310d:	74 1e                	je     8010312d <mpinit+0xbd>
8010310f:	31 d2                	xor    %edx,%edx
80103111:	31 c0                	xor    %eax,%eax
80103113:	90                   	nop
80103114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103118:	0f b6 8c 03 00 00 00 	movzbl -0x80000000(%ebx,%eax,1),%ecx
8010311f:	80 
80103120:	83 c0 01             	add    $0x1,%eax
80103123:	01 ca                	add    %ecx,%edx
80103125:	39 c7                	cmp    %eax,%edi
80103127:	75 ef                	jne    80103118 <mpinit+0xa8>
80103129:	84 d2                	test   %dl,%dl
8010312b:	75 72                	jne    8010319f <mpinit+0x12f>
8010312d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103130:	85 ff                	test   %edi,%edi
80103132:	74 6b                	je     8010319f <mpinit+0x12f>
80103134:	c7 05 84 27 11 80 01 	movl   $0x1,0x80112784
8010313b:	00 00 00 
8010313e:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
80103144:	a3 9c 26 11 80       	mov    %eax,0x8011269c
80103149:	0f b7 8b 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%ecx
80103150:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
80103156:	01 f9                	add    %edi,%ecx
80103158:	39 c8                	cmp    %ecx,%eax
8010315a:	0f 83 a0 00 00 00    	jae    80103200 <mpinit+0x190>
80103160:	80 38 04             	cmpb   $0x4,(%eax)
80103163:	77 6b                	ja     801031d0 <mpinit+0x160>
80103165:	0f b6 10             	movzbl (%eax),%edx
80103168:	ff 24 95 14 77 10 80 	jmp    *-0x7fef88ec(,%edx,4)
8010316f:	90                   	nop
80103170:	83 c0 08             	add    $0x8,%eax
80103173:	39 c1                	cmp    %eax,%ecx
80103175:	77 e9                	ja     80103160 <mpinit+0xf0>
80103177:	a1 84 27 11 80       	mov    0x80112784,%eax
8010317c:	85 c0                	test   %eax,%eax
8010317e:	0f 85 7c 00 00 00    	jne    80103200 <mpinit+0x190>
80103184:	c7 05 5c 28 11 80 01 	movl   $0x1,0x8011285c
8010318b:	00 00 00 
8010318e:	c7 05 9c 26 11 80 00 	movl   $0x0,0x8011269c
80103195:	00 00 00 
80103198:	c6 05 80 27 11 80 00 	movb   $0x0,0x80112780
8010319f:	8d 65 f4             	lea    -0xc(%ebp),%esp
801031a2:	5b                   	pop    %ebx
801031a3:	5e                   	pop    %esi
801031a4:	5f                   	pop    %edi
801031a5:	5d                   	pop    %ebp
801031a6:	c3                   	ret    
801031a7:	89 f6                	mov    %esi,%esi
801031a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801031b0:	8b 15 5c 28 11 80    	mov    0x8011285c,%edx
801031b6:	85 d2                	test   %edx,%edx
801031b8:	7e 26                	jle    801031e0 <mpinit+0x170>
801031ba:	83 c0 14             	add    $0x14,%eax
801031bd:	eb b4                	jmp    80103173 <mpinit+0x103>
801031bf:	90                   	nop
801031c0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
801031c4:	83 c0 08             	add    $0x8,%eax
801031c7:	88 15 80 27 11 80    	mov    %dl,0x80112780
801031cd:	eb a4                	jmp    80103173 <mpinit+0x103>
801031cf:	90                   	nop
801031d0:	c7 05 84 27 11 80 00 	movl   $0x0,0x80112784
801031d7:	00 00 00 
801031da:	eb 97                	jmp    80103173 <mpinit+0x103>
801031dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801031e0:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
801031e4:	69 fa bc 00 00 00    	imul   $0xbc,%edx,%edi
801031ea:	83 c2 01             	add    $0x1,%edx
801031ed:	89 15 5c 28 11 80    	mov    %edx,0x8011285c
801031f3:	88 9f a0 27 11 80    	mov    %bl,-0x7feed860(%edi)
801031f9:	eb bf                	jmp    801031ba <mpinit+0x14a>
801031fb:	90                   	nop
801031fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103200:	80 7e 0c 00          	cmpb   $0x0,0xc(%esi)
80103204:	74 99                	je     8010319f <mpinit+0x12f>
80103206:	ba 22 00 00 00       	mov    $0x22,%edx
8010320b:	b8 70 00 00 00       	mov    $0x70,%eax
80103210:	ee                   	out    %al,(%dx)
80103211:	ba 23 00 00 00       	mov    $0x23,%edx
80103216:	ec                   	in     (%dx),%al
80103217:	83 c8 01             	or     $0x1,%eax
8010321a:	ee                   	out    %al,(%dx)
8010321b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010321e:	5b                   	pop    %ebx
8010321f:	5e                   	pop    %esi
80103220:	5f                   	pop    %edi
80103221:	5d                   	pop    %ebp
80103222:	c3                   	ret    
80103223:	90                   	nop
80103224:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103228:	ba 00 00 01 00       	mov    $0x10000,%edx
8010322d:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80103232:	e8 b9 fd ff ff       	call   80102ff0 <mpsearch1>
80103237:	85 c0                	test   %eax,%eax
80103239:	89 c6                	mov    %eax,%esi
8010323b:	0f 85 81 fe ff ff    	jne    801030c2 <mpinit+0x52>
80103241:	e9 59 ff ff ff       	jmp    8010319f <mpinit+0x12f>
80103246:	66 90                	xchg   %ax,%ax
80103248:	66 90                	xchg   %ax,%ax
8010324a:	66 90                	xchg   %ax,%ax
8010324c:	66 90                	xchg   %ax,%ax
8010324e:	66 90                	xchg   %ax,%ax

80103250 <picenable>:
80103250:	55                   	push   %ebp
80103251:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
80103256:	ba 21 00 00 00       	mov    $0x21,%edx
8010325b:	89 e5                	mov    %esp,%ebp
8010325d:	8b 4d 08             	mov    0x8(%ebp),%ecx
80103260:	d3 c0                	rol    %cl,%eax
80103262:	66 23 05 00 a0 10 80 	and    0x8010a000,%ax
80103269:	66 a3 00 a0 10 80    	mov    %ax,0x8010a000
8010326f:	ee                   	out    %al,(%dx)
80103270:	ba a1 00 00 00       	mov    $0xa1,%edx
80103275:	66 c1 e8 08          	shr    $0x8,%ax
80103279:	ee                   	out    %al,(%dx)
8010327a:	5d                   	pop    %ebp
8010327b:	c3                   	ret    
8010327c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103280 <picinit>:
80103280:	55                   	push   %ebp
80103281:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103286:	89 e5                	mov    %esp,%ebp
80103288:	57                   	push   %edi
80103289:	56                   	push   %esi
8010328a:	53                   	push   %ebx
8010328b:	bb 21 00 00 00       	mov    $0x21,%ebx
80103290:	89 da                	mov    %ebx,%edx
80103292:	ee                   	out    %al,(%dx)
80103293:	b9 a1 00 00 00       	mov    $0xa1,%ecx
80103298:	89 ca                	mov    %ecx,%edx
8010329a:	ee                   	out    %al,(%dx)
8010329b:	bf 11 00 00 00       	mov    $0x11,%edi
801032a0:	be 20 00 00 00       	mov    $0x20,%esi
801032a5:	89 f8                	mov    %edi,%eax
801032a7:	89 f2                	mov    %esi,%edx
801032a9:	ee                   	out    %al,(%dx)
801032aa:	b8 20 00 00 00       	mov    $0x20,%eax
801032af:	89 da                	mov    %ebx,%edx
801032b1:	ee                   	out    %al,(%dx)
801032b2:	b8 04 00 00 00       	mov    $0x4,%eax
801032b7:	ee                   	out    %al,(%dx)
801032b8:	b8 03 00 00 00       	mov    $0x3,%eax
801032bd:	ee                   	out    %al,(%dx)
801032be:	bb a0 00 00 00       	mov    $0xa0,%ebx
801032c3:	89 f8                	mov    %edi,%eax
801032c5:	89 da                	mov    %ebx,%edx
801032c7:	ee                   	out    %al,(%dx)
801032c8:	b8 28 00 00 00       	mov    $0x28,%eax
801032cd:	89 ca                	mov    %ecx,%edx
801032cf:	ee                   	out    %al,(%dx)
801032d0:	b8 02 00 00 00       	mov    $0x2,%eax
801032d5:	ee                   	out    %al,(%dx)
801032d6:	b8 03 00 00 00       	mov    $0x3,%eax
801032db:	ee                   	out    %al,(%dx)
801032dc:	bf 68 00 00 00       	mov    $0x68,%edi
801032e1:	89 f2                	mov    %esi,%edx
801032e3:	89 f8                	mov    %edi,%eax
801032e5:	ee                   	out    %al,(%dx)
801032e6:	b9 0a 00 00 00       	mov    $0xa,%ecx
801032eb:	89 c8                	mov    %ecx,%eax
801032ed:	ee                   	out    %al,(%dx)
801032ee:	89 f8                	mov    %edi,%eax
801032f0:	89 da                	mov    %ebx,%edx
801032f2:	ee                   	out    %al,(%dx)
801032f3:	89 c8                	mov    %ecx,%eax
801032f5:	ee                   	out    %al,(%dx)
801032f6:	0f b7 05 00 a0 10 80 	movzwl 0x8010a000,%eax
801032fd:	66 83 f8 ff          	cmp    $0xffff,%ax
80103301:	74 10                	je     80103313 <picinit+0x93>
80103303:	ba 21 00 00 00       	mov    $0x21,%edx
80103308:	ee                   	out    %al,(%dx)
80103309:	ba a1 00 00 00       	mov    $0xa1,%edx
8010330e:	66 c1 e8 08          	shr    $0x8,%ax
80103312:	ee                   	out    %al,(%dx)
80103313:	5b                   	pop    %ebx
80103314:	5e                   	pop    %esi
80103315:	5f                   	pop    %edi
80103316:	5d                   	pop    %ebp
80103317:	c3                   	ret    
80103318:	66 90                	xchg   %ax,%ax
8010331a:	66 90                	xchg   %ax,%ax
8010331c:	66 90                	xchg   %ax,%ax
8010331e:	66 90                	xchg   %ax,%ax

80103320 <pipealloc>:
80103320:	55                   	push   %ebp
80103321:	89 e5                	mov    %esp,%ebp
80103323:	57                   	push   %edi
80103324:	56                   	push   %esi
80103325:	53                   	push   %ebx
80103326:	83 ec 0c             	sub    $0xc,%esp
80103329:	8b 75 08             	mov    0x8(%ebp),%esi
8010332c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010332f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103335:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010333b:	e8 10 da ff ff       	call   80100d50 <filealloc>
80103340:	85 c0                	test   %eax,%eax
80103342:	89 06                	mov    %eax,(%esi)
80103344:	0f 84 a8 00 00 00    	je     801033f2 <pipealloc+0xd2>
8010334a:	e8 01 da ff ff       	call   80100d50 <filealloc>
8010334f:	85 c0                	test   %eax,%eax
80103351:	89 03                	mov    %eax,(%ebx)
80103353:	0f 84 87 00 00 00    	je     801033e0 <pipealloc+0xc0>
80103359:	e8 12 f1 ff ff       	call   80102470 <kalloc>
8010335e:	85 c0                	test   %eax,%eax
80103360:	89 c7                	mov    %eax,%edi
80103362:	0f 84 b0 00 00 00    	je     80103418 <pipealloc+0xf8>
80103368:	83 ec 08             	sub    $0x8,%esp
8010336b:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103372:	00 00 00 
80103375:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010337c:	00 00 00 
8010337f:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103386:	00 00 00 
80103389:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103390:	00 00 00 
80103393:	68 28 77 10 80       	push   $0x80107728
80103398:	50                   	push   %eax
80103399:	e8 a2 10 00 00       	call   80104440 <initlock>
8010339e:	8b 06                	mov    (%esi),%eax
801033a0:	83 c4 10             	add    $0x10,%esp
801033a3:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
801033a9:	8b 06                	mov    (%esi),%eax
801033ab:	c6 40 08 01          	movb   $0x1,0x8(%eax)
801033af:	8b 06                	mov    (%esi),%eax
801033b1:	c6 40 09 00          	movb   $0x0,0x9(%eax)
801033b5:	8b 06                	mov    (%esi),%eax
801033b7:	89 78 0c             	mov    %edi,0xc(%eax)
801033ba:	8b 03                	mov    (%ebx),%eax
801033bc:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
801033c2:	8b 03                	mov    (%ebx),%eax
801033c4:	c6 40 08 00          	movb   $0x0,0x8(%eax)
801033c8:	8b 03                	mov    (%ebx),%eax
801033ca:	c6 40 09 01          	movb   $0x1,0x9(%eax)
801033ce:	8b 03                	mov    (%ebx),%eax
801033d0:	89 78 0c             	mov    %edi,0xc(%eax)
801033d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801033d6:	31 c0                	xor    %eax,%eax
801033d8:	5b                   	pop    %ebx
801033d9:	5e                   	pop    %esi
801033da:	5f                   	pop    %edi
801033db:	5d                   	pop    %ebp
801033dc:	c3                   	ret    
801033dd:	8d 76 00             	lea    0x0(%esi),%esi
801033e0:	8b 06                	mov    (%esi),%eax
801033e2:	85 c0                	test   %eax,%eax
801033e4:	74 1e                	je     80103404 <pipealloc+0xe4>
801033e6:	83 ec 0c             	sub    $0xc,%esp
801033e9:	50                   	push   %eax
801033ea:	e8 21 da ff ff       	call   80100e10 <fileclose>
801033ef:	83 c4 10             	add    $0x10,%esp
801033f2:	8b 03                	mov    (%ebx),%eax
801033f4:	85 c0                	test   %eax,%eax
801033f6:	74 0c                	je     80103404 <pipealloc+0xe4>
801033f8:	83 ec 0c             	sub    $0xc,%esp
801033fb:	50                   	push   %eax
801033fc:	e8 0f da ff ff       	call   80100e10 <fileclose>
80103401:	83 c4 10             	add    $0x10,%esp
80103404:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103407:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010340c:	5b                   	pop    %ebx
8010340d:	5e                   	pop    %esi
8010340e:	5f                   	pop    %edi
8010340f:	5d                   	pop    %ebp
80103410:	c3                   	ret    
80103411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103418:	8b 06                	mov    (%esi),%eax
8010341a:	85 c0                	test   %eax,%eax
8010341c:	75 c8                	jne    801033e6 <pipealloc+0xc6>
8010341e:	eb d2                	jmp    801033f2 <pipealloc+0xd2>

80103420 <pipeclose>:
80103420:	55                   	push   %ebp
80103421:	89 e5                	mov    %esp,%ebp
80103423:	56                   	push   %esi
80103424:	53                   	push   %ebx
80103425:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103428:	8b 75 0c             	mov    0xc(%ebp),%esi
8010342b:	83 ec 0c             	sub    $0xc,%esp
8010342e:	53                   	push   %ebx
8010342f:	e8 2c 10 00 00       	call   80104460 <acquire>
80103434:	83 c4 10             	add    $0x10,%esp
80103437:	85 f6                	test   %esi,%esi
80103439:	74 45                	je     80103480 <pipeclose+0x60>
8010343b:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103441:	83 ec 0c             	sub    $0xc,%esp
80103444:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010344b:	00 00 00 
8010344e:	50                   	push   %eax
8010344f:	e8 cc 0b 00 00       	call   80104020 <wakeup>
80103454:	83 c4 10             	add    $0x10,%esp
80103457:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010345d:	85 d2                	test   %edx,%edx
8010345f:	75 0a                	jne    8010346b <pipeclose+0x4b>
80103461:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103467:	85 c0                	test   %eax,%eax
80103469:	74 35                	je     801034a0 <pipeclose+0x80>
8010346b:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010346e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103471:	5b                   	pop    %ebx
80103472:	5e                   	pop    %esi
80103473:	5d                   	pop    %ebp
80103474:	e9 c7 11 00 00       	jmp    80104640 <release>
80103479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103480:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103486:	83 ec 0c             	sub    $0xc,%esp
80103489:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103490:	00 00 00 
80103493:	50                   	push   %eax
80103494:	e8 87 0b 00 00       	call   80104020 <wakeup>
80103499:	83 c4 10             	add    $0x10,%esp
8010349c:	eb b9                	jmp    80103457 <pipeclose+0x37>
8010349e:	66 90                	xchg   %ax,%ax
801034a0:	83 ec 0c             	sub    $0xc,%esp
801034a3:	53                   	push   %ebx
801034a4:	e8 97 11 00 00       	call   80104640 <release>
801034a9:	89 5d 08             	mov    %ebx,0x8(%ebp)
801034ac:	83 c4 10             	add    $0x10,%esp
801034af:	8d 65 f8             	lea    -0x8(%ebp),%esp
801034b2:	5b                   	pop    %ebx
801034b3:	5e                   	pop    %esi
801034b4:	5d                   	pop    %ebp
801034b5:	e9 06 ee ff ff       	jmp    801022c0 <kfree>
801034ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801034c0 <pipewrite>:
801034c0:	55                   	push   %ebp
801034c1:	89 e5                	mov    %esp,%ebp
801034c3:	57                   	push   %edi
801034c4:	56                   	push   %esi
801034c5:	53                   	push   %ebx
801034c6:	83 ec 28             	sub    $0x28,%esp
801034c9:	8b 7d 08             	mov    0x8(%ebp),%edi
801034cc:	57                   	push   %edi
801034cd:	e8 8e 0f 00 00       	call   80104460 <acquire>
801034d2:	8b 45 10             	mov    0x10(%ebp),%eax
801034d5:	83 c4 10             	add    $0x10,%esp
801034d8:	85 c0                	test   %eax,%eax
801034da:	0f 8e c6 00 00 00    	jle    801035a6 <pipewrite+0xe6>
801034e0:	8b 45 0c             	mov    0xc(%ebp),%eax
801034e3:	8b 8f 38 02 00 00    	mov    0x238(%edi),%ecx
801034e9:	8d b7 34 02 00 00    	lea    0x234(%edi),%esi
801034ef:	8d 9f 38 02 00 00    	lea    0x238(%edi),%ebx
801034f5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801034f8:	03 45 10             	add    0x10(%ebp),%eax
801034fb:	89 45 e0             	mov    %eax,-0x20(%ebp)
801034fe:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
80103504:	8d 90 00 02 00 00    	lea    0x200(%eax),%edx
8010350a:	39 d1                	cmp    %edx,%ecx
8010350c:	0f 85 cf 00 00 00    	jne    801035e1 <pipewrite+0x121>
80103512:	8b 97 3c 02 00 00    	mov    0x23c(%edi),%edx
80103518:	85 d2                	test   %edx,%edx
8010351a:	0f 84 a8 00 00 00    	je     801035c8 <pipewrite+0x108>
80103520:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103527:	8b 42 24             	mov    0x24(%edx),%eax
8010352a:	85 c0                	test   %eax,%eax
8010352c:	74 25                	je     80103553 <pipewrite+0x93>
8010352e:	e9 95 00 00 00       	jmp    801035c8 <pipewrite+0x108>
80103533:	90                   	nop
80103534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103538:	8b 87 3c 02 00 00    	mov    0x23c(%edi),%eax
8010353e:	85 c0                	test   %eax,%eax
80103540:	0f 84 82 00 00 00    	je     801035c8 <pipewrite+0x108>
80103546:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010354c:	8b 40 24             	mov    0x24(%eax),%eax
8010354f:	85 c0                	test   %eax,%eax
80103551:	75 75                	jne    801035c8 <pipewrite+0x108>
80103553:	83 ec 0c             	sub    $0xc,%esp
80103556:	56                   	push   %esi
80103557:	e8 c4 0a 00 00       	call   80104020 <wakeup>
8010355c:	59                   	pop    %ecx
8010355d:	58                   	pop    %eax
8010355e:	57                   	push   %edi
8010355f:	53                   	push   %ebx
80103560:	e8 1b 09 00 00       	call   80103e80 <sleep>
80103565:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
8010356b:	8b 97 38 02 00 00    	mov    0x238(%edi),%edx
80103571:	83 c4 10             	add    $0x10,%esp
80103574:	05 00 02 00 00       	add    $0x200,%eax
80103579:	39 c2                	cmp    %eax,%edx
8010357b:	74 bb                	je     80103538 <pipewrite+0x78>
8010357d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103580:	8d 4a 01             	lea    0x1(%edx),%ecx
80103583:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
80103587:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
8010358d:	89 8f 38 02 00 00    	mov    %ecx,0x238(%edi)
80103593:	0f b6 00             	movzbl (%eax),%eax
80103596:	88 44 17 34          	mov    %al,0x34(%edi,%edx,1)
8010359a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010359d:	3b 45 e0             	cmp    -0x20(%ebp),%eax
801035a0:	0f 85 58 ff ff ff    	jne    801034fe <pipewrite+0x3e>
801035a6:	8d 97 34 02 00 00    	lea    0x234(%edi),%edx
801035ac:	83 ec 0c             	sub    $0xc,%esp
801035af:	52                   	push   %edx
801035b0:	e8 6b 0a 00 00       	call   80104020 <wakeup>
801035b5:	89 3c 24             	mov    %edi,(%esp)
801035b8:	e8 83 10 00 00       	call   80104640 <release>
801035bd:	83 c4 10             	add    $0x10,%esp
801035c0:	8b 45 10             	mov    0x10(%ebp),%eax
801035c3:	eb 14                	jmp    801035d9 <pipewrite+0x119>
801035c5:	8d 76 00             	lea    0x0(%esi),%esi
801035c8:	83 ec 0c             	sub    $0xc,%esp
801035cb:	57                   	push   %edi
801035cc:	e8 6f 10 00 00       	call   80104640 <release>
801035d1:	83 c4 10             	add    $0x10,%esp
801035d4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801035d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801035dc:	5b                   	pop    %ebx
801035dd:	5e                   	pop    %esi
801035de:	5f                   	pop    %edi
801035df:	5d                   	pop    %ebp
801035e0:	c3                   	ret    
801035e1:	89 ca                	mov    %ecx,%edx
801035e3:	eb 98                	jmp    8010357d <pipewrite+0xbd>
801035e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801035e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801035f0 <piperead>:
801035f0:	55                   	push   %ebp
801035f1:	89 e5                	mov    %esp,%ebp
801035f3:	57                   	push   %edi
801035f4:	56                   	push   %esi
801035f5:	53                   	push   %ebx
801035f6:	83 ec 18             	sub    $0x18,%esp
801035f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801035fc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801035ff:	53                   	push   %ebx
80103600:	e8 5b 0e 00 00       	call   80104460 <acquire>
80103605:	83 c4 10             	add    $0x10,%esp
80103608:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010360e:	39 83 38 02 00 00    	cmp    %eax,0x238(%ebx)
80103614:	75 6a                	jne    80103680 <piperead+0x90>
80103616:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
8010361c:	85 f6                	test   %esi,%esi
8010361e:	0f 84 cc 00 00 00    	je     801036f0 <piperead+0x100>
80103624:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
8010362a:	eb 2d                	jmp    80103659 <piperead+0x69>
8010362c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103630:	83 ec 08             	sub    $0x8,%esp
80103633:	53                   	push   %ebx
80103634:	56                   	push   %esi
80103635:	e8 46 08 00 00       	call   80103e80 <sleep>
8010363a:	83 c4 10             	add    $0x10,%esp
8010363d:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
80103643:	39 83 34 02 00 00    	cmp    %eax,0x234(%ebx)
80103649:	75 35                	jne    80103680 <piperead+0x90>
8010364b:	8b 93 40 02 00 00    	mov    0x240(%ebx),%edx
80103651:	85 d2                	test   %edx,%edx
80103653:	0f 84 97 00 00 00    	je     801036f0 <piperead+0x100>
80103659:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103660:	8b 4a 24             	mov    0x24(%edx),%ecx
80103663:	85 c9                	test   %ecx,%ecx
80103665:	74 c9                	je     80103630 <piperead+0x40>
80103667:	83 ec 0c             	sub    $0xc,%esp
8010366a:	53                   	push   %ebx
8010366b:	e8 d0 0f 00 00       	call   80104640 <release>
80103670:	83 c4 10             	add    $0x10,%esp
80103673:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103676:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010367b:	5b                   	pop    %ebx
8010367c:	5e                   	pop    %esi
8010367d:	5f                   	pop    %edi
8010367e:	5d                   	pop    %ebp
8010367f:	c3                   	ret    
80103680:	8b 45 10             	mov    0x10(%ebp),%eax
80103683:	85 c0                	test   %eax,%eax
80103685:	7e 69                	jle    801036f0 <piperead+0x100>
80103687:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
8010368d:	31 c9                	xor    %ecx,%ecx
8010368f:	eb 15                	jmp    801036a6 <piperead+0xb6>
80103691:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103698:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
8010369e:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
801036a4:	74 5a                	je     80103700 <piperead+0x110>
801036a6:	8d 72 01             	lea    0x1(%edx),%esi
801036a9:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
801036af:	89 b3 34 02 00 00    	mov    %esi,0x234(%ebx)
801036b5:	0f b6 54 13 34       	movzbl 0x34(%ebx,%edx,1),%edx
801036ba:	88 14 0f             	mov    %dl,(%edi,%ecx,1)
801036bd:	83 c1 01             	add    $0x1,%ecx
801036c0:	39 4d 10             	cmp    %ecx,0x10(%ebp)
801036c3:	75 d3                	jne    80103698 <piperead+0xa8>
801036c5:	8d 93 38 02 00 00    	lea    0x238(%ebx),%edx
801036cb:	83 ec 0c             	sub    $0xc,%esp
801036ce:	52                   	push   %edx
801036cf:	e8 4c 09 00 00       	call   80104020 <wakeup>
801036d4:	89 1c 24             	mov    %ebx,(%esp)
801036d7:	e8 64 0f 00 00       	call   80104640 <release>
801036dc:	8b 45 10             	mov    0x10(%ebp),%eax
801036df:	83 c4 10             	add    $0x10,%esp
801036e2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801036e5:	5b                   	pop    %ebx
801036e6:	5e                   	pop    %esi
801036e7:	5f                   	pop    %edi
801036e8:	5d                   	pop    %ebp
801036e9:	c3                   	ret    
801036ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801036f0:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
801036f7:	eb cc                	jmp    801036c5 <piperead+0xd5>
801036f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103700:	89 4d 10             	mov    %ecx,0x10(%ebp)
80103703:	eb c0                	jmp    801036c5 <piperead+0xd5>
80103705:	66 90                	xchg   %ax,%ax
80103707:	66 90                	xchg   %ax,%ax
80103709:	66 90                	xchg   %ax,%ax
8010370b:	66 90                	xchg   %ax,%ax
8010370d:	66 90                	xchg   %ax,%ax
8010370f:	90                   	nop

80103710 <allocproc>:
// If found, change state to EMBRYO and initializesrc refspec master matches more than one.
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103710:	55                   	push   %ebp
80103711:	89 e5                	mov    %esp,%ebp
80103713:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103714:	bb 94 28 11 80       	mov    $0x80112894,%ebx
// If found, change state to EMBRYO and initializesrc refspec master matches more than one.
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103719:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
8010371c:	68 60 28 11 80       	push   $0x80112860
80103721:	e8 3a 0d 00 00       	call   80104460 <acquire>
80103726:	83 c4 10             	add    $0x10,%esp
80103729:	eb 10                	jmp    8010373b <allocproc+0x2b>
8010372b:	90                   	nop
8010372c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103730:	83 eb 80             	sub    $0xffffff80,%ebx
80103733:	81 fb 94 48 11 80    	cmp    $0x80114894,%ebx
80103739:	74 75                	je     801037b0 <allocproc+0xa0>
    if(p->state == UNUSED)
8010373b:	8b 43 0c             	mov    0xc(%ebx),%eax
8010373e:	85 c0                	test   %eax,%eax
80103740:	75 ee                	jne    80103730 <allocproc+0x20>
  return 0;

found:
  //p->tickets = 10;
  p->state = EMBRYO;
  p->pid = nextpid++;
80103742:	a1 08 a0 10 80       	mov    0x8010a008,%eax

  release(&ptable.lock);
80103747:	83 ec 0c             	sub    $0xc,%esp
  release(&ptable.lock);
  return 0;

found:
  //p->tickets = 10;
  p->state = EMBRYO;
8010374a:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;

  release(&ptable.lock);
80103751:	68 60 28 11 80       	push   $0x80112860
  return 0;

found:
  //p->tickets = 10;
  p->state = EMBRYO;
  p->pid = nextpid++;
80103756:	8d 50 01             	lea    0x1(%eax),%edx
80103759:	89 43 10             	mov    %eax,0x10(%ebx)
8010375c:	89 15 08 a0 10 80    	mov    %edx,0x8010a008

  release(&ptable.lock);
80103762:	e8 d9 0e 00 00       	call   80104640 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
80103767:	e8 04 ed ff ff       	call   80102470 <kalloc>
8010376c:	83 c4 10             	add    $0x10,%esp
8010376f:	85 c0                	test   %eax,%eax
80103771:	89 43 08             	mov    %eax,0x8(%ebx)
80103774:	74 51                	je     801037c7 <allocproc+0xb7>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103776:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
8010377c:	83 ec 04             	sub    $0x4,%esp
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
8010377f:	05 9c 0f 00 00       	add    $0xf9c,%eax
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103784:	89 53 18             	mov    %edx,0x18(%ebx)
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;
80103787:	c7 40 14 2e 59 10 80 	movl   $0x8010592e,0x14(%eax)

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
8010378e:	6a 14                	push   $0x14
80103790:	6a 00                	push   $0x0
80103792:	50                   	push   %eax
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
80103793:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
80103796:	e8 f5 0e 00 00       	call   80104690 <memset>
  p->context->eip = (uint)forkret;
8010379b:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
8010379e:	83 c4 10             	add    $0x10,%esp
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;
801037a1:	c7 40 10 d0 37 10 80 	movl   $0x801037d0,0x10(%eax)

  return p;
801037a8:	89 d8                	mov    %ebx,%eax
}
801037aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801037ad:	c9                   	leave  
801037ae:	c3                   	ret    
801037af:	90                   	nop

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
801037b0:	83 ec 0c             	sub    $0xc,%esp
801037b3:	68 60 28 11 80       	push   $0x80112860
801037b8:	e8 83 0e 00 00       	call   80104640 <release>
  return 0;
801037bd:	83 c4 10             	add    $0x10,%esp
801037c0:	31 c0                	xor    %eax,%eax
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}
801037c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801037c5:	c9                   	leave  
801037c6:	c3                   	ret    

  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
801037c7:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
801037ce:	eb da                	jmp    801037aa <allocproc+0x9a>

801037d0 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
801037d0:	55                   	push   %ebp
801037d1:	89 e5                	mov    %esp,%ebp
801037d3:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
801037d6:	68 60 28 11 80       	push   $0x80112860
801037db:	e8 60 0e 00 00       	call   80104640 <release>

  if (first) {
801037e0:	a1 04 a0 10 80       	mov    0x8010a004,%eax
801037e5:	83 c4 10             	add    $0x10,%esp
801037e8:	85 c0                	test   %eax,%eax
801037ea:	75 04                	jne    801037f0 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
801037ec:	c9                   	leave  
801037ed:	c3                   	ret    
801037ee:	66 90                	xchg   %ax,%ax
  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
801037f0:	83 ec 0c             	sub    $0xc,%esp

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
801037f3:	c7 05 04 a0 10 80 00 	movl   $0x0,0x8010a004
801037fa:	00 00 00 
    iinit(ROOTDEV);
801037fd:	6a 01                	push   $0x1
801037ff:	e8 4c dc ff ff       	call   80101450 <iinit>
    initlog(ROOTDEV);
80103804:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010380b:	e8 d0 f2 ff ff       	call   80102ae0 <initlog>
80103810:	83 c4 10             	add    $0x10,%esp
  }

  // Return to "caller", actually trapret (see allocproc).
}
80103813:	c9                   	leave  
80103814:	c3                   	ret    
80103815:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103820 <pinit>:

static void wakeup1(void *chan);

void
pinit(void)
{
80103820:	55                   	push   %ebp
80103821:	89 e5                	mov    %esp,%ebp
80103823:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
80103826:	68 2d 77 10 80       	push   $0x8010772d
8010382b:	68 60 28 11 80       	push   $0x80112860
80103830:	e8 0b 0c 00 00       	call   80104440 <initlock>
}
80103835:	83 c4 10             	add    $0x10,%esp
80103838:	c9                   	leave  
80103839:	c3                   	ret    
8010383a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103840 <userinit>:

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
80103840:	55                   	push   %ebp
80103841:	89 e5                	mov    %esp,%ebp
80103843:	53                   	push   %ebx
80103844:	83 ec 04             	sub    $0x4,%esp
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
80103847:	e8 c4 fe ff ff       	call   80103710 <allocproc>
8010384c:	89 c3                	mov    %eax,%ebx
  
  initproc = p;
8010384e:	a3 bc a5 10 80       	mov    %eax,0x8010a5bc
  if((p->pgdir = setupkvm()) == 0)
80103853:	e8 08 33 00 00       	call   80106b60 <setupkvm>
80103858:	85 c0                	test   %eax,%eax
8010385a:	89 43 04             	mov    %eax,0x4(%ebx)
8010385d:	0f 84 bd 00 00 00    	je     80103920 <userinit+0xe0>
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103863:	83 ec 04             	sub    $0x4,%esp
80103866:	68 2c 00 00 00       	push   $0x2c
8010386b:	68 60 a4 10 80       	push   $0x8010a460
80103870:	50                   	push   %eax
80103871:	e8 6a 34 00 00       	call   80106ce0 <inituvm>
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
80103876:	83 c4 0c             	add    $0xc,%esp
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
80103879:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
8010387f:	6a 4c                	push   $0x4c
80103881:	6a 00                	push   $0x0
80103883:	ff 73 18             	pushl  0x18(%ebx)
80103886:	e8 05 0e 00 00       	call   80104690 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010388b:	8b 43 18             	mov    0x18(%ebx),%eax
8010388e:	ba 23 00 00 00       	mov    $0x23,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103893:	b9 2b 00 00 00       	mov    $0x2b,%ecx
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0;  // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
80103898:	83 c4 0c             	add    $0xc,%esp
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010389b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010389f:	8b 43 18             	mov    0x18(%ebx),%eax
801038a2:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
801038a6:	8b 43 18             	mov    0x18(%ebx),%eax
801038a9:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801038ad:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
801038b1:	8b 43 18             	mov    0x18(%ebx),%eax
801038b4:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801038b8:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
801038bc:	8b 43 18             	mov    0x18(%ebx),%eax
801038bf:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
801038c6:	8b 43 18             	mov    0x18(%ebx),%eax
801038c9:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
801038d0:	8b 43 18             	mov    0x18(%ebx),%eax
801038d3:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

  safestrcpy(p->name, "initcode", sizeof(p->name));
801038da:	8d 43 6c             	lea    0x6c(%ebx),%eax
801038dd:	6a 10                	push   $0x10
801038df:	68 4d 77 10 80       	push   $0x8010774d
801038e4:	50                   	push   %eax
801038e5:	e8 a6 0f 00 00       	call   80104890 <safestrcpy>
  p->cwd = namei("/");
801038ea:	c7 04 24 56 77 10 80 	movl   $0x80107756,(%esp)
801038f1:	e8 8a e5 ff ff       	call   80101e80 <namei>
801038f6:	89 43 68             	mov    %eax,0x68(%ebx)

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);
801038f9:	c7 04 24 60 28 11 80 	movl   $0x80112860,(%esp)
80103900:	e8 5b 0b 00 00       	call   80104460 <acquire>

  p->state = RUNNABLE;
80103905:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
8010390c:	c7 04 24 60 28 11 80 	movl   $0x80112860,(%esp)
80103913:	e8 28 0d 00 00       	call   80104640 <release>
}
80103918:	83 c4 10             	add    $0x10,%esp
8010391b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010391e:	c9                   	leave  
8010391f:	c3                   	ret    

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
80103920:	83 ec 0c             	sub    $0xc,%esp
80103923:	68 34 77 10 80       	push   $0x80107734
80103928:	e8 43 ca ff ff       	call   80100370 <panic>
8010392d:	8d 76 00             	lea    0x0(%esi),%esi

80103930 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
80103930:	55                   	push   %ebp
80103931:	89 e5                	mov    %esp,%ebp
80103933:	83 ec 08             	sub    $0x8,%esp
  uint sz;

  sz = proc->sz;
80103936:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
8010393d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint sz;

  sz = proc->sz;
80103940:	8b 02                	mov    (%edx),%eax
  if(n > 0){
80103942:	83 f9 00             	cmp    $0x0,%ecx
80103945:	7e 39                	jle    80103980 <growproc+0x50>
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
80103947:	83 ec 04             	sub    $0x4,%esp
8010394a:	01 c1                	add    %eax,%ecx
8010394c:	51                   	push   %ecx
8010394d:	50                   	push   %eax
8010394e:	ff 72 04             	pushl  0x4(%edx)
80103951:	e8 ca 34 00 00       	call   80106e20 <allocuvm>
80103956:	83 c4 10             	add    $0x10,%esp
80103959:	85 c0                	test   %eax,%eax
8010395b:	74 3b                	je     80103998 <growproc+0x68>
8010395d:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  proc->sz = sz;
80103964:	89 02                	mov    %eax,(%edx)
  switchuvm(proc);
80103966:	83 ec 0c             	sub    $0xc,%esp
80103969:	65 ff 35 04 00 00 00 	pushl  %gs:0x4
80103970:	e8 9b 32 00 00       	call   80106c10 <switchuvm>
  return 0;
80103975:	83 c4 10             	add    $0x10,%esp
80103978:	31 c0                	xor    %eax,%eax
}
8010397a:	c9                   	leave  
8010397b:	c3                   	ret    
8010397c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  sz = proc->sz;
  if(n > 0){
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
80103980:	74 e2                	je     80103964 <growproc+0x34>
    if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
80103982:	83 ec 04             	sub    $0x4,%esp
80103985:	01 c1                	add    %eax,%ecx
80103987:	51                   	push   %ecx
80103988:	50                   	push   %eax
80103989:	ff 72 04             	pushl  0x4(%edx)
8010398c:	e8 8f 35 00 00       	call   80106f20 <deallocuvm>
80103991:	83 c4 10             	add    $0x10,%esp
80103994:	85 c0                	test   %eax,%eax
80103996:	75 c5                	jne    8010395d <growproc+0x2d>
  uint sz;

  sz = proc->sz;
  if(n > 0){
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
80103998:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return -1;
  }
  proc->sz = sz;
  switchuvm(proc);
  return 0;
}
8010399d:	c9                   	leave  
8010399e:	c3                   	ret    
8010399f:	90                   	nop

801039a0 <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(int tickets)
{
801039a0:	55                   	push   %ebp
801039a1:	89 e5                	mov    %esp,%ebp
801039a3:	57                   	push   %edi
801039a4:	56                   	push   %esi
801039a5:	53                   	push   %ebx
801039a6:	83 ec 1c             	sub    $0x1c,%esp
801039a9:	8b 55 08             	mov    0x8(%ebp),%edx
  int i, pid;
  struct proc *np;
  tickets = tickets < 0 ? -tickets : tickets;
801039ac:	89 d0                	mov    %edx,%eax
801039ae:	c1 f8 1f             	sar    $0x1f,%eax
801039b1:	31 c2                	xor    %eax,%edx
801039b3:	29 c2                	sub    %eax,%edx
801039b5:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  // Allocate process.
  if((np = allocproc()) == 0){
801039b8:	e8 53 fd ff ff       	call   80103710 <allocproc>
801039bd:	85 c0                	test   %eax,%eax
801039bf:	0f 84 dd 00 00 00    	je     80103aa2 <fork+0x102>
801039c5:	89 c3                	mov    %eax,%ebx
    return -1;
  }

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
801039c7:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801039cd:	83 ec 08             	sub    $0x8,%esp
801039d0:	ff 30                	pushl  (%eax)
801039d2:	ff 70 04             	pushl  0x4(%eax)
801039d5:	e8 26 36 00 00       	call   80107000 <copyuvm>
801039da:	83 c4 10             	add    $0x10,%esp
801039dd:	85 c0                	test   %eax,%eax
801039df:	89 43 04             	mov    %eax,0x4(%ebx)
801039e2:	0f 84 c1 00 00 00    	je     80103aa9 <fork+0x109>
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = proc->sz;
801039e8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  np->parent = proc;
  *np->tf = *proc->tf;
801039ee:	8b 7b 18             	mov    0x18(%ebx),%edi
801039f1:	b9 13 00 00 00       	mov    $0x13,%ecx
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = proc->sz;
801039f6:	8b 00                	mov    (%eax),%eax
801039f8:	89 03                	mov    %eax,(%ebx)
  np->parent = proc;
801039fa:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103a00:	89 43 14             	mov    %eax,0x14(%ebx)
  *np->tf = *proc->tf;
80103a03:	8b 70 18             	mov    0x18(%eax),%esi
80103a06:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103a08:	31 f6                	xor    %esi,%esi
  np->sz = proc->sz;
  np->parent = proc;
  *np->tf = *proc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
80103a0a:	8b 43 18             	mov    0x18(%ebx),%eax
80103a0d:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103a14:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103a1b:	90                   	nop
80103a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(i = 0; i < NOFILE; i++)
    if(proc->ofile[i])
80103a20:	8b 44 b2 28          	mov    0x28(%edx,%esi,4),%eax
80103a24:	85 c0                	test   %eax,%eax
80103a26:	74 17                	je     80103a3f <fork+0x9f>
      np->ofile[i] = filedup(proc->ofile[i]);
80103a28:	83 ec 0c             	sub    $0xc,%esp
80103a2b:	50                   	push   %eax
80103a2c:	e8 8f d3 ff ff       	call   80100dc0 <filedup>
80103a31:	89 44 b3 28          	mov    %eax,0x28(%ebx,%esi,4)
80103a35:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103a3c:	83 c4 10             	add    $0x10,%esp
  *np->tf = *proc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103a3f:	83 c6 01             	add    $0x1,%esi
80103a42:	83 fe 10             	cmp    $0x10,%esi
80103a45:	75 d9                	jne    80103a20 <fork+0x80>
    if(proc->ofile[i])
      np->ofile[i] = filedup(proc->ofile[i]);
  np->cwd = idup(proc->cwd);
80103a47:	83 ec 0c             	sub    $0xc,%esp
80103a4a:	ff 72 68             	pushl  0x68(%edx)
80103a4d:	e8 ce db ff ff       	call   80101620 <idup>
80103a52:	89 43 68             	mov    %eax,0x68(%ebx)

  safestrcpy(np->name, proc->name, sizeof(proc->name));
80103a55:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103a5b:	83 c4 0c             	add    $0xc,%esp
80103a5e:	6a 10                	push   $0x10
80103a60:	83 c0 6c             	add    $0x6c,%eax
80103a63:	50                   	push   %eax
80103a64:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103a67:	50                   	push   %eax
80103a68:	e8 23 0e 00 00       	call   80104890 <safestrcpy>

  pid = np->pid;
80103a6d:	8b 73 10             	mov    0x10(%ebx),%esi

  acquire(&ptable.lock);
80103a70:	c7 04 24 60 28 11 80 	movl   $0x80112860,(%esp)
80103a77:	e8 e4 09 00 00       	call   80104460 <acquire>

  np->state = RUNNABLE;
  np->tickets = tickets;
80103a7c:	8b 45 e4             	mov    -0x1c(%ebp),%eax

  pid = np->pid;

  acquire(&ptable.lock);

  np->state = RUNNABLE;
80103a7f:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  np->tickets = tickets;
80103a86:	89 43 7c             	mov    %eax,0x7c(%ebx)
  release(&ptable.lock);
80103a89:	c7 04 24 60 28 11 80 	movl   $0x80112860,(%esp)
80103a90:	e8 ab 0b 00 00       	call   80104640 <release>

  return pid;
80103a95:	83 c4 10             	add    $0x10,%esp
80103a98:	89 f0                	mov    %esi,%eax
}
80103a9a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103a9d:	5b                   	pop    %ebx
80103a9e:	5e                   	pop    %esi
80103a9f:	5f                   	pop    %edi
80103aa0:	5d                   	pop    %ebp
80103aa1:	c3                   	ret    
  int i, pid;
  struct proc *np;
  tickets = tickets < 0 ? -tickets : tickets;
  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
80103aa2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103aa7:	eb f1                	jmp    80103a9a <fork+0xfa>
  }

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
    kfree(np->kstack);
80103aa9:	83 ec 0c             	sub    $0xc,%esp
80103aac:	ff 73 08             	pushl  0x8(%ebx)
80103aaf:	e8 0c e8 ff ff       	call   801022c0 <kfree>
    np->kstack = 0;
80103ab4:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103abb:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103ac2:	83 c4 10             	add    $0x10,%esp
80103ac5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103aca:	eb ce                	jmp    80103a9a <fork+0xfa>
80103acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103ad0 <random_number>:
  }
}

int 
random_number(int seed)
{
80103ad0:	55                   	push   %ebp
    return (unsigned long)(seed * 4827110398420394UL) % 2147483647UL;
80103ad1:	ba 03 00 00 00       	mov    $0x3,%edx
  }
}

int 
random_number(int seed)
{
80103ad6:	89 e5                	mov    %esp,%ebp
    return (unsigned long)(seed * 4827110398420394UL) % 2147483647UL;
80103ad8:	69 4d 08 aa e5 96 38 	imul   $0x3896e5aa,0x8(%ebp),%ecx
}
80103adf:	5d                   	pop    %ebp
}

int 
random_number(int seed)
{
    return (unsigned long)(seed * 4827110398420394UL) % 2147483647UL;
80103ae0:	89 c8                	mov    %ecx,%eax
80103ae2:	f7 e2                	mul    %edx
80103ae4:	89 c8                	mov    %ecx,%eax
80103ae6:	29 d0                	sub    %edx,%eax
80103ae8:	d1 e8                	shr    %eax
80103aea:	01 d0                	add    %edx,%eax
80103aec:	c1 e8 1e             	shr    $0x1e,%eax
80103aef:	89 c2                	mov    %eax,%edx
80103af1:	c1 e2 1f             	shl    $0x1f,%edx
80103af4:	29 c2                	sub    %eax,%edx
80103af6:	29 d1                	sub    %edx,%ecx
80103af8:	89 c8                	mov    %ecx,%eax
}
80103afa:	c3                   	ret    
80103afb:	90                   	nop
80103afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103b00 <get_tickets_number>:

int
get_tickets_number(void)
{
80103b00:	55                   	push   %ebp
  struct proc *p;
  int sum = 0;
80103b01:	31 c0                	xor    %eax,%eax
  
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b03:	ba 94 28 11 80       	mov    $0x80112894,%edx
    return (unsigned long)(seed * 4827110398420394UL) % 2147483647UL;
}

int
get_tickets_number(void)
{
80103b08:	89 e5                	mov    %esp,%ebp
80103b0a:	eb 0f                	jmp    80103b1b <get_tickets_number+0x1b>
80103b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct proc *p;
  int sum = 0;
  
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b10:	83 ea 80             	sub    $0xffffff80,%edx
80103b13:	81 fa 94 48 11 80    	cmp    $0x80114894,%edx
80103b19:	74 14                	je     80103b2f <get_tickets_number+0x2f>
    if(p->state == RUNNABLE)
80103b1b:	83 7a 0c 03          	cmpl   $0x3,0xc(%edx)
80103b1f:	75 ef                	jne    80103b10 <get_tickets_number+0x10>
      sum += p->tickets;
80103b21:	03 42 7c             	add    0x7c(%edx),%eax
get_tickets_number(void)
{
  struct proc *p;
  int sum = 0;
  
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b24:	83 ea 80             	sub    $0xffffff80,%edx
80103b27:	81 fa 94 48 11 80    	cmp    $0x80114894,%edx
80103b2d:	75 ec                	jne    80103b1b <get_tickets_number+0x1b>
    if(p->state == RUNNABLE)
      sum += p->tickets;

  return sum;
}
80103b2f:	5d                   	pop    %ebp
80103b30:	c3                   	ret    
80103b31:	eb 0d                	jmp    80103b40 <scheduler>
80103b33:	90                   	nop
80103b34:	90                   	nop
80103b35:	90                   	nop
80103b36:	90                   	nop
80103b37:	90                   	nop
80103b38:	90                   	nop
80103b39:	90                   	nop
80103b3a:	90                   	nop
80103b3b:	90                   	nop
80103b3c:	90                   	nop
80103b3d:	90                   	nop
80103b3e:	90                   	nop
80103b3f:	90                   	nop

80103b40 <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
80103b40:	55                   	push   %ebp
80103b41:	89 e5                	mov    %esp,%ebp
80103b43:	57                   	push   %edi
80103b44:	56                   	push   %esi
80103b45:	53                   	push   %ebx
80103b46:	83 ec 0c             	sub    $0xc,%esp
80103b49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
}

static inline void
sti(void)
{
  asm volatile("sti");
80103b50:	fb                   	sti    
  struct proc *p;
  int winner, sum;

  for(;;){
    sti(); // Enable interrupts on this processor.
    acquire(&ptable.lock); 
80103b51:	83 ec 0c             	sub    $0xc,%esp
80103b54:	68 60 28 11 80       	push   $0x80112860
80103b59:	e8 02 09 00 00       	call   80104460 <acquire>
}

int 
random_number(int seed)
{
    return (unsigned long)(seed * 4827110398420394UL) % 2147483647UL;
80103b5e:	69 0d e0 50 11 80 14 	imul   $0x8f728414,0x801150e0,%ecx
80103b65:	84 72 8f 
80103b68:	b8 03 00 00 00       	mov    $0x3,%eax
80103b6d:	83 c4 10             	add    $0x10,%esp
80103b70:	f7 e1                	mul    %ecx
80103b72:	89 c8                	mov    %ecx,%eax
80103b74:	29 d0                	sub    %edx,%eax
80103b76:	d1 e8                	shr    %eax
80103b78:	01 d0                	add    %edx,%eax
80103b7a:	c1 e8 1e             	shr    $0x1e,%eax
80103b7d:	89 c2                	mov    %eax,%edx
80103b7f:	c1 e2 1f             	shl    $0x1f,%edx
80103b82:	29 c2                	sub    %eax,%edx
80103b84:	29 d1                	sub    %edx,%ecx
get_tickets_number(void)
{
  struct proc *p;
  int sum = 0;
  
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b86:	ba 94 28 11 80       	mov    $0x80112894,%edx
}

int 
random_number(int seed)
{
    return (unsigned long)(seed * 4827110398420394UL) % 2147483647UL;
80103b8b:	89 c8                	mov    %ecx,%eax

int
get_tickets_number(void)
{
  struct proc *p;
  int sum = 0;
80103b8d:	31 c9                	xor    %ecx,%ecx
80103b8f:	eb 12                	jmp    80103ba3 <scheduler+0x63>
80103b91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b98:	83 ea 80             	sub    $0xffffff80,%edx
80103b9b:	81 fa 94 48 11 80    	cmp    $0x80114894,%edx
80103ba1:	74 14                	je     80103bb7 <scheduler+0x77>
    if(p->state == RUNNABLE)
80103ba3:	83 7a 0c 03          	cmpl   $0x3,0xc(%edx)
80103ba7:	75 ef                	jne    80103b98 <scheduler+0x58>
      sum += p->tickets;
80103ba9:	03 4a 7c             	add    0x7c(%edx),%ecx
get_tickets_number(void)
{
  struct proc *p;
  int sum = 0;
  
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103bac:	83 ea 80             	sub    $0xffffff80,%edx
80103baf:	81 fa 94 48 11 80    	cmp    $0x80114894,%edx
80103bb5:	75 ec                	jne    80103ba3 <scheduler+0x63>

  for(;;){
    sti(); // Enable interrupts on this processor.
    acquire(&ptable.lock); 
    sum = 0;
    winner = random_number(ticks*87329823458)%(get_tickets_number()+1);
80103bb7:	83 c1 01             	add    $0x1,%ecx
80103bba:	99                   	cltd   
  int winner, sum;

  for(;;){
    sti(); // Enable interrupts on this processor.
    acquire(&ptable.lock); 
    sum = 0;
80103bbb:	31 ff                	xor    %edi,%edi
    winner = random_number(ticks*87329823458)%(get_tickets_number()+1);
80103bbd:	f7 f9                	idiv   %ecx
    
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103bbf:	bb 94 28 11 80       	mov    $0x80112894,%ebx

  for(;;){
    sti(); // Enable interrupts on this processor.
    acquire(&ptable.lock); 
    sum = 0;
    winner = random_number(ticks*87329823458)%(get_tickets_number()+1);
80103bc4:	89 d6                	mov    %edx,%esi
80103bc6:	eb 13                	jmp    80103bdb <scheduler+0x9b>
80103bc8:	90                   	nop
80103bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103bd0:	83 eb 80             	sub    $0xffffff80,%ebx
80103bd3:	81 fb 94 48 11 80    	cmp    $0x80114894,%ebx
80103bd9:	74 55                	je     80103c30 <scheduler+0xf0>
      //skip if procces is not runnable
      if(p->state != RUNNABLE)
80103bdb:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103bdf:	75 ef                	jne    80103bd0 <scheduler+0x90>
        continue;
      
      sum += p->tickets; 
80103be1:	03 7b 7c             	add    0x7c(%ebx),%edi
      if(sum < winner)
80103be4:	39 fe                	cmp    %edi,%esi
80103be6:	7f e8                	jg     80103bd0 <scheduler+0x90>
        continue;   

      proc = p;
      switchuvm(p);
80103be8:	83 ec 0c             	sub    $0xc,%esp
      
      sum += p->tickets; 
      if(sum < winner)
        continue;   

      proc = p;
80103beb:	65 89 1d 04 00 00 00 	mov    %ebx,%gs:0x4
      switchuvm(p);
80103bf2:	53                   	push   %ebx
    sti(); // Enable interrupts on this processor.
    acquire(&ptable.lock); 
    sum = 0;
    winner = random_number(ticks*87329823458)%(get_tickets_number()+1);
    
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103bf3:	83 eb 80             	sub    $0xffffff80,%ebx
      sum += p->tickets; 
      if(sum < winner)
        continue;   

      proc = p;
      switchuvm(p);
80103bf6:	e8 15 30 00 00       	call   80106c10 <switchuvm>
      p->state = RUNNING;
      swtch(&cpu->scheduler, p->context);
80103bfb:	58                   	pop    %eax
80103bfc:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
      if(sum < winner)
        continue;   

      proc = p;
      switchuvm(p);
      p->state = RUNNING;
80103c02:	c7 43 8c 04 00 00 00 	movl   $0x4,-0x74(%ebx)
      swtch(&cpu->scheduler, p->context);
80103c09:	5a                   	pop    %edx
80103c0a:	ff 73 9c             	pushl  -0x64(%ebx)
80103c0d:	83 c0 04             	add    $0x4,%eax
80103c10:	50                   	push   %eax
80103c11:	e8 d5 0c 00 00       	call   801048eb <swtch>
      proc = 0;
80103c16:	83 c4 10             	add    $0x10,%esp
    sti(); // Enable interrupts on this processor.
    acquire(&ptable.lock); 
    sum = 0;
    winner = random_number(ticks*87329823458)%(get_tickets_number()+1);
    
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c19:	81 fb 94 48 11 80    	cmp    $0x80114894,%ebx

      proc = p;
      switchuvm(p);
      p->state = RUNNING;
      swtch(&cpu->scheduler, p->context);
      proc = 0;
80103c1f:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80103c26:	00 00 00 00 
    sti(); // Enable interrupts on this processor.
    acquire(&ptable.lock); 
    sum = 0;
    winner = random_number(ticks*87329823458)%(get_tickets_number()+1);
    
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c2a:	75 af                	jne    80103bdb <scheduler+0x9b>
80103c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      switchuvm(p);
      p->state = RUNNING;
      swtch(&cpu->scheduler, p->context);
      proc = 0;
    }
    switchkvm();
80103c30:	e8 bb 2f 00 00       	call   80106bf0 <switchkvm>
    release(&ptable.lock);
80103c35:	83 ec 0c             	sub    $0xc,%esp
80103c38:	68 60 28 11 80       	push   $0x80112860
80103c3d:	e8 fe 09 00 00       	call   80104640 <release>
  }
80103c42:	83 c4 10             	add    $0x10,%esp
80103c45:	e9 06 ff ff ff       	jmp    80103b50 <scheduler+0x10>
80103c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103c50 <sched>:
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
80103c50:	55                   	push   %ebp
80103c51:	89 e5                	mov    %esp,%ebp
80103c53:	53                   	push   %ebx
80103c54:	83 ec 10             	sub    $0x10,%esp
  int intena;

  if(!holding(&ptable.lock))
80103c57:	68 60 28 11 80       	push   $0x80112860
80103c5c:	e8 2f 09 00 00       	call   80104590 <holding>
80103c61:	83 c4 10             	add    $0x10,%esp
80103c64:	85 c0                	test   %eax,%eax
80103c66:	74 4c                	je     80103cb4 <sched+0x64>
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
80103c68:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80103c6f:	83 ba ac 00 00 00 01 	cmpl   $0x1,0xac(%edx)
80103c76:	75 63                	jne    80103cdb <sched+0x8b>
    panic("sched locks");
  if(proc->state == RUNNING)
80103c78:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103c7e:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80103c82:	74 4a                	je     80103cce <sched+0x7e>

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103c84:	9c                   	pushf  
80103c85:	59                   	pop    %ecx
    panic("sched running");
  if(readeflags()&FL_IF)
80103c86:	80 e5 02             	and    $0x2,%ch
80103c89:	75 36                	jne    80103cc1 <sched+0x71>
    panic("sched interruptible");
  intena = cpu->intena;
  swtch(&proc->context, cpu->scheduler);
80103c8b:	83 ec 08             	sub    $0x8,%esp
80103c8e:	83 c0 1c             	add    $0x1c,%eax
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = cpu->intena;
80103c91:	8b 9a b0 00 00 00    	mov    0xb0(%edx),%ebx
  swtch(&proc->context, cpu->scheduler);
80103c97:	ff 72 04             	pushl  0x4(%edx)
80103c9a:	50                   	push   %eax
80103c9b:	e8 4b 0c 00 00       	call   801048eb <swtch>
  cpu->intena = intena;
80103ca0:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
}
80103ca6:	83 c4 10             	add    $0x10,%esp
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = cpu->intena;
  swtch(&proc->context, cpu->scheduler);
  cpu->intena = intena;
80103ca9:	89 98 b0 00 00 00    	mov    %ebx,0xb0(%eax)
}
80103caf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103cb2:	c9                   	leave  
80103cb3:	c3                   	ret    
sched(void)
{
  int intena;

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
80103cb4:	83 ec 0c             	sub    $0xc,%esp
80103cb7:	68 58 77 10 80       	push   $0x80107758
80103cbc:	e8 af c6 ff ff       	call   80100370 <panic>
  if(cpu->ncli != 1)
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
80103cc1:	83 ec 0c             	sub    $0xc,%esp
80103cc4:	68 84 77 10 80       	push   $0x80107784
80103cc9:	e8 a2 c6 ff ff       	call   80100370 <panic>
  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
80103cce:	83 ec 0c             	sub    $0xc,%esp
80103cd1:	68 76 77 10 80       	push   $0x80107776
80103cd6:	e8 95 c6 ff ff       	call   80100370 <panic>
  int intena;

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
    panic("sched locks");
80103cdb:	83 ec 0c             	sub    $0xc,%esp
80103cde:	68 6a 77 10 80       	push   $0x8010776a
80103ce3:	e8 88 c6 ff ff       	call   80100370 <panic>
80103ce8:	90                   	nop
80103ce9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103cf0 <exit>:
exit(void)
{
  struct proc *p;
  int fd;

  if(proc == initproc)
80103cf0:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103cf7:	3b 15 bc a5 10 80    	cmp    0x8010a5bc,%edx
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
80103cfd:	55                   	push   %ebp
80103cfe:	89 e5                	mov    %esp,%ebp
80103d00:	56                   	push   %esi
80103d01:	53                   	push   %ebx
  struct proc *p;
  int fd;

  if(proc == initproc)
80103d02:	0f 84 1f 01 00 00    	je     80103e27 <exit+0x137>
80103d08:	31 db                	xor    %ebx,%ebx
80103d0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd]){
80103d10:	8d 73 08             	lea    0x8(%ebx),%esi
80103d13:	8b 44 b2 08          	mov    0x8(%edx,%esi,4),%eax
80103d17:	85 c0                	test   %eax,%eax
80103d19:	74 1b                	je     80103d36 <exit+0x46>
      fileclose(proc->ofile[fd]);
80103d1b:	83 ec 0c             	sub    $0xc,%esp
80103d1e:	50                   	push   %eax
80103d1f:	e8 ec d0 ff ff       	call   80100e10 <fileclose>
      proc->ofile[fd] = 0;
80103d24:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103d2b:	83 c4 10             	add    $0x10,%esp
80103d2e:	c7 44 b2 08 00 00 00 	movl   $0x0,0x8(%edx,%esi,4)
80103d35:	00 

  if(proc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80103d36:	83 c3 01             	add    $0x1,%ebx
80103d39:	83 fb 10             	cmp    $0x10,%ebx
80103d3c:	75 d2                	jne    80103d10 <exit+0x20>
      fileclose(proc->ofile[fd]);
      proc->ofile[fd] = 0;
    }
  }

  begin_op();
80103d3e:	e8 3d ee ff ff       	call   80102b80 <begin_op>
  iput(proc->cwd);
80103d43:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103d49:	83 ec 0c             	sub    $0xc,%esp
80103d4c:	ff 70 68             	pushl  0x68(%eax)
80103d4f:	e8 2c da ff ff       	call   80101780 <iput>
  end_op();
80103d54:	e8 97 ee ff ff       	call   80102bf0 <end_op>
  proc->cwd = 0;
80103d59:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103d5f:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)

  acquire(&ptable.lock);
80103d66:	c7 04 24 60 28 11 80 	movl   $0x80112860,(%esp)
80103d6d:	e8 ee 06 00 00       	call   80104460 <acquire>

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);
80103d72:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
80103d79:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103d7c:	b8 94 28 11 80       	mov    $0x80112894,%eax
  proc->cwd = 0;

  acquire(&ptable.lock);

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);
80103d81:	8b 51 14             	mov    0x14(%ecx),%edx
80103d84:	eb 14                	jmp    80103d9a <exit+0xaa>
80103d86:	8d 76 00             	lea    0x0(%esi),%esi
80103d89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103d90:	83 e8 80             	sub    $0xffffff80,%eax
80103d93:	3d 94 48 11 80       	cmp    $0x80114894,%eax
80103d98:	74 1c                	je     80103db6 <exit+0xc6>
    if(p->state == SLEEPING && p->chan == chan)
80103d9a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103d9e:	75 f0                	jne    80103d90 <exit+0xa0>
80103da0:	3b 50 20             	cmp    0x20(%eax),%edx
80103da3:	75 eb                	jne    80103d90 <exit+0xa0>
      p->state = RUNNABLE;
80103da5:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103dac:	83 e8 80             	sub    $0xffffff80,%eax
80103daf:	3d 94 48 11 80       	cmp    $0x80114894,%eax
80103db4:	75 e4                	jne    80103d9a <exit+0xaa>
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == proc){
      p->parent = initproc;
80103db6:	8b 1d bc a5 10 80    	mov    0x8010a5bc,%ebx
80103dbc:	ba 94 28 11 80       	mov    $0x80112894,%edx
80103dc1:	eb 10                	jmp    80103dd3 <exit+0xe3>
80103dc3:	90                   	nop
80103dc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103dc8:	83 ea 80             	sub    $0xffffff80,%edx
80103dcb:	81 fa 94 48 11 80    	cmp    $0x80114894,%edx
80103dd1:	74 3b                	je     80103e0e <exit+0x11e>
    if(p->parent == proc){
80103dd3:	3b 4a 14             	cmp    0x14(%edx),%ecx
80103dd6:	75 f0                	jne    80103dc8 <exit+0xd8>
      p->parent = initproc;
      if(p->state == ZOMBIE)
80103dd8:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == proc){
      p->parent = initproc;
80103ddc:	89 5a 14             	mov    %ebx,0x14(%edx)
      if(p->state == ZOMBIE)
80103ddf:	75 e7                	jne    80103dc8 <exit+0xd8>
80103de1:	b8 94 28 11 80       	mov    $0x80112894,%eax
80103de6:	eb 12                	jmp    80103dfa <exit+0x10a>
80103de8:	90                   	nop
80103de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103df0:	83 e8 80             	sub    $0xffffff80,%eax
80103df3:	3d 94 48 11 80       	cmp    $0x80114894,%eax
80103df8:	74 ce                	je     80103dc8 <exit+0xd8>
    if(p->state == SLEEPING && p->chan == chan)
80103dfa:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103dfe:	75 f0                	jne    80103df0 <exit+0x100>
80103e00:	3b 58 20             	cmp    0x20(%eax),%ebx
80103e03:	75 eb                	jne    80103df0 <exit+0x100>
      p->state = RUNNABLE;
80103e05:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103e0c:	eb e2                	jmp    80103df0 <exit+0x100>
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  proc->state = ZOMBIE;
80103e0e:	c7 41 0c 05 00 00 00 	movl   $0x5,0xc(%ecx)
  sched();
80103e15:	e8 36 fe ff ff       	call   80103c50 <sched>
  panic("zombie exit");
80103e1a:	83 ec 0c             	sub    $0xc,%esp
80103e1d:	68 a5 77 10 80       	push   $0x801077a5
80103e22:	e8 49 c5 ff ff       	call   80100370 <panic>
{
  struct proc *p;
  int fd;

  if(proc == initproc)
    panic("init exiting");
80103e27:	83 ec 0c             	sub    $0xc,%esp
80103e2a:	68 98 77 10 80       	push   $0x80107798
80103e2f:	e8 3c c5 ff ff       	call   80100370 <panic>
80103e34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103e3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103e40 <yield>:
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
80103e40:	55                   	push   %ebp
80103e41:	89 e5                	mov    %esp,%ebp
80103e43:	83 ec 14             	sub    $0x14,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103e46:	68 60 28 11 80       	push   $0x80112860
80103e4b:	e8 10 06 00 00       	call   80104460 <acquire>
  proc->state = RUNNABLE;
80103e50:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e56:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  sched();
80103e5d:	e8 ee fd ff ff       	call   80103c50 <sched>
  release(&ptable.lock);
80103e62:	c7 04 24 60 28 11 80 	movl   $0x80112860,(%esp)
80103e69:	e8 d2 07 00 00       	call   80104640 <release>
}
80103e6e:	83 c4 10             	add    $0x10,%esp
80103e71:	c9                   	leave  
80103e72:	c3                   	ret    
80103e73:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103e79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103e80 <sleep>:
// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  if(proc == 0)
80103e80:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103e86:	55                   	push   %ebp
80103e87:	89 e5                	mov    %esp,%ebp
80103e89:	56                   	push   %esi
80103e8a:	53                   	push   %ebx
  if(proc == 0)
80103e8b:	85 c0                	test   %eax,%eax

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103e8d:	8b 75 08             	mov    0x8(%ebp),%esi
80103e90:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(proc == 0)
80103e93:	0f 84 97 00 00 00    	je     80103f30 <sleep+0xb0>
    panic("sleep");

  if(lk == 0)
80103e99:	85 db                	test   %ebx,%ebx
80103e9b:	0f 84 82 00 00 00    	je     80103f23 <sleep+0xa3>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103ea1:	81 fb 60 28 11 80    	cmp    $0x80112860,%ebx
80103ea7:	74 57                	je     80103f00 <sleep+0x80>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103ea9:	83 ec 0c             	sub    $0xc,%esp
80103eac:	68 60 28 11 80       	push   $0x80112860
80103eb1:	e8 aa 05 00 00       	call   80104460 <acquire>
    release(lk);
80103eb6:	89 1c 24             	mov    %ebx,(%esp)
80103eb9:	e8 82 07 00 00       	call   80104640 <release>
  }

  // Go to sleep.
  proc->chan = chan;
80103ebe:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103ec4:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
80103ec7:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103ece:	e8 7d fd ff ff       	call   80103c50 <sched>

  // Tidy up.
  proc->chan = 0;
80103ed3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103ed9:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
80103ee0:	c7 04 24 60 28 11 80 	movl   $0x80112860,(%esp)
80103ee7:	e8 54 07 00 00       	call   80104640 <release>
    acquire(lk);
80103eec:	89 5d 08             	mov    %ebx,0x8(%ebp)
80103eef:	83 c4 10             	add    $0x10,%esp
  }
}
80103ef2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103ef5:	5b                   	pop    %ebx
80103ef6:	5e                   	pop    %esi
80103ef7:	5d                   	pop    %ebp
  proc->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
80103ef8:	e9 63 05 00 00       	jmp    80104460 <acquire>
80103efd:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }

  // Go to sleep.
  proc->chan = chan;
80103f00:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
80103f03:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103f0a:	e8 41 fd ff ff       	call   80103c50 <sched>

  // Tidy up.
  proc->chan = 0;
80103f0f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103f15:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}
80103f1c:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103f1f:	5b                   	pop    %ebx
80103f20:	5e                   	pop    %esi
80103f21:	5d                   	pop    %ebp
80103f22:	c3                   	ret    
{
  if(proc == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");
80103f23:	83 ec 0c             	sub    $0xc,%esp
80103f26:	68 b7 77 10 80       	push   $0x801077b7
80103f2b:	e8 40 c4 ff ff       	call   80100370 <panic>
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  if(proc == 0)
    panic("sleep");
80103f30:	83 ec 0c             	sub    $0xc,%esp
80103f33:	68 b1 77 10 80       	push   $0x801077b1
80103f38:	e8 33 c4 ff ff       	call   80100370 <panic>
80103f3d:	8d 76 00             	lea    0x0(%esi),%esi

80103f40 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
80103f40:	55                   	push   %ebp
80103f41:	89 e5                	mov    %esp,%ebp
80103f43:	56                   	push   %esi
80103f44:	53                   	push   %ebx
  struct proc *p;
  int havekids, pid;

  acquire(&ptable.lock);
80103f45:	83 ec 0c             	sub    $0xc,%esp
80103f48:	68 60 28 11 80       	push   $0x80112860
80103f4d:	e8 0e 05 00 00       	call   80104460 <acquire>
80103f52:	83 c4 10             	add    $0x10,%esp
80103f55:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
80103f5b:	31 d2                	xor    %edx,%edx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f5d:	bb 94 28 11 80       	mov    $0x80112894,%ebx
80103f62:	eb 0f                	jmp    80103f73 <wait+0x33>
80103f64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103f68:	83 eb 80             	sub    $0xffffff80,%ebx
80103f6b:	81 fb 94 48 11 80    	cmp    $0x80114894,%ebx
80103f71:	74 1d                	je     80103f90 <wait+0x50>
      if(p->parent != proc)
80103f73:	3b 43 14             	cmp    0x14(%ebx),%eax
80103f76:	75 f0                	jne    80103f68 <wait+0x28>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
80103f78:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103f7c:	74 30                	je     80103fae <wait+0x6e>

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f7e:	83 eb 80             	sub    $0xffffff80,%ebx
      if(p->parent != proc)
        continue;
      havekids = 1;
80103f81:	ba 01 00 00 00       	mov    $0x1,%edx

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f86:	81 fb 94 48 11 80    	cmp    $0x80114894,%ebx
80103f8c:	75 e5                	jne    80103f73 <wait+0x33>
80103f8e:	66 90                	xchg   %ax,%ax
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
80103f90:	85 d2                	test   %edx,%edx
80103f92:	74 70                	je     80104004 <wait+0xc4>
80103f94:	8b 50 24             	mov    0x24(%eax),%edx
80103f97:	85 d2                	test   %edx,%edx
80103f99:	75 69                	jne    80104004 <wait+0xc4>
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
80103f9b:	83 ec 08             	sub    $0x8,%esp
80103f9e:	68 60 28 11 80       	push   $0x80112860
80103fa3:	50                   	push   %eax
80103fa4:	e8 d7 fe ff ff       	call   80103e80 <sleep>
  }
80103fa9:	83 c4 10             	add    $0x10,%esp
80103fac:	eb a7                	jmp    80103f55 <wait+0x15>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
80103fae:	83 ec 0c             	sub    $0xc,%esp
80103fb1:	ff 73 08             	pushl  0x8(%ebx)
      if(p->parent != proc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
80103fb4:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80103fb7:	e8 04 e3 ff ff       	call   801022c0 <kfree>
        p->kstack = 0;
        freevm(p->pgdir);
80103fbc:	59                   	pop    %ecx
80103fbd:	ff 73 04             	pushl  0x4(%ebx)
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
80103fc0:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80103fc7:	e8 84 2f 00 00       	call   80106f50 <freevm>
        p->pid = 0;
80103fcc:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80103fd3:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80103fda:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80103fde:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80103fe5:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80103fec:	c7 04 24 60 28 11 80 	movl   $0x80112860,(%esp)
80103ff3:	e8 48 06 00 00       	call   80104640 <release>
        return pid;
80103ff8:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103ffb:	8d 65 f8             	lea    -0x8(%ebp),%esp
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
80103ffe:	89 f0                	mov    %esi,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80104000:	5b                   	pop    %ebx
80104001:	5e                   	pop    %esi
80104002:	5d                   	pop    %ebp
80104003:	c3                   	ret    
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
      release(&ptable.lock);
80104004:	83 ec 0c             	sub    $0xc,%esp
80104007:	68 60 28 11 80       	push   $0x80112860
8010400c:	e8 2f 06 00 00       	call   80104640 <release>
      return -1;
80104011:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80104014:	8d 65 f8             	lea    -0x8(%ebp),%esp
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
      release(&ptable.lock);
      return -1;
80104017:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
8010401c:	5b                   	pop    %ebx
8010401d:	5e                   	pop    %esi
8010401e:	5d                   	pop    %ebp
8010401f:	c3                   	ret    

80104020 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80104020:	55                   	push   %ebp
80104021:	89 e5                	mov    %esp,%ebp
80104023:	53                   	push   %ebx
80104024:	83 ec 10             	sub    $0x10,%esp
80104027:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
8010402a:	68 60 28 11 80       	push   $0x80112860
8010402f:	e8 2c 04 00 00       	call   80104460 <acquire>
80104034:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104037:	b8 94 28 11 80       	mov    $0x80112894,%eax
8010403c:	eb 0c                	jmp    8010404a <wakeup+0x2a>
8010403e:	66 90                	xchg   %ax,%ax
80104040:	83 e8 80             	sub    $0xffffff80,%eax
80104043:	3d 94 48 11 80       	cmp    $0x80114894,%eax
80104048:	74 1c                	je     80104066 <wakeup+0x46>
    if(p->state == SLEEPING && p->chan == chan)
8010404a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
8010404e:	75 f0                	jne    80104040 <wakeup+0x20>
80104050:	3b 58 20             	cmp    0x20(%eax),%ebx
80104053:	75 eb                	jne    80104040 <wakeup+0x20>
      p->state = RUNNABLE;
80104055:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010405c:	83 e8 80             	sub    $0xffffff80,%eax
8010405f:	3d 94 48 11 80       	cmp    $0x80114894,%eax
80104064:	75 e4                	jne    8010404a <wakeup+0x2a>
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80104066:	c7 45 08 60 28 11 80 	movl   $0x80112860,0x8(%ebp)
}
8010406d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104070:	c9                   	leave  
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80104071:	e9 ca 05 00 00       	jmp    80104640 <release>
80104076:	8d 76 00             	lea    0x0(%esi),%esi
80104079:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104080 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80104080:	55                   	push   %ebp
80104081:	89 e5                	mov    %esp,%ebp
80104083:	53                   	push   %ebx
80104084:	83 ec 10             	sub    $0x10,%esp
80104087:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
8010408a:	68 60 28 11 80       	push   $0x80112860
8010408f:	e8 cc 03 00 00       	call   80104460 <acquire>
80104094:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104097:	b8 94 28 11 80       	mov    $0x80112894,%eax
8010409c:	eb 0c                	jmp    801040aa <kill+0x2a>
8010409e:	66 90                	xchg   %ax,%ax
801040a0:	83 e8 80             	sub    $0xffffff80,%eax
801040a3:	3d 94 48 11 80       	cmp    $0x80114894,%eax
801040a8:	74 3e                	je     801040e8 <kill+0x68>
    if(p->pid == pid){
801040aa:	39 58 10             	cmp    %ebx,0x10(%eax)
801040ad:	75 f1                	jne    801040a0 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
801040af:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
801040b3:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
801040ba:	74 1c                	je     801040d8 <kill+0x58>
        p->state = RUNNABLE;
      release(&ptable.lock);
801040bc:	83 ec 0c             	sub    $0xc,%esp
801040bf:	68 60 28 11 80       	push   $0x80112860
801040c4:	e8 77 05 00 00       	call   80104640 <release>
      return 0;
801040c9:	83 c4 10             	add    $0x10,%esp
801040cc:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
801040ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801040d1:	c9                   	leave  
801040d2:	c3                   	ret    
801040d3:	90                   	nop
801040d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
801040d8:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
801040df:	eb db                	jmp    801040bc <kill+0x3c>
801040e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
801040e8:	83 ec 0c             	sub    $0xc,%esp
801040eb:	68 60 28 11 80       	push   $0x80112860
801040f0:	e8 4b 05 00 00       	call   80104640 <release>
  return -1;
801040f5:	83 c4 10             	add    $0x10,%esp
801040f8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801040fd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104100:	c9                   	leave  
80104101:	c3                   	ret    
80104102:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104110 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104110:	55                   	push   %ebp
80104111:	89 e5                	mov    %esp,%ebp
80104113:	57                   	push   %edi
80104114:	56                   	push   %esi
80104115:	53                   	push   %ebx
80104116:	8d 75 e8             	lea    -0x18(%ebp),%esi
80104119:	bb 00 29 11 80       	mov    $0x80112900,%ebx
8010411e:	83 ec 3c             	sub    $0x3c,%esp
80104121:	eb 24                	jmp    80104147 <procdump+0x37>
80104123:	90                   	nop
80104124:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80104128:	83 ec 0c             	sub    $0xc,%esp
8010412b:	68 31 78 10 80       	push   $0x80107831
80104130:	e8 2b c5 ff ff       	call   80100660 <cprintf>
80104135:	83 c4 10             	add    $0x10,%esp
80104138:	83 eb 80             	sub    $0xffffff80,%ebx
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010413b:	81 fb 00 49 11 80    	cmp    $0x80114900,%ebx
80104141:	0f 84 89 00 00 00    	je     801041d0 <procdump+0xc0>
    if(p->state == UNUSED)
80104147:	8b 43 a0             	mov    -0x60(%ebx),%eax
8010414a:	85 c0                	test   %eax,%eax
8010414c:	74 ea                	je     80104138 <procdump+0x28>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
8010414e:	83 f8 05             	cmp    $0x5,%eax
      state = states[p->state];
    else
      state = "???";
80104151:	ba c8 77 10 80       	mov    $0x801077c8,%edx
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104156:	77 11                	ja     80104169 <procdump+0x59>
80104158:	8b 14 85 80 78 10 80 	mov    -0x7fef8780(,%eax,4),%edx
      state = states[p->state];
    else
      state = "???";
8010415f:	b8 c8 77 10 80       	mov    $0x801077c8,%eax
80104164:	85 d2                	test   %edx,%edx
80104166:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s %d", p->pid, state, p->name, p->tickets);
80104169:	83 ec 0c             	sub    $0xc,%esp
8010416c:	ff 73 10             	pushl  0x10(%ebx)
8010416f:	53                   	push   %ebx
80104170:	52                   	push   %edx
80104171:	ff 73 a4             	pushl  -0x5c(%ebx)
80104174:	68 cc 77 10 80       	push   $0x801077cc
80104179:	e8 e2 c4 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
8010417e:	83 c4 20             	add    $0x20,%esp
80104181:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
80104185:	75 a1                	jne    80104128 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
80104187:	8d 45 c0             	lea    -0x40(%ebp),%eax
8010418a:	83 ec 08             	sub    $0x8,%esp
8010418d:	8d 7d c0             	lea    -0x40(%ebp),%edi
80104190:	50                   	push   %eax
80104191:	8b 43 b0             	mov    -0x50(%ebx),%eax
80104194:	8b 40 0c             	mov    0xc(%eax),%eax
80104197:	83 c0 08             	add    $0x8,%eax
8010419a:	50                   	push   %eax
8010419b:	e8 90 03 00 00       	call   80104530 <getcallerpcs>
801041a0:	83 c4 10             	add    $0x10,%esp
801041a3:	90                   	nop
801041a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(i=0; i<10 && pc[i] != 0; i++)
801041a8:	8b 17                	mov    (%edi),%edx
801041aa:	85 d2                	test   %edx,%edx
801041ac:	0f 84 76 ff ff ff    	je     80104128 <procdump+0x18>
        cprintf(" %p", pc[i]);
801041b2:	83 ec 08             	sub    $0x8,%esp
801041b5:	83 c7 04             	add    $0x4,%edi
801041b8:	52                   	push   %edx
801041b9:	68 29 72 10 80       	push   $0x80107229
801041be:	e8 9d c4 ff ff       	call   80100660 <cprintf>
    else
      state = "???";
    cprintf("%d %s %s %d", p->pid, state, p->name, p->tickets);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
801041c3:	83 c4 10             	add    $0x10,%esp
801041c6:	39 f7                	cmp    %esi,%edi
801041c8:	75 de                	jne    801041a8 <procdump+0x98>
801041ca:	e9 59 ff ff ff       	jmp    80104128 <procdump+0x18>
801041cf:	90                   	nop
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}
801041d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801041d3:	5b                   	pop    %ebx
801041d4:	5e                   	pop    %esi
801041d5:	5f                   	pop    %edi
801041d6:	5d                   	pop    %ebp
801041d7:	c3                   	ret    
801041d8:	90                   	nop
801041d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801041e0 <cps>:

int
cps(void)
{
801041e0:	55                   	push   %ebp
801041e1:	89 e5                	mov    %esp,%ebp
801041e3:	57                   	push   %edi
801041e4:	56                   	push   %esi
801041e5:	53                   	push   %ebx
801041e6:	83 ec 18             	sub    $0x18,%esp
}

static inline void
sti(void)
{
  asm volatile("sti");
801041e9:	fb                   	sti    
  struct proc *p;

  sti(); //Enable interruptions
  acquire(&ptable.lock);
801041ea:	68 60 28 11 80       	push   $0x80112860
801041ef:	bb 00 29 11 80       	mov    $0x80112900,%ebx
    if(p->state == RUNNING)
      cprintf("%s \t %d \t %d %s \t RUNNING \t\n", p->name, p->pid, p->tickets, p->tickets < 1000 ? "\t" : "");
    else if(p->state == SLEEPING)
      cprintf("%s \t %d \t %d %s \t SLEEPING \t\n", p->name, p->pid, p->tickets, p->tickets < 1000 ? "\t" : "");  
    else if(p->state == RUNNABLE)
      cprintf("%s \t %d \t %d %s \t RUNNABLE \t\n", p->name, p->pid, p->tickets,  p->tickets < 1000 ? "\t" : "");     
801041f4:	bf d8 77 10 80       	mov    $0x801077d8,%edi
801041f9:	be d9 77 10 80       	mov    $0x801077d9,%esi
cps(void)
{
  struct proc *p;

  sti(); //Enable interruptions
  acquire(&ptable.lock);
801041fe:	e8 5d 02 00 00       	call   80104460 <acquire>

  cprintf("name \t pid \t tickets \t state \n");
80104203:	c7 04 24 60 78 10 80 	movl   $0x80107860,(%esp)
8010420a:	e8 51 c4 ff ff       	call   80100660 <cprintf>
8010420f:	83 c4 10             	add    $0x10,%esp
80104212:	eb 1d                	jmp    80104231 <cps+0x51>
80104214:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if(p->state == RUNNING)
      cprintf("%s \t %d \t %d %s \t RUNNING \t\n", p->name, p->pid, p->tickets, p->tickets < 1000 ? "\t" : "");
    else if(p->state == SLEEPING)
80104218:	83 f8 02             	cmp    $0x2,%eax
8010421b:	74 6b                	je     80104288 <cps+0xa8>
      cprintf("%s \t %d \t %d %s \t SLEEPING \t\n", p->name, p->pid, p->tickets, p->tickets < 1000 ? "\t" : "");  
    else if(p->state == RUNNABLE)
8010421d:	83 f8 03             	cmp    $0x3,%eax
80104220:	0f 84 8a 00 00 00    	je     801042b0 <cps+0xd0>
80104226:	83 eb 80             	sub    $0xffffff80,%ebx

  sti(); //Enable interruptions
  acquire(&ptable.lock);

  cprintf("name \t pid \t tickets \t state \n");
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104229:	81 fb 00 49 11 80    	cmp    $0x80114900,%ebx
8010422f:	74 36                	je     80104267 <cps+0x87>
  {
    if(p->state == RUNNING)
80104231:	8b 43 a0             	mov    -0x60(%ebx),%eax
80104234:	83 f8 04             	cmp    $0x4,%eax
80104237:	75 df                	jne    80104218 <cps+0x38>
      cprintf("%s \t %d \t %d %s \t RUNNING \t\n", p->name, p->pid, p->tickets, p->tickets < 1000 ? "\t" : "");
80104239:	8b 43 10             	mov    0x10(%ebx),%eax
8010423c:	89 f2                	mov    %esi,%edx
8010423e:	3d e8 03 00 00       	cmp    $0x3e8,%eax
80104243:	0f 4c d7             	cmovl  %edi,%edx
80104246:	83 ec 0c             	sub    $0xc,%esp
80104249:	52                   	push   %edx
8010424a:	50                   	push   %eax
8010424b:	ff 73 a4             	pushl  -0x5c(%ebx)
8010424e:	53                   	push   %ebx
8010424f:	83 eb 80             	sub    $0xffffff80,%ebx
80104252:	68 da 77 10 80       	push   $0x801077da
80104257:	e8 04 c4 ff ff       	call   80100660 <cprintf>
8010425c:	83 c4 20             	add    $0x20,%esp

  sti(); //Enable interruptions
  acquire(&ptable.lock);

  cprintf("name \t pid \t tickets \t state \n");
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010425f:	81 fb 00 49 11 80    	cmp    $0x80114900,%ebx
80104265:	75 ca                	jne    80104231 <cps+0x51>
    else if(p->state == RUNNABLE)
      cprintf("%s \t %d \t %d %s \t RUNNABLE \t\n", p->name, p->pid, p->tickets,  p->tickets < 1000 ? "\t" : "");     

  }

  release(&ptable.lock);
80104267:	83 ec 0c             	sub    $0xc,%esp
8010426a:	68 60 28 11 80       	push   $0x80112860
8010426f:	e8 cc 03 00 00       	call   80104640 <release>
  return 22;
}
80104274:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104277:	b8 16 00 00 00       	mov    $0x16,%eax
8010427c:	5b                   	pop    %ebx
8010427d:	5e                   	pop    %esi
8010427e:	5f                   	pop    %edi
8010427f:	5d                   	pop    %ebp
80104280:	c3                   	ret    
80104281:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if(p->state == RUNNING)
      cprintf("%s \t %d \t %d %s \t RUNNING \t\n", p->name, p->pid, p->tickets, p->tickets < 1000 ? "\t" : "");
    else if(p->state == SLEEPING)
      cprintf("%s \t %d \t %d %s \t SLEEPING \t\n", p->name, p->pid, p->tickets, p->tickets < 1000 ? "\t" : "");  
80104288:	8b 43 10             	mov    0x10(%ebx),%eax
8010428b:	89 f2                	mov    %esi,%edx
8010428d:	3d e8 03 00 00       	cmp    $0x3e8,%eax
80104292:	0f 4c d7             	cmovl  %edi,%edx
80104295:	83 ec 0c             	sub    $0xc,%esp
80104298:	52                   	push   %edx
80104299:	50                   	push   %eax
8010429a:	ff 73 a4             	pushl  -0x5c(%ebx)
8010429d:	53                   	push   %ebx
8010429e:	68 f7 77 10 80       	push   $0x801077f7
801042a3:	e8 b8 c3 ff ff       	call   80100660 <cprintf>
801042a8:	83 c4 20             	add    $0x20,%esp
801042ab:	e9 76 ff ff ff       	jmp    80104226 <cps+0x46>
    else if(p->state == RUNNABLE)
      cprintf("%s \t %d \t %d %s \t RUNNABLE \t\n", p->name, p->pid, p->tickets,  p->tickets < 1000 ? "\t" : "");     
801042b0:	8b 43 10             	mov    0x10(%ebx),%eax
801042b3:	89 f2                	mov    %esi,%edx
801042b5:	3d e8 03 00 00       	cmp    $0x3e8,%eax
801042ba:	0f 4c d7             	cmovl  %edi,%edx
801042bd:	83 ec 0c             	sub    $0xc,%esp
801042c0:	52                   	push   %edx
801042c1:	50                   	push   %eax
801042c2:	ff 73 a4             	pushl  -0x5c(%ebx)
801042c5:	53                   	push   %ebx
801042c6:	68 15 78 10 80       	push   $0x80107815
801042cb:	e8 90 c3 ff ff       	call   80100660 <cprintf>
801042d0:	83 c4 20             	add    $0x20,%esp
801042d3:	e9 4e ff ff ff       	jmp    80104226 <cps+0x46>
801042d8:	90                   	nop
801042d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801042e0 <cht>:
  return 22;
}

int 
cht(int pid, int ntickets)
{
801042e0:	55                   	push   %ebp
801042e1:	89 e5                	mov    %esp,%ebp
801042e3:	53                   	push   %ebx
801042e4:	83 ec 10             	sub    $0x10,%esp
801042e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801042ea:	fb                   	sti    
  struct proc *p;

  sti();
  acquire(&ptable.lock);
801042eb:	68 60 28 11 80       	push   $0x80112860
801042f0:	e8 6b 01 00 00       	call   80104460 <acquire>
801042f5:	83 c4 10             	add    $0x10,%esp

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801042f8:	ba 94 28 11 80       	mov    $0x80112894,%edx
801042fd:	eb 0c                	jmp    8010430b <cht+0x2b>
801042ff:	90                   	nop
80104300:	83 ea 80             	sub    $0xffffff80,%edx
80104303:	81 fa 94 48 11 80    	cmp    $0x80114894,%edx
80104309:	74 0b                	je     80104316 <cht+0x36>
  {
    if(p->pid == pid)
8010430b:	39 5a 10             	cmp    %ebx,0x10(%edx)
8010430e:	75 f0                	jne    80104300 <cht+0x20>
    {
      p->tickets = ntickets;
80104310:	8b 45 0c             	mov    0xc(%ebp),%eax
80104313:	89 42 7c             	mov    %eax,0x7c(%edx)
      break;
    }
  }
  release(&ptable.lock);
80104316:	83 ec 0c             	sub    $0xc,%esp
80104319:	68 60 28 11 80       	push   $0x80112860
8010431e:	e8 1d 03 00 00       	call   80104640 <release>
  return pid;
80104323:	89 d8                	mov    %ebx,%eax
80104325:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104328:	c9                   	leave  
80104329:	c3                   	ret    
8010432a:	66 90                	xchg   %ax,%ax
8010432c:	66 90                	xchg   %ax,%ax
8010432e:	66 90                	xchg   %ax,%ax

80104330 <initsleeplock>:
80104330:	55                   	push   %ebp
80104331:	89 e5                	mov    %esp,%ebp
80104333:	53                   	push   %ebx
80104334:	83 ec 0c             	sub    $0xc,%esp
80104337:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010433a:	68 98 78 10 80       	push   $0x80107898
8010433f:	8d 43 04             	lea    0x4(%ebx),%eax
80104342:	50                   	push   %eax
80104343:	e8 f8 00 00 00       	call   80104440 <initlock>
80104348:	8b 45 0c             	mov    0xc(%ebp),%eax
8010434b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104351:	83 c4 10             	add    $0x10,%esp
80104354:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
8010435b:	89 43 38             	mov    %eax,0x38(%ebx)
8010435e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104361:	c9                   	leave  
80104362:	c3                   	ret    
80104363:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104370 <acquiresleep>:
80104370:	55                   	push   %ebp
80104371:	89 e5                	mov    %esp,%ebp
80104373:	56                   	push   %esi
80104374:	53                   	push   %ebx
80104375:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104378:	83 ec 0c             	sub    $0xc,%esp
8010437b:	8d 73 04             	lea    0x4(%ebx),%esi
8010437e:	56                   	push   %esi
8010437f:	e8 dc 00 00 00       	call   80104460 <acquire>
80104384:	8b 13                	mov    (%ebx),%edx
80104386:	83 c4 10             	add    $0x10,%esp
80104389:	85 d2                	test   %edx,%edx
8010438b:	74 16                	je     801043a3 <acquiresleep+0x33>
8010438d:	8d 76 00             	lea    0x0(%esi),%esi
80104390:	83 ec 08             	sub    $0x8,%esp
80104393:	56                   	push   %esi
80104394:	53                   	push   %ebx
80104395:	e8 e6 fa ff ff       	call   80103e80 <sleep>
8010439a:	8b 03                	mov    (%ebx),%eax
8010439c:	83 c4 10             	add    $0x10,%esp
8010439f:	85 c0                	test   %eax,%eax
801043a1:	75 ed                	jne    80104390 <acquiresleep+0x20>
801043a3:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
801043a9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801043af:	8b 40 10             	mov    0x10(%eax),%eax
801043b2:	89 43 3c             	mov    %eax,0x3c(%ebx)
801043b5:	89 75 08             	mov    %esi,0x8(%ebp)
801043b8:	8d 65 f8             	lea    -0x8(%ebp),%esp
801043bb:	5b                   	pop    %ebx
801043bc:	5e                   	pop    %esi
801043bd:	5d                   	pop    %ebp
801043be:	e9 7d 02 00 00       	jmp    80104640 <release>
801043c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801043c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801043d0 <releasesleep>:
801043d0:	55                   	push   %ebp
801043d1:	89 e5                	mov    %esp,%ebp
801043d3:	56                   	push   %esi
801043d4:	53                   	push   %ebx
801043d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801043d8:	83 ec 0c             	sub    $0xc,%esp
801043db:	8d 73 04             	lea    0x4(%ebx),%esi
801043de:	56                   	push   %esi
801043df:	e8 7c 00 00 00       	call   80104460 <acquire>
801043e4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801043ea:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
801043f1:	89 1c 24             	mov    %ebx,(%esp)
801043f4:	e8 27 fc ff ff       	call   80104020 <wakeup>
801043f9:	89 75 08             	mov    %esi,0x8(%ebp)
801043fc:	83 c4 10             	add    $0x10,%esp
801043ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104402:	5b                   	pop    %ebx
80104403:	5e                   	pop    %esi
80104404:	5d                   	pop    %ebp
80104405:	e9 36 02 00 00       	jmp    80104640 <release>
8010440a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104410 <holdingsleep>:
80104410:	55                   	push   %ebp
80104411:	89 e5                	mov    %esp,%ebp
80104413:	56                   	push   %esi
80104414:	53                   	push   %ebx
80104415:	8b 75 08             	mov    0x8(%ebp),%esi
80104418:	83 ec 0c             	sub    $0xc,%esp
8010441b:	8d 5e 04             	lea    0x4(%esi),%ebx
8010441e:	53                   	push   %ebx
8010441f:	e8 3c 00 00 00       	call   80104460 <acquire>
80104424:	8b 36                	mov    (%esi),%esi
80104426:	89 1c 24             	mov    %ebx,(%esp)
80104429:	e8 12 02 00 00       	call   80104640 <release>
8010442e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104431:	89 f0                	mov    %esi,%eax
80104433:	5b                   	pop    %ebx
80104434:	5e                   	pop    %esi
80104435:	5d                   	pop    %ebp
80104436:	c3                   	ret    
80104437:	66 90                	xchg   %ax,%ax
80104439:	66 90                	xchg   %ax,%ax
8010443b:	66 90                	xchg   %ax,%ax
8010443d:	66 90                	xchg   %ax,%ax
8010443f:	90                   	nop

80104440 <initlock>:
80104440:	55                   	push   %ebp
80104441:	89 e5                	mov    %esp,%ebp
80104443:	8b 45 08             	mov    0x8(%ebp),%eax
80104446:	8b 55 0c             	mov    0xc(%ebp),%edx
80104449:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010444f:	89 50 04             	mov    %edx,0x4(%eax)
80104452:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
80104459:	5d                   	pop    %ebp
8010445a:	c3                   	ret    
8010445b:	90                   	nop
8010445c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104460 <acquire>:
80104460:	55                   	push   %ebp
80104461:	89 e5                	mov    %esp,%ebp
80104463:	53                   	push   %ebx
80104464:	83 ec 04             	sub    $0x4,%esp
80104467:	9c                   	pushf  
80104468:	5a                   	pop    %edx
80104469:	fa                   	cli    
8010446a:	65 8b 0d 00 00 00 00 	mov    %gs:0x0,%ecx
80104471:	8b 81 ac 00 00 00    	mov    0xac(%ecx),%eax
80104477:	85 c0                	test   %eax,%eax
80104479:	75 0c                	jne    80104487 <acquire+0x27>
8010447b:	81 e2 00 02 00 00    	and    $0x200,%edx
80104481:	89 91 b0 00 00 00    	mov    %edx,0xb0(%ecx)
80104487:	8b 55 08             	mov    0x8(%ebp),%edx
8010448a:	83 c0 01             	add    $0x1,%eax
8010448d:	89 81 ac 00 00 00    	mov    %eax,0xac(%ecx)
80104493:	8b 02                	mov    (%edx),%eax
80104495:	85 c0                	test   %eax,%eax
80104497:	74 05                	je     8010449e <acquire+0x3e>
80104499:	39 4a 08             	cmp    %ecx,0x8(%edx)
8010449c:	74 7a                	je     80104518 <acquire+0xb8>
8010449e:	b9 01 00 00 00       	mov    $0x1,%ecx
801044a3:	90                   	nop
801044a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044a8:	89 c8                	mov    %ecx,%eax
801044aa:	f0 87 02             	lock xchg %eax,(%edx)
801044ad:	85 c0                	test   %eax,%eax
801044af:	75 f7                	jne    801044a8 <acquire+0x48>
801044b1:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
801044b6:	8b 4d 08             	mov    0x8(%ebp),%ecx
801044b9:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801044bf:	89 ea                	mov    %ebp,%edx
801044c1:	89 41 08             	mov    %eax,0x8(%ecx)
801044c4:	83 c1 0c             	add    $0xc,%ecx
801044c7:	31 c0                	xor    %eax,%eax
801044c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801044d0:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801044d6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801044dc:	77 1a                	ja     801044f8 <acquire+0x98>
801044de:	8b 5a 04             	mov    0x4(%edx),%ebx
801044e1:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
801044e4:	83 c0 01             	add    $0x1,%eax
801044e7:	8b 12                	mov    (%edx),%edx
801044e9:	83 f8 0a             	cmp    $0xa,%eax
801044ec:	75 e2                	jne    801044d0 <acquire+0x70>
801044ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801044f1:	c9                   	leave  
801044f2:	c3                   	ret    
801044f3:	90                   	nop
801044f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044f8:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
801044ff:	83 c0 01             	add    $0x1,%eax
80104502:	83 f8 0a             	cmp    $0xa,%eax
80104505:	74 e7                	je     801044ee <acquire+0x8e>
80104507:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
8010450e:	83 c0 01             	add    $0x1,%eax
80104511:	83 f8 0a             	cmp    $0xa,%eax
80104514:	75 e2                	jne    801044f8 <acquire+0x98>
80104516:	eb d6                	jmp    801044ee <acquire+0x8e>
80104518:	83 ec 0c             	sub    $0xc,%esp
8010451b:	68 a3 78 10 80       	push   $0x801078a3
80104520:	e8 4b be ff ff       	call   80100370 <panic>
80104525:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104530 <getcallerpcs>:
80104530:	55                   	push   %ebp
80104531:	89 e5                	mov    %esp,%ebp
80104533:	53                   	push   %ebx
80104534:	8b 45 08             	mov    0x8(%ebp),%eax
80104537:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010453a:	8d 50 f8             	lea    -0x8(%eax),%edx
8010453d:	31 c0                	xor    %eax,%eax
8010453f:	90                   	nop
80104540:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104546:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010454c:	77 1a                	ja     80104568 <getcallerpcs+0x38>
8010454e:	8b 5a 04             	mov    0x4(%edx),%ebx
80104551:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
80104554:	83 c0 01             	add    $0x1,%eax
80104557:	8b 12                	mov    (%edx),%edx
80104559:	83 f8 0a             	cmp    $0xa,%eax
8010455c:	75 e2                	jne    80104540 <getcallerpcs+0x10>
8010455e:	5b                   	pop    %ebx
8010455f:	5d                   	pop    %ebp
80104560:	c3                   	ret    
80104561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104568:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
8010456f:	83 c0 01             	add    $0x1,%eax
80104572:	83 f8 0a             	cmp    $0xa,%eax
80104575:	74 e7                	je     8010455e <getcallerpcs+0x2e>
80104577:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
8010457e:	83 c0 01             	add    $0x1,%eax
80104581:	83 f8 0a             	cmp    $0xa,%eax
80104584:	75 e2                	jne    80104568 <getcallerpcs+0x38>
80104586:	eb d6                	jmp    8010455e <getcallerpcs+0x2e>
80104588:	90                   	nop
80104589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104590 <holding>:
80104590:	55                   	push   %ebp
80104591:	89 e5                	mov    %esp,%ebp
80104593:	8b 55 08             	mov    0x8(%ebp),%edx
80104596:	8b 02                	mov    (%edx),%eax
80104598:	85 c0                	test   %eax,%eax
8010459a:	74 14                	je     801045b0 <holding+0x20>
8010459c:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801045a2:	39 42 08             	cmp    %eax,0x8(%edx)
801045a5:	5d                   	pop    %ebp
801045a6:	0f 94 c0             	sete   %al
801045a9:	0f b6 c0             	movzbl %al,%eax
801045ac:	c3                   	ret    
801045ad:	8d 76 00             	lea    0x0(%esi),%esi
801045b0:	31 c0                	xor    %eax,%eax
801045b2:	5d                   	pop    %ebp
801045b3:	c3                   	ret    
801045b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801045ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801045c0 <pushcli>:
801045c0:	55                   	push   %ebp
801045c1:	89 e5                	mov    %esp,%ebp
801045c3:	9c                   	pushf  
801045c4:	59                   	pop    %ecx
801045c5:	fa                   	cli    
801045c6:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
801045cd:	8b 82 ac 00 00 00    	mov    0xac(%edx),%eax
801045d3:	85 c0                	test   %eax,%eax
801045d5:	75 0c                	jne    801045e3 <pushcli+0x23>
801045d7:	81 e1 00 02 00 00    	and    $0x200,%ecx
801045dd:	89 8a b0 00 00 00    	mov    %ecx,0xb0(%edx)
801045e3:	83 c0 01             	add    $0x1,%eax
801045e6:	89 82 ac 00 00 00    	mov    %eax,0xac(%edx)
801045ec:	5d                   	pop    %ebp
801045ed:	c3                   	ret    
801045ee:	66 90                	xchg   %ax,%ax

801045f0 <popcli>:
801045f0:	55                   	push   %ebp
801045f1:	89 e5                	mov    %esp,%ebp
801045f3:	83 ec 08             	sub    $0x8,%esp
801045f6:	9c                   	pushf  
801045f7:	58                   	pop    %eax
801045f8:	f6 c4 02             	test   $0x2,%ah
801045fb:	75 2c                	jne    80104629 <popcli+0x39>
801045fd:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104604:	83 aa ac 00 00 00 01 	subl   $0x1,0xac(%edx)
8010460b:	78 0f                	js     8010461c <popcli+0x2c>
8010460d:	75 0b                	jne    8010461a <popcli+0x2a>
8010460f:	8b 82 b0 00 00 00    	mov    0xb0(%edx),%eax
80104615:	85 c0                	test   %eax,%eax
80104617:	74 01                	je     8010461a <popcli+0x2a>
80104619:	fb                   	sti    
8010461a:	c9                   	leave  
8010461b:	c3                   	ret    
8010461c:	83 ec 0c             	sub    $0xc,%esp
8010461f:	68 c2 78 10 80       	push   $0x801078c2
80104624:	e8 47 bd ff ff       	call   80100370 <panic>
80104629:	83 ec 0c             	sub    $0xc,%esp
8010462c:	68 ab 78 10 80       	push   $0x801078ab
80104631:	e8 3a bd ff ff       	call   80100370 <panic>
80104636:	8d 76 00             	lea    0x0(%esi),%esi
80104639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104640 <release>:
80104640:	55                   	push   %ebp
80104641:	89 e5                	mov    %esp,%ebp
80104643:	83 ec 08             	sub    $0x8,%esp
80104646:	8b 45 08             	mov    0x8(%ebp),%eax
80104649:	8b 10                	mov    (%eax),%edx
8010464b:	85 d2                	test   %edx,%edx
8010464d:	74 0c                	je     8010465b <release+0x1b>
8010464f:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104656:	39 50 08             	cmp    %edx,0x8(%eax)
80104659:	74 15                	je     80104670 <release+0x30>
8010465b:	83 ec 0c             	sub    $0xc,%esp
8010465e:	68 c9 78 10 80       	push   $0x801078c9
80104663:	e8 08 bd ff ff       	call   80100370 <panic>
80104668:	90                   	nop
80104669:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104670:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
80104677:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
8010467e:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
80104683:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104689:	c9                   	leave  
8010468a:	e9 61 ff ff ff       	jmp    801045f0 <popcli>
8010468f:	90                   	nop

80104690 <memset>:
80104690:	55                   	push   %ebp
80104691:	89 e5                	mov    %esp,%ebp
80104693:	57                   	push   %edi
80104694:	53                   	push   %ebx
80104695:	8b 55 08             	mov    0x8(%ebp),%edx
80104698:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010469b:	f6 c2 03             	test   $0x3,%dl
8010469e:	75 05                	jne    801046a5 <memset+0x15>
801046a0:	f6 c1 03             	test   $0x3,%cl
801046a3:	74 13                	je     801046b8 <memset+0x28>
801046a5:	89 d7                	mov    %edx,%edi
801046a7:	8b 45 0c             	mov    0xc(%ebp),%eax
801046aa:	fc                   	cld    
801046ab:	f3 aa                	rep stos %al,%es:(%edi)
801046ad:	5b                   	pop    %ebx
801046ae:	89 d0                	mov    %edx,%eax
801046b0:	5f                   	pop    %edi
801046b1:	5d                   	pop    %ebp
801046b2:	c3                   	ret    
801046b3:	90                   	nop
801046b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801046b8:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
801046bc:	c1 e9 02             	shr    $0x2,%ecx
801046bf:	89 fb                	mov    %edi,%ebx
801046c1:	89 f8                	mov    %edi,%eax
801046c3:	c1 e3 18             	shl    $0x18,%ebx
801046c6:	c1 e0 10             	shl    $0x10,%eax
801046c9:	09 d8                	or     %ebx,%eax
801046cb:	09 f8                	or     %edi,%eax
801046cd:	c1 e7 08             	shl    $0x8,%edi
801046d0:	09 f8                	or     %edi,%eax
801046d2:	89 d7                	mov    %edx,%edi
801046d4:	fc                   	cld    
801046d5:	f3 ab                	rep stos %eax,%es:(%edi)
801046d7:	5b                   	pop    %ebx
801046d8:	89 d0                	mov    %edx,%eax
801046da:	5f                   	pop    %edi
801046db:	5d                   	pop    %ebp
801046dc:	c3                   	ret    
801046dd:	8d 76 00             	lea    0x0(%esi),%esi

801046e0 <memcmp>:
801046e0:	55                   	push   %ebp
801046e1:	89 e5                	mov    %esp,%ebp
801046e3:	57                   	push   %edi
801046e4:	56                   	push   %esi
801046e5:	8b 45 10             	mov    0x10(%ebp),%eax
801046e8:	53                   	push   %ebx
801046e9:	8b 75 0c             	mov    0xc(%ebp),%esi
801046ec:	8b 5d 08             	mov    0x8(%ebp),%ebx
801046ef:	85 c0                	test   %eax,%eax
801046f1:	74 29                	je     8010471c <memcmp+0x3c>
801046f3:	0f b6 13             	movzbl (%ebx),%edx
801046f6:	0f b6 0e             	movzbl (%esi),%ecx
801046f9:	38 d1                	cmp    %dl,%cl
801046fb:	75 2b                	jne    80104728 <memcmp+0x48>
801046fd:	8d 78 ff             	lea    -0x1(%eax),%edi
80104700:	31 c0                	xor    %eax,%eax
80104702:	eb 14                	jmp    80104718 <memcmp+0x38>
80104704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104708:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
8010470d:	83 c0 01             	add    $0x1,%eax
80104710:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
80104714:	38 ca                	cmp    %cl,%dl
80104716:	75 10                	jne    80104728 <memcmp+0x48>
80104718:	39 f8                	cmp    %edi,%eax
8010471a:	75 ec                	jne    80104708 <memcmp+0x28>
8010471c:	5b                   	pop    %ebx
8010471d:	31 c0                	xor    %eax,%eax
8010471f:	5e                   	pop    %esi
80104720:	5f                   	pop    %edi
80104721:	5d                   	pop    %ebp
80104722:	c3                   	ret    
80104723:	90                   	nop
80104724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104728:	0f b6 c2             	movzbl %dl,%eax
8010472b:	5b                   	pop    %ebx
8010472c:	29 c8                	sub    %ecx,%eax
8010472e:	5e                   	pop    %esi
8010472f:	5f                   	pop    %edi
80104730:	5d                   	pop    %ebp
80104731:	c3                   	ret    
80104732:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104740 <memmove>:
80104740:	55                   	push   %ebp
80104741:	89 e5                	mov    %esp,%ebp
80104743:	56                   	push   %esi
80104744:	53                   	push   %ebx
80104745:	8b 45 08             	mov    0x8(%ebp),%eax
80104748:	8b 75 0c             	mov    0xc(%ebp),%esi
8010474b:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010474e:	39 c6                	cmp    %eax,%esi
80104750:	73 2e                	jae    80104780 <memmove+0x40>
80104752:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
80104755:	39 c8                	cmp    %ecx,%eax
80104757:	73 27                	jae    80104780 <memmove+0x40>
80104759:	85 db                	test   %ebx,%ebx
8010475b:	8d 53 ff             	lea    -0x1(%ebx),%edx
8010475e:	74 17                	je     80104777 <memmove+0x37>
80104760:	29 d9                	sub    %ebx,%ecx
80104762:	89 cb                	mov    %ecx,%ebx
80104764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104768:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
8010476c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
8010476f:	83 ea 01             	sub    $0x1,%edx
80104772:	83 fa ff             	cmp    $0xffffffff,%edx
80104775:	75 f1                	jne    80104768 <memmove+0x28>
80104777:	5b                   	pop    %ebx
80104778:	5e                   	pop    %esi
80104779:	5d                   	pop    %ebp
8010477a:	c3                   	ret    
8010477b:	90                   	nop
8010477c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104780:	31 d2                	xor    %edx,%edx
80104782:	85 db                	test   %ebx,%ebx
80104784:	74 f1                	je     80104777 <memmove+0x37>
80104786:	8d 76 00             	lea    0x0(%esi),%esi
80104789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104790:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104794:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104797:	83 c2 01             	add    $0x1,%edx
8010479a:	39 d3                	cmp    %edx,%ebx
8010479c:	75 f2                	jne    80104790 <memmove+0x50>
8010479e:	5b                   	pop    %ebx
8010479f:	5e                   	pop    %esi
801047a0:	5d                   	pop    %ebp
801047a1:	c3                   	ret    
801047a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801047a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801047b0 <memcpy>:
801047b0:	55                   	push   %ebp
801047b1:	89 e5                	mov    %esp,%ebp
801047b3:	5d                   	pop    %ebp
801047b4:	eb 8a                	jmp    80104740 <memmove>
801047b6:	8d 76 00             	lea    0x0(%esi),%esi
801047b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801047c0 <strncmp>:
801047c0:	55                   	push   %ebp
801047c1:	89 e5                	mov    %esp,%ebp
801047c3:	57                   	push   %edi
801047c4:	56                   	push   %esi
801047c5:	8b 4d 10             	mov    0x10(%ebp),%ecx
801047c8:	53                   	push   %ebx
801047c9:	8b 7d 08             	mov    0x8(%ebp),%edi
801047cc:	8b 75 0c             	mov    0xc(%ebp),%esi
801047cf:	85 c9                	test   %ecx,%ecx
801047d1:	74 37                	je     8010480a <strncmp+0x4a>
801047d3:	0f b6 17             	movzbl (%edi),%edx
801047d6:	0f b6 1e             	movzbl (%esi),%ebx
801047d9:	84 d2                	test   %dl,%dl
801047db:	74 3f                	je     8010481c <strncmp+0x5c>
801047dd:	38 d3                	cmp    %dl,%bl
801047df:	75 3b                	jne    8010481c <strncmp+0x5c>
801047e1:	8d 47 01             	lea    0x1(%edi),%eax
801047e4:	01 cf                	add    %ecx,%edi
801047e6:	eb 1b                	jmp    80104803 <strncmp+0x43>
801047e8:	90                   	nop
801047e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801047f0:	0f b6 10             	movzbl (%eax),%edx
801047f3:	84 d2                	test   %dl,%dl
801047f5:	74 21                	je     80104818 <strncmp+0x58>
801047f7:	0f b6 19             	movzbl (%ecx),%ebx
801047fa:	83 c0 01             	add    $0x1,%eax
801047fd:	89 ce                	mov    %ecx,%esi
801047ff:	38 da                	cmp    %bl,%dl
80104801:	75 19                	jne    8010481c <strncmp+0x5c>
80104803:	39 c7                	cmp    %eax,%edi
80104805:	8d 4e 01             	lea    0x1(%esi),%ecx
80104808:	75 e6                	jne    801047f0 <strncmp+0x30>
8010480a:	5b                   	pop    %ebx
8010480b:	31 c0                	xor    %eax,%eax
8010480d:	5e                   	pop    %esi
8010480e:	5f                   	pop    %edi
8010480f:	5d                   	pop    %ebp
80104810:	c3                   	ret    
80104811:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104818:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
8010481c:	0f b6 c2             	movzbl %dl,%eax
8010481f:	29 d8                	sub    %ebx,%eax
80104821:	5b                   	pop    %ebx
80104822:	5e                   	pop    %esi
80104823:	5f                   	pop    %edi
80104824:	5d                   	pop    %ebp
80104825:	c3                   	ret    
80104826:	8d 76 00             	lea    0x0(%esi),%esi
80104829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104830 <strncpy>:
80104830:	55                   	push   %ebp
80104831:	89 e5                	mov    %esp,%ebp
80104833:	56                   	push   %esi
80104834:	53                   	push   %ebx
80104835:	8b 45 08             	mov    0x8(%ebp),%eax
80104838:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010483b:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010483e:	89 c2                	mov    %eax,%edx
80104840:	eb 19                	jmp    8010485b <strncpy+0x2b>
80104842:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104848:	83 c3 01             	add    $0x1,%ebx
8010484b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
8010484f:	83 c2 01             	add    $0x1,%edx
80104852:	84 c9                	test   %cl,%cl
80104854:	88 4a ff             	mov    %cl,-0x1(%edx)
80104857:	74 09                	je     80104862 <strncpy+0x32>
80104859:	89 f1                	mov    %esi,%ecx
8010485b:	85 c9                	test   %ecx,%ecx
8010485d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104860:	7f e6                	jg     80104848 <strncpy+0x18>
80104862:	31 c9                	xor    %ecx,%ecx
80104864:	85 f6                	test   %esi,%esi
80104866:	7e 17                	jle    8010487f <strncpy+0x4f>
80104868:	90                   	nop
80104869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104870:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104874:	89 f3                	mov    %esi,%ebx
80104876:	83 c1 01             	add    $0x1,%ecx
80104879:	29 cb                	sub    %ecx,%ebx
8010487b:	85 db                	test   %ebx,%ebx
8010487d:	7f f1                	jg     80104870 <strncpy+0x40>
8010487f:	5b                   	pop    %ebx
80104880:	5e                   	pop    %esi
80104881:	5d                   	pop    %ebp
80104882:	c3                   	ret    
80104883:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104890 <safestrcpy>:
80104890:	55                   	push   %ebp
80104891:	89 e5                	mov    %esp,%ebp
80104893:	56                   	push   %esi
80104894:	53                   	push   %ebx
80104895:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104898:	8b 45 08             	mov    0x8(%ebp),%eax
8010489b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010489e:	85 c9                	test   %ecx,%ecx
801048a0:	7e 26                	jle    801048c8 <safestrcpy+0x38>
801048a2:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
801048a6:	89 c1                	mov    %eax,%ecx
801048a8:	eb 17                	jmp    801048c1 <safestrcpy+0x31>
801048aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801048b0:	83 c2 01             	add    $0x1,%edx
801048b3:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
801048b7:	83 c1 01             	add    $0x1,%ecx
801048ba:	84 db                	test   %bl,%bl
801048bc:	88 59 ff             	mov    %bl,-0x1(%ecx)
801048bf:	74 04                	je     801048c5 <safestrcpy+0x35>
801048c1:	39 f2                	cmp    %esi,%edx
801048c3:	75 eb                	jne    801048b0 <safestrcpy+0x20>
801048c5:	c6 01 00             	movb   $0x0,(%ecx)
801048c8:	5b                   	pop    %ebx
801048c9:	5e                   	pop    %esi
801048ca:	5d                   	pop    %ebp
801048cb:	c3                   	ret    
801048cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801048d0 <strlen>:
801048d0:	55                   	push   %ebp
801048d1:	31 c0                	xor    %eax,%eax
801048d3:	89 e5                	mov    %esp,%ebp
801048d5:	8b 55 08             	mov    0x8(%ebp),%edx
801048d8:	80 3a 00             	cmpb   $0x0,(%edx)
801048db:	74 0c                	je     801048e9 <strlen+0x19>
801048dd:	8d 76 00             	lea    0x0(%esi),%esi
801048e0:	83 c0 01             	add    $0x1,%eax
801048e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
801048e7:	75 f7                	jne    801048e0 <strlen+0x10>
801048e9:	5d                   	pop    %ebp
801048ea:	c3                   	ret    

801048eb <swtch>:
801048eb:	8b 44 24 04          	mov    0x4(%esp),%eax
801048ef:	8b 54 24 08          	mov    0x8(%esp),%edx
801048f3:	55                   	push   %ebp
801048f4:	53                   	push   %ebx
801048f5:	56                   	push   %esi
801048f6:	57                   	push   %edi
801048f7:	89 20                	mov    %esp,(%eax)
801048f9:	89 d4                	mov    %edx,%esp
801048fb:	5f                   	pop    %edi
801048fc:	5e                   	pop    %esi
801048fd:	5b                   	pop    %ebx
801048fe:	5d                   	pop    %ebp
801048ff:	c3                   	ret    

80104900 <fetchint>:
80104900:	55                   	push   %ebp
80104901:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104908:	89 e5                	mov    %esp,%ebp
8010490a:	8b 45 08             	mov    0x8(%ebp),%eax
8010490d:	8b 12                	mov    (%edx),%edx
8010490f:	39 c2                	cmp    %eax,%edx
80104911:	76 15                	jbe    80104928 <fetchint+0x28>
80104913:	8d 48 04             	lea    0x4(%eax),%ecx
80104916:	39 ca                	cmp    %ecx,%edx
80104918:	72 0e                	jb     80104928 <fetchint+0x28>
8010491a:	8b 10                	mov    (%eax),%edx
8010491c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010491f:	89 10                	mov    %edx,(%eax)
80104921:	31 c0                	xor    %eax,%eax
80104923:	5d                   	pop    %ebp
80104924:	c3                   	ret    
80104925:	8d 76 00             	lea    0x0(%esi),%esi
80104928:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010492d:	5d                   	pop    %ebp
8010492e:	c3                   	ret    
8010492f:	90                   	nop

80104930 <fetchstr>:
80104930:	55                   	push   %ebp
80104931:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104937:	89 e5                	mov    %esp,%ebp
80104939:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010493c:	39 08                	cmp    %ecx,(%eax)
8010493e:	76 2c                	jbe    8010496c <fetchstr+0x3c>
80104940:	8b 55 0c             	mov    0xc(%ebp),%edx
80104943:	89 c8                	mov    %ecx,%eax
80104945:	89 0a                	mov    %ecx,(%edx)
80104947:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
8010494e:	8b 12                	mov    (%edx),%edx
80104950:	39 d1                	cmp    %edx,%ecx
80104952:	73 18                	jae    8010496c <fetchstr+0x3c>
80104954:	80 39 00             	cmpb   $0x0,(%ecx)
80104957:	75 0c                	jne    80104965 <fetchstr+0x35>
80104959:	eb 1d                	jmp    80104978 <fetchstr+0x48>
8010495b:	90                   	nop
8010495c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104960:	80 38 00             	cmpb   $0x0,(%eax)
80104963:	74 13                	je     80104978 <fetchstr+0x48>
80104965:	83 c0 01             	add    $0x1,%eax
80104968:	39 c2                	cmp    %eax,%edx
8010496a:	77 f4                	ja     80104960 <fetchstr+0x30>
8010496c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104971:	5d                   	pop    %ebp
80104972:	c3                   	ret    
80104973:	90                   	nop
80104974:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104978:	29 c8                	sub    %ecx,%eax
8010497a:	5d                   	pop    %ebp
8010497b:	c3                   	ret    
8010497c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104980 <argint>:
80104980:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104987:	55                   	push   %ebp
80104988:	89 e5                	mov    %esp,%ebp
8010498a:	8b 42 18             	mov    0x18(%edx),%eax
8010498d:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104990:	8b 12                	mov    (%edx),%edx
80104992:	8b 40 44             	mov    0x44(%eax),%eax
80104995:	8d 04 88             	lea    (%eax,%ecx,4),%eax
80104998:	8d 48 04             	lea    0x4(%eax),%ecx
8010499b:	39 d1                	cmp    %edx,%ecx
8010499d:	73 19                	jae    801049b8 <argint+0x38>
8010499f:	8d 48 08             	lea    0x8(%eax),%ecx
801049a2:	39 ca                	cmp    %ecx,%edx
801049a4:	72 12                	jb     801049b8 <argint+0x38>
801049a6:	8b 50 04             	mov    0x4(%eax),%edx
801049a9:	8b 45 0c             	mov    0xc(%ebp),%eax
801049ac:	89 10                	mov    %edx,(%eax)
801049ae:	31 c0                	xor    %eax,%eax
801049b0:	5d                   	pop    %ebp
801049b1:	c3                   	ret    
801049b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801049b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801049bd:	5d                   	pop    %ebp
801049be:	c3                   	ret    
801049bf:	90                   	nop

801049c0 <argptr>:
801049c0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801049c6:	55                   	push   %ebp
801049c7:	89 e5                	mov    %esp,%ebp
801049c9:	56                   	push   %esi
801049ca:	53                   	push   %ebx
801049cb:	8b 48 18             	mov    0x18(%eax),%ecx
801049ce:	8b 5d 08             	mov    0x8(%ebp),%ebx
801049d1:	8b 55 10             	mov    0x10(%ebp),%edx
801049d4:	8b 49 44             	mov    0x44(%ecx),%ecx
801049d7:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx
801049da:	8b 08                	mov    (%eax),%ecx
801049dc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801049e1:	8d 73 04             	lea    0x4(%ebx),%esi
801049e4:	39 ce                	cmp    %ecx,%esi
801049e6:	73 1f                	jae    80104a07 <argptr+0x47>
801049e8:	8d 73 08             	lea    0x8(%ebx),%esi
801049eb:	39 f1                	cmp    %esi,%ecx
801049ed:	72 18                	jb     80104a07 <argptr+0x47>
801049ef:	85 d2                	test   %edx,%edx
801049f1:	8b 5b 04             	mov    0x4(%ebx),%ebx
801049f4:	78 11                	js     80104a07 <argptr+0x47>
801049f6:	39 cb                	cmp    %ecx,%ebx
801049f8:	73 0d                	jae    80104a07 <argptr+0x47>
801049fa:	01 da                	add    %ebx,%edx
801049fc:	39 ca                	cmp    %ecx,%edx
801049fe:	77 07                	ja     80104a07 <argptr+0x47>
80104a00:	8b 45 0c             	mov    0xc(%ebp),%eax
80104a03:	89 18                	mov    %ebx,(%eax)
80104a05:	31 c0                	xor    %eax,%eax
80104a07:	5b                   	pop    %ebx
80104a08:	5e                   	pop    %esi
80104a09:	5d                   	pop    %ebp
80104a0a:	c3                   	ret    
80104a0b:	90                   	nop
80104a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104a10 <argstr>:
80104a10:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104a16:	55                   	push   %ebp
80104a17:	89 e5                	mov    %esp,%ebp
80104a19:	8b 50 18             	mov    0x18(%eax),%edx
80104a1c:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104a1f:	8b 00                	mov    (%eax),%eax
80104a21:	8b 52 44             	mov    0x44(%edx),%edx
80104a24:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
80104a27:	8d 4a 04             	lea    0x4(%edx),%ecx
80104a2a:	39 c1                	cmp    %eax,%ecx
80104a2c:	73 07                	jae    80104a35 <argstr+0x25>
80104a2e:	8d 4a 08             	lea    0x8(%edx),%ecx
80104a31:	39 c8                	cmp    %ecx,%eax
80104a33:	73 0b                	jae    80104a40 <argstr+0x30>
80104a35:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a3a:	5d                   	pop    %ebp
80104a3b:	c3                   	ret    
80104a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104a40:	8b 4a 04             	mov    0x4(%edx),%ecx
80104a43:	39 c1                	cmp    %eax,%ecx
80104a45:	73 ee                	jae    80104a35 <argstr+0x25>
80104a47:	8b 55 0c             	mov    0xc(%ebp),%edx
80104a4a:	89 c8                	mov    %ecx,%eax
80104a4c:	89 0a                	mov    %ecx,(%edx)
80104a4e:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104a55:	8b 12                	mov    (%edx),%edx
80104a57:	39 d1                	cmp    %edx,%ecx
80104a59:	73 da                	jae    80104a35 <argstr+0x25>
80104a5b:	80 39 00             	cmpb   $0x0,(%ecx)
80104a5e:	75 0d                	jne    80104a6d <argstr+0x5d>
80104a60:	eb 1e                	jmp    80104a80 <argstr+0x70>
80104a62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104a68:	80 38 00             	cmpb   $0x0,(%eax)
80104a6b:	74 13                	je     80104a80 <argstr+0x70>
80104a6d:	83 c0 01             	add    $0x1,%eax
80104a70:	39 c2                	cmp    %eax,%edx
80104a72:	77 f4                	ja     80104a68 <argstr+0x58>
80104a74:	eb bf                	jmp    80104a35 <argstr+0x25>
80104a76:	8d 76 00             	lea    0x0(%esi),%esi
80104a79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104a80:	29 c8                	sub    %ecx,%eax
80104a82:	5d                   	pop    %ebp
80104a83:	c3                   	ret    
80104a84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104a8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104a90 <syscall>:
80104a90:	55                   	push   %ebp
80104a91:	89 e5                	mov    %esp,%ebp
80104a93:	53                   	push   %ebx
80104a94:	83 ec 04             	sub    $0x4,%esp
80104a97:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104a9e:	8b 5a 18             	mov    0x18(%edx),%ebx
80104aa1:	8b 43 1c             	mov    0x1c(%ebx),%eax
80104aa4:	8d 48 ff             	lea    -0x1(%eax),%ecx
80104aa7:	83 f9 16             	cmp    $0x16,%ecx
80104aaa:	77 1c                	ja     80104ac8 <syscall+0x38>
80104aac:	8b 0c 85 00 79 10 80 	mov    -0x7fef8700(,%eax,4),%ecx
80104ab3:	85 c9                	test   %ecx,%ecx
80104ab5:	74 11                	je     80104ac8 <syscall+0x38>
80104ab7:	ff d1                	call   *%ecx
80104ab9:	89 43 1c             	mov    %eax,0x1c(%ebx)
80104abc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104abf:	c9                   	leave  
80104ac0:	c3                   	ret    
80104ac1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104ac8:	50                   	push   %eax
80104ac9:	8d 42 6c             	lea    0x6c(%edx),%eax
80104acc:	50                   	push   %eax
80104acd:	ff 72 10             	pushl  0x10(%edx)
80104ad0:	68 d1 78 10 80       	push   $0x801078d1
80104ad5:	e8 86 bb ff ff       	call   80100660 <cprintf>
80104ada:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104ae0:	83 c4 10             	add    $0x10,%esp
80104ae3:	8b 40 18             	mov    0x18(%eax),%eax
80104ae6:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
80104aed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104af0:	c9                   	leave  
80104af1:	c3                   	ret    
80104af2:	66 90                	xchg   %ax,%ax
80104af4:	66 90                	xchg   %ax,%ax
80104af6:	66 90                	xchg   %ax,%ax
80104af8:	66 90                	xchg   %ax,%ax
80104afa:	66 90                	xchg   %ax,%ax
80104afc:	66 90                	xchg   %ax,%ax
80104afe:	66 90                	xchg   %ax,%ax

80104b00 <create>:
80104b00:	55                   	push   %ebp
80104b01:	89 e5                	mov    %esp,%ebp
80104b03:	57                   	push   %edi
80104b04:	56                   	push   %esi
80104b05:	53                   	push   %ebx
80104b06:	8d 75 da             	lea    -0x26(%ebp),%esi
80104b09:	83 ec 44             	sub    $0x44,%esp
80104b0c:	89 4d c0             	mov    %ecx,-0x40(%ebp)
80104b0f:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104b12:	56                   	push   %esi
80104b13:	50                   	push   %eax
80104b14:	89 55 c4             	mov    %edx,-0x3c(%ebp)
80104b17:	89 4d bc             	mov    %ecx,-0x44(%ebp)
80104b1a:	e8 81 d3 ff ff       	call   80101ea0 <nameiparent>
80104b1f:	83 c4 10             	add    $0x10,%esp
80104b22:	85 c0                	test   %eax,%eax
80104b24:	0f 84 f6 00 00 00    	je     80104c20 <create+0x120>
80104b2a:	83 ec 0c             	sub    $0xc,%esp
80104b2d:	89 c7                	mov    %eax,%edi
80104b2f:	50                   	push   %eax
80104b30:	e8 1b cb ff ff       	call   80101650 <ilock>
80104b35:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104b38:	83 c4 0c             	add    $0xc,%esp
80104b3b:	50                   	push   %eax
80104b3c:	56                   	push   %esi
80104b3d:	57                   	push   %edi
80104b3e:	e8 1d d0 ff ff       	call   80101b60 <dirlookup>
80104b43:	83 c4 10             	add    $0x10,%esp
80104b46:	85 c0                	test   %eax,%eax
80104b48:	89 c3                	mov    %eax,%ebx
80104b4a:	74 54                	je     80104ba0 <create+0xa0>
80104b4c:	83 ec 0c             	sub    $0xc,%esp
80104b4f:	57                   	push   %edi
80104b50:	e8 6b cd ff ff       	call   801018c0 <iunlockput>
80104b55:	89 1c 24             	mov    %ebx,(%esp)
80104b58:	e8 f3 ca ff ff       	call   80101650 <ilock>
80104b5d:	83 c4 10             	add    $0x10,%esp
80104b60:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104b65:	75 19                	jne    80104b80 <create+0x80>
80104b67:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
80104b6c:	89 d8                	mov    %ebx,%eax
80104b6e:	75 10                	jne    80104b80 <create+0x80>
80104b70:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104b73:	5b                   	pop    %ebx
80104b74:	5e                   	pop    %esi
80104b75:	5f                   	pop    %edi
80104b76:	5d                   	pop    %ebp
80104b77:	c3                   	ret    
80104b78:	90                   	nop
80104b79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104b80:	83 ec 0c             	sub    $0xc,%esp
80104b83:	53                   	push   %ebx
80104b84:	e8 37 cd ff ff       	call   801018c0 <iunlockput>
80104b89:	83 c4 10             	add    $0x10,%esp
80104b8c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104b8f:	31 c0                	xor    %eax,%eax
80104b91:	5b                   	pop    %ebx
80104b92:	5e                   	pop    %esi
80104b93:	5f                   	pop    %edi
80104b94:	5d                   	pop    %ebp
80104b95:	c3                   	ret    
80104b96:	8d 76 00             	lea    0x0(%esi),%esi
80104b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104ba0:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104ba4:	83 ec 08             	sub    $0x8,%esp
80104ba7:	50                   	push   %eax
80104ba8:	ff 37                	pushl  (%edi)
80104baa:	e8 31 c9 ff ff       	call   801014e0 <ialloc>
80104baf:	83 c4 10             	add    $0x10,%esp
80104bb2:	85 c0                	test   %eax,%eax
80104bb4:	89 c3                	mov    %eax,%ebx
80104bb6:	0f 84 cc 00 00 00    	je     80104c88 <create+0x188>
80104bbc:	83 ec 0c             	sub    $0xc,%esp
80104bbf:	50                   	push   %eax
80104bc0:	e8 8b ca ff ff       	call   80101650 <ilock>
80104bc5:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104bc9:	66 89 43 52          	mov    %ax,0x52(%ebx)
80104bcd:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104bd1:	66 89 43 54          	mov    %ax,0x54(%ebx)
80104bd5:	b8 01 00 00 00       	mov    $0x1,%eax
80104bda:	66 89 43 56          	mov    %ax,0x56(%ebx)
80104bde:	89 1c 24             	mov    %ebx,(%esp)
80104be1:	e8 ba c9 ff ff       	call   801015a0 <iupdate>
80104be6:	83 c4 10             	add    $0x10,%esp
80104be9:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
80104bee:	74 40                	je     80104c30 <create+0x130>
80104bf0:	83 ec 04             	sub    $0x4,%esp
80104bf3:	ff 73 04             	pushl  0x4(%ebx)
80104bf6:	56                   	push   %esi
80104bf7:	57                   	push   %edi
80104bf8:	e8 c3 d1 ff ff       	call   80101dc0 <dirlink>
80104bfd:	83 c4 10             	add    $0x10,%esp
80104c00:	85 c0                	test   %eax,%eax
80104c02:	78 77                	js     80104c7b <create+0x17b>
80104c04:	83 ec 0c             	sub    $0xc,%esp
80104c07:	57                   	push   %edi
80104c08:	e8 b3 cc ff ff       	call   801018c0 <iunlockput>
80104c0d:	83 c4 10             	add    $0x10,%esp
80104c10:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104c13:	89 d8                	mov    %ebx,%eax
80104c15:	5b                   	pop    %ebx
80104c16:	5e                   	pop    %esi
80104c17:	5f                   	pop    %edi
80104c18:	5d                   	pop    %ebp
80104c19:	c3                   	ret    
80104c1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104c20:	31 c0                	xor    %eax,%eax
80104c22:	e9 49 ff ff ff       	jmp    80104b70 <create+0x70>
80104c27:	89 f6                	mov    %esi,%esi
80104c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104c30:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
80104c35:	83 ec 0c             	sub    $0xc,%esp
80104c38:	57                   	push   %edi
80104c39:	e8 62 c9 ff ff       	call   801015a0 <iupdate>
80104c3e:	83 c4 0c             	add    $0xc,%esp
80104c41:	ff 73 04             	pushl  0x4(%ebx)
80104c44:	68 7c 79 10 80       	push   $0x8010797c
80104c49:	53                   	push   %ebx
80104c4a:	e8 71 d1 ff ff       	call   80101dc0 <dirlink>
80104c4f:	83 c4 10             	add    $0x10,%esp
80104c52:	85 c0                	test   %eax,%eax
80104c54:	78 18                	js     80104c6e <create+0x16e>
80104c56:	83 ec 04             	sub    $0x4,%esp
80104c59:	ff 77 04             	pushl  0x4(%edi)
80104c5c:	68 7b 79 10 80       	push   $0x8010797b
80104c61:	53                   	push   %ebx
80104c62:	e8 59 d1 ff ff       	call   80101dc0 <dirlink>
80104c67:	83 c4 10             	add    $0x10,%esp
80104c6a:	85 c0                	test   %eax,%eax
80104c6c:	79 82                	jns    80104bf0 <create+0xf0>
80104c6e:	83 ec 0c             	sub    $0xc,%esp
80104c71:	68 6f 79 10 80       	push   $0x8010796f
80104c76:	e8 f5 b6 ff ff       	call   80100370 <panic>
80104c7b:	83 ec 0c             	sub    $0xc,%esp
80104c7e:	68 7e 79 10 80       	push   $0x8010797e
80104c83:	e8 e8 b6 ff ff       	call   80100370 <panic>
80104c88:	83 ec 0c             	sub    $0xc,%esp
80104c8b:	68 60 79 10 80       	push   $0x80107960
80104c90:	e8 db b6 ff ff       	call   80100370 <panic>
80104c95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ca0 <argfd.constprop.0>:
80104ca0:	55                   	push   %ebp
80104ca1:	89 e5                	mov    %esp,%ebp
80104ca3:	56                   	push   %esi
80104ca4:	53                   	push   %ebx
80104ca5:	89 c6                	mov    %eax,%esi
80104ca7:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104caa:	89 d3                	mov    %edx,%ebx
80104cac:	83 ec 18             	sub    $0x18,%esp
80104caf:	50                   	push   %eax
80104cb0:	6a 00                	push   $0x0
80104cb2:	e8 c9 fc ff ff       	call   80104980 <argint>
80104cb7:	83 c4 10             	add    $0x10,%esp
80104cba:	85 c0                	test   %eax,%eax
80104cbc:	78 3a                	js     80104cf8 <argfd.constprop.0+0x58>
80104cbe:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104cc1:	83 f8 0f             	cmp    $0xf,%eax
80104cc4:	77 32                	ja     80104cf8 <argfd.constprop.0+0x58>
80104cc6:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104ccd:	8b 54 82 28          	mov    0x28(%edx,%eax,4),%edx
80104cd1:	85 d2                	test   %edx,%edx
80104cd3:	74 23                	je     80104cf8 <argfd.constprop.0+0x58>
80104cd5:	85 f6                	test   %esi,%esi
80104cd7:	74 02                	je     80104cdb <argfd.constprop.0+0x3b>
80104cd9:	89 06                	mov    %eax,(%esi)
80104cdb:	85 db                	test   %ebx,%ebx
80104cdd:	74 11                	je     80104cf0 <argfd.constprop.0+0x50>
80104cdf:	89 13                	mov    %edx,(%ebx)
80104ce1:	31 c0                	xor    %eax,%eax
80104ce3:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104ce6:	5b                   	pop    %ebx
80104ce7:	5e                   	pop    %esi
80104ce8:	5d                   	pop    %ebp
80104ce9:	c3                   	ret    
80104cea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104cf0:	31 c0                	xor    %eax,%eax
80104cf2:	eb ef                	jmp    80104ce3 <argfd.constprop.0+0x43>
80104cf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104cf8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104cfd:	eb e4                	jmp    80104ce3 <argfd.constprop.0+0x43>
80104cff:	90                   	nop

80104d00 <sys_dup>:
80104d00:	55                   	push   %ebp
80104d01:	31 c0                	xor    %eax,%eax
80104d03:	89 e5                	mov    %esp,%ebp
80104d05:	53                   	push   %ebx
80104d06:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104d09:	83 ec 14             	sub    $0x14,%esp
80104d0c:	e8 8f ff ff ff       	call   80104ca0 <argfd.constprop.0>
80104d11:	85 c0                	test   %eax,%eax
80104d13:	78 1b                	js     80104d30 <sys_dup+0x30>
80104d15:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104d18:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104d1e:	31 db                	xor    %ebx,%ebx
80104d20:	8b 4c 98 28          	mov    0x28(%eax,%ebx,4),%ecx
80104d24:	85 c9                	test   %ecx,%ecx
80104d26:	74 18                	je     80104d40 <sys_dup+0x40>
80104d28:	83 c3 01             	add    $0x1,%ebx
80104d2b:	83 fb 10             	cmp    $0x10,%ebx
80104d2e:	75 f0                	jne    80104d20 <sys_dup+0x20>
80104d30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104d38:	c9                   	leave  
80104d39:	c3                   	ret    
80104d3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104d40:	83 ec 0c             	sub    $0xc,%esp
80104d43:	89 54 98 28          	mov    %edx,0x28(%eax,%ebx,4)
80104d47:	52                   	push   %edx
80104d48:	e8 73 c0 ff ff       	call   80100dc0 <filedup>
80104d4d:	89 d8                	mov    %ebx,%eax
80104d4f:	83 c4 10             	add    $0x10,%esp
80104d52:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104d55:	c9                   	leave  
80104d56:	c3                   	ret    
80104d57:	89 f6                	mov    %esi,%esi
80104d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d60 <sys_read>:
80104d60:	55                   	push   %ebp
80104d61:	31 c0                	xor    %eax,%eax
80104d63:	89 e5                	mov    %esp,%ebp
80104d65:	83 ec 18             	sub    $0x18,%esp
80104d68:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104d6b:	e8 30 ff ff ff       	call   80104ca0 <argfd.constprop.0>
80104d70:	85 c0                	test   %eax,%eax
80104d72:	78 4c                	js     80104dc0 <sys_read+0x60>
80104d74:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104d77:	83 ec 08             	sub    $0x8,%esp
80104d7a:	50                   	push   %eax
80104d7b:	6a 02                	push   $0x2
80104d7d:	e8 fe fb ff ff       	call   80104980 <argint>
80104d82:	83 c4 10             	add    $0x10,%esp
80104d85:	85 c0                	test   %eax,%eax
80104d87:	78 37                	js     80104dc0 <sys_read+0x60>
80104d89:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d8c:	83 ec 04             	sub    $0x4,%esp
80104d8f:	ff 75 f0             	pushl  -0x10(%ebp)
80104d92:	50                   	push   %eax
80104d93:	6a 01                	push   $0x1
80104d95:	e8 26 fc ff ff       	call   801049c0 <argptr>
80104d9a:	83 c4 10             	add    $0x10,%esp
80104d9d:	85 c0                	test   %eax,%eax
80104d9f:	78 1f                	js     80104dc0 <sys_read+0x60>
80104da1:	83 ec 04             	sub    $0x4,%esp
80104da4:	ff 75 f0             	pushl  -0x10(%ebp)
80104da7:	ff 75 f4             	pushl  -0xc(%ebp)
80104daa:	ff 75 ec             	pushl  -0x14(%ebp)
80104dad:	e8 7e c1 ff ff       	call   80100f30 <fileread>
80104db2:	83 c4 10             	add    $0x10,%esp
80104db5:	c9                   	leave  
80104db6:	c3                   	ret    
80104db7:	89 f6                	mov    %esi,%esi
80104db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104dc0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104dc5:	c9                   	leave  
80104dc6:	c3                   	ret    
80104dc7:	89 f6                	mov    %esi,%esi
80104dc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104dd0 <sys_write>:
80104dd0:	55                   	push   %ebp
80104dd1:	31 c0                	xor    %eax,%eax
80104dd3:	89 e5                	mov    %esp,%ebp
80104dd5:	83 ec 18             	sub    $0x18,%esp
80104dd8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104ddb:	e8 c0 fe ff ff       	call   80104ca0 <argfd.constprop.0>
80104de0:	85 c0                	test   %eax,%eax
80104de2:	78 4c                	js     80104e30 <sys_write+0x60>
80104de4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104de7:	83 ec 08             	sub    $0x8,%esp
80104dea:	50                   	push   %eax
80104deb:	6a 02                	push   $0x2
80104ded:	e8 8e fb ff ff       	call   80104980 <argint>
80104df2:	83 c4 10             	add    $0x10,%esp
80104df5:	85 c0                	test   %eax,%eax
80104df7:	78 37                	js     80104e30 <sys_write+0x60>
80104df9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104dfc:	83 ec 04             	sub    $0x4,%esp
80104dff:	ff 75 f0             	pushl  -0x10(%ebp)
80104e02:	50                   	push   %eax
80104e03:	6a 01                	push   $0x1
80104e05:	e8 b6 fb ff ff       	call   801049c0 <argptr>
80104e0a:	83 c4 10             	add    $0x10,%esp
80104e0d:	85 c0                	test   %eax,%eax
80104e0f:	78 1f                	js     80104e30 <sys_write+0x60>
80104e11:	83 ec 04             	sub    $0x4,%esp
80104e14:	ff 75 f0             	pushl  -0x10(%ebp)
80104e17:	ff 75 f4             	pushl  -0xc(%ebp)
80104e1a:	ff 75 ec             	pushl  -0x14(%ebp)
80104e1d:	e8 9e c1 ff ff       	call   80100fc0 <filewrite>
80104e22:	83 c4 10             	add    $0x10,%esp
80104e25:	c9                   	leave  
80104e26:	c3                   	ret    
80104e27:	89 f6                	mov    %esi,%esi
80104e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104e30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e35:	c9                   	leave  
80104e36:	c3                   	ret    
80104e37:	89 f6                	mov    %esi,%esi
80104e39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e40 <sys_close>:
80104e40:	55                   	push   %ebp
80104e41:	89 e5                	mov    %esp,%ebp
80104e43:	83 ec 18             	sub    $0x18,%esp
80104e46:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104e49:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104e4c:	e8 4f fe ff ff       	call   80104ca0 <argfd.constprop.0>
80104e51:	85 c0                	test   %eax,%eax
80104e53:	78 2b                	js     80104e80 <sys_close+0x40>
80104e55:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104e58:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104e5e:	83 ec 0c             	sub    $0xc,%esp
80104e61:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104e68:	00 
80104e69:	ff 75 f4             	pushl  -0xc(%ebp)
80104e6c:	e8 9f bf ff ff       	call   80100e10 <fileclose>
80104e71:	83 c4 10             	add    $0x10,%esp
80104e74:	31 c0                	xor    %eax,%eax
80104e76:	c9                   	leave  
80104e77:	c3                   	ret    
80104e78:	90                   	nop
80104e79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104e80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e85:	c9                   	leave  
80104e86:	c3                   	ret    
80104e87:	89 f6                	mov    %esi,%esi
80104e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e90 <sys_fstat>:
80104e90:	55                   	push   %ebp
80104e91:	31 c0                	xor    %eax,%eax
80104e93:	89 e5                	mov    %esp,%ebp
80104e95:	83 ec 18             	sub    $0x18,%esp
80104e98:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104e9b:	e8 00 fe ff ff       	call   80104ca0 <argfd.constprop.0>
80104ea0:	85 c0                	test   %eax,%eax
80104ea2:	78 2c                	js     80104ed0 <sys_fstat+0x40>
80104ea4:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104ea7:	83 ec 04             	sub    $0x4,%esp
80104eaa:	6a 14                	push   $0x14
80104eac:	50                   	push   %eax
80104ead:	6a 01                	push   $0x1
80104eaf:	e8 0c fb ff ff       	call   801049c0 <argptr>
80104eb4:	83 c4 10             	add    $0x10,%esp
80104eb7:	85 c0                	test   %eax,%eax
80104eb9:	78 15                	js     80104ed0 <sys_fstat+0x40>
80104ebb:	83 ec 08             	sub    $0x8,%esp
80104ebe:	ff 75 f4             	pushl  -0xc(%ebp)
80104ec1:	ff 75 f0             	pushl  -0x10(%ebp)
80104ec4:	e8 17 c0 ff ff       	call   80100ee0 <filestat>
80104ec9:	83 c4 10             	add    $0x10,%esp
80104ecc:	c9                   	leave  
80104ecd:	c3                   	ret    
80104ece:	66 90                	xchg   %ax,%ax
80104ed0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ed5:	c9                   	leave  
80104ed6:	c3                   	ret    
80104ed7:	89 f6                	mov    %esi,%esi
80104ed9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ee0 <sys_link>:
80104ee0:	55                   	push   %ebp
80104ee1:	89 e5                	mov    %esp,%ebp
80104ee3:	57                   	push   %edi
80104ee4:	56                   	push   %esi
80104ee5:	53                   	push   %ebx
80104ee6:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104ee9:	83 ec 34             	sub    $0x34,%esp
80104eec:	50                   	push   %eax
80104eed:	6a 00                	push   $0x0
80104eef:	e8 1c fb ff ff       	call   80104a10 <argstr>
80104ef4:	83 c4 10             	add    $0x10,%esp
80104ef7:	85 c0                	test   %eax,%eax
80104ef9:	0f 88 fb 00 00 00    	js     80104ffa <sys_link+0x11a>
80104eff:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104f02:	83 ec 08             	sub    $0x8,%esp
80104f05:	50                   	push   %eax
80104f06:	6a 01                	push   $0x1
80104f08:	e8 03 fb ff ff       	call   80104a10 <argstr>
80104f0d:	83 c4 10             	add    $0x10,%esp
80104f10:	85 c0                	test   %eax,%eax
80104f12:	0f 88 e2 00 00 00    	js     80104ffa <sys_link+0x11a>
80104f18:	e8 63 dc ff ff       	call   80102b80 <begin_op>
80104f1d:	83 ec 0c             	sub    $0xc,%esp
80104f20:	ff 75 d4             	pushl  -0x2c(%ebp)
80104f23:	e8 58 cf ff ff       	call   80101e80 <namei>
80104f28:	83 c4 10             	add    $0x10,%esp
80104f2b:	85 c0                	test   %eax,%eax
80104f2d:	89 c3                	mov    %eax,%ebx
80104f2f:	0f 84 f3 00 00 00    	je     80105028 <sys_link+0x148>
80104f35:	83 ec 0c             	sub    $0xc,%esp
80104f38:	50                   	push   %eax
80104f39:	e8 12 c7 ff ff       	call   80101650 <ilock>
80104f3e:	83 c4 10             	add    $0x10,%esp
80104f41:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f46:	0f 84 c4 00 00 00    	je     80105010 <sys_link+0x130>
80104f4c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104f51:	83 ec 0c             	sub    $0xc,%esp
80104f54:	8d 7d da             	lea    -0x26(%ebp),%edi
80104f57:	53                   	push   %ebx
80104f58:	e8 43 c6 ff ff       	call   801015a0 <iupdate>
80104f5d:	89 1c 24             	mov    %ebx,(%esp)
80104f60:	e8 cb c7 ff ff       	call   80101730 <iunlock>
80104f65:	58                   	pop    %eax
80104f66:	5a                   	pop    %edx
80104f67:	57                   	push   %edi
80104f68:	ff 75 d0             	pushl  -0x30(%ebp)
80104f6b:	e8 30 cf ff ff       	call   80101ea0 <nameiparent>
80104f70:	83 c4 10             	add    $0x10,%esp
80104f73:	85 c0                	test   %eax,%eax
80104f75:	89 c6                	mov    %eax,%esi
80104f77:	74 5b                	je     80104fd4 <sys_link+0xf4>
80104f79:	83 ec 0c             	sub    $0xc,%esp
80104f7c:	50                   	push   %eax
80104f7d:	e8 ce c6 ff ff       	call   80101650 <ilock>
80104f82:	83 c4 10             	add    $0x10,%esp
80104f85:	8b 03                	mov    (%ebx),%eax
80104f87:	39 06                	cmp    %eax,(%esi)
80104f89:	75 3d                	jne    80104fc8 <sys_link+0xe8>
80104f8b:	83 ec 04             	sub    $0x4,%esp
80104f8e:	ff 73 04             	pushl  0x4(%ebx)
80104f91:	57                   	push   %edi
80104f92:	56                   	push   %esi
80104f93:	e8 28 ce ff ff       	call   80101dc0 <dirlink>
80104f98:	83 c4 10             	add    $0x10,%esp
80104f9b:	85 c0                	test   %eax,%eax
80104f9d:	78 29                	js     80104fc8 <sys_link+0xe8>
80104f9f:	83 ec 0c             	sub    $0xc,%esp
80104fa2:	56                   	push   %esi
80104fa3:	e8 18 c9 ff ff       	call   801018c0 <iunlockput>
80104fa8:	89 1c 24             	mov    %ebx,(%esp)
80104fab:	e8 d0 c7 ff ff       	call   80101780 <iput>
80104fb0:	e8 3b dc ff ff       	call   80102bf0 <end_op>
80104fb5:	83 c4 10             	add    $0x10,%esp
80104fb8:	31 c0                	xor    %eax,%eax
80104fba:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104fbd:	5b                   	pop    %ebx
80104fbe:	5e                   	pop    %esi
80104fbf:	5f                   	pop    %edi
80104fc0:	5d                   	pop    %ebp
80104fc1:	c3                   	ret    
80104fc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104fc8:	83 ec 0c             	sub    $0xc,%esp
80104fcb:	56                   	push   %esi
80104fcc:	e8 ef c8 ff ff       	call   801018c0 <iunlockput>
80104fd1:	83 c4 10             	add    $0x10,%esp
80104fd4:	83 ec 0c             	sub    $0xc,%esp
80104fd7:	53                   	push   %ebx
80104fd8:	e8 73 c6 ff ff       	call   80101650 <ilock>
80104fdd:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80104fe2:	89 1c 24             	mov    %ebx,(%esp)
80104fe5:	e8 b6 c5 ff ff       	call   801015a0 <iupdate>
80104fea:	89 1c 24             	mov    %ebx,(%esp)
80104fed:	e8 ce c8 ff ff       	call   801018c0 <iunlockput>
80104ff2:	e8 f9 db ff ff       	call   80102bf0 <end_op>
80104ff7:	83 c4 10             	add    $0x10,%esp
80104ffa:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ffd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105002:	5b                   	pop    %ebx
80105003:	5e                   	pop    %esi
80105004:	5f                   	pop    %edi
80105005:	5d                   	pop    %ebp
80105006:	c3                   	ret    
80105007:	89 f6                	mov    %esi,%esi
80105009:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105010:	83 ec 0c             	sub    $0xc,%esp
80105013:	53                   	push   %ebx
80105014:	e8 a7 c8 ff ff       	call   801018c0 <iunlockput>
80105019:	e8 d2 db ff ff       	call   80102bf0 <end_op>
8010501e:	83 c4 10             	add    $0x10,%esp
80105021:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105026:	eb 92                	jmp    80104fba <sys_link+0xda>
80105028:	e8 c3 db ff ff       	call   80102bf0 <end_op>
8010502d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105032:	eb 86                	jmp    80104fba <sys_link+0xda>
80105034:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010503a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105040 <sys_unlink>:
80105040:	55                   	push   %ebp
80105041:	89 e5                	mov    %esp,%ebp
80105043:	57                   	push   %edi
80105044:	56                   	push   %esi
80105045:	53                   	push   %ebx
80105046:	8d 45 c0             	lea    -0x40(%ebp),%eax
80105049:	83 ec 54             	sub    $0x54,%esp
8010504c:	50                   	push   %eax
8010504d:	6a 00                	push   $0x0
8010504f:	e8 bc f9 ff ff       	call   80104a10 <argstr>
80105054:	83 c4 10             	add    $0x10,%esp
80105057:	85 c0                	test   %eax,%eax
80105059:	0f 88 82 01 00 00    	js     801051e1 <sys_unlink+0x1a1>
8010505f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80105062:	e8 19 db ff ff       	call   80102b80 <begin_op>
80105067:	83 ec 08             	sub    $0x8,%esp
8010506a:	53                   	push   %ebx
8010506b:	ff 75 c0             	pushl  -0x40(%ebp)
8010506e:	e8 2d ce ff ff       	call   80101ea0 <nameiparent>
80105073:	83 c4 10             	add    $0x10,%esp
80105076:	85 c0                	test   %eax,%eax
80105078:	89 45 b4             	mov    %eax,-0x4c(%ebp)
8010507b:	0f 84 6a 01 00 00    	je     801051eb <sys_unlink+0x1ab>
80105081:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80105084:	83 ec 0c             	sub    $0xc,%esp
80105087:	56                   	push   %esi
80105088:	e8 c3 c5 ff ff       	call   80101650 <ilock>
8010508d:	58                   	pop    %eax
8010508e:	5a                   	pop    %edx
8010508f:	68 7c 79 10 80       	push   $0x8010797c
80105094:	53                   	push   %ebx
80105095:	e8 a6 ca ff ff       	call   80101b40 <namecmp>
8010509a:	83 c4 10             	add    $0x10,%esp
8010509d:	85 c0                	test   %eax,%eax
8010509f:	0f 84 fc 00 00 00    	je     801051a1 <sys_unlink+0x161>
801050a5:	83 ec 08             	sub    $0x8,%esp
801050a8:	68 7b 79 10 80       	push   $0x8010797b
801050ad:	53                   	push   %ebx
801050ae:	e8 8d ca ff ff       	call   80101b40 <namecmp>
801050b3:	83 c4 10             	add    $0x10,%esp
801050b6:	85 c0                	test   %eax,%eax
801050b8:	0f 84 e3 00 00 00    	je     801051a1 <sys_unlink+0x161>
801050be:	8d 45 c4             	lea    -0x3c(%ebp),%eax
801050c1:	83 ec 04             	sub    $0x4,%esp
801050c4:	50                   	push   %eax
801050c5:	53                   	push   %ebx
801050c6:	56                   	push   %esi
801050c7:	e8 94 ca ff ff       	call   80101b60 <dirlookup>
801050cc:	83 c4 10             	add    $0x10,%esp
801050cf:	85 c0                	test   %eax,%eax
801050d1:	89 c3                	mov    %eax,%ebx
801050d3:	0f 84 c8 00 00 00    	je     801051a1 <sys_unlink+0x161>
801050d9:	83 ec 0c             	sub    $0xc,%esp
801050dc:	50                   	push   %eax
801050dd:	e8 6e c5 ff ff       	call   80101650 <ilock>
801050e2:	83 c4 10             	add    $0x10,%esp
801050e5:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801050ea:	0f 8e 24 01 00 00    	jle    80105214 <sys_unlink+0x1d4>
801050f0:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801050f5:	8d 75 d8             	lea    -0x28(%ebp),%esi
801050f8:	74 66                	je     80105160 <sys_unlink+0x120>
801050fa:	83 ec 04             	sub    $0x4,%esp
801050fd:	6a 10                	push   $0x10
801050ff:	6a 00                	push   $0x0
80105101:	56                   	push   %esi
80105102:	e8 89 f5 ff ff       	call   80104690 <memset>
80105107:	6a 10                	push   $0x10
80105109:	ff 75 c4             	pushl  -0x3c(%ebp)
8010510c:	56                   	push   %esi
8010510d:	ff 75 b4             	pushl  -0x4c(%ebp)
80105110:	e8 fb c8 ff ff       	call   80101a10 <writei>
80105115:	83 c4 20             	add    $0x20,%esp
80105118:	83 f8 10             	cmp    $0x10,%eax
8010511b:	0f 85 e6 00 00 00    	jne    80105207 <sys_unlink+0x1c7>
80105121:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105126:	0f 84 9c 00 00 00    	je     801051c8 <sys_unlink+0x188>
8010512c:	83 ec 0c             	sub    $0xc,%esp
8010512f:	ff 75 b4             	pushl  -0x4c(%ebp)
80105132:	e8 89 c7 ff ff       	call   801018c0 <iunlockput>
80105137:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
8010513c:	89 1c 24             	mov    %ebx,(%esp)
8010513f:	e8 5c c4 ff ff       	call   801015a0 <iupdate>
80105144:	89 1c 24             	mov    %ebx,(%esp)
80105147:	e8 74 c7 ff ff       	call   801018c0 <iunlockput>
8010514c:	e8 9f da ff ff       	call   80102bf0 <end_op>
80105151:	83 c4 10             	add    $0x10,%esp
80105154:	31 c0                	xor    %eax,%eax
80105156:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105159:	5b                   	pop    %ebx
8010515a:	5e                   	pop    %esi
8010515b:	5f                   	pop    %edi
8010515c:	5d                   	pop    %ebp
8010515d:	c3                   	ret    
8010515e:	66 90                	xchg   %ax,%ax
80105160:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80105164:	76 94                	jbe    801050fa <sys_unlink+0xba>
80105166:	bf 20 00 00 00       	mov    $0x20,%edi
8010516b:	eb 0f                	jmp    8010517c <sys_unlink+0x13c>
8010516d:	8d 76 00             	lea    0x0(%esi),%esi
80105170:	83 c7 10             	add    $0x10,%edi
80105173:	3b 7b 58             	cmp    0x58(%ebx),%edi
80105176:	0f 83 7e ff ff ff    	jae    801050fa <sys_unlink+0xba>
8010517c:	6a 10                	push   $0x10
8010517e:	57                   	push   %edi
8010517f:	56                   	push   %esi
80105180:	53                   	push   %ebx
80105181:	e8 8a c7 ff ff       	call   80101910 <readi>
80105186:	83 c4 10             	add    $0x10,%esp
80105189:	83 f8 10             	cmp    $0x10,%eax
8010518c:	75 6c                	jne    801051fa <sys_unlink+0x1ba>
8010518e:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105193:	74 db                	je     80105170 <sys_unlink+0x130>
80105195:	83 ec 0c             	sub    $0xc,%esp
80105198:	53                   	push   %ebx
80105199:	e8 22 c7 ff ff       	call   801018c0 <iunlockput>
8010519e:	83 c4 10             	add    $0x10,%esp
801051a1:	83 ec 0c             	sub    $0xc,%esp
801051a4:	ff 75 b4             	pushl  -0x4c(%ebp)
801051a7:	e8 14 c7 ff ff       	call   801018c0 <iunlockput>
801051ac:	e8 3f da ff ff       	call   80102bf0 <end_op>
801051b1:	83 c4 10             	add    $0x10,%esp
801051b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
801051b7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051bc:	5b                   	pop    %ebx
801051bd:	5e                   	pop    %esi
801051be:	5f                   	pop    %edi
801051bf:	5d                   	pop    %ebp
801051c0:	c3                   	ret    
801051c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801051c8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
801051cb:	83 ec 0c             	sub    $0xc,%esp
801051ce:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
801051d3:	50                   	push   %eax
801051d4:	e8 c7 c3 ff ff       	call   801015a0 <iupdate>
801051d9:	83 c4 10             	add    $0x10,%esp
801051dc:	e9 4b ff ff ff       	jmp    8010512c <sys_unlink+0xec>
801051e1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051e6:	e9 6b ff ff ff       	jmp    80105156 <sys_unlink+0x116>
801051eb:	e8 00 da ff ff       	call   80102bf0 <end_op>
801051f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051f5:	e9 5c ff ff ff       	jmp    80105156 <sys_unlink+0x116>
801051fa:	83 ec 0c             	sub    $0xc,%esp
801051fd:	68 a0 79 10 80       	push   $0x801079a0
80105202:	e8 69 b1 ff ff       	call   80100370 <panic>
80105207:	83 ec 0c             	sub    $0xc,%esp
8010520a:	68 b2 79 10 80       	push   $0x801079b2
8010520f:	e8 5c b1 ff ff       	call   80100370 <panic>
80105214:	83 ec 0c             	sub    $0xc,%esp
80105217:	68 8e 79 10 80       	push   $0x8010798e
8010521c:	e8 4f b1 ff ff       	call   80100370 <panic>
80105221:	eb 0d                	jmp    80105230 <sys_open>
80105223:	90                   	nop
80105224:	90                   	nop
80105225:	90                   	nop
80105226:	90                   	nop
80105227:	90                   	nop
80105228:	90                   	nop
80105229:	90                   	nop
8010522a:	90                   	nop
8010522b:	90                   	nop
8010522c:	90                   	nop
8010522d:	90                   	nop
8010522e:	90                   	nop
8010522f:	90                   	nop

80105230 <sys_open>:
80105230:	55                   	push   %ebp
80105231:	89 e5                	mov    %esp,%ebp
80105233:	57                   	push   %edi
80105234:	56                   	push   %esi
80105235:	53                   	push   %ebx
80105236:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105239:	83 ec 24             	sub    $0x24,%esp
8010523c:	50                   	push   %eax
8010523d:	6a 00                	push   $0x0
8010523f:	e8 cc f7 ff ff       	call   80104a10 <argstr>
80105244:	83 c4 10             	add    $0x10,%esp
80105247:	85 c0                	test   %eax,%eax
80105249:	0f 88 9e 00 00 00    	js     801052ed <sys_open+0xbd>
8010524f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105252:	83 ec 08             	sub    $0x8,%esp
80105255:	50                   	push   %eax
80105256:	6a 01                	push   $0x1
80105258:	e8 23 f7 ff ff       	call   80104980 <argint>
8010525d:	83 c4 10             	add    $0x10,%esp
80105260:	85 c0                	test   %eax,%eax
80105262:	0f 88 85 00 00 00    	js     801052ed <sys_open+0xbd>
80105268:	e8 13 d9 ff ff       	call   80102b80 <begin_op>
8010526d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105271:	0f 85 89 00 00 00    	jne    80105300 <sys_open+0xd0>
80105277:	83 ec 0c             	sub    $0xc,%esp
8010527a:	ff 75 e0             	pushl  -0x20(%ebp)
8010527d:	e8 fe cb ff ff       	call   80101e80 <namei>
80105282:	83 c4 10             	add    $0x10,%esp
80105285:	85 c0                	test   %eax,%eax
80105287:	89 c7                	mov    %eax,%edi
80105289:	0f 84 8e 00 00 00    	je     8010531d <sys_open+0xed>
8010528f:	83 ec 0c             	sub    $0xc,%esp
80105292:	50                   	push   %eax
80105293:	e8 b8 c3 ff ff       	call   80101650 <ilock>
80105298:	83 c4 10             	add    $0x10,%esp
8010529b:	66 83 7f 50 01       	cmpw   $0x1,0x50(%edi)
801052a0:	0f 84 d2 00 00 00    	je     80105378 <sys_open+0x148>
801052a6:	e8 a5 ba ff ff       	call   80100d50 <filealloc>
801052ab:	85 c0                	test   %eax,%eax
801052ad:	89 c6                	mov    %eax,%esi
801052af:	74 2b                	je     801052dc <sys_open+0xac>
801052b1:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801052b8:	31 db                	xor    %ebx,%ebx
801052ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801052c0:	8b 44 9a 28          	mov    0x28(%edx,%ebx,4),%eax
801052c4:	85 c0                	test   %eax,%eax
801052c6:	74 68                	je     80105330 <sys_open+0x100>
801052c8:	83 c3 01             	add    $0x1,%ebx
801052cb:	83 fb 10             	cmp    $0x10,%ebx
801052ce:	75 f0                	jne    801052c0 <sys_open+0x90>
801052d0:	83 ec 0c             	sub    $0xc,%esp
801052d3:	56                   	push   %esi
801052d4:	e8 37 bb ff ff       	call   80100e10 <fileclose>
801052d9:	83 c4 10             	add    $0x10,%esp
801052dc:	83 ec 0c             	sub    $0xc,%esp
801052df:	57                   	push   %edi
801052e0:	e8 db c5 ff ff       	call   801018c0 <iunlockput>
801052e5:	e8 06 d9 ff ff       	call   80102bf0 <end_op>
801052ea:	83 c4 10             	add    $0x10,%esp
801052ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
801052f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801052f5:	5b                   	pop    %ebx
801052f6:	5e                   	pop    %esi
801052f7:	5f                   	pop    %edi
801052f8:	5d                   	pop    %ebp
801052f9:	c3                   	ret    
801052fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105300:	83 ec 0c             	sub    $0xc,%esp
80105303:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105306:	31 c9                	xor    %ecx,%ecx
80105308:	6a 00                	push   $0x0
8010530a:	ba 02 00 00 00       	mov    $0x2,%edx
8010530f:	e8 ec f7 ff ff       	call   80104b00 <create>
80105314:	83 c4 10             	add    $0x10,%esp
80105317:	85 c0                	test   %eax,%eax
80105319:	89 c7                	mov    %eax,%edi
8010531b:	75 89                	jne    801052a6 <sys_open+0x76>
8010531d:	e8 ce d8 ff ff       	call   80102bf0 <end_op>
80105322:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105327:	eb 43                	jmp    8010536c <sys_open+0x13c>
80105329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105330:	83 ec 0c             	sub    $0xc,%esp
80105333:	89 74 9a 28          	mov    %esi,0x28(%edx,%ebx,4)
80105337:	57                   	push   %edi
80105338:	e8 f3 c3 ff ff       	call   80101730 <iunlock>
8010533d:	e8 ae d8 ff ff       	call   80102bf0 <end_op>
80105342:	c7 06 02 00 00 00    	movl   $0x2,(%esi)
80105348:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010534b:	83 c4 10             	add    $0x10,%esp
8010534e:	89 7e 10             	mov    %edi,0x10(%esi)
80105351:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
80105358:	89 d0                	mov    %edx,%eax
8010535a:	83 e0 01             	and    $0x1,%eax
8010535d:	83 f0 01             	xor    $0x1,%eax
80105360:	83 e2 03             	and    $0x3,%edx
80105363:	88 46 08             	mov    %al,0x8(%esi)
80105366:	0f 95 46 09          	setne  0x9(%esi)
8010536a:	89 d8                	mov    %ebx,%eax
8010536c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010536f:	5b                   	pop    %ebx
80105370:	5e                   	pop    %esi
80105371:	5f                   	pop    %edi
80105372:	5d                   	pop    %ebp
80105373:	c3                   	ret    
80105374:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105378:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010537b:	85 d2                	test   %edx,%edx
8010537d:	0f 84 23 ff ff ff    	je     801052a6 <sys_open+0x76>
80105383:	e9 54 ff ff ff       	jmp    801052dc <sys_open+0xac>
80105388:	90                   	nop
80105389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105390 <sys_mkdir>:
80105390:	55                   	push   %ebp
80105391:	89 e5                	mov    %esp,%ebp
80105393:	83 ec 18             	sub    $0x18,%esp
80105396:	e8 e5 d7 ff ff       	call   80102b80 <begin_op>
8010539b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010539e:	83 ec 08             	sub    $0x8,%esp
801053a1:	50                   	push   %eax
801053a2:	6a 00                	push   $0x0
801053a4:	e8 67 f6 ff ff       	call   80104a10 <argstr>
801053a9:	83 c4 10             	add    $0x10,%esp
801053ac:	85 c0                	test   %eax,%eax
801053ae:	78 30                	js     801053e0 <sys_mkdir+0x50>
801053b0:	83 ec 0c             	sub    $0xc,%esp
801053b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801053b6:	31 c9                	xor    %ecx,%ecx
801053b8:	6a 00                	push   $0x0
801053ba:	ba 01 00 00 00       	mov    $0x1,%edx
801053bf:	e8 3c f7 ff ff       	call   80104b00 <create>
801053c4:	83 c4 10             	add    $0x10,%esp
801053c7:	85 c0                	test   %eax,%eax
801053c9:	74 15                	je     801053e0 <sys_mkdir+0x50>
801053cb:	83 ec 0c             	sub    $0xc,%esp
801053ce:	50                   	push   %eax
801053cf:	e8 ec c4 ff ff       	call   801018c0 <iunlockput>
801053d4:	e8 17 d8 ff ff       	call   80102bf0 <end_op>
801053d9:	83 c4 10             	add    $0x10,%esp
801053dc:	31 c0                	xor    %eax,%eax
801053de:	c9                   	leave  
801053df:	c3                   	ret    
801053e0:	e8 0b d8 ff ff       	call   80102bf0 <end_op>
801053e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053ea:	c9                   	leave  
801053eb:	c3                   	ret    
801053ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801053f0 <sys_mknod>:
801053f0:	55                   	push   %ebp
801053f1:	89 e5                	mov    %esp,%ebp
801053f3:	83 ec 18             	sub    $0x18,%esp
801053f6:	e8 85 d7 ff ff       	call   80102b80 <begin_op>
801053fb:	8d 45 ec             	lea    -0x14(%ebp),%eax
801053fe:	83 ec 08             	sub    $0x8,%esp
80105401:	50                   	push   %eax
80105402:	6a 00                	push   $0x0
80105404:	e8 07 f6 ff ff       	call   80104a10 <argstr>
80105409:	83 c4 10             	add    $0x10,%esp
8010540c:	85 c0                	test   %eax,%eax
8010540e:	78 60                	js     80105470 <sys_mknod+0x80>
80105410:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105413:	83 ec 08             	sub    $0x8,%esp
80105416:	50                   	push   %eax
80105417:	6a 01                	push   $0x1
80105419:	e8 62 f5 ff ff       	call   80104980 <argint>
8010541e:	83 c4 10             	add    $0x10,%esp
80105421:	85 c0                	test   %eax,%eax
80105423:	78 4b                	js     80105470 <sys_mknod+0x80>
80105425:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105428:	83 ec 08             	sub    $0x8,%esp
8010542b:	50                   	push   %eax
8010542c:	6a 02                	push   $0x2
8010542e:	e8 4d f5 ff ff       	call   80104980 <argint>
80105433:	83 c4 10             	add    $0x10,%esp
80105436:	85 c0                	test   %eax,%eax
80105438:	78 36                	js     80105470 <sys_mknod+0x80>
8010543a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
8010543e:	83 ec 0c             	sub    $0xc,%esp
80105441:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80105445:	ba 03 00 00 00       	mov    $0x3,%edx
8010544a:	50                   	push   %eax
8010544b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010544e:	e8 ad f6 ff ff       	call   80104b00 <create>
80105453:	83 c4 10             	add    $0x10,%esp
80105456:	85 c0                	test   %eax,%eax
80105458:	74 16                	je     80105470 <sys_mknod+0x80>
8010545a:	83 ec 0c             	sub    $0xc,%esp
8010545d:	50                   	push   %eax
8010545e:	e8 5d c4 ff ff       	call   801018c0 <iunlockput>
80105463:	e8 88 d7 ff ff       	call   80102bf0 <end_op>
80105468:	83 c4 10             	add    $0x10,%esp
8010546b:	31 c0                	xor    %eax,%eax
8010546d:	c9                   	leave  
8010546e:	c3                   	ret    
8010546f:	90                   	nop
80105470:	e8 7b d7 ff ff       	call   80102bf0 <end_op>
80105475:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010547a:	c9                   	leave  
8010547b:	c3                   	ret    
8010547c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105480 <sys_chdir>:
80105480:	55                   	push   %ebp
80105481:	89 e5                	mov    %esp,%ebp
80105483:	53                   	push   %ebx
80105484:	83 ec 14             	sub    $0x14,%esp
80105487:	e8 f4 d6 ff ff       	call   80102b80 <begin_op>
8010548c:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010548f:	83 ec 08             	sub    $0x8,%esp
80105492:	50                   	push   %eax
80105493:	6a 00                	push   $0x0
80105495:	e8 76 f5 ff ff       	call   80104a10 <argstr>
8010549a:	83 c4 10             	add    $0x10,%esp
8010549d:	85 c0                	test   %eax,%eax
8010549f:	78 7f                	js     80105520 <sys_chdir+0xa0>
801054a1:	83 ec 0c             	sub    $0xc,%esp
801054a4:	ff 75 f4             	pushl  -0xc(%ebp)
801054a7:	e8 d4 c9 ff ff       	call   80101e80 <namei>
801054ac:	83 c4 10             	add    $0x10,%esp
801054af:	85 c0                	test   %eax,%eax
801054b1:	89 c3                	mov    %eax,%ebx
801054b3:	74 6b                	je     80105520 <sys_chdir+0xa0>
801054b5:	83 ec 0c             	sub    $0xc,%esp
801054b8:	50                   	push   %eax
801054b9:	e8 92 c1 ff ff       	call   80101650 <ilock>
801054be:	83 c4 10             	add    $0x10,%esp
801054c1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801054c6:	75 38                	jne    80105500 <sys_chdir+0x80>
801054c8:	83 ec 0c             	sub    $0xc,%esp
801054cb:	53                   	push   %ebx
801054cc:	e8 5f c2 ff ff       	call   80101730 <iunlock>
801054d1:	58                   	pop    %eax
801054d2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801054d8:	ff 70 68             	pushl  0x68(%eax)
801054db:	e8 a0 c2 ff ff       	call   80101780 <iput>
801054e0:	e8 0b d7 ff ff       	call   80102bf0 <end_op>
801054e5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801054eb:	83 c4 10             	add    $0x10,%esp
801054ee:	89 58 68             	mov    %ebx,0x68(%eax)
801054f1:	31 c0                	xor    %eax,%eax
801054f3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801054f6:	c9                   	leave  
801054f7:	c3                   	ret    
801054f8:	90                   	nop
801054f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105500:	83 ec 0c             	sub    $0xc,%esp
80105503:	53                   	push   %ebx
80105504:	e8 b7 c3 ff ff       	call   801018c0 <iunlockput>
80105509:	e8 e2 d6 ff ff       	call   80102bf0 <end_op>
8010550e:	83 c4 10             	add    $0x10,%esp
80105511:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105516:	eb db                	jmp    801054f3 <sys_chdir+0x73>
80105518:	90                   	nop
80105519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105520:	e8 cb d6 ff ff       	call   80102bf0 <end_op>
80105525:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010552a:	eb c7                	jmp    801054f3 <sys_chdir+0x73>
8010552c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105530 <sys_exec>:
80105530:	55                   	push   %ebp
80105531:	89 e5                	mov    %esp,%ebp
80105533:	57                   	push   %edi
80105534:	56                   	push   %esi
80105535:	53                   	push   %ebx
80105536:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
8010553c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
80105542:	50                   	push   %eax
80105543:	6a 00                	push   $0x0
80105545:	e8 c6 f4 ff ff       	call   80104a10 <argstr>
8010554a:	83 c4 10             	add    $0x10,%esp
8010554d:	85 c0                	test   %eax,%eax
8010554f:	78 7f                	js     801055d0 <sys_exec+0xa0>
80105551:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80105557:	83 ec 08             	sub    $0x8,%esp
8010555a:	50                   	push   %eax
8010555b:	6a 01                	push   $0x1
8010555d:	e8 1e f4 ff ff       	call   80104980 <argint>
80105562:	83 c4 10             	add    $0x10,%esp
80105565:	85 c0                	test   %eax,%eax
80105567:	78 67                	js     801055d0 <sys_exec+0xa0>
80105569:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
8010556f:	83 ec 04             	sub    $0x4,%esp
80105572:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
80105578:	68 80 00 00 00       	push   $0x80
8010557d:	6a 00                	push   $0x0
8010557f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105585:	50                   	push   %eax
80105586:	31 db                	xor    %ebx,%ebx
80105588:	e8 03 f1 ff ff       	call   80104690 <memset>
8010558d:	83 c4 10             	add    $0x10,%esp
80105590:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105596:	83 ec 08             	sub    $0x8,%esp
80105599:	57                   	push   %edi
8010559a:	8d 04 98             	lea    (%eax,%ebx,4),%eax
8010559d:	50                   	push   %eax
8010559e:	e8 5d f3 ff ff       	call   80104900 <fetchint>
801055a3:	83 c4 10             	add    $0x10,%esp
801055a6:	85 c0                	test   %eax,%eax
801055a8:	78 26                	js     801055d0 <sys_exec+0xa0>
801055aa:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
801055b0:	85 c0                	test   %eax,%eax
801055b2:	74 2c                	je     801055e0 <sys_exec+0xb0>
801055b4:	83 ec 08             	sub    $0x8,%esp
801055b7:	56                   	push   %esi
801055b8:	50                   	push   %eax
801055b9:	e8 72 f3 ff ff       	call   80104930 <fetchstr>
801055be:	83 c4 10             	add    $0x10,%esp
801055c1:	85 c0                	test   %eax,%eax
801055c3:	78 0b                	js     801055d0 <sys_exec+0xa0>
801055c5:	83 c3 01             	add    $0x1,%ebx
801055c8:	83 c6 04             	add    $0x4,%esi
801055cb:	83 fb 20             	cmp    $0x20,%ebx
801055ce:	75 c0                	jne    80105590 <sys_exec+0x60>
801055d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801055d3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055d8:	5b                   	pop    %ebx
801055d9:	5e                   	pop    %esi
801055da:	5f                   	pop    %edi
801055db:	5d                   	pop    %ebp
801055dc:	c3                   	ret    
801055dd:	8d 76 00             	lea    0x0(%esi),%esi
801055e0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801055e6:	83 ec 08             	sub    $0x8,%esp
801055e9:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
801055f0:	00 00 00 00 
801055f4:	50                   	push   %eax
801055f5:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
801055fb:	e8 f0 b3 ff ff       	call   801009f0 <exec>
80105600:	83 c4 10             	add    $0x10,%esp
80105603:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105606:	5b                   	pop    %ebx
80105607:	5e                   	pop    %esi
80105608:	5f                   	pop    %edi
80105609:	5d                   	pop    %ebp
8010560a:	c3                   	ret    
8010560b:	90                   	nop
8010560c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105610 <sys_pipe>:
80105610:	55                   	push   %ebp
80105611:	89 e5                	mov    %esp,%ebp
80105613:	57                   	push   %edi
80105614:	56                   	push   %esi
80105615:	53                   	push   %ebx
80105616:	8d 45 dc             	lea    -0x24(%ebp),%eax
80105619:	83 ec 20             	sub    $0x20,%esp
8010561c:	6a 08                	push   $0x8
8010561e:	50                   	push   %eax
8010561f:	6a 00                	push   $0x0
80105621:	e8 9a f3 ff ff       	call   801049c0 <argptr>
80105626:	83 c4 10             	add    $0x10,%esp
80105629:	85 c0                	test   %eax,%eax
8010562b:	78 48                	js     80105675 <sys_pipe+0x65>
8010562d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105630:	83 ec 08             	sub    $0x8,%esp
80105633:	50                   	push   %eax
80105634:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105637:	50                   	push   %eax
80105638:	e8 e3 dc ff ff       	call   80103320 <pipealloc>
8010563d:	83 c4 10             	add    $0x10,%esp
80105640:	85 c0                	test   %eax,%eax
80105642:	78 31                	js     80105675 <sys_pipe+0x65>
80105644:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80105647:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
8010564e:	31 c0                	xor    %eax,%eax
80105650:	8b 54 81 28          	mov    0x28(%ecx,%eax,4),%edx
80105654:	85 d2                	test   %edx,%edx
80105656:	74 28                	je     80105680 <sys_pipe+0x70>
80105658:	83 c0 01             	add    $0x1,%eax
8010565b:	83 f8 10             	cmp    $0x10,%eax
8010565e:	75 f0                	jne    80105650 <sys_pipe+0x40>
80105660:	83 ec 0c             	sub    $0xc,%esp
80105663:	53                   	push   %ebx
80105664:	e8 a7 b7 ff ff       	call   80100e10 <fileclose>
80105669:	58                   	pop    %eax
8010566a:	ff 75 e4             	pushl  -0x1c(%ebp)
8010566d:	e8 9e b7 ff ff       	call   80100e10 <fileclose>
80105672:	83 c4 10             	add    $0x10,%esp
80105675:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010567a:	eb 45                	jmp    801056c1 <sys_pipe+0xb1>
8010567c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105680:	8d 34 81             	lea    (%ecx,%eax,4),%esi
80105683:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80105686:	31 d2                	xor    %edx,%edx
80105688:	89 5e 28             	mov    %ebx,0x28(%esi)
8010568b:	90                   	nop
8010568c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105690:	83 7c 91 28 00       	cmpl   $0x0,0x28(%ecx,%edx,4)
80105695:	74 19                	je     801056b0 <sys_pipe+0xa0>
80105697:	83 c2 01             	add    $0x1,%edx
8010569a:	83 fa 10             	cmp    $0x10,%edx
8010569d:	75 f1                	jne    80105690 <sys_pipe+0x80>
8010569f:	c7 46 28 00 00 00 00 	movl   $0x0,0x28(%esi)
801056a6:	eb b8                	jmp    80105660 <sys_pipe+0x50>
801056a8:	90                   	nop
801056a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801056b0:	89 7c 91 28          	mov    %edi,0x28(%ecx,%edx,4)
801056b4:	8b 4d dc             	mov    -0x24(%ebp),%ecx
801056b7:	89 01                	mov    %eax,(%ecx)
801056b9:	8b 45 dc             	mov    -0x24(%ebp),%eax
801056bc:	89 50 04             	mov    %edx,0x4(%eax)
801056bf:	31 c0                	xor    %eax,%eax
801056c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801056c4:	5b                   	pop    %ebx
801056c5:	5e                   	pop    %esi
801056c6:	5f                   	pop    %edi
801056c7:	5d                   	pop    %ebp
801056c8:	c3                   	ret    
801056c9:	66 90                	xchg   %ax,%ax
801056cb:	66 90                	xchg   %ax,%ax
801056cd:	66 90                	xchg   %ax,%ax
801056cf:	90                   	nop

801056d0 <sys_fork>:
801056d0:	55                   	push   %ebp
801056d1:	89 e5                	mov    %esp,%ebp
801056d3:	5d                   	pop    %ebp
801056d4:	e9 c7 e2 ff ff       	jmp    801039a0 <fork>
801056d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801056e0 <sys_exit>:
801056e0:	55                   	push   %ebp
801056e1:	89 e5                	mov    %esp,%ebp
801056e3:	83 ec 08             	sub    $0x8,%esp
801056e6:	e8 05 e6 ff ff       	call   80103cf0 <exit>
801056eb:	31 c0                	xor    %eax,%eax
801056ed:	c9                   	leave  
801056ee:	c3                   	ret    
801056ef:	90                   	nop

801056f0 <sys_wait>:
801056f0:	55                   	push   %ebp
801056f1:	89 e5                	mov    %esp,%ebp
801056f3:	5d                   	pop    %ebp
801056f4:	e9 47 e8 ff ff       	jmp    80103f40 <wait>
801056f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105700 <sys_kill>:
80105700:	55                   	push   %ebp
80105701:	89 e5                	mov    %esp,%ebp
80105703:	83 ec 20             	sub    $0x20,%esp
80105706:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105709:	50                   	push   %eax
8010570a:	6a 00                	push   $0x0
8010570c:	e8 6f f2 ff ff       	call   80104980 <argint>
80105711:	83 c4 10             	add    $0x10,%esp
80105714:	85 c0                	test   %eax,%eax
80105716:	78 18                	js     80105730 <sys_kill+0x30>
80105718:	83 ec 0c             	sub    $0xc,%esp
8010571b:	ff 75 f4             	pushl  -0xc(%ebp)
8010571e:	e8 5d e9 ff ff       	call   80104080 <kill>
80105723:	83 c4 10             	add    $0x10,%esp
80105726:	c9                   	leave  
80105727:	c3                   	ret    
80105728:	90                   	nop
80105729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105730:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105735:	c9                   	leave  
80105736:	c3                   	ret    
80105737:	89 f6                	mov    %esi,%esi
80105739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105740 <sys_getpid>:
80105740:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105746:	55                   	push   %ebp
80105747:	89 e5                	mov    %esp,%ebp
80105749:	8b 40 10             	mov    0x10(%eax),%eax
8010574c:	5d                   	pop    %ebp
8010574d:	c3                   	ret    
8010574e:	66 90                	xchg   %ax,%ax

80105750 <sys_sbrk>:
80105750:	55                   	push   %ebp
80105751:	89 e5                	mov    %esp,%ebp
80105753:	53                   	push   %ebx
80105754:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105757:	83 ec 1c             	sub    $0x1c,%esp
8010575a:	50                   	push   %eax
8010575b:	6a 00                	push   $0x0
8010575d:	e8 1e f2 ff ff       	call   80104980 <argint>
80105762:	83 c4 10             	add    $0x10,%esp
80105765:	85 c0                	test   %eax,%eax
80105767:	78 27                	js     80105790 <sys_sbrk+0x40>
80105769:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010576f:	83 ec 0c             	sub    $0xc,%esp
80105772:	8b 18                	mov    (%eax),%ebx
80105774:	ff 75 f4             	pushl  -0xc(%ebp)
80105777:	e8 b4 e1 ff ff       	call   80103930 <growproc>
8010577c:	83 c4 10             	add    $0x10,%esp
8010577f:	85 c0                	test   %eax,%eax
80105781:	78 0d                	js     80105790 <sys_sbrk+0x40>
80105783:	89 d8                	mov    %ebx,%eax
80105785:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105788:	c9                   	leave  
80105789:	c3                   	ret    
8010578a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105790:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105795:	eb ee                	jmp    80105785 <sys_sbrk+0x35>
80105797:	89 f6                	mov    %esi,%esi
80105799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801057a0 <sys_sleep>:
801057a0:	55                   	push   %ebp
801057a1:	89 e5                	mov    %esp,%ebp
801057a3:	53                   	push   %ebx
801057a4:	8d 45 f4             	lea    -0xc(%ebp),%eax
801057a7:	83 ec 1c             	sub    $0x1c,%esp
801057aa:	50                   	push   %eax
801057ab:	6a 00                	push   $0x0
801057ad:	e8 ce f1 ff ff       	call   80104980 <argint>
801057b2:	83 c4 10             	add    $0x10,%esp
801057b5:	85 c0                	test   %eax,%eax
801057b7:	0f 88 8a 00 00 00    	js     80105847 <sys_sleep+0xa7>
801057bd:	83 ec 0c             	sub    $0xc,%esp
801057c0:	68 a0 48 11 80       	push   $0x801148a0
801057c5:	e8 96 ec ff ff       	call   80104460 <acquire>
801057ca:	8b 55 f4             	mov    -0xc(%ebp),%edx
801057cd:	83 c4 10             	add    $0x10,%esp
801057d0:	8b 1d e0 50 11 80    	mov    0x801150e0,%ebx
801057d6:	85 d2                	test   %edx,%edx
801057d8:	75 27                	jne    80105801 <sys_sleep+0x61>
801057da:	eb 54                	jmp    80105830 <sys_sleep+0x90>
801057dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801057e0:	83 ec 08             	sub    $0x8,%esp
801057e3:	68 a0 48 11 80       	push   $0x801148a0
801057e8:	68 e0 50 11 80       	push   $0x801150e0
801057ed:	e8 8e e6 ff ff       	call   80103e80 <sleep>
801057f2:	a1 e0 50 11 80       	mov    0x801150e0,%eax
801057f7:	83 c4 10             	add    $0x10,%esp
801057fa:	29 d8                	sub    %ebx,%eax
801057fc:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801057ff:	73 2f                	jae    80105830 <sys_sleep+0x90>
80105801:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105807:	8b 40 24             	mov    0x24(%eax),%eax
8010580a:	85 c0                	test   %eax,%eax
8010580c:	74 d2                	je     801057e0 <sys_sleep+0x40>
8010580e:	83 ec 0c             	sub    $0xc,%esp
80105811:	68 a0 48 11 80       	push   $0x801148a0
80105816:	e8 25 ee ff ff       	call   80104640 <release>
8010581b:	83 c4 10             	add    $0x10,%esp
8010581e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105823:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105826:	c9                   	leave  
80105827:	c3                   	ret    
80105828:	90                   	nop
80105829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105830:	83 ec 0c             	sub    $0xc,%esp
80105833:	68 a0 48 11 80       	push   $0x801148a0
80105838:	e8 03 ee ff ff       	call   80104640 <release>
8010583d:	83 c4 10             	add    $0x10,%esp
80105840:	31 c0                	xor    %eax,%eax
80105842:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105845:	c9                   	leave  
80105846:	c3                   	ret    
80105847:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010584c:	eb d5                	jmp    80105823 <sys_sleep+0x83>
8010584e:	66 90                	xchg   %ax,%ax

80105850 <sys_uptime>:
80105850:	55                   	push   %ebp
80105851:	89 e5                	mov    %esp,%ebp
80105853:	53                   	push   %ebx
80105854:	83 ec 10             	sub    $0x10,%esp
80105857:	68 a0 48 11 80       	push   $0x801148a0
8010585c:	e8 ff eb ff ff       	call   80104460 <acquire>
80105861:	8b 1d e0 50 11 80    	mov    0x801150e0,%ebx
80105867:	c7 04 24 a0 48 11 80 	movl   $0x801148a0,(%esp)
8010586e:	e8 cd ed ff ff       	call   80104640 <release>
80105873:	89 d8                	mov    %ebx,%eax
80105875:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105878:	c9                   	leave  
80105879:	c3                   	ret    
8010587a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105880 <sys_cps>:
80105880:	55                   	push   %ebp
80105881:	89 e5                	mov    %esp,%ebp
80105883:	5d                   	pop    %ebp
80105884:	e9 57 e9 ff ff       	jmp    801041e0 <cps>
80105889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105890 <sys_cht>:
80105890:	55                   	push   %ebp
80105891:	89 e5                	mov    %esp,%ebp
80105893:	83 ec 20             	sub    $0x20,%esp
80105896:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105899:	50                   	push   %eax
8010589a:	6a 00                	push   $0x0
8010589c:	e8 df f0 ff ff       	call   80104980 <argint>
801058a1:	83 c4 10             	add    $0x10,%esp
801058a4:	85 c0                	test   %eax,%eax
801058a6:	78 28                	js     801058d0 <sys_cht+0x40>
801058a8:	8d 45 f4             	lea    -0xc(%ebp),%eax
801058ab:	83 ec 08             	sub    $0x8,%esp
801058ae:	50                   	push   %eax
801058af:	6a 01                	push   $0x1
801058b1:	e8 ca f0 ff ff       	call   80104980 <argint>
801058b6:	83 c4 10             	add    $0x10,%esp
801058b9:	85 c0                	test   %eax,%eax
801058bb:	78 13                	js     801058d0 <sys_cht+0x40>
801058bd:	83 ec 08             	sub    $0x8,%esp
801058c0:	ff 75 f4             	pushl  -0xc(%ebp)
801058c3:	ff 75 f0             	pushl  -0x10(%ebp)
801058c6:	e8 15 ea ff ff       	call   801042e0 <cht>
801058cb:	83 c4 10             	add    $0x10,%esp
801058ce:	c9                   	leave  
801058cf:	c3                   	ret    
801058d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801058d5:	c9                   	leave  
801058d6:	c3                   	ret    
801058d7:	66 90                	xchg   %ax,%ax
801058d9:	66 90                	xchg   %ax,%ax
801058db:	66 90                	xchg   %ax,%ax
801058dd:	66 90                	xchg   %ax,%ax
801058df:	90                   	nop

801058e0 <timerinit>:
801058e0:	55                   	push   %ebp
801058e1:	ba 43 00 00 00       	mov    $0x43,%edx
801058e6:	b8 34 00 00 00       	mov    $0x34,%eax
801058eb:	89 e5                	mov    %esp,%ebp
801058ed:	83 ec 14             	sub    $0x14,%esp
801058f0:	ee                   	out    %al,(%dx)
801058f1:	ba 40 00 00 00       	mov    $0x40,%edx
801058f6:	b8 9c ff ff ff       	mov    $0xffffff9c,%eax
801058fb:	ee                   	out    %al,(%dx)
801058fc:	b8 2e 00 00 00       	mov    $0x2e,%eax
80105901:	ee                   	out    %al,(%dx)
80105902:	6a 00                	push   $0x0
80105904:	e8 47 d9 ff ff       	call   80103250 <picenable>
80105909:	83 c4 10             	add    $0x10,%esp
8010590c:	c9                   	leave  
8010590d:	c3                   	ret    

8010590e <alltraps>:
8010590e:	1e                   	push   %ds
8010590f:	06                   	push   %es
80105910:	0f a0                	push   %fs
80105912:	0f a8                	push   %gs
80105914:	60                   	pusha  
80105915:	66 b8 10 00          	mov    $0x10,%ax
80105919:	8e d8                	mov    %eax,%ds
8010591b:	8e c0                	mov    %eax,%es
8010591d:	66 b8 18 00          	mov    $0x18,%ax
80105921:	8e e0                	mov    %eax,%fs
80105923:	8e e8                	mov    %eax,%gs
80105925:	54                   	push   %esp
80105926:	e8 e5 00 00 00       	call   80105a10 <trap>
8010592b:	83 c4 04             	add    $0x4,%esp

8010592e <trapret>:
8010592e:	61                   	popa   
8010592f:	0f a9                	pop    %gs
80105931:	0f a1                	pop    %fs
80105933:	07                   	pop    %es
80105934:	1f                   	pop    %ds
80105935:	83 c4 08             	add    $0x8,%esp
80105938:	cf                   	iret   
80105939:	66 90                	xchg   %ax,%ax
8010593b:	66 90                	xchg   %ax,%ax
8010593d:	66 90                	xchg   %ax,%ax
8010593f:	90                   	nop

80105940 <tvinit>:
80105940:	31 c0                	xor    %eax,%eax
80105942:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105948:	8b 14 85 0c a0 10 80 	mov    -0x7fef5ff4(,%eax,4),%edx
8010594f:	b9 08 00 00 00       	mov    $0x8,%ecx
80105954:	c6 04 c5 e4 48 11 80 	movb   $0x0,-0x7feeb71c(,%eax,8)
8010595b:	00 
8010595c:	66 89 0c c5 e2 48 11 	mov    %cx,-0x7feeb71e(,%eax,8)
80105963:	80 
80105964:	c6 04 c5 e5 48 11 80 	movb   $0x8e,-0x7feeb71b(,%eax,8)
8010596b:	8e 
8010596c:	66 89 14 c5 e0 48 11 	mov    %dx,-0x7feeb720(,%eax,8)
80105973:	80 
80105974:	c1 ea 10             	shr    $0x10,%edx
80105977:	66 89 14 c5 e6 48 11 	mov    %dx,-0x7feeb71a(,%eax,8)
8010597e:	80 
8010597f:	83 c0 01             	add    $0x1,%eax
80105982:	3d 00 01 00 00       	cmp    $0x100,%eax
80105987:	75 bf                	jne    80105948 <tvinit+0x8>
80105989:	55                   	push   %ebp
8010598a:	ba 08 00 00 00       	mov    $0x8,%edx
8010598f:	89 e5                	mov    %esp,%ebp
80105991:	83 ec 10             	sub    $0x10,%esp
80105994:	a1 0c a1 10 80       	mov    0x8010a10c,%eax
80105999:	68 c1 79 10 80       	push   $0x801079c1
8010599e:	68 a0 48 11 80       	push   $0x801148a0
801059a3:	66 89 15 e2 4a 11 80 	mov    %dx,0x80114ae2
801059aa:	c6 05 e4 4a 11 80 00 	movb   $0x0,0x80114ae4
801059b1:	66 a3 e0 4a 11 80    	mov    %ax,0x80114ae0
801059b7:	c1 e8 10             	shr    $0x10,%eax
801059ba:	c6 05 e5 4a 11 80 ef 	movb   $0xef,0x80114ae5
801059c1:	66 a3 e6 4a 11 80    	mov    %ax,0x80114ae6
801059c7:	e8 74 ea ff ff       	call   80104440 <initlock>
801059cc:	83 c4 10             	add    $0x10,%esp
801059cf:	c9                   	leave  
801059d0:	c3                   	ret    
801059d1:	eb 0d                	jmp    801059e0 <idtinit>
801059d3:	90                   	nop
801059d4:	90                   	nop
801059d5:	90                   	nop
801059d6:	90                   	nop
801059d7:	90                   	nop
801059d8:	90                   	nop
801059d9:	90                   	nop
801059da:	90                   	nop
801059db:	90                   	nop
801059dc:	90                   	nop
801059dd:	90                   	nop
801059de:	90                   	nop
801059df:	90                   	nop

801059e0 <idtinit>:
801059e0:	55                   	push   %ebp
801059e1:	b8 ff 07 00 00       	mov    $0x7ff,%eax
801059e6:	89 e5                	mov    %esp,%ebp
801059e8:	83 ec 10             	sub    $0x10,%esp
801059eb:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
801059ef:	b8 e0 48 11 80       	mov    $0x801148e0,%eax
801059f4:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
801059f8:	c1 e8 10             	shr    $0x10,%eax
801059fb:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
801059ff:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105a02:	0f 01 18             	lidtl  (%eax)
80105a05:	c9                   	leave  
80105a06:	c3                   	ret    
80105a07:	89 f6                	mov    %esi,%esi
80105a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105a10 <trap>:
80105a10:	55                   	push   %ebp
80105a11:	89 e5                	mov    %esp,%ebp
80105a13:	57                   	push   %edi
80105a14:	56                   	push   %esi
80105a15:	53                   	push   %ebx
80105a16:	83 ec 0c             	sub    $0xc,%esp
80105a19:	8b 5d 08             	mov    0x8(%ebp),%ebx
80105a1c:	8b 43 30             	mov    0x30(%ebx),%eax
80105a1f:	83 f8 40             	cmp    $0x40,%eax
80105a22:	0f 84 f8 00 00 00    	je     80105b20 <trap+0x110>
80105a28:	83 e8 20             	sub    $0x20,%eax
80105a2b:	83 f8 1f             	cmp    $0x1f,%eax
80105a2e:	77 68                	ja     80105a98 <trap+0x88>
80105a30:	ff 24 85 68 7a 10 80 	jmp    *-0x7fef8598(,%eax,4)
80105a37:	89 f6                	mov    %esi,%esi
80105a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105a40:	e8 8b cc ff ff       	call   801026d0 <cpunum>
80105a45:	85 c0                	test   %eax,%eax
80105a47:	0f 84 b3 01 00 00    	je     80105c00 <trap+0x1f0>
80105a4d:	e8 ee cc ff ff       	call   80102740 <lapiceoi>
80105a52:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105a58:	85 c0                	test   %eax,%eax
80105a5a:	74 2d                	je     80105a89 <trap+0x79>
80105a5c:	8b 50 24             	mov    0x24(%eax),%edx
80105a5f:	85 d2                	test   %edx,%edx
80105a61:	0f 85 86 00 00 00    	jne    80105aed <trap+0xdd>
80105a67:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105a6b:	0f 84 ef 00 00 00    	je     80105b60 <trap+0x150>
80105a71:	8b 40 24             	mov    0x24(%eax),%eax
80105a74:	85 c0                	test   %eax,%eax
80105a76:	74 11                	je     80105a89 <trap+0x79>
80105a78:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105a7c:	83 e0 03             	and    $0x3,%eax
80105a7f:	66 83 f8 03          	cmp    $0x3,%ax
80105a83:	0f 84 c1 00 00 00    	je     80105b4a <trap+0x13a>
80105a89:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a8c:	5b                   	pop    %ebx
80105a8d:	5e                   	pop    %esi
80105a8e:	5f                   	pop    %edi
80105a8f:	5d                   	pop    %ebp
80105a90:	c3                   	ret    
80105a91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105a98:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
80105a9f:	85 c9                	test   %ecx,%ecx
80105aa1:	0f 84 8d 01 00 00    	je     80105c34 <trap+0x224>
80105aa7:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
80105aab:	0f 84 83 01 00 00    	je     80105c34 <trap+0x224>
80105ab1:	0f 20 d7             	mov    %cr2,%edi
80105ab4:	8b 73 38             	mov    0x38(%ebx),%esi
80105ab7:	e8 14 cc ff ff       	call   801026d0 <cpunum>
80105abc:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80105ac3:	57                   	push   %edi
80105ac4:	56                   	push   %esi
80105ac5:	50                   	push   %eax
80105ac6:	ff 73 34             	pushl  0x34(%ebx)
80105ac9:	ff 73 30             	pushl  0x30(%ebx)
80105acc:	8d 42 6c             	lea    0x6c(%edx),%eax
80105acf:	50                   	push   %eax
80105ad0:	ff 72 10             	pushl  0x10(%edx)
80105ad3:	68 24 7a 10 80       	push   $0x80107a24
80105ad8:	e8 83 ab ff ff       	call   80100660 <cprintf>
80105add:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105ae3:	83 c4 20             	add    $0x20,%esp
80105ae6:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
80105aed:	0f b7 53 3c          	movzwl 0x3c(%ebx),%edx
80105af1:	83 e2 03             	and    $0x3,%edx
80105af4:	66 83 fa 03          	cmp    $0x3,%dx
80105af8:	0f 85 69 ff ff ff    	jne    80105a67 <trap+0x57>
80105afe:	e8 ed e1 ff ff       	call   80103cf0 <exit>
80105b03:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105b09:	85 c0                	test   %eax,%eax
80105b0b:	0f 85 56 ff ff ff    	jne    80105a67 <trap+0x57>
80105b11:	e9 73 ff ff ff       	jmp    80105a89 <trap+0x79>
80105b16:	8d 76 00             	lea    0x0(%esi),%esi
80105b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105b20:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105b26:	8b 70 24             	mov    0x24(%eax),%esi
80105b29:	85 f6                	test   %esi,%esi
80105b2b:	0f 85 bf 00 00 00    	jne    80105bf0 <trap+0x1e0>
80105b31:	89 58 18             	mov    %ebx,0x18(%eax)
80105b34:	e8 57 ef ff ff       	call   80104a90 <syscall>
80105b39:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105b3f:	8b 58 24             	mov    0x24(%eax),%ebx
80105b42:	85 db                	test   %ebx,%ebx
80105b44:	0f 84 3f ff ff ff    	je     80105a89 <trap+0x79>
80105b4a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b4d:	5b                   	pop    %ebx
80105b4e:	5e                   	pop    %esi
80105b4f:	5f                   	pop    %edi
80105b50:	5d                   	pop    %ebp
80105b51:	e9 9a e1 ff ff       	jmp    80103cf0 <exit>
80105b56:	8d 76 00             	lea    0x0(%esi),%esi
80105b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105b60:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
80105b64:	0f 85 07 ff ff ff    	jne    80105a71 <trap+0x61>
80105b6a:	e8 d1 e2 ff ff       	call   80103e40 <yield>
80105b6f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105b75:	85 c0                	test   %eax,%eax
80105b77:	0f 85 f4 fe ff ff    	jne    80105a71 <trap+0x61>
80105b7d:	e9 07 ff ff ff       	jmp    80105a89 <trap+0x79>
80105b82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105b88:	e8 23 ca ff ff       	call   801025b0 <kbdintr>
80105b8d:	e8 ae cb ff ff       	call   80102740 <lapiceoi>
80105b92:	e9 bb fe ff ff       	jmp    80105a52 <trap+0x42>
80105b97:	89 f6                	mov    %esi,%esi
80105b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105ba0:	e8 2b 02 00 00       	call   80105dd0 <uartintr>
80105ba5:	e9 a3 fe ff ff       	jmp    80105a4d <trap+0x3d>
80105baa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105bb0:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
80105bb4:	8b 7b 38             	mov    0x38(%ebx),%edi
80105bb7:	e8 14 cb ff ff       	call   801026d0 <cpunum>
80105bbc:	57                   	push   %edi
80105bbd:	56                   	push   %esi
80105bbe:	50                   	push   %eax
80105bbf:	68 cc 79 10 80       	push   $0x801079cc
80105bc4:	e8 97 aa ff ff       	call   80100660 <cprintf>
80105bc9:	e8 72 cb ff ff       	call   80102740 <lapiceoi>
80105bce:	83 c4 10             	add    $0x10,%esp
80105bd1:	e9 7c fe ff ff       	jmp    80105a52 <trap+0x42>
80105bd6:	8d 76 00             	lea    0x0(%esi),%esi
80105bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105be0:	e8 3b c4 ff ff       	call   80102020 <ideintr>
80105be5:	e8 56 cb ff ff       	call   80102740 <lapiceoi>
80105bea:	e9 63 fe ff ff       	jmp    80105a52 <trap+0x42>
80105bef:	90                   	nop
80105bf0:	e8 fb e0 ff ff       	call   80103cf0 <exit>
80105bf5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105bfb:	e9 31 ff ff ff       	jmp    80105b31 <trap+0x121>
80105c00:	83 ec 0c             	sub    $0xc,%esp
80105c03:	68 a0 48 11 80       	push   $0x801148a0
80105c08:	e8 53 e8 ff ff       	call   80104460 <acquire>
80105c0d:	c7 04 24 e0 50 11 80 	movl   $0x801150e0,(%esp)
80105c14:	83 05 e0 50 11 80 01 	addl   $0x1,0x801150e0
80105c1b:	e8 00 e4 ff ff       	call   80104020 <wakeup>
80105c20:	c7 04 24 a0 48 11 80 	movl   $0x801148a0,(%esp)
80105c27:	e8 14 ea ff ff       	call   80104640 <release>
80105c2c:	83 c4 10             	add    $0x10,%esp
80105c2f:	e9 19 fe ff ff       	jmp    80105a4d <trap+0x3d>
80105c34:	0f 20 d7             	mov    %cr2,%edi
80105c37:	8b 73 38             	mov    0x38(%ebx),%esi
80105c3a:	e8 91 ca ff ff       	call   801026d0 <cpunum>
80105c3f:	83 ec 0c             	sub    $0xc,%esp
80105c42:	57                   	push   %edi
80105c43:	56                   	push   %esi
80105c44:	50                   	push   %eax
80105c45:	ff 73 30             	pushl  0x30(%ebx)
80105c48:	68 f0 79 10 80       	push   $0x801079f0
80105c4d:	e8 0e aa ff ff       	call   80100660 <cprintf>
80105c52:	83 c4 14             	add    $0x14,%esp
80105c55:	68 c6 79 10 80       	push   $0x801079c6
80105c5a:	e8 11 a7 ff ff       	call   80100370 <panic>
80105c5f:	90                   	nop

80105c60 <uartgetc>:
80105c60:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
80105c65:	55                   	push   %ebp
80105c66:	89 e5                	mov    %esp,%ebp
80105c68:	85 c0                	test   %eax,%eax
80105c6a:	74 1c                	je     80105c88 <uartgetc+0x28>
80105c6c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105c71:	ec                   	in     (%dx),%al
80105c72:	a8 01                	test   $0x1,%al
80105c74:	74 12                	je     80105c88 <uartgetc+0x28>
80105c76:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105c7b:	ec                   	in     (%dx),%al
80105c7c:	0f b6 c0             	movzbl %al,%eax
80105c7f:	5d                   	pop    %ebp
80105c80:	c3                   	ret    
80105c81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105c88:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105c8d:	5d                   	pop    %ebp
80105c8e:	c3                   	ret    
80105c8f:	90                   	nop

80105c90 <uartputc.part.0>:
80105c90:	55                   	push   %ebp
80105c91:	89 e5                	mov    %esp,%ebp
80105c93:	57                   	push   %edi
80105c94:	56                   	push   %esi
80105c95:	53                   	push   %ebx
80105c96:	89 c7                	mov    %eax,%edi
80105c98:	bb 80 00 00 00       	mov    $0x80,%ebx
80105c9d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105ca2:	83 ec 0c             	sub    $0xc,%esp
80105ca5:	eb 1b                	jmp    80105cc2 <uartputc.part.0+0x32>
80105ca7:	89 f6                	mov    %esi,%esi
80105ca9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105cb0:	83 ec 0c             	sub    $0xc,%esp
80105cb3:	6a 0a                	push   $0xa
80105cb5:	e8 a6 ca ff ff       	call   80102760 <microdelay>
80105cba:	83 c4 10             	add    $0x10,%esp
80105cbd:	83 eb 01             	sub    $0x1,%ebx
80105cc0:	74 07                	je     80105cc9 <uartputc.part.0+0x39>
80105cc2:	89 f2                	mov    %esi,%edx
80105cc4:	ec                   	in     (%dx),%al
80105cc5:	a8 20                	test   $0x20,%al
80105cc7:	74 e7                	je     80105cb0 <uartputc.part.0+0x20>
80105cc9:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105cce:	89 f8                	mov    %edi,%eax
80105cd0:	ee                   	out    %al,(%dx)
80105cd1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105cd4:	5b                   	pop    %ebx
80105cd5:	5e                   	pop    %esi
80105cd6:	5f                   	pop    %edi
80105cd7:	5d                   	pop    %ebp
80105cd8:	c3                   	ret    
80105cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105ce0 <uartinit>:
80105ce0:	55                   	push   %ebp
80105ce1:	31 c9                	xor    %ecx,%ecx
80105ce3:	89 c8                	mov    %ecx,%eax
80105ce5:	89 e5                	mov    %esp,%ebp
80105ce7:	57                   	push   %edi
80105ce8:	56                   	push   %esi
80105ce9:	53                   	push   %ebx
80105cea:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105cef:	89 da                	mov    %ebx,%edx
80105cf1:	83 ec 0c             	sub    $0xc,%esp
80105cf4:	ee                   	out    %al,(%dx)
80105cf5:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105cfa:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105cff:	89 fa                	mov    %edi,%edx
80105d01:	ee                   	out    %al,(%dx)
80105d02:	b8 0c 00 00 00       	mov    $0xc,%eax
80105d07:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105d0c:	ee                   	out    %al,(%dx)
80105d0d:	be f9 03 00 00       	mov    $0x3f9,%esi
80105d12:	89 c8                	mov    %ecx,%eax
80105d14:	89 f2                	mov    %esi,%edx
80105d16:	ee                   	out    %al,(%dx)
80105d17:	b8 03 00 00 00       	mov    $0x3,%eax
80105d1c:	89 fa                	mov    %edi,%edx
80105d1e:	ee                   	out    %al,(%dx)
80105d1f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105d24:	89 c8                	mov    %ecx,%eax
80105d26:	ee                   	out    %al,(%dx)
80105d27:	b8 01 00 00 00       	mov    $0x1,%eax
80105d2c:	89 f2                	mov    %esi,%edx
80105d2e:	ee                   	out    %al,(%dx)
80105d2f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105d34:	ec                   	in     (%dx),%al
80105d35:	3c ff                	cmp    $0xff,%al
80105d37:	74 5a                	je     80105d93 <uartinit+0xb3>
80105d39:	c7 05 c0 a5 10 80 01 	movl   $0x1,0x8010a5c0
80105d40:	00 00 00 
80105d43:	89 da                	mov    %ebx,%edx
80105d45:	ec                   	in     (%dx),%al
80105d46:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105d4b:	ec                   	in     (%dx),%al
80105d4c:	83 ec 0c             	sub    $0xc,%esp
80105d4f:	6a 04                	push   $0x4
80105d51:	e8 fa d4 ff ff       	call   80103250 <picenable>
80105d56:	59                   	pop    %ecx
80105d57:	5b                   	pop    %ebx
80105d58:	6a 00                	push   $0x0
80105d5a:	6a 04                	push   $0x4
80105d5c:	bb e8 7a 10 80       	mov    $0x80107ae8,%ebx
80105d61:	e8 1a c5 ff ff       	call   80102280 <ioapicenable>
80105d66:	83 c4 10             	add    $0x10,%esp
80105d69:	b8 78 00 00 00       	mov    $0x78,%eax
80105d6e:	eb 0a                	jmp    80105d7a <uartinit+0x9a>
80105d70:	83 c3 01             	add    $0x1,%ebx
80105d73:	0f be 03             	movsbl (%ebx),%eax
80105d76:	84 c0                	test   %al,%al
80105d78:	74 19                	je     80105d93 <uartinit+0xb3>
80105d7a:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
80105d80:	85 d2                	test   %edx,%edx
80105d82:	74 ec                	je     80105d70 <uartinit+0x90>
80105d84:	83 c3 01             	add    $0x1,%ebx
80105d87:	e8 04 ff ff ff       	call   80105c90 <uartputc.part.0>
80105d8c:	0f be 03             	movsbl (%ebx),%eax
80105d8f:	84 c0                	test   %al,%al
80105d91:	75 e7                	jne    80105d7a <uartinit+0x9a>
80105d93:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105d96:	5b                   	pop    %ebx
80105d97:	5e                   	pop    %esi
80105d98:	5f                   	pop    %edi
80105d99:	5d                   	pop    %ebp
80105d9a:	c3                   	ret    
80105d9b:	90                   	nop
80105d9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105da0 <uartputc>:
80105da0:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
80105da6:	55                   	push   %ebp
80105da7:	89 e5                	mov    %esp,%ebp
80105da9:	85 d2                	test   %edx,%edx
80105dab:	8b 45 08             	mov    0x8(%ebp),%eax
80105dae:	74 10                	je     80105dc0 <uartputc+0x20>
80105db0:	5d                   	pop    %ebp
80105db1:	e9 da fe ff ff       	jmp    80105c90 <uartputc.part.0>
80105db6:	8d 76 00             	lea    0x0(%esi),%esi
80105db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105dc0:	5d                   	pop    %ebp
80105dc1:	c3                   	ret    
80105dc2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105dc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105dd0 <uartintr>:
80105dd0:	55                   	push   %ebp
80105dd1:	89 e5                	mov    %esp,%ebp
80105dd3:	83 ec 14             	sub    $0x14,%esp
80105dd6:	68 60 5c 10 80       	push   $0x80105c60
80105ddb:	e8 10 aa ff ff       	call   801007f0 <consoleintr>
80105de0:	83 c4 10             	add    $0x10,%esp
80105de3:	c9                   	leave  
80105de4:	c3                   	ret    

80105de5 <vector0>:
80105de5:	6a 00                	push   $0x0
80105de7:	6a 00                	push   $0x0
80105de9:	e9 20 fb ff ff       	jmp    8010590e <alltraps>

80105dee <vector1>:
80105dee:	6a 00                	push   $0x0
80105df0:	6a 01                	push   $0x1
80105df2:	e9 17 fb ff ff       	jmp    8010590e <alltraps>

80105df7 <vector2>:
80105df7:	6a 00                	push   $0x0
80105df9:	6a 02                	push   $0x2
80105dfb:	e9 0e fb ff ff       	jmp    8010590e <alltraps>

80105e00 <vector3>:
80105e00:	6a 00                	push   $0x0
80105e02:	6a 03                	push   $0x3
80105e04:	e9 05 fb ff ff       	jmp    8010590e <alltraps>

80105e09 <vector4>:
80105e09:	6a 00                	push   $0x0
80105e0b:	6a 04                	push   $0x4
80105e0d:	e9 fc fa ff ff       	jmp    8010590e <alltraps>

80105e12 <vector5>:
80105e12:	6a 00                	push   $0x0
80105e14:	6a 05                	push   $0x5
80105e16:	e9 f3 fa ff ff       	jmp    8010590e <alltraps>

80105e1b <vector6>:
80105e1b:	6a 00                	push   $0x0
80105e1d:	6a 06                	push   $0x6
80105e1f:	e9 ea fa ff ff       	jmp    8010590e <alltraps>

80105e24 <vector7>:
80105e24:	6a 00                	push   $0x0
80105e26:	6a 07                	push   $0x7
80105e28:	e9 e1 fa ff ff       	jmp    8010590e <alltraps>

80105e2d <vector8>:
80105e2d:	6a 08                	push   $0x8
80105e2f:	e9 da fa ff ff       	jmp    8010590e <alltraps>

80105e34 <vector9>:
80105e34:	6a 00                	push   $0x0
80105e36:	6a 09                	push   $0x9
80105e38:	e9 d1 fa ff ff       	jmp    8010590e <alltraps>

80105e3d <vector10>:
80105e3d:	6a 0a                	push   $0xa
80105e3f:	e9 ca fa ff ff       	jmp    8010590e <alltraps>

80105e44 <vector11>:
80105e44:	6a 0b                	push   $0xb
80105e46:	e9 c3 fa ff ff       	jmp    8010590e <alltraps>

80105e4b <vector12>:
80105e4b:	6a 0c                	push   $0xc
80105e4d:	e9 bc fa ff ff       	jmp    8010590e <alltraps>

80105e52 <vector13>:
80105e52:	6a 0d                	push   $0xd
80105e54:	e9 b5 fa ff ff       	jmp    8010590e <alltraps>

80105e59 <vector14>:
80105e59:	6a 0e                	push   $0xe
80105e5b:	e9 ae fa ff ff       	jmp    8010590e <alltraps>

80105e60 <vector15>:
80105e60:	6a 00                	push   $0x0
80105e62:	6a 0f                	push   $0xf
80105e64:	e9 a5 fa ff ff       	jmp    8010590e <alltraps>

80105e69 <vector16>:
80105e69:	6a 00                	push   $0x0
80105e6b:	6a 10                	push   $0x10
80105e6d:	e9 9c fa ff ff       	jmp    8010590e <alltraps>

80105e72 <vector17>:
80105e72:	6a 11                	push   $0x11
80105e74:	e9 95 fa ff ff       	jmp    8010590e <alltraps>

80105e79 <vector18>:
80105e79:	6a 00                	push   $0x0
80105e7b:	6a 12                	push   $0x12
80105e7d:	e9 8c fa ff ff       	jmp    8010590e <alltraps>

80105e82 <vector19>:
80105e82:	6a 00                	push   $0x0
80105e84:	6a 13                	push   $0x13
80105e86:	e9 83 fa ff ff       	jmp    8010590e <alltraps>

80105e8b <vector20>:
80105e8b:	6a 00                	push   $0x0
80105e8d:	6a 14                	push   $0x14
80105e8f:	e9 7a fa ff ff       	jmp    8010590e <alltraps>

80105e94 <vector21>:
80105e94:	6a 00                	push   $0x0
80105e96:	6a 15                	push   $0x15
80105e98:	e9 71 fa ff ff       	jmp    8010590e <alltraps>

80105e9d <vector22>:
80105e9d:	6a 00                	push   $0x0
80105e9f:	6a 16                	push   $0x16
80105ea1:	e9 68 fa ff ff       	jmp    8010590e <alltraps>

80105ea6 <vector23>:
80105ea6:	6a 00                	push   $0x0
80105ea8:	6a 17                	push   $0x17
80105eaa:	e9 5f fa ff ff       	jmp    8010590e <alltraps>

80105eaf <vector24>:
80105eaf:	6a 00                	push   $0x0
80105eb1:	6a 18                	push   $0x18
80105eb3:	e9 56 fa ff ff       	jmp    8010590e <alltraps>

80105eb8 <vector25>:
80105eb8:	6a 00                	push   $0x0
80105eba:	6a 19                	push   $0x19
80105ebc:	e9 4d fa ff ff       	jmp    8010590e <alltraps>

80105ec1 <vector26>:
80105ec1:	6a 00                	push   $0x0
80105ec3:	6a 1a                	push   $0x1a
80105ec5:	e9 44 fa ff ff       	jmp    8010590e <alltraps>

80105eca <vector27>:
80105eca:	6a 00                	push   $0x0
80105ecc:	6a 1b                	push   $0x1b
80105ece:	e9 3b fa ff ff       	jmp    8010590e <alltraps>

80105ed3 <vector28>:
80105ed3:	6a 00                	push   $0x0
80105ed5:	6a 1c                	push   $0x1c
80105ed7:	e9 32 fa ff ff       	jmp    8010590e <alltraps>

80105edc <vector29>:
80105edc:	6a 00                	push   $0x0
80105ede:	6a 1d                	push   $0x1d
80105ee0:	e9 29 fa ff ff       	jmp    8010590e <alltraps>

80105ee5 <vector30>:
80105ee5:	6a 00                	push   $0x0
80105ee7:	6a 1e                	push   $0x1e
80105ee9:	e9 20 fa ff ff       	jmp    8010590e <alltraps>

80105eee <vector31>:
80105eee:	6a 00                	push   $0x0
80105ef0:	6a 1f                	push   $0x1f
80105ef2:	e9 17 fa ff ff       	jmp    8010590e <alltraps>

80105ef7 <vector32>:
80105ef7:	6a 00                	push   $0x0
80105ef9:	6a 20                	push   $0x20
80105efb:	e9 0e fa ff ff       	jmp    8010590e <alltraps>

80105f00 <vector33>:
80105f00:	6a 00                	push   $0x0
80105f02:	6a 21                	push   $0x21
80105f04:	e9 05 fa ff ff       	jmp    8010590e <alltraps>

80105f09 <vector34>:
80105f09:	6a 00                	push   $0x0
80105f0b:	6a 22                	push   $0x22
80105f0d:	e9 fc f9 ff ff       	jmp    8010590e <alltraps>

80105f12 <vector35>:
80105f12:	6a 00                	push   $0x0
80105f14:	6a 23                	push   $0x23
80105f16:	e9 f3 f9 ff ff       	jmp    8010590e <alltraps>

80105f1b <vector36>:
80105f1b:	6a 00                	push   $0x0
80105f1d:	6a 24                	push   $0x24
80105f1f:	e9 ea f9 ff ff       	jmp    8010590e <alltraps>

80105f24 <vector37>:
80105f24:	6a 00                	push   $0x0
80105f26:	6a 25                	push   $0x25
80105f28:	e9 e1 f9 ff ff       	jmp    8010590e <alltraps>

80105f2d <vector38>:
80105f2d:	6a 00                	push   $0x0
80105f2f:	6a 26                	push   $0x26
80105f31:	e9 d8 f9 ff ff       	jmp    8010590e <alltraps>

80105f36 <vector39>:
80105f36:	6a 00                	push   $0x0
80105f38:	6a 27                	push   $0x27
80105f3a:	e9 cf f9 ff ff       	jmp    8010590e <alltraps>

80105f3f <vector40>:
80105f3f:	6a 00                	push   $0x0
80105f41:	6a 28                	push   $0x28
80105f43:	e9 c6 f9 ff ff       	jmp    8010590e <alltraps>

80105f48 <vector41>:
80105f48:	6a 00                	push   $0x0
80105f4a:	6a 29                	push   $0x29
80105f4c:	e9 bd f9 ff ff       	jmp    8010590e <alltraps>

80105f51 <vector42>:
80105f51:	6a 00                	push   $0x0
80105f53:	6a 2a                	push   $0x2a
80105f55:	e9 b4 f9 ff ff       	jmp    8010590e <alltraps>

80105f5a <vector43>:
80105f5a:	6a 00                	push   $0x0
80105f5c:	6a 2b                	push   $0x2b
80105f5e:	e9 ab f9 ff ff       	jmp    8010590e <alltraps>

80105f63 <vector44>:
80105f63:	6a 00                	push   $0x0
80105f65:	6a 2c                	push   $0x2c
80105f67:	e9 a2 f9 ff ff       	jmp    8010590e <alltraps>

80105f6c <vector45>:
80105f6c:	6a 00                	push   $0x0
80105f6e:	6a 2d                	push   $0x2d
80105f70:	e9 99 f9 ff ff       	jmp    8010590e <alltraps>

80105f75 <vector46>:
80105f75:	6a 00                	push   $0x0
80105f77:	6a 2e                	push   $0x2e
80105f79:	e9 90 f9 ff ff       	jmp    8010590e <alltraps>

80105f7e <vector47>:
80105f7e:	6a 00                	push   $0x0
80105f80:	6a 2f                	push   $0x2f
80105f82:	e9 87 f9 ff ff       	jmp    8010590e <alltraps>

80105f87 <vector48>:
80105f87:	6a 00                	push   $0x0
80105f89:	6a 30                	push   $0x30
80105f8b:	e9 7e f9 ff ff       	jmp    8010590e <alltraps>

80105f90 <vector49>:
80105f90:	6a 00                	push   $0x0
80105f92:	6a 31                	push   $0x31
80105f94:	e9 75 f9 ff ff       	jmp    8010590e <alltraps>

80105f99 <vector50>:
80105f99:	6a 00                	push   $0x0
80105f9b:	6a 32                	push   $0x32
80105f9d:	e9 6c f9 ff ff       	jmp    8010590e <alltraps>

80105fa2 <vector51>:
80105fa2:	6a 00                	push   $0x0
80105fa4:	6a 33                	push   $0x33
80105fa6:	e9 63 f9 ff ff       	jmp    8010590e <alltraps>

80105fab <vector52>:
80105fab:	6a 00                	push   $0x0
80105fad:	6a 34                	push   $0x34
80105faf:	e9 5a f9 ff ff       	jmp    8010590e <alltraps>

80105fb4 <vector53>:
80105fb4:	6a 00                	push   $0x0
80105fb6:	6a 35                	push   $0x35
80105fb8:	e9 51 f9 ff ff       	jmp    8010590e <alltraps>

80105fbd <vector54>:
80105fbd:	6a 00                	push   $0x0
80105fbf:	6a 36                	push   $0x36
80105fc1:	e9 48 f9 ff ff       	jmp    8010590e <alltraps>

80105fc6 <vector55>:
80105fc6:	6a 00                	push   $0x0
80105fc8:	6a 37                	push   $0x37
80105fca:	e9 3f f9 ff ff       	jmp    8010590e <alltraps>

80105fcf <vector56>:
80105fcf:	6a 00                	push   $0x0
80105fd1:	6a 38                	push   $0x38
80105fd3:	e9 36 f9 ff ff       	jmp    8010590e <alltraps>

80105fd8 <vector57>:
80105fd8:	6a 00                	push   $0x0
80105fda:	6a 39                	push   $0x39
80105fdc:	e9 2d f9 ff ff       	jmp    8010590e <alltraps>

80105fe1 <vector58>:
80105fe1:	6a 00                	push   $0x0
80105fe3:	6a 3a                	push   $0x3a
80105fe5:	e9 24 f9 ff ff       	jmp    8010590e <alltraps>

80105fea <vector59>:
80105fea:	6a 00                	push   $0x0
80105fec:	6a 3b                	push   $0x3b
80105fee:	e9 1b f9 ff ff       	jmp    8010590e <alltraps>

80105ff3 <vector60>:
80105ff3:	6a 00                	push   $0x0
80105ff5:	6a 3c                	push   $0x3c
80105ff7:	e9 12 f9 ff ff       	jmp    8010590e <alltraps>

80105ffc <vector61>:
80105ffc:	6a 00                	push   $0x0
80105ffe:	6a 3d                	push   $0x3d
80106000:	e9 09 f9 ff ff       	jmp    8010590e <alltraps>

80106005 <vector62>:
80106005:	6a 00                	push   $0x0
80106007:	6a 3e                	push   $0x3e
80106009:	e9 00 f9 ff ff       	jmp    8010590e <alltraps>

8010600e <vector63>:
8010600e:	6a 00                	push   $0x0
80106010:	6a 3f                	push   $0x3f
80106012:	e9 f7 f8 ff ff       	jmp    8010590e <alltraps>

80106017 <vector64>:
80106017:	6a 00                	push   $0x0
80106019:	6a 40                	push   $0x40
8010601b:	e9 ee f8 ff ff       	jmp    8010590e <alltraps>

80106020 <vector65>:
80106020:	6a 00                	push   $0x0
80106022:	6a 41                	push   $0x41
80106024:	e9 e5 f8 ff ff       	jmp    8010590e <alltraps>

80106029 <vector66>:
80106029:	6a 00                	push   $0x0
8010602b:	6a 42                	push   $0x42
8010602d:	e9 dc f8 ff ff       	jmp    8010590e <alltraps>

80106032 <vector67>:
80106032:	6a 00                	push   $0x0
80106034:	6a 43                	push   $0x43
80106036:	e9 d3 f8 ff ff       	jmp    8010590e <alltraps>

8010603b <vector68>:
8010603b:	6a 00                	push   $0x0
8010603d:	6a 44                	push   $0x44
8010603f:	e9 ca f8 ff ff       	jmp    8010590e <alltraps>

80106044 <vector69>:
80106044:	6a 00                	push   $0x0
80106046:	6a 45                	push   $0x45
80106048:	e9 c1 f8 ff ff       	jmp    8010590e <alltraps>

8010604d <vector70>:
8010604d:	6a 00                	push   $0x0
8010604f:	6a 46                	push   $0x46
80106051:	e9 b8 f8 ff ff       	jmp    8010590e <alltraps>

80106056 <vector71>:
80106056:	6a 00                	push   $0x0
80106058:	6a 47                	push   $0x47
8010605a:	e9 af f8 ff ff       	jmp    8010590e <alltraps>

8010605f <vector72>:
8010605f:	6a 00                	push   $0x0
80106061:	6a 48                	push   $0x48
80106063:	e9 a6 f8 ff ff       	jmp    8010590e <alltraps>

80106068 <vector73>:
80106068:	6a 00                	push   $0x0
8010606a:	6a 49                	push   $0x49
8010606c:	e9 9d f8 ff ff       	jmp    8010590e <alltraps>

80106071 <vector74>:
80106071:	6a 00                	push   $0x0
80106073:	6a 4a                	push   $0x4a
80106075:	e9 94 f8 ff ff       	jmp    8010590e <alltraps>

8010607a <vector75>:
8010607a:	6a 00                	push   $0x0
8010607c:	6a 4b                	push   $0x4b
8010607e:	e9 8b f8 ff ff       	jmp    8010590e <alltraps>

80106083 <vector76>:
80106083:	6a 00                	push   $0x0
80106085:	6a 4c                	push   $0x4c
80106087:	e9 82 f8 ff ff       	jmp    8010590e <alltraps>

8010608c <vector77>:
8010608c:	6a 00                	push   $0x0
8010608e:	6a 4d                	push   $0x4d
80106090:	e9 79 f8 ff ff       	jmp    8010590e <alltraps>

80106095 <vector78>:
80106095:	6a 00                	push   $0x0
80106097:	6a 4e                	push   $0x4e
80106099:	e9 70 f8 ff ff       	jmp    8010590e <alltraps>

8010609e <vector79>:
8010609e:	6a 00                	push   $0x0
801060a0:	6a 4f                	push   $0x4f
801060a2:	e9 67 f8 ff ff       	jmp    8010590e <alltraps>

801060a7 <vector80>:
801060a7:	6a 00                	push   $0x0
801060a9:	6a 50                	push   $0x50
801060ab:	e9 5e f8 ff ff       	jmp    8010590e <alltraps>

801060b0 <vector81>:
801060b0:	6a 00                	push   $0x0
801060b2:	6a 51                	push   $0x51
801060b4:	e9 55 f8 ff ff       	jmp    8010590e <alltraps>

801060b9 <vector82>:
801060b9:	6a 00                	push   $0x0
801060bb:	6a 52                	push   $0x52
801060bd:	e9 4c f8 ff ff       	jmp    8010590e <alltraps>

801060c2 <vector83>:
801060c2:	6a 00                	push   $0x0
801060c4:	6a 53                	push   $0x53
801060c6:	e9 43 f8 ff ff       	jmp    8010590e <alltraps>

801060cb <vector84>:
801060cb:	6a 00                	push   $0x0
801060cd:	6a 54                	push   $0x54
801060cf:	e9 3a f8 ff ff       	jmp    8010590e <alltraps>

801060d4 <vector85>:
801060d4:	6a 00                	push   $0x0
801060d6:	6a 55                	push   $0x55
801060d8:	e9 31 f8 ff ff       	jmp    8010590e <alltraps>

801060dd <vector86>:
801060dd:	6a 00                	push   $0x0
801060df:	6a 56                	push   $0x56
801060e1:	e9 28 f8 ff ff       	jmp    8010590e <alltraps>

801060e6 <vector87>:
801060e6:	6a 00                	push   $0x0
801060e8:	6a 57                	push   $0x57
801060ea:	e9 1f f8 ff ff       	jmp    8010590e <alltraps>

801060ef <vector88>:
801060ef:	6a 00                	push   $0x0
801060f1:	6a 58                	push   $0x58
801060f3:	e9 16 f8 ff ff       	jmp    8010590e <alltraps>

801060f8 <vector89>:
801060f8:	6a 00                	push   $0x0
801060fa:	6a 59                	push   $0x59
801060fc:	e9 0d f8 ff ff       	jmp    8010590e <alltraps>

80106101 <vector90>:
80106101:	6a 00                	push   $0x0
80106103:	6a 5a                	push   $0x5a
80106105:	e9 04 f8 ff ff       	jmp    8010590e <alltraps>

8010610a <vector91>:
8010610a:	6a 00                	push   $0x0
8010610c:	6a 5b                	push   $0x5b
8010610e:	e9 fb f7 ff ff       	jmp    8010590e <alltraps>

80106113 <vector92>:
80106113:	6a 00                	push   $0x0
80106115:	6a 5c                	push   $0x5c
80106117:	e9 f2 f7 ff ff       	jmp    8010590e <alltraps>

8010611c <vector93>:
8010611c:	6a 00                	push   $0x0
8010611e:	6a 5d                	push   $0x5d
80106120:	e9 e9 f7 ff ff       	jmp    8010590e <alltraps>

80106125 <vector94>:
80106125:	6a 00                	push   $0x0
80106127:	6a 5e                	push   $0x5e
80106129:	e9 e0 f7 ff ff       	jmp    8010590e <alltraps>

8010612e <vector95>:
8010612e:	6a 00                	push   $0x0
80106130:	6a 5f                	push   $0x5f
80106132:	e9 d7 f7 ff ff       	jmp    8010590e <alltraps>

80106137 <vector96>:
80106137:	6a 00                	push   $0x0
80106139:	6a 60                	push   $0x60
8010613b:	e9 ce f7 ff ff       	jmp    8010590e <alltraps>

80106140 <vector97>:
80106140:	6a 00                	push   $0x0
80106142:	6a 61                	push   $0x61
80106144:	e9 c5 f7 ff ff       	jmp    8010590e <alltraps>

80106149 <vector98>:
80106149:	6a 00                	push   $0x0
8010614b:	6a 62                	push   $0x62
8010614d:	e9 bc f7 ff ff       	jmp    8010590e <alltraps>

80106152 <vector99>:
80106152:	6a 00                	push   $0x0
80106154:	6a 63                	push   $0x63
80106156:	e9 b3 f7 ff ff       	jmp    8010590e <alltraps>

8010615b <vector100>:
8010615b:	6a 00                	push   $0x0
8010615d:	6a 64                	push   $0x64
8010615f:	e9 aa f7 ff ff       	jmp    8010590e <alltraps>

80106164 <vector101>:
80106164:	6a 00                	push   $0x0
80106166:	6a 65                	push   $0x65
80106168:	e9 a1 f7 ff ff       	jmp    8010590e <alltraps>

8010616d <vector102>:
8010616d:	6a 00                	push   $0x0
8010616f:	6a 66                	push   $0x66
80106171:	e9 98 f7 ff ff       	jmp    8010590e <alltraps>

80106176 <vector103>:
80106176:	6a 00                	push   $0x0
80106178:	6a 67                	push   $0x67
8010617a:	e9 8f f7 ff ff       	jmp    8010590e <alltraps>

8010617f <vector104>:
8010617f:	6a 00                	push   $0x0
80106181:	6a 68                	push   $0x68
80106183:	e9 86 f7 ff ff       	jmp    8010590e <alltraps>

80106188 <vector105>:
80106188:	6a 00                	push   $0x0
8010618a:	6a 69                	push   $0x69
8010618c:	e9 7d f7 ff ff       	jmp    8010590e <alltraps>

80106191 <vector106>:
80106191:	6a 00                	push   $0x0
80106193:	6a 6a                	push   $0x6a
80106195:	e9 74 f7 ff ff       	jmp    8010590e <alltraps>

8010619a <vector107>:
8010619a:	6a 00                	push   $0x0
8010619c:	6a 6b                	push   $0x6b
8010619e:	e9 6b f7 ff ff       	jmp    8010590e <alltraps>

801061a3 <vector108>:
801061a3:	6a 00                	push   $0x0
801061a5:	6a 6c                	push   $0x6c
801061a7:	e9 62 f7 ff ff       	jmp    8010590e <alltraps>

801061ac <vector109>:
801061ac:	6a 00                	push   $0x0
801061ae:	6a 6d                	push   $0x6d
801061b0:	e9 59 f7 ff ff       	jmp    8010590e <alltraps>

801061b5 <vector110>:
801061b5:	6a 00                	push   $0x0
801061b7:	6a 6e                	push   $0x6e
801061b9:	e9 50 f7 ff ff       	jmp    8010590e <alltraps>

801061be <vector111>:
801061be:	6a 00                	push   $0x0
801061c0:	6a 6f                	push   $0x6f
801061c2:	e9 47 f7 ff ff       	jmp    8010590e <alltraps>

801061c7 <vector112>:
801061c7:	6a 00                	push   $0x0
801061c9:	6a 70                	push   $0x70
801061cb:	e9 3e f7 ff ff       	jmp    8010590e <alltraps>

801061d0 <vector113>:
801061d0:	6a 00                	push   $0x0
801061d2:	6a 71                	push   $0x71
801061d4:	e9 35 f7 ff ff       	jmp    8010590e <alltraps>

801061d9 <vector114>:
801061d9:	6a 00                	push   $0x0
801061db:	6a 72                	push   $0x72
801061dd:	e9 2c f7 ff ff       	jmp    8010590e <alltraps>

801061e2 <vector115>:
801061e2:	6a 00                	push   $0x0
801061e4:	6a 73                	push   $0x73
801061e6:	e9 23 f7 ff ff       	jmp    8010590e <alltraps>

801061eb <vector116>:
801061eb:	6a 00                	push   $0x0
801061ed:	6a 74                	push   $0x74
801061ef:	e9 1a f7 ff ff       	jmp    8010590e <alltraps>

801061f4 <vector117>:
801061f4:	6a 00                	push   $0x0
801061f6:	6a 75                	push   $0x75
801061f8:	e9 11 f7 ff ff       	jmp    8010590e <alltraps>

801061fd <vector118>:
801061fd:	6a 00                	push   $0x0
801061ff:	6a 76                	push   $0x76
80106201:	e9 08 f7 ff ff       	jmp    8010590e <alltraps>

80106206 <vector119>:
80106206:	6a 00                	push   $0x0
80106208:	6a 77                	push   $0x77
8010620a:	e9 ff f6 ff ff       	jmp    8010590e <alltraps>

8010620f <vector120>:
8010620f:	6a 00                	push   $0x0
80106211:	6a 78                	push   $0x78
80106213:	e9 f6 f6 ff ff       	jmp    8010590e <alltraps>

80106218 <vector121>:
80106218:	6a 00                	push   $0x0
8010621a:	6a 79                	push   $0x79
8010621c:	e9 ed f6 ff ff       	jmp    8010590e <alltraps>

80106221 <vector122>:
80106221:	6a 00                	push   $0x0
80106223:	6a 7a                	push   $0x7a
80106225:	e9 e4 f6 ff ff       	jmp    8010590e <alltraps>

8010622a <vector123>:
8010622a:	6a 00                	push   $0x0
8010622c:	6a 7b                	push   $0x7b
8010622e:	e9 db f6 ff ff       	jmp    8010590e <alltraps>

80106233 <vector124>:
80106233:	6a 00                	push   $0x0
80106235:	6a 7c                	push   $0x7c
80106237:	e9 d2 f6 ff ff       	jmp    8010590e <alltraps>

8010623c <vector125>:
8010623c:	6a 00                	push   $0x0
8010623e:	6a 7d                	push   $0x7d
80106240:	e9 c9 f6 ff ff       	jmp    8010590e <alltraps>

80106245 <vector126>:
80106245:	6a 00                	push   $0x0
80106247:	6a 7e                	push   $0x7e
80106249:	e9 c0 f6 ff ff       	jmp    8010590e <alltraps>

8010624e <vector127>:
8010624e:	6a 00                	push   $0x0
80106250:	6a 7f                	push   $0x7f
80106252:	e9 b7 f6 ff ff       	jmp    8010590e <alltraps>

80106257 <vector128>:
80106257:	6a 00                	push   $0x0
80106259:	68 80 00 00 00       	push   $0x80
8010625e:	e9 ab f6 ff ff       	jmp    8010590e <alltraps>

80106263 <vector129>:
80106263:	6a 00                	push   $0x0
80106265:	68 81 00 00 00       	push   $0x81
8010626a:	e9 9f f6 ff ff       	jmp    8010590e <alltraps>

8010626f <vector130>:
8010626f:	6a 00                	push   $0x0
80106271:	68 82 00 00 00       	push   $0x82
80106276:	e9 93 f6 ff ff       	jmp    8010590e <alltraps>

8010627b <vector131>:
8010627b:	6a 00                	push   $0x0
8010627d:	68 83 00 00 00       	push   $0x83
80106282:	e9 87 f6 ff ff       	jmp    8010590e <alltraps>

80106287 <vector132>:
80106287:	6a 00                	push   $0x0
80106289:	68 84 00 00 00       	push   $0x84
8010628e:	e9 7b f6 ff ff       	jmp    8010590e <alltraps>

80106293 <vector133>:
80106293:	6a 00                	push   $0x0
80106295:	68 85 00 00 00       	push   $0x85
8010629a:	e9 6f f6 ff ff       	jmp    8010590e <alltraps>

8010629f <vector134>:
8010629f:	6a 00                	push   $0x0
801062a1:	68 86 00 00 00       	push   $0x86
801062a6:	e9 63 f6 ff ff       	jmp    8010590e <alltraps>

801062ab <vector135>:
801062ab:	6a 00                	push   $0x0
801062ad:	68 87 00 00 00       	push   $0x87
801062b2:	e9 57 f6 ff ff       	jmp    8010590e <alltraps>

801062b7 <vector136>:
801062b7:	6a 00                	push   $0x0
801062b9:	68 88 00 00 00       	push   $0x88
801062be:	e9 4b f6 ff ff       	jmp    8010590e <alltraps>

801062c3 <vector137>:
801062c3:	6a 00                	push   $0x0
801062c5:	68 89 00 00 00       	push   $0x89
801062ca:	e9 3f f6 ff ff       	jmp    8010590e <alltraps>

801062cf <vector138>:
801062cf:	6a 00                	push   $0x0
801062d1:	68 8a 00 00 00       	push   $0x8a
801062d6:	e9 33 f6 ff ff       	jmp    8010590e <alltraps>

801062db <vector139>:
801062db:	6a 00                	push   $0x0
801062dd:	68 8b 00 00 00       	push   $0x8b
801062e2:	e9 27 f6 ff ff       	jmp    8010590e <alltraps>

801062e7 <vector140>:
801062e7:	6a 00                	push   $0x0
801062e9:	68 8c 00 00 00       	push   $0x8c
801062ee:	e9 1b f6 ff ff       	jmp    8010590e <alltraps>

801062f3 <vector141>:
801062f3:	6a 00                	push   $0x0
801062f5:	68 8d 00 00 00       	push   $0x8d
801062fa:	e9 0f f6 ff ff       	jmp    8010590e <alltraps>

801062ff <vector142>:
801062ff:	6a 00                	push   $0x0
80106301:	68 8e 00 00 00       	push   $0x8e
80106306:	e9 03 f6 ff ff       	jmp    8010590e <alltraps>

8010630b <vector143>:
8010630b:	6a 00                	push   $0x0
8010630d:	68 8f 00 00 00       	push   $0x8f
80106312:	e9 f7 f5 ff ff       	jmp    8010590e <alltraps>

80106317 <vector144>:
80106317:	6a 00                	push   $0x0
80106319:	68 90 00 00 00       	push   $0x90
8010631e:	e9 eb f5 ff ff       	jmp    8010590e <alltraps>

80106323 <vector145>:
80106323:	6a 00                	push   $0x0
80106325:	68 91 00 00 00       	push   $0x91
8010632a:	e9 df f5 ff ff       	jmp    8010590e <alltraps>

8010632f <vector146>:
8010632f:	6a 00                	push   $0x0
80106331:	68 92 00 00 00       	push   $0x92
80106336:	e9 d3 f5 ff ff       	jmp    8010590e <alltraps>

8010633b <vector147>:
8010633b:	6a 00                	push   $0x0
8010633d:	68 93 00 00 00       	push   $0x93
80106342:	e9 c7 f5 ff ff       	jmp    8010590e <alltraps>

80106347 <vector148>:
80106347:	6a 00                	push   $0x0
80106349:	68 94 00 00 00       	push   $0x94
8010634e:	e9 bb f5 ff ff       	jmp    8010590e <alltraps>

80106353 <vector149>:
80106353:	6a 00                	push   $0x0
80106355:	68 95 00 00 00       	push   $0x95
8010635a:	e9 af f5 ff ff       	jmp    8010590e <alltraps>

8010635f <vector150>:
8010635f:	6a 00                	push   $0x0
80106361:	68 96 00 00 00       	push   $0x96
80106366:	e9 a3 f5 ff ff       	jmp    8010590e <alltraps>

8010636b <vector151>:
8010636b:	6a 00                	push   $0x0
8010636d:	68 97 00 00 00       	push   $0x97
80106372:	e9 97 f5 ff ff       	jmp    8010590e <alltraps>

80106377 <vector152>:
80106377:	6a 00                	push   $0x0
80106379:	68 98 00 00 00       	push   $0x98
8010637e:	e9 8b f5 ff ff       	jmp    8010590e <alltraps>

80106383 <vector153>:
80106383:	6a 00                	push   $0x0
80106385:	68 99 00 00 00       	push   $0x99
8010638a:	e9 7f f5 ff ff       	jmp    8010590e <alltraps>

8010638f <vector154>:
8010638f:	6a 00                	push   $0x0
80106391:	68 9a 00 00 00       	push   $0x9a
80106396:	e9 73 f5 ff ff       	jmp    8010590e <alltraps>

8010639b <vector155>:
8010639b:	6a 00                	push   $0x0
8010639d:	68 9b 00 00 00       	push   $0x9b
801063a2:	e9 67 f5 ff ff       	jmp    8010590e <alltraps>

801063a7 <vector156>:
801063a7:	6a 00                	push   $0x0
801063a9:	68 9c 00 00 00       	push   $0x9c
801063ae:	e9 5b f5 ff ff       	jmp    8010590e <alltraps>

801063b3 <vector157>:
801063b3:	6a 00                	push   $0x0
801063b5:	68 9d 00 00 00       	push   $0x9d
801063ba:	e9 4f f5 ff ff       	jmp    8010590e <alltraps>

801063bf <vector158>:
801063bf:	6a 00                	push   $0x0
801063c1:	68 9e 00 00 00       	push   $0x9e
801063c6:	e9 43 f5 ff ff       	jmp    8010590e <alltraps>

801063cb <vector159>:
801063cb:	6a 00                	push   $0x0
801063cd:	68 9f 00 00 00       	push   $0x9f
801063d2:	e9 37 f5 ff ff       	jmp    8010590e <alltraps>

801063d7 <vector160>:
801063d7:	6a 00                	push   $0x0
801063d9:	68 a0 00 00 00       	push   $0xa0
801063de:	e9 2b f5 ff ff       	jmp    8010590e <alltraps>

801063e3 <vector161>:
801063e3:	6a 00                	push   $0x0
801063e5:	68 a1 00 00 00       	push   $0xa1
801063ea:	e9 1f f5 ff ff       	jmp    8010590e <alltraps>

801063ef <vector162>:
801063ef:	6a 00                	push   $0x0
801063f1:	68 a2 00 00 00       	push   $0xa2
801063f6:	e9 13 f5 ff ff       	jmp    8010590e <alltraps>

801063fb <vector163>:
801063fb:	6a 00                	push   $0x0
801063fd:	68 a3 00 00 00       	push   $0xa3
80106402:	e9 07 f5 ff ff       	jmp    8010590e <alltraps>

80106407 <vector164>:
80106407:	6a 00                	push   $0x0
80106409:	68 a4 00 00 00       	push   $0xa4
8010640e:	e9 fb f4 ff ff       	jmp    8010590e <alltraps>

80106413 <vector165>:
80106413:	6a 00                	push   $0x0
80106415:	68 a5 00 00 00       	push   $0xa5
8010641a:	e9 ef f4 ff ff       	jmp    8010590e <alltraps>

8010641f <vector166>:
8010641f:	6a 00                	push   $0x0
80106421:	68 a6 00 00 00       	push   $0xa6
80106426:	e9 e3 f4 ff ff       	jmp    8010590e <alltraps>

8010642b <vector167>:
8010642b:	6a 00                	push   $0x0
8010642d:	68 a7 00 00 00       	push   $0xa7
80106432:	e9 d7 f4 ff ff       	jmp    8010590e <alltraps>

80106437 <vector168>:
80106437:	6a 00                	push   $0x0
80106439:	68 a8 00 00 00       	push   $0xa8
8010643e:	e9 cb f4 ff ff       	jmp    8010590e <alltraps>

80106443 <vector169>:
80106443:	6a 00                	push   $0x0
80106445:	68 a9 00 00 00       	push   $0xa9
8010644a:	e9 bf f4 ff ff       	jmp    8010590e <alltraps>

8010644f <vector170>:
8010644f:	6a 00                	push   $0x0
80106451:	68 aa 00 00 00       	push   $0xaa
80106456:	e9 b3 f4 ff ff       	jmp    8010590e <alltraps>

8010645b <vector171>:
8010645b:	6a 00                	push   $0x0
8010645d:	68 ab 00 00 00       	push   $0xab
80106462:	e9 a7 f4 ff ff       	jmp    8010590e <alltraps>

80106467 <vector172>:
80106467:	6a 00                	push   $0x0
80106469:	68 ac 00 00 00       	push   $0xac
8010646e:	e9 9b f4 ff ff       	jmp    8010590e <alltraps>

80106473 <vector173>:
80106473:	6a 00                	push   $0x0
80106475:	68 ad 00 00 00       	push   $0xad
8010647a:	e9 8f f4 ff ff       	jmp    8010590e <alltraps>

8010647f <vector174>:
8010647f:	6a 00                	push   $0x0
80106481:	68 ae 00 00 00       	push   $0xae
80106486:	e9 83 f4 ff ff       	jmp    8010590e <alltraps>

8010648b <vector175>:
8010648b:	6a 00                	push   $0x0
8010648d:	68 af 00 00 00       	push   $0xaf
80106492:	e9 77 f4 ff ff       	jmp    8010590e <alltraps>

80106497 <vector176>:
80106497:	6a 00                	push   $0x0
80106499:	68 b0 00 00 00       	push   $0xb0
8010649e:	e9 6b f4 ff ff       	jmp    8010590e <alltraps>

801064a3 <vector177>:
801064a3:	6a 00                	push   $0x0
801064a5:	68 b1 00 00 00       	push   $0xb1
801064aa:	e9 5f f4 ff ff       	jmp    8010590e <alltraps>

801064af <vector178>:
801064af:	6a 00                	push   $0x0
801064b1:	68 b2 00 00 00       	push   $0xb2
801064b6:	e9 53 f4 ff ff       	jmp    8010590e <alltraps>

801064bb <vector179>:
801064bb:	6a 00                	push   $0x0
801064bd:	68 b3 00 00 00       	push   $0xb3
801064c2:	e9 47 f4 ff ff       	jmp    8010590e <alltraps>

801064c7 <vector180>:
801064c7:	6a 00                	push   $0x0
801064c9:	68 b4 00 00 00       	push   $0xb4
801064ce:	e9 3b f4 ff ff       	jmp    8010590e <alltraps>

801064d3 <vector181>:
801064d3:	6a 00                	push   $0x0
801064d5:	68 b5 00 00 00       	push   $0xb5
801064da:	e9 2f f4 ff ff       	jmp    8010590e <alltraps>

801064df <vector182>:
801064df:	6a 00                	push   $0x0
801064e1:	68 b6 00 00 00       	push   $0xb6
801064e6:	e9 23 f4 ff ff       	jmp    8010590e <alltraps>

801064eb <vector183>:
801064eb:	6a 00                	push   $0x0
801064ed:	68 b7 00 00 00       	push   $0xb7
801064f2:	e9 17 f4 ff ff       	jmp    8010590e <alltraps>

801064f7 <vector184>:
801064f7:	6a 00                	push   $0x0
801064f9:	68 b8 00 00 00       	push   $0xb8
801064fe:	e9 0b f4 ff ff       	jmp    8010590e <alltraps>

80106503 <vector185>:
80106503:	6a 00                	push   $0x0
80106505:	68 b9 00 00 00       	push   $0xb9
8010650a:	e9 ff f3 ff ff       	jmp    8010590e <alltraps>

8010650f <vector186>:
8010650f:	6a 00                	push   $0x0
80106511:	68 ba 00 00 00       	push   $0xba
80106516:	e9 f3 f3 ff ff       	jmp    8010590e <alltraps>

8010651b <vector187>:
8010651b:	6a 00                	push   $0x0
8010651d:	68 bb 00 00 00       	push   $0xbb
80106522:	e9 e7 f3 ff ff       	jmp    8010590e <alltraps>

80106527 <vector188>:
80106527:	6a 00                	push   $0x0
80106529:	68 bc 00 00 00       	push   $0xbc
8010652e:	e9 db f3 ff ff       	jmp    8010590e <alltraps>

80106533 <vector189>:
80106533:	6a 00                	push   $0x0
80106535:	68 bd 00 00 00       	push   $0xbd
8010653a:	e9 cf f3 ff ff       	jmp    8010590e <alltraps>

8010653f <vector190>:
8010653f:	6a 00                	push   $0x0
80106541:	68 be 00 00 00       	push   $0xbe
80106546:	e9 c3 f3 ff ff       	jmp    8010590e <alltraps>

8010654b <vector191>:
8010654b:	6a 00                	push   $0x0
8010654d:	68 bf 00 00 00       	push   $0xbf
80106552:	e9 b7 f3 ff ff       	jmp    8010590e <alltraps>

80106557 <vector192>:
80106557:	6a 00                	push   $0x0
80106559:	68 c0 00 00 00       	push   $0xc0
8010655e:	e9 ab f3 ff ff       	jmp    8010590e <alltraps>

80106563 <vector193>:
80106563:	6a 00                	push   $0x0
80106565:	68 c1 00 00 00       	push   $0xc1
8010656a:	e9 9f f3 ff ff       	jmp    8010590e <alltraps>

8010656f <vector194>:
8010656f:	6a 00                	push   $0x0
80106571:	68 c2 00 00 00       	push   $0xc2
80106576:	e9 93 f3 ff ff       	jmp    8010590e <alltraps>

8010657b <vector195>:
8010657b:	6a 00                	push   $0x0
8010657d:	68 c3 00 00 00       	push   $0xc3
80106582:	e9 87 f3 ff ff       	jmp    8010590e <alltraps>

80106587 <vector196>:
80106587:	6a 00                	push   $0x0
80106589:	68 c4 00 00 00       	push   $0xc4
8010658e:	e9 7b f3 ff ff       	jmp    8010590e <alltraps>

80106593 <vector197>:
80106593:	6a 00                	push   $0x0
80106595:	68 c5 00 00 00       	push   $0xc5
8010659a:	e9 6f f3 ff ff       	jmp    8010590e <alltraps>

8010659f <vector198>:
8010659f:	6a 00                	push   $0x0
801065a1:	68 c6 00 00 00       	push   $0xc6
801065a6:	e9 63 f3 ff ff       	jmp    8010590e <alltraps>

801065ab <vector199>:
801065ab:	6a 00                	push   $0x0
801065ad:	68 c7 00 00 00       	push   $0xc7
801065b2:	e9 57 f3 ff ff       	jmp    8010590e <alltraps>

801065b7 <vector200>:
801065b7:	6a 00                	push   $0x0
801065b9:	68 c8 00 00 00       	push   $0xc8
801065be:	e9 4b f3 ff ff       	jmp    8010590e <alltraps>

801065c3 <vector201>:
801065c3:	6a 00                	push   $0x0
801065c5:	68 c9 00 00 00       	push   $0xc9
801065ca:	e9 3f f3 ff ff       	jmp    8010590e <alltraps>

801065cf <vector202>:
801065cf:	6a 00                	push   $0x0
801065d1:	68 ca 00 00 00       	push   $0xca
801065d6:	e9 33 f3 ff ff       	jmp    8010590e <alltraps>

801065db <vector203>:
801065db:	6a 00                	push   $0x0
801065dd:	68 cb 00 00 00       	push   $0xcb
801065e2:	e9 27 f3 ff ff       	jmp    8010590e <alltraps>

801065e7 <vector204>:
801065e7:	6a 00                	push   $0x0
801065e9:	68 cc 00 00 00       	push   $0xcc
801065ee:	e9 1b f3 ff ff       	jmp    8010590e <alltraps>

801065f3 <vector205>:
801065f3:	6a 00                	push   $0x0
801065f5:	68 cd 00 00 00       	push   $0xcd
801065fa:	e9 0f f3 ff ff       	jmp    8010590e <alltraps>

801065ff <vector206>:
801065ff:	6a 00                	push   $0x0
80106601:	68 ce 00 00 00       	push   $0xce
80106606:	e9 03 f3 ff ff       	jmp    8010590e <alltraps>

8010660b <vector207>:
8010660b:	6a 00                	push   $0x0
8010660d:	68 cf 00 00 00       	push   $0xcf
80106612:	e9 f7 f2 ff ff       	jmp    8010590e <alltraps>

80106617 <vector208>:
80106617:	6a 00                	push   $0x0
80106619:	68 d0 00 00 00       	push   $0xd0
8010661e:	e9 eb f2 ff ff       	jmp    8010590e <alltraps>

80106623 <vector209>:
80106623:	6a 00                	push   $0x0
80106625:	68 d1 00 00 00       	push   $0xd1
8010662a:	e9 df f2 ff ff       	jmp    8010590e <alltraps>

8010662f <vector210>:
8010662f:	6a 00                	push   $0x0
80106631:	68 d2 00 00 00       	push   $0xd2
80106636:	e9 d3 f2 ff ff       	jmp    8010590e <alltraps>

8010663b <vector211>:
8010663b:	6a 00                	push   $0x0
8010663d:	68 d3 00 00 00       	push   $0xd3
80106642:	e9 c7 f2 ff ff       	jmp    8010590e <alltraps>

80106647 <vector212>:
80106647:	6a 00                	push   $0x0
80106649:	68 d4 00 00 00       	push   $0xd4
8010664e:	e9 bb f2 ff ff       	jmp    8010590e <alltraps>

80106653 <vector213>:
80106653:	6a 00                	push   $0x0
80106655:	68 d5 00 00 00       	push   $0xd5
8010665a:	e9 af f2 ff ff       	jmp    8010590e <alltraps>

8010665f <vector214>:
8010665f:	6a 00                	push   $0x0
80106661:	68 d6 00 00 00       	push   $0xd6
80106666:	e9 a3 f2 ff ff       	jmp    8010590e <alltraps>

8010666b <vector215>:
8010666b:	6a 00                	push   $0x0
8010666d:	68 d7 00 00 00       	push   $0xd7
80106672:	e9 97 f2 ff ff       	jmp    8010590e <alltraps>

80106677 <vector216>:
80106677:	6a 00                	push   $0x0
80106679:	68 d8 00 00 00       	push   $0xd8
8010667e:	e9 8b f2 ff ff       	jmp    8010590e <alltraps>

80106683 <vector217>:
80106683:	6a 00                	push   $0x0
80106685:	68 d9 00 00 00       	push   $0xd9
8010668a:	e9 7f f2 ff ff       	jmp    8010590e <alltraps>

8010668f <vector218>:
8010668f:	6a 00                	push   $0x0
80106691:	68 da 00 00 00       	push   $0xda
80106696:	e9 73 f2 ff ff       	jmp    8010590e <alltraps>

8010669b <vector219>:
8010669b:	6a 00                	push   $0x0
8010669d:	68 db 00 00 00       	push   $0xdb
801066a2:	e9 67 f2 ff ff       	jmp    8010590e <alltraps>

801066a7 <vector220>:
801066a7:	6a 00                	push   $0x0
801066a9:	68 dc 00 00 00       	push   $0xdc
801066ae:	e9 5b f2 ff ff       	jmp    8010590e <alltraps>

801066b3 <vector221>:
801066b3:	6a 00                	push   $0x0
801066b5:	68 dd 00 00 00       	push   $0xdd
801066ba:	e9 4f f2 ff ff       	jmp    8010590e <alltraps>

801066bf <vector222>:
801066bf:	6a 00                	push   $0x0
801066c1:	68 de 00 00 00       	push   $0xde
801066c6:	e9 43 f2 ff ff       	jmp    8010590e <alltraps>

801066cb <vector223>:
801066cb:	6a 00                	push   $0x0
801066cd:	68 df 00 00 00       	push   $0xdf
801066d2:	e9 37 f2 ff ff       	jmp    8010590e <alltraps>

801066d7 <vector224>:
801066d7:	6a 00                	push   $0x0
801066d9:	68 e0 00 00 00       	push   $0xe0
801066de:	e9 2b f2 ff ff       	jmp    8010590e <alltraps>

801066e3 <vector225>:
801066e3:	6a 00                	push   $0x0
801066e5:	68 e1 00 00 00       	push   $0xe1
801066ea:	e9 1f f2 ff ff       	jmp    8010590e <alltraps>

801066ef <vector226>:
801066ef:	6a 00                	push   $0x0
801066f1:	68 e2 00 00 00       	push   $0xe2
801066f6:	e9 13 f2 ff ff       	jmp    8010590e <alltraps>

801066fb <vector227>:
801066fb:	6a 00                	push   $0x0
801066fd:	68 e3 00 00 00       	push   $0xe3
80106702:	e9 07 f2 ff ff       	jmp    8010590e <alltraps>

80106707 <vector228>:
80106707:	6a 00                	push   $0x0
80106709:	68 e4 00 00 00       	push   $0xe4
8010670e:	e9 fb f1 ff ff       	jmp    8010590e <alltraps>

80106713 <vector229>:
80106713:	6a 00                	push   $0x0
80106715:	68 e5 00 00 00       	push   $0xe5
8010671a:	e9 ef f1 ff ff       	jmp    8010590e <alltraps>

8010671f <vector230>:
8010671f:	6a 00                	push   $0x0
80106721:	68 e6 00 00 00       	push   $0xe6
80106726:	e9 e3 f1 ff ff       	jmp    8010590e <alltraps>

8010672b <vector231>:
8010672b:	6a 00                	push   $0x0
8010672d:	68 e7 00 00 00       	push   $0xe7
80106732:	e9 d7 f1 ff ff       	jmp    8010590e <alltraps>

80106737 <vector232>:
80106737:	6a 00                	push   $0x0
80106739:	68 e8 00 00 00       	push   $0xe8
8010673e:	e9 cb f1 ff ff       	jmp    8010590e <alltraps>

80106743 <vector233>:
80106743:	6a 00                	push   $0x0
80106745:	68 e9 00 00 00       	push   $0xe9
8010674a:	e9 bf f1 ff ff       	jmp    8010590e <alltraps>

8010674f <vector234>:
8010674f:	6a 00                	push   $0x0
80106751:	68 ea 00 00 00       	push   $0xea
80106756:	e9 b3 f1 ff ff       	jmp    8010590e <alltraps>

8010675b <vector235>:
8010675b:	6a 00                	push   $0x0
8010675d:	68 eb 00 00 00       	push   $0xeb
80106762:	e9 a7 f1 ff ff       	jmp    8010590e <alltraps>

80106767 <vector236>:
80106767:	6a 00                	push   $0x0
80106769:	68 ec 00 00 00       	push   $0xec
8010676e:	e9 9b f1 ff ff       	jmp    8010590e <alltraps>

80106773 <vector237>:
80106773:	6a 00                	push   $0x0
80106775:	68 ed 00 00 00       	push   $0xed
8010677a:	e9 8f f1 ff ff       	jmp    8010590e <alltraps>

8010677f <vector238>:
8010677f:	6a 00                	push   $0x0
80106781:	68 ee 00 00 00       	push   $0xee
80106786:	e9 83 f1 ff ff       	jmp    8010590e <alltraps>

8010678b <vector239>:
8010678b:	6a 00                	push   $0x0
8010678d:	68 ef 00 00 00       	push   $0xef
80106792:	e9 77 f1 ff ff       	jmp    8010590e <alltraps>

80106797 <vector240>:
80106797:	6a 00                	push   $0x0
80106799:	68 f0 00 00 00       	push   $0xf0
8010679e:	e9 6b f1 ff ff       	jmp    8010590e <alltraps>

801067a3 <vector241>:
801067a3:	6a 00                	push   $0x0
801067a5:	68 f1 00 00 00       	push   $0xf1
801067aa:	e9 5f f1 ff ff       	jmp    8010590e <alltraps>

801067af <vector242>:
801067af:	6a 00                	push   $0x0
801067b1:	68 f2 00 00 00       	push   $0xf2
801067b6:	e9 53 f1 ff ff       	jmp    8010590e <alltraps>

801067bb <vector243>:
801067bb:	6a 00                	push   $0x0
801067bd:	68 f3 00 00 00       	push   $0xf3
801067c2:	e9 47 f1 ff ff       	jmp    8010590e <alltraps>

801067c7 <vector244>:
801067c7:	6a 00                	push   $0x0
801067c9:	68 f4 00 00 00       	push   $0xf4
801067ce:	e9 3b f1 ff ff       	jmp    8010590e <alltraps>

801067d3 <vector245>:
801067d3:	6a 00                	push   $0x0
801067d5:	68 f5 00 00 00       	push   $0xf5
801067da:	e9 2f f1 ff ff       	jmp    8010590e <alltraps>

801067df <vector246>:
801067df:	6a 00                	push   $0x0
801067e1:	68 f6 00 00 00       	push   $0xf6
801067e6:	e9 23 f1 ff ff       	jmp    8010590e <alltraps>

801067eb <vector247>:
801067eb:	6a 00                	push   $0x0
801067ed:	68 f7 00 00 00       	push   $0xf7
801067f2:	e9 17 f1 ff ff       	jmp    8010590e <alltraps>

801067f7 <vector248>:
801067f7:	6a 00                	push   $0x0
801067f9:	68 f8 00 00 00       	push   $0xf8
801067fe:	e9 0b f1 ff ff       	jmp    8010590e <alltraps>

80106803 <vector249>:
80106803:	6a 00                	push   $0x0
80106805:	68 f9 00 00 00       	push   $0xf9
8010680a:	e9 ff f0 ff ff       	jmp    8010590e <alltraps>

8010680f <vector250>:
8010680f:	6a 00                	push   $0x0
80106811:	68 fa 00 00 00       	push   $0xfa
80106816:	e9 f3 f0 ff ff       	jmp    8010590e <alltraps>

8010681b <vector251>:
8010681b:	6a 00                	push   $0x0
8010681d:	68 fb 00 00 00       	push   $0xfb
80106822:	e9 e7 f0 ff ff       	jmp    8010590e <alltraps>

80106827 <vector252>:
80106827:	6a 00                	push   $0x0
80106829:	68 fc 00 00 00       	push   $0xfc
8010682e:	e9 db f0 ff ff       	jmp    8010590e <alltraps>

80106833 <vector253>:
80106833:	6a 00                	push   $0x0
80106835:	68 fd 00 00 00       	push   $0xfd
8010683a:	e9 cf f0 ff ff       	jmp    8010590e <alltraps>

8010683f <vector254>:
8010683f:	6a 00                	push   $0x0
80106841:	68 fe 00 00 00       	push   $0xfe
80106846:	e9 c3 f0 ff ff       	jmp    8010590e <alltraps>

8010684b <vector255>:
8010684b:	6a 00                	push   $0x0
8010684d:	68 ff 00 00 00       	push   $0xff
80106852:	e9 b7 f0 ff ff       	jmp    8010590e <alltraps>
80106857:	66 90                	xchg   %ax,%ax
80106859:	66 90                	xchg   %ax,%ax
8010685b:	66 90                	xchg   %ax,%ax
8010685d:	66 90                	xchg   %ax,%ax
8010685f:	90                   	nop

80106860 <walkpgdir>:
80106860:	55                   	push   %ebp
80106861:	89 e5                	mov    %esp,%ebp
80106863:	57                   	push   %edi
80106864:	56                   	push   %esi
80106865:	53                   	push   %ebx
80106866:	89 d3                	mov    %edx,%ebx
80106868:	c1 ea 16             	shr    $0x16,%edx
8010686b:	8d 3c 90             	lea    (%eax,%edx,4),%edi
8010686e:	83 ec 0c             	sub    $0xc,%esp
80106871:	8b 07                	mov    (%edi),%eax
80106873:	a8 01                	test   $0x1,%al
80106875:	74 29                	je     801068a0 <walkpgdir+0x40>
80106877:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010687c:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
80106882:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106885:	c1 eb 0a             	shr    $0xa,%ebx
80106888:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
8010688e:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
80106891:	5b                   	pop    %ebx
80106892:	5e                   	pop    %esi
80106893:	5f                   	pop    %edi
80106894:	5d                   	pop    %ebp
80106895:	c3                   	ret    
80106896:	8d 76 00             	lea    0x0(%esi),%esi
80106899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801068a0:	85 c9                	test   %ecx,%ecx
801068a2:	74 2c                	je     801068d0 <walkpgdir+0x70>
801068a4:	e8 c7 bb ff ff       	call   80102470 <kalloc>
801068a9:	85 c0                	test   %eax,%eax
801068ab:	89 c6                	mov    %eax,%esi
801068ad:	74 21                	je     801068d0 <walkpgdir+0x70>
801068af:	83 ec 04             	sub    $0x4,%esp
801068b2:	68 00 10 00 00       	push   $0x1000
801068b7:	6a 00                	push   $0x0
801068b9:	50                   	push   %eax
801068ba:	e8 d1 dd ff ff       	call   80104690 <memset>
801068bf:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
801068c5:	83 c4 10             	add    $0x10,%esp
801068c8:	83 c8 07             	or     $0x7,%eax
801068cb:	89 07                	mov    %eax,(%edi)
801068cd:	eb b3                	jmp    80106882 <walkpgdir+0x22>
801068cf:	90                   	nop
801068d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801068d3:	31 c0                	xor    %eax,%eax
801068d5:	5b                   	pop    %ebx
801068d6:	5e                   	pop    %esi
801068d7:	5f                   	pop    %edi
801068d8:	5d                   	pop    %ebp
801068d9:	c3                   	ret    
801068da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801068e0 <mappages>:
801068e0:	55                   	push   %ebp
801068e1:	89 e5                	mov    %esp,%ebp
801068e3:	57                   	push   %edi
801068e4:	56                   	push   %esi
801068e5:	53                   	push   %ebx
801068e6:	89 d3                	mov    %edx,%ebx
801068e8:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801068ee:	83 ec 1c             	sub    $0x1c,%esp
801068f1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801068f4:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
801068f8:	8b 7d 08             	mov    0x8(%ebp),%edi
801068fb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106900:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106903:	8b 45 0c             	mov    0xc(%ebp),%eax
80106906:	29 df                	sub    %ebx,%edi
80106908:	83 c8 01             	or     $0x1,%eax
8010690b:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010690e:	eb 15                	jmp    80106925 <mappages+0x45>
80106910:	f6 00 01             	testb  $0x1,(%eax)
80106913:	75 45                	jne    8010695a <mappages+0x7a>
80106915:	0b 75 dc             	or     -0x24(%ebp),%esi
80106918:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
8010691b:	89 30                	mov    %esi,(%eax)
8010691d:	74 31                	je     80106950 <mappages+0x70>
8010691f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106925:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106928:	b9 01 00 00 00       	mov    $0x1,%ecx
8010692d:	89 da                	mov    %ebx,%edx
8010692f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106932:	e8 29 ff ff ff       	call   80106860 <walkpgdir>
80106937:	85 c0                	test   %eax,%eax
80106939:	75 d5                	jne    80106910 <mappages+0x30>
8010693b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010693e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106943:	5b                   	pop    %ebx
80106944:	5e                   	pop    %esi
80106945:	5f                   	pop    %edi
80106946:	5d                   	pop    %ebp
80106947:	c3                   	ret    
80106948:	90                   	nop
80106949:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106950:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106953:	31 c0                	xor    %eax,%eax
80106955:	5b                   	pop    %ebx
80106956:	5e                   	pop    %esi
80106957:	5f                   	pop    %edi
80106958:	5d                   	pop    %ebp
80106959:	c3                   	ret    
8010695a:	83 ec 0c             	sub    $0xc,%esp
8010695d:	68 f0 7a 10 80       	push   $0x80107af0
80106962:	e8 09 9a ff ff       	call   80100370 <panic>
80106967:	89 f6                	mov    %esi,%esi
80106969:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106970 <deallocuvm.part.0>:
80106970:	55                   	push   %ebp
80106971:	89 e5                	mov    %esp,%ebp
80106973:	57                   	push   %edi
80106974:	56                   	push   %esi
80106975:	53                   	push   %ebx
80106976:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
8010697c:	89 c7                	mov    %eax,%edi
8010697e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106984:	83 ec 1c             	sub    $0x1c,%esp
80106987:	89 4d e0             	mov    %ecx,-0x20(%ebp)
8010698a:	39 d3                	cmp    %edx,%ebx
8010698c:	73 66                	jae    801069f4 <deallocuvm.part.0+0x84>
8010698e:	89 d6                	mov    %edx,%esi
80106990:	eb 3d                	jmp    801069cf <deallocuvm.part.0+0x5f>
80106992:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106998:	8b 10                	mov    (%eax),%edx
8010699a:	f6 c2 01             	test   $0x1,%dl
8010699d:	74 26                	je     801069c5 <deallocuvm.part.0+0x55>
8010699f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
801069a5:	74 58                	je     801069ff <deallocuvm.part.0+0x8f>
801069a7:	83 ec 0c             	sub    $0xc,%esp
801069aa:	81 c2 00 00 00 80    	add    $0x80000000,%edx
801069b0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801069b3:	52                   	push   %edx
801069b4:	e8 07 b9 ff ff       	call   801022c0 <kfree>
801069b9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801069bc:	83 c4 10             	add    $0x10,%esp
801069bf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801069c5:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801069cb:	39 f3                	cmp    %esi,%ebx
801069cd:	73 25                	jae    801069f4 <deallocuvm.part.0+0x84>
801069cf:	31 c9                	xor    %ecx,%ecx
801069d1:	89 da                	mov    %ebx,%edx
801069d3:	89 f8                	mov    %edi,%eax
801069d5:	e8 86 fe ff ff       	call   80106860 <walkpgdir>
801069da:	85 c0                	test   %eax,%eax
801069dc:	75 ba                	jne    80106998 <deallocuvm.part.0+0x28>
801069de:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
801069e4:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
801069ea:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801069f0:	39 f3                	cmp    %esi,%ebx
801069f2:	72 db                	jb     801069cf <deallocuvm.part.0+0x5f>
801069f4:	8b 45 e0             	mov    -0x20(%ebp),%eax
801069f7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801069fa:	5b                   	pop    %ebx
801069fb:	5e                   	pop    %esi
801069fc:	5f                   	pop    %edi
801069fd:	5d                   	pop    %ebp
801069fe:	c3                   	ret    
801069ff:	83 ec 0c             	sub    $0xc,%esp
80106a02:	68 32 74 10 80       	push   $0x80107432
80106a07:	e8 64 99 ff ff       	call   80100370 <panic>
80106a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106a10 <seginit>:
80106a10:	55                   	push   %ebp
80106a11:	89 e5                	mov    %esp,%ebp
80106a13:	53                   	push   %ebx
80106a14:	31 db                	xor    %ebx,%ebx
80106a16:	83 ec 14             	sub    $0x14,%esp
80106a19:	e8 b2 bc ff ff       	call   801026d0 <cpunum>
80106a1e:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80106a24:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80106a29:	8d 90 a0 27 11 80    	lea    -0x7feed860(%eax),%edx
80106a2f:	c6 80 1d 28 11 80 9a 	movb   $0x9a,-0x7feed7e3(%eax)
80106a36:	c6 80 1e 28 11 80 cf 	movb   $0xcf,-0x7feed7e2(%eax)
80106a3d:	c6 80 25 28 11 80 92 	movb   $0x92,-0x7feed7db(%eax)
80106a44:	c6 80 26 28 11 80 cf 	movb   $0xcf,-0x7feed7da(%eax)
80106a4b:	66 89 4a 78          	mov    %cx,0x78(%edx)
80106a4f:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80106a54:	66 89 5a 7a          	mov    %bx,0x7a(%edx)
80106a58:	66 89 8a 80 00 00 00 	mov    %cx,0x80(%edx)
80106a5f:	31 db                	xor    %ebx,%ebx
80106a61:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80106a66:	66 89 9a 82 00 00 00 	mov    %bx,0x82(%edx)
80106a6d:	66 89 8a 90 00 00 00 	mov    %cx,0x90(%edx)
80106a74:	31 db                	xor    %ebx,%ebx
80106a76:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80106a7b:	66 89 9a 92 00 00 00 	mov    %bx,0x92(%edx)
80106a82:	31 db                	xor    %ebx,%ebx
80106a84:	66 89 8a 98 00 00 00 	mov    %cx,0x98(%edx)
80106a8b:	8d 88 54 28 11 80    	lea    -0x7feed7ac(%eax),%ecx
80106a91:	66 89 9a 9a 00 00 00 	mov    %bx,0x9a(%edx)
80106a98:	31 db                	xor    %ebx,%ebx
80106a9a:	c6 80 35 28 11 80 fa 	movb   $0xfa,-0x7feed7cb(%eax)
80106aa1:	c6 80 36 28 11 80 cf 	movb   $0xcf,-0x7feed7ca(%eax)
80106aa8:	66 89 9a 88 00 00 00 	mov    %bx,0x88(%edx)
80106aaf:	66 89 8a 8a 00 00 00 	mov    %cx,0x8a(%edx)
80106ab6:	89 cb                	mov    %ecx,%ebx
80106ab8:	c1 e9 18             	shr    $0x18,%ecx
80106abb:	c6 80 3d 28 11 80 f2 	movb   $0xf2,-0x7feed7c3(%eax)
80106ac2:	c6 80 3e 28 11 80 cf 	movb   $0xcf,-0x7feed7c2(%eax)
80106ac9:	88 8a 8f 00 00 00    	mov    %cl,0x8f(%edx)
80106acf:	c6 80 2d 28 11 80 92 	movb   $0x92,-0x7feed7d3(%eax)
80106ad6:	b9 37 00 00 00       	mov    $0x37,%ecx
80106adb:	c6 80 2e 28 11 80 c0 	movb   $0xc0,-0x7feed7d2(%eax)
80106ae2:	05 10 28 11 80       	add    $0x80112810,%eax
80106ae7:	66 89 4d f2          	mov    %cx,-0xe(%ebp)
80106aeb:	c1 eb 10             	shr    $0x10,%ebx
80106aee:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
80106af2:	c1 e8 10             	shr    $0x10,%eax
80106af5:	c6 42 7c 00          	movb   $0x0,0x7c(%edx)
80106af9:	c6 42 7f 00          	movb   $0x0,0x7f(%edx)
80106afd:	c6 82 84 00 00 00 00 	movb   $0x0,0x84(%edx)
80106b04:	c6 82 87 00 00 00 00 	movb   $0x0,0x87(%edx)
80106b0b:	c6 82 94 00 00 00 00 	movb   $0x0,0x94(%edx)
80106b12:	c6 82 97 00 00 00 00 	movb   $0x0,0x97(%edx)
80106b19:	c6 82 9c 00 00 00 00 	movb   $0x0,0x9c(%edx)
80106b20:	c6 82 9f 00 00 00 00 	movb   $0x0,0x9f(%edx)
80106b27:	88 9a 8c 00 00 00    	mov    %bl,0x8c(%edx)
80106b2d:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
80106b31:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106b34:	0f 01 10             	lgdtl  (%eax)
80106b37:	b8 18 00 00 00       	mov    $0x18,%eax
80106b3c:	8e e8                	mov    %eax,%gs
80106b3e:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80106b45:	00 00 00 00 
80106b49:	65 89 15 00 00 00 00 	mov    %edx,%gs:0x0
80106b50:	83 c4 14             	add    $0x14,%esp
80106b53:	5b                   	pop    %ebx
80106b54:	5d                   	pop    %ebp
80106b55:	c3                   	ret    
80106b56:	8d 76 00             	lea    0x0(%esi),%esi
80106b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106b60 <setupkvm>:
80106b60:	55                   	push   %ebp
80106b61:	89 e5                	mov    %esp,%ebp
80106b63:	56                   	push   %esi
80106b64:	53                   	push   %ebx
80106b65:	e8 06 b9 ff ff       	call   80102470 <kalloc>
80106b6a:	85 c0                	test   %eax,%eax
80106b6c:	74 52                	je     80106bc0 <setupkvm+0x60>
80106b6e:	83 ec 04             	sub    $0x4,%esp
80106b71:	89 c6                	mov    %eax,%esi
80106b73:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
80106b78:	68 00 10 00 00       	push   $0x1000
80106b7d:	6a 00                	push   $0x0
80106b7f:	50                   	push   %eax
80106b80:	e8 0b db ff ff       	call   80104690 <memset>
80106b85:	83 c4 10             	add    $0x10,%esp
80106b88:	8b 43 04             	mov    0x4(%ebx),%eax
80106b8b:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106b8e:	83 ec 08             	sub    $0x8,%esp
80106b91:	8b 13                	mov    (%ebx),%edx
80106b93:	ff 73 0c             	pushl  0xc(%ebx)
80106b96:	50                   	push   %eax
80106b97:	29 c1                	sub    %eax,%ecx
80106b99:	89 f0                	mov    %esi,%eax
80106b9b:	e8 40 fd ff ff       	call   801068e0 <mappages>
80106ba0:	83 c4 10             	add    $0x10,%esp
80106ba3:	85 c0                	test   %eax,%eax
80106ba5:	78 19                	js     80106bc0 <setupkvm+0x60>
80106ba7:	83 c3 10             	add    $0x10,%ebx
80106baa:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106bb0:	75 d6                	jne    80106b88 <setupkvm+0x28>
80106bb2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106bb5:	89 f0                	mov    %esi,%eax
80106bb7:	5b                   	pop    %ebx
80106bb8:	5e                   	pop    %esi
80106bb9:	5d                   	pop    %ebp
80106bba:	c3                   	ret    
80106bbb:	90                   	nop
80106bbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106bc0:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106bc3:	31 c0                	xor    %eax,%eax
80106bc5:	5b                   	pop    %ebx
80106bc6:	5e                   	pop    %esi
80106bc7:	5d                   	pop    %ebp
80106bc8:	c3                   	ret    
80106bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106bd0 <kvmalloc>:
80106bd0:	55                   	push   %ebp
80106bd1:	89 e5                	mov    %esp,%ebp
80106bd3:	83 ec 08             	sub    $0x8,%esp
80106bd6:	e8 85 ff ff ff       	call   80106b60 <setupkvm>
80106bdb:	a3 e4 50 11 80       	mov    %eax,0x801150e4
80106be0:	05 00 00 00 80       	add    $0x80000000,%eax
80106be5:	0f 22 d8             	mov    %eax,%cr3
80106be8:	c9                   	leave  
80106be9:	c3                   	ret    
80106bea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106bf0 <switchkvm>:
80106bf0:	a1 e4 50 11 80       	mov    0x801150e4,%eax
80106bf5:	55                   	push   %ebp
80106bf6:	89 e5                	mov    %esp,%ebp
80106bf8:	05 00 00 00 80       	add    $0x80000000,%eax
80106bfd:	0f 22 d8             	mov    %eax,%cr3
80106c00:	5d                   	pop    %ebp
80106c01:	c3                   	ret    
80106c02:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106c10 <switchuvm>:
80106c10:	55                   	push   %ebp
80106c11:	89 e5                	mov    %esp,%ebp
80106c13:	53                   	push   %ebx
80106c14:	83 ec 04             	sub    $0x4,%esp
80106c17:	8b 5d 08             	mov    0x8(%ebp),%ebx
80106c1a:	85 db                	test   %ebx,%ebx
80106c1c:	0f 84 93 00 00 00    	je     80106cb5 <switchuvm+0xa5>
80106c22:	8b 43 08             	mov    0x8(%ebx),%eax
80106c25:	85 c0                	test   %eax,%eax
80106c27:	0f 84 a2 00 00 00    	je     80106ccf <switchuvm+0xbf>
80106c2d:	8b 43 04             	mov    0x4(%ebx),%eax
80106c30:	85 c0                	test   %eax,%eax
80106c32:	0f 84 8a 00 00 00    	je     80106cc2 <switchuvm+0xb2>
80106c38:	e8 83 d9 ff ff       	call   801045c0 <pushcli>
80106c3d:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80106c43:	b9 67 00 00 00       	mov    $0x67,%ecx
80106c48:	8d 50 08             	lea    0x8(%eax),%edx
80106c4b:	66 89 88 a0 00 00 00 	mov    %cx,0xa0(%eax)
80106c52:	c6 80 a6 00 00 00 40 	movb   $0x40,0xa6(%eax)
80106c59:	c6 80 a5 00 00 00 89 	movb   $0x89,0xa5(%eax)
80106c60:	66 89 90 a2 00 00 00 	mov    %dx,0xa2(%eax)
80106c67:	89 d1                	mov    %edx,%ecx
80106c69:	c1 ea 18             	shr    $0x18,%edx
80106c6c:	88 90 a7 00 00 00    	mov    %dl,0xa7(%eax)
80106c72:	c1 e9 10             	shr    $0x10,%ecx
80106c75:	ba 10 00 00 00       	mov    $0x10,%edx
80106c7a:	66 89 50 10          	mov    %dx,0x10(%eax)
80106c7e:	88 88 a4 00 00 00    	mov    %cl,0xa4(%eax)
80106c84:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106c87:	8d 91 00 10 00 00    	lea    0x1000(%ecx),%edx
80106c8d:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80106c92:	66 89 48 6e          	mov    %cx,0x6e(%eax)
80106c96:	89 50 0c             	mov    %edx,0xc(%eax)
80106c99:	b8 30 00 00 00       	mov    $0x30,%eax
80106c9e:	0f 00 d8             	ltr    %ax
80106ca1:	8b 43 04             	mov    0x4(%ebx),%eax
80106ca4:	05 00 00 00 80       	add    $0x80000000,%eax
80106ca9:	0f 22 d8             	mov    %eax,%cr3
80106cac:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80106caf:	c9                   	leave  
80106cb0:	e9 3b d9 ff ff       	jmp    801045f0 <popcli>
80106cb5:	83 ec 0c             	sub    $0xc,%esp
80106cb8:	68 f6 7a 10 80       	push   $0x80107af6
80106cbd:	e8 ae 96 ff ff       	call   80100370 <panic>
80106cc2:	83 ec 0c             	sub    $0xc,%esp
80106cc5:	68 21 7b 10 80       	push   $0x80107b21
80106cca:	e8 a1 96 ff ff       	call   80100370 <panic>
80106ccf:	83 ec 0c             	sub    $0xc,%esp
80106cd2:	68 0c 7b 10 80       	push   $0x80107b0c
80106cd7:	e8 94 96 ff ff       	call   80100370 <panic>
80106cdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106ce0 <inituvm>:
80106ce0:	55                   	push   %ebp
80106ce1:	89 e5                	mov    %esp,%ebp
80106ce3:	57                   	push   %edi
80106ce4:	56                   	push   %esi
80106ce5:	53                   	push   %ebx
80106ce6:	83 ec 1c             	sub    $0x1c,%esp
80106ce9:	8b 75 10             	mov    0x10(%ebp),%esi
80106cec:	8b 45 08             	mov    0x8(%ebp),%eax
80106cef:	8b 7d 0c             	mov    0xc(%ebp),%edi
80106cf2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106cf8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106cfb:	77 49                	ja     80106d46 <inituvm+0x66>
80106cfd:	e8 6e b7 ff ff       	call   80102470 <kalloc>
80106d02:	83 ec 04             	sub    $0x4,%esp
80106d05:	89 c3                	mov    %eax,%ebx
80106d07:	68 00 10 00 00       	push   $0x1000
80106d0c:	6a 00                	push   $0x0
80106d0e:	50                   	push   %eax
80106d0f:	e8 7c d9 ff ff       	call   80104690 <memset>
80106d14:	58                   	pop    %eax
80106d15:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106d1b:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106d20:	5a                   	pop    %edx
80106d21:	6a 06                	push   $0x6
80106d23:	50                   	push   %eax
80106d24:	31 d2                	xor    %edx,%edx
80106d26:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106d29:	e8 b2 fb ff ff       	call   801068e0 <mappages>
80106d2e:	89 75 10             	mov    %esi,0x10(%ebp)
80106d31:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106d34:	83 c4 10             	add    $0x10,%esp
80106d37:	89 5d 08             	mov    %ebx,0x8(%ebp)
80106d3a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d3d:	5b                   	pop    %ebx
80106d3e:	5e                   	pop    %esi
80106d3f:	5f                   	pop    %edi
80106d40:	5d                   	pop    %ebp
80106d41:	e9 fa d9 ff ff       	jmp    80104740 <memmove>
80106d46:	83 ec 0c             	sub    $0xc,%esp
80106d49:	68 35 7b 10 80       	push   $0x80107b35
80106d4e:	e8 1d 96 ff ff       	call   80100370 <panic>
80106d53:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106d60 <loaduvm>:
80106d60:	55                   	push   %ebp
80106d61:	89 e5                	mov    %esp,%ebp
80106d63:	57                   	push   %edi
80106d64:	56                   	push   %esi
80106d65:	53                   	push   %ebx
80106d66:	83 ec 0c             	sub    $0xc,%esp
80106d69:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106d70:	0f 85 91 00 00 00    	jne    80106e07 <loaduvm+0xa7>
80106d76:	8b 75 18             	mov    0x18(%ebp),%esi
80106d79:	31 db                	xor    %ebx,%ebx
80106d7b:	85 f6                	test   %esi,%esi
80106d7d:	75 1a                	jne    80106d99 <loaduvm+0x39>
80106d7f:	eb 6f                	jmp    80106df0 <loaduvm+0x90>
80106d81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106d88:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106d8e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106d94:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106d97:	76 57                	jbe    80106df0 <loaduvm+0x90>
80106d99:	8b 55 0c             	mov    0xc(%ebp),%edx
80106d9c:	8b 45 08             	mov    0x8(%ebp),%eax
80106d9f:	31 c9                	xor    %ecx,%ecx
80106da1:	01 da                	add    %ebx,%edx
80106da3:	e8 b8 fa ff ff       	call   80106860 <walkpgdir>
80106da8:	85 c0                	test   %eax,%eax
80106daa:	74 4e                	je     80106dfa <loaduvm+0x9a>
80106dac:	8b 00                	mov    (%eax),%eax
80106dae:	8b 4d 14             	mov    0x14(%ebp),%ecx
80106db1:	bf 00 10 00 00       	mov    $0x1000,%edi
80106db6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106dbb:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106dc1:	0f 46 fe             	cmovbe %esi,%edi
80106dc4:	01 d9                	add    %ebx,%ecx
80106dc6:	05 00 00 00 80       	add    $0x80000000,%eax
80106dcb:	57                   	push   %edi
80106dcc:	51                   	push   %ecx
80106dcd:	50                   	push   %eax
80106dce:	ff 75 10             	pushl  0x10(%ebp)
80106dd1:	e8 3a ab ff ff       	call   80101910 <readi>
80106dd6:	83 c4 10             	add    $0x10,%esp
80106dd9:	39 c7                	cmp    %eax,%edi
80106ddb:	74 ab                	je     80106d88 <loaduvm+0x28>
80106ddd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106de0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106de5:	5b                   	pop    %ebx
80106de6:	5e                   	pop    %esi
80106de7:	5f                   	pop    %edi
80106de8:	5d                   	pop    %ebp
80106de9:	c3                   	ret    
80106dea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106df0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106df3:	31 c0                	xor    %eax,%eax
80106df5:	5b                   	pop    %ebx
80106df6:	5e                   	pop    %esi
80106df7:	5f                   	pop    %edi
80106df8:	5d                   	pop    %ebp
80106df9:	c3                   	ret    
80106dfa:	83 ec 0c             	sub    $0xc,%esp
80106dfd:	68 4f 7b 10 80       	push   $0x80107b4f
80106e02:	e8 69 95 ff ff       	call   80100370 <panic>
80106e07:	83 ec 0c             	sub    $0xc,%esp
80106e0a:	68 f0 7b 10 80       	push   $0x80107bf0
80106e0f:	e8 5c 95 ff ff       	call   80100370 <panic>
80106e14:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106e1a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106e20 <allocuvm>:
80106e20:	55                   	push   %ebp
80106e21:	89 e5                	mov    %esp,%ebp
80106e23:	57                   	push   %edi
80106e24:	56                   	push   %esi
80106e25:	53                   	push   %ebx
80106e26:	83 ec 0c             	sub    $0xc,%esp
80106e29:	8b 7d 10             	mov    0x10(%ebp),%edi
80106e2c:	85 ff                	test   %edi,%edi
80106e2e:	0f 88 ca 00 00 00    	js     80106efe <allocuvm+0xde>
80106e34:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106e37:	8b 45 0c             	mov    0xc(%ebp),%eax
80106e3a:	0f 82 82 00 00 00    	jb     80106ec2 <allocuvm+0xa2>
80106e40:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106e46:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106e4c:	39 df                	cmp    %ebx,%edi
80106e4e:	77 43                	ja     80106e93 <allocuvm+0x73>
80106e50:	e9 bb 00 00 00       	jmp    80106f10 <allocuvm+0xf0>
80106e55:	8d 76 00             	lea    0x0(%esi),%esi
80106e58:	83 ec 04             	sub    $0x4,%esp
80106e5b:	68 00 10 00 00       	push   $0x1000
80106e60:	6a 00                	push   $0x0
80106e62:	50                   	push   %eax
80106e63:	e8 28 d8 ff ff       	call   80104690 <memset>
80106e68:	58                   	pop    %eax
80106e69:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106e6f:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106e74:	5a                   	pop    %edx
80106e75:	6a 06                	push   $0x6
80106e77:	50                   	push   %eax
80106e78:	89 da                	mov    %ebx,%edx
80106e7a:	8b 45 08             	mov    0x8(%ebp),%eax
80106e7d:	e8 5e fa ff ff       	call   801068e0 <mappages>
80106e82:	83 c4 10             	add    $0x10,%esp
80106e85:	85 c0                	test   %eax,%eax
80106e87:	78 47                	js     80106ed0 <allocuvm+0xb0>
80106e89:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106e8f:	39 df                	cmp    %ebx,%edi
80106e91:	76 7d                	jbe    80106f10 <allocuvm+0xf0>
80106e93:	e8 d8 b5 ff ff       	call   80102470 <kalloc>
80106e98:	85 c0                	test   %eax,%eax
80106e9a:	89 c6                	mov    %eax,%esi
80106e9c:	75 ba                	jne    80106e58 <allocuvm+0x38>
80106e9e:	83 ec 0c             	sub    $0xc,%esp
80106ea1:	68 6d 7b 10 80       	push   $0x80107b6d
80106ea6:	e8 b5 97 ff ff       	call   80100660 <cprintf>
80106eab:	83 c4 10             	add    $0x10,%esp
80106eae:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106eb1:	76 4b                	jbe    80106efe <allocuvm+0xde>
80106eb3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106eb6:	8b 45 08             	mov    0x8(%ebp),%eax
80106eb9:	89 fa                	mov    %edi,%edx
80106ebb:	e8 b0 fa ff ff       	call   80106970 <deallocuvm.part.0>
80106ec0:	31 c0                	xor    %eax,%eax
80106ec2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ec5:	5b                   	pop    %ebx
80106ec6:	5e                   	pop    %esi
80106ec7:	5f                   	pop    %edi
80106ec8:	5d                   	pop    %ebp
80106ec9:	c3                   	ret    
80106eca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106ed0:	83 ec 0c             	sub    $0xc,%esp
80106ed3:	68 85 7b 10 80       	push   $0x80107b85
80106ed8:	e8 83 97 ff ff       	call   80100660 <cprintf>
80106edd:	83 c4 10             	add    $0x10,%esp
80106ee0:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106ee3:	76 0d                	jbe    80106ef2 <allocuvm+0xd2>
80106ee5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106ee8:	8b 45 08             	mov    0x8(%ebp),%eax
80106eeb:	89 fa                	mov    %edi,%edx
80106eed:	e8 7e fa ff ff       	call   80106970 <deallocuvm.part.0>
80106ef2:	83 ec 0c             	sub    $0xc,%esp
80106ef5:	56                   	push   %esi
80106ef6:	e8 c5 b3 ff ff       	call   801022c0 <kfree>
80106efb:	83 c4 10             	add    $0x10,%esp
80106efe:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f01:	31 c0                	xor    %eax,%eax
80106f03:	5b                   	pop    %ebx
80106f04:	5e                   	pop    %esi
80106f05:	5f                   	pop    %edi
80106f06:	5d                   	pop    %ebp
80106f07:	c3                   	ret    
80106f08:	90                   	nop
80106f09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106f10:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f13:	89 f8                	mov    %edi,%eax
80106f15:	5b                   	pop    %ebx
80106f16:	5e                   	pop    %esi
80106f17:	5f                   	pop    %edi
80106f18:	5d                   	pop    %ebp
80106f19:	c3                   	ret    
80106f1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106f20 <deallocuvm>:
80106f20:	55                   	push   %ebp
80106f21:	89 e5                	mov    %esp,%ebp
80106f23:	8b 55 0c             	mov    0xc(%ebp),%edx
80106f26:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106f29:	8b 45 08             	mov    0x8(%ebp),%eax
80106f2c:	39 d1                	cmp    %edx,%ecx
80106f2e:	73 10                	jae    80106f40 <deallocuvm+0x20>
80106f30:	5d                   	pop    %ebp
80106f31:	e9 3a fa ff ff       	jmp    80106970 <deallocuvm.part.0>
80106f36:	8d 76 00             	lea    0x0(%esi),%esi
80106f39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106f40:	89 d0                	mov    %edx,%eax
80106f42:	5d                   	pop    %ebp
80106f43:	c3                   	ret    
80106f44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106f4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106f50 <freevm>:
80106f50:	55                   	push   %ebp
80106f51:	89 e5                	mov    %esp,%ebp
80106f53:	57                   	push   %edi
80106f54:	56                   	push   %esi
80106f55:	53                   	push   %ebx
80106f56:	83 ec 0c             	sub    $0xc,%esp
80106f59:	8b 75 08             	mov    0x8(%ebp),%esi
80106f5c:	85 f6                	test   %esi,%esi
80106f5e:	74 59                	je     80106fb9 <freevm+0x69>
80106f60:	31 c9                	xor    %ecx,%ecx
80106f62:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106f67:	89 f0                	mov    %esi,%eax
80106f69:	e8 02 fa ff ff       	call   80106970 <deallocuvm.part.0>
80106f6e:	89 f3                	mov    %esi,%ebx
80106f70:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106f76:	eb 0f                	jmp    80106f87 <freevm+0x37>
80106f78:	90                   	nop
80106f79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106f80:	83 c3 04             	add    $0x4,%ebx
80106f83:	39 fb                	cmp    %edi,%ebx
80106f85:	74 23                	je     80106faa <freevm+0x5a>
80106f87:	8b 03                	mov    (%ebx),%eax
80106f89:	a8 01                	test   $0x1,%al
80106f8b:	74 f3                	je     80106f80 <freevm+0x30>
80106f8d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106f92:	83 ec 0c             	sub    $0xc,%esp
80106f95:	83 c3 04             	add    $0x4,%ebx
80106f98:	05 00 00 00 80       	add    $0x80000000,%eax
80106f9d:	50                   	push   %eax
80106f9e:	e8 1d b3 ff ff       	call   801022c0 <kfree>
80106fa3:	83 c4 10             	add    $0x10,%esp
80106fa6:	39 fb                	cmp    %edi,%ebx
80106fa8:	75 dd                	jne    80106f87 <freevm+0x37>
80106faa:	89 75 08             	mov    %esi,0x8(%ebp)
80106fad:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106fb0:	5b                   	pop    %ebx
80106fb1:	5e                   	pop    %esi
80106fb2:	5f                   	pop    %edi
80106fb3:	5d                   	pop    %ebp
80106fb4:	e9 07 b3 ff ff       	jmp    801022c0 <kfree>
80106fb9:	83 ec 0c             	sub    $0xc,%esp
80106fbc:	68 a1 7b 10 80       	push   $0x80107ba1
80106fc1:	e8 aa 93 ff ff       	call   80100370 <panic>
80106fc6:	8d 76 00             	lea    0x0(%esi),%esi
80106fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106fd0 <clearpteu>:
80106fd0:	55                   	push   %ebp
80106fd1:	31 c9                	xor    %ecx,%ecx
80106fd3:	89 e5                	mov    %esp,%ebp
80106fd5:	83 ec 08             	sub    $0x8,%esp
80106fd8:	8b 55 0c             	mov    0xc(%ebp),%edx
80106fdb:	8b 45 08             	mov    0x8(%ebp),%eax
80106fde:	e8 7d f8 ff ff       	call   80106860 <walkpgdir>
80106fe3:	85 c0                	test   %eax,%eax
80106fe5:	74 05                	je     80106fec <clearpteu+0x1c>
80106fe7:	83 20 fb             	andl   $0xfffffffb,(%eax)
80106fea:	c9                   	leave  
80106feb:	c3                   	ret    
80106fec:	83 ec 0c             	sub    $0xc,%esp
80106fef:	68 b2 7b 10 80       	push   $0x80107bb2
80106ff4:	e8 77 93 ff ff       	call   80100370 <panic>
80106ff9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80107000 <copyuvm>:
80107000:	55                   	push   %ebp
80107001:	89 e5                	mov    %esp,%ebp
80107003:	57                   	push   %edi
80107004:	56                   	push   %esi
80107005:	53                   	push   %ebx
80107006:	83 ec 1c             	sub    $0x1c,%esp
80107009:	e8 52 fb ff ff       	call   80106b60 <setupkvm>
8010700e:	85 c0                	test   %eax,%eax
80107010:	89 45 e0             	mov    %eax,-0x20(%ebp)
80107013:	0f 84 b2 00 00 00    	je     801070cb <copyuvm+0xcb>
80107019:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010701c:	85 c9                	test   %ecx,%ecx
8010701e:	0f 84 9c 00 00 00    	je     801070c0 <copyuvm+0xc0>
80107024:	31 f6                	xor    %esi,%esi
80107026:	eb 4a                	jmp    80107072 <copyuvm+0x72>
80107028:	90                   	nop
80107029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107030:	83 ec 04             	sub    $0x4,%esp
80107033:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80107039:	68 00 10 00 00       	push   $0x1000
8010703e:	57                   	push   %edi
8010703f:	50                   	push   %eax
80107040:	e8 fb d6 ff ff       	call   80104740 <memmove>
80107045:	58                   	pop    %eax
80107046:	5a                   	pop    %edx
80107047:	8d 93 00 00 00 80    	lea    -0x80000000(%ebx),%edx
8010704d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80107050:	ff 75 e4             	pushl  -0x1c(%ebp)
80107053:	b9 00 10 00 00       	mov    $0x1000,%ecx
80107058:	52                   	push   %edx
80107059:	89 f2                	mov    %esi,%edx
8010705b:	e8 80 f8 ff ff       	call   801068e0 <mappages>
80107060:	83 c4 10             	add    $0x10,%esp
80107063:	85 c0                	test   %eax,%eax
80107065:	78 3e                	js     801070a5 <copyuvm+0xa5>
80107067:	81 c6 00 10 00 00    	add    $0x1000,%esi
8010706d:	39 75 0c             	cmp    %esi,0xc(%ebp)
80107070:	76 4e                	jbe    801070c0 <copyuvm+0xc0>
80107072:	8b 45 08             	mov    0x8(%ebp),%eax
80107075:	31 c9                	xor    %ecx,%ecx
80107077:	89 f2                	mov    %esi,%edx
80107079:	e8 e2 f7 ff ff       	call   80106860 <walkpgdir>
8010707e:	85 c0                	test   %eax,%eax
80107080:	74 5a                	je     801070dc <copyuvm+0xdc>
80107082:	8b 18                	mov    (%eax),%ebx
80107084:	f6 c3 01             	test   $0x1,%bl
80107087:	74 46                	je     801070cf <copyuvm+0xcf>
80107089:	89 df                	mov    %ebx,%edi
8010708b:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80107091:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80107094:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
8010709a:	e8 d1 b3 ff ff       	call   80102470 <kalloc>
8010709f:	85 c0                	test   %eax,%eax
801070a1:	89 c3                	mov    %eax,%ebx
801070a3:	75 8b                	jne    80107030 <copyuvm+0x30>
801070a5:	83 ec 0c             	sub    $0xc,%esp
801070a8:	ff 75 e0             	pushl  -0x20(%ebp)
801070ab:	e8 a0 fe ff ff       	call   80106f50 <freevm>
801070b0:	83 c4 10             	add    $0x10,%esp
801070b3:	31 c0                	xor    %eax,%eax
801070b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801070b8:	5b                   	pop    %ebx
801070b9:	5e                   	pop    %esi
801070ba:	5f                   	pop    %edi
801070bb:	5d                   	pop    %ebp
801070bc:	c3                   	ret    
801070bd:	8d 76 00             	lea    0x0(%esi),%esi
801070c0:	8b 45 e0             	mov    -0x20(%ebp),%eax
801070c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801070c6:	5b                   	pop    %ebx
801070c7:	5e                   	pop    %esi
801070c8:	5f                   	pop    %edi
801070c9:	5d                   	pop    %ebp
801070ca:	c3                   	ret    
801070cb:	31 c0                	xor    %eax,%eax
801070cd:	eb e6                	jmp    801070b5 <copyuvm+0xb5>
801070cf:	83 ec 0c             	sub    $0xc,%esp
801070d2:	68 d6 7b 10 80       	push   $0x80107bd6
801070d7:	e8 94 92 ff ff       	call   80100370 <panic>
801070dc:	83 ec 0c             	sub    $0xc,%esp
801070df:	68 bc 7b 10 80       	push   $0x80107bbc
801070e4:	e8 87 92 ff ff       	call   80100370 <panic>
801070e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801070f0 <uva2ka>:
801070f0:	55                   	push   %ebp
801070f1:	31 c9                	xor    %ecx,%ecx
801070f3:	89 e5                	mov    %esp,%ebp
801070f5:	83 ec 08             	sub    $0x8,%esp
801070f8:	8b 55 0c             	mov    0xc(%ebp),%edx
801070fb:	8b 45 08             	mov    0x8(%ebp),%eax
801070fe:	e8 5d f7 ff ff       	call   80106860 <walkpgdir>
80107103:	8b 00                	mov    (%eax),%eax
80107105:	89 c2                	mov    %eax,%edx
80107107:	83 e2 05             	and    $0x5,%edx
8010710a:	83 fa 05             	cmp    $0x5,%edx
8010710d:	75 11                	jne    80107120 <uva2ka+0x30>
8010710f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107114:	c9                   	leave  
80107115:	05 00 00 00 80       	add    $0x80000000,%eax
8010711a:	c3                   	ret    
8010711b:	90                   	nop
8010711c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107120:	31 c0                	xor    %eax,%eax
80107122:	c9                   	leave  
80107123:	c3                   	ret    
80107124:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010712a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107130 <copyout>:
80107130:	55                   	push   %ebp
80107131:	89 e5                	mov    %esp,%ebp
80107133:	57                   	push   %edi
80107134:	56                   	push   %esi
80107135:	53                   	push   %ebx
80107136:	83 ec 1c             	sub    $0x1c,%esp
80107139:	8b 5d 14             	mov    0x14(%ebp),%ebx
8010713c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010713f:	8b 7d 10             	mov    0x10(%ebp),%edi
80107142:	85 db                	test   %ebx,%ebx
80107144:	75 40                	jne    80107186 <copyout+0x56>
80107146:	eb 70                	jmp    801071b8 <copyout+0x88>
80107148:	90                   	nop
80107149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107150:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107153:	89 f1                	mov    %esi,%ecx
80107155:	29 d1                	sub    %edx,%ecx
80107157:	81 c1 00 10 00 00    	add    $0x1000,%ecx
8010715d:	39 d9                	cmp    %ebx,%ecx
8010715f:	0f 47 cb             	cmova  %ebx,%ecx
80107162:	29 f2                	sub    %esi,%edx
80107164:	83 ec 04             	sub    $0x4,%esp
80107167:	01 d0                	add    %edx,%eax
80107169:	51                   	push   %ecx
8010716a:	57                   	push   %edi
8010716b:	50                   	push   %eax
8010716c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010716f:	e8 cc d5 ff ff       	call   80104740 <memmove>
80107174:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80107177:	83 c4 10             	add    $0x10,%esp
8010717a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
80107180:	01 cf                	add    %ecx,%edi
80107182:	29 cb                	sub    %ecx,%ebx
80107184:	74 32                	je     801071b8 <copyout+0x88>
80107186:	89 d6                	mov    %edx,%esi
80107188:	83 ec 08             	sub    $0x8,%esp
8010718b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010718e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80107194:	56                   	push   %esi
80107195:	ff 75 08             	pushl  0x8(%ebp)
80107198:	e8 53 ff ff ff       	call   801070f0 <uva2ka>
8010719d:	83 c4 10             	add    $0x10,%esp
801071a0:	85 c0                	test   %eax,%eax
801071a2:	75 ac                	jne    80107150 <copyout+0x20>
801071a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
801071a7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801071ac:	5b                   	pop    %ebx
801071ad:	5e                   	pop    %esi
801071ae:	5f                   	pop    %edi
801071af:	5d                   	pop    %ebp
801071b0:	c3                   	ret    
801071b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801071b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801071bb:	31 c0                	xor    %eax,%eax
801071bd:	5b                   	pop    %ebx
801071be:	5e                   	pop    %esi
801071bf:	5f                   	pop    %edi
801071c0:	5d                   	pop    %ebp
801071c1:	c3                   	ret    
