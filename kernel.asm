
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
8010002d:	b8 a0 2e 10 80       	mov    $0x80102ea0,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100044:	bb 14 b6 10 80       	mov    $0x8010b614,%ebx
  struct buf head;
} bcache;

void
binit(void)
{
80100049:	83 ec 0c             	sub    $0xc,%esp
  struct buf *b;

  initlock(&bcache.lock, "bcache");
8010004c:	68 e0 72 10 80       	push   $0x801072e0
80100051:	68 e0 b5 10 80       	push   $0x8010b5e0
80100056:	e8 e5 44 00 00       	call   80104540 <initlock>

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
8010005b:	c7 05 2c fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd2c
80100062:	fc 10 80 
  bcache.head.next = &bcache.head;
80100065:	c7 05 30 fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd30
8010006c:	fc 10 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba dc fc 10 80       	mov    $0x8010fcdc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    b->next = bcache.head.next;
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
    b->prev = &bcache.head;
8010008b:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100092:	68 e7 72 10 80       	push   $0x801072e7
80100097:	50                   	push   %eax
80100098:	e8 93 43 00 00       	call   80104430 <initsleeplock>
    bcache.head.next->prev = b;
8010009d:	a1 30 fd 10 80       	mov    0x8010fd30,%eax

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
801000b0:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000b6:	3d dc fc 10 80       	cmp    $0x8010fcdc,%eax
801000bb:	75 c3                	jne    80100080 <binit+0x40>
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
}
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
static struct buf*
bget(uint dev, uint blockno)
{
  struct buf *b;

  acquire(&bcache.lock);
801000df:	68 e0 b5 10 80       	push   $0x8010b5e0
801000e4:	e8 77 44 00 00       	call   80104560 <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000e9:	8b 1d 30 fd 10 80    	mov    0x8010fd30,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
    if(b->dev == dev && b->blockno == blockno){
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
      b->refcnt++;
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  // Not cached; recycle some unused buffer and clean buffer
  // "clean" because B_DIRTY and not locked means log.c
  // hasn't yet committed the changes to the buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100120:	8b 1d 2c fd 10 80    	mov    0x8010fd2c,%ebx
80100126:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
      b->dev = dev;
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 e0 b5 10 80       	push   $0x8010b5e0
80100162:	e8 d9 45 00 00       	call   80104740 <release>
      acquiresleep(&b->lock);
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 fe 42 00 00       	call   80104470 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
bread(uint dev, uint blockno)
{
  struct buf *b;

  b = bget(dev, blockno);
  if(!(b->flags & B_VALID)) {
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
    iderw(b);
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 4d 1f 00 00       	call   801020d0 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
  }
  return b;
}
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
      release(&bcache.lock);
      acquiresleep(&b->lock);
      return b;
    }
  }
  panic("bget: no buffers");
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 ee 72 10 80       	push   $0x801072ee
80100198:	e8 d3 01 00 00       	call   80100370 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
}

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 5d 43 00 00       	call   80104510 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
  b->flags |= B_DIRTY;
  iderw(b);
801001c4:	e9 07 1f 00 00       	jmp    801020d0 <iderw>
// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 ff 72 10 80       	push   $0x801072ff
801001d1:	e8 9a 01 00 00       	call   80100370 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 1c 43 00 00       	call   80104510 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
    panic("brelse");

  releasesleep(&b->lock);
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 cc 42 00 00       	call   801044d0 <releasesleep>

  acquire(&bcache.lock);
80100204:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
8010020b:	e8 50 43 00 00       	call   80104560 <acquire>
  b->refcnt--;
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
  if (b->refcnt == 0) {
80100213:	83 c4 10             	add    $0x10,%esp
    panic("brelse");

  releasesleep(&b->lock);

  acquire(&bcache.lock);
  b->refcnt--;
80100216:	83 e8 01             	sub    $0x1,%eax
  if (b->refcnt == 0) {
80100219:	85 c0                	test   %eax,%eax
    panic("brelse");

  releasesleep(&b->lock);

  acquire(&bcache.lock);
  b->refcnt--;
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
  if (b->refcnt == 0) {
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
    // no one is waiting for it.
    b->next->prev = b->prev;
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
    b->prev->next = b->next;
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
80100232:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
    b->prev = &bcache.head;
80100237:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
  b->refcnt--;
  if (b->refcnt == 0) {
    // no one is waiting for it.
    b->next->prev = b->prev;
    b->prev->next = b->next;
    b->next = bcache.head.next;
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
80100241:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
80100249:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30
  }
  
  release(&bcache.lock);
8010024f:	c7 45 08 e0 b5 10 80 	movl   $0x8010b5e0,0x8(%ebp)
}
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
  
  release(&bcache.lock);
8010025c:	e9 df 44 00 00       	jmp    80104740 <release>
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("brelse");
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 06 73 10 80       	push   $0x80107306
80100269:	e8 02 01 00 00       	call   80100370 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010027f:	57                   	push   %edi
80100280:	e8 bb 14 00 00       	call   80101740 <iunlock>
  target = n;
  acquire(&cons.lock);
80100285:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028c:	e8 cf 42 00 00       	call   80104560 <acquire>
  while(n > 0){
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e 9a 00 00 00    	jle    8010033b <consoleread+0xcb>
    while(input.r == input.w){
801002a1:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801002a6:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801002ac:	74 24                	je     801002d2 <consoleread+0x62>
801002ae:	eb 58                	jmp    80100308 <consoleread+0x98>
      if(proc->killed){
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002b0:	83 ec 08             	sub    $0x8,%esp
801002b3:	68 20 a5 10 80       	push   $0x8010a520
801002b8:	68 c0 ff 10 80       	push   $0x8010ffc0
801002bd:	e8 1e 3c 00 00       	call   80103ee0 <sleep>

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
    while(input.r == input.w){
801002c2:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801002c7:	83 c4 10             	add    $0x10,%esp
801002ca:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801002d0:	75 36                	jne    80100308 <consoleread+0x98>
      if(proc->killed){
801002d2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801002d8:	8b 40 24             	mov    0x24(%eax),%eax
801002db:	85 c0                	test   %eax,%eax
801002dd:	74 d1                	je     801002b0 <consoleread+0x40>
        release(&cons.lock);
801002df:	83 ec 0c             	sub    $0xc,%esp
801002e2:	68 20 a5 10 80       	push   $0x8010a520
801002e7:	e8 54 44 00 00       	call   80104740 <release>
        ilock(ip);
801002ec:	89 3c 24             	mov    %edi,(%esp)
801002ef:	e8 6c 13 00 00       	call   80101660 <ilock>
        return -1;
801002f4:	83 c4 10             	add    $0x10,%esp
801002f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
801002fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002ff:	5b                   	pop    %ebx
80100300:	5e                   	pop    %esi
80100301:	5f                   	pop    %edi
80100302:	5d                   	pop    %ebp
80100303:	c3                   	ret    
80100304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
80100308:	8d 50 01             	lea    0x1(%eax),%edx
8010030b:	89 15 c0 ff 10 80    	mov    %edx,0x8010ffc0
80100311:	89 c2                	mov    %eax,%edx
80100313:	83 e2 7f             	and    $0x7f,%edx
80100316:	0f be 92 40 ff 10 80 	movsbl -0x7fef00c0(%edx),%edx
    if(c == C('D')){  // EOF
8010031d:	83 fa 04             	cmp    $0x4,%edx
80100320:	74 39                	je     8010035b <consoleread+0xeb>
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
80100322:	83 c6 01             	add    $0x1,%esi
    --n;
80100325:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
80100328:	83 fa 0a             	cmp    $0xa,%edx
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
8010032b:	88 56 ff             	mov    %dl,-0x1(%esi)
    --n;
    if(c == '\n')
8010032e:	74 35                	je     80100365 <consoleread+0xf5>
  int c;

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
80100330:	85 db                	test   %ebx,%ebx
80100332:	0f 85 69 ff ff ff    	jne    801002a1 <consoleread+0x31>
80100338:	8b 45 10             	mov    0x10(%ebp),%eax
    *dst++ = c;
    --n;
    if(c == '\n')
      break;
  }
  release(&cons.lock);
8010033b:	83 ec 0c             	sub    $0xc,%esp
8010033e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100341:	68 20 a5 10 80       	push   $0x8010a520
80100346:	e8 f5 43 00 00       	call   80104740 <release>
  ilock(ip);
8010034b:	89 3c 24             	mov    %edi,(%esp)
8010034e:	e8 0d 13 00 00       	call   80101660 <ilock>

  return target - n;
80100353:	83 c4 10             	add    $0x10,%esp
80100356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100359:	eb a1                	jmp    801002fc <consoleread+0x8c>
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
    if(c == C('D')){  // EOF
      if(n < target){
8010035b:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010035e:	76 05                	jbe    80100365 <consoleread+0xf5>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
80100360:	a3 c0 ff 10 80       	mov    %eax,0x8010ffc0
80100365:	8b 45 10             	mov    0x10(%ebp),%eax
80100368:	29 d8                	sub    %ebx,%eax
8010036a:	eb cf                	jmp    8010033b <consoleread+0xcb>
8010036c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100370 <panic>:
    release(&cons.lock);
}

void
panic(char *s)
{
80100370:	55                   	push   %ebp
80100371:	89 e5                	mov    %esp,%ebp
80100373:	56                   	push   %esi
80100374:	53                   	push   %ebx
80100375:	83 ec 38             	sub    $0x38,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100378:	fa                   	cli    
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
80100379:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
{
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
8010037f:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
80100386:	00 00 00 
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
80100389:	8d 5d d0             	lea    -0x30(%ebp),%ebx
8010038c:	8d 75 f8             	lea    -0x8(%ebp),%esi
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
8010038f:	0f b6 00             	movzbl (%eax),%eax
80100392:	50                   	push   %eax
80100393:	68 0d 73 10 80       	push   $0x8010730d
80100398:	e8 c3 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
8010039d:	58                   	pop    %eax
8010039e:	ff 75 08             	pushl  0x8(%ebp)
801003a1:	e8 ba 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003a6:	c7 04 24 31 79 10 80 	movl   $0x80107931,(%esp)
801003ad:	e8 ae 02 00 00       	call   80100660 <cprintf>
  getcallerpcs(&s, pcs);
801003b2:	5a                   	pop    %edx
801003b3:	8d 45 08             	lea    0x8(%ebp),%eax
801003b6:	59                   	pop    %ecx
801003b7:	53                   	push   %ebx
801003b8:	50                   	push   %eax
801003b9:	e8 72 42 00 00       	call   80104630 <getcallerpcs>
801003be:	83 c4 10             	add    $0x10,%esp
801003c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i=0; i<10; i++)
    cprintf(" %p", pcs[i]);
801003c8:	83 ec 08             	sub    $0x8,%esp
801003cb:	ff 33                	pushl  (%ebx)
801003cd:	83 c3 04             	add    $0x4,%ebx
801003d0:	68 29 73 10 80       	push   $0x80107329
801003d5:	e8 86 02 00 00       	call   80100660 <cprintf>
  cons.locking = 0;
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  for(i=0; i<10; i++)
801003da:	83 c4 10             	add    $0x10,%esp
801003dd:	39 f3                	cmp    %esi,%ebx
801003df:	75 e7                	jne    801003c8 <panic+0x58>
    cprintf(" %p", pcs[i]);
  panicked = 1; // freeze other CPU
801003e1:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
801003e8:	00 00 00 
801003eb:	eb fe                	jmp    801003eb <panic+0x7b>
801003ed:	8d 76 00             	lea    0x0(%esi),%esi

801003f0 <consputc>:
}

void
consputc(int c)
{
  if(panicked){
801003f0:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
801003f6:	85 d2                	test   %edx,%edx
801003f8:	74 06                	je     80100400 <consputc+0x10>
801003fa:	fa                   	cli    
801003fb:	eb fe                	jmp    801003fb <consputc+0xb>
801003fd:	8d 76 00             	lea    0x0(%esi),%esi
  crt[pos] = ' ' | 0x0700;
}

void
consputc(int c)
{
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 0c             	sub    $0xc,%esp
    cli();
    for(;;)
      ;
  }

  if(c == BACKSPACE){
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 b8 00 00 00    	je     801004ce <consputc+0xde>
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 81 5a 00 00       	call   80105ea0 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010042f:	be d5 03 00 00       	mov    $0x3d5,%esi
80100434:	89 f2                	mov    %esi,%edx
80100436:	ec                   	in     (%dx),%al
{
  int pos;

  // Cursor position: col + 80*row.
  outb(CRTPORT, 14);
  pos = inb(CRTPORT+1) << 8;
80100437:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	c1 e0 08             	shl    $0x8,%eax
8010043f:	89 c1                	mov    %eax,%ecx
80100441:	b8 0f 00 00 00       	mov    $0xf,%eax
80100446:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100447:	89 f2                	mov    %esi,%edx
80100449:	ec                   	in     (%dx),%al
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);
8010044a:	0f b6 c0             	movzbl %al,%eax
8010044d:	09 c8                	or     %ecx,%eax

  if(c == '\n')
8010044f:	83 fb 0a             	cmp    $0xa,%ebx
80100452:	0f 84 0b 01 00 00    	je     80100563 <consputc+0x173>
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
80100458:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045e:	0f 84 e6 00 00 00    	je     8010054a <consputc+0x15a>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
80100464:	0f b6 d3             	movzbl %bl,%edx
80100467:	8d 78 01             	lea    0x1(%eax),%edi
8010046a:	80 ce 07             	or     $0x7,%dh
8010046d:	66 89 94 00 00 80 0b 	mov    %dx,-0x7ff48000(%eax,%eax,1)
80100474:	80 

  if(pos < 0 || pos > 25*80)
80100475:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
8010047b:	0f 8f bc 00 00 00    	jg     8010053d <consputc+0x14d>
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
80100481:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100487:	7f 6f                	jg     801004f8 <consputc+0x108>
80100489:	89 f8                	mov    %edi,%eax
8010048b:	8d 8c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ecx
80100492:	89 fb                	mov    %edi,%ebx
80100494:	c1 e8 08             	shr    $0x8,%eax
80100497:	89 c6                	mov    %eax,%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
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

  outb(CRTPORT, 14);
  outb(CRTPORT+1, pos>>8);
  outb(CRTPORT, 15);
  outb(CRTPORT+1, pos);
  crt[pos] = ' ' | 0x0700;
801004be:	b8 20 07 00 00       	mov    $0x720,%eax
801004c3:	66 89 01             	mov    %ax,(%ecx)
  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
  cgaputc(c);
}
801004c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c9:	5b                   	pop    %ebx
801004ca:	5e                   	pop    %esi
801004cb:	5f                   	pop    %edi
801004cc:	5d                   	pop    %ebp
801004cd:	c3                   	ret    
    for(;;)
      ;
  }

  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004ce:	83 ec 0c             	sub    $0xc,%esp
801004d1:	6a 08                	push   $0x8
801004d3:	e8 c8 59 00 00       	call   80105ea0 <uartputc>
801004d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004df:	e8 bc 59 00 00       	call   80105ea0 <uartputc>
801004e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004eb:	e8 b0 59 00 00       	call   80105ea0 <uartputc>
801004f0:	83 c4 10             	add    $0x10,%esp
801004f3:	e9 2a ff ff ff       	jmp    80100422 <consputc+0x32>

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004f8:	83 ec 04             	sub    $0x4,%esp
    pos -= 80;
801004fb:	8d 5f b0             	lea    -0x50(%edi),%ebx

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004fe:	68 60 0e 00 00       	push   $0xe60
80100503:	68 a0 80 0b 80       	push   $0x800b80a0
80100508:	68 00 80 0b 80       	push   $0x800b8000
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
8010050d:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100514:	e8 27 43 00 00       	call   80104840 <memmove>
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100519:	b8 80 07 00 00       	mov    $0x780,%eax
8010051e:	83 c4 0c             	add    $0xc,%esp
80100521:	29 d8                	sub    %ebx,%eax
80100523:	01 c0                	add    %eax,%eax
80100525:	50                   	push   %eax
80100526:	6a 00                	push   $0x0
80100528:	56                   	push   %esi
80100529:	e8 62 42 00 00       	call   80104790 <memset>
8010052e:	89 f1                	mov    %esi,%ecx
80100530:	83 c4 10             	add    $0x10,%esp
80100533:	be 07 00 00 00       	mov    $0x7,%esi
80100538:	e9 5c ff ff ff       	jmp    80100499 <consputc+0xa9>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");
8010053d:	83 ec 0c             	sub    $0xc,%esp
80100540:	68 2d 73 10 80       	push   $0x8010732d
80100545:	e8 26 fe ff ff       	call   80100370 <panic>
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
    if(pos > 0) --pos;
8010054a:	85 c0                	test   %eax,%eax
8010054c:	8d 78 ff             	lea    -0x1(%eax),%edi
8010054f:	0f 85 20 ff ff ff    	jne    80100475 <consputc+0x85>
80100555:	b9 00 80 0b 80       	mov    $0x800b8000,%ecx
8010055a:	31 db                	xor    %ebx,%ebx
8010055c:	31 f6                	xor    %esi,%esi
8010055e:	e9 36 ff ff ff       	jmp    80100499 <consputc+0xa9>
  pos = inb(CRTPORT+1) << 8;
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
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
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d6                	mov    %edx,%esi
80100588:	83 ec 2c             	sub    $0x2c,%esp
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
8010058b:	85 c9                	test   %ecx,%ecx
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
80100590:	74 0c                	je     8010059e <printint+0x1e>
80100592:	89 c7                	mov    %eax,%edi
80100594:	c1 ef 1f             	shr    $0x1f,%edi
80100597:	85 c0                	test   %eax,%eax
80100599:	89 7d d4             	mov    %edi,-0x2c(%ebp)
8010059c:	78 51                	js     801005ef <printint+0x6f>
    x = -xx;
  else
    x = xx;

  i = 0;
8010059e:	31 ff                	xor    %edi,%edi
801005a0:	8d 5d d7             	lea    -0x29(%ebp),%ebx
801005a3:	eb 05                	jmp    801005aa <printint+0x2a>
801005a5:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
801005a8:	89 cf                	mov    %ecx,%edi
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 4f 01             	lea    0x1(%edi),%ecx
801005af:	f7 f6                	div    %esi
801005b1:	0f b6 92 58 73 10 80 	movzbl -0x7fef8ca8(%edx),%edx
  }while((x /= base) != 0);
801005b8:	85 c0                	test   %eax,%eax
  else
    x = xx;

  i = 0;
  do{
    buf[i++] = digits[x % base];
801005ba:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
801005bd:	75 e9                	jne    801005a8 <printint+0x28>

  if(sign)
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
    buf[i++] = '-';
801005c6:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
801005cb:	8d 4f 02             	lea    0x2(%edi),%ecx
801005ce:	8d 74 0d d7          	lea    -0x29(%ebp,%ecx,1),%esi
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  while(--i >= 0)
    consputc(buf[i]);
801005d8:	0f be 06             	movsbl (%esi),%eax
801005db:	83 ee 01             	sub    $0x1,%esi
801005de:	e8 0d fe ff ff       	call   801003f0 <consputc>
  }while((x /= base) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0)
801005e3:	39 de                	cmp    %ebx,%esi
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
    consputc(buf[i]);
}
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    x = -xx;
801005ef:	f7 d8                	neg    %eax
801005f1:	eb ab                	jmp    8010059e <printint+0x1e>
801005f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100600 <consolewrite>:
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
  int i;

  iunlock(ip);
80100609:	ff 75 08             	pushl  0x8(%ebp)
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
8010060c:	8b 75 10             	mov    0x10(%ebp),%esi
  int i;

  iunlock(ip);
8010060f:	e8 2c 11 00 00       	call   80101740 <iunlock>
  acquire(&cons.lock);
80100614:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010061b:	e8 40 3f 00 00       	call   80104560 <acquire>
80100620:	8b 7d 0c             	mov    0xc(%ebp),%edi
  for(i = 0; i < n; i++)
80100623:	83 c4 10             	add    $0x10,%esp
80100626:	85 f6                	test   %esi,%esi
80100628:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062b:	7e 12                	jle    8010063f <consolewrite+0x3f>
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
    consputc(buf[i] & 0xff);
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 b5 fd ff ff       	call   801003f0 <consputc>
{
  int i;

  iunlock(ip);
  acquire(&cons.lock);
  for(i = 0; i < n; i++)
8010063b:	39 df                	cmp    %ebx,%edi
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
    consputc(buf[i] & 0xff);
  release(&cons.lock);
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 a5 10 80       	push   $0x8010a520
80100647:	e8 f4 40 00 00       	call   80104740 <release>
  ilock(ip);
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 0b 10 00 00       	call   80101660 <ilock>

  return n;
}
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
//PAGEBREAK: 50

// Print to the console. only understands %d, %x, %p, %s.
void
cprintf(char *fmt, ...)
{
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100669:	a1 54 a5 10 80       	mov    0x8010a554,%eax
  if(locking)
8010066e:	85 c0                	test   %eax,%eax
{
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100670:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(locking)
80100673:	0f 85 47 01 00 00    	jne    801007c0 <cprintf+0x160>
    acquire(&cons.lock);

  if (fmt == 0)
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c1                	mov    %eax,%ecx
80100680:	0f 84 4f 01 00 00    	je     801007d5 <cprintf+0x175>
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100686:	0f b6 00             	movzbl (%eax),%eax
80100689:	31 db                	xor    %ebx,%ebx
8010068b:	8d 75 0c             	lea    0xc(%ebp),%esi
8010068e:	89 cf                	mov    %ecx,%edi
80100690:	85 c0                	test   %eax,%eax
80100692:	75 55                	jne    801006e9 <cprintf+0x89>
80100694:	eb 68                	jmp    801006fe <cprintf+0x9e>
80100696:	8d 76 00             	lea    0x0(%esi),%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(c != '%'){
      consputc(c);
      continue;
    }
    c = fmt[++i] & 0xff;
801006a0:	83 c3 01             	add    $0x1,%ebx
801006a3:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
    if(c == 0)
801006a7:	85 d2                	test   %edx,%edx
801006a9:	74 53                	je     801006fe <cprintf+0x9e>
      break;
    switch(c){
801006ab:	83 fa 70             	cmp    $0x70,%edx
801006ae:	74 7a                	je     8010072a <cprintf+0xca>
801006b0:	7f 6e                	jg     80100720 <cprintf+0xc0>
801006b2:	83 fa 25             	cmp    $0x25,%edx
801006b5:	0f 84 ad 00 00 00    	je     80100768 <cprintf+0x108>
801006bb:	83 fa 64             	cmp    $0x64,%edx
801006be:	0f 85 84 00 00 00    	jne    80100748 <cprintf+0xe8>
    case 'd':
      printint(*argp++, 10, 1);
801006c4:	8d 46 04             	lea    0x4(%esi),%eax
801006c7:	b9 01 00 00 00       	mov    $0x1,%ecx
801006cc:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006d4:	8b 06                	mov    (%esi),%eax
801006d6:	e8 a5 fe ff ff       	call   80100580 <printint>
801006db:	8b 75 e4             	mov    -0x1c(%ebp),%esi

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006de:	83 c3 01             	add    $0x1,%ebx
801006e1:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006e5:	85 c0                	test   %eax,%eax
801006e7:	74 15                	je     801006fe <cprintf+0x9e>
    if(c != '%'){
801006e9:	83 f8 25             	cmp    $0x25,%eax
801006ec:	74 b2                	je     801006a0 <cprintf+0x40>
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
801006ee:	e8 fd fc ff ff       	call   801003f0 <consputc>

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006f3:	83 c3 01             	add    $0x1,%ebx
801006f6:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006fa:	85 c0                	test   %eax,%eax
801006fc:	75 eb                	jne    801006e9 <cprintf+0x89>
      consputc(c);
      break;
    }
  }

  if(locking)
801006fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100701:	85 c0                	test   %eax,%eax
80100703:	74 10                	je     80100715 <cprintf+0xb5>
    release(&cons.lock);
80100705:	83 ec 0c             	sub    $0xc,%esp
80100708:	68 20 a5 10 80       	push   $0x8010a520
8010070d:	e8 2e 40 00 00       	call   80104740 <release>
80100712:	83 c4 10             	add    $0x10,%esp
}
80100715:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100718:	5b                   	pop    %ebx
80100719:	5e                   	pop    %esi
8010071a:	5f                   	pop    %edi
8010071b:	5d                   	pop    %ebp
8010071c:	c3                   	ret    
8010071d:	8d 76 00             	lea    0x0(%esi),%esi
      continue;
    }
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
    switch(c){
80100720:	83 fa 73             	cmp    $0x73,%edx
80100723:	74 5b                	je     80100780 <cprintf+0x120>
80100725:	83 fa 78             	cmp    $0x78,%edx
80100728:	75 1e                	jne    80100748 <cprintf+0xe8>
    case 'd':
      printint(*argp++, 10, 1);
      break;
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
8010072a:	8d 46 04             	lea    0x4(%esi),%eax
8010072d:	31 c9                	xor    %ecx,%ecx
8010072f:	ba 10 00 00 00       	mov    $0x10,%edx
80100734:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100737:	8b 06                	mov    (%esi),%eax
80100739:	e8 42 fe ff ff       	call   80100580 <printint>
8010073e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
      break;
80100741:	eb 9b                	jmp    801006de <cprintf+0x7e>
80100743:	90                   	nop
80100744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case '%':
      consputc('%');
      break;
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
80100748:	b8 25 00 00 00       	mov    $0x25,%eax
8010074d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100750:	e8 9b fc ff ff       	call   801003f0 <consputc>
      consputc(c);
80100755:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100758:	89 d0                	mov    %edx,%eax
8010075a:	e8 91 fc ff ff       	call   801003f0 <consputc>
      break;
8010075f:	e9 7a ff ff ff       	jmp    801006de <cprintf+0x7e>
80100764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
80100768:	b8 25 00 00 00       	mov    $0x25,%eax
8010076d:	e8 7e fc ff ff       	call   801003f0 <consputc>
80100772:	e9 7c ff ff ff       	jmp    801006f3 <cprintf+0x93>
80100777:	89 f6                	mov    %esi,%esi
80100779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
80100780:	8d 46 04             	lea    0x4(%esi),%eax
80100783:	8b 36                	mov    (%esi),%esi
80100785:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        s = "(null)";
80100788:	b8 40 73 10 80       	mov    $0x80107340,%eax
8010078d:	85 f6                	test   %esi,%esi
8010078f:	0f 44 f0             	cmove  %eax,%esi
      for(; *s; s++)
80100792:	0f be 06             	movsbl (%esi),%eax
80100795:	84 c0                	test   %al,%al
80100797:	74 16                	je     801007af <cprintf+0x14f>
80100799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007a0:	83 c6 01             	add    $0x1,%esi
        consputc(*s);
801007a3:	e8 48 fc ff ff       	call   801003f0 <consputc>
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++)
801007a8:	0f be 06             	movsbl (%esi),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
801007af:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801007b2:	e9 27 ff ff ff       	jmp    801006de <cprintf+0x7e>
801007b7:	89 f6                	mov    %esi,%esi
801007b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  uint *argp;
  char *s;

  locking = cons.locking;
  if(locking)
    acquire(&cons.lock);
801007c0:	83 ec 0c             	sub    $0xc,%esp
801007c3:	68 20 a5 10 80       	push   $0x8010a520
801007c8:	e8 93 3d 00 00       	call   80104560 <acquire>
801007cd:	83 c4 10             	add    $0x10,%esp
801007d0:	e9 a4 fe ff ff       	jmp    80100679 <cprintf+0x19>

  if (fmt == 0)
    panic("null fmt");
801007d5:	83 ec 0c             	sub    $0xc,%esp
801007d8:	68 47 73 10 80       	push   $0x80107347
801007dd:	e8 8e fb ff ff       	call   80100370 <panic>
801007e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801007f0 <consoleintr>:

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007f0:	55                   	push   %ebp
801007f1:	89 e5                	mov    %esp,%ebp
801007f3:	57                   	push   %edi
801007f4:	56                   	push   %esi
801007f5:	53                   	push   %ebx
  int c, doprocdump = 0;
801007f6:	31 f6                	xor    %esi,%esi

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007f8:	83 ec 18             	sub    $0x18,%esp
801007fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int c, doprocdump = 0;

  acquire(&cons.lock);
801007fe:	68 20 a5 10 80       	push   $0x8010a520
80100803:	e8 58 3d 00 00       	call   80104560 <acquire>
  while((c = getc()) >= 0){
80100808:	83 c4 10             	add    $0x10,%esp
8010080b:	90                   	nop
8010080c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100810:	ff d3                	call   *%ebx
80100812:	85 c0                	test   %eax,%eax
80100814:	89 c7                	mov    %eax,%edi
80100816:	78 48                	js     80100860 <consoleintr+0x70>
    switch(c){
80100818:	83 ff 10             	cmp    $0x10,%edi
8010081b:	0f 84 3f 01 00 00    	je     80100960 <consoleintr+0x170>
80100821:	7e 5d                	jle    80100880 <consoleintr+0x90>
80100823:	83 ff 15             	cmp    $0x15,%edi
80100826:	0f 84 dc 00 00 00    	je     80100908 <consoleintr+0x118>
8010082c:	83 ff 7f             	cmp    $0x7f,%edi
8010082f:	75 54                	jne    80100885 <consoleintr+0x95>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
80100831:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100836:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
8010083c:	74 d2                	je     80100810 <consoleintr+0x20>
        input.e--;
8010083e:	83 e8 01             	sub    $0x1,%eax
80100841:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
        consputc(BACKSPACE);
80100846:	b8 00 01 00 00       	mov    $0x100,%eax
8010084b:	e8 a0 fb ff ff       	call   801003f0 <consputc>
consoleintr(int (*getc)(void))
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
80100850:	ff d3                	call   *%ebx
80100852:	85 c0                	test   %eax,%eax
80100854:	89 c7                	mov    %eax,%edi
80100856:	79 c0                	jns    80100818 <consoleintr+0x28>
80100858:	90                   	nop
80100859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        }
      }
      break;
    }
  }
  release(&cons.lock);
80100860:	83 ec 0c             	sub    $0xc,%esp
80100863:	68 20 a5 10 80       	push   $0x8010a520
80100868:	e8 d3 3e 00 00       	call   80104740 <release>
  if(doprocdump) {
8010086d:	83 c4 10             	add    $0x10,%esp
80100870:	85 f6                	test   %esi,%esi
80100872:	0f 85 f8 00 00 00    	jne    80100970 <consoleintr+0x180>
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100878:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010087b:	5b                   	pop    %ebx
8010087c:	5e                   	pop    %esi
8010087d:	5f                   	pop    %edi
8010087e:	5d                   	pop    %ebp
8010087f:	c3                   	ret    
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
80100880:	83 ff 08             	cmp    $0x8,%edi
80100883:	74 ac                	je     80100831 <consoleintr+0x41>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
80100885:	85 ff                	test   %edi,%edi
80100887:	74 87                	je     80100810 <consoleintr+0x20>
80100889:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
8010088e:	89 c2                	mov    %eax,%edx
80100890:	2b 15 c0 ff 10 80    	sub    0x8010ffc0,%edx
80100896:	83 fa 7f             	cmp    $0x7f,%edx
80100899:	0f 87 71 ff ff ff    	ja     80100810 <consoleintr+0x20>
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010089f:	8d 50 01             	lea    0x1(%eax),%edx
801008a2:	83 e0 7f             	and    $0x7f,%eax
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
801008a5:	83 ff 0d             	cmp    $0xd,%edi
        input.buf[input.e++ % INPUT_BUF] = c;
801008a8:	89 15 c8 ff 10 80    	mov    %edx,0x8010ffc8
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
801008ae:	0f 84 c8 00 00 00    	je     8010097c <consoleintr+0x18c>
        input.buf[input.e++ % INPUT_BUF] = c;
801008b4:	89 f9                	mov    %edi,%ecx
801008b6:	88 88 40 ff 10 80    	mov    %cl,-0x7fef00c0(%eax)
        consputc(c);
801008bc:	89 f8                	mov    %edi,%eax
801008be:	e8 2d fb ff ff       	call   801003f0 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
801008c3:	83 ff 0a             	cmp    $0xa,%edi
801008c6:	0f 84 c1 00 00 00    	je     8010098d <consoleintr+0x19d>
801008cc:	83 ff 04             	cmp    $0x4,%edi
801008cf:	0f 84 b8 00 00 00    	je     8010098d <consoleintr+0x19d>
801008d5:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801008da:	83 e8 80             	sub    $0xffffff80,%eax
801008dd:	39 05 c8 ff 10 80    	cmp    %eax,0x8010ffc8
801008e3:	0f 85 27 ff ff ff    	jne    80100810 <consoleintr+0x20>
          input.w = input.e;
          wakeup(&input.r);
801008e9:	83 ec 0c             	sub    $0xc,%esp
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
        consputc(c);
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
          input.w = input.e;
801008ec:	a3 c4 ff 10 80       	mov    %eax,0x8010ffc4
          wakeup(&input.r);
801008f1:	68 c0 ff 10 80       	push   $0x8010ffc0
801008f6:	e8 95 37 00 00       	call   80104090 <wakeup>
801008fb:	83 c4 10             	add    $0x10,%esp
801008fe:	e9 0d ff ff ff       	jmp    80100810 <consoleintr+0x20>
80100903:	90                   	nop
80100904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100908:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
8010090d:	39 05 c4 ff 10 80    	cmp    %eax,0x8010ffc4
80100913:	75 2b                	jne    80100940 <consoleintr+0x150>
80100915:	e9 f6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010091a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
80100920:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
        consputc(BACKSPACE);
80100925:	b8 00 01 00 00       	mov    $0x100,%eax
8010092a:	e8 c1 fa ff ff       	call   801003f0 <consputc>
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
8010092f:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100934:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
8010093a:	0f 84 d0 fe ff ff    	je     80100810 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100940:	83 e8 01             	sub    $0x1,%eax
80100943:	89 c2                	mov    %eax,%edx
80100945:	83 e2 7f             	and    $0x7f,%edx
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100948:	80 ba 40 ff 10 80 0a 	cmpb   $0xa,-0x7fef00c0(%edx)
8010094f:	75 cf                	jne    80100920 <consoleintr+0x130>
80100951:	e9 ba fe ff ff       	jmp    80100810 <consoleintr+0x20>
80100956:	8d 76 00             	lea    0x0(%esi),%esi
80100959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
80100960:	be 01 00 00 00       	mov    $0x1,%esi
80100965:	e9 a6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010096a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100970:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100973:	5b                   	pop    %ebx
80100974:	5e                   	pop    %esi
80100975:	5f                   	pop    %edi
80100976:	5d                   	pop    %ebp
      break;
    }
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
80100977:	e9 04 38 00 00       	jmp    80104180 <procdump>
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010097c:	c6 80 40 ff 10 80 0a 	movb   $0xa,-0x7fef00c0(%eax)
        consputc(c);
80100983:	b8 0a 00 00 00       	mov    $0xa,%eax
80100988:	e8 63 fa ff ff       	call   801003f0 <consputc>
8010098d:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100992:	e9 52 ff ff ff       	jmp    801008e9 <consoleintr+0xf9>
80100997:	89 f6                	mov    %esi,%esi
80100999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801009a0 <consoleinit>:
  return n;
}

void
consoleinit(void)
{
801009a0:	55                   	push   %ebp
801009a1:	89 e5                	mov    %esp,%ebp
801009a3:	83 ec 10             	sub    $0x10,%esp
  initlock(&cons.lock, "console");
801009a6:	68 50 73 10 80       	push   $0x80107350
801009ab:	68 20 a5 10 80       	push   $0x8010a520
801009b0:	e8 8b 3b 00 00       	call   80104540 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  picenable(IRQ_KBD);
801009b5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
void
consoleinit(void)
{
  initlock(&cons.lock, "console");

  devsw[CONSOLE].write = consolewrite;
801009bc:	c7 05 8c 09 11 80 00 	movl   $0x80100600,0x8011098c
801009c3:	06 10 80 
  devsw[CONSOLE].read = consoleread;
801009c6:	c7 05 88 09 11 80 70 	movl   $0x80100270,0x80110988
801009cd:	02 10 80 
  cons.locking = 1;
801009d0:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
801009d7:	00 00 00 

  picenable(IRQ_KBD);
801009da:	e8 81 28 00 00       	call   80103260 <picenable>
  ioapicenable(IRQ_KBD, 0);
801009df:	58                   	pop    %eax
801009e0:	5a                   	pop    %edx
801009e1:	6a 00                	push   $0x0
801009e3:	6a 01                	push   $0x1
801009e5:	e8 a6 18 00 00       	call   80102290 <ioapicenable>
}
801009ea:	83 c4 10             	add    $0x10,%esp
801009ed:	c9                   	leave  
801009ee:	c3                   	ret    
801009ef:	90                   	nop

801009f0 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
801009f0:	55                   	push   %ebp
801009f1:	89 e5                	mov    %esp,%ebp
801009f3:	57                   	push   %edi
801009f4:	56                   	push   %esi
801009f5:	53                   	push   %ebx
801009f6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;

  begin_op();
801009fc:	e8 8f 21 00 00       	call   80102b90 <begin_op>

  if((ip = namei(path)) == 0){
80100a01:	83 ec 0c             	sub    $0xc,%esp
80100a04:	ff 75 08             	pushl  0x8(%ebp)
80100a07:	e8 84 14 00 00       	call   80101e90 <namei>
80100a0c:	83 c4 10             	add    $0x10,%esp
80100a0f:	85 c0                	test   %eax,%eax
80100a11:	0f 84 9f 01 00 00    	je     80100bb6 <exec+0x1c6>
    end_op();
    return -1;
  }
  ilock(ip);
80100a17:	83 ec 0c             	sub    $0xc,%esp
80100a1a:	89 c3                	mov    %eax,%ebx
80100a1c:	50                   	push   %eax
80100a1d:	e8 3e 0c 00 00       	call   80101660 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
80100a22:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a28:	6a 34                	push   $0x34
80100a2a:	6a 00                	push   $0x0
80100a2c:	50                   	push   %eax
80100a2d:	53                   	push   %ebx
80100a2e:	e8 ed 0e 00 00       	call   80101920 <readi>
80100a33:	83 c4 20             	add    $0x20,%esp
80100a36:	83 f8 34             	cmp    $0x34,%eax
80100a39:	74 25                	je     80100a60 <exec+0x70>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100a3b:	83 ec 0c             	sub    $0xc,%esp
80100a3e:	53                   	push   %ebx
80100a3f:	e8 8c 0e 00 00       	call   801018d0 <iunlockput>
    end_op();
80100a44:	e8 b7 21 00 00       	call   80102c00 <end_op>
80100a49:	83 c4 10             	add    $0x10,%esp
  }
  return -1;
80100a4c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100a51:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a54:	5b                   	pop    %ebx
80100a55:	5e                   	pop    %esi
80100a56:	5f                   	pop    %edi
80100a57:	5d                   	pop    %ebp
80100a58:	c3                   	ret    
80100a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100a60:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a67:	45 4c 46 
80100a6a:	75 cf                	jne    80100a3b <exec+0x4b>
    goto bad;

  if((pgdir = setupkvm()) == 0)
80100a6c:	e8 ef 61 00 00       	call   80106c60 <setupkvm>
80100a71:	85 c0                	test   %eax,%eax
80100a73:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a79:	74 c0                	je     80100a3b <exec+0x4b>
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
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
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100ab5:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100abb:	6a 20                	push   $0x20
80100abd:	56                   	push   %esi
80100abe:	50                   	push   %eax
80100abf:	53                   	push   %ebx
80100ac0:	e8 5b 0e 00 00       	call   80101920 <readi>
80100ac5:	83 c4 10             	add    $0x10,%esp
80100ac8:	83 f8 20             	cmp    $0x20,%eax
80100acb:	75 7b                	jne    80100b48 <exec+0x158>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
80100acd:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100ad4:	75 ca                	jne    80100aa0 <exec+0xb0>
      continue;
    if(ph.memsz < ph.filesz)
80100ad6:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100adc:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100ae2:	72 64                	jb     80100b48 <exec+0x158>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100ae4:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100aea:	72 5c                	jb     80100b48 <exec+0x158>
      goto bad;
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100aec:	83 ec 04             	sub    $0x4,%esp
80100aef:	50                   	push   %eax
80100af0:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100af6:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100afc:	e8 1f 64 00 00       	call   80106f20 <allocuvm>
80100b01:	83 c4 10             	add    $0x10,%esp
80100b04:	85 c0                	test   %eax,%eax
80100b06:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100b0c:	74 3a                	je     80100b48 <exec+0x158>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
80100b0e:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b14:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b19:	75 2d                	jne    80100b48 <exec+0x158>
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100b1b:	83 ec 0c             	sub    $0xc,%esp
80100b1e:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b24:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b2a:	53                   	push   %ebx
80100b2b:	50                   	push   %eax
80100b2c:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b32:	e8 29 63 00 00       	call   80106e60 <loaduvm>
80100b37:	83 c4 20             	add    $0x20,%esp
80100b3a:	85 c0                	test   %eax,%eax
80100b3c:	0f 89 5e ff ff ff    	jns    80100aa0 <exec+0xb0>
80100b42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b48:	83 ec 0c             	sub    $0xc,%esp
80100b4b:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b51:	e8 fa 64 00 00       	call   80107050 <freevm>
80100b56:	83 c4 10             	add    $0x10,%esp
80100b59:	e9 dd fe ff ff       	jmp    80100a3b <exec+0x4b>
    if(ph.vaddr % PGSIZE != 0)
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
80100b5e:	83 ec 0c             	sub    $0xc,%esp
80100b61:	53                   	push   %ebx
80100b62:	e8 69 0d 00 00       	call   801018d0 <iunlockput>
  end_op();
80100b67:	e8 94 20 00 00       	call   80102c00 <end_op>
  ip = 0;

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
80100b6c:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b72:	83 c4 0c             	add    $0xc,%esp
  end_op();
  ip = 0;

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
80100b75:	05 ff 0f 00 00       	add    $0xfff,%eax
80100b7a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b7f:	8d 90 00 20 00 00    	lea    0x2000(%eax),%edx
80100b85:	52                   	push   %edx
80100b86:	50                   	push   %eax
80100b87:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b8d:	e8 8e 63 00 00       	call   80106f20 <allocuvm>
80100b92:	83 c4 10             	add    $0x10,%esp
80100b95:	85 c0                	test   %eax,%eax
80100b97:	89 c6                	mov    %eax,%esi
80100b99:	75 2a                	jne    80100bc5 <exec+0x1d5>
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b9b:	83 ec 0c             	sub    $0xc,%esp
80100b9e:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100ba4:	e8 a7 64 00 00       	call   80107050 <freevm>
80100ba9:	83 c4 10             	add    $0x10,%esp
  if(ip){
    iunlockput(ip);
    end_op();
  }
  return -1;
80100bac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bb1:	e9 9b fe ff ff       	jmp    80100a51 <exec+0x61>
  pde_t *pgdir, *oldpgdir;

  begin_op();

  if((ip = namei(path)) == 0){
    end_op();
80100bb6:	e8 45 20 00 00       	call   80102c00 <end_op>
    return -1;
80100bbb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bc0:	e9 8c fe ff ff       	jmp    80100a51 <exec+0x61>
  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bc5:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100bcb:	83 ec 08             	sub    $0x8,%esp
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100bce:	31 ff                	xor    %edi,%edi
80100bd0:	89 f3                	mov    %esi,%ebx
  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bd2:	50                   	push   %eax
80100bd3:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100bd9:	e8 f2 64 00 00       	call   801070d0 <clearpteu>
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
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
    if(argc >= MAXARG)
80100c00:	83 ff 20             	cmp    $0x20,%edi
80100c03:	74 96                	je     80100b9b <exec+0x1ab>
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c05:	83 ec 0c             	sub    $0xc,%esp
80100c08:	50                   	push   %eax
80100c09:	e8 c2 3d 00 00       	call   801049d0 <strlen>
80100c0e:	f7 d0                	not    %eax
80100c10:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c12:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c15:	5a                   	pop    %edx

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c16:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c19:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c1c:	e8 af 3d 00 00       	call   801049d0 <strlen>
80100c21:	83 c0 01             	add    $0x1,%eax
80100c24:	50                   	push   %eax
80100c25:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c28:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c2b:	53                   	push   %ebx
80100c2c:	56                   	push   %esi
80100c2d:	e8 fe 65 00 00       	call   80107230 <copyout>
80100c32:	83 c4 20             	add    $0x20,%esp
80100c35:	85 c0                	test   %eax,%eax
80100c37:	0f 88 5e ff ff ff    	js     80100b9b <exec+0x1ab>
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c3d:	8b 45 0c             	mov    0xc(%ebp),%eax
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100c40:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c47:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100c4a:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c50:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c53:	85 c0                	test   %eax,%eax
80100c55:	75 a9                	jne    80100c00 <exec+0x210>
80100c57:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c5d:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100c64:	89 d9                	mov    %ebx,%ecx
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
  }
  ustack[3+argc] = 0;
80100c66:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100c6d:	00 00 00 00 

  ustack[0] = 0xffffffff;  // fake return PC
80100c71:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100c78:	ff ff ff 
  ustack[1] = argc;
80100c7b:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c81:	29 c1                	sub    %eax,%ecx

  sp -= (3+argc+1) * 4;
80100c83:	83 c0 0c             	add    $0xc,%eax
80100c86:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c88:	50                   	push   %eax
80100c89:	52                   	push   %edx
80100c8a:	53                   	push   %ebx
80100c8b:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c91:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)

  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c97:	e8 94 65 00 00       	call   80107230 <copyout>
80100c9c:	83 c4 10             	add    $0x10,%esp
80100c9f:	85 c0                	test   %eax,%eax
80100ca1:	0f 88 f4 fe ff ff    	js     80100b9b <exec+0x1ab>
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100ca7:	8b 45 08             	mov    0x8(%ebp),%eax
80100caa:	0f b6 10             	movzbl (%eax),%edx
80100cad:	84 d2                	test   %dl,%dl
80100caf:	74 19                	je     80100cca <exec+0x2da>
80100cb1:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100cb4:	83 c0 01             	add    $0x1,%eax
    if(*s == '/')
      last = s+1;
80100cb7:	80 fa 2f             	cmp    $0x2f,%dl
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100cba:	0f b6 10             	movzbl (%eax),%edx
    if(*s == '/')
      last = s+1;
80100cbd:	0f 44 c8             	cmove  %eax,%ecx
80100cc0:	83 c0 01             	add    $0x1,%eax
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100cc3:	84 d2                	test   %dl,%dl
80100cc5:	75 f0                	jne    80100cb7 <exec+0x2c7>
80100cc7:	89 4d 08             	mov    %ecx,0x8(%ebp)
    if(*s == '/')
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));
80100cca:	50                   	push   %eax
80100ccb:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100cd1:	6a 10                	push   $0x10
80100cd3:	ff 75 08             	pushl  0x8(%ebp)
80100cd6:	83 c0 6c             	add    $0x6c,%eax
80100cd9:	50                   	push   %eax
80100cda:	e8 b1 3c 00 00       	call   80104990 <safestrcpy>

  // Commit to the user image.
  oldpgdir = proc->pgdir;
80100cdf:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  proc->pgdir = pgdir;
80100ce5:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
    if(*s == '/')
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));

  // Commit to the user image.
  oldpgdir = proc->pgdir;
80100ceb:	8b 78 04             	mov    0x4(%eax),%edi
  proc->pgdir = pgdir;
  proc->sz = sz;
80100cee:	89 30                	mov    %esi,(%eax)
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));

  // Commit to the user image.
  oldpgdir = proc->pgdir;
  proc->pgdir = pgdir;
80100cf0:	89 48 04             	mov    %ecx,0x4(%eax)
  proc->sz = sz;
  proc->tf->eip = elf.entry;  // main
80100cf3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100cf9:	8b 8d 3c ff ff ff    	mov    -0xc4(%ebp),%ecx
80100cff:	8b 50 18             	mov    0x18(%eax),%edx
80100d02:	89 4a 38             	mov    %ecx,0x38(%edx)
  proc->tf->esp = sp;
80100d05:	8b 50 18             	mov    0x18(%eax),%edx
80100d08:	89 5a 44             	mov    %ebx,0x44(%edx)
  proc->tickets = 100;
80100d0b:	c7 40 7c 64 00 00 00 	movl   $0x64,0x7c(%eax)
80100d12:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80100d19:	00 00 00 
  switchuvm(proc);
80100d1c:	89 04 24             	mov    %eax,(%esp)
80100d1f:	e8 ec 5f 00 00       	call   80106d10 <switchuvm>
  freevm(oldpgdir);
80100d24:	89 3c 24             	mov    %edi,(%esp)
80100d27:	e8 24 63 00 00       	call   80107050 <freevm>
  return 0;
80100d2c:	83 c4 10             	add    $0x10,%esp
80100d2f:	31 c0                	xor    %eax,%eax
80100d31:	e9 1b fd ff ff       	jmp    80100a51 <exec+0x61>
80100d36:	66 90                	xchg   %ax,%ax
80100d38:	66 90                	xchg   %ax,%ax
80100d3a:	66 90                	xchg   %ax,%ax
80100d3c:	66 90                	xchg   %ax,%ax
80100d3e:	66 90                	xchg   %ax,%ax

80100d40 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100d40:	55                   	push   %ebp
80100d41:	89 e5                	mov    %esp,%ebp
80100d43:	83 ec 10             	sub    $0x10,%esp
  initlock(&ftable.lock, "ftable");
80100d46:	68 69 73 10 80       	push   $0x80107369
80100d4b:	68 e0 ff 10 80       	push   $0x8010ffe0
80100d50:	e8 eb 37 00 00       	call   80104540 <initlock>
}
80100d55:	83 c4 10             	add    $0x10,%esp
80100d58:	c9                   	leave  
80100d59:	c3                   	ret    
80100d5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d60 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d60:	55                   	push   %ebp
80100d61:	89 e5                	mov    %esp,%ebp
80100d63:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d64:	bb 14 00 11 80       	mov    $0x80110014,%ebx
}

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d69:	83 ec 10             	sub    $0x10,%esp
  struct file *f;

  acquire(&ftable.lock);
80100d6c:	68 e0 ff 10 80       	push   $0x8010ffe0
80100d71:	e8 ea 37 00 00       	call   80104560 <acquire>
80100d76:	83 c4 10             	add    $0x10,%esp
80100d79:	eb 10                	jmp    80100d8b <filealloc+0x2b>
80100d7b:	90                   	nop
80100d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d80:	83 c3 18             	add    $0x18,%ebx
80100d83:	81 fb 74 09 11 80    	cmp    $0x80110974,%ebx
80100d89:	74 25                	je     80100db0 <filealloc+0x50>
    if(f->ref == 0){
80100d8b:	8b 43 04             	mov    0x4(%ebx),%eax
80100d8e:	85 c0                	test   %eax,%eax
80100d90:	75 ee                	jne    80100d80 <filealloc+0x20>
      f->ref = 1;
      release(&ftable.lock);
80100d92:	83 ec 0c             	sub    $0xc,%esp
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    if(f->ref == 0){
      f->ref = 1;
80100d95:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100d9c:	68 e0 ff 10 80       	push   $0x8010ffe0
80100da1:	e8 9a 39 00 00       	call   80104740 <release>
      return f;
80100da6:	89 d8                	mov    %ebx,%eax
80100da8:	83 c4 10             	add    $0x10,%esp
    }
  }
  release(&ftable.lock);
  return 0;
}
80100dab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dae:	c9                   	leave  
80100daf:	c3                   	ret    
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
80100db0:	83 ec 0c             	sub    $0xc,%esp
80100db3:	68 e0 ff 10 80       	push   $0x8010ffe0
80100db8:	e8 83 39 00 00       	call   80104740 <release>
  return 0;
80100dbd:	83 c4 10             	add    $0x10,%esp
80100dc0:	31 c0                	xor    %eax,%eax
}
80100dc2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dc5:	c9                   	leave  
80100dc6:	c3                   	ret    
80100dc7:	89 f6                	mov    %esi,%esi
80100dc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100dd0 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100dd0:	55                   	push   %ebp
80100dd1:	89 e5                	mov    %esp,%ebp
80100dd3:	53                   	push   %ebx
80100dd4:	83 ec 10             	sub    $0x10,%esp
80100dd7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100dda:	68 e0 ff 10 80       	push   $0x8010ffe0
80100ddf:	e8 7c 37 00 00       	call   80104560 <acquire>
  if(f->ref < 1)
80100de4:	8b 43 04             	mov    0x4(%ebx),%eax
80100de7:	83 c4 10             	add    $0x10,%esp
80100dea:	85 c0                	test   %eax,%eax
80100dec:	7e 1a                	jle    80100e08 <filedup+0x38>
    panic("filedup");
  f->ref++;
80100dee:	83 c0 01             	add    $0x1,%eax
  release(&ftable.lock);
80100df1:	83 ec 0c             	sub    $0xc,%esp
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
  f->ref++;
80100df4:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100df7:	68 e0 ff 10 80       	push   $0x8010ffe0
80100dfc:	e8 3f 39 00 00       	call   80104740 <release>
  return f;
}
80100e01:	89 d8                	mov    %ebx,%eax
80100e03:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e06:	c9                   	leave  
80100e07:	c3                   	ret    
struct file*
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
80100e08:	83 ec 0c             	sub    $0xc,%esp
80100e0b:	68 70 73 10 80       	push   $0x80107370
80100e10:	e8 5b f5 ff ff       	call   80100370 <panic>
80100e15:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e20 <fileclose>:
}

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100e20:	55                   	push   %ebp
80100e21:	89 e5                	mov    %esp,%ebp
80100e23:	57                   	push   %edi
80100e24:	56                   	push   %esi
80100e25:	53                   	push   %ebx
80100e26:	83 ec 28             	sub    $0x28,%esp
80100e29:	8b 7d 08             	mov    0x8(%ebp),%edi
  struct file ff;

  acquire(&ftable.lock);
80100e2c:	68 e0 ff 10 80       	push   $0x8010ffe0
80100e31:	e8 2a 37 00 00       	call   80104560 <acquire>
  if(f->ref < 1)
80100e36:	8b 47 04             	mov    0x4(%edi),%eax
80100e39:	83 c4 10             	add    $0x10,%esp
80100e3c:	85 c0                	test   %eax,%eax
80100e3e:	0f 8e 9b 00 00 00    	jle    80100edf <fileclose+0xbf>
    panic("fileclose");
  if(--f->ref > 0){
80100e44:	83 e8 01             	sub    $0x1,%eax
80100e47:	85 c0                	test   %eax,%eax
80100e49:	89 47 04             	mov    %eax,0x4(%edi)
80100e4c:	74 1a                	je     80100e68 <fileclose+0x48>
    release(&ftable.lock);
80100e4e:	c7 45 08 e0 ff 10 80 	movl   $0x8010ffe0,0x8(%ebp)
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e55:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e58:	5b                   	pop    %ebx
80100e59:	5e                   	pop    %esi
80100e5a:	5f                   	pop    %edi
80100e5b:	5d                   	pop    %ebp

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
80100e5c:	e9 df 38 00 00       	jmp    80104740 <release>
80100e61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return;
  }
  ff = *f;
80100e68:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100e6c:	8b 1f                	mov    (%edi),%ebx
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e6e:	83 ec 0c             	sub    $0xc,%esp
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e71:	8b 77 0c             	mov    0xc(%edi),%esi
  f->ref = 0;
  f->type = FD_NONE;
80100e74:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e7a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e7d:	8b 47 10             	mov    0x10(%edi),%eax
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e80:	68 e0 ff 10 80       	push   $0x8010ffe0
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e85:	89 45 e0             	mov    %eax,-0x20(%ebp)
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e88:	e8 b3 38 00 00       	call   80104740 <release>

  if(ff.type == FD_PIPE)
80100e8d:	83 c4 10             	add    $0x10,%esp
80100e90:	83 fb 01             	cmp    $0x1,%ebx
80100e93:	74 13                	je     80100ea8 <fileclose+0x88>
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
80100e95:	83 fb 02             	cmp    $0x2,%ebx
80100e98:	74 26                	je     80100ec0 <fileclose+0xa0>
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e9a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e9d:	5b                   	pop    %ebx
80100e9e:	5e                   	pop    %esi
80100e9f:	5f                   	pop    %edi
80100ea0:	5d                   	pop    %ebp
80100ea1:	c3                   	ret    
80100ea2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);

  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
80100ea8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100eac:	83 ec 08             	sub    $0x8,%esp
80100eaf:	53                   	push   %ebx
80100eb0:	56                   	push   %esi
80100eb1:	e8 7a 25 00 00       	call   80103430 <pipeclose>
80100eb6:	83 c4 10             	add    $0x10,%esp
80100eb9:	eb df                	jmp    80100e9a <fileclose+0x7a>
80100ebb:	90                   	nop
80100ebc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  else if(ff.type == FD_INODE){
    begin_op();
80100ec0:	e8 cb 1c 00 00       	call   80102b90 <begin_op>
    iput(ff.ip);
80100ec5:	83 ec 0c             	sub    $0xc,%esp
80100ec8:	ff 75 e0             	pushl  -0x20(%ebp)
80100ecb:	e8 c0 08 00 00       	call   80101790 <iput>
    end_op();
80100ed0:	83 c4 10             	add    $0x10,%esp
  }
}
80100ed3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ed6:	5b                   	pop    %ebx
80100ed7:	5e                   	pop    %esi
80100ed8:	5f                   	pop    %edi
80100ed9:	5d                   	pop    %ebp
  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
80100eda:	e9 21 1d 00 00       	jmp    80102c00 <end_op>
{
  struct file ff;

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
80100edf:	83 ec 0c             	sub    $0xc,%esp
80100ee2:	68 78 73 10 80       	push   $0x80107378
80100ee7:	e8 84 f4 ff ff       	call   80100370 <panic>
80100eec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100ef0 <filestat>:
}

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100ef0:	55                   	push   %ebp
80100ef1:	89 e5                	mov    %esp,%ebp
80100ef3:	53                   	push   %ebx
80100ef4:	83 ec 04             	sub    $0x4,%esp
80100ef7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100efa:	83 3b 02             	cmpl   $0x2,(%ebx)
80100efd:	75 31                	jne    80100f30 <filestat+0x40>
    ilock(f->ip);
80100eff:	83 ec 0c             	sub    $0xc,%esp
80100f02:	ff 73 10             	pushl  0x10(%ebx)
80100f05:	e8 56 07 00 00       	call   80101660 <ilock>
    stati(f->ip, st);
80100f0a:	58                   	pop    %eax
80100f0b:	5a                   	pop    %edx
80100f0c:	ff 75 0c             	pushl  0xc(%ebp)
80100f0f:	ff 73 10             	pushl  0x10(%ebx)
80100f12:	e8 d9 09 00 00       	call   801018f0 <stati>
    iunlock(f->ip);
80100f17:	59                   	pop    %ecx
80100f18:	ff 73 10             	pushl  0x10(%ebx)
80100f1b:	e8 20 08 00 00       	call   80101740 <iunlock>
    return 0;
80100f20:	83 c4 10             	add    $0x10,%esp
80100f23:	31 c0                	xor    %eax,%eax
  }
  return -1;
}
80100f25:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f28:	c9                   	leave  
80100f29:	c3                   	ret    
80100f2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    ilock(f->ip);
    stati(f->ip, st);
    iunlock(f->ip);
    return 0;
  }
  return -1;
80100f30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100f35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f38:	c9                   	leave  
80100f39:	c3                   	ret    
80100f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100f40 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100f40:	55                   	push   %ebp
80100f41:	89 e5                	mov    %esp,%ebp
80100f43:	57                   	push   %edi
80100f44:	56                   	push   %esi
80100f45:	53                   	push   %ebx
80100f46:	83 ec 0c             	sub    $0xc,%esp
80100f49:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f4c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f4f:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80100f52:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f56:	74 60                	je     80100fb8 <fileread+0x78>
    return -1;
  if(f->type == FD_PIPE)
80100f58:	8b 03                	mov    (%ebx),%eax
80100f5a:	83 f8 01             	cmp    $0x1,%eax
80100f5d:	74 41                	je     80100fa0 <fileread+0x60>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100f5f:	83 f8 02             	cmp    $0x2,%eax
80100f62:	75 5b                	jne    80100fbf <fileread+0x7f>
    ilock(f->ip);
80100f64:	83 ec 0c             	sub    $0xc,%esp
80100f67:	ff 73 10             	pushl  0x10(%ebx)
80100f6a:	e8 f1 06 00 00       	call   80101660 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f6f:	57                   	push   %edi
80100f70:	ff 73 14             	pushl  0x14(%ebx)
80100f73:	56                   	push   %esi
80100f74:	ff 73 10             	pushl  0x10(%ebx)
80100f77:	e8 a4 09 00 00       	call   80101920 <readi>
80100f7c:	83 c4 20             	add    $0x20,%esp
80100f7f:	85 c0                	test   %eax,%eax
80100f81:	89 c6                	mov    %eax,%esi
80100f83:	7e 03                	jle    80100f88 <fileread+0x48>
      f->off += r;
80100f85:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80100f88:	83 ec 0c             	sub    $0xc,%esp
80100f8b:	ff 73 10             	pushl  0x10(%ebx)
80100f8e:	e8 ad 07 00 00       	call   80101740 <iunlock>
    return r;
80100f93:	83 c4 10             	add    $0x10,%esp
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
    ilock(f->ip);
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f96:	89 f0                	mov    %esi,%eax
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
80100f98:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f9b:	5b                   	pop    %ebx
80100f9c:	5e                   	pop    %esi
80100f9d:	5f                   	pop    %edi
80100f9e:	5d                   	pop    %ebp
80100f9f:	c3                   	ret    
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100fa0:	8b 43 0c             	mov    0xc(%ebx),%eax
80100fa3:	89 45 08             	mov    %eax,0x8(%ebp)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
80100fa6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fa9:	5b                   	pop    %ebx
80100faa:	5e                   	pop    %esi
80100fab:	5f                   	pop    %edi
80100fac:	5d                   	pop    %ebp
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100fad:	e9 4e 26 00 00       	jmp    80103600 <piperead>
80100fb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
fileread(struct file *f, char *addr, int n)
{
  int r;

  if(f->readable == 0)
    return -1;
80100fb8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100fbd:	eb d9                	jmp    80100f98 <fileread+0x58>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
80100fbf:	83 ec 0c             	sub    $0xc,%esp
80100fc2:	68 82 73 10 80       	push   $0x80107382
80100fc7:	e8 a4 f3 ff ff       	call   80100370 <panic>
80100fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100fd0 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100fd0:	55                   	push   %ebp
80100fd1:	89 e5                	mov    %esp,%ebp
80100fd3:	57                   	push   %edi
80100fd4:	56                   	push   %esi
80100fd5:	53                   	push   %ebx
80100fd6:	83 ec 1c             	sub    $0x1c,%esp
80100fd9:	8b 75 08             	mov    0x8(%ebp),%esi
80100fdc:	8b 45 0c             	mov    0xc(%ebp),%eax
  int r;

  if(f->writable == 0)
80100fdf:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100fe3:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100fe6:	8b 45 10             	mov    0x10(%ebp),%eax
80100fe9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int r;

  if(f->writable == 0)
80100fec:	0f 84 aa 00 00 00    	je     8010109c <filewrite+0xcc>
    return -1;
  if(f->type == FD_PIPE)
80100ff2:	8b 06                	mov    (%esi),%eax
80100ff4:	83 f8 01             	cmp    $0x1,%eax
80100ff7:	0f 84 c2 00 00 00    	je     801010bf <filewrite+0xef>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100ffd:	83 f8 02             	cmp    $0x2,%eax
80101000:	0f 85 d8 00 00 00    	jne    801010de <filewrite+0x10e>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80101006:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101009:	31 ff                	xor    %edi,%edi
8010100b:	85 c0                	test   %eax,%eax
8010100d:	7f 34                	jg     80101043 <filewrite+0x73>
8010100f:	e9 9c 00 00 00       	jmp    801010b0 <filewrite+0xe0>
80101014:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101018:	01 46 14             	add    %eax,0x14(%esi)
      iunlock(f->ip);
8010101b:	83 ec 0c             	sub    $0xc,%esp
8010101e:	ff 76 10             	pushl  0x10(%esi)
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101021:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
80101024:	e8 17 07 00 00       	call   80101740 <iunlock>
      end_op();
80101029:	e8 d2 1b 00 00       	call   80102c00 <end_op>
8010102e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101031:	83 c4 10             	add    $0x10,%esp

      if(r < 0)
        break;
      if(r != n1)
80101034:	39 d8                	cmp    %ebx,%eax
80101036:	0f 85 95 00 00 00    	jne    801010d1 <filewrite+0x101>
        panic("short filewrite");
      i += r;
8010103c:	01 c7                	add    %eax,%edi
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
8010103e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101041:	7e 6d                	jle    801010b0 <filewrite+0xe0>
      int n1 = n - i;
80101043:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101046:	b8 00 1a 00 00       	mov    $0x1a00,%eax
8010104b:	29 fb                	sub    %edi,%ebx
8010104d:	81 fb 00 1a 00 00    	cmp    $0x1a00,%ebx
80101053:	0f 4f d8             	cmovg  %eax,%ebx
      if(n1 > max)
        n1 = max;

      begin_op();
80101056:	e8 35 1b 00 00       	call   80102b90 <begin_op>
      ilock(f->ip);
8010105b:	83 ec 0c             	sub    $0xc,%esp
8010105e:	ff 76 10             	pushl  0x10(%esi)
80101061:	e8 fa 05 00 00       	call   80101660 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
80101066:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101069:	53                   	push   %ebx
8010106a:	ff 76 14             	pushl  0x14(%esi)
8010106d:	01 f8                	add    %edi,%eax
8010106f:	50                   	push   %eax
80101070:	ff 76 10             	pushl  0x10(%esi)
80101073:	e8 a8 09 00 00       	call   80101a20 <writei>
80101078:	83 c4 20             	add    $0x20,%esp
8010107b:	85 c0                	test   %eax,%eax
8010107d:	7f 99                	jg     80101018 <filewrite+0x48>
        f->off += r;
      iunlock(f->ip);
8010107f:	83 ec 0c             	sub    $0xc,%esp
80101082:	ff 76 10             	pushl  0x10(%esi)
80101085:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101088:	e8 b3 06 00 00       	call   80101740 <iunlock>
      end_op();
8010108d:	e8 6e 1b 00 00       	call   80102c00 <end_op>

      if(r < 0)
80101092:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101095:	83 c4 10             	add    $0x10,%esp
80101098:	85 c0                	test   %eax,%eax
8010109a:	74 98                	je     80101034 <filewrite+0x64>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
8010109c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        break;
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
8010109f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  panic("filewrite");
}
801010a4:	5b                   	pop    %ebx
801010a5:	5e                   	pop    %esi
801010a6:	5f                   	pop    %edi
801010a7:	5d                   	pop    %ebp
801010a8:	c3                   	ret    
801010a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        break;
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
801010b0:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
801010b3:	75 e7                	jne    8010109c <filewrite+0xcc>
  }
  panic("filewrite");
}
801010b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010b8:	89 f8                	mov    %edi,%eax
801010ba:	5b                   	pop    %ebx
801010bb:	5e                   	pop    %esi
801010bc:	5f                   	pop    %edi
801010bd:	5d                   	pop    %ebp
801010be:	c3                   	ret    
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
801010bf:	8b 46 0c             	mov    0xc(%esi),%eax
801010c2:	89 45 08             	mov    %eax,0x8(%ebp)
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010c8:	5b                   	pop    %ebx
801010c9:	5e                   	pop    %esi
801010ca:	5f                   	pop    %edi
801010cb:	5d                   	pop    %ebp
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
801010cc:	e9 ff 23 00 00       	jmp    801034d0 <pipewrite>
      end_op();

      if(r < 0)
        break;
      if(r != n1)
        panic("short filewrite");
801010d1:	83 ec 0c             	sub    $0xc,%esp
801010d4:	68 8b 73 10 80       	push   $0x8010738b
801010d9:	e8 92 f2 ff ff       	call   80100370 <panic>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
801010de:	83 ec 0c             	sub    $0xc,%esp
801010e1:	68 91 73 10 80       	push   $0x80107391
801010e6:	e8 85 f2 ff ff       	call   80100370 <panic>
801010eb:	66 90                	xchg   %ax,%ax
801010ed:	66 90                	xchg   %ax,%ax
801010ef:	90                   	nop

801010f0 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
801010f0:	55                   	push   %ebp
801010f1:	89 e5                	mov    %esp,%ebp
801010f3:	57                   	push   %edi
801010f4:	56                   	push   %esi
801010f5:	53                   	push   %ebx
801010f6:	83 ec 1c             	sub    $0x1c,%esp
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
801010f9:	8b 0d e0 09 11 80    	mov    0x801109e0,%ecx
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
801010ff:	89 45 d8             	mov    %eax,-0x28(%ebp)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
80101102:	85 c9                	test   %ecx,%ecx
80101104:	0f 84 85 00 00 00    	je     8010118f <balloc+0x9f>
8010110a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
80101111:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101114:	83 ec 08             	sub    $0x8,%esp
80101117:	89 f0                	mov    %esi,%eax
80101119:	c1 f8 0c             	sar    $0xc,%eax
8010111c:	03 05 f8 09 11 80    	add    0x801109f8,%eax
80101122:	50                   	push   %eax
80101123:	ff 75 d8             	pushl  -0x28(%ebp)
80101126:	e8 a5 ef ff ff       	call   801000d0 <bread>
8010112b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010112e:	a1 e0 09 11 80       	mov    0x801109e0,%eax
80101133:	83 c4 10             	add    $0x10,%esp
80101136:	89 45 e0             	mov    %eax,-0x20(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101139:	31 c0                	xor    %eax,%eax
8010113b:	eb 2d                	jmp    8010116a <balloc+0x7a>
8010113d:	8d 76 00             	lea    0x0(%esi),%esi
      m = 1 << (bi % 8);
80101140:	89 c1                	mov    %eax,%ecx
80101142:	ba 01 00 00 00       	mov    $0x1,%edx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101147:	8b 5d e4             	mov    -0x1c(%ebp),%ebx

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
8010114a:	83 e1 07             	and    $0x7,%ecx
8010114d:	d3 e2                	shl    %cl,%edx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010114f:	89 c1                	mov    %eax,%ecx
80101151:	c1 f9 03             	sar    $0x3,%ecx
80101154:	0f b6 7c 0b 5c       	movzbl 0x5c(%ebx,%ecx,1),%edi
80101159:	85 d7                	test   %edx,%edi
8010115b:	74 43                	je     801011a0 <balloc+0xb0>
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
8010115d:	83 c0 01             	add    $0x1,%eax
80101160:	83 c6 01             	add    $0x1,%esi
80101163:	3d 00 10 00 00       	cmp    $0x1000,%eax
80101168:	74 05                	je     8010116f <balloc+0x7f>
8010116a:	3b 75 e0             	cmp    -0x20(%ebp),%esi
8010116d:	72 d1                	jb     80101140 <balloc+0x50>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
8010116f:	83 ec 0c             	sub    $0xc,%esp
80101172:	ff 75 e4             	pushl  -0x1c(%ebp)
80101175:	e8 66 f0 ff ff       	call   801001e0 <brelse>
{
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
8010117a:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101181:	83 c4 10             	add    $0x10,%esp
80101184:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101187:	39 05 e0 09 11 80    	cmp    %eax,0x801109e0
8010118d:	77 82                	ja     80101111 <balloc+0x21>
        return b + bi;
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
8010118f:	83 ec 0c             	sub    $0xc,%esp
80101192:	68 9b 73 10 80       	push   $0x8010739b
80101197:	e8 d4 f1 ff ff       	call   80100370 <panic>
8010119c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
801011a0:	09 fa                	or     %edi,%edx
801011a2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
        log_write(bp);
801011a5:	83 ec 0c             	sub    $0xc,%esp
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
801011a8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
        log_write(bp);
801011ac:	57                   	push   %edi
801011ad:	e8 be 1b 00 00       	call   80102d70 <log_write>
        brelse(bp);
801011b2:	89 3c 24             	mov    %edi,(%esp)
801011b5:	e8 26 f0 ff ff       	call   801001e0 <brelse>
static void
bzero(int dev, int bno)
{
  struct buf *bp;

  bp = bread(dev, bno);
801011ba:	58                   	pop    %eax
801011bb:	5a                   	pop    %edx
801011bc:	56                   	push   %esi
801011bd:	ff 75 d8             	pushl  -0x28(%ebp)
801011c0:	e8 0b ef ff ff       	call   801000d0 <bread>
801011c5:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
801011c7:	8d 40 5c             	lea    0x5c(%eax),%eax
801011ca:	83 c4 0c             	add    $0xc,%esp
801011cd:	68 00 02 00 00       	push   $0x200
801011d2:	6a 00                	push   $0x0
801011d4:	50                   	push   %eax
801011d5:	e8 b6 35 00 00       	call   80104790 <memset>
  log_write(bp);
801011da:	89 1c 24             	mov    %ebx,(%esp)
801011dd:	e8 8e 1b 00 00       	call   80102d70 <log_write>
  brelse(bp);
801011e2:	89 1c 24             	mov    %ebx,(%esp)
801011e5:	e8 f6 ef ff ff       	call   801001e0 <brelse>
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
}
801011ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011ed:	89 f0                	mov    %esi,%eax
801011ef:	5b                   	pop    %ebx
801011f0:	5e                   	pop    %esi
801011f1:	5f                   	pop    %edi
801011f2:	5d                   	pop    %ebp
801011f3:	c3                   	ret    
801011f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801011fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101200 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101200:	55                   	push   %ebp
80101201:	89 e5                	mov    %esp,%ebp
80101203:	57                   	push   %edi
80101204:	56                   	push   %esi
80101205:	53                   	push   %ebx
80101206:	89 c7                	mov    %eax,%edi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
80101208:	31 f6                	xor    %esi,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010120a:	bb 34 0a 11 80       	mov    $0x80110a34,%ebx
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
8010120f:	83 ec 28             	sub    $0x28,%esp
80101212:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  struct inode *ip, *empty;

  acquire(&icache.lock);
80101215:	68 00 0a 11 80       	push   $0x80110a00
8010121a:	e8 41 33 00 00       	call   80104560 <acquire>
8010121f:	83 c4 10             	add    $0x10,%esp

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101222:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101225:	eb 1b                	jmp    80101242 <iget+0x42>
80101227:	89 f6                	mov    %esi,%esi
80101229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101230:	85 f6                	test   %esi,%esi
80101232:	74 44                	je     80101278 <iget+0x78>

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101234:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010123a:	81 fb 54 26 11 80    	cmp    $0x80112654,%ebx
80101240:	74 4e                	je     80101290 <iget+0x90>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101242:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101245:	85 c9                	test   %ecx,%ecx
80101247:	7e e7                	jle    80101230 <iget+0x30>
80101249:	39 3b                	cmp    %edi,(%ebx)
8010124b:	75 e3                	jne    80101230 <iget+0x30>
8010124d:	39 53 04             	cmp    %edx,0x4(%ebx)
80101250:	75 de                	jne    80101230 <iget+0x30>
      ip->ref++;
      release(&icache.lock);
80101252:	83 ec 0c             	sub    $0xc,%esp

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
80101255:	83 c1 01             	add    $0x1,%ecx
      release(&icache.lock);
      return ip;
80101258:	89 de                	mov    %ebx,%esi
  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
8010125a:	68 00 0a 11 80       	push   $0x80110a00

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
8010125f:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
80101262:	e8 d9 34 00 00       	call   80104740 <release>
      return ip;
80101267:	83 c4 10             	add    $0x10,%esp
  ip->ref = 1;
  ip->flags = 0;
  release(&icache.lock);

  return ip;
}
8010126a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010126d:	89 f0                	mov    %esi,%eax
8010126f:	5b                   	pop    %ebx
80101270:	5e                   	pop    %esi
80101271:	5f                   	pop    %edi
80101272:	5d                   	pop    %ebp
80101273:	c3                   	ret    
80101274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101278:	85 c9                	test   %ecx,%ecx
8010127a:	0f 44 f3             	cmove  %ebx,%esi

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010127d:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101283:	81 fb 54 26 11 80    	cmp    $0x80112654,%ebx
80101289:	75 b7                	jne    80101242 <iget+0x42>
8010128b:	90                   	nop
8010128c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
80101290:	85 f6                	test   %esi,%esi
80101292:	74 2d                	je     801012c1 <iget+0xc1>
  ip = empty;
  ip->dev = dev;
  ip->inum = inum;
  ip->ref = 1;
  ip->flags = 0;
  release(&icache.lock);
80101294:	83 ec 0c             	sub    $0xc,%esp
  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");

  ip = empty;
  ip->dev = dev;
80101297:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
80101299:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
8010129c:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->flags = 0;
801012a3:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
801012aa:	68 00 0a 11 80       	push   $0x80110a00
801012af:	e8 8c 34 00 00       	call   80104740 <release>

  return ip;
801012b4:	83 c4 10             	add    $0x10,%esp
}
801012b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012ba:	89 f0                	mov    %esi,%eax
801012bc:	5b                   	pop    %ebx
801012bd:	5e                   	pop    %esi
801012be:	5f                   	pop    %edi
801012bf:	5d                   	pop    %ebp
801012c0:	c3                   	ret    
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");
801012c1:	83 ec 0c             	sub    $0xc,%esp
801012c4:	68 b1 73 10 80       	push   $0x801073b1
801012c9:	e8 a2 f0 ff ff       	call   80100370 <panic>
801012ce:	66 90                	xchg   %ax,%ax

801012d0 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
801012d0:	55                   	push   %ebp
801012d1:	89 e5                	mov    %esp,%ebp
801012d3:	57                   	push   %edi
801012d4:	56                   	push   %esi
801012d5:	53                   	push   %ebx
801012d6:	89 c6                	mov    %eax,%esi
801012d8:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
801012db:	83 fa 0b             	cmp    $0xb,%edx
801012de:	77 18                	ja     801012f8 <bmap+0x28>
801012e0:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
    if((addr = ip->addrs[bn]) == 0)
801012e3:	8b 43 5c             	mov    0x5c(%ebx),%eax
801012e6:	85 c0                	test   %eax,%eax
801012e8:	74 76                	je     80101360 <bmap+0x90>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
801012ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012ed:	5b                   	pop    %ebx
801012ee:	5e                   	pop    %esi
801012ef:	5f                   	pop    %edi
801012f0:	5d                   	pop    %ebp
801012f1:	c3                   	ret    
801012f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }
  bn -= NDIRECT;
801012f8:	8d 5a f4             	lea    -0xc(%edx),%ebx

  if(bn < NINDIRECT){
801012fb:	83 fb 7f             	cmp    $0x7f,%ebx
801012fe:	0f 87 83 00 00 00    	ja     80101387 <bmap+0xb7>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
80101304:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
8010130a:	85 c0                	test   %eax,%eax
8010130c:	74 6a                	je     80101378 <bmap+0xa8>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
8010130e:	83 ec 08             	sub    $0x8,%esp
80101311:	50                   	push   %eax
80101312:	ff 36                	pushl  (%esi)
80101314:	e8 b7 ed ff ff       	call   801000d0 <bread>
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101319:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010131d:	83 c4 10             	add    $0x10,%esp

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
80101320:	89 c7                	mov    %eax,%edi
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101322:	8b 1a                	mov    (%edx),%ebx
80101324:	85 db                	test   %ebx,%ebx
80101326:	75 1d                	jne    80101345 <bmap+0x75>
      a[bn] = addr = balloc(ip->dev);
80101328:	8b 06                	mov    (%esi),%eax
8010132a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010132d:	e8 be fd ff ff       	call   801010f0 <balloc>
80101332:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      log_write(bp);
80101335:	83 ec 0c             	sub    $0xc,%esp
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
      a[bn] = addr = balloc(ip->dev);
80101338:	89 c3                	mov    %eax,%ebx
8010133a:	89 02                	mov    %eax,(%edx)
      log_write(bp);
8010133c:	57                   	push   %edi
8010133d:	e8 2e 1a 00 00       	call   80102d70 <log_write>
80101342:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
80101345:	83 ec 0c             	sub    $0xc,%esp
80101348:	57                   	push   %edi
80101349:	e8 92 ee ff ff       	call   801001e0 <brelse>
8010134e:	83 c4 10             	add    $0x10,%esp
    return addr;
  }

  panic("bmap: out of range");
}
80101351:	8d 65 f4             	lea    -0xc(%ebp),%esp
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
      a[bn] = addr = balloc(ip->dev);
      log_write(bp);
    }
    brelse(bp);
80101354:	89 d8                	mov    %ebx,%eax
    return addr;
  }

  panic("bmap: out of range");
}
80101356:	5b                   	pop    %ebx
80101357:	5e                   	pop    %esi
80101358:	5f                   	pop    %edi
80101359:	5d                   	pop    %ebp
8010135a:	c3                   	ret    
8010135b:	90                   	nop
8010135c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
80101360:	8b 06                	mov    (%esi),%eax
80101362:	e8 89 fd ff ff       	call   801010f0 <balloc>
80101367:	89 43 5c             	mov    %eax,0x5c(%ebx)
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
8010136a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010136d:	5b                   	pop    %ebx
8010136e:	5e                   	pop    %esi
8010136f:	5f                   	pop    %edi
80101370:	5d                   	pop    %ebp
80101371:	c3                   	ret    
80101372:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  bn -= NDIRECT;

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
80101378:	8b 06                	mov    (%esi),%eax
8010137a:	e8 71 fd ff ff       	call   801010f0 <balloc>
8010137f:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
80101385:	eb 87                	jmp    8010130e <bmap+0x3e>
    }
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
80101387:	83 ec 0c             	sub    $0xc,%esp
8010138a:	68 c1 73 10 80       	push   $0x801073c1
8010138f:	e8 dc ef ff ff       	call   80100370 <panic>
80101394:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010139a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801013a0 <readsb>:
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
801013a0:	55                   	push   %ebp
801013a1:	89 e5                	mov    %esp,%ebp
801013a3:	56                   	push   %esi
801013a4:	53                   	push   %ebx
801013a5:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct buf *bp;

  bp = bread(dev, 1);
801013a8:	83 ec 08             	sub    $0x8,%esp
801013ab:	6a 01                	push   $0x1
801013ad:	ff 75 08             	pushl  0x8(%ebp)
801013b0:	e8 1b ed ff ff       	call   801000d0 <bread>
801013b5:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
801013b7:	8d 40 5c             	lea    0x5c(%eax),%eax
801013ba:	83 c4 0c             	add    $0xc,%esp
801013bd:	6a 1c                	push   $0x1c
801013bf:	50                   	push   %eax
801013c0:	56                   	push   %esi
801013c1:	e8 7a 34 00 00       	call   80104840 <memmove>
  brelse(bp);
801013c6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801013c9:	83 c4 10             	add    $0x10,%esp
}
801013cc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801013cf:	5b                   	pop    %ebx
801013d0:	5e                   	pop    %esi
801013d1:	5d                   	pop    %ebp
{
  struct buf *bp;

  bp = bread(dev, 1);
  memmove(sb, bp->data, sizeof(*sb));
  brelse(bp);
801013d2:	e9 09 ee ff ff       	jmp    801001e0 <brelse>
801013d7:	89 f6                	mov    %esi,%esi
801013d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801013e0 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
801013e0:	55                   	push   %ebp
801013e1:	89 e5                	mov    %esp,%ebp
801013e3:	56                   	push   %esi
801013e4:	53                   	push   %ebx
801013e5:	89 d3                	mov    %edx,%ebx
801013e7:	89 c6                	mov    %eax,%esi
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
801013e9:	83 ec 08             	sub    $0x8,%esp
801013ec:	68 e0 09 11 80       	push   $0x801109e0
801013f1:	50                   	push   %eax
801013f2:	e8 a9 ff ff ff       	call   801013a0 <readsb>
  bp = bread(dev, BBLOCK(b, sb));
801013f7:	58                   	pop    %eax
801013f8:	5a                   	pop    %edx
801013f9:	89 da                	mov    %ebx,%edx
801013fb:	c1 ea 0c             	shr    $0xc,%edx
801013fe:	03 15 f8 09 11 80    	add    0x801109f8,%edx
80101404:	52                   	push   %edx
80101405:	56                   	push   %esi
80101406:	e8 c5 ec ff ff       	call   801000d0 <bread>
  bi = b % BPB;
  m = 1 << (bi % 8);
8010140b:	89 d9                	mov    %ebx,%ecx
  if((bp->data[bi/8] & m) == 0)
8010140d:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
80101413:	ba 01 00 00 00       	mov    $0x1,%edx
80101418:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
8010141b:	c1 fb 03             	sar    $0x3,%ebx
8010141e:	83 c4 10             	add    $0x10,%esp
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
80101421:	d3 e2                	shl    %cl,%edx
  if((bp->data[bi/8] & m) == 0)
80101423:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101428:	85 d1                	test   %edx,%ecx
8010142a:	74 27                	je     80101453 <bfree+0x73>
8010142c:	89 c6                	mov    %eax,%esi
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
8010142e:	f7 d2                	not    %edx
80101430:	89 c8                	mov    %ecx,%eax
  log_write(bp);
80101432:	83 ec 0c             	sub    $0xc,%esp
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
80101435:	21 d0                	and    %edx,%eax
80101437:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
  log_write(bp);
8010143b:	56                   	push   %esi
8010143c:	e8 2f 19 00 00       	call   80102d70 <log_write>
  brelse(bp);
80101441:	89 34 24             	mov    %esi,(%esp)
80101444:	e8 97 ed ff ff       	call   801001e0 <brelse>
}
80101449:	83 c4 10             	add    $0x10,%esp
8010144c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010144f:	5b                   	pop    %ebx
80101450:	5e                   	pop    %esi
80101451:	5d                   	pop    %ebp
80101452:	c3                   	ret    
  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
80101453:	83 ec 0c             	sub    $0xc,%esp
80101456:	68 d4 73 10 80       	push   $0x801073d4
8010145b:	e8 10 ef ff ff       	call   80100370 <panic>

80101460 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(int dev)
{
80101460:	55                   	push   %ebp
80101461:	89 e5                	mov    %esp,%ebp
80101463:	53                   	push   %ebx
80101464:	bb 40 0a 11 80       	mov    $0x80110a40,%ebx
80101469:	83 ec 0c             	sub    $0xc,%esp
  int i = 0;
  
  initlock(&icache.lock, "icache");
8010146c:	68 e7 73 10 80       	push   $0x801073e7
80101471:	68 00 0a 11 80       	push   $0x80110a00
80101476:	e8 c5 30 00 00       	call   80104540 <initlock>
8010147b:	83 c4 10             	add    $0x10,%esp
8010147e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < NINODE; i++) {
    initsleeplock(&icache.inode[i].lock, "inode");
80101480:	83 ec 08             	sub    $0x8,%esp
80101483:	68 ee 73 10 80       	push   $0x801073ee
80101488:	53                   	push   %ebx
80101489:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010148f:	e8 9c 2f 00 00       	call   80104430 <initsleeplock>
iinit(int dev)
{
  int i = 0;
  
  initlock(&icache.lock, "icache");
  for(i = 0; i < NINODE; i++) {
80101494:	83 c4 10             	add    $0x10,%esp
80101497:	81 fb 60 26 11 80    	cmp    $0x80112660,%ebx
8010149d:	75 e1                	jne    80101480 <iinit+0x20>
    initsleeplock(&icache.inode[i].lock, "inode");
  }
  
  readsb(dev, &sb);
8010149f:	83 ec 08             	sub    $0x8,%esp
801014a2:	68 e0 09 11 80       	push   $0x801109e0
801014a7:	ff 75 08             	pushl  0x8(%ebp)
801014aa:	e8 f1 fe ff ff       	call   801013a0 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
801014af:	ff 35 f8 09 11 80    	pushl  0x801109f8
801014b5:	ff 35 f4 09 11 80    	pushl  0x801109f4
801014bb:	ff 35 f0 09 11 80    	pushl  0x801109f0
801014c1:	ff 35 ec 09 11 80    	pushl  0x801109ec
801014c7:	ff 35 e8 09 11 80    	pushl  0x801109e8
801014cd:	ff 35 e4 09 11 80    	pushl  0x801109e4
801014d3:	ff 35 e0 09 11 80    	pushl  0x801109e0
801014d9:	68 44 74 10 80       	push   $0x80107444
801014de:	e8 7d f1 ff ff       	call   80100660 <cprintf>
 inodestart %d bmap start %d\n", sb.size, sb.nblocks,
          sb.ninodes, sb.nlog, sb.logstart, sb.inodestart,
          sb.bmapstart);
}
801014e3:	83 c4 30             	add    $0x30,%esp
801014e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801014e9:	c9                   	leave  
801014ea:	c3                   	ret    
801014eb:	90                   	nop
801014ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801014f0 <ialloc>:
//PAGEBREAK!
// Allocate a new inode with the given type on device dev.
// A free inode has a type of zero.
struct inode*
ialloc(uint dev, short type)
{
801014f0:	55                   	push   %ebp
801014f1:	89 e5                	mov    %esp,%ebp
801014f3:	57                   	push   %edi
801014f4:	56                   	push   %esi
801014f5:	53                   	push   %ebx
801014f6:	83 ec 1c             	sub    $0x1c,%esp
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
801014f9:	83 3d e8 09 11 80 01 	cmpl   $0x1,0x801109e8
//PAGEBREAK!
// Allocate a new inode with the given type on device dev.
// A free inode has a type of zero.
struct inode*
ialloc(uint dev, short type)
{
80101500:	8b 45 0c             	mov    0xc(%ebp),%eax
80101503:	8b 75 08             	mov    0x8(%ebp),%esi
80101506:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101509:	0f 86 91 00 00 00    	jbe    801015a0 <ialloc+0xb0>
8010150f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101514:	eb 21                	jmp    80101537 <ialloc+0x47>
80101516:	8d 76 00             	lea    0x0(%esi),%esi
80101519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101520:	83 ec 0c             	sub    $0xc,%esp
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101523:	83 c3 01             	add    $0x1,%ebx
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101526:	57                   	push   %edi
80101527:	e8 b4 ec ff ff       	call   801001e0 <brelse>
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
8010152c:	83 c4 10             	add    $0x10,%esp
8010152f:	39 1d e8 09 11 80    	cmp    %ebx,0x801109e8
80101535:	76 69                	jbe    801015a0 <ialloc+0xb0>
    bp = bread(dev, IBLOCK(inum, sb));
80101537:	89 d8                	mov    %ebx,%eax
80101539:	83 ec 08             	sub    $0x8,%esp
8010153c:	c1 e8 03             	shr    $0x3,%eax
8010153f:	03 05 f4 09 11 80    	add    0x801109f4,%eax
80101545:	50                   	push   %eax
80101546:	56                   	push   %esi
80101547:	e8 84 eb ff ff       	call   801000d0 <bread>
8010154c:	89 c7                	mov    %eax,%edi
    dip = (struct dinode*)bp->data + inum%IPB;
8010154e:	89 d8                	mov    %ebx,%eax
    if(dip->type == 0){  // a free inode
80101550:	83 c4 10             	add    $0x10,%esp
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    bp = bread(dev, IBLOCK(inum, sb));
    dip = (struct dinode*)bp->data + inum%IPB;
80101553:	83 e0 07             	and    $0x7,%eax
80101556:	c1 e0 06             	shl    $0x6,%eax
80101559:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
8010155d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101561:	75 bd                	jne    80101520 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
80101563:	83 ec 04             	sub    $0x4,%esp
80101566:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101569:	6a 40                	push   $0x40
8010156b:	6a 00                	push   $0x0
8010156d:	51                   	push   %ecx
8010156e:	e8 1d 32 00 00       	call   80104790 <memset>
      dip->type = type;
80101573:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101577:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010157a:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
8010157d:	89 3c 24             	mov    %edi,(%esp)
80101580:	e8 eb 17 00 00       	call   80102d70 <log_write>
      brelse(bp);
80101585:	89 3c 24             	mov    %edi,(%esp)
80101588:	e8 53 ec ff ff       	call   801001e0 <brelse>
      return iget(dev, inum);
8010158d:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
80101590:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
80101593:	89 da                	mov    %ebx,%edx
80101595:	89 f0                	mov    %esi,%eax
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
80101597:	5b                   	pop    %ebx
80101598:	5e                   	pop    %esi
80101599:	5f                   	pop    %edi
8010159a:	5d                   	pop    %ebp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
8010159b:	e9 60 fc ff ff       	jmp    80101200 <iget>
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
801015a0:	83 ec 0c             	sub    $0xc,%esp
801015a3:	68 f4 73 10 80       	push   $0x801073f4
801015a8:	e8 c3 ed ff ff       	call   80100370 <panic>
801015ad:	8d 76 00             	lea    0x0(%esi),%esi

801015b0 <iupdate>:
}

// Copy a modified in-memory inode to disk.
void
iupdate(struct inode *ip)
{
801015b0:	55                   	push   %ebp
801015b1:	89 e5                	mov    %esp,%ebp
801015b3:	56                   	push   %esi
801015b4:	53                   	push   %ebx
801015b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015b8:	83 ec 08             	sub    $0x8,%esp
801015bb:	8b 43 04             	mov    0x4(%ebx),%eax
  dip->type = ip->type;
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015be:	83 c3 5c             	add    $0x5c,%ebx
iupdate(struct inode *ip)
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015c1:	c1 e8 03             	shr    $0x3,%eax
801015c4:	03 05 f4 09 11 80    	add    0x801109f4,%eax
801015ca:	50                   	push   %eax
801015cb:	ff 73 a4             	pushl  -0x5c(%ebx)
801015ce:	e8 fd ea ff ff       	call   801000d0 <bread>
801015d3:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801015d5:	8b 43 a8             	mov    -0x58(%ebx),%eax
  dip->type = ip->type;
801015d8:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015dc:	83 c4 0c             	add    $0xc,%esp
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801015df:	83 e0 07             	and    $0x7,%eax
801015e2:	c1 e0 06             	shl    $0x6,%eax
801015e5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
801015e9:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
801015ec:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015f0:	83 c0 0c             	add    $0xc,%eax
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  dip->type = ip->type;
  dip->major = ip->major;
801015f3:	66 89 50 f6          	mov    %dx,-0xa(%eax)
  dip->minor = ip->minor;
801015f7:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
801015fb:	66 89 50 f8          	mov    %dx,-0x8(%eax)
  dip->nlink = ip->nlink;
801015ff:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101603:	66 89 50 fa          	mov    %dx,-0x6(%eax)
  dip->size = ip->size;
80101607:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010160a:	89 50 fc             	mov    %edx,-0x4(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010160d:	6a 34                	push   $0x34
8010160f:	53                   	push   %ebx
80101610:	50                   	push   %eax
80101611:	e8 2a 32 00 00       	call   80104840 <memmove>
  log_write(bp);
80101616:	89 34 24             	mov    %esi,(%esp)
80101619:	e8 52 17 00 00       	call   80102d70 <log_write>
  brelse(bp);
8010161e:	89 75 08             	mov    %esi,0x8(%ebp)
80101621:	83 c4 10             	add    $0x10,%esp
}
80101624:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101627:	5b                   	pop    %ebx
80101628:	5e                   	pop    %esi
80101629:	5d                   	pop    %ebp
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  log_write(bp);
  brelse(bp);
8010162a:	e9 b1 eb ff ff       	jmp    801001e0 <brelse>
8010162f:	90                   	nop

80101630 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
80101630:	55                   	push   %ebp
80101631:	89 e5                	mov    %esp,%ebp
80101633:	53                   	push   %ebx
80101634:	83 ec 10             	sub    $0x10,%esp
80101637:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010163a:	68 00 0a 11 80       	push   $0x80110a00
8010163f:	e8 1c 2f 00 00       	call   80104560 <acquire>
  ip->ref++;
80101644:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
80101648:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010164f:	e8 ec 30 00 00       	call   80104740 <release>
  return ip;
}
80101654:	89 d8                	mov    %ebx,%eax
80101656:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101659:	c9                   	leave  
8010165a:	c3                   	ret    
8010165b:	90                   	nop
8010165c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101660 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
80101660:	55                   	push   %ebp
80101661:	89 e5                	mov    %esp,%ebp
80101663:	56                   	push   %esi
80101664:	53                   	push   %ebx
80101665:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
80101668:	85 db                	test   %ebx,%ebx
8010166a:	0f 84 b4 00 00 00    	je     80101724 <ilock+0xc4>
80101670:	8b 43 08             	mov    0x8(%ebx),%eax
80101673:	85 c0                	test   %eax,%eax
80101675:	0f 8e a9 00 00 00    	jle    80101724 <ilock+0xc4>
    panic("ilock");

  acquiresleep(&ip->lock);
8010167b:	8d 43 0c             	lea    0xc(%ebx),%eax
8010167e:	83 ec 0c             	sub    $0xc,%esp
80101681:	50                   	push   %eax
80101682:	e8 e9 2d 00 00       	call   80104470 <acquiresleep>

  if(!(ip->flags & I_VALID)){
80101687:	83 c4 10             	add    $0x10,%esp
8010168a:	f6 43 4c 02          	testb  $0x2,0x4c(%ebx)
8010168e:	74 10                	je     801016a0 <ilock+0x40>
    brelse(bp);
    ip->flags |= I_VALID;
    if(ip->type == 0)
      panic("ilock: no type");
  }
}
80101690:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101693:	5b                   	pop    %ebx
80101694:	5e                   	pop    %esi
80101695:	5d                   	pop    %ebp
80101696:	c3                   	ret    
80101697:	89 f6                	mov    %esi,%esi
80101699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    panic("ilock");

  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016a0:	8b 43 04             	mov    0x4(%ebx),%eax
801016a3:	83 ec 08             	sub    $0x8,%esp
801016a6:	c1 e8 03             	shr    $0x3,%eax
801016a9:	03 05 f4 09 11 80    	add    0x801109f4,%eax
801016af:	50                   	push   %eax
801016b0:	ff 33                	pushl  (%ebx)
801016b2:	e8 19 ea ff ff       	call   801000d0 <bread>
801016b7:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016b9:	8b 43 04             	mov    0x4(%ebx),%eax
    ip->type = dip->type;
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016bc:	83 c4 0c             	add    $0xc,%esp

  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016bf:	83 e0 07             	and    $0x7,%eax
801016c2:	c1 e0 06             	shl    $0x6,%eax
801016c5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
801016c9:	0f b7 10             	movzwl (%eax),%edx
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016cc:	83 c0 0c             	add    $0xc,%eax
  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    ip->type = dip->type;
801016cf:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
801016d3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801016d7:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
801016db:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801016df:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
801016e3:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
801016e7:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
801016eb:	8b 50 fc             	mov    -0x4(%eax),%edx
801016ee:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016f1:	6a 34                	push   $0x34
801016f3:	50                   	push   %eax
801016f4:	8d 43 5c             	lea    0x5c(%ebx),%eax
801016f7:	50                   	push   %eax
801016f8:	e8 43 31 00 00       	call   80104840 <memmove>
    brelse(bp);
801016fd:	89 34 24             	mov    %esi,(%esp)
80101700:	e8 db ea ff ff       	call   801001e0 <brelse>
    ip->flags |= I_VALID;
80101705:	83 4b 4c 02          	orl    $0x2,0x4c(%ebx)
    if(ip->type == 0)
80101709:	83 c4 10             	add    $0x10,%esp
8010170c:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
80101711:	0f 85 79 ff ff ff    	jne    80101690 <ilock+0x30>
      panic("ilock: no type");
80101717:	83 ec 0c             	sub    $0xc,%esp
8010171a:	68 0c 74 10 80       	push   $0x8010740c
8010171f:	e8 4c ec ff ff       	call   80100370 <panic>
{
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    panic("ilock");
80101724:	83 ec 0c             	sub    $0xc,%esp
80101727:	68 06 74 10 80       	push   $0x80107406
8010172c:	e8 3f ec ff ff       	call   80100370 <panic>
80101731:	eb 0d                	jmp    80101740 <iunlock>
80101733:	90                   	nop
80101734:	90                   	nop
80101735:	90                   	nop
80101736:	90                   	nop
80101737:	90                   	nop
80101738:	90                   	nop
80101739:	90                   	nop
8010173a:	90                   	nop
8010173b:	90                   	nop
8010173c:	90                   	nop
8010173d:	90                   	nop
8010173e:	90                   	nop
8010173f:	90                   	nop

80101740 <iunlock>:
}

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
80101740:	55                   	push   %ebp
80101741:	89 e5                	mov    %esp,%ebp
80101743:	56                   	push   %esi
80101744:	53                   	push   %ebx
80101745:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101748:	85 db                	test   %ebx,%ebx
8010174a:	74 28                	je     80101774 <iunlock+0x34>
8010174c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010174f:	83 ec 0c             	sub    $0xc,%esp
80101752:	56                   	push   %esi
80101753:	e8 b8 2d 00 00       	call   80104510 <holdingsleep>
80101758:	83 c4 10             	add    $0x10,%esp
8010175b:	85 c0                	test   %eax,%eax
8010175d:	74 15                	je     80101774 <iunlock+0x34>
8010175f:	8b 43 08             	mov    0x8(%ebx),%eax
80101762:	85 c0                	test   %eax,%eax
80101764:	7e 0e                	jle    80101774 <iunlock+0x34>
    panic("iunlock");

  releasesleep(&ip->lock);
80101766:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101769:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010176c:	5b                   	pop    %ebx
8010176d:	5e                   	pop    %esi
8010176e:	5d                   	pop    %ebp
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");

  releasesleep(&ip->lock);
8010176f:	e9 5c 2d 00 00       	jmp    801044d0 <releasesleep>
// Unlock the given inode.
void
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");
80101774:	83 ec 0c             	sub    $0xc,%esp
80101777:	68 1b 74 10 80       	push   $0x8010741b
8010177c:	e8 ef eb ff ff       	call   80100370 <panic>
80101781:	eb 0d                	jmp    80101790 <iput>
80101783:	90                   	nop
80101784:	90                   	nop
80101785:	90                   	nop
80101786:	90                   	nop
80101787:	90                   	nop
80101788:	90                   	nop
80101789:	90                   	nop
8010178a:	90                   	nop
8010178b:	90                   	nop
8010178c:	90                   	nop
8010178d:	90                   	nop
8010178e:	90                   	nop
8010178f:	90                   	nop

80101790 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
80101790:	55                   	push   %ebp
80101791:	89 e5                	mov    %esp,%ebp
80101793:	57                   	push   %edi
80101794:	56                   	push   %esi
80101795:	53                   	push   %ebx
80101796:	83 ec 28             	sub    $0x28,%esp
80101799:	8b 75 08             	mov    0x8(%ebp),%esi
  acquire(&icache.lock);
8010179c:	68 00 0a 11 80       	push   $0x80110a00
801017a1:	e8 ba 2d 00 00       	call   80104560 <acquire>
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
801017a6:	8b 46 08             	mov    0x8(%esi),%eax
801017a9:	83 c4 10             	add    $0x10,%esp
801017ac:	83 f8 01             	cmp    $0x1,%eax
801017af:	74 1f                	je     801017d0 <iput+0x40>
    ip->type = 0;
    iupdate(ip);
    acquire(&icache.lock);
    ip->flags = 0;
  }
  ip->ref--;
801017b1:	83 e8 01             	sub    $0x1,%eax
801017b4:	89 46 08             	mov    %eax,0x8(%esi)
  release(&icache.lock);
801017b7:	c7 45 08 00 0a 11 80 	movl   $0x80110a00,0x8(%ebp)
}
801017be:	8d 65 f4             	lea    -0xc(%ebp),%esp
801017c1:	5b                   	pop    %ebx
801017c2:	5e                   	pop    %esi
801017c3:	5f                   	pop    %edi
801017c4:	5d                   	pop    %ebp
    iupdate(ip);
    acquire(&icache.lock);
    ip->flags = 0;
  }
  ip->ref--;
  release(&icache.lock);
801017c5:	e9 76 2f 00 00       	jmp    80104740 <release>
801017ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
// case it has to free the inode.
void
iput(struct inode *ip)
{
  acquire(&icache.lock);
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
801017d0:	f6 46 4c 02          	testb  $0x2,0x4c(%esi)
801017d4:	74 db                	je     801017b1 <iput+0x21>
801017d6:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
801017db:	75 d4                	jne    801017b1 <iput+0x21>
    // inode has no links and no other references: truncate and free.
    release(&icache.lock);
801017dd:	83 ec 0c             	sub    $0xc,%esp
801017e0:	8d 5e 5c             	lea    0x5c(%esi),%ebx
801017e3:	8d be 8c 00 00 00    	lea    0x8c(%esi),%edi
801017e9:	68 00 0a 11 80       	push   $0x80110a00
801017ee:	e8 4d 2f 00 00       	call   80104740 <release>
801017f3:	83 c4 10             	add    $0x10,%esp
801017f6:	eb 0f                	jmp    80101807 <iput+0x77>
801017f8:	90                   	nop
801017f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101800:	83 c3 04             	add    $0x4,%ebx
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101803:	39 fb                	cmp    %edi,%ebx
80101805:	74 19                	je     80101820 <iput+0x90>
    if(ip->addrs[i]){
80101807:	8b 13                	mov    (%ebx),%edx
80101809:	85 d2                	test   %edx,%edx
8010180b:	74 f3                	je     80101800 <iput+0x70>
      bfree(ip->dev, ip->addrs[i]);
8010180d:	8b 06                	mov    (%esi),%eax
8010180f:	e8 cc fb ff ff       	call   801013e0 <bfree>
      ip->addrs[i] = 0;
80101814:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010181a:	eb e4                	jmp    80101800 <iput+0x70>
8010181c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  if(ip->addrs[NDIRECT]){
80101820:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101826:	85 c0                	test   %eax,%eax
80101828:	75 46                	jne    80101870 <iput+0xe0>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
  iupdate(ip);
8010182a:	83 ec 0c             	sub    $0xc,%esp
    brelse(bp);
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
8010182d:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
  iupdate(ip);
80101834:	56                   	push   %esi
80101835:	e8 76 fd ff ff       	call   801015b0 <iupdate>
  acquire(&icache.lock);
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
    // inode has no links and no other references: truncate and free.
    release(&icache.lock);
    itrunc(ip);
    ip->type = 0;
8010183a:	31 c0                	xor    %eax,%eax
8010183c:	66 89 46 50          	mov    %ax,0x50(%esi)
    iupdate(ip);
80101840:	89 34 24             	mov    %esi,(%esp)
80101843:	e8 68 fd ff ff       	call   801015b0 <iupdate>
    acquire(&icache.lock);
80101848:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010184f:	e8 0c 2d 00 00       	call   80104560 <acquire>
    ip->flags = 0;
80101854:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
8010185b:	8b 46 08             	mov    0x8(%esi),%eax
8010185e:	83 c4 10             	add    $0x10,%esp
80101861:	e9 4b ff ff ff       	jmp    801017b1 <iput+0x21>
80101866:	8d 76 00             	lea    0x0(%esi),%esi
80101869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      ip->addrs[i] = 0;
    }
  }

  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101870:	83 ec 08             	sub    $0x8,%esp
80101873:	50                   	push   %eax
80101874:	ff 36                	pushl  (%esi)
80101876:	e8 55 e8 ff ff       	call   801000d0 <bread>
8010187b:	83 c4 10             	add    $0x10,%esp
8010187e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
80101881:	8d 58 5c             	lea    0x5c(%eax),%ebx
80101884:	8d b8 5c 02 00 00    	lea    0x25c(%eax),%edi
8010188a:	eb 0b                	jmp    80101897 <iput+0x107>
8010188c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101890:	83 c3 04             	add    $0x4,%ebx
    for(j = 0; j < NINDIRECT; j++){
80101893:	39 df                	cmp    %ebx,%edi
80101895:	74 0f                	je     801018a6 <iput+0x116>
      if(a[j])
80101897:	8b 13                	mov    (%ebx),%edx
80101899:	85 d2                	test   %edx,%edx
8010189b:	74 f3                	je     80101890 <iput+0x100>
        bfree(ip->dev, a[j]);
8010189d:	8b 06                	mov    (%esi),%eax
8010189f:	e8 3c fb ff ff       	call   801013e0 <bfree>
801018a4:	eb ea                	jmp    80101890 <iput+0x100>
    }
    brelse(bp);
801018a6:	83 ec 0c             	sub    $0xc,%esp
801018a9:	ff 75 e4             	pushl  -0x1c(%ebp)
801018ac:	e8 2f e9 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
801018b1:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
801018b7:	8b 06                	mov    (%esi),%eax
801018b9:	e8 22 fb ff ff       	call   801013e0 <bfree>
    ip->addrs[NDIRECT] = 0;
801018be:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
801018c5:	00 00 00 
801018c8:	83 c4 10             	add    $0x10,%esp
801018cb:	e9 5a ff ff ff       	jmp    8010182a <iput+0x9a>

801018d0 <iunlockput>:
}

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
801018d0:	55                   	push   %ebp
801018d1:	89 e5                	mov    %esp,%ebp
801018d3:	53                   	push   %ebx
801018d4:	83 ec 10             	sub    $0x10,%esp
801018d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
801018da:	53                   	push   %ebx
801018db:	e8 60 fe ff ff       	call   80101740 <iunlock>
  iput(ip);
801018e0:	89 5d 08             	mov    %ebx,0x8(%ebp)
801018e3:	83 c4 10             	add    $0x10,%esp
}
801018e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801018e9:	c9                   	leave  
// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
  iput(ip);
801018ea:	e9 a1 fe ff ff       	jmp    80101790 <iput>
801018ef:	90                   	nop

801018f0 <stati>:
}

// Copy stat information from inode.
void
stati(struct inode *ip, struct stat *st)
{
801018f0:	55                   	push   %ebp
801018f1:	89 e5                	mov    %esp,%ebp
801018f3:	8b 55 08             	mov    0x8(%ebp),%edx
801018f6:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
801018f9:	8b 0a                	mov    (%edx),%ecx
801018fb:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
801018fe:	8b 4a 04             	mov    0x4(%edx),%ecx
80101901:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101904:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101908:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
8010190b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010190f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101913:	8b 52 58             	mov    0x58(%edx),%edx
80101916:	89 50 10             	mov    %edx,0x10(%eax)
}
80101919:	5d                   	pop    %ebp
8010191a:	c3                   	ret    
8010191b:	90                   	nop
8010191c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101920 <readi>:

//PAGEBREAK!
// Read data from inode.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101920:	55                   	push   %ebp
80101921:	89 e5                	mov    %esp,%ebp
80101923:	57                   	push   %edi
80101924:	56                   	push   %esi
80101925:	53                   	push   %ebx
80101926:	83 ec 1c             	sub    $0x1c,%esp
80101929:	8b 45 08             	mov    0x8(%ebp),%eax
8010192c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010192f:	8b 75 10             	mov    0x10(%ebp),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101932:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)

//PAGEBREAK!
// Read data from inode.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101937:	89 7d e0             	mov    %edi,-0x20(%ebp)
8010193a:	8b 7d 14             	mov    0x14(%ebp),%edi
8010193d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101940:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101943:	0f 84 a7 00 00 00    	je     801019f0 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101949:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010194c:	8b 40 58             	mov    0x58(%eax),%eax
8010194f:	39 f0                	cmp    %esi,%eax
80101951:	0f 82 c1 00 00 00    	jb     80101a18 <readi+0xf8>
80101957:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010195a:	89 fa                	mov    %edi,%edx
8010195c:	01 f2                	add    %esi,%edx
8010195e:	0f 82 b4 00 00 00    	jb     80101a18 <readi+0xf8>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
80101964:	89 c1                	mov    %eax,%ecx
80101966:	29 f1                	sub    %esi,%ecx
80101968:	39 d0                	cmp    %edx,%eax
8010196a:	0f 43 cf             	cmovae %edi,%ecx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
8010196d:	31 ff                	xor    %edi,%edi
8010196f:	85 c9                	test   %ecx,%ecx
  }

  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
80101971:	89 4d e4             	mov    %ecx,-0x1c(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101974:	74 6d                	je     801019e3 <readi+0xc3>
80101976:	8d 76 00             	lea    0x0(%esi),%esi
80101979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101980:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80101983:	89 f2                	mov    %esi,%edx
80101985:	c1 ea 09             	shr    $0x9,%edx
80101988:	89 d8                	mov    %ebx,%eax
8010198a:	e8 41 f9 ff ff       	call   801012d0 <bmap>
8010198f:	83 ec 08             	sub    $0x8,%esp
80101992:	50                   	push   %eax
80101993:	ff 33                	pushl  (%ebx)
    m = min(n - tot, BSIZE - off%BSIZE);
80101995:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
8010199a:	e8 31 e7 ff ff       	call   801000d0 <bread>
8010199f:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
801019a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801019a4:	89 f1                	mov    %esi,%ecx
801019a6:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
801019ac:	83 c4 0c             	add    $0xc,%esp
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
801019af:	89 55 dc             	mov    %edx,-0x24(%ebp)
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
801019b2:	29 cb                	sub    %ecx,%ebx
801019b4:	29 f8                	sub    %edi,%eax
801019b6:	39 c3                	cmp    %eax,%ebx
801019b8:	0f 47 d8             	cmova  %eax,%ebx
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
801019bb:	8d 44 0a 5c          	lea    0x5c(%edx,%ecx,1),%eax
801019bf:	53                   	push   %ebx
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019c0:	01 df                	add    %ebx,%edi
801019c2:	01 de                	add    %ebx,%esi
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
801019c4:	50                   	push   %eax
801019c5:	ff 75 e0             	pushl  -0x20(%ebp)
801019c8:	e8 73 2e 00 00       	call   80104840 <memmove>
    brelse(bp);
801019cd:	8b 55 dc             	mov    -0x24(%ebp),%edx
801019d0:	89 14 24             	mov    %edx,(%esp)
801019d3:	e8 08 e8 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019d8:	01 5d e0             	add    %ebx,-0x20(%ebp)
801019db:	83 c4 10             	add    $0x10,%esp
801019de:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
801019e1:	77 9d                	ja     80101980 <readi+0x60>
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
801019e3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
801019e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801019e9:	5b                   	pop    %ebx
801019ea:	5e                   	pop    %esi
801019eb:	5f                   	pop    %edi
801019ec:	5d                   	pop    %ebp
801019ed:	c3                   	ret    
801019ee:	66 90                	xchg   %ax,%ax
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
801019f0:	0f bf 40 52          	movswl 0x52(%eax),%eax
801019f4:	66 83 f8 09          	cmp    $0x9,%ax
801019f8:	77 1e                	ja     80101a18 <readi+0xf8>
801019fa:	8b 04 c5 80 09 11 80 	mov    -0x7feef680(,%eax,8),%eax
80101a01:	85 c0                	test   %eax,%eax
80101a03:	74 13                	je     80101a18 <readi+0xf8>
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a05:	89 7d 10             	mov    %edi,0x10(%ebp)
    */
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
}
80101a08:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a0b:	5b                   	pop    %ebx
80101a0c:	5e                   	pop    %esi
80101a0d:	5f                   	pop    %edi
80101a0e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a0f:	ff e0                	jmp    *%eax
80101a11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
80101a18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a1d:	eb c7                	jmp    801019e6 <readi+0xc6>
80101a1f:	90                   	nop

80101a20 <writei>:

// PAGEBREAK!
// Write data to inode.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a20:	55                   	push   %ebp
80101a21:	89 e5                	mov    %esp,%ebp
80101a23:	57                   	push   %edi
80101a24:	56                   	push   %esi
80101a25:	53                   	push   %ebx
80101a26:	83 ec 1c             	sub    $0x1c,%esp
80101a29:	8b 45 08             	mov    0x8(%ebp),%eax
80101a2c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a2f:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a32:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)

// PAGEBREAK!
// Write data to inode.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a37:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a3a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a3d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a40:	89 7d e0             	mov    %edi,-0x20(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a43:	0f 84 b7 00 00 00    	je     80101b00 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101a49:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a4c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a4f:	0f 82 eb 00 00 00    	jb     80101b40 <writei+0x120>
80101a55:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101a58:	89 f8                	mov    %edi,%eax
80101a5a:	01 f0                	add    %esi,%eax
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101a5c:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101a61:	0f 87 d9 00 00 00    	ja     80101b40 <writei+0x120>
80101a67:	39 c6                	cmp    %eax,%esi
80101a69:	0f 87 d1 00 00 00    	ja     80101b40 <writei+0x120>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101a6f:	85 ff                	test   %edi,%edi
80101a71:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101a78:	74 78                	je     80101af2 <writei+0xd2>
80101a7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101a80:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101a83:	89 f2                	mov    %esi,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101a85:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101a8a:	c1 ea 09             	shr    $0x9,%edx
80101a8d:	89 f8                	mov    %edi,%eax
80101a8f:	e8 3c f8 ff ff       	call   801012d0 <bmap>
80101a94:	83 ec 08             	sub    $0x8,%esp
80101a97:	50                   	push   %eax
80101a98:	ff 37                	pushl  (%edi)
80101a9a:	e8 31 e6 ff ff       	call   801000d0 <bread>
80101a9f:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101aa1:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101aa4:	2b 45 e4             	sub    -0x1c(%ebp),%eax
80101aa7:	89 f1                	mov    %esi,%ecx
80101aa9:	83 c4 0c             	add    $0xc,%esp
80101aac:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80101ab2:	29 cb                	sub    %ecx,%ebx
80101ab4:	39 c3                	cmp    %eax,%ebx
80101ab6:	0f 47 d8             	cmova  %eax,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101ab9:	8d 44 0f 5c          	lea    0x5c(%edi,%ecx,1),%eax
80101abd:	53                   	push   %ebx
80101abe:	ff 75 dc             	pushl  -0x24(%ebp)
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101ac1:	01 de                	add    %ebx,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(bp->data + off%BSIZE, src, m);
80101ac3:	50                   	push   %eax
80101ac4:	e8 77 2d 00 00       	call   80104840 <memmove>
    log_write(bp);
80101ac9:	89 3c 24             	mov    %edi,(%esp)
80101acc:	e8 9f 12 00 00       	call   80102d70 <log_write>
    brelse(bp);
80101ad1:	89 3c 24             	mov    %edi,(%esp)
80101ad4:	e8 07 e7 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101ad9:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101adc:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101adf:	83 c4 10             	add    $0x10,%esp
80101ae2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101ae5:	39 55 e0             	cmp    %edx,-0x20(%ebp)
80101ae8:	77 96                	ja     80101a80 <writei+0x60>
    memmove(bp->data + off%BSIZE, src, m);
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
80101aea:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101aed:	3b 70 58             	cmp    0x58(%eax),%esi
80101af0:	77 36                	ja     80101b28 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101af2:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101af5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101af8:	5b                   	pop    %ebx
80101af9:	5e                   	pop    %esi
80101afa:	5f                   	pop    %edi
80101afb:	5d                   	pop    %ebp
80101afc:	c3                   	ret    
80101afd:	8d 76 00             	lea    0x0(%esi),%esi
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101b00:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b04:	66 83 f8 09          	cmp    $0x9,%ax
80101b08:	77 36                	ja     80101b40 <writei+0x120>
80101b0a:	8b 04 c5 84 09 11 80 	mov    -0x7feef67c(,%eax,8),%eax
80101b11:	85 c0                	test   %eax,%eax
80101b13:	74 2b                	je     80101b40 <writei+0x120>
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b15:	89 7d 10             	mov    %edi,0x10(%ebp)
  if(n > 0 && off > ip->size){
    ip->size = off;
    iupdate(ip);
  }
  return n;
}
80101b18:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b1b:	5b                   	pop    %ebx
80101b1c:	5e                   	pop    %esi
80101b1d:	5f                   	pop    %edi
80101b1e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b1f:	ff e0                	jmp    *%eax
80101b21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101b28:	8b 45 d8             	mov    -0x28(%ebp),%eax
    iupdate(ip);
80101b2b:	83 ec 0c             	sub    $0xc,%esp
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101b2e:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101b31:	50                   	push   %eax
80101b32:	e8 79 fa ff ff       	call   801015b0 <iupdate>
80101b37:	83 c4 10             	add    $0x10,%esp
80101b3a:	eb b6                	jmp    80101af2 <writei+0xd2>
80101b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
80101b40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b45:	eb ae                	jmp    80101af5 <writei+0xd5>
80101b47:	89 f6                	mov    %esi,%esi
80101b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b50 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101b50:	55                   	push   %ebp
80101b51:	89 e5                	mov    %esp,%ebp
80101b53:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101b56:	6a 0e                	push   $0xe
80101b58:	ff 75 0c             	pushl  0xc(%ebp)
80101b5b:	ff 75 08             	pushl  0x8(%ebp)
80101b5e:	e8 5d 2d 00 00       	call   801048c0 <strncmp>
}
80101b63:	c9                   	leave  
80101b64:	c3                   	ret    
80101b65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b70 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101b70:	55                   	push   %ebp
80101b71:	89 e5                	mov    %esp,%ebp
80101b73:	57                   	push   %edi
80101b74:	56                   	push   %esi
80101b75:	53                   	push   %ebx
80101b76:	83 ec 1c             	sub    $0x1c,%esp
80101b79:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101b7c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101b81:	0f 85 80 00 00 00    	jne    80101c07 <dirlookup+0x97>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101b87:	8b 53 58             	mov    0x58(%ebx),%edx
80101b8a:	31 ff                	xor    %edi,%edi
80101b8c:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101b8f:	85 d2                	test   %edx,%edx
80101b91:	75 0d                	jne    80101ba0 <dirlookup+0x30>
80101b93:	eb 5b                	jmp    80101bf0 <dirlookup+0x80>
80101b95:	8d 76 00             	lea    0x0(%esi),%esi
80101b98:	83 c7 10             	add    $0x10,%edi
80101b9b:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101b9e:	76 50                	jbe    80101bf0 <dirlookup+0x80>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101ba0:	6a 10                	push   $0x10
80101ba2:	57                   	push   %edi
80101ba3:	56                   	push   %esi
80101ba4:	53                   	push   %ebx
80101ba5:	e8 76 fd ff ff       	call   80101920 <readi>
80101baa:	83 c4 10             	add    $0x10,%esp
80101bad:	83 f8 10             	cmp    $0x10,%eax
80101bb0:	75 48                	jne    80101bfa <dirlookup+0x8a>
      panic("dirlink read");
    if(de.inum == 0)
80101bb2:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101bb7:	74 df                	je     80101b98 <dirlookup+0x28>
// Directories

int
namecmp(const char *s, const char *t)
{
  return strncmp(s, t, DIRSIZ);
80101bb9:	8d 45 da             	lea    -0x26(%ebp),%eax
80101bbc:	83 ec 04             	sub    $0x4,%esp
80101bbf:	6a 0e                	push   $0xe
80101bc1:	50                   	push   %eax
80101bc2:	ff 75 0c             	pushl  0xc(%ebp)
80101bc5:	e8 f6 2c 00 00       	call   801048c0 <strncmp>
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
    if(de.inum == 0)
      continue;
    if(namecmp(name, de.name) == 0){
80101bca:	83 c4 10             	add    $0x10,%esp
80101bcd:	85 c0                	test   %eax,%eax
80101bcf:	75 c7                	jne    80101b98 <dirlookup+0x28>
      // entry matches path element
      if(poff)
80101bd1:	8b 45 10             	mov    0x10(%ebp),%eax
80101bd4:	85 c0                	test   %eax,%eax
80101bd6:	74 05                	je     80101bdd <dirlookup+0x6d>
        *poff = off;
80101bd8:	8b 45 10             	mov    0x10(%ebp),%eax
80101bdb:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
      return iget(dp->dev, inum);
80101bdd:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101be1:	8b 03                	mov    (%ebx),%eax
80101be3:	e8 18 f6 ff ff       	call   80101200 <iget>
    }
  }

  return 0;
}
80101be8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101beb:	5b                   	pop    %ebx
80101bec:	5e                   	pop    %esi
80101bed:	5f                   	pop    %edi
80101bee:	5d                   	pop    %ebp
80101bef:	c3                   	ret    
80101bf0:	8d 65 f4             	lea    -0xc(%ebp),%esp
      inum = de.inum;
      return iget(dp->dev, inum);
    }
  }

  return 0;
80101bf3:	31 c0                	xor    %eax,%eax
}
80101bf5:	5b                   	pop    %ebx
80101bf6:	5e                   	pop    %esi
80101bf7:	5f                   	pop    %edi
80101bf8:	5d                   	pop    %ebp
80101bf9:	c3                   	ret    
  if(dp->type != T_DIR)
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101bfa:	83 ec 0c             	sub    $0xc,%esp
80101bfd:	68 35 74 10 80       	push   $0x80107435
80101c02:	e8 69 e7 ff ff       	call   80100370 <panic>
{
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    panic("dirlookup not DIR");
80101c07:	83 ec 0c             	sub    $0xc,%esp
80101c0a:	68 23 74 10 80       	push   $0x80107423
80101c0f:	e8 5c e7 ff ff       	call   80100370 <panic>
80101c14:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c1a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101c20 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c20:	55                   	push   %ebp
80101c21:	89 e5                	mov    %esp,%ebp
80101c23:	57                   	push   %edi
80101c24:	56                   	push   %esi
80101c25:	53                   	push   %ebx
80101c26:	89 cf                	mov    %ecx,%edi
80101c28:	89 c3                	mov    %eax,%ebx
80101c2a:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101c2d:	80 38 2f             	cmpb   $0x2f,(%eax)
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c30:	89 55 e0             	mov    %edx,-0x20(%ebp)
  struct inode *ip, *next;

  if(*path == '/')
80101c33:	0f 84 53 01 00 00    	je     80101d8c <namex+0x16c>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);
80101c39:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101c3f:	83 ec 0c             	sub    $0xc,%esp
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);
80101c42:	8b 70 68             	mov    0x68(%eax),%esi
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101c45:	68 00 0a 11 80       	push   $0x80110a00
80101c4a:	e8 11 29 00 00       	call   80104560 <acquire>
  ip->ref++;
80101c4f:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101c53:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101c5a:	e8 e1 2a 00 00       	call   80104740 <release>
80101c5f:	83 c4 10             	add    $0x10,%esp
80101c62:	eb 07                	jmp    80101c6b <namex+0x4b>
80101c64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  char *s;
  int len;

  while(*path == '/')
    path++;
80101c68:	83 c3 01             	add    $0x1,%ebx
skipelem(char *path, char *name)
{
  char *s;
  int len;

  while(*path == '/')
80101c6b:	0f b6 03             	movzbl (%ebx),%eax
80101c6e:	3c 2f                	cmp    $0x2f,%al
80101c70:	74 f6                	je     80101c68 <namex+0x48>
    path++;
  if(*path == 0)
80101c72:	84 c0                	test   %al,%al
80101c74:	0f 84 e3 00 00 00    	je     80101d5d <namex+0x13d>
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101c7a:	0f b6 03             	movzbl (%ebx),%eax
80101c7d:	89 da                	mov    %ebx,%edx
80101c7f:	84 c0                	test   %al,%al
80101c81:	0f 84 ac 00 00 00    	je     80101d33 <namex+0x113>
80101c87:	3c 2f                	cmp    $0x2f,%al
80101c89:	75 09                	jne    80101c94 <namex+0x74>
80101c8b:	e9 a3 00 00 00       	jmp    80101d33 <namex+0x113>
80101c90:	84 c0                	test   %al,%al
80101c92:	74 0a                	je     80101c9e <namex+0x7e>
    path++;
80101c94:	83 c2 01             	add    $0x1,%edx
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101c97:	0f b6 02             	movzbl (%edx),%eax
80101c9a:	3c 2f                	cmp    $0x2f,%al
80101c9c:	75 f2                	jne    80101c90 <namex+0x70>
80101c9e:	89 d1                	mov    %edx,%ecx
80101ca0:	29 d9                	sub    %ebx,%ecx
    path++;
  len = path - s;
  if(len >= DIRSIZ)
80101ca2:	83 f9 0d             	cmp    $0xd,%ecx
80101ca5:	0f 8e 8d 00 00 00    	jle    80101d38 <namex+0x118>
    memmove(name, s, DIRSIZ);
80101cab:	83 ec 04             	sub    $0x4,%esp
80101cae:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101cb1:	6a 0e                	push   $0xe
80101cb3:	53                   	push   %ebx
80101cb4:	57                   	push   %edi
80101cb5:	e8 86 2b 00 00       	call   80104840 <memmove>
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101cba:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
80101cbd:	83 c4 10             	add    $0x10,%esp
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101cc0:	89 d3                	mov    %edx,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101cc2:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101cc5:	75 11                	jne    80101cd8 <namex+0xb8>
80101cc7:	89 f6                	mov    %esi,%esi
80101cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    path++;
80101cd0:	83 c3 01             	add    $0x1,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101cd3:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101cd6:	74 f8                	je     80101cd0 <namex+0xb0>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101cd8:	83 ec 0c             	sub    $0xc,%esp
80101cdb:	56                   	push   %esi
80101cdc:	e8 7f f9 ff ff       	call   80101660 <ilock>
    if(ip->type != T_DIR){
80101ce1:	83 c4 10             	add    $0x10,%esp
80101ce4:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101ce9:	0f 85 7f 00 00 00    	jne    80101d6e <namex+0x14e>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101cef:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101cf2:	85 d2                	test   %edx,%edx
80101cf4:	74 09                	je     80101cff <namex+0xdf>
80101cf6:	80 3b 00             	cmpb   $0x0,(%ebx)
80101cf9:	0f 84 a3 00 00 00    	je     80101da2 <namex+0x182>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101cff:	83 ec 04             	sub    $0x4,%esp
80101d02:	6a 00                	push   $0x0
80101d04:	57                   	push   %edi
80101d05:	56                   	push   %esi
80101d06:	e8 65 fe ff ff       	call   80101b70 <dirlookup>
80101d0b:	83 c4 10             	add    $0x10,%esp
80101d0e:	85 c0                	test   %eax,%eax
80101d10:	74 5c                	je     80101d6e <namex+0x14e>

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101d12:	83 ec 0c             	sub    $0xc,%esp
80101d15:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d18:	56                   	push   %esi
80101d19:	e8 22 fa ff ff       	call   80101740 <iunlock>
  iput(ip);
80101d1e:	89 34 24             	mov    %esi,(%esp)
80101d21:	e8 6a fa ff ff       	call   80101790 <iput>
80101d26:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d29:	83 c4 10             	add    $0x10,%esp
80101d2c:	89 c6                	mov    %eax,%esi
80101d2e:	e9 38 ff ff ff       	jmp    80101c6b <namex+0x4b>
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101d33:	31 c9                	xor    %ecx,%ecx
80101d35:	8d 76 00             	lea    0x0(%esi),%esi
    path++;
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
80101d38:	83 ec 04             	sub    $0x4,%esp
80101d3b:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d3e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d41:	51                   	push   %ecx
80101d42:	53                   	push   %ebx
80101d43:	57                   	push   %edi
80101d44:	e8 f7 2a 00 00       	call   80104840 <memmove>
    name[len] = 0;
80101d49:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101d4c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101d4f:	83 c4 10             	add    $0x10,%esp
80101d52:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101d56:	89 d3                	mov    %edx,%ebx
80101d58:	e9 65 ff ff ff       	jmp    80101cc2 <namex+0xa2>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101d5d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101d60:	85 c0                	test   %eax,%eax
80101d62:	75 54                	jne    80101db8 <namex+0x198>
80101d64:	89 f0                	mov    %esi,%eax
    iput(ip);
    return 0;
  }
  return ip;
}
80101d66:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d69:	5b                   	pop    %ebx
80101d6a:	5e                   	pop    %esi
80101d6b:	5f                   	pop    %edi
80101d6c:	5d                   	pop    %ebp
80101d6d:	c3                   	ret    

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101d6e:	83 ec 0c             	sub    $0xc,%esp
80101d71:	56                   	push   %esi
80101d72:	e8 c9 f9 ff ff       	call   80101740 <iunlock>
  iput(ip);
80101d77:	89 34 24             	mov    %esi,(%esp)
80101d7a:	e8 11 fa ff ff       	call   80101790 <iput>
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101d7f:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101d82:	8d 65 f4             	lea    -0xc(%ebp),%esp
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101d85:	31 c0                	xor    %eax,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101d87:	5b                   	pop    %ebx
80101d88:	5e                   	pop    %esi
80101d89:	5f                   	pop    %edi
80101d8a:	5d                   	pop    %ebp
80101d8b:	c3                   	ret    
namex(char *path, int nameiparent, char *name)
{
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
80101d8c:	ba 01 00 00 00       	mov    $0x1,%edx
80101d91:	b8 01 00 00 00       	mov    $0x1,%eax
80101d96:	e8 65 f4 ff ff       	call   80101200 <iget>
80101d9b:	89 c6                	mov    %eax,%esi
80101d9d:	e9 c9 fe ff ff       	jmp    80101c6b <namex+0x4b>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
80101da2:	83 ec 0c             	sub    $0xc,%esp
80101da5:	56                   	push   %esi
80101da6:	e8 95 f9 ff ff       	call   80101740 <iunlock>
      return ip;
80101dab:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101dae:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
      return ip;
80101db1:	89 f0                	mov    %esi,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101db3:	5b                   	pop    %ebx
80101db4:	5e                   	pop    %esi
80101db5:	5f                   	pop    %edi
80101db6:	5d                   	pop    %ebp
80101db7:	c3                   	ret    
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
    iput(ip);
80101db8:	83 ec 0c             	sub    $0xc,%esp
80101dbb:	56                   	push   %esi
80101dbc:	e8 cf f9 ff ff       	call   80101790 <iput>
    return 0;
80101dc1:	83 c4 10             	add    $0x10,%esp
80101dc4:	31 c0                	xor    %eax,%eax
80101dc6:	eb 9e                	jmp    80101d66 <namex+0x146>
80101dc8:	90                   	nop
80101dc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101dd0 <dirlink>:
}

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
80101dd0:	55                   	push   %ebp
80101dd1:	89 e5                	mov    %esp,%ebp
80101dd3:	57                   	push   %edi
80101dd4:	56                   	push   %esi
80101dd5:	53                   	push   %ebx
80101dd6:	83 ec 20             	sub    $0x20,%esp
80101dd9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
80101ddc:	6a 00                	push   $0x0
80101dde:	ff 75 0c             	pushl  0xc(%ebp)
80101de1:	53                   	push   %ebx
80101de2:	e8 89 fd ff ff       	call   80101b70 <dirlookup>
80101de7:	83 c4 10             	add    $0x10,%esp
80101dea:	85 c0                	test   %eax,%eax
80101dec:	75 67                	jne    80101e55 <dirlink+0x85>
    iput(ip);
    return -1;
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
80101dee:	8b 7b 58             	mov    0x58(%ebx),%edi
80101df1:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101df4:	85 ff                	test   %edi,%edi
80101df6:	74 29                	je     80101e21 <dirlink+0x51>
80101df8:	31 ff                	xor    %edi,%edi
80101dfa:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101dfd:	eb 09                	jmp    80101e08 <dirlink+0x38>
80101dff:	90                   	nop
80101e00:	83 c7 10             	add    $0x10,%edi
80101e03:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101e06:	76 19                	jbe    80101e21 <dirlink+0x51>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e08:	6a 10                	push   $0x10
80101e0a:	57                   	push   %edi
80101e0b:	56                   	push   %esi
80101e0c:	53                   	push   %ebx
80101e0d:	e8 0e fb ff ff       	call   80101920 <readi>
80101e12:	83 c4 10             	add    $0x10,%esp
80101e15:	83 f8 10             	cmp    $0x10,%eax
80101e18:	75 4e                	jne    80101e68 <dirlink+0x98>
      panic("dirlink read");
    if(de.inum == 0)
80101e1a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e1f:	75 df                	jne    80101e00 <dirlink+0x30>
      break;
  }

  strncpy(de.name, name, DIRSIZ);
80101e21:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e24:	83 ec 04             	sub    $0x4,%esp
80101e27:	6a 0e                	push   $0xe
80101e29:	ff 75 0c             	pushl  0xc(%ebp)
80101e2c:	50                   	push   %eax
80101e2d:	e8 fe 2a 00 00       	call   80104930 <strncpy>
  de.inum = inum;
80101e32:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e35:	6a 10                	push   $0x10
80101e37:	57                   	push   %edi
80101e38:	56                   	push   %esi
80101e39:	53                   	push   %ebx
    if(de.inum == 0)
      break;
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
80101e3a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e3e:	e8 dd fb ff ff       	call   80101a20 <writei>
80101e43:	83 c4 20             	add    $0x20,%esp
80101e46:	83 f8 10             	cmp    $0x10,%eax
80101e49:	75 2a                	jne    80101e75 <dirlink+0xa5>
    panic("dirlink");

  return 0;
80101e4b:	31 c0                	xor    %eax,%eax
}
80101e4d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e50:	5b                   	pop    %ebx
80101e51:	5e                   	pop    %esi
80101e52:	5f                   	pop    %edi
80101e53:	5d                   	pop    %ebp
80101e54:	c3                   	ret    
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    iput(ip);
80101e55:	83 ec 0c             	sub    $0xc,%esp
80101e58:	50                   	push   %eax
80101e59:	e8 32 f9 ff ff       	call   80101790 <iput>
    return -1;
80101e5e:	83 c4 10             	add    $0x10,%esp
80101e61:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101e66:	eb e5                	jmp    80101e4d <dirlink+0x7d>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101e68:	83 ec 0c             	sub    $0xc,%esp
80101e6b:	68 35 74 10 80       	push   $0x80107435
80101e70:	e8 fb e4 ff ff       	call   80100370 <panic>
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("dirlink");
80101e75:	83 ec 0c             	sub    $0xc,%esp
80101e78:	68 86 7a 10 80       	push   $0x80107a86
80101e7d:	e8 ee e4 ff ff       	call   80100370 <panic>
80101e82:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101e90 <namei>:
  return ip;
}

struct inode*
namei(char *path)
{
80101e90:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101e91:	31 d2                	xor    %edx,%edx
  return ip;
}

struct inode*
namei(char *path)
{
80101e93:	89 e5                	mov    %esp,%ebp
80101e95:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101e98:	8b 45 08             	mov    0x8(%ebp),%eax
80101e9b:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101e9e:	e8 7d fd ff ff       	call   80101c20 <namex>
}
80101ea3:	c9                   	leave  
80101ea4:	c3                   	ret    
80101ea5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ea9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101eb0 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101eb0:	55                   	push   %ebp
  return namex(path, 1, name);
80101eb1:	ba 01 00 00 00       	mov    $0x1,%edx
  return namex(path, 0, name);
}

struct inode*
nameiparent(char *path, char *name)
{
80101eb6:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101eb8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101ebb:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101ebe:	5d                   	pop    %ebp
}

struct inode*
nameiparent(char *path, char *name)
{
  return namex(path, 1, name);
80101ebf:	e9 5c fd ff ff       	jmp    80101c20 <namex>
80101ec4:	66 90                	xchg   %ax,%ax
80101ec6:	66 90                	xchg   %ax,%ax
80101ec8:	66 90                	xchg   %ax,%ax
80101eca:	66 90                	xchg   %ax,%ax
80101ecc:	66 90                	xchg   %ax,%ax
80101ece:	66 90                	xchg   %ax,%ax

80101ed0 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101ed0:	55                   	push   %ebp
  if(b == 0)
80101ed1:	85 c0                	test   %eax,%eax
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101ed3:	89 e5                	mov    %esp,%ebp
80101ed5:	56                   	push   %esi
80101ed6:	53                   	push   %ebx
  if(b == 0)
80101ed7:	0f 84 ad 00 00 00    	je     80101f8a <idestart+0xba>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101edd:	8b 58 08             	mov    0x8(%eax),%ebx
80101ee0:	89 c1                	mov    %eax,%ecx
80101ee2:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101ee8:	0f 87 8f 00 00 00    	ja     80101f7d <idestart+0xad>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101eee:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101ef3:	90                   	nop
80101ef4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ef8:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101ef9:	83 e0 c0             	and    $0xffffffc0,%eax
80101efc:	3c 40                	cmp    $0x40,%al
80101efe:	75 f8                	jne    80101ef8 <idestart+0x28>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101f00:	31 f6                	xor    %esi,%esi
80101f02:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f07:	89 f0                	mov    %esi,%eax
80101f09:	ee                   	out    %al,(%dx)
80101f0a:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f0f:	b8 01 00 00 00       	mov    $0x1,%eax
80101f14:	ee                   	out    %al,(%dx)
80101f15:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f1a:	89 d8                	mov    %ebx,%eax
80101f1c:	ee                   	out    %al,(%dx)
80101f1d:	89 d8                	mov    %ebx,%eax
80101f1f:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f24:	c1 f8 08             	sar    $0x8,%eax
80101f27:	ee                   	out    %al,(%dx)
80101f28:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f2d:	89 f0                	mov    %esi,%eax
80101f2f:	ee                   	out    %al,(%dx)
80101f30:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
80101f34:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101f39:	83 e0 01             	and    $0x1,%eax
80101f3c:	c1 e0 04             	shl    $0x4,%eax
80101f3f:	83 c8 e0             	or     $0xffffffe0,%eax
80101f42:	ee                   	out    %al,(%dx)
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
80101f43:	f6 01 04             	testb  $0x4,(%ecx)
80101f46:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f4b:	75 13                	jne    80101f60 <idestart+0x90>
80101f4d:	b8 20 00 00 00       	mov    $0x20,%eax
80101f52:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101f53:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f56:	5b                   	pop    %ebx
80101f57:	5e                   	pop    %esi
80101f58:	5d                   	pop    %ebp
80101f59:	c3                   	ret    
80101f5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101f60:	b8 30 00 00 00       	mov    $0x30,%eax
80101f65:	ee                   	out    %al,(%dx)
}

static inline void
outsl(int port, const void *addr, int cnt)
{
  asm volatile("cld; rep outsl" :
80101f66:	ba f0 01 00 00       	mov    $0x1f0,%edx
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
80101f6b:	8d 71 5c             	lea    0x5c(%ecx),%esi
80101f6e:	b9 80 00 00 00       	mov    $0x80,%ecx
80101f73:	fc                   	cld    
80101f74:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101f76:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f79:	5b                   	pop    %ebx
80101f7a:	5e                   	pop    %esi
80101f7b:	5d                   	pop    %ebp
80101f7c:	c3                   	ret    
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
  if(b->blockno >= FSSIZE)
    panic("incorrect blockno");
80101f7d:	83 ec 0c             	sub    $0xc,%esp
80101f80:	68 a0 74 10 80       	push   $0x801074a0
80101f85:	e8 e6 e3 ff ff       	call   80100370 <panic>
// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
80101f8a:	83 ec 0c             	sub    $0xc,%esp
80101f8d:	68 97 74 10 80       	push   $0x80107497
80101f92:	e8 d9 e3 ff ff       	call   80100370 <panic>
80101f97:	89 f6                	mov    %esi,%esi
80101f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101fa0 <ideinit>:
  return 0;
}

void
ideinit(void)
{
80101fa0:	55                   	push   %ebp
80101fa1:	89 e5                	mov    %esp,%ebp
80101fa3:	83 ec 10             	sub    $0x10,%esp
  int i;

  initlock(&idelock, "ide");
80101fa6:	68 b2 74 10 80       	push   $0x801074b2
80101fab:	68 80 a5 10 80       	push   $0x8010a580
80101fb0:	e8 8b 25 00 00       	call   80104540 <initlock>
  picenable(IRQ_IDE);
80101fb5:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
80101fbc:	e8 9f 12 00 00       	call   80103260 <picenable>
  ioapicenable(IRQ_IDE, ncpu - 1);
80101fc1:	58                   	pop    %eax
80101fc2:	a1 5c 28 11 80       	mov    0x8011285c,%eax
80101fc7:	5a                   	pop    %edx
80101fc8:	83 e8 01             	sub    $0x1,%eax
80101fcb:	50                   	push   %eax
80101fcc:	6a 0e                	push   $0xe
80101fce:	e8 bd 02 00 00       	call   80102290 <ioapicenable>
80101fd3:	83 c4 10             	add    $0x10,%esp
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101fd6:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fdb:	90                   	nop
80101fdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101fe0:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101fe1:	83 e0 c0             	and    $0xffffffc0,%eax
80101fe4:	3c 40                	cmp    $0x40,%al
80101fe6:	75 f8                	jne    80101fe0 <ideinit+0x40>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101fe8:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101fed:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80101ff2:	ee                   	out    %al,(%dx)
80101ff3:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101ff8:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101ffd:	eb 06                	jmp    80102005 <ideinit+0x65>
80101fff:	90                   	nop
  ioapicenable(IRQ_IDE, ncpu - 1);
  idewait(0);

  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
  for(i=0; i<1000; i++){
80102000:	83 e9 01             	sub    $0x1,%ecx
80102003:	74 0f                	je     80102014 <ideinit+0x74>
80102005:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80102006:	84 c0                	test   %al,%al
80102008:	74 f6                	je     80102000 <ideinit+0x60>
      havedisk1 = 1;
8010200a:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80102011:	00 00 00 
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102014:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102019:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
8010201e:	ee                   	out    %al,(%dx)
    }
  }

  // Switch back to disk 0.
  outb(0x1f6, 0xe0 | (0<<4));
}
8010201f:	c9                   	leave  
80102020:	c3                   	ret    
80102021:	eb 0d                	jmp    80102030 <ideintr>
80102023:	90                   	nop
80102024:	90                   	nop
80102025:	90                   	nop
80102026:	90                   	nop
80102027:	90                   	nop
80102028:	90                   	nop
80102029:	90                   	nop
8010202a:	90                   	nop
8010202b:	90                   	nop
8010202c:	90                   	nop
8010202d:	90                   	nop
8010202e:	90                   	nop
8010202f:	90                   	nop

80102030 <ideintr>:
}

// Interrupt handler.
void
ideintr(void)
{
80102030:	55                   	push   %ebp
80102031:	89 e5                	mov    %esp,%ebp
80102033:	57                   	push   %edi
80102034:	56                   	push   %esi
80102035:	53                   	push   %ebx
80102036:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80102039:	68 80 a5 10 80       	push   $0x8010a580
8010203e:	e8 1d 25 00 00       	call   80104560 <acquire>
  if((b = idequeue) == 0){
80102043:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
80102049:	83 c4 10             	add    $0x10,%esp
8010204c:	85 db                	test   %ebx,%ebx
8010204e:	74 34                	je     80102084 <ideintr+0x54>
    release(&idelock);
    // cprintf("spurious IDE interrupt\n");
    return;
  }
  idequeue = b->qnext;
80102050:	8b 43 58             	mov    0x58(%ebx),%eax
80102053:	a3 64 a5 10 80       	mov    %eax,0x8010a564

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80102058:	8b 33                	mov    (%ebx),%esi
8010205a:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102060:	74 3e                	je     801020a0 <ideintr+0x70>
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
80102062:	83 e6 fb             	and    $0xfffffffb,%esi
  wakeup(b);
80102065:	83 ec 0c             	sub    $0xc,%esp
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
80102068:	83 ce 02             	or     $0x2,%esi
8010206b:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
8010206d:	53                   	push   %ebx
8010206e:	e8 1d 20 00 00       	call   80104090 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
80102073:	a1 64 a5 10 80       	mov    0x8010a564,%eax
80102078:	83 c4 10             	add    $0x10,%esp
8010207b:	85 c0                	test   %eax,%eax
8010207d:	74 05                	je     80102084 <ideintr+0x54>
    idestart(idequeue);
8010207f:	e8 4c fe ff ff       	call   80101ed0 <idestart>
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
  if((b = idequeue) == 0){
    release(&idelock);
80102084:	83 ec 0c             	sub    $0xc,%esp
80102087:	68 80 a5 10 80       	push   $0x8010a580
8010208c:	e8 af 26 00 00       	call   80104740 <release>
  // Start disk on next buf in queue.
  if(idequeue != 0)
    idestart(idequeue);

  release(&idelock);
}
80102091:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102094:	5b                   	pop    %ebx
80102095:	5e                   	pop    %esi
80102096:	5f                   	pop    %edi
80102097:	5d                   	pop    %ebp
80102098:	c3                   	ret    
80102099:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801020a0:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020a5:	8d 76 00             	lea    0x0(%esi),%esi
801020a8:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
801020a9:	89 c1                	mov    %eax,%ecx
801020ab:	83 e1 c0             	and    $0xffffffc0,%ecx
801020ae:	80 f9 40             	cmp    $0x40,%cl
801020b1:	75 f5                	jne    801020a8 <ideintr+0x78>
    ;
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
801020b3:	a8 21                	test   $0x21,%al
801020b5:	75 ab                	jne    80102062 <ideintr+0x32>
  }
  idequeue = b->qnext;

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);
801020b7:	8d 7b 5c             	lea    0x5c(%ebx),%edi
}

static inline void
insl(int port, void *addr, int cnt)
{
  asm volatile("cld; rep insl" :
801020ba:	b9 80 00 00 00       	mov    $0x80,%ecx
801020bf:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020c4:	fc                   	cld    
801020c5:	f3 6d                	rep insl (%dx),%es:(%edi)
801020c7:	8b 33                	mov    (%ebx),%esi
801020c9:	eb 97                	jmp    80102062 <ideintr+0x32>
801020cb:	90                   	nop
801020cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801020d0 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
801020d0:	55                   	push   %ebp
801020d1:	89 e5                	mov    %esp,%ebp
801020d3:	53                   	push   %ebx
801020d4:	83 ec 10             	sub    $0x10,%esp
801020d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
801020da:	8d 43 0c             	lea    0xc(%ebx),%eax
801020dd:	50                   	push   %eax
801020de:	e8 2d 24 00 00       	call   80104510 <holdingsleep>
801020e3:	83 c4 10             	add    $0x10,%esp
801020e6:	85 c0                	test   %eax,%eax
801020e8:	0f 84 ad 00 00 00    	je     8010219b <iderw+0xcb>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
801020ee:	8b 03                	mov    (%ebx),%eax
801020f0:	83 e0 06             	and    $0x6,%eax
801020f3:	83 f8 02             	cmp    $0x2,%eax
801020f6:	0f 84 b9 00 00 00    	je     801021b5 <iderw+0xe5>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
801020fc:	8b 53 04             	mov    0x4(%ebx),%edx
801020ff:	85 d2                	test   %edx,%edx
80102101:	74 0d                	je     80102110 <iderw+0x40>
80102103:	a1 60 a5 10 80       	mov    0x8010a560,%eax
80102108:	85 c0                	test   %eax,%eax
8010210a:	0f 84 98 00 00 00    	je     801021a8 <iderw+0xd8>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
80102110:	83 ec 0c             	sub    $0xc,%esp
80102113:	68 80 a5 10 80       	push   $0x8010a580
80102118:	e8 43 24 00 00       	call   80104560 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010211d:	8b 15 64 a5 10 80    	mov    0x8010a564,%edx
80102123:	83 c4 10             	add    $0x10,%esp
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
80102126:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010212d:	85 d2                	test   %edx,%edx
8010212f:	75 09                	jne    8010213a <iderw+0x6a>
80102131:	eb 58                	jmp    8010218b <iderw+0xbb>
80102133:	90                   	nop
80102134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102138:	89 c2                	mov    %eax,%edx
8010213a:	8b 42 58             	mov    0x58(%edx),%eax
8010213d:	85 c0                	test   %eax,%eax
8010213f:	75 f7                	jne    80102138 <iderw+0x68>
80102141:	83 c2 58             	add    $0x58,%edx
    ;
  *pp = b;
80102144:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
80102146:	3b 1d 64 a5 10 80    	cmp    0x8010a564,%ebx
8010214c:	74 44                	je     80102192 <iderw+0xc2>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010214e:	8b 03                	mov    (%ebx),%eax
80102150:	83 e0 06             	and    $0x6,%eax
80102153:	83 f8 02             	cmp    $0x2,%eax
80102156:	74 23                	je     8010217b <iderw+0xab>
80102158:	90                   	nop
80102159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    sleep(b, &idelock);
80102160:	83 ec 08             	sub    $0x8,%esp
80102163:	68 80 a5 10 80       	push   $0x8010a580
80102168:	53                   	push   %ebx
80102169:	e8 72 1d 00 00       	call   80103ee0 <sleep>
  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010216e:	8b 03                	mov    (%ebx),%eax
80102170:	83 c4 10             	add    $0x10,%esp
80102173:	83 e0 06             	and    $0x6,%eax
80102176:	83 f8 02             	cmp    $0x2,%eax
80102179:	75 e5                	jne    80102160 <iderw+0x90>
    sleep(b, &idelock);
  }

  release(&idelock);
8010217b:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
}
80102182:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102185:	c9                   	leave  
  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
    sleep(b, &idelock);
  }

  release(&idelock);
80102186:	e9 b5 25 00 00       	jmp    80104740 <release>

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010218b:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
80102190:	eb b2                	jmp    80102144 <iderw+0x74>
    ;
  *pp = b;

  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);
80102192:	89 d8                	mov    %ebx,%eax
80102194:	e8 37 fd ff ff       	call   80101ed0 <idestart>
80102199:	eb b3                	jmp    8010214e <iderw+0x7e>
iderw(struct buf *b)
{
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
8010219b:	83 ec 0c             	sub    $0xc,%esp
8010219e:	68 b6 74 10 80       	push   $0x801074b6
801021a3:	e8 c8 e1 ff ff       	call   80100370 <panic>
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
    panic("iderw: ide disk 1 not present");
801021a8:	83 ec 0c             	sub    $0xc,%esp
801021ab:	68 e1 74 10 80       	push   $0x801074e1
801021b0:	e8 bb e1 ff ff       	call   80100370 <panic>
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
801021b5:	83 ec 0c             	sub    $0xc,%esp
801021b8:	68 cc 74 10 80       	push   $0x801074cc
801021bd:	e8 ae e1 ff ff       	call   80100370 <panic>
801021c2:	66 90                	xchg   %ax,%ax
801021c4:	66 90                	xchg   %ax,%ax
801021c6:	66 90                	xchg   %ax,%ax
801021c8:	66 90                	xchg   %ax,%ax
801021ca:	66 90                	xchg   %ax,%ax
801021cc:	66 90                	xchg   %ax,%ax
801021ce:	66 90                	xchg   %ax,%ax

801021d0 <ioapicinit>:
801021d0:	a1 84 27 11 80       	mov    0x80112784,%eax
801021d5:	85 c0                	test   %eax,%eax
801021d7:	0f 84 a8 00 00 00    	je     80102285 <ioapicinit+0xb5>
801021dd:	55                   	push   %ebp
801021de:	c7 05 54 26 11 80 00 	movl   $0xfec00000,0x80112654
801021e5:	00 c0 fe 
801021e8:	89 e5                	mov    %esp,%ebp
801021ea:	56                   	push   %esi
801021eb:	53                   	push   %ebx
801021ec:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
801021f3:	00 00 00 
801021f6:	8b 15 54 26 11 80    	mov    0x80112654,%edx
801021fc:	8b 72 10             	mov    0x10(%edx),%esi
801021ff:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
80102205:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
8010220b:	0f b6 15 80 27 11 80 	movzbl 0x80112780,%edx
80102212:	89 f0                	mov    %esi,%eax
80102214:	c1 e8 10             	shr    $0x10,%eax
80102217:	0f b6 f0             	movzbl %al,%esi
8010221a:	8b 41 10             	mov    0x10(%ecx),%eax
8010221d:	c1 e8 18             	shr    $0x18,%eax
80102220:	39 d0                	cmp    %edx,%eax
80102222:	74 16                	je     8010223a <ioapicinit+0x6a>
80102224:	83 ec 0c             	sub    $0xc,%esp
80102227:	68 00 75 10 80       	push   $0x80107500
8010222c:	e8 2f e4 ff ff       	call   80100660 <cprintf>
80102231:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102237:	83 c4 10             	add    $0x10,%esp
8010223a:	83 c6 21             	add    $0x21,%esi
8010223d:	ba 10 00 00 00       	mov    $0x10,%edx
80102242:	b8 20 00 00 00       	mov    $0x20,%eax
80102247:	89 f6                	mov    %esi,%esi
80102249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102250:	89 11                	mov    %edx,(%ecx)
80102252:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102258:	89 c3                	mov    %eax,%ebx
8010225a:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102260:	83 c0 01             	add    $0x1,%eax
80102263:	89 59 10             	mov    %ebx,0x10(%ecx)
80102266:	8d 5a 01             	lea    0x1(%edx),%ebx
80102269:	83 c2 02             	add    $0x2,%edx
8010226c:	39 f0                	cmp    %esi,%eax
8010226e:	89 19                	mov    %ebx,(%ecx)
80102270:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102276:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
8010227d:	75 d1                	jne    80102250 <ioapicinit+0x80>
8010227f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102282:	5b                   	pop    %ebx
80102283:	5e                   	pop    %esi
80102284:	5d                   	pop    %ebp
80102285:	f3 c3                	repz ret 
80102287:	89 f6                	mov    %esi,%esi
80102289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102290 <ioapicenable>:
80102290:	8b 15 84 27 11 80    	mov    0x80112784,%edx
80102296:	55                   	push   %ebp
80102297:	89 e5                	mov    %esp,%ebp
80102299:	85 d2                	test   %edx,%edx
8010229b:	8b 45 08             	mov    0x8(%ebp),%eax
8010229e:	74 2b                	je     801022cb <ioapicenable+0x3b>
801022a0:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
801022a6:	8d 50 20             	lea    0x20(%eax),%edx
801022a9:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
801022ad:	89 01                	mov    %eax,(%ecx)
801022af:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
801022b5:	83 c0 01             	add    $0x1,%eax
801022b8:	89 51 10             	mov    %edx,0x10(%ecx)
801022bb:	8b 55 0c             	mov    0xc(%ebp),%edx
801022be:	89 01                	mov    %eax,(%ecx)
801022c0:	a1 54 26 11 80       	mov    0x80112654,%eax
801022c5:	c1 e2 18             	shl    $0x18,%edx
801022c8:	89 50 10             	mov    %edx,0x10(%eax)
801022cb:	5d                   	pop    %ebp
801022cc:	c3                   	ret    
801022cd:	66 90                	xchg   %ax,%ax
801022cf:	90                   	nop

801022d0 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
801022d0:	55                   	push   %ebp
801022d1:	89 e5                	mov    %esp,%ebp
801022d3:	53                   	push   %ebx
801022d4:	83 ec 04             	sub    $0x4,%esp
801022d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
801022da:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801022e0:	75 70                	jne    80102352 <kfree+0x82>
801022e2:	81 fb e8 55 11 80    	cmp    $0x801155e8,%ebx
801022e8:	72 68                	jb     80102352 <kfree+0x82>
801022ea:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801022f0:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
801022f5:	77 5b                	ja     80102352 <kfree+0x82>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
801022f7:	83 ec 04             	sub    $0x4,%esp
801022fa:	68 00 10 00 00       	push   $0x1000
801022ff:	6a 01                	push   $0x1
80102301:	53                   	push   %ebx
80102302:	e8 89 24 00 00       	call   80104790 <memset>

  if(kmem.use_lock)
80102307:	8b 15 94 26 11 80    	mov    0x80112694,%edx
8010230d:	83 c4 10             	add    $0x10,%esp
80102310:	85 d2                	test   %edx,%edx
80102312:	75 2c                	jne    80102340 <kfree+0x70>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
80102314:	a1 98 26 11 80       	mov    0x80112698,%eax
80102319:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
8010231b:	a1 94 26 11 80       	mov    0x80112694,%eax

  if(kmem.use_lock)
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
80102320:	89 1d 98 26 11 80    	mov    %ebx,0x80112698
  if(kmem.use_lock)
80102326:	85 c0                	test   %eax,%eax
80102328:	75 06                	jne    80102330 <kfree+0x60>
    release(&kmem.lock);
}
8010232a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010232d:	c9                   	leave  
8010232e:	c3                   	ret    
8010232f:	90                   	nop
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
80102330:	c7 45 08 60 26 11 80 	movl   $0x80112660,0x8(%ebp)
}
80102337:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010233a:	c9                   	leave  
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
8010233b:	e9 00 24 00 00       	jmp    80104740 <release>

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);

  if(kmem.use_lock)
    acquire(&kmem.lock);
80102340:	83 ec 0c             	sub    $0xc,%esp
80102343:	68 60 26 11 80       	push   $0x80112660
80102348:	e8 13 22 00 00       	call   80104560 <acquire>
8010234d:	83 c4 10             	add    $0x10,%esp
80102350:	eb c2                	jmp    80102314 <kfree+0x44>
kfree(char *v)
{
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
    panic("kfree");
80102352:	83 ec 0c             	sub    $0xc,%esp
80102355:	68 32 75 10 80       	push   $0x80107532
8010235a:	e8 11 e0 ff ff       	call   80100370 <panic>
8010235f:	90                   	nop

80102360 <freerange>:
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
80102360:	55                   	push   %ebp
80102361:	89 e5                	mov    %esp,%ebp
80102363:	56                   	push   %esi
80102364:	53                   	push   %ebx
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
80102365:	8b 45 08             	mov    0x8(%ebp),%eax
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
80102368:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010236b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102371:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102377:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010237d:	39 de                	cmp    %ebx,%esi
8010237f:	72 23                	jb     801023a4 <freerange+0x44>
80102381:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
80102388:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010238e:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102391:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
80102397:	50                   	push   %eax
80102398:	e8 33 ff ff ff       	call   801022d0 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010239d:	83 c4 10             	add    $0x10,%esp
801023a0:	39 f3                	cmp    %esi,%ebx
801023a2:	76 e4                	jbe    80102388 <freerange+0x28>
    kfree(p);
}
801023a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023a7:	5b                   	pop    %ebx
801023a8:	5e                   	pop    %esi
801023a9:	5d                   	pop    %ebp
801023aa:	c3                   	ret    
801023ab:	90                   	nop
801023ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801023b0 <kinit1>:
// the pages mapped by entrypgdir on free list.
// 2. main() calls kinit2() with the rest of the physical pages
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
801023b0:	55                   	push   %ebp
801023b1:	89 e5                	mov    %esp,%ebp
801023b3:	56                   	push   %esi
801023b4:	53                   	push   %ebx
801023b5:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
801023b8:	83 ec 08             	sub    $0x8,%esp
801023bb:	68 38 75 10 80       	push   $0x80107538
801023c0:	68 60 26 11 80       	push   $0x80112660
801023c5:	e8 76 21 00 00       	call   80104540 <initlock>

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801023ca:	8b 45 08             	mov    0x8(%ebp),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023cd:	83 c4 10             	add    $0x10,%esp
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
801023d0:	c7 05 94 26 11 80 00 	movl   $0x0,0x80112694
801023d7:	00 00 00 

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801023da:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023e0:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023e6:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023ec:	39 de                	cmp    %ebx,%esi
801023ee:	72 1c                	jb     8010240c <kinit1+0x5c>
    kfree(p);
801023f0:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801023f6:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023f9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
801023ff:	50                   	push   %eax
80102400:	e8 cb fe ff ff       	call   801022d0 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102405:	83 c4 10             	add    $0x10,%esp
80102408:	39 de                	cmp    %ebx,%esi
8010240a:	73 e4                	jae    801023f0 <kinit1+0x40>
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
  freerange(vstart, vend);
}
8010240c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010240f:	5b                   	pop    %ebx
80102410:	5e                   	pop    %esi
80102411:	5d                   	pop    %ebp
80102412:	c3                   	ret    
80102413:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102420 <kinit2>:

void
kinit2(void *vstart, void *vend)
{
80102420:	55                   	push   %ebp
80102421:	89 e5                	mov    %esp,%ebp
80102423:	56                   	push   %esi
80102424:	53                   	push   %ebx

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
80102425:	8b 45 08             	mov    0x8(%ebp),%eax
  freerange(vstart, vend);
}

void
kinit2(void *vstart, void *vend)
{
80102428:	8b 75 0c             	mov    0xc(%ebp),%esi

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010242b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102431:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102437:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010243d:	39 de                	cmp    %ebx,%esi
8010243f:	72 23                	jb     80102464 <kinit2+0x44>
80102441:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
80102448:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010244e:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102451:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
80102457:	50                   	push   %eax
80102458:	e8 73 fe ff ff       	call   801022d0 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010245d:	83 c4 10             	add    $0x10,%esp
80102460:	39 de                	cmp    %ebx,%esi
80102462:	73 e4                	jae    80102448 <kinit2+0x28>

void
kinit2(void *vstart, void *vend)
{
  freerange(vstart, vend);
  kmem.use_lock = 1;
80102464:	c7 05 94 26 11 80 01 	movl   $0x1,0x80112694
8010246b:	00 00 00 
}
8010246e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102471:	5b                   	pop    %ebx
80102472:	5e                   	pop    %esi
80102473:	5d                   	pop    %ebp
80102474:	c3                   	ret    
80102475:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102480 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
80102480:	55                   	push   %ebp
80102481:	89 e5                	mov    %esp,%ebp
80102483:	53                   	push   %ebx
80102484:	83 ec 04             	sub    $0x4,%esp
  struct run *r;

  if(kmem.use_lock)
80102487:	a1 94 26 11 80       	mov    0x80112694,%eax
8010248c:	85 c0                	test   %eax,%eax
8010248e:	75 30                	jne    801024c0 <kalloc+0x40>
    acquire(&kmem.lock);
  r = kmem.freelist;
80102490:	8b 1d 98 26 11 80    	mov    0x80112698,%ebx
  if(r)
80102496:	85 db                	test   %ebx,%ebx
80102498:	74 1c                	je     801024b6 <kalloc+0x36>
    kmem.freelist = r->next;
8010249a:	8b 13                	mov    (%ebx),%edx
8010249c:	89 15 98 26 11 80    	mov    %edx,0x80112698
  if(kmem.use_lock)
801024a2:	85 c0                	test   %eax,%eax
801024a4:	74 10                	je     801024b6 <kalloc+0x36>
    release(&kmem.lock);
801024a6:	83 ec 0c             	sub    $0xc,%esp
801024a9:	68 60 26 11 80       	push   $0x80112660
801024ae:	e8 8d 22 00 00       	call   80104740 <release>
801024b3:	83 c4 10             	add    $0x10,%esp
  return (char*)r;
}
801024b6:	89 d8                	mov    %ebx,%eax
801024b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024bb:	c9                   	leave  
801024bc:	c3                   	ret    
801024bd:	8d 76 00             	lea    0x0(%esi),%esi
kalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
    acquire(&kmem.lock);
801024c0:	83 ec 0c             	sub    $0xc,%esp
801024c3:	68 60 26 11 80       	push   $0x80112660
801024c8:	e8 93 20 00 00       	call   80104560 <acquire>
  r = kmem.freelist;
801024cd:	8b 1d 98 26 11 80    	mov    0x80112698,%ebx
  if(r)
801024d3:	83 c4 10             	add    $0x10,%esp
801024d6:	a1 94 26 11 80       	mov    0x80112694,%eax
801024db:	85 db                	test   %ebx,%ebx
801024dd:	75 bb                	jne    8010249a <kalloc+0x1a>
801024df:	eb c1                	jmp    801024a2 <kalloc+0x22>
801024e1:	66 90                	xchg   %ax,%ax
801024e3:	66 90                	xchg   %ax,%ax
801024e5:	66 90                	xchg   %ax,%ax
801024e7:	66 90                	xchg   %ax,%ax
801024e9:	66 90                	xchg   %ax,%ax
801024eb:	66 90                	xchg   %ax,%ax
801024ed:	66 90                	xchg   %ax,%ax
801024ef:	90                   	nop

801024f0 <kbdgetc>:
801024f0:	55                   	push   %ebp
801024f1:	ba 64 00 00 00       	mov    $0x64,%edx
801024f6:	89 e5                	mov    %esp,%ebp
801024f8:	ec                   	in     (%dx),%al
801024f9:	a8 01                	test   $0x1,%al
801024fb:	0f 84 af 00 00 00    	je     801025b0 <kbdgetc+0xc0>
80102501:	ba 60 00 00 00       	mov    $0x60,%edx
80102506:	ec                   	in     (%dx),%al
80102507:	0f b6 d0             	movzbl %al,%edx
8010250a:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102510:	74 7e                	je     80102590 <kbdgetc+0xa0>
80102512:	84 c0                	test   %al,%al
80102514:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx
8010251a:	79 24                	jns    80102540 <kbdgetc+0x50>
8010251c:	f6 c1 40             	test   $0x40,%cl
8010251f:	75 05                	jne    80102526 <kbdgetc+0x36>
80102521:	89 c2                	mov    %eax,%edx
80102523:	83 e2 7f             	and    $0x7f,%edx
80102526:	0f b6 82 60 76 10 80 	movzbl -0x7fef89a0(%edx),%eax
8010252d:	83 c8 40             	or     $0x40,%eax
80102530:	0f b6 c0             	movzbl %al,%eax
80102533:	f7 d0                	not    %eax
80102535:	21 c8                	and    %ecx,%eax
80102537:	a3 b4 a5 10 80       	mov    %eax,0x8010a5b4
8010253c:	31 c0                	xor    %eax,%eax
8010253e:	5d                   	pop    %ebp
8010253f:	c3                   	ret    
80102540:	f6 c1 40             	test   $0x40,%cl
80102543:	74 09                	je     8010254e <kbdgetc+0x5e>
80102545:	83 c8 80             	or     $0xffffff80,%eax
80102548:	83 e1 bf             	and    $0xffffffbf,%ecx
8010254b:	0f b6 d0             	movzbl %al,%edx
8010254e:	0f b6 82 60 76 10 80 	movzbl -0x7fef89a0(%edx),%eax
80102555:	09 c1                	or     %eax,%ecx
80102557:	0f b6 82 60 75 10 80 	movzbl -0x7fef8aa0(%edx),%eax
8010255e:	31 c1                	xor    %eax,%ecx
80102560:	89 c8                	mov    %ecx,%eax
80102562:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
80102568:	83 e0 03             	and    $0x3,%eax
8010256b:	83 e1 08             	and    $0x8,%ecx
8010256e:	8b 04 85 40 75 10 80 	mov    -0x7fef8ac0(,%eax,4),%eax
80102575:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
80102579:	74 c3                	je     8010253e <kbdgetc+0x4e>
8010257b:	8d 50 9f             	lea    -0x61(%eax),%edx
8010257e:	83 fa 19             	cmp    $0x19,%edx
80102581:	77 1d                	ja     801025a0 <kbdgetc+0xb0>
80102583:	83 e8 20             	sub    $0x20,%eax
80102586:	5d                   	pop    %ebp
80102587:	c3                   	ret    
80102588:	90                   	nop
80102589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102590:	31 c0                	xor    %eax,%eax
80102592:	83 0d b4 a5 10 80 40 	orl    $0x40,0x8010a5b4
80102599:	5d                   	pop    %ebp
8010259a:	c3                   	ret    
8010259b:	90                   	nop
8010259c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025a0:	8d 48 bf             	lea    -0x41(%eax),%ecx
801025a3:	8d 50 20             	lea    0x20(%eax),%edx
801025a6:	5d                   	pop    %ebp
801025a7:	83 f9 19             	cmp    $0x19,%ecx
801025aa:	0f 46 c2             	cmovbe %edx,%eax
801025ad:	c3                   	ret    
801025ae:	66 90                	xchg   %ax,%ax
801025b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801025b5:	5d                   	pop    %ebp
801025b6:	c3                   	ret    
801025b7:	89 f6                	mov    %esi,%esi
801025b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801025c0 <kbdintr>:
801025c0:	55                   	push   %ebp
801025c1:	89 e5                	mov    %esp,%ebp
801025c3:	83 ec 14             	sub    $0x14,%esp
801025c6:	68 f0 24 10 80       	push   $0x801024f0
801025cb:	e8 20 e2 ff ff       	call   801007f0 <consoleintr>
801025d0:	83 c4 10             	add    $0x10,%esp
801025d3:	c9                   	leave  
801025d4:	c3                   	ret    
801025d5:	66 90                	xchg   %ax,%ax
801025d7:	66 90                	xchg   %ax,%ax
801025d9:	66 90                	xchg   %ax,%ax
801025db:	66 90                	xchg   %ax,%ax
801025dd:	66 90                	xchg   %ax,%ax
801025df:	90                   	nop

801025e0 <lapicinit>:
//PAGEBREAK!

void
lapicinit(void)
{
  if(!lapic)
801025e0:	a1 9c 26 11 80       	mov    0x8011269c,%eax
}
//PAGEBREAK!

void
lapicinit(void)
{
801025e5:	55                   	push   %ebp
801025e6:	89 e5                	mov    %esp,%ebp
  if(!lapic)
801025e8:	85 c0                	test   %eax,%eax
801025ea:	0f 84 c8 00 00 00    	je     801026b8 <lapicinit+0xd8>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801025f0:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
801025f7:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
801025fa:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801025fd:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102604:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102607:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010260a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102611:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
80102614:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102617:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010261e:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
80102621:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102624:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010262b:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010262e:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102631:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102638:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010263b:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
8010263e:	8b 50 30             	mov    0x30(%eax),%edx
80102641:	c1 ea 10             	shr    $0x10,%edx
80102644:	80 fa 03             	cmp    $0x3,%dl
80102647:	77 77                	ja     801026c0 <lapicinit+0xe0>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102649:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102650:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102653:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102656:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010265d:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102660:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102663:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010266a:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010266d:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102670:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102677:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010267a:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010267d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102684:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102687:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010268a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102691:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
80102694:	8b 50 20             	mov    0x20(%eax),%edx
80102697:	89 f6                	mov    %esi,%esi
80102699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
801026a0:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801026a6:	80 e6 10             	and    $0x10,%dh
801026a9:	75 f5                	jne    801026a0 <lapicinit+0xc0>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026ab:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801026b2:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026b5:	8b 40 20             	mov    0x20(%eax),%eax
  while(lapic[ICRLO] & DELIVS)
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
801026b8:	5d                   	pop    %ebp
801026b9:	c3                   	ret    
801026ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026c0:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
801026c7:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801026ca:	8b 50 20             	mov    0x20(%eax),%edx
801026cd:	e9 77 ff ff ff       	jmp    80102649 <lapicinit+0x69>
801026d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801026d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801026e0 <cpunum>:
  lapicw(TPR, 0);
}

int
cpunum(void)
{
801026e0:	55                   	push   %ebp
801026e1:	89 e5                	mov    %esp,%ebp
801026e3:	83 ec 08             	sub    $0x8,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801026e6:	9c                   	pushf  
801026e7:	58                   	pop    %eax
  // Cannot call cpu when interrupts are enabled:
  // result not guaranteed to last long enough to be used!
  // Would prefer to panic but even printing is chancy here:
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
801026e8:	f6 c4 02             	test   $0x2,%ah
801026eb:	74 12                	je     801026ff <cpunum+0x1f>
    static int n;
    if(n++ == 0)
801026ed:	a1 b8 a5 10 80       	mov    0x8010a5b8,%eax
801026f2:	8d 50 01             	lea    0x1(%eax),%edx
801026f5:	85 c0                	test   %eax,%eax
801026f7:	89 15 b8 a5 10 80    	mov    %edx,0x8010a5b8
801026fd:	74 39                	je     80102738 <cpunum+0x58>
      cprintf("cpu called from %x with interrupts enabled\n",
        __builtin_return_address(0));
  }

  if (!lapic)
801026ff:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102704:	85 c0                	test   %eax,%eax
80102706:	74 28                	je     80102730 <cpunum+0x50>
    return 0;

  apicid = lapic[ID] >> 24;
80102708:	8b 40 20             	mov    0x20(%eax),%eax
  for (i = 0; i < ncpu; ++i) {
8010270b:	8b 15 5c 28 11 80    	mov    0x8011285c,%edx
  }

  if (!lapic)
    return 0;

  apicid = lapic[ID] >> 24;
80102711:	c1 e8 18             	shr    $0x18,%eax
  for (i = 0; i < ncpu; ++i) {
80102714:	85 d2                	test   %edx,%edx
80102716:	7e 0b                	jle    80102723 <cpunum+0x43>
    if (cpus[i].apicid == apicid)
80102718:	0f b6 15 a0 27 11 80 	movzbl 0x801127a0,%edx
8010271f:	39 d0                	cmp    %edx,%eax
80102721:	74 0d                	je     80102730 <cpunum+0x50>
      return i;
  }
  panic("unknown apicid\n");
80102723:	83 ec 0c             	sub    $0xc,%esp
80102726:	68 8c 77 10 80       	push   $0x8010778c
8010272b:	e8 40 dc ff ff       	call   80100370 <panic>
}
80102730:	31 c0                	xor    %eax,%eax
80102732:	c9                   	leave  
80102733:	c3                   	ret    
80102734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
    static int n;
    if(n++ == 0)
      cprintf("cpu called from %x with interrupts enabled\n",
80102738:	83 ec 08             	sub    $0x8,%esp
8010273b:	ff 75 04             	pushl  0x4(%ebp)
8010273e:	68 60 77 10 80       	push   $0x80107760
80102743:	e8 18 df ff ff       	call   80100660 <cprintf>
80102748:	83 c4 10             	add    $0x10,%esp
8010274b:	eb b2                	jmp    801026ff <cpunum+0x1f>
8010274d:	8d 76 00             	lea    0x0(%esi),%esi

80102750 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
80102750:	a1 9c 26 11 80       	mov    0x8011269c,%eax
}

// Acknowledge interrupt.
void
lapiceoi(void)
{
80102755:	55                   	push   %ebp
80102756:	89 e5                	mov    %esp,%ebp
  if(lapic)
80102758:	85 c0                	test   %eax,%eax
8010275a:	74 0d                	je     80102769 <lapiceoi+0x19>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010275c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102763:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102766:	8b 40 20             	mov    0x20(%eax),%eax
void
lapiceoi(void)
{
  if(lapic)
    lapicw(EOI, 0);
}
80102769:	5d                   	pop    %ebp
8010276a:	c3                   	ret    
8010276b:	90                   	nop
8010276c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102770 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
80102770:	55                   	push   %ebp
80102771:	89 e5                	mov    %esp,%ebp
}
80102773:	5d                   	pop    %ebp
80102774:	c3                   	ret    
80102775:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102780 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
80102780:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102781:	ba 70 00 00 00       	mov    $0x70,%edx
80102786:	b8 0f 00 00 00       	mov    $0xf,%eax
8010278b:	89 e5                	mov    %esp,%ebp
8010278d:	53                   	push   %ebx
8010278e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102791:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102794:	ee                   	out    %al,(%dx)
80102795:	ba 71 00 00 00       	mov    $0x71,%edx
8010279a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010279f:	ee                   	out    %al,(%dx)
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
801027a0:	31 c0                	xor    %eax,%eax
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027a2:	c1 e3 18             	shl    $0x18,%ebx
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
801027a5:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
801027ab:	89 c8                	mov    %ecx,%eax
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
801027ad:	c1 e9 0c             	shr    $0xc,%ecx
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
  wrv[1] = addr >> 4;
801027b0:	c1 e8 04             	shr    $0x4,%eax
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027b3:	89 da                	mov    %ebx,%edx
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
801027b5:	80 cd 06             	or     $0x6,%ch
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
  wrv[1] = addr >> 4;
801027b8:	66 a3 69 04 00 80    	mov    %ax,0x80000469
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027be:	a1 9c 26 11 80       	mov    0x8011269c,%eax
801027c3:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027c9:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027cc:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
801027d3:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027d6:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027d9:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
801027e0:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027e3:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027e6:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027ec:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027ef:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027f5:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027f8:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027fe:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102801:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102807:	8b 40 20             	mov    0x20(%eax),%eax
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
    microdelay(200);
  }
}
8010280a:	5b                   	pop    %ebx
8010280b:	5d                   	pop    %ebp
8010280c:	c3                   	ret    
8010280d:	8d 76 00             	lea    0x0(%esi),%esi

80102810 <cmostime>:
  r->year   = cmos_read(YEAR);
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void cmostime(struct rtcdate *r)
{
80102810:	55                   	push   %ebp
80102811:	ba 70 00 00 00       	mov    $0x70,%edx
80102816:	b8 0b 00 00 00       	mov    $0xb,%eax
8010281b:	89 e5                	mov    %esp,%ebp
8010281d:	57                   	push   %edi
8010281e:	56                   	push   %esi
8010281f:	53                   	push   %ebx
80102820:	83 ec 4c             	sub    $0x4c,%esp
80102823:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102824:	ba 71 00 00 00       	mov    $0x71,%edx
80102829:	ec                   	in     (%dx),%al
8010282a:	83 e0 04             	and    $0x4,%eax
8010282d:	8d 75 d0             	lea    -0x30(%ebp),%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102830:	31 db                	xor    %ebx,%ebx
80102832:	88 45 b7             	mov    %al,-0x49(%ebp)
80102835:	bf 70 00 00 00       	mov    $0x70,%edi
8010283a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102840:	89 d8                	mov    %ebx,%eax
80102842:	89 fa                	mov    %edi,%edx
80102844:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102845:	b9 71 00 00 00       	mov    $0x71,%ecx
8010284a:	89 ca                	mov    %ecx,%edx
8010284c:	ec                   	in     (%dx),%al
  return inb(CMOS_RETURN);
}

static void fill_rtcdate(struct rtcdate *r)
{
  r->second = cmos_read(SECS);
8010284d:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102850:	89 fa                	mov    %edi,%edx
80102852:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102855:	b8 02 00 00 00       	mov    $0x2,%eax
8010285a:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010285b:	89 ca                	mov    %ecx,%edx
8010285d:	ec                   	in     (%dx),%al
  r->minute = cmos_read(MINS);
8010285e:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102861:	89 fa                	mov    %edi,%edx
80102863:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102866:	b8 04 00 00 00       	mov    $0x4,%eax
8010286b:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010286c:	89 ca                	mov    %ecx,%edx
8010286e:	ec                   	in     (%dx),%al
  r->hour   = cmos_read(HOURS);
8010286f:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102872:	89 fa                	mov    %edi,%edx
80102874:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102877:	b8 07 00 00 00       	mov    $0x7,%eax
8010287c:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010287d:	89 ca                	mov    %ecx,%edx
8010287f:	ec                   	in     (%dx),%al
  r->day    = cmos_read(DAY);
80102880:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102883:	89 fa                	mov    %edi,%edx
80102885:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102888:	b8 08 00 00 00       	mov    $0x8,%eax
8010288d:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010288e:	89 ca                	mov    %ecx,%edx
80102890:	ec                   	in     (%dx),%al
  r->month  = cmos_read(MONTH);
80102891:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102894:	89 fa                	mov    %edi,%edx
80102896:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102899:	b8 09 00 00 00       	mov    $0x9,%eax
8010289e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010289f:	89 ca                	mov    %ecx,%edx
801028a1:	ec                   	in     (%dx),%al
  r->year   = cmos_read(YEAR);
801028a2:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028a5:	89 fa                	mov    %edi,%edx
801028a7:	89 45 cc             	mov    %eax,-0x34(%ebp)
801028aa:	b8 0a 00 00 00       	mov    $0xa,%eax
801028af:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028b0:	89 ca                	mov    %ecx,%edx
801028b2:	ec                   	in     (%dx),%al
  bcd = (sb & (1 << 2)) == 0;

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
801028b3:	84 c0                	test   %al,%al
801028b5:	78 89                	js     80102840 <cmostime+0x30>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028b7:	89 d8                	mov    %ebx,%eax
801028b9:	89 fa                	mov    %edi,%edx
801028bb:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028bc:	89 ca                	mov    %ecx,%edx
801028be:	ec                   	in     (%dx),%al
  return inb(CMOS_RETURN);
}

static void fill_rtcdate(struct rtcdate *r)
{
  r->second = cmos_read(SECS);
801028bf:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028c2:	89 fa                	mov    %edi,%edx
801028c4:	89 45 d0             	mov    %eax,-0x30(%ebp)
801028c7:	b8 02 00 00 00       	mov    $0x2,%eax
801028cc:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028cd:	89 ca                	mov    %ecx,%edx
801028cf:	ec                   	in     (%dx),%al
  r->minute = cmos_read(MINS);
801028d0:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028d3:	89 fa                	mov    %edi,%edx
801028d5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
801028d8:	b8 04 00 00 00       	mov    $0x4,%eax
801028dd:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028de:	89 ca                	mov    %ecx,%edx
801028e0:	ec                   	in     (%dx),%al
  r->hour   = cmos_read(HOURS);
801028e1:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028e4:	89 fa                	mov    %edi,%edx
801028e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
801028e9:	b8 07 00 00 00       	mov    $0x7,%eax
801028ee:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028ef:	89 ca                	mov    %ecx,%edx
801028f1:	ec                   	in     (%dx),%al
  r->day    = cmos_read(DAY);
801028f2:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028f5:	89 fa                	mov    %edi,%edx
801028f7:	89 45 dc             	mov    %eax,-0x24(%ebp)
801028fa:	b8 08 00 00 00       	mov    $0x8,%eax
801028ff:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102900:	89 ca                	mov    %ecx,%edx
80102902:	ec                   	in     (%dx),%al
  r->month  = cmos_read(MONTH);
80102903:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102906:	89 fa                	mov    %edi,%edx
80102908:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010290b:	b8 09 00 00 00       	mov    $0x9,%eax
80102910:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102911:	89 ca                	mov    %ecx,%edx
80102913:	ec                   	in     (%dx),%al
  r->year   = cmos_read(YEAR);
80102914:	0f b6 c0             	movzbl %al,%eax
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
80102917:	83 ec 04             	sub    $0x4,%esp
  r->second = cmos_read(SECS);
  r->minute = cmos_read(MINS);
  r->hour   = cmos_read(HOURS);
  r->day    = cmos_read(DAY);
  r->month  = cmos_read(MONTH);
  r->year   = cmos_read(YEAR);
8010291a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
8010291d:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102920:	6a 18                	push   $0x18
80102922:	56                   	push   %esi
80102923:	50                   	push   %eax
80102924:	e8 b7 1e 00 00       	call   801047e0 <memcmp>
80102929:	83 c4 10             	add    $0x10,%esp
8010292c:	85 c0                	test   %eax,%eax
8010292e:	0f 85 0c ff ff ff    	jne    80102840 <cmostime+0x30>
      break;
  }

  // convert
  if(bcd) {
80102934:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
80102938:	75 78                	jne    801029b2 <cmostime+0x1a2>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
8010293a:	8b 45 b8             	mov    -0x48(%ebp),%eax
8010293d:	89 c2                	mov    %eax,%edx
8010293f:	83 e0 0f             	and    $0xf,%eax
80102942:	c1 ea 04             	shr    $0x4,%edx
80102945:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102948:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010294b:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
8010294e:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102951:	89 c2                	mov    %eax,%edx
80102953:	83 e0 0f             	and    $0xf,%eax
80102956:	c1 ea 04             	shr    $0x4,%edx
80102959:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010295c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010295f:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
80102962:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102965:	89 c2                	mov    %eax,%edx
80102967:	83 e0 0f             	and    $0xf,%eax
8010296a:	c1 ea 04             	shr    $0x4,%edx
8010296d:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102970:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102973:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
80102976:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102979:	89 c2                	mov    %eax,%edx
8010297b:	83 e0 0f             	and    $0xf,%eax
8010297e:	c1 ea 04             	shr    $0x4,%edx
80102981:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102984:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102987:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
8010298a:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010298d:	89 c2                	mov    %eax,%edx
8010298f:	83 e0 0f             	and    $0xf,%eax
80102992:	c1 ea 04             	shr    $0x4,%edx
80102995:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102998:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010299b:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
8010299e:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029a1:	89 c2                	mov    %eax,%edx
801029a3:	83 e0 0f             	and    $0xf,%eax
801029a6:	c1 ea 04             	shr    $0x4,%edx
801029a9:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029ac:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029af:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
801029b2:	8b 75 08             	mov    0x8(%ebp),%esi
801029b5:	8b 45 b8             	mov    -0x48(%ebp),%eax
801029b8:	89 06                	mov    %eax,(%esi)
801029ba:	8b 45 bc             	mov    -0x44(%ebp),%eax
801029bd:	89 46 04             	mov    %eax,0x4(%esi)
801029c0:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029c3:	89 46 08             	mov    %eax,0x8(%esi)
801029c6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029c9:	89 46 0c             	mov    %eax,0xc(%esi)
801029cc:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029cf:	89 46 10             	mov    %eax,0x10(%esi)
801029d2:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029d5:	89 46 14             	mov    %eax,0x14(%esi)
  r->year += 2000;
801029d8:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
}
801029df:	8d 65 f4             	lea    -0xc(%ebp),%esp
801029e2:	5b                   	pop    %ebx
801029e3:	5e                   	pop    %esi
801029e4:	5f                   	pop    %edi
801029e5:	5d                   	pop    %ebp
801029e6:	c3                   	ret    
801029e7:	66 90                	xchg   %ax,%ax
801029e9:	66 90                	xchg   %ax,%ax
801029eb:	66 90                	xchg   %ax,%ax
801029ed:	66 90                	xchg   %ax,%ax
801029ef:	90                   	nop

801029f0 <install_trans>:
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
801029f0:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
801029f6:	85 c9                	test   %ecx,%ecx
801029f8:	0f 8e 85 00 00 00    	jle    80102a83 <install_trans+0x93>
}

// Copy committed blocks from log to their home location
static void
install_trans(void)
{
801029fe:	55                   	push   %ebp
801029ff:	89 e5                	mov    %esp,%ebp
80102a01:	57                   	push   %edi
80102a02:	56                   	push   %esi
80102a03:	53                   	push   %ebx
80102a04:	31 db                	xor    %ebx,%ebx
80102a06:	83 ec 0c             	sub    $0xc,%esp
80102a09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
80102a10:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102a15:	83 ec 08             	sub    $0x8,%esp
80102a18:	01 d8                	add    %ebx,%eax
80102a1a:	83 c0 01             	add    $0x1,%eax
80102a1d:	50                   	push   %eax
80102a1e:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102a24:	e8 a7 d6 ff ff       	call   801000d0 <bread>
80102a29:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102a2b:	58                   	pop    %eax
80102a2c:	5a                   	pop    %edx
80102a2d:	ff 34 9d ec 26 11 80 	pushl  -0x7feed914(,%ebx,4)
80102a34:	ff 35 e4 26 11 80    	pushl  0x801126e4
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102a3a:	83 c3 01             	add    $0x1,%ebx
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102a3d:	e8 8e d6 ff ff       	call   801000d0 <bread>
80102a42:	89 c6                	mov    %eax,%esi
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102a44:	8d 47 5c             	lea    0x5c(%edi),%eax
80102a47:	83 c4 0c             	add    $0xc,%esp
80102a4a:	68 00 02 00 00       	push   $0x200
80102a4f:	50                   	push   %eax
80102a50:	8d 46 5c             	lea    0x5c(%esi),%eax
80102a53:	50                   	push   %eax
80102a54:	e8 e7 1d 00 00       	call   80104840 <memmove>
    bwrite(dbuf);  // write dst to disk
80102a59:	89 34 24             	mov    %esi,(%esp)
80102a5c:	e8 3f d7 ff ff       	call   801001a0 <bwrite>
    brelse(lbuf);
80102a61:	89 3c 24             	mov    %edi,(%esp)
80102a64:	e8 77 d7 ff ff       	call   801001e0 <brelse>
    brelse(dbuf);
80102a69:	89 34 24             	mov    %esi,(%esp)
80102a6c:	e8 6f d7 ff ff       	call   801001e0 <brelse>
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102a71:	83 c4 10             	add    $0x10,%esp
80102a74:	39 1d e8 26 11 80    	cmp    %ebx,0x801126e8
80102a7a:	7f 94                	jg     80102a10 <install_trans+0x20>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    bwrite(dbuf);  // write dst to disk
    brelse(lbuf);
    brelse(dbuf);
  }
}
80102a7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a7f:	5b                   	pop    %ebx
80102a80:	5e                   	pop    %esi
80102a81:	5f                   	pop    %edi
80102a82:	5d                   	pop    %ebp
80102a83:	f3 c3                	repz ret 
80102a85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102a90 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102a90:	55                   	push   %ebp
80102a91:	89 e5                	mov    %esp,%ebp
80102a93:	53                   	push   %ebx
80102a94:	83 ec 0c             	sub    $0xc,%esp
  struct buf *buf = bread(log.dev, log.start);
80102a97:	ff 35 d4 26 11 80    	pushl  0x801126d4
80102a9d:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102aa3:	e8 28 d6 ff ff       	call   801000d0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102aa8:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
  for (i = 0; i < log.lh.n; i++) {
80102aae:	83 c4 10             	add    $0x10,%esp
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102ab1:	89 c3                	mov    %eax,%ebx
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102ab3:	85 c9                	test   %ecx,%ecx
write_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102ab5:	89 48 5c             	mov    %ecx,0x5c(%eax)
  for (i = 0; i < log.lh.n; i++) {
80102ab8:	7e 1f                	jle    80102ad9 <write_head+0x49>
80102aba:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80102ac1:	31 d2                	xor    %edx,%edx
80102ac3:	90                   	nop
80102ac4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    hb->block[i] = log.lh.block[i];
80102ac8:	8b 8a ec 26 11 80    	mov    -0x7feed914(%edx),%ecx
80102ace:	89 4c 13 60          	mov    %ecx,0x60(%ebx,%edx,1)
80102ad2:	83 c2 04             	add    $0x4,%edx
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102ad5:	39 c2                	cmp    %eax,%edx
80102ad7:	75 ef                	jne    80102ac8 <write_head+0x38>
    hb->block[i] = log.lh.block[i];
  }
  bwrite(buf);
80102ad9:	83 ec 0c             	sub    $0xc,%esp
80102adc:	53                   	push   %ebx
80102add:	e8 be d6 ff ff       	call   801001a0 <bwrite>
  brelse(buf);
80102ae2:	89 1c 24             	mov    %ebx,(%esp)
80102ae5:	e8 f6 d6 ff ff       	call   801001e0 <brelse>
}
80102aea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102aed:	c9                   	leave  
80102aee:	c3                   	ret    
80102aef:	90                   	nop

80102af0 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev)
{
80102af0:	55                   	push   %ebp
80102af1:	89 e5                	mov    %esp,%ebp
80102af3:	53                   	push   %ebx
80102af4:	83 ec 2c             	sub    $0x2c,%esp
80102af7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
80102afa:	68 9c 77 10 80       	push   $0x8010779c
80102aff:	68 a0 26 11 80       	push   $0x801126a0
80102b04:	e8 37 1a 00 00       	call   80104540 <initlock>
  readsb(dev, &sb);
80102b09:	58                   	pop    %eax
80102b0a:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102b0d:	5a                   	pop    %edx
80102b0e:	50                   	push   %eax
80102b0f:	53                   	push   %ebx
80102b10:	e8 8b e8 ff ff       	call   801013a0 <readsb>
  log.start = sb.logstart;
  log.size = sb.nlog;
80102b15:	8b 55 e8             	mov    -0x18(%ebp),%edx
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
80102b18:	8b 45 ec             	mov    -0x14(%ebp),%eax

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102b1b:	59                   	pop    %ecx
  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
80102b1c:	89 1d e4 26 11 80    	mov    %ebx,0x801126e4

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
80102b22:	89 15 d8 26 11 80    	mov    %edx,0x801126d8
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
80102b28:	a3 d4 26 11 80       	mov    %eax,0x801126d4

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102b2d:	5a                   	pop    %edx
80102b2e:	50                   	push   %eax
80102b2f:	53                   	push   %ebx
80102b30:	e8 9b d5 ff ff       	call   801000d0 <bread>
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102b35:	8b 48 5c             	mov    0x5c(%eax),%ecx
  for (i = 0; i < log.lh.n; i++) {
80102b38:	83 c4 10             	add    $0x10,%esp
80102b3b:	85 c9                	test   %ecx,%ecx
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102b3d:	89 0d e8 26 11 80    	mov    %ecx,0x801126e8
  for (i = 0; i < log.lh.n; i++) {
80102b43:	7e 1c                	jle    80102b61 <initlog+0x71>
80102b45:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80102b4c:	31 d2                	xor    %edx,%edx
80102b4e:	66 90                	xchg   %ax,%ax
    log.lh.block[i] = lh->block[i];
80102b50:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102b54:	83 c2 04             	add    $0x4,%edx
80102b57:	89 8a e8 26 11 80    	mov    %ecx,-0x7feed918(%edx)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
  for (i = 0; i < log.lh.n; i++) {
80102b5d:	39 da                	cmp    %ebx,%edx
80102b5f:	75 ef                	jne    80102b50 <initlog+0x60>
    log.lh.block[i] = lh->block[i];
  }
  brelse(buf);
80102b61:	83 ec 0c             	sub    $0xc,%esp
80102b64:	50                   	push   %eax
80102b65:	e8 76 d6 ff ff       	call   801001e0 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102b6a:	e8 81 fe ff ff       	call   801029f0 <install_trans>
  log.lh.n = 0;
80102b6f:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102b76:	00 00 00 
  write_head(); // clear the log
80102b79:	e8 12 ff ff ff       	call   80102a90 <write_head>
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
  recover_from_log();
}
80102b7e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102b81:	c9                   	leave  
80102b82:	c3                   	ret    
80102b83:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102b90 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102b90:	55                   	push   %ebp
80102b91:	89 e5                	mov    %esp,%ebp
80102b93:	83 ec 14             	sub    $0x14,%esp
  acquire(&log.lock);
80102b96:	68 a0 26 11 80       	push   $0x801126a0
80102b9b:	e8 c0 19 00 00       	call   80104560 <acquire>
80102ba0:	83 c4 10             	add    $0x10,%esp
80102ba3:	eb 18                	jmp    80102bbd <begin_op+0x2d>
80102ba5:	8d 76 00             	lea    0x0(%esi),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102ba8:	83 ec 08             	sub    $0x8,%esp
80102bab:	68 a0 26 11 80       	push   $0x801126a0
80102bb0:	68 a0 26 11 80       	push   $0x801126a0
80102bb5:	e8 26 13 00 00       	call   80103ee0 <sleep>
80102bba:	83 c4 10             	add    $0x10,%esp
void
begin_op(void)
{
  acquire(&log.lock);
  while(1){
    if(log.committing){
80102bbd:	a1 e0 26 11 80       	mov    0x801126e0,%eax
80102bc2:	85 c0                	test   %eax,%eax
80102bc4:	75 e2                	jne    80102ba8 <begin_op+0x18>
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102bc6:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102bcb:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102bd1:	83 c0 01             	add    $0x1,%eax
80102bd4:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102bd7:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102bda:	83 fa 1e             	cmp    $0x1e,%edx
80102bdd:	7f c9                	jg     80102ba8 <begin_op+0x18>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102bdf:	83 ec 0c             	sub    $0xc,%esp
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
80102be2:	a3 dc 26 11 80       	mov    %eax,0x801126dc
      release(&log.lock);
80102be7:	68 a0 26 11 80       	push   $0x801126a0
80102bec:	e8 4f 1b 00 00       	call   80104740 <release>
      break;
    }
  }
}
80102bf1:	83 c4 10             	add    $0x10,%esp
80102bf4:	c9                   	leave  
80102bf5:	c3                   	ret    
80102bf6:	8d 76 00             	lea    0x0(%esi),%esi
80102bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102c00 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102c00:	55                   	push   %ebp
80102c01:	89 e5                	mov    %esp,%ebp
80102c03:	57                   	push   %edi
80102c04:	56                   	push   %esi
80102c05:	53                   	push   %ebx
80102c06:	83 ec 18             	sub    $0x18,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102c09:	68 a0 26 11 80       	push   $0x801126a0
80102c0e:	e8 4d 19 00 00       	call   80104560 <acquire>
  log.outstanding -= 1;
80102c13:	a1 dc 26 11 80       	mov    0x801126dc,%eax
  if(log.committing)
80102c18:	8b 1d e0 26 11 80    	mov    0x801126e0,%ebx
80102c1e:	83 c4 10             	add    $0x10,%esp
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102c21:	83 e8 01             	sub    $0x1,%eax
  if(log.committing)
80102c24:	85 db                	test   %ebx,%ebx
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102c26:	a3 dc 26 11 80       	mov    %eax,0x801126dc
  if(log.committing)
80102c2b:	0f 85 23 01 00 00    	jne    80102d54 <end_op+0x154>
    panic("log.committing");
  if(log.outstanding == 0){
80102c31:	85 c0                	test   %eax,%eax
80102c33:	0f 85 f7 00 00 00    	jne    80102d30 <end_op+0x130>
    log.committing = 1;
  } else {
    // begin_op() may be waiting for log space.
    wakeup(&log);
  }
  release(&log.lock);
80102c39:	83 ec 0c             	sub    $0xc,%esp
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
  if(log.outstanding == 0){
    do_commit = 1;
    log.committing = 1;
80102c3c:	c7 05 e0 26 11 80 01 	movl   $0x1,0x801126e0
80102c43:	00 00 00 
}

static void
commit()
{
  if (log.lh.n > 0) {
80102c46:	31 db                	xor    %ebx,%ebx
    log.committing = 1;
  } else {
    // begin_op() may be waiting for log space.
    wakeup(&log);
  }
  release(&log.lock);
80102c48:	68 a0 26 11 80       	push   $0x801126a0
80102c4d:	e8 ee 1a 00 00       	call   80104740 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80102c52:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
80102c58:	83 c4 10             	add    $0x10,%esp
80102c5b:	85 c9                	test   %ecx,%ecx
80102c5d:	0f 8e 8a 00 00 00    	jle    80102ced <end_op+0xed>
80102c63:	90                   	nop
80102c64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102c68:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102c6d:	83 ec 08             	sub    $0x8,%esp
80102c70:	01 d8                	add    %ebx,%eax
80102c72:	83 c0 01             	add    $0x1,%eax
80102c75:	50                   	push   %eax
80102c76:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102c7c:	e8 4f d4 ff ff       	call   801000d0 <bread>
80102c81:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c83:	58                   	pop    %eax
80102c84:	5a                   	pop    %edx
80102c85:	ff 34 9d ec 26 11 80 	pushl  -0x7feed914(,%ebx,4)
80102c8c:	ff 35 e4 26 11 80    	pushl  0x801126e4
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102c92:	83 c3 01             	add    $0x1,%ebx
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c95:	e8 36 d4 ff ff       	call   801000d0 <bread>
80102c9a:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102c9c:	8d 40 5c             	lea    0x5c(%eax),%eax
80102c9f:	83 c4 0c             	add    $0xc,%esp
80102ca2:	68 00 02 00 00       	push   $0x200
80102ca7:	50                   	push   %eax
80102ca8:	8d 46 5c             	lea    0x5c(%esi),%eax
80102cab:	50                   	push   %eax
80102cac:	e8 8f 1b 00 00       	call   80104840 <memmove>
    bwrite(to);  // write the log
80102cb1:	89 34 24             	mov    %esi,(%esp)
80102cb4:	e8 e7 d4 ff ff       	call   801001a0 <bwrite>
    brelse(from);
80102cb9:	89 3c 24             	mov    %edi,(%esp)
80102cbc:	e8 1f d5 ff ff       	call   801001e0 <brelse>
    brelse(to);
80102cc1:	89 34 24             	mov    %esi,(%esp)
80102cc4:	e8 17 d5 ff ff       	call   801001e0 <brelse>
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102cc9:	83 c4 10             	add    $0x10,%esp
80102ccc:	3b 1d e8 26 11 80    	cmp    0x801126e8,%ebx
80102cd2:	7c 94                	jl     80102c68 <end_op+0x68>
static void
commit()
{
  if (log.lh.n > 0) {
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102cd4:	e8 b7 fd ff ff       	call   80102a90 <write_head>
    install_trans(); // Now install writes to home locations
80102cd9:	e8 12 fd ff ff       	call   801029f0 <install_trans>
    log.lh.n = 0;
80102cde:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102ce5:	00 00 00 
    write_head();    // Erase the transaction from the log
80102ce8:	e8 a3 fd ff ff       	call   80102a90 <write_head>

  if(do_commit){
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    acquire(&log.lock);
80102ced:	83 ec 0c             	sub    $0xc,%esp
80102cf0:	68 a0 26 11 80       	push   $0x801126a0
80102cf5:	e8 66 18 00 00       	call   80104560 <acquire>
    log.committing = 0;
    wakeup(&log);
80102cfa:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
  if(do_commit){
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    acquire(&log.lock);
    log.committing = 0;
80102d01:	c7 05 e0 26 11 80 00 	movl   $0x0,0x801126e0
80102d08:	00 00 00 
    wakeup(&log);
80102d0b:	e8 80 13 00 00       	call   80104090 <wakeup>
    release(&log.lock);
80102d10:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d17:	e8 24 1a 00 00       	call   80104740 <release>
80102d1c:	83 c4 10             	add    $0x10,%esp
  }
}
80102d1f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d22:	5b                   	pop    %ebx
80102d23:	5e                   	pop    %esi
80102d24:	5f                   	pop    %edi
80102d25:	5d                   	pop    %ebp
80102d26:	c3                   	ret    
80102d27:	89 f6                	mov    %esi,%esi
80102d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if(log.outstanding == 0){
    do_commit = 1;
    log.committing = 1;
  } else {
    // begin_op() may be waiting for log space.
    wakeup(&log);
80102d30:	83 ec 0c             	sub    $0xc,%esp
80102d33:	68 a0 26 11 80       	push   $0x801126a0
80102d38:	e8 53 13 00 00       	call   80104090 <wakeup>
  }
  release(&log.lock);
80102d3d:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d44:	e8 f7 19 00 00       	call   80104740 <release>
80102d49:	83 c4 10             	add    $0x10,%esp
    acquire(&log.lock);
    log.committing = 0;
    wakeup(&log);
    release(&log.lock);
  }
}
80102d4c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d4f:	5b                   	pop    %ebx
80102d50:	5e                   	pop    %esi
80102d51:	5f                   	pop    %edi
80102d52:	5d                   	pop    %ebp
80102d53:	c3                   	ret    
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
80102d54:	83 ec 0c             	sub    $0xc,%esp
80102d57:	68 a0 77 10 80       	push   $0x801077a0
80102d5c:	e8 0f d6 ff ff       	call   80100370 <panic>
80102d61:	eb 0d                	jmp    80102d70 <log_write>
80102d63:	90                   	nop
80102d64:	90                   	nop
80102d65:	90                   	nop
80102d66:	90                   	nop
80102d67:	90                   	nop
80102d68:	90                   	nop
80102d69:	90                   	nop
80102d6a:	90                   	nop
80102d6b:	90                   	nop
80102d6c:	90                   	nop
80102d6d:	90                   	nop
80102d6e:	90                   	nop
80102d6f:	90                   	nop

80102d70 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102d70:	55                   	push   %ebp
80102d71:	89 e5                	mov    %esp,%ebp
80102d73:	53                   	push   %ebx
80102d74:	83 ec 04             	sub    $0x4,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102d77:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102d7d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102d80:	83 fa 1d             	cmp    $0x1d,%edx
80102d83:	0f 8f 97 00 00 00    	jg     80102e20 <log_write+0xb0>
80102d89:	a1 d8 26 11 80       	mov    0x801126d8,%eax
80102d8e:	83 e8 01             	sub    $0x1,%eax
80102d91:	39 c2                	cmp    %eax,%edx
80102d93:	0f 8d 87 00 00 00    	jge    80102e20 <log_write+0xb0>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102d99:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102d9e:	85 c0                	test   %eax,%eax
80102da0:	0f 8e 87 00 00 00    	jle    80102e2d <log_write+0xbd>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102da6:	83 ec 0c             	sub    $0xc,%esp
80102da9:	68 a0 26 11 80       	push   $0x801126a0
80102dae:	e8 ad 17 00 00       	call   80104560 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102db3:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102db9:	83 c4 10             	add    $0x10,%esp
80102dbc:	83 fa 00             	cmp    $0x0,%edx
80102dbf:	7e 50                	jle    80102e11 <log_write+0xa1>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102dc1:	8b 4b 08             	mov    0x8(%ebx),%ecx
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102dc4:	31 c0                	xor    %eax,%eax
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102dc6:	3b 0d ec 26 11 80    	cmp    0x801126ec,%ecx
80102dcc:	75 0b                	jne    80102dd9 <log_write+0x69>
80102dce:	eb 38                	jmp    80102e08 <log_write+0x98>
80102dd0:	39 0c 85 ec 26 11 80 	cmp    %ecx,-0x7feed914(,%eax,4)
80102dd7:	74 2f                	je     80102e08 <log_write+0x98>
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102dd9:	83 c0 01             	add    $0x1,%eax
80102ddc:	39 d0                	cmp    %edx,%eax
80102dde:	75 f0                	jne    80102dd0 <log_write+0x60>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102de0:	89 0c 95 ec 26 11 80 	mov    %ecx,-0x7feed914(,%edx,4)
  if (i == log.lh.n)
    log.lh.n++;
80102de7:	83 c2 01             	add    $0x1,%edx
80102dea:	89 15 e8 26 11 80    	mov    %edx,0x801126e8
  b->flags |= B_DIRTY; // prevent eviction
80102df0:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
80102df3:	c7 45 08 a0 26 11 80 	movl   $0x801126a0,0x8(%ebp)
}
80102dfa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102dfd:	c9                   	leave  
  }
  log.lh.block[i] = b->blockno;
  if (i == log.lh.n)
    log.lh.n++;
  b->flags |= B_DIRTY; // prevent eviction
  release(&log.lock);
80102dfe:	e9 3d 19 00 00       	jmp    80104740 <release>
80102e03:	90                   	nop
80102e04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102e08:	89 0c 85 ec 26 11 80 	mov    %ecx,-0x7feed914(,%eax,4)
80102e0f:	eb df                	jmp    80102df0 <log_write+0x80>
80102e11:	8b 43 08             	mov    0x8(%ebx),%eax
80102e14:	a3 ec 26 11 80       	mov    %eax,0x801126ec
  if (i == log.lh.n)
80102e19:	75 d5                	jne    80102df0 <log_write+0x80>
80102e1b:	eb ca                	jmp    80102de7 <log_write+0x77>
80102e1d:	8d 76 00             	lea    0x0(%esi),%esi
log_write(struct buf *b)
{
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    panic("too big a transaction");
80102e20:	83 ec 0c             	sub    $0xc,%esp
80102e23:	68 af 77 10 80       	push   $0x801077af
80102e28:	e8 43 d5 ff ff       	call   80100370 <panic>
  if (log.outstanding < 1)
    panic("log_write outside of trans");
80102e2d:	83 ec 0c             	sub    $0xc,%esp
80102e30:	68 c5 77 10 80       	push   $0x801077c5
80102e35:	e8 36 d5 ff ff       	call   80100370 <panic>
80102e3a:	66 90                	xchg   %ax,%ax
80102e3c:	66 90                	xchg   %ax,%ax
80102e3e:	66 90                	xchg   %ax,%ax

80102e40 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102e40:	55                   	push   %ebp
80102e41:	89 e5                	mov    %esp,%ebp
80102e43:	83 ec 08             	sub    $0x8,%esp
  cprintf("cpu%d: starting\n", cpunum());
80102e46:	e8 95 f8 ff ff       	call   801026e0 <cpunum>
80102e4b:	83 ec 08             	sub    $0x8,%esp
80102e4e:	50                   	push   %eax
80102e4f:	68 e0 77 10 80       	push   $0x801077e0
80102e54:	e8 07 d8 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
80102e59:	e8 82 2c 00 00       	call   80105ae0 <idtinit>
  xchg(&cpu->started, 1); // tell startothers() we're up
80102e5e:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102e65:	b8 01 00 00 00       	mov    $0x1,%eax
80102e6a:	f0 87 82 a8 00 00 00 	lock xchg %eax,0xa8(%edx)
  scheduler();     // start running processes
80102e71:	e8 2a 0d 00 00       	call   80103ba0 <scheduler>
80102e76:	8d 76 00             	lea    0x0(%esi),%esi
80102e79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102e80 <mpenter>:
}

// Other CPUs jump here from entryother.S.
static void
mpenter(void)
{
80102e80:	55                   	push   %ebp
80102e81:	89 e5                	mov    %esp,%ebp
80102e83:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102e86:	e8 65 3e 00 00       	call   80106cf0 <switchkvm>
  seginit();
80102e8b:	e8 80 3c 00 00       	call   80106b10 <seginit>
  lapicinit();
80102e90:	e8 4b f7 ff ff       	call   801025e0 <lapicinit>
  mpmain();
80102e95:	e8 a6 ff ff ff       	call   80102e40 <mpmain>
80102e9a:	66 90                	xchg   %ax,%ax
80102e9c:	66 90                	xchg   %ax,%ax
80102e9e:	66 90                	xchg   %ax,%ax

80102ea0 <main>:
// Bootstrap processor starts running C code here.
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
80102ea0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102ea4:	83 e4 f0             	and    $0xfffffff0,%esp
80102ea7:	ff 71 fc             	pushl  -0x4(%ecx)
80102eaa:	55                   	push   %ebp
80102eab:	89 e5                	mov    %esp,%ebp
80102ead:	53                   	push   %ebx
80102eae:	51                   	push   %ecx
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102eaf:	83 ec 08             	sub    $0x8,%esp
80102eb2:	68 00 00 40 80       	push   $0x80400000
80102eb7:	68 e8 55 11 80       	push   $0x801155e8
80102ebc:	e8 ef f4 ff ff       	call   801023b0 <kinit1>
  kvmalloc();      // kernel page table
80102ec1:	e8 0a 3e 00 00       	call   80106cd0 <kvmalloc>
  mpinit();        // detect other processors
80102ec6:	e8 b5 01 00 00       	call   80103080 <mpinit>
  lapicinit();     // interrupt controller
80102ecb:	e8 10 f7 ff ff       	call   801025e0 <lapicinit>
  seginit();       // segment descriptors
80102ed0:	e8 3b 3c 00 00       	call   80106b10 <seginit>
  cprintf("\ncpu%d: starting xv6\n\n", cpunum());
80102ed5:	e8 06 f8 ff ff       	call   801026e0 <cpunum>
80102eda:	5a                   	pop    %edx
80102edb:	59                   	pop    %ecx
80102edc:	50                   	push   %eax
80102edd:	68 f1 77 10 80       	push   $0x801077f1
80102ee2:	e8 79 d7 ff ff       	call   80100660 <cprintf>
  picinit();       // another interrupt controller
80102ee7:	e8 a4 03 00 00       	call   80103290 <picinit>
  ioapicinit();    // another interrupt controller
80102eec:	e8 df f2 ff ff       	call   801021d0 <ioapicinit>
  consoleinit();   // console hardware
80102ef1:	e8 aa da ff ff       	call   801009a0 <consoleinit>
  uartinit();      // serial port
80102ef6:	e8 e5 2e 00 00       	call   80105de0 <uartinit>
  pinit();         // process table
80102efb:	e8 40 09 00 00       	call   80103840 <pinit>
  tvinit();        // trap vectors
80102f00:	e8 3b 2b 00 00       	call   80105a40 <tvinit>
  binit();         // buffer cache
80102f05:	e8 36 d1 ff ff       	call   80100040 <binit>
  fileinit();      // file table
80102f0a:	e8 31 de ff ff       	call   80100d40 <fileinit>
  ideinit();       // disk
80102f0f:	e8 8c f0 ff ff       	call   80101fa0 <ideinit>
  if(!ismp)
80102f14:	8b 1d 84 27 11 80    	mov    0x80112784,%ebx
80102f1a:	83 c4 10             	add    $0x10,%esp
80102f1d:	85 db                	test   %ebx,%ebx
80102f1f:	0f 84 ca 00 00 00    	je     80102fef <main+0x14f>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102f25:	83 ec 04             	sub    $0x4,%esp

  for(c = cpus; c < cpus+ncpu; c++){
80102f28:	bb a0 27 11 80       	mov    $0x801127a0,%ebx

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102f2d:	68 8a 00 00 00       	push   $0x8a
80102f32:	68 8c a4 10 80       	push   $0x8010a48c
80102f37:	68 00 70 00 80       	push   $0x80007000
80102f3c:	e8 ff 18 00 00       	call   80104840 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80102f41:	69 05 5c 28 11 80 bc 	imul   $0xbc,0x8011285c,%eax
80102f48:	00 00 00 
80102f4b:	83 c4 10             	add    $0x10,%esp
80102f4e:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102f53:	39 d8                	cmp    %ebx,%eax
80102f55:	76 7c                	jbe    80102fd3 <main+0x133>
80102f57:	89 f6                	mov    %esi,%esi
80102f59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(c == cpus+cpunum())  // We've started already.
80102f60:	e8 7b f7 ff ff       	call   801026e0 <cpunum>
80102f65:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80102f6b:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102f70:	39 c3                	cmp    %eax,%ebx
80102f72:	74 46                	je     80102fba <main+0x11a>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102f74:	e8 07 f5 ff ff       	call   80102480 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
    *(void**)(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);

    lapicstartap(c->apicid, V2P(code));
80102f79:	83 ec 08             	sub    $0x8,%esp

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f7c:	05 00 10 00 00       	add    $0x1000,%eax
    *(void**)(code-8) = mpenter;
80102f81:	c7 05 f8 6f 00 80 80 	movl   $0x80102e80,0x80006ff8
80102f88:	2e 10 80 

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f8b:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
    *(void**)(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80102f90:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102f97:	90 10 00 

    lapicstartap(c->apicid, V2P(code));
80102f9a:	68 00 70 00 00       	push   $0x7000
80102f9f:	0f b6 03             	movzbl (%ebx),%eax
80102fa2:	50                   	push   %eax
80102fa3:	e8 d8 f7 ff ff       	call   80102780 <lapicstartap>
80102fa8:	83 c4 10             	add    $0x10,%esp
80102fab:	90                   	nop
80102fac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80102fb0:	8b 83 a8 00 00 00    	mov    0xa8(%ebx),%eax
80102fb6:	85 c0                	test   %eax,%eax
80102fb8:	74 f6                	je     80102fb0 <main+0x110>
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
80102fba:	69 05 5c 28 11 80 bc 	imul   $0xbc,0x8011285c,%eax
80102fc1:	00 00 00 
80102fc4:	81 c3 bc 00 00 00    	add    $0xbc,%ebx
80102fca:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102fcf:	39 c3                	cmp    %eax,%ebx
80102fd1:	72 8d                	jb     80102f60 <main+0xc0>
  fileinit();      // file table
  ideinit();       // disk
  if(!ismp)
    timerinit();   // uniprocessor timer
  startothers();   // start other processors
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80102fd3:	83 ec 08             	sub    $0x8,%esp
80102fd6:	68 00 00 00 8e       	push   $0x8e000000
80102fdb:	68 00 00 40 80       	push   $0x80400000
80102fe0:	e8 3b f4 ff ff       	call   80102420 <kinit2>
  userinit();      // first user process
80102fe5:	e8 76 08 00 00       	call   80103860 <userinit>
  mpmain();        // finish this processor's setup
80102fea:	e8 51 fe ff ff       	call   80102e40 <mpmain>
  tvinit();        // trap vectors
  binit();         // buffer cache
  fileinit();      // file table
  ideinit();       // disk
  if(!ismp)
    timerinit();   // uniprocessor timer
80102fef:	e8 ec 29 00 00       	call   801059e0 <timerinit>
80102ff4:	e9 2c ff ff ff       	jmp    80102f25 <main+0x85>
80102ff9:	66 90                	xchg   %ax,%ax
80102ffb:	66 90                	xchg   %ax,%ax
80102ffd:	66 90                	xchg   %ax,%ax
80102fff:	90                   	nop

80103000 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80103000:	55                   	push   %ebp
80103001:	89 e5                	mov    %esp,%ebp
80103003:	57                   	push   %edi
80103004:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80103005:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
8010300b:	53                   	push   %ebx
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
8010300c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
8010300f:	83 ec 0c             	sub    $0xc,%esp
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80103012:	39 de                	cmp    %ebx,%esi
80103014:	73 48                	jae    8010305e <mpsearch1+0x5e>
80103016:	8d 76 00             	lea    0x0(%esi),%esi
80103019:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80103020:	83 ec 04             	sub    $0x4,%esp
80103023:	8d 7e 10             	lea    0x10(%esi),%edi
80103026:	6a 04                	push   $0x4
80103028:	68 08 78 10 80       	push   $0x80107808
8010302d:	56                   	push   %esi
8010302e:	e8 ad 17 00 00       	call   801047e0 <memcmp>
80103033:	83 c4 10             	add    $0x10,%esp
80103036:	85 c0                	test   %eax,%eax
80103038:	75 1e                	jne    80103058 <mpsearch1+0x58>
8010303a:	8d 7e 10             	lea    0x10(%esi),%edi
8010303d:	89 f2                	mov    %esi,%edx
8010303f:	31 c9                	xor    %ecx,%ecx
80103041:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
    sum += addr[i];
80103048:	0f b6 02             	movzbl (%edx),%eax
8010304b:	83 c2 01             	add    $0x1,%edx
8010304e:	01 c1                	add    %eax,%ecx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80103050:	39 fa                	cmp    %edi,%edx
80103052:	75 f4                	jne    80103048 <mpsearch1+0x48>
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80103054:	84 c9                	test   %cl,%cl
80103056:	74 10                	je     80103068 <mpsearch1+0x68>
{
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80103058:	39 fb                	cmp    %edi,%ebx
8010305a:	89 fe                	mov    %edi,%esi
8010305c:	77 c2                	ja     80103020 <mpsearch1+0x20>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
}
8010305e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
80103061:	31 c0                	xor    %eax,%eax
}
80103063:	5b                   	pop    %ebx
80103064:	5e                   	pop    %esi
80103065:	5f                   	pop    %edi
80103066:	5d                   	pop    %ebp
80103067:	c3                   	ret    
80103068:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010306b:	89 f0                	mov    %esi,%eax
8010306d:	5b                   	pop    %ebx
8010306e:	5e                   	pop    %esi
8010306f:	5f                   	pop    %edi
80103070:	5d                   	pop    %ebp
80103071:	c3                   	ret    
80103072:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103079:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103080 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80103080:	55                   	push   %ebp
80103081:	89 e5                	mov    %esp,%ebp
80103083:	57                   	push   %edi
80103084:	56                   	push   %esi
80103085:	53                   	push   %ebx
80103086:	83 ec 1c             	sub    $0x1c,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80103089:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103090:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103097:	c1 e0 08             	shl    $0x8,%eax
8010309a:	09 d0                	or     %edx,%eax
8010309c:	c1 e0 04             	shl    $0x4,%eax
8010309f:	85 c0                	test   %eax,%eax
801030a1:	75 1b                	jne    801030be <mpinit+0x3e>
    if((mp = mpsearch1(p, 1024)))
      return mp;
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
801030a3:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
801030aa:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
801030b1:	c1 e0 08             	shl    $0x8,%eax
801030b4:	09 d0                	or     %edx,%eax
801030b6:	c1 e0 0a             	shl    $0xa,%eax
801030b9:	2d 00 04 00 00       	sub    $0x400,%eax
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
    if((mp = mpsearch1(p, 1024)))
801030be:	ba 00 04 00 00       	mov    $0x400,%edx
801030c3:	e8 38 ff ff ff       	call   80103000 <mpsearch1>
801030c8:	85 c0                	test   %eax,%eax
801030ca:	89 c6                	mov    %eax,%esi
801030cc:	0f 84 66 01 00 00    	je     80103238 <mpinit+0x1b8>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801030d2:	8b 5e 04             	mov    0x4(%esi),%ebx
801030d5:	85 db                	test   %ebx,%ebx
801030d7:	0f 84 d2 00 00 00    	je     801031af <mpinit+0x12f>
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
801030dd:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
  if(memcmp(conf, "PCMP", 4) != 0)
801030e3:	83 ec 04             	sub    $0x4,%esp
801030e6:	6a 04                	push   $0x4
801030e8:	68 0d 78 10 80       	push   $0x8010780d
801030ed:	50                   	push   %eax
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
801030ee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(memcmp(conf, "PCMP", 4) != 0)
801030f1:	e8 ea 16 00 00       	call   801047e0 <memcmp>
801030f6:	83 c4 10             	add    $0x10,%esp
801030f9:	85 c0                	test   %eax,%eax
801030fb:	0f 85 ae 00 00 00    	jne    801031af <mpinit+0x12f>
    return 0;
  if(conf->version != 1 && conf->version != 4)
80103101:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80103108:	3c 01                	cmp    $0x1,%al
8010310a:	74 08                	je     80103114 <mpinit+0x94>
8010310c:	3c 04                	cmp    $0x4,%al
8010310e:	0f 85 9b 00 00 00    	jne    801031af <mpinit+0x12f>
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
80103114:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
8010311b:	85 ff                	test   %edi,%edi
8010311d:	74 1e                	je     8010313d <mpinit+0xbd>
8010311f:	31 d2                	xor    %edx,%edx
80103121:	31 c0                	xor    %eax,%eax
80103123:	90                   	nop
80103124:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sum += addr[i];
80103128:	0f b6 8c 03 00 00 00 	movzbl -0x80000000(%ebx,%eax,1),%ecx
8010312f:	80 
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80103130:	83 c0 01             	add    $0x1,%eax
    sum += addr[i];
80103133:	01 ca                	add    %ecx,%edx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80103135:	39 c7                	cmp    %eax,%edi
80103137:	75 ef                	jne    80103128 <mpinit+0xa8>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
  if(memcmp(conf, "PCMP", 4) != 0)
    return 0;
  if(conf->version != 1 && conf->version != 4)
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
80103139:	84 d2                	test   %dl,%dl
8010313b:	75 72                	jne    801031af <mpinit+0x12f>
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
8010313d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103140:	85 ff                	test   %edi,%edi
80103142:	74 6b                	je     801031af <mpinit+0x12f>
    return;
  ismp = 1;
80103144:	c7 05 84 27 11 80 01 	movl   $0x1,0x80112784
8010314b:	00 00 00 
  lapic = (uint*)conf->lapicaddr;
8010314e:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
80103154:	a3 9c 26 11 80       	mov    %eax,0x8011269c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103159:	0f b7 8b 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%ecx
80103160:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
80103166:	01 f9                	add    %edi,%ecx
80103168:	39 c8                	cmp    %ecx,%eax
8010316a:	0f 83 a0 00 00 00    	jae    80103210 <mpinit+0x190>
    switch(*p){
80103170:	80 38 04             	cmpb   $0x4,(%eax)
80103173:	77 6b                	ja     801031e0 <mpinit+0x160>
80103175:	0f b6 10             	movzbl (%eax),%edx
80103178:	ff 24 95 14 78 10 80 	jmp    *-0x7fef87ec(,%edx,4)
8010317f:	90                   	nop
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80103180:	83 c0 08             	add    $0x8,%eax

  if((conf = mpconfig(&mp)) == 0)
    return;
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103183:	39 c1                	cmp    %eax,%ecx
80103185:	77 e9                	ja     80103170 <mpinit+0xf0>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp){
80103187:	a1 84 27 11 80       	mov    0x80112784,%eax
8010318c:	85 c0                	test   %eax,%eax
8010318e:	0f 85 7c 00 00 00    	jne    80103210 <mpinit+0x190>
    // Didn't like what we found; fall back to no MP.
    ncpu = 1;
80103194:	c7 05 5c 28 11 80 01 	movl   $0x1,0x8011285c
8010319b:	00 00 00 
    lapic = 0;
8010319e:	c7 05 9c 26 11 80 00 	movl   $0x0,0x8011269c
801031a5:	00 00 00 
    ioapicid = 0;
801031a8:	c6 05 80 27 11 80 00 	movb   $0x0,0x80112780
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
801031af:	8d 65 f4             	lea    -0xc(%ebp),%esp
801031b2:	5b                   	pop    %ebx
801031b3:	5e                   	pop    %esi
801031b4:	5f                   	pop    %edi
801031b5:	5d                   	pop    %ebp
801031b6:	c3                   	ret    
801031b7:	89 f6                	mov    %esi,%esi
801031b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
801031c0:	8b 15 5c 28 11 80    	mov    0x8011285c,%edx
801031c6:	85 d2                	test   %edx,%edx
801031c8:	7e 26                	jle    801031f0 <mpinit+0x170>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
        ncpu++;
      }
      p += sizeof(struct mpproc);
801031ca:	83 c0 14             	add    $0x14,%eax
      continue;
801031cd:	eb b4                	jmp    80103183 <mpinit+0x103>
801031cf:	90                   	nop
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
801031d0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
      p += sizeof(struct mpioapic);
801031d4:	83 c0 08             	add    $0x8,%eax
      }
      p += sizeof(struct mpproc);
      continue;
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
801031d7:	88 15 80 27 11 80    	mov    %dl,0x80112780
      p += sizeof(struct mpioapic);
      continue;
801031dd:	eb a4                	jmp    80103183 <mpinit+0x103>
801031df:	90                   	nop
    case MPIOINTR:
    case MPLINTR:
      p += 8;
      continue;
    default:
      ismp = 0;
801031e0:	c7 05 84 27 11 80 00 	movl   $0x0,0x80112784
801031e7:	00 00 00 
      break;
801031ea:	eb 97                	jmp    80103183 <mpinit+0x103>
801031ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
801031f0:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
801031f4:	69 fa bc 00 00 00    	imul   $0xbc,%edx,%edi
        ncpu++;
801031fa:	83 c2 01             	add    $0x1,%edx
801031fd:	89 15 5c 28 11 80    	mov    %edx,0x8011285c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103203:	88 9f a0 27 11 80    	mov    %bl,-0x7feed860(%edi)
80103209:	eb bf                	jmp    801031ca <mpinit+0x14a>
8010320b:	90                   	nop
8010320c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    lapic = 0;
    ioapicid = 0;
    return;
  }

  if(mp->imcrp){
80103210:	80 7e 0c 00          	cmpb   $0x0,0xc(%esi)
80103214:	74 99                	je     801031af <mpinit+0x12f>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103216:	ba 22 00 00 00       	mov    $0x22,%edx
8010321b:	b8 70 00 00 00       	mov    $0x70,%eax
80103220:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80103221:	ba 23 00 00 00       	mov    $0x23,%edx
80103226:	ec                   	in     (%dx),%al
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103227:	83 c8 01             	or     $0x1,%eax
8010322a:	ee                   	out    %al,(%dx)
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
8010322b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010322e:	5b                   	pop    %ebx
8010322f:	5e                   	pop    %esi
80103230:	5f                   	pop    %edi
80103231:	5d                   	pop    %ebp
80103232:	c3                   	ret    
80103233:	90                   	nop
80103234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
80103238:	ba 00 00 01 00       	mov    $0x10000,%edx
8010323d:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80103242:	e8 b9 fd ff ff       	call   80103000 <mpsearch1>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103247:	85 c0                	test   %eax,%eax
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
80103249:	89 c6                	mov    %eax,%esi
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
8010324b:	0f 85 81 fe ff ff    	jne    801030d2 <mpinit+0x52>
80103251:	e9 59 ff ff ff       	jmp    801031af <mpinit+0x12f>
80103256:	66 90                	xchg   %ax,%ax
80103258:	66 90                	xchg   %ax,%ax
8010325a:	66 90                	xchg   %ax,%ax
8010325c:	66 90                	xchg   %ax,%ax
8010325e:	66 90                	xchg   %ax,%ax

80103260 <picenable>:
80103260:	55                   	push   %ebp
80103261:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
80103266:	ba 21 00 00 00       	mov    $0x21,%edx
8010326b:	89 e5                	mov    %esp,%ebp
8010326d:	8b 4d 08             	mov    0x8(%ebp),%ecx
80103270:	d3 c0                	rol    %cl,%eax
80103272:	66 23 05 00 a0 10 80 	and    0x8010a000,%ax
80103279:	66 a3 00 a0 10 80    	mov    %ax,0x8010a000
8010327f:	ee                   	out    %al,(%dx)
80103280:	ba a1 00 00 00       	mov    $0xa1,%edx
80103285:	66 c1 e8 08          	shr    $0x8,%ax
80103289:	ee                   	out    %al,(%dx)
8010328a:	5d                   	pop    %ebp
8010328b:	c3                   	ret    
8010328c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103290 <picinit>:
80103290:	55                   	push   %ebp
80103291:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103296:	89 e5                	mov    %esp,%ebp
80103298:	57                   	push   %edi
80103299:	56                   	push   %esi
8010329a:	53                   	push   %ebx
8010329b:	bb 21 00 00 00       	mov    $0x21,%ebx
801032a0:	89 da                	mov    %ebx,%edx
801032a2:	ee                   	out    %al,(%dx)
801032a3:	b9 a1 00 00 00       	mov    $0xa1,%ecx
801032a8:	89 ca                	mov    %ecx,%edx
801032aa:	ee                   	out    %al,(%dx)
801032ab:	bf 11 00 00 00       	mov    $0x11,%edi
801032b0:	be 20 00 00 00       	mov    $0x20,%esi
801032b5:	89 f8                	mov    %edi,%eax
801032b7:	89 f2                	mov    %esi,%edx
801032b9:	ee                   	out    %al,(%dx)
801032ba:	b8 20 00 00 00       	mov    $0x20,%eax
801032bf:	89 da                	mov    %ebx,%edx
801032c1:	ee                   	out    %al,(%dx)
801032c2:	b8 04 00 00 00       	mov    $0x4,%eax
801032c7:	ee                   	out    %al,(%dx)
801032c8:	b8 03 00 00 00       	mov    $0x3,%eax
801032cd:	ee                   	out    %al,(%dx)
801032ce:	bb a0 00 00 00       	mov    $0xa0,%ebx
801032d3:	89 f8                	mov    %edi,%eax
801032d5:	89 da                	mov    %ebx,%edx
801032d7:	ee                   	out    %al,(%dx)
801032d8:	b8 28 00 00 00       	mov    $0x28,%eax
801032dd:	89 ca                	mov    %ecx,%edx
801032df:	ee                   	out    %al,(%dx)
801032e0:	b8 02 00 00 00       	mov    $0x2,%eax
801032e5:	ee                   	out    %al,(%dx)
801032e6:	b8 03 00 00 00       	mov    $0x3,%eax
801032eb:	ee                   	out    %al,(%dx)
801032ec:	bf 68 00 00 00       	mov    $0x68,%edi
801032f1:	89 f2                	mov    %esi,%edx
801032f3:	89 f8                	mov    %edi,%eax
801032f5:	ee                   	out    %al,(%dx)
801032f6:	b9 0a 00 00 00       	mov    $0xa,%ecx
801032fb:	89 c8                	mov    %ecx,%eax
801032fd:	ee                   	out    %al,(%dx)
801032fe:	89 f8                	mov    %edi,%eax
80103300:	89 da                	mov    %ebx,%edx
80103302:	ee                   	out    %al,(%dx)
80103303:	89 c8                	mov    %ecx,%eax
80103305:	ee                   	out    %al,(%dx)
80103306:	0f b7 05 00 a0 10 80 	movzwl 0x8010a000,%eax
8010330d:	66 83 f8 ff          	cmp    $0xffff,%ax
80103311:	74 10                	je     80103323 <picinit+0x93>
80103313:	ba 21 00 00 00       	mov    $0x21,%edx
80103318:	ee                   	out    %al,(%dx)
80103319:	ba a1 00 00 00       	mov    $0xa1,%edx
8010331e:	66 c1 e8 08          	shr    $0x8,%ax
80103322:	ee                   	out    %al,(%dx)
80103323:	5b                   	pop    %ebx
80103324:	5e                   	pop    %esi
80103325:	5f                   	pop    %edi
80103326:	5d                   	pop    %ebp
80103327:	c3                   	ret    
80103328:	66 90                	xchg   %ax,%ax
8010332a:	66 90                	xchg   %ax,%ax
8010332c:	66 90                	xchg   %ax,%ax
8010332e:	66 90                	xchg   %ax,%ax

80103330 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
80103330:	55                   	push   %ebp
80103331:	89 e5                	mov    %esp,%ebp
80103333:	57                   	push   %edi
80103334:	56                   	push   %esi
80103335:	53                   	push   %ebx
80103336:	83 ec 0c             	sub    $0xc,%esp
80103339:	8b 75 08             	mov    0x8(%ebp),%esi
8010333c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
8010333f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103345:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
8010334b:	e8 10 da ff ff       	call   80100d60 <filealloc>
80103350:	85 c0                	test   %eax,%eax
80103352:	89 06                	mov    %eax,(%esi)
80103354:	0f 84 a8 00 00 00    	je     80103402 <pipealloc+0xd2>
8010335a:	e8 01 da ff ff       	call   80100d60 <filealloc>
8010335f:	85 c0                	test   %eax,%eax
80103361:	89 03                	mov    %eax,(%ebx)
80103363:	0f 84 87 00 00 00    	je     801033f0 <pipealloc+0xc0>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
80103369:	e8 12 f1 ff ff       	call   80102480 <kalloc>
8010336e:	85 c0                	test   %eax,%eax
80103370:	89 c7                	mov    %eax,%edi
80103372:	0f 84 b0 00 00 00    	je     80103428 <pipealloc+0xf8>
    goto bad;
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
80103378:	83 ec 08             	sub    $0x8,%esp
  *f0 = *f1 = 0;
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
    goto bad;
  p->readopen = 1;
8010337b:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103382:	00 00 00 
  p->writeopen = 1;
80103385:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010338c:	00 00 00 
  p->nwrite = 0;
8010338f:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103396:	00 00 00 
  p->nread = 0;
80103399:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
801033a0:	00 00 00 
  initlock(&p->lock, "pipe");
801033a3:	68 28 78 10 80       	push   $0x80107828
801033a8:	50                   	push   %eax
801033a9:	e8 92 11 00 00       	call   80104540 <initlock>
  (*f0)->type = FD_PIPE;
801033ae:	8b 06                	mov    (%esi),%eax
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
801033b0:	83 c4 10             	add    $0x10,%esp
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
  (*f0)->type = FD_PIPE;
801033b3:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
801033b9:	8b 06                	mov    (%esi),%eax
801033bb:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
801033bf:	8b 06                	mov    (%esi),%eax
801033c1:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
801033c5:	8b 06                	mov    (%esi),%eax
801033c7:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
801033ca:	8b 03                	mov    (%ebx),%eax
801033cc:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
801033d2:	8b 03                	mov    (%ebx),%eax
801033d4:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
801033d8:	8b 03                	mov    (%ebx),%eax
801033da:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
801033de:	8b 03                	mov    (%ebx),%eax
801033e0:	89 78 0c             	mov    %edi,0xc(%eax)
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
801033e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
801033e6:	31 c0                	xor    %eax,%eax
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
801033e8:	5b                   	pop    %ebx
801033e9:	5e                   	pop    %esi
801033ea:	5f                   	pop    %edi
801033eb:	5d                   	pop    %ebp
801033ec:	c3                   	ret    
801033ed:	8d 76 00             	lea    0x0(%esi),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
801033f0:	8b 06                	mov    (%esi),%eax
801033f2:	85 c0                	test   %eax,%eax
801033f4:	74 1e                	je     80103414 <pipealloc+0xe4>
    fileclose(*f0);
801033f6:	83 ec 0c             	sub    $0xc,%esp
801033f9:	50                   	push   %eax
801033fa:	e8 21 da ff ff       	call   80100e20 <fileclose>
801033ff:	83 c4 10             	add    $0x10,%esp
  if(*f1)
80103402:	8b 03                	mov    (%ebx),%eax
80103404:	85 c0                	test   %eax,%eax
80103406:	74 0c                	je     80103414 <pipealloc+0xe4>
    fileclose(*f1);
80103408:	83 ec 0c             	sub    $0xc,%esp
8010340b:	50                   	push   %eax
8010340c:	e8 0f da ff ff       	call   80100e20 <fileclose>
80103411:	83 c4 10             	add    $0x10,%esp
  return -1;
}
80103414:	8d 65 f4             	lea    -0xc(%ebp),%esp
    kfree((char*)p);
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
80103417:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010341c:	5b                   	pop    %ebx
8010341d:	5e                   	pop    %esi
8010341e:	5f                   	pop    %edi
8010341f:	5d                   	pop    %ebp
80103420:	c3                   	ret    
80103421:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
80103428:	8b 06                	mov    (%esi),%eax
8010342a:	85 c0                	test   %eax,%eax
8010342c:	75 c8                	jne    801033f6 <pipealloc+0xc6>
8010342e:	eb d2                	jmp    80103402 <pipealloc+0xd2>

80103430 <pipeclose>:
  return -1;
}

void
pipeclose(struct pipe *p, int writable)
{
80103430:	55                   	push   %ebp
80103431:	89 e5                	mov    %esp,%ebp
80103433:	56                   	push   %esi
80103434:	53                   	push   %ebx
80103435:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103438:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
8010343b:	83 ec 0c             	sub    $0xc,%esp
8010343e:	53                   	push   %ebx
8010343f:	e8 1c 11 00 00       	call   80104560 <acquire>
  if(writable){
80103444:	83 c4 10             	add    $0x10,%esp
80103447:	85 f6                	test   %esi,%esi
80103449:	74 45                	je     80103490 <pipeclose+0x60>
    p->writeopen = 0;
    wakeup(&p->nread);
8010344b:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103451:	83 ec 0c             	sub    $0xc,%esp
void
pipeclose(struct pipe *p, int writable)
{
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
80103454:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010345b:	00 00 00 
    wakeup(&p->nread);
8010345e:	50                   	push   %eax
8010345f:	e8 2c 0c 00 00       	call   80104090 <wakeup>
80103464:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
80103467:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010346d:	85 d2                	test   %edx,%edx
8010346f:	75 0a                	jne    8010347b <pipeclose+0x4b>
80103471:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103477:	85 c0                	test   %eax,%eax
80103479:	74 35                	je     801034b0 <pipeclose+0x80>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
8010347b:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010347e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103481:	5b                   	pop    %ebx
80103482:	5e                   	pop    %esi
80103483:	5d                   	pop    %ebp
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
80103484:	e9 b7 12 00 00       	jmp    80104740 <release>
80103489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
80103490:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103496:	83 ec 0c             	sub    $0xc,%esp
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
80103499:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
801034a0:	00 00 00 
    wakeup(&p->nwrite);
801034a3:	50                   	push   %eax
801034a4:	e8 e7 0b 00 00       	call   80104090 <wakeup>
801034a9:	83 c4 10             	add    $0x10,%esp
801034ac:	eb b9                	jmp    80103467 <pipeclose+0x37>
801034ae:	66 90                	xchg   %ax,%ax
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
801034b0:	83 ec 0c             	sub    $0xc,%esp
801034b3:	53                   	push   %ebx
801034b4:	e8 87 12 00 00       	call   80104740 <release>
    kfree((char*)p);
801034b9:	89 5d 08             	mov    %ebx,0x8(%ebp)
801034bc:	83 c4 10             	add    $0x10,%esp
  } else
    release(&p->lock);
}
801034bf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801034c2:	5b                   	pop    %ebx
801034c3:	5e                   	pop    %esi
801034c4:	5d                   	pop    %ebp
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
801034c5:	e9 06 ee ff ff       	jmp    801022d0 <kfree>
801034ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801034d0 <pipewrite>:
}

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
801034d0:	55                   	push   %ebp
801034d1:	89 e5                	mov    %esp,%ebp
801034d3:	57                   	push   %edi
801034d4:	56                   	push   %esi
801034d5:	53                   	push   %ebx
801034d6:	83 ec 28             	sub    $0x28,%esp
801034d9:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i;

  acquire(&p->lock);
801034dc:	57                   	push   %edi
801034dd:	e8 7e 10 00 00       	call   80104560 <acquire>
  for(i = 0; i < n; i++){
801034e2:	8b 45 10             	mov    0x10(%ebp),%eax
801034e5:	83 c4 10             	add    $0x10,%esp
801034e8:	85 c0                	test   %eax,%eax
801034ea:	0f 8e c6 00 00 00    	jle    801035b6 <pipewrite+0xe6>
801034f0:	8b 45 0c             	mov    0xc(%ebp),%eax
801034f3:	8b 8f 38 02 00 00    	mov    0x238(%edi),%ecx
801034f9:	8d b7 34 02 00 00    	lea    0x234(%edi),%esi
801034ff:	8d 9f 38 02 00 00    	lea    0x238(%edi),%ebx
80103505:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103508:	03 45 10             	add    0x10(%ebp),%eax
8010350b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
8010350e:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
80103514:	8d 90 00 02 00 00    	lea    0x200(%eax),%edx
8010351a:	39 d1                	cmp    %edx,%ecx
8010351c:	0f 85 cf 00 00 00    	jne    801035f1 <pipewrite+0x121>
      if(p->readopen == 0 || proc->killed){
80103522:	8b 97 3c 02 00 00    	mov    0x23c(%edi),%edx
80103528:	85 d2                	test   %edx,%edx
8010352a:	0f 84 a8 00 00 00    	je     801035d8 <pipewrite+0x108>
80103530:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103537:	8b 42 24             	mov    0x24(%edx),%eax
8010353a:	85 c0                	test   %eax,%eax
8010353c:	74 25                	je     80103563 <pipewrite+0x93>
8010353e:	e9 95 00 00 00       	jmp    801035d8 <pipewrite+0x108>
80103543:	90                   	nop
80103544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103548:	8b 87 3c 02 00 00    	mov    0x23c(%edi),%eax
8010354e:	85 c0                	test   %eax,%eax
80103550:	0f 84 82 00 00 00    	je     801035d8 <pipewrite+0x108>
80103556:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010355c:	8b 40 24             	mov    0x24(%eax),%eax
8010355f:	85 c0                	test   %eax,%eax
80103561:	75 75                	jne    801035d8 <pipewrite+0x108>
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
80103563:	83 ec 0c             	sub    $0xc,%esp
80103566:	56                   	push   %esi
80103567:	e8 24 0b 00 00       	call   80104090 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
8010356c:	59                   	pop    %ecx
8010356d:	58                   	pop    %eax
8010356e:	57                   	push   %edi
8010356f:	53                   	push   %ebx
80103570:	e8 6b 09 00 00       	call   80103ee0 <sleep>
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103575:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
8010357b:	8b 97 38 02 00 00    	mov    0x238(%edi),%edx
80103581:	83 c4 10             	add    $0x10,%esp
80103584:	05 00 02 00 00       	add    $0x200,%eax
80103589:	39 c2                	cmp    %eax,%edx
8010358b:	74 bb                	je     80103548 <pipewrite+0x78>
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
8010358d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103590:	8d 4a 01             	lea    0x1(%edx),%ecx
80103593:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
80103597:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
8010359d:	89 8f 38 02 00 00    	mov    %ecx,0x238(%edi)
801035a3:	0f b6 00             	movzbl (%eax),%eax
801035a6:	88 44 17 34          	mov    %al,0x34(%edi,%edx,1)
801035aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
pipewrite(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
801035ad:	3b 45 e0             	cmp    -0x20(%ebp),%eax
801035b0:	0f 85 58 ff ff ff    	jne    8010350e <pipewrite+0x3e>
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
801035b6:	8d 97 34 02 00 00    	lea    0x234(%edi),%edx
801035bc:	83 ec 0c             	sub    $0xc,%esp
801035bf:	52                   	push   %edx
801035c0:	e8 cb 0a 00 00       	call   80104090 <wakeup>
  release(&p->lock);
801035c5:	89 3c 24             	mov    %edi,(%esp)
801035c8:	e8 73 11 00 00       	call   80104740 <release>
  return n;
801035cd:	83 c4 10             	add    $0x10,%esp
801035d0:	8b 45 10             	mov    0x10(%ebp),%eax
801035d3:	eb 14                	jmp    801035e9 <pipewrite+0x119>
801035d5:	8d 76 00             	lea    0x0(%esi),%esi

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || proc->killed){
        release(&p->lock);
801035d8:	83 ec 0c             	sub    $0xc,%esp
801035db:	57                   	push   %edi
801035dc:	e8 5f 11 00 00       	call   80104740 <release>
        return -1;
801035e1:	83 c4 10             	add    $0x10,%esp
801035e4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
801035e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801035ec:	5b                   	pop    %ebx
801035ed:	5e                   	pop    %esi
801035ee:	5f                   	pop    %edi
801035ef:	5d                   	pop    %ebp
801035f0:	c3                   	ret    
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801035f1:	89 ca                	mov    %ecx,%edx
801035f3:	eb 98                	jmp    8010358d <pipewrite+0xbd>
801035f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801035f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103600 <piperead>:
  return n;
}

int
piperead(struct pipe *p, char *addr, int n)
{
80103600:	55                   	push   %ebp
80103601:	89 e5                	mov    %esp,%ebp
80103603:	57                   	push   %edi
80103604:	56                   	push   %esi
80103605:	53                   	push   %ebx
80103606:	83 ec 18             	sub    $0x18,%esp
80103609:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010360c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
8010360f:	53                   	push   %ebx
80103610:	e8 4b 0f 00 00       	call   80104560 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103615:	83 c4 10             	add    $0x10,%esp
80103618:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010361e:	39 83 38 02 00 00    	cmp    %eax,0x238(%ebx)
80103624:	75 6a                	jne    80103690 <piperead+0x90>
80103626:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
8010362c:	85 f6                	test   %esi,%esi
8010362e:	0f 84 cc 00 00 00    	je     80103700 <piperead+0x100>
80103634:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
8010363a:	eb 2d                	jmp    80103669 <piperead+0x69>
8010363c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(proc->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
80103640:	83 ec 08             	sub    $0x8,%esp
80103643:	53                   	push   %ebx
80103644:	56                   	push   %esi
80103645:	e8 96 08 00 00       	call   80103ee0 <sleep>
piperead(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
8010364a:	83 c4 10             	add    $0x10,%esp
8010364d:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
80103653:	39 83 34 02 00 00    	cmp    %eax,0x234(%ebx)
80103659:	75 35                	jne    80103690 <piperead+0x90>
8010365b:	8b 93 40 02 00 00    	mov    0x240(%ebx),%edx
80103661:	85 d2                	test   %edx,%edx
80103663:	0f 84 97 00 00 00    	je     80103700 <piperead+0x100>
    if(proc->killed){
80103669:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103670:	8b 4a 24             	mov    0x24(%edx),%ecx
80103673:	85 c9                	test   %ecx,%ecx
80103675:	74 c9                	je     80103640 <piperead+0x40>
      release(&p->lock);
80103677:	83 ec 0c             	sub    $0xc,%esp
8010367a:	53                   	push   %ebx
8010367b:	e8 c0 10 00 00       	call   80104740 <release>
      return -1;
80103680:	83 c4 10             	add    $0x10,%esp
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
80103683:	8d 65 f4             	lea    -0xc(%ebp),%esp

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
    if(proc->killed){
      release(&p->lock);
      return -1;
80103686:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
8010368b:	5b                   	pop    %ebx
8010368c:	5e                   	pop    %esi
8010368d:	5f                   	pop    %edi
8010368e:	5d                   	pop    %ebp
8010368f:	c3                   	ret    
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103690:	8b 45 10             	mov    0x10(%ebp),%eax
80103693:	85 c0                	test   %eax,%eax
80103695:	7e 69                	jle    80103700 <piperead+0x100>
    if(p->nread == p->nwrite)
80103697:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
8010369d:	31 c9                	xor    %ecx,%ecx
8010369f:	eb 15                	jmp    801036b6 <piperead+0xb6>
801036a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801036a8:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
801036ae:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
801036b4:	74 5a                	je     80103710 <piperead+0x110>
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
801036b6:	8d 72 01             	lea    0x1(%edx),%esi
801036b9:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
801036bf:	89 b3 34 02 00 00    	mov    %esi,0x234(%ebx)
801036c5:	0f b6 54 13 34       	movzbl 0x34(%ebx,%edx,1),%edx
801036ca:	88 14 0f             	mov    %dl,(%edi,%ecx,1)
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
801036cd:	83 c1 01             	add    $0x1,%ecx
801036d0:	39 4d 10             	cmp    %ecx,0x10(%ebp)
801036d3:	75 d3                	jne    801036a8 <piperead+0xa8>
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
801036d5:	8d 93 38 02 00 00    	lea    0x238(%ebx),%edx
801036db:	83 ec 0c             	sub    $0xc,%esp
801036de:	52                   	push   %edx
801036df:	e8 ac 09 00 00       	call   80104090 <wakeup>
  release(&p->lock);
801036e4:	89 1c 24             	mov    %ebx,(%esp)
801036e7:	e8 54 10 00 00       	call   80104740 <release>
  return i;
801036ec:	8b 45 10             	mov    0x10(%ebp),%eax
801036ef:	83 c4 10             	add    $0x10,%esp
}
801036f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801036f5:	5b                   	pop    %ebx
801036f6:	5e                   	pop    %esi
801036f7:	5f                   	pop    %edi
801036f8:	5d                   	pop    %ebp
801036f9:	c3                   	ret    
801036fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103700:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
80103707:	eb cc                	jmp    801036d5 <piperead+0xd5>
80103709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103710:	89 4d 10             	mov    %ecx,0x10(%ebp)
80103713:	eb c0                	jmp    801036d5 <piperead+0xd5>
80103715:	66 90                	xchg   %ax,%ax
80103717:	66 90                	xchg   %ax,%ax
80103719:	66 90                	xchg   %ax,%ax
8010371b:	66 90                	xchg   %ax,%ax
8010371d:	66 90                	xchg   %ax,%ax
8010371f:	90                   	nop

80103720 <allocproc>:
// If found, change state to EMBRYO and initializesrc refspec master matches more than one.
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103720:	55                   	push   %ebp
80103721:	89 e5                	mov    %esp,%ebp
80103723:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103724:	bb 94 28 11 80       	mov    $0x80112894,%ebx
// If found, change state to EMBRYO and initializesrc refspec master matches more than one.
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103729:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
8010372c:	68 60 28 11 80       	push   $0x80112860
80103731:	e8 2a 0e 00 00       	call   80104560 <acquire>
80103736:	83 c4 10             	add    $0x10,%esp
80103739:	eb 13                	jmp    8010374e <allocproc+0x2e>
8010373b:	90                   	nop
8010373c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103740:	81 c3 94 00 00 00    	add    $0x94,%ebx
80103746:	81 fb 94 4d 11 80    	cmp    $0x80114d94,%ebx
8010374c:	74 7a                	je     801037c8 <allocproc+0xa8>
    if(p->state == UNUSED)
8010374e:	8b 43 0c             	mov    0xc(%ebx),%eax
80103751:	85 c0                	test   %eax,%eax
80103753:	75 eb                	jne    80103740 <allocproc+0x20>
  return 0;

found:
  //p->tickets = 10;
  p->state = EMBRYO;
  p->pid = nextpid++;
80103755:	a1 08 a0 10 80       	mov    0x8010a008,%eax

  release(&ptable.lock);
8010375a:	83 ec 0c             	sub    $0xc,%esp
  release(&ptable.lock);
  return 0;

found:
  //p->tickets = 10;
  p->state = EMBRYO;
8010375d:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;

  release(&ptable.lock);
80103764:	68 60 28 11 80       	push   $0x80112860
  return 0;

found:
  //p->tickets = 10;
  p->state = EMBRYO;
  p->pid = nextpid++;
80103769:	8d 50 01             	lea    0x1(%eax),%edx
8010376c:	89 43 10             	mov    %eax,0x10(%ebx)
8010376f:	89 15 08 a0 10 80    	mov    %edx,0x8010a008

  release(&ptable.lock);
80103775:	e8 c6 0f 00 00       	call   80104740 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
8010377a:	e8 01 ed ff ff       	call   80102480 <kalloc>
8010377f:	83 c4 10             	add    $0x10,%esp
80103782:	85 c0                	test   %eax,%eax
80103784:	89 43 08             	mov    %eax,0x8(%ebx)
80103787:	74 56                	je     801037df <allocproc+0xbf>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103789:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
8010378f:	83 ec 04             	sub    $0x4,%esp
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
80103792:	05 9c 0f 00 00       	add    $0xf9c,%eax
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103797:	89 53 18             	mov    %edx,0x18(%ebx)
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;
8010379a:	c7 40 14 2e 5a 10 80 	movl   $0x80105a2e,0x14(%eax)

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
801037a1:	6a 14                	push   $0x14
801037a3:	6a 00                	push   $0x0
801037a5:	50                   	push   %eax
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
801037a6:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
801037a9:	e8 e2 0f 00 00       	call   80104790 <memset>
  p->context->eip = (uint)forkret;
801037ae:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
801037b1:	83 c4 10             	add    $0x10,%esp
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;
801037b4:	c7 40 10 f0 37 10 80 	movl   $0x801037f0,0x10(%eax)

  return p;
801037bb:	89 d8                	mov    %ebx,%eax
}
801037bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801037c0:	c9                   	leave  
801037c1:	c3                   	ret    
801037c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
801037c8:	83 ec 0c             	sub    $0xc,%esp
801037cb:	68 60 28 11 80       	push   $0x80112860
801037d0:	e8 6b 0f 00 00       	call   80104740 <release>
  return 0;
801037d5:	83 c4 10             	add    $0x10,%esp
801037d8:	31 c0                	xor    %eax,%eax
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}
801037da:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801037dd:	c9                   	leave  
801037de:	c3                   	ret    

  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
801037df:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
801037e6:	eb d5                	jmp    801037bd <allocproc+0x9d>
801037e8:	90                   	nop
801037e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801037f0 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
801037f0:	55                   	push   %ebp
801037f1:	89 e5                	mov    %esp,%ebp
801037f3:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
801037f6:	68 60 28 11 80       	push   $0x80112860
801037fb:	e8 40 0f 00 00       	call   80104740 <release>

  if (first) {
80103800:	a1 04 a0 10 80       	mov    0x8010a004,%eax
80103805:	83 c4 10             	add    $0x10,%esp
80103808:	85 c0                	test   %eax,%eax
8010380a:	75 04                	jne    80103810 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010380c:	c9                   	leave  
8010380d:	c3                   	ret    
8010380e:	66 90                	xchg   %ax,%ax
  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
80103810:	83 ec 0c             	sub    $0xc,%esp

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
80103813:	c7 05 04 a0 10 80 00 	movl   $0x0,0x8010a004
8010381a:	00 00 00 
    iinit(ROOTDEV);
8010381d:	6a 01                	push   $0x1
8010381f:	e8 3c dc ff ff       	call   80101460 <iinit>
    initlog(ROOTDEV);
80103824:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010382b:	e8 c0 f2 ff ff       	call   80102af0 <initlog>
80103830:	83 c4 10             	add    $0x10,%esp
  }

  // Return to "caller", actually trapret (see allocproc).
}
80103833:	c9                   	leave  
80103834:	c3                   	ret    
80103835:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103840 <pinit>:

static void wakeup1(void *chan);

void
pinit(void)
{
80103840:	55                   	push   %ebp
80103841:	89 e5                	mov    %esp,%ebp
80103843:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
80103846:	68 2d 78 10 80       	push   $0x8010782d
8010384b:	68 60 28 11 80       	push   $0x80112860
80103850:	e8 eb 0c 00 00       	call   80104540 <initlock>
}
80103855:	83 c4 10             	add    $0x10,%esp
80103858:	c9                   	leave  
80103859:	c3                   	ret    
8010385a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103860 <userinit>:

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
80103860:	55                   	push   %ebp
80103861:	89 e5                	mov    %esp,%ebp
80103863:	53                   	push   %ebx
80103864:	83 ec 04             	sub    $0x4,%esp
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
80103867:	e8 b4 fe ff ff       	call   80103720 <allocproc>
8010386c:	89 c3                	mov    %eax,%ebx
  
  initproc = p;
8010386e:	a3 bc a5 10 80       	mov    %eax,0x8010a5bc
  if((p->pgdir = setupkvm()) == 0)
80103873:	e8 e8 33 00 00       	call   80106c60 <setupkvm>
80103878:	85 c0                	test   %eax,%eax
8010387a:	89 43 04             	mov    %eax,0x4(%ebx)
8010387d:	0f 84 bd 00 00 00    	je     80103940 <userinit+0xe0>
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103883:	83 ec 04             	sub    $0x4,%esp
80103886:	68 2c 00 00 00       	push   $0x2c
8010388b:	68 60 a4 10 80       	push   $0x8010a460
80103890:	50                   	push   %eax
80103891:	e8 4a 35 00 00       	call   80106de0 <inituvm>
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
80103896:	83 c4 0c             	add    $0xc,%esp
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
80103899:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
8010389f:	6a 4c                	push   $0x4c
801038a1:	6a 00                	push   $0x0
801038a3:	ff 73 18             	pushl  0x18(%ebx)
801038a6:	e8 e5 0e 00 00       	call   80104790 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801038ab:	8b 43 18             	mov    0x18(%ebx),%eax
801038ae:	ba 23 00 00 00       	mov    $0x23,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801038b3:	b9 2b 00 00 00       	mov    $0x2b,%ecx
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0;  // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
801038b8:	83 c4 0c             	add    $0xc,%esp
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801038bb:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801038bf:	8b 43 18             	mov    0x18(%ebx),%eax
801038c2:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
801038c6:	8b 43 18             	mov    0x18(%ebx),%eax
801038c9:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801038cd:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
801038d1:	8b 43 18             	mov    0x18(%ebx),%eax
801038d4:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801038d8:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
801038dc:	8b 43 18             	mov    0x18(%ebx),%eax
801038df:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
801038e6:	8b 43 18             	mov    0x18(%ebx),%eax
801038e9:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
801038f0:	8b 43 18             	mov    0x18(%ebx),%eax
801038f3:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

  safestrcpy(p->name, "initcode", sizeof(p->name));
801038fa:	8d 43 6c             	lea    0x6c(%ebx),%eax
801038fd:	6a 10                	push   $0x10
801038ff:	68 4d 78 10 80       	push   $0x8010784d
80103904:	50                   	push   %eax
80103905:	e8 86 10 00 00       	call   80104990 <safestrcpy>
  p->cwd = namei("/");
8010390a:	c7 04 24 56 78 10 80 	movl   $0x80107856,(%esp)
80103911:	e8 7a e5 ff ff       	call   80101e90 <namei>
80103916:	89 43 68             	mov    %eax,0x68(%ebx)

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);
80103919:	c7 04 24 60 28 11 80 	movl   $0x80112860,(%esp)
80103920:	e8 3b 0c 00 00       	call   80104560 <acquire>

  p->state = RUNNABLE;
80103925:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
8010392c:	c7 04 24 60 28 11 80 	movl   $0x80112860,(%esp)
80103933:	e8 08 0e 00 00       	call   80104740 <release>
}
80103938:	83 c4 10             	add    $0x10,%esp
8010393b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010393e:	c9                   	leave  
8010393f:	c3                   	ret    

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
80103940:	83 ec 0c             	sub    $0xc,%esp
80103943:	68 34 78 10 80       	push   $0x80107834
80103948:	e8 23 ca ff ff       	call   80100370 <panic>
8010394d:	8d 76 00             	lea    0x0(%esi),%esi

80103950 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
80103950:	55                   	push   %ebp
80103951:	89 e5                	mov    %esp,%ebp
80103953:	83 ec 08             	sub    $0x8,%esp
  uint sz;

  sz = proc->sz;
80103956:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
8010395d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint sz;

  sz = proc->sz;
80103960:	8b 02                	mov    (%edx),%eax
  if(n > 0){
80103962:	83 f9 00             	cmp    $0x0,%ecx
80103965:	7e 39                	jle    801039a0 <growproc+0x50>
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
80103967:	83 ec 04             	sub    $0x4,%esp
8010396a:	01 c1                	add    %eax,%ecx
8010396c:	51                   	push   %ecx
8010396d:	50                   	push   %eax
8010396e:	ff 72 04             	pushl  0x4(%edx)
80103971:	e8 aa 35 00 00       	call   80106f20 <allocuvm>
80103976:	83 c4 10             	add    $0x10,%esp
80103979:	85 c0                	test   %eax,%eax
8010397b:	74 3b                	je     801039b8 <growproc+0x68>
8010397d:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  proc->sz = sz;
80103984:	89 02                	mov    %eax,(%edx)
  switchuvm(proc);
80103986:	83 ec 0c             	sub    $0xc,%esp
80103989:	65 ff 35 04 00 00 00 	pushl  %gs:0x4
80103990:	e8 7b 33 00 00       	call   80106d10 <switchuvm>
  return 0;
80103995:	83 c4 10             	add    $0x10,%esp
80103998:	31 c0                	xor    %eax,%eax
}
8010399a:	c9                   	leave  
8010399b:	c3                   	ret    
8010399c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  sz = proc->sz;
  if(n > 0){
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
801039a0:	74 e2                	je     80103984 <growproc+0x34>
    if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
801039a2:	83 ec 04             	sub    $0x4,%esp
801039a5:	01 c1                	add    %eax,%ecx
801039a7:	51                   	push   %ecx
801039a8:	50                   	push   %eax
801039a9:	ff 72 04             	pushl  0x4(%edx)
801039ac:	e8 6f 36 00 00       	call   80107020 <deallocuvm>
801039b1:	83 c4 10             	add    $0x10,%esp
801039b4:	85 c0                	test   %eax,%eax
801039b6:	75 c5                	jne    8010397d <growproc+0x2d>
  uint sz;

  sz = proc->sz;
  if(n > 0){
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
801039b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return -1;
  }
  proc->sz = sz;
  switchuvm(proc);
  return 0;
}
801039bd:	c9                   	leave  
801039be:	c3                   	ret    
801039bf:	90                   	nop

801039c0 <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(int tickets)
{
801039c0:	55                   	push   %ebp
801039c1:	89 e5                	mov    %esp,%ebp
801039c3:	57                   	push   %edi
801039c4:	56                   	push   %esi
801039c5:	53                   	push   %ebx
801039c6:	83 ec 1c             	sub    $0x1c,%esp
801039c9:	8b 55 08             	mov    0x8(%ebp),%edx
  int i, pid;
  struct proc *np;
  tickets = tickets < 0 ? -tickets : tickets;
801039cc:	89 d0                	mov    %edx,%eax
801039ce:	c1 f8 1f             	sar    $0x1f,%eax
801039d1:	31 c2                	xor    %eax,%edx
801039d3:	29 c2                	sub    %eax,%edx
801039d5:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  // Allocate process.
  if((np = allocproc()) == 0){
801039d8:	e8 43 fd ff ff       	call   80103720 <allocproc>
801039dd:	85 c0                	test   %eax,%eax
801039df:	0f 84 13 01 00 00    	je     80103af8 <fork+0x138>
801039e5:	89 c3                	mov    %eax,%ebx
    return -1;
  }

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
801039e7:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801039ed:	83 ec 08             	sub    $0x8,%esp
801039f0:	ff 30                	pushl  (%eax)
801039f2:	ff 70 04             	pushl  0x4(%eax)
801039f5:	e8 06 37 00 00       	call   80107100 <copyuvm>
801039fa:	83 c4 10             	add    $0x10,%esp
801039fd:	85 c0                	test   %eax,%eax
801039ff:	89 43 04             	mov    %eax,0x4(%ebx)
80103a02:	0f 84 f7 00 00 00    	je     80103aff <fork+0x13f>
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = proc->sz;
80103a08:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  np->parent = proc;
  *np->tf = *proc->tf;
80103a0e:	8b 7b 18             	mov    0x18(%ebx),%edi
80103a11:	b9 13 00 00 00       	mov    $0x13,%ecx
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = proc->sz;
80103a16:	8b 00                	mov    (%eax),%eax
80103a18:	89 03                	mov    %eax,(%ebx)
  np->parent = proc;
80103a1a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103a20:	89 43 14             	mov    %eax,0x14(%ebx)
  *np->tf = *proc->tf;
80103a23:	8b 70 18             	mov    0x18(%eax),%esi
80103a26:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103a28:	31 f6                	xor    %esi,%esi
  np->sz = proc->sz;
  np->parent = proc;
  *np->tf = *proc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
80103a2a:	8b 43 18             	mov    0x18(%ebx),%eax
80103a2d:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103a34:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103a3b:	90                   	nop
80103a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(i = 0; i < NOFILE; i++)
    if(proc->ofile[i])
80103a40:	8b 44 b2 28          	mov    0x28(%edx,%esi,4),%eax
80103a44:	85 c0                	test   %eax,%eax
80103a46:	74 17                	je     80103a5f <fork+0x9f>
      np->ofile[i] = filedup(proc->ofile[i]);
80103a48:	83 ec 0c             	sub    $0xc,%esp
80103a4b:	50                   	push   %eax
80103a4c:	e8 7f d3 ff ff       	call   80100dd0 <filedup>
80103a51:	89 44 b3 28          	mov    %eax,0x28(%ebx,%esi,4)
80103a55:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103a5c:	83 c4 10             	add    $0x10,%esp
  *np->tf = *proc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103a5f:	83 c6 01             	add    $0x1,%esi
80103a62:	83 fe 10             	cmp    $0x10,%esi
80103a65:	75 d9                	jne    80103a40 <fork+0x80>
    if(proc->ofile[i])
      np->ofile[i] = filedup(proc->ofile[i]);
  np->cwd = idup(proc->cwd);
80103a67:	83 ec 0c             	sub    $0xc,%esp
80103a6a:	ff 72 68             	pushl  0x68(%edx)
80103a6d:	e8 be db ff ff       	call   80101630 <idup>
80103a72:	89 43 68             	mov    %eax,0x68(%ebx)

  safestrcpy(np->name, proc->name, sizeof(proc->name));
80103a75:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103a7b:	83 c4 0c             	add    $0xc,%esp
80103a7e:	6a 10                	push   $0x10
80103a80:	83 c0 6c             	add    $0x6c,%eax
80103a83:	50                   	push   %eax
80103a84:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103a87:	50                   	push   %eax
80103a88:	e8 03 0f 00 00       	call   80104990 <safestrcpy>

  pid = np->pid;
80103a8d:	8b 73 10             	mov    0x10(%ebx),%esi

  acquire(&ptable.lock);
80103a90:	c7 04 24 60 28 11 80 	movl   $0x80112860,(%esp)
80103a97:	e8 c4 0a 00 00       	call   80104560 <acquire>

  np->state = RUNNABLE;
  np->tickets = tickets;
80103a9c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx

  pid = np->pid;

  acquire(&ptable.lock);

  np->state = RUNNABLE;
80103a9f:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  np->tickets = tickets;
  np->initial_stride = 0;
80103aa6:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
80103aad:	00 00 00 
80103ab0:	c7 83 90 00 00 00 00 	movl   $0x0,0x90(%ebx)
80103ab7:	00 00 00 
  pid = np->pid;

  acquire(&ptable.lock);

  np->state = RUNNABLE;
  np->tickets = tickets;
80103aba:	89 c8                	mov    %ecx,%eax
80103abc:	89 4b 7c             	mov    %ecx,0x7c(%ebx)
80103abf:	c1 f8 1f             	sar    $0x1f,%eax
80103ac2:	89 83 80 00 00 00    	mov    %eax,0x80(%ebx)
  np->initial_stride = 0;
  np->stride = CONST_STRIDE/tickets;
80103ac8:	b8 10 27 00 00       	mov    $0x2710,%eax
80103acd:	99                   	cltd   
80103ace:	f7 f9                	idiv   %ecx
80103ad0:	89 83 84 00 00 00    	mov    %eax,0x84(%ebx)
80103ad6:	c1 f8 1f             	sar    $0x1f,%eax
80103ad9:	89 83 88 00 00 00    	mov    %eax,0x88(%ebx)
  release(&ptable.lock);
80103adf:	c7 04 24 60 28 11 80 	movl   $0x80112860,(%esp)
80103ae6:	e8 55 0c 00 00       	call   80104740 <release>

  return pid;
80103aeb:	83 c4 10             	add    $0x10,%esp
80103aee:	89 f0                	mov    %esi,%eax
}
80103af0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103af3:	5b                   	pop    %ebx
80103af4:	5e                   	pop    %esi
80103af5:	5f                   	pop    %edi
80103af6:	5d                   	pop    %ebp
80103af7:	c3                   	ret    
  int i, pid;
  struct proc *np;
  tickets = tickets < 0 ? -tickets : tickets;
  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
80103af8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103afd:	eb f1                	jmp    80103af0 <fork+0x130>
  }

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
    kfree(np->kstack);
80103aff:	83 ec 0c             	sub    $0xc,%esp
80103b02:	ff 73 08             	pushl  0x8(%ebx)
80103b05:	e8 c6 e7 ff ff       	call   801022d0 <kfree>
    np->kstack = 0;
80103b0a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103b11:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103b18:	83 c4 10             	add    $0x10,%esp
80103b1b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103b20:	eb ce                	jmp    80103af0 <fork+0x130>
80103b22:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103b30 <random_number>:
  }
}

int 
random_number(int seed)
{
80103b30:	55                   	push   %ebp
    return (unsigned long)(seed * 4827110398420394UL) % 2147483647UL;
80103b31:	ba 03 00 00 00       	mov    $0x3,%edx
  }
}

int 
random_number(int seed)
{
80103b36:	89 e5                	mov    %esp,%ebp
    return (unsigned long)(seed * 4827110398420394UL) % 2147483647UL;
80103b38:	69 4d 08 aa e5 96 38 	imul   $0x3896e5aa,0x8(%ebp),%ecx
}
80103b3f:	5d                   	pop    %ebp
}

int 
random_number(int seed)
{
    return (unsigned long)(seed * 4827110398420394UL) % 2147483647UL;
80103b40:	89 c8                	mov    %ecx,%eax
80103b42:	f7 e2                	mul    %edx
80103b44:	89 c8                	mov    %ecx,%eax
80103b46:	29 d0                	sub    %edx,%eax
80103b48:	d1 e8                	shr    %eax
80103b4a:	01 d0                	add    %edx,%eax
80103b4c:	c1 e8 1e             	shr    $0x1e,%eax
80103b4f:	89 c2                	mov    %eax,%edx
80103b51:	c1 e2 1f             	shl    $0x1f,%edx
80103b54:	29 c2                	sub    %eax,%edx
80103b56:	29 d1                	sub    %edx,%ecx
80103b58:	89 c8                	mov    %ecx,%eax
}
80103b5a:	c3                   	ret    
80103b5b:	90                   	nop
80103b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103b60 <get_tickets_number>:

int
get_tickets_number(void)
{
80103b60:	55                   	push   %ebp
  struct proc *p;
  int sum = 0;
80103b61:	31 c0                	xor    %eax,%eax
  
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b63:	ba 94 28 11 80       	mov    $0x80112894,%edx
    return (unsigned long)(seed * 4827110398420394UL) % 2147483647UL;
}

int
get_tickets_number(void)
{
80103b68:	89 e5                	mov    %esp,%ebp
80103b6a:	eb 12                	jmp    80103b7e <get_tickets_number+0x1e>
80103b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct proc *p;
  int sum = 0;
  
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b70:	81 c2 94 00 00 00    	add    $0x94,%edx
80103b76:	81 fa 94 4d 11 80    	cmp    $0x80114d94,%edx
80103b7c:	74 17                	je     80103b95 <get_tickets_number+0x35>
    if(p->state == RUNNABLE)
80103b7e:	83 7a 0c 03          	cmpl   $0x3,0xc(%edx)
80103b82:	75 ec                	jne    80103b70 <get_tickets_number+0x10>
      sum += p->tickets;
80103b84:	03 42 7c             	add    0x7c(%edx),%eax
get_tickets_number(void)
{
  struct proc *p;
  int sum = 0;
  
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b87:	81 c2 94 00 00 00    	add    $0x94,%edx
80103b8d:	81 fa 94 4d 11 80    	cmp    $0x80114d94,%edx
80103b93:	75 e9                	jne    80103b7e <get_tickets_number+0x1e>
    if(p->state == RUNNABLE)
      sum += p->tickets;

  return sum;
}
80103b95:	5d                   	pop    %ebp
80103b96:	c3                   	ret    
80103b97:	89 f6                	mov    %esi,%esi
80103b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103ba0 <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
80103ba0:	55                   	push   %ebp
80103ba1:	89 e5                	mov    %esp,%ebp
80103ba3:	57                   	push   %edi
80103ba4:	56                   	push   %esi
80103ba5:	53                   	push   %ebx
80103ba6:	83 ec 1c             	sub    $0x1c,%esp
80103ba9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
}

static inline void
sti(void)
{
  asm volatile("sti");
80103bb0:	fb                   	sti    
  struct proc *winner;
  int lowest;

  for(;;){
    sti(); // Enable interrupts on this processor.
    acquire(&ptable.lock); 
80103bb1:	83 ec 0c             	sub    $0xc,%esp
    lowest = -1;
80103bb4:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  struct proc *winner;
  int lowest;

  for(;;){
    sti(); // Enable interrupts on this processor.
    acquire(&ptable.lock); 
80103bb9:	68 60 28 11 80       	push   $0x80112860
80103bbe:	e8 9d 09 00 00       	call   80104560 <acquire>
80103bc3:	83 c4 10             	add    $0x10,%esp
    lowest = -1;
    winner = ptable.proc;
80103bc6:	c7 45 e4 94 28 11 80 	movl   $0x80112894,-0x1c(%ebp)
    
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103bcd:	b8 94 28 11 80       	mov    $0x80112894,%eax
80103bd2:	eb 10                	jmp    80103be4 <scheduler+0x44>
80103bd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103bd8:	05 94 00 00 00       	add    $0x94,%eax
80103bdd:	3d 94 4d 11 80       	cmp    $0x80114d94,%eax
80103be2:	74 5c                	je     80103c40 <scheduler+0xa0>
      //skip if procces is not runnable
      if(p->state != RUNNABLE)
80103be4:	83 78 0c 03          	cmpl   $0x3,0xc(%eax)
80103be8:	75 ee                	jne    80103bd8 <scheduler+0x38>
        continue;
      
      if(lowest == -1 || p->initial_stride < lowest){
80103bea:	83 ff ff             	cmp    $0xffffffff,%edi
80103bed:	8b 90 8c 00 00 00    	mov    0x8c(%eax),%edx
80103bf3:	8b b0 90 00 00 00    	mov    0x90(%eax),%esi
80103bf9:	74 15                	je     80103c10 <scheduler+0x70>
80103bfb:	89 fb                	mov    %edi,%ebx
80103bfd:	89 f9                	mov    %edi,%ecx
80103bff:	c1 fb 1f             	sar    $0x1f,%ebx
80103c02:	39 de                	cmp    %ebx,%esi
80103c04:	7f 16                	jg     80103c1c <scheduler+0x7c>
80103c06:	7c 08                	jl     80103c10 <scheduler+0x70>
80103c08:	39 fa                	cmp    %edi,%edx
80103c0a:	73 10                	jae    80103c1c <scheduler+0x7c>
80103c0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103c10:	89 d3                	mov    %edx,%ebx
        lowest = p->initial_stride;
80103c12:	89 d7                	mov    %edx,%edi
80103c14:	89 d1                	mov    %edx,%ecx
80103c16:	c1 fb 1f             	sar    $0x1f,%ebx
80103c19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        winner = p;
      }

      if(p->initial_stride == lowest)
80103c1c:	31 de                	xor    %ebx,%esi
80103c1e:	31 d1                	xor    %edx,%ecx
80103c20:	09 ce                	or     %ecx,%esi
80103c22:	75 b4                	jne    80103bd8 <scheduler+0x38>
80103c24:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103c27:	8b 50 10             	mov    0x10(%eax),%edx
80103c2a:	39 53 10             	cmp    %edx,0x10(%ebx)
80103c2d:	0f 4d d8             	cmovge %eax,%ebx
    sti(); // Enable interrupts on this processor.
    acquire(&ptable.lock); 
    lowest = -1;
    winner = ptable.proc;
    
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c30:	05 94 00 00 00       	add    $0x94,%eax
80103c35:	3d 94 4d 11 80       	cmp    $0x80114d94,%eax
80103c3a:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80103c3d:	75 a5                	jne    80103be4 <scheduler+0x44>
80103c3f:	90                   	nop

      if(p->initial_stride == lowest)
        winner = winner->pid < p->pid ? winner : p;

    }  
    proc = winner;
80103c40:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    switchuvm(winner);
80103c43:	83 ec 0c             	sub    $0xc,%esp
80103c46:	53                   	push   %ebx

      if(p->initial_stride == lowest)
        winner = winner->pid < p->pid ? winner : p;

    }  
    proc = winner;
80103c47:	65 89 1d 04 00 00 00 	mov    %ebx,%gs:0x4
    switchuvm(winner);
80103c4e:	e8 bd 30 00 00       	call   80106d10 <switchuvm>
    winner->initial_stride += winner->stride;
80103c53:	8b 83 84 00 00 00    	mov    0x84(%ebx),%eax
80103c59:	01 83 8c 00 00 00    	add    %eax,0x8c(%ebx)
80103c5f:	8b 93 88 00 00 00    	mov    0x88(%ebx),%edx
80103c65:	11 93 90 00 00 00    	adc    %edx,0x90(%ebx)
    winner->state = RUNNING;
80103c6b:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
    swtch(&cpu->scheduler, winner->context);
80103c72:	58                   	pop    %eax
80103c73:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80103c79:	5a                   	pop    %edx
80103c7a:	ff 73 1c             	pushl  0x1c(%ebx)
80103c7d:	83 c0 04             	add    $0x4,%eax
80103c80:	50                   	push   %eax
80103c81:	e8 65 0d 00 00       	call   801049eb <swtch>
    proc = 0;
80103c86:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80103c8d:	00 00 00 00 
    switchkvm();
80103c91:	e8 5a 30 00 00       	call   80106cf0 <switchkvm>
    release(&ptable.lock);
80103c96:	c7 04 24 60 28 11 80 	movl   $0x80112860,(%esp)
80103c9d:	e8 9e 0a 00 00       	call   80104740 <release>
  }
80103ca2:	83 c4 10             	add    $0x10,%esp
80103ca5:	e9 06 ff ff ff       	jmp    80103bb0 <scheduler+0x10>
80103caa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103cb0 <sched>:
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
80103cb0:	55                   	push   %ebp
80103cb1:	89 e5                	mov    %esp,%ebp
80103cb3:	53                   	push   %ebx
80103cb4:	83 ec 10             	sub    $0x10,%esp
  int intena;

  if(!holding(&ptable.lock))
80103cb7:	68 60 28 11 80       	push   $0x80112860
80103cbc:	e8 cf 09 00 00       	call   80104690 <holding>
80103cc1:	83 c4 10             	add    $0x10,%esp
80103cc4:	85 c0                	test   %eax,%eax
80103cc6:	74 4c                	je     80103d14 <sched+0x64>
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
80103cc8:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80103ccf:	83 ba ac 00 00 00 01 	cmpl   $0x1,0xac(%edx)
80103cd6:	75 63                	jne    80103d3b <sched+0x8b>
    panic("sched locks");
  if(proc->state == RUNNING)
80103cd8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103cde:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80103ce2:	74 4a                	je     80103d2e <sched+0x7e>

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103ce4:	9c                   	pushf  
80103ce5:	59                   	pop    %ecx
    panic("sched running");
  if(readeflags()&FL_IF)
80103ce6:	80 e5 02             	and    $0x2,%ch
80103ce9:	75 36                	jne    80103d21 <sched+0x71>
    panic("sched interruptible");
  intena = cpu->intena;
  swtch(&proc->context, cpu->scheduler);
80103ceb:	83 ec 08             	sub    $0x8,%esp
80103cee:	83 c0 1c             	add    $0x1c,%eax
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = cpu->intena;
80103cf1:	8b 9a b0 00 00 00    	mov    0xb0(%edx),%ebx
  swtch(&proc->context, cpu->scheduler);
80103cf7:	ff 72 04             	pushl  0x4(%edx)
80103cfa:	50                   	push   %eax
80103cfb:	e8 eb 0c 00 00       	call   801049eb <swtch>
  cpu->intena = intena;
80103d00:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
}
80103d06:	83 c4 10             	add    $0x10,%esp
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = cpu->intena;
  swtch(&proc->context, cpu->scheduler);
  cpu->intena = intena;
80103d09:	89 98 b0 00 00 00    	mov    %ebx,0xb0(%eax)
}
80103d0f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103d12:	c9                   	leave  
80103d13:	c3                   	ret    
sched(void)
{
  int intena;

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
80103d14:	83 ec 0c             	sub    $0xc,%esp
80103d17:	68 58 78 10 80       	push   $0x80107858
80103d1c:	e8 4f c6 ff ff       	call   80100370 <panic>
  if(cpu->ncli != 1)
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
80103d21:	83 ec 0c             	sub    $0xc,%esp
80103d24:	68 84 78 10 80       	push   $0x80107884
80103d29:	e8 42 c6 ff ff       	call   80100370 <panic>
  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
80103d2e:	83 ec 0c             	sub    $0xc,%esp
80103d31:	68 76 78 10 80       	push   $0x80107876
80103d36:	e8 35 c6 ff ff       	call   80100370 <panic>
  int intena;

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
    panic("sched locks");
80103d3b:	83 ec 0c             	sub    $0xc,%esp
80103d3e:	68 6a 78 10 80       	push   $0x8010786a
80103d43:	e8 28 c6 ff ff       	call   80100370 <panic>
80103d48:	90                   	nop
80103d49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103d50 <exit>:
exit(void)
{
  struct proc *p;
  int fd;

  if(proc == initproc)
80103d50:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103d57:	3b 15 bc a5 10 80    	cmp    0x8010a5bc,%edx
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
80103d5d:	55                   	push   %ebp
80103d5e:	89 e5                	mov    %esp,%ebp
80103d60:	56                   	push   %esi
80103d61:	53                   	push   %ebx
  struct proc *p;
  int fd;

  if(proc == initproc)
80103d62:	0f 84 29 01 00 00    	je     80103e91 <exit+0x141>
80103d68:	31 db                	xor    %ebx,%ebx
80103d6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd]){
80103d70:	8d 73 08             	lea    0x8(%ebx),%esi
80103d73:	8b 44 b2 08          	mov    0x8(%edx,%esi,4),%eax
80103d77:	85 c0                	test   %eax,%eax
80103d79:	74 1b                	je     80103d96 <exit+0x46>
      fileclose(proc->ofile[fd]);
80103d7b:	83 ec 0c             	sub    $0xc,%esp
80103d7e:	50                   	push   %eax
80103d7f:	e8 9c d0 ff ff       	call   80100e20 <fileclose>
      proc->ofile[fd] = 0;
80103d84:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103d8b:	83 c4 10             	add    $0x10,%esp
80103d8e:	c7 44 b2 08 00 00 00 	movl   $0x0,0x8(%edx,%esi,4)
80103d95:	00 

  if(proc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80103d96:	83 c3 01             	add    $0x1,%ebx
80103d99:	83 fb 10             	cmp    $0x10,%ebx
80103d9c:	75 d2                	jne    80103d70 <exit+0x20>
      fileclose(proc->ofile[fd]);
      proc->ofile[fd] = 0;
    }
  }

  begin_op();
80103d9e:	e8 ed ed ff ff       	call   80102b90 <begin_op>
  iput(proc->cwd);
80103da3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103da9:	83 ec 0c             	sub    $0xc,%esp
80103dac:	ff 70 68             	pushl  0x68(%eax)
80103daf:	e8 dc d9 ff ff       	call   80101790 <iput>
  end_op();
80103db4:	e8 47 ee ff ff       	call   80102c00 <end_op>
  proc->cwd = 0;
80103db9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103dbf:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)

  acquire(&ptable.lock);
80103dc6:	c7 04 24 60 28 11 80 	movl   $0x80112860,(%esp)
80103dcd:	e8 8e 07 00 00       	call   80104560 <acquire>

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);
80103dd2:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
80103dd9:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103ddc:	b8 94 28 11 80       	mov    $0x80112894,%eax
  proc->cwd = 0;

  acquire(&ptable.lock);

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);
80103de1:	8b 51 14             	mov    0x14(%ecx),%edx
80103de4:	eb 16                	jmp    80103dfc <exit+0xac>
80103de6:	8d 76 00             	lea    0x0(%esi),%esi
80103de9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103df0:	05 94 00 00 00       	add    $0x94,%eax
80103df5:	3d 94 4d 11 80       	cmp    $0x80114d94,%eax
80103dfa:	74 1e                	je     80103e1a <exit+0xca>
    if(p->state == SLEEPING && p->chan == chan)
80103dfc:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103e00:	75 ee                	jne    80103df0 <exit+0xa0>
80103e02:	3b 50 20             	cmp    0x20(%eax),%edx
80103e05:	75 e9                	jne    80103df0 <exit+0xa0>
      p->state = RUNNABLE;
80103e07:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e0e:	05 94 00 00 00       	add    $0x94,%eax
80103e13:	3d 94 4d 11 80       	cmp    $0x80114d94,%eax
80103e18:	75 e2                	jne    80103dfc <exit+0xac>
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == proc){
      p->parent = initproc;
80103e1a:	8b 1d bc a5 10 80    	mov    0x8010a5bc,%ebx
80103e20:	ba 94 28 11 80       	mov    $0x80112894,%edx
80103e25:	eb 17                	jmp    80103e3e <exit+0xee>
80103e27:	89 f6                	mov    %esi,%esi
80103e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e30:	81 c2 94 00 00 00    	add    $0x94,%edx
80103e36:	81 fa 94 4d 11 80    	cmp    $0x80114d94,%edx
80103e3c:	74 3a                	je     80103e78 <exit+0x128>
    if(p->parent == proc){
80103e3e:	3b 4a 14             	cmp    0x14(%edx),%ecx
80103e41:	75 ed                	jne    80103e30 <exit+0xe0>
      p->parent = initproc;
      if(p->state == ZOMBIE)
80103e43:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == proc){
      p->parent = initproc;
80103e47:	89 5a 14             	mov    %ebx,0x14(%edx)
      if(p->state == ZOMBIE)
80103e4a:	75 e4                	jne    80103e30 <exit+0xe0>
80103e4c:	b8 94 28 11 80       	mov    $0x80112894,%eax
80103e51:	eb 11                	jmp    80103e64 <exit+0x114>
80103e53:	90                   	nop
80103e54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e58:	05 94 00 00 00       	add    $0x94,%eax
80103e5d:	3d 94 4d 11 80       	cmp    $0x80114d94,%eax
80103e62:	74 cc                	je     80103e30 <exit+0xe0>
    if(p->state == SLEEPING && p->chan == chan)
80103e64:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103e68:	75 ee                	jne    80103e58 <exit+0x108>
80103e6a:	3b 58 20             	cmp    0x20(%eax),%ebx
80103e6d:	75 e9                	jne    80103e58 <exit+0x108>
      p->state = RUNNABLE;
80103e6f:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103e76:	eb e0                	jmp    80103e58 <exit+0x108>
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  proc->state = ZOMBIE;
80103e78:	c7 41 0c 05 00 00 00 	movl   $0x5,0xc(%ecx)
  sched();
80103e7f:	e8 2c fe ff ff       	call   80103cb0 <sched>
  panic("zombie exit");
80103e84:	83 ec 0c             	sub    $0xc,%esp
80103e87:	68 a5 78 10 80       	push   $0x801078a5
80103e8c:	e8 df c4 ff ff       	call   80100370 <panic>
{
  struct proc *p;
  int fd;

  if(proc == initproc)
    panic("init exiting");
80103e91:	83 ec 0c             	sub    $0xc,%esp
80103e94:	68 98 78 10 80       	push   $0x80107898
80103e99:	e8 d2 c4 ff ff       	call   80100370 <panic>
80103e9e:	66 90                	xchg   %ax,%ax

80103ea0 <yield>:
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
80103ea0:	55                   	push   %ebp
80103ea1:	89 e5                	mov    %esp,%ebp
80103ea3:	83 ec 14             	sub    $0x14,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103ea6:	68 60 28 11 80       	push   $0x80112860
80103eab:	e8 b0 06 00 00       	call   80104560 <acquire>
  proc->state = RUNNABLE;
80103eb0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103eb6:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  sched();
80103ebd:	e8 ee fd ff ff       	call   80103cb0 <sched>
  release(&ptable.lock);
80103ec2:	c7 04 24 60 28 11 80 	movl   $0x80112860,(%esp)
80103ec9:	e8 72 08 00 00       	call   80104740 <release>
}
80103ece:	83 c4 10             	add    $0x10,%esp
80103ed1:	c9                   	leave  
80103ed2:	c3                   	ret    
80103ed3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103ed9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103ee0 <sleep>:
// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  if(proc == 0)
80103ee0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103ee6:	55                   	push   %ebp
80103ee7:	89 e5                	mov    %esp,%ebp
80103ee9:	56                   	push   %esi
80103eea:	53                   	push   %ebx
  if(proc == 0)
80103eeb:	85 c0                	test   %eax,%eax

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103eed:	8b 75 08             	mov    0x8(%ebp),%esi
80103ef0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(proc == 0)
80103ef3:	0f 84 97 00 00 00    	je     80103f90 <sleep+0xb0>
    panic("sleep");

  if(lk == 0)
80103ef9:	85 db                	test   %ebx,%ebx
80103efb:	0f 84 82 00 00 00    	je     80103f83 <sleep+0xa3>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103f01:	81 fb 60 28 11 80    	cmp    $0x80112860,%ebx
80103f07:	74 57                	je     80103f60 <sleep+0x80>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103f09:	83 ec 0c             	sub    $0xc,%esp
80103f0c:	68 60 28 11 80       	push   $0x80112860
80103f11:	e8 4a 06 00 00       	call   80104560 <acquire>
    release(lk);
80103f16:	89 1c 24             	mov    %ebx,(%esp)
80103f19:	e8 22 08 00 00       	call   80104740 <release>
  }

  // Go to sleep.
  proc->chan = chan;
80103f1e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103f24:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
80103f27:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103f2e:	e8 7d fd ff ff       	call   80103cb0 <sched>

  // Tidy up.
  proc->chan = 0;
80103f33:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103f39:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
80103f40:	c7 04 24 60 28 11 80 	movl   $0x80112860,(%esp)
80103f47:	e8 f4 07 00 00       	call   80104740 <release>
    acquire(lk);
80103f4c:	89 5d 08             	mov    %ebx,0x8(%ebp)
80103f4f:	83 c4 10             	add    $0x10,%esp
  }
}
80103f52:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103f55:	5b                   	pop    %ebx
80103f56:	5e                   	pop    %esi
80103f57:	5d                   	pop    %ebp
  proc->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
80103f58:	e9 03 06 00 00       	jmp    80104560 <acquire>
80103f5d:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }

  // Go to sleep.
  proc->chan = chan;
80103f60:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
80103f63:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103f6a:	e8 41 fd ff ff       	call   80103cb0 <sched>

  // Tidy up.
  proc->chan = 0;
80103f6f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103f75:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}
80103f7c:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103f7f:	5b                   	pop    %ebx
80103f80:	5e                   	pop    %esi
80103f81:	5d                   	pop    %ebp
80103f82:	c3                   	ret    
{
  if(proc == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");
80103f83:	83 ec 0c             	sub    $0xc,%esp
80103f86:	68 b7 78 10 80       	push   $0x801078b7
80103f8b:	e8 e0 c3 ff ff       	call   80100370 <panic>
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  if(proc == 0)
    panic("sleep");
80103f90:	83 ec 0c             	sub    $0xc,%esp
80103f93:	68 b1 78 10 80       	push   $0x801078b1
80103f98:	e8 d3 c3 ff ff       	call   80100370 <panic>
80103f9d:	8d 76 00             	lea    0x0(%esi),%esi

80103fa0 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
80103fa0:	55                   	push   %ebp
80103fa1:	89 e5                	mov    %esp,%ebp
80103fa3:	56                   	push   %esi
80103fa4:	53                   	push   %ebx
  struct proc *p;
  int havekids, pid;

  acquire(&ptable.lock);
80103fa5:	83 ec 0c             	sub    $0xc,%esp
80103fa8:	68 60 28 11 80       	push   $0x80112860
80103fad:	e8 ae 05 00 00       	call   80104560 <acquire>
80103fb2:	83 c4 10             	add    $0x10,%esp
80103fb5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
80103fbb:	31 d2                	xor    %edx,%edx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fbd:	bb 94 28 11 80       	mov    $0x80112894,%ebx
80103fc2:	eb 12                	jmp    80103fd6 <wait+0x36>
80103fc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103fc8:	81 c3 94 00 00 00    	add    $0x94,%ebx
80103fce:	81 fb 94 4d 11 80    	cmp    $0x80114d94,%ebx
80103fd4:	74 22                	je     80103ff8 <wait+0x58>
      if(p->parent != proc)
80103fd6:	3b 43 14             	cmp    0x14(%ebx),%eax
80103fd9:	75 ed                	jne    80103fc8 <wait+0x28>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
80103fdb:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103fdf:	74 35                	je     80104016 <wait+0x76>

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fe1:	81 c3 94 00 00 00    	add    $0x94,%ebx
      if(p->parent != proc)
        continue;
      havekids = 1;
80103fe7:	ba 01 00 00 00       	mov    $0x1,%edx

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fec:	81 fb 94 4d 11 80    	cmp    $0x80114d94,%ebx
80103ff2:	75 e2                	jne    80103fd6 <wait+0x36>
80103ff4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
80103ff8:	85 d2                	test   %edx,%edx
80103ffa:	74 70                	je     8010406c <wait+0xcc>
80103ffc:	8b 50 24             	mov    0x24(%eax),%edx
80103fff:	85 d2                	test   %edx,%edx
80104001:	75 69                	jne    8010406c <wait+0xcc>
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
80104003:	83 ec 08             	sub    $0x8,%esp
80104006:	68 60 28 11 80       	push   $0x80112860
8010400b:	50                   	push   %eax
8010400c:	e8 cf fe ff ff       	call   80103ee0 <sleep>
  }
80104011:	83 c4 10             	add    $0x10,%esp
80104014:	eb 9f                	jmp    80103fb5 <wait+0x15>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
80104016:	83 ec 0c             	sub    $0xc,%esp
80104019:	ff 73 08             	pushl  0x8(%ebx)
      if(p->parent != proc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
8010401c:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
8010401f:	e8 ac e2 ff ff       	call   801022d0 <kfree>
        p->kstack = 0;
        freevm(p->pgdir);
80104024:	59                   	pop    %ecx
80104025:	ff 73 04             	pushl  0x4(%ebx)
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
80104028:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
8010402f:	e8 1c 30 00 00       	call   80107050 <freevm>
        p->pid = 0;
80104034:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
8010403b:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80104042:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80104046:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
8010404d:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80104054:	c7 04 24 60 28 11 80 	movl   $0x80112860,(%esp)
8010405b:	e8 e0 06 00 00       	call   80104740 <release>
        return pid;
80104060:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80104063:	8d 65 f8             	lea    -0x8(%ebp),%esp
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
80104066:	89 f0                	mov    %esi,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80104068:	5b                   	pop    %ebx
80104069:	5e                   	pop    %esi
8010406a:	5d                   	pop    %ebp
8010406b:	c3                   	ret    
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
      release(&ptable.lock);
8010406c:	83 ec 0c             	sub    $0xc,%esp
8010406f:	68 60 28 11 80       	push   $0x80112860
80104074:	e8 c7 06 00 00       	call   80104740 <release>
      return -1;
80104079:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
8010407c:	8d 65 f8             	lea    -0x8(%ebp),%esp
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
      release(&ptable.lock);
      return -1;
8010407f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80104084:	5b                   	pop    %ebx
80104085:	5e                   	pop    %esi
80104086:	5d                   	pop    %ebp
80104087:	c3                   	ret    
80104088:	90                   	nop
80104089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104090 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80104090:	55                   	push   %ebp
80104091:	89 e5                	mov    %esp,%ebp
80104093:	53                   	push   %ebx
80104094:	83 ec 10             	sub    $0x10,%esp
80104097:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
8010409a:	68 60 28 11 80       	push   $0x80112860
8010409f:	e8 bc 04 00 00       	call   80104560 <acquire>
801040a4:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801040a7:	b8 94 28 11 80       	mov    $0x80112894,%eax
801040ac:	eb 0e                	jmp    801040bc <wakeup+0x2c>
801040ae:	66 90                	xchg   %ax,%ax
801040b0:	05 94 00 00 00       	add    $0x94,%eax
801040b5:	3d 94 4d 11 80       	cmp    $0x80114d94,%eax
801040ba:	74 1e                	je     801040da <wakeup+0x4a>
    if(p->state == SLEEPING && p->chan == chan)
801040bc:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
801040c0:	75 ee                	jne    801040b0 <wakeup+0x20>
801040c2:	3b 58 20             	cmp    0x20(%eax),%ebx
801040c5:	75 e9                	jne    801040b0 <wakeup+0x20>
      p->state = RUNNABLE;
801040c7:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801040ce:	05 94 00 00 00       	add    $0x94,%eax
801040d3:	3d 94 4d 11 80       	cmp    $0x80114d94,%eax
801040d8:	75 e2                	jne    801040bc <wakeup+0x2c>
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
801040da:	c7 45 08 60 28 11 80 	movl   $0x80112860,0x8(%ebp)
}
801040e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801040e4:	c9                   	leave  
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
801040e5:	e9 56 06 00 00       	jmp    80104740 <release>
801040ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801040f0 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
801040f0:	55                   	push   %ebp
801040f1:	89 e5                	mov    %esp,%ebp
801040f3:	53                   	push   %ebx
801040f4:	83 ec 10             	sub    $0x10,%esp
801040f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
801040fa:	68 60 28 11 80       	push   $0x80112860
801040ff:	e8 5c 04 00 00       	call   80104560 <acquire>
80104104:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104107:	b8 94 28 11 80       	mov    $0x80112894,%eax
8010410c:	eb 0e                	jmp    8010411c <kill+0x2c>
8010410e:	66 90                	xchg   %ax,%ax
80104110:	05 94 00 00 00       	add    $0x94,%eax
80104115:	3d 94 4d 11 80       	cmp    $0x80114d94,%eax
8010411a:	74 3c                	je     80104158 <kill+0x68>
    if(p->pid == pid){
8010411c:	39 58 10             	cmp    %ebx,0x10(%eax)
8010411f:	75 ef                	jne    80104110 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80104121:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
80104125:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
8010412c:	74 1a                	je     80104148 <kill+0x58>
        p->state = RUNNABLE;
      release(&ptable.lock);
8010412e:	83 ec 0c             	sub    $0xc,%esp
80104131:	68 60 28 11 80       	push   $0x80112860
80104136:	e8 05 06 00 00       	call   80104740 <release>
      return 0;
8010413b:	83 c4 10             	add    $0x10,%esp
8010413e:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80104140:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104143:	c9                   	leave  
80104144:	c3                   	ret    
80104145:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
80104148:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
8010414f:	eb dd                	jmp    8010412e <kill+0x3e>
80104151:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
80104158:	83 ec 0c             	sub    $0xc,%esp
8010415b:	68 60 28 11 80       	push   $0x80112860
80104160:	e8 db 05 00 00       	call   80104740 <release>
  return -1;
80104165:	83 c4 10             	add    $0x10,%esp
80104168:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010416d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104170:	c9                   	leave  
80104171:	c3                   	ret    
80104172:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104180 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104180:	55                   	push   %ebp
80104181:	89 e5                	mov    %esp,%ebp
80104183:	57                   	push   %edi
80104184:	56                   	push   %esi
80104185:	53                   	push   %ebx
80104186:	8d 75 e8             	lea    -0x18(%ebp),%esi
80104189:	bb 00 29 11 80       	mov    $0x80112900,%ebx
8010418e:	83 ec 3c             	sub    $0x3c,%esp
80104191:	eb 27                	jmp    801041ba <procdump+0x3a>
80104193:	90                   	nop
80104194:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80104198:	83 ec 0c             	sub    $0xc,%esp
8010419b:	68 31 79 10 80       	push   $0x80107931
801041a0:	e8 bb c4 ff ff       	call   80100660 <cprintf>
801041a5:	83 c4 10             	add    $0x10,%esp
801041a8:	81 c3 94 00 00 00    	add    $0x94,%ebx
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801041ae:	81 fb 00 4e 11 80    	cmp    $0x80114e00,%ebx
801041b4:	0f 84 96 00 00 00    	je     80104250 <procdump+0xd0>
    if(p->state == UNUSED)
801041ba:	8b 43 a0             	mov    -0x60(%ebx),%eax
801041bd:	85 c0                	test   %eax,%eax
801041bf:	74 e7                	je     801041a8 <procdump+0x28>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801041c1:	83 f8 05             	cmp    $0x5,%eax
      state = states[p->state];
    else
      state = "???";
801041c4:	ba c8 78 10 80       	mov    $0x801078c8,%edx
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801041c9:	77 11                	ja     801041dc <procdump+0x5c>
801041cb:	8b 14 85 80 79 10 80 	mov    -0x7fef8680(,%eax,4),%edx
      state = states[p->state];
    else
      state = "???";
801041d2:	b8 c8 78 10 80       	mov    $0x801078c8,%eax
801041d7:	85 d2                	test   %edx,%edx
801041d9:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s %d", p->pid, state, p->name, p->tickets);
801041dc:	83 ec 08             	sub    $0x8,%esp
801041df:	ff 73 14             	pushl  0x14(%ebx)
801041e2:	ff 73 10             	pushl  0x10(%ebx)
801041e5:	53                   	push   %ebx
801041e6:	52                   	push   %edx
801041e7:	ff 73 a4             	pushl  -0x5c(%ebx)
801041ea:	68 cc 78 10 80       	push   $0x801078cc
801041ef:	e8 6c c4 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
801041f4:	83 c4 20             	add    $0x20,%esp
801041f7:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
801041fb:	75 9b                	jne    80104198 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
801041fd:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104200:	83 ec 08             	sub    $0x8,%esp
80104203:	8d 7d c0             	lea    -0x40(%ebp),%edi
80104206:	50                   	push   %eax
80104207:	8b 43 b0             	mov    -0x50(%ebx),%eax
8010420a:	8b 40 0c             	mov    0xc(%eax),%eax
8010420d:	83 c0 08             	add    $0x8,%eax
80104210:	50                   	push   %eax
80104211:	e8 1a 04 00 00       	call   80104630 <getcallerpcs>
80104216:	83 c4 10             	add    $0x10,%esp
80104219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i=0; i<10 && pc[i] != 0; i++)
80104220:	8b 17                	mov    (%edi),%edx
80104222:	85 d2                	test   %edx,%edx
80104224:	0f 84 6e ff ff ff    	je     80104198 <procdump+0x18>
        cprintf(" %p", pc[i]);
8010422a:	83 ec 08             	sub    $0x8,%esp
8010422d:	83 c7 04             	add    $0x4,%edi
80104230:	52                   	push   %edx
80104231:	68 29 73 10 80       	push   $0x80107329
80104236:	e8 25 c4 ff ff       	call   80100660 <cprintf>
    else
      state = "???";
    cprintf("%d %s %s %d", p->pid, state, p->name, p->tickets);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
8010423b:	83 c4 10             	add    $0x10,%esp
8010423e:	39 f7                	cmp    %esi,%edi
80104240:	75 de                	jne    80104220 <procdump+0xa0>
80104242:	e9 51 ff ff ff       	jmp    80104198 <procdump+0x18>
80104247:	89 f6                	mov    %esi,%esi
80104249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}
80104250:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104253:	5b                   	pop    %ebx
80104254:	5e                   	pop    %esi
80104255:	5f                   	pop    %edi
80104256:	5d                   	pop    %ebp
80104257:	c3                   	ret    
80104258:	90                   	nop
80104259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104260 <cps>:

int
cps(void)
{
80104260:	55                   	push   %ebp
80104261:	89 e5                	mov    %esp,%ebp
80104263:	53                   	push   %ebx
80104264:	83 ec 10             	sub    $0x10,%esp
}

static inline void
sti(void)
{
  asm volatile("sti");
80104267:	fb                   	sti    
  struct proc *p;

  sti(); //Enable interruptions
  acquire(&ptable.lock);
80104268:	68 60 28 11 80       	push   $0x80112860
8010426d:	bb 00 29 11 80       	mov    $0x80112900,%ebx
80104272:	e8 e9 02 00 00       	call   80104560 <acquire>

  cprintf("name \t pid \t tickets \t state \n");
80104277:	c7 04 24 60 79 10 80 	movl   $0x80107960,(%esp)
8010427e:	e8 dd c3 ff ff       	call   80100660 <cprintf>
80104283:	83 c4 10             	add    $0x10,%esp
80104286:	eb 24                	jmp    801042ac <cps+0x4c>
80104288:	90                   	nop
80104289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if(p->state == RUNNING)
      cprintf("%s \t %d \t %d %s \t RUNNING \t\n", p->name, p->pid, p->tickets, p->tickets < 1000 ? "\t" : "");
    else if(p->state == SLEEPING)
80104290:	83 f8 02             	cmp    $0x2,%eax
80104293:	74 7b                	je     80104310 <cps+0xb0>
      cprintf("%s \t %d \t %d %s \t SLEEPING \t\n", p->name, p->pid, p->tickets, p->tickets < 1000 ? "\t" : "");  
    else if(p->state == RUNNABLE)
80104295:	83 f8 03             	cmp    $0x3,%eax
80104298:	0f 84 a2 00 00 00    	je     80104340 <cps+0xe0>
8010429e:	81 c3 94 00 00 00    	add    $0x94,%ebx

  sti(); //Enable interruptions
  acquire(&ptable.lock);

  cprintf("name \t pid \t tickets \t state \n");
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801042a4:	81 fb 00 4e 11 80    	cmp    $0x80114e00,%ebx
801042aa:	74 47                	je     801042f3 <cps+0x93>
  {
    if(p->state == RUNNING)
801042ac:	8b 43 a0             	mov    -0x60(%ebx),%eax
801042af:	83 f8 04             	cmp    $0x4,%eax
801042b2:	75 dc                	jne    80104290 <cps+0x30>
      cprintf("%s \t %d \t %d %s \t RUNNING \t\n", p->name, p->pid, p->tickets, p->tickets < 1000 ? "\t" : "");
801042b4:	8b 53 14             	mov    0x14(%ebx),%edx
801042b7:	8b 43 10             	mov    0x10(%ebx),%eax
801042ba:	83 fa 00             	cmp    $0x0,%edx
801042bd:	0f 8c b8 00 00 00    	jl     8010437b <cps+0x11b>
801042c3:	0f 8e a7 00 00 00    	jle    80104370 <cps+0x110>
801042c9:	b9 d9 78 10 80       	mov    $0x801078d9,%ecx
801042ce:	83 ec 08             	sub    $0x8,%esp
801042d1:	51                   	push   %ecx
801042d2:	52                   	push   %edx
801042d3:	50                   	push   %eax
801042d4:	ff 73 a4             	pushl  -0x5c(%ebx)
801042d7:	53                   	push   %ebx
801042d8:	68 da 78 10 80       	push   $0x801078da
801042dd:	81 c3 94 00 00 00    	add    $0x94,%ebx
801042e3:	e8 78 c3 ff ff       	call   80100660 <cprintf>
801042e8:	83 c4 20             	add    $0x20,%esp

  sti(); //Enable interruptions
  acquire(&ptable.lock);

  cprintf("name \t pid \t tickets \t state \n");
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801042eb:	81 fb 00 4e 11 80    	cmp    $0x80114e00,%ebx
801042f1:	75 b9                	jne    801042ac <cps+0x4c>
    else if(p->state == RUNNABLE)
      cprintf("%s \t %d \t %d %s \t RUNNABLE \t\n", p->name, p->pid, p->tickets,  p->tickets < 1000 ? "\t" : "");     

  }

  release(&ptable.lock);
801042f3:	83 ec 0c             	sub    $0xc,%esp
801042f6:	68 60 28 11 80       	push   $0x80112860
801042fb:	e8 40 04 00 00       	call   80104740 <release>
  return 22;
}
80104300:	b8 16 00 00 00       	mov    $0x16,%eax
80104305:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104308:	c9                   	leave  
80104309:	c3                   	ret    
8010430a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if(p->state == RUNNING)
      cprintf("%s \t %d \t %d %s \t RUNNING \t\n", p->name, p->pid, p->tickets, p->tickets < 1000 ? "\t" : "");
    else if(p->state == SLEEPING)
      cprintf("%s \t %d \t %d %s \t SLEEPING \t\n", p->name, p->pid, p->tickets, p->tickets < 1000 ? "\t" : "");  
80104310:	8b 53 14             	mov    0x14(%ebx),%edx
80104313:	8b 43 10             	mov    0x10(%ebx),%eax
80104316:	83 fa 00             	cmp    $0x0,%edx
80104319:	7c 74                	jl     8010438f <cps+0x12f>
8010431b:	7e 6b                	jle    80104388 <cps+0x128>
8010431d:	b9 d9 78 10 80       	mov    $0x801078d9,%ecx
80104322:	83 ec 08             	sub    $0x8,%esp
80104325:	51                   	push   %ecx
80104326:	52                   	push   %edx
80104327:	50                   	push   %eax
80104328:	ff 73 a4             	pushl  -0x5c(%ebx)
8010432b:	53                   	push   %ebx
8010432c:	68 f7 78 10 80       	push   $0x801078f7
80104331:	e8 2a c3 ff ff       	call   80100660 <cprintf>
80104336:	83 c4 20             	add    $0x20,%esp
80104339:	e9 60 ff ff ff       	jmp    8010429e <cps+0x3e>
8010433e:	66 90                	xchg   %ax,%ax
    else if(p->state == RUNNABLE)
      cprintf("%s \t %d \t %d %s \t RUNNABLE \t\n", p->name, p->pid, p->tickets,  p->tickets < 1000 ? "\t" : "");     
80104340:	8b 53 14             	mov    0x14(%ebx),%edx
80104343:	8b 43 10             	mov    0x10(%ebx),%eax
80104346:	83 fa 00             	cmp    $0x0,%edx
80104349:	7c 5c                	jl     801043a7 <cps+0x147>
8010434b:	7e 53                	jle    801043a0 <cps+0x140>
8010434d:	b9 d9 78 10 80       	mov    $0x801078d9,%ecx
80104352:	83 ec 08             	sub    $0x8,%esp
80104355:	51                   	push   %ecx
80104356:	52                   	push   %edx
80104357:	50                   	push   %eax
80104358:	ff 73 a4             	pushl  -0x5c(%ebx)
8010435b:	53                   	push   %ebx
8010435c:	68 15 79 10 80       	push   $0x80107915
80104361:	e8 fa c2 ff ff       	call   80100660 <cprintf>
80104366:	83 c4 20             	add    $0x20,%esp
80104369:	e9 30 ff ff ff       	jmp    8010429e <cps+0x3e>
8010436e:	66 90                	xchg   %ax,%ax

  cprintf("name \t pid \t tickets \t state \n");
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if(p->state == RUNNING)
      cprintf("%s \t %d \t %d %s \t RUNNING \t\n", p->name, p->pid, p->tickets, p->tickets < 1000 ? "\t" : "");
80104370:	3d e7 03 00 00       	cmp    $0x3e7,%eax
80104375:	0f 87 4e ff ff ff    	ja     801042c9 <cps+0x69>
8010437b:	b9 d8 78 10 80       	mov    $0x801078d8,%ecx
80104380:	e9 49 ff ff ff       	jmp    801042ce <cps+0x6e>
80104385:	8d 76 00             	lea    0x0(%esi),%esi
    else if(p->state == SLEEPING)
      cprintf("%s \t %d \t %d %s \t SLEEPING \t\n", p->name, p->pid, p->tickets, p->tickets < 1000 ? "\t" : "");  
80104388:	3d e7 03 00 00       	cmp    $0x3e7,%eax
8010438d:	77 8e                	ja     8010431d <cps+0xbd>
8010438f:	b9 d8 78 10 80       	mov    $0x801078d8,%ecx
80104394:	eb 8c                	jmp    80104322 <cps+0xc2>
80104396:	8d 76 00             	lea    0x0(%esi),%esi
80104399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    else if(p->state == RUNNABLE)
      cprintf("%s \t %d \t %d %s \t RUNNABLE \t\n", p->name, p->pid, p->tickets,  p->tickets < 1000 ? "\t" : "");     
801043a0:	3d e7 03 00 00       	cmp    $0x3e7,%eax
801043a5:	77 a6                	ja     8010434d <cps+0xed>
801043a7:	b9 d8 78 10 80       	mov    $0x801078d8,%ecx
801043ac:	eb a4                	jmp    80104352 <cps+0xf2>
801043ae:	66 90                	xchg   %ax,%ax

801043b0 <cht>:
  return 22;
}

int 
cht(int pid, int ntickets)
{
801043b0:	55                   	push   %ebp
801043b1:	89 e5                	mov    %esp,%ebp
801043b3:	56                   	push   %esi
801043b4:	53                   	push   %ebx
801043b5:	8b 75 0c             	mov    0xc(%ebp),%esi
801043b8:	8b 5d 08             	mov    0x8(%ebp),%ebx
801043bb:	fb                   	sti    
  struct proc *p;

  sti();
  acquire(&ptable.lock);
801043bc:	83 ec 0c             	sub    $0xc,%esp
801043bf:	68 60 28 11 80       	push   $0x80112860
801043c4:	e8 97 01 00 00       	call   80104560 <acquire>
801043c9:	83 c4 10             	add    $0x10,%esp

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801043cc:	b9 94 28 11 80       	mov    $0x80112894,%ecx
801043d1:	eb 13                	jmp    801043e6 <cht+0x36>
801043d3:	90                   	nop
801043d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801043d8:	81 c1 94 00 00 00    	add    $0x94,%ecx
801043de:	81 f9 94 4d 11 80    	cmp    $0x80114d94,%ecx
801043e4:	74 2a                	je     80104410 <cht+0x60>
  {
    if(p->pid == pid)
801043e6:	39 59 10             	cmp    %ebx,0x10(%ecx)
801043e9:	75 ed                	jne    801043d8 <cht+0x28>
    {
      p->tickets = ntickets;
801043eb:	89 f0                	mov    %esi,%eax
801043ed:	89 71 7c             	mov    %esi,0x7c(%ecx)
801043f0:	c1 f8 1f             	sar    $0x1f,%eax
801043f3:	89 81 80 00 00 00    	mov    %eax,0x80(%ecx)
      p->stride = CONST_STRIDE/ntickets;
801043f9:	b8 10 27 00 00       	mov    $0x2710,%eax
801043fe:	99                   	cltd   
801043ff:	f7 fe                	idiv   %esi
80104401:	89 81 84 00 00 00    	mov    %eax,0x84(%ecx)
80104407:	c1 f8 1f             	sar    $0x1f,%eax
8010440a:	89 81 88 00 00 00    	mov    %eax,0x88(%ecx)
      break;
    }
  }
  release(&ptable.lock);
80104410:	83 ec 0c             	sub    $0xc,%esp
80104413:	68 60 28 11 80       	push   $0x80112860
80104418:	e8 23 03 00 00       	call   80104740 <release>
  return pid;
8010441d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104420:	89 d8                	mov    %ebx,%eax
80104422:	5b                   	pop    %ebx
80104423:	5e                   	pop    %esi
80104424:	5d                   	pop    %ebp
80104425:	c3                   	ret    
80104426:	66 90                	xchg   %ax,%ax
80104428:	66 90                	xchg   %ax,%ax
8010442a:	66 90                	xchg   %ax,%ax
8010442c:	66 90                	xchg   %ax,%ax
8010442e:	66 90                	xchg   %ax,%ax

80104430 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80104430:	55                   	push   %ebp
80104431:	89 e5                	mov    %esp,%ebp
80104433:	53                   	push   %ebx
80104434:	83 ec 0c             	sub    $0xc,%esp
80104437:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
8010443a:	68 98 79 10 80       	push   $0x80107998
8010443f:	8d 43 04             	lea    0x4(%ebx),%eax
80104442:	50                   	push   %eax
80104443:	e8 f8 00 00 00       	call   80104540 <initlock>
  lk->name = name;
80104448:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
8010444b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
80104451:	83 c4 10             	add    $0x10,%esp
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
  lk->locked = 0;
  lk->pid = 0;
80104454:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)

void
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
8010445b:	89 43 38             	mov    %eax,0x38(%ebx)
  lk->locked = 0;
  lk->pid = 0;
}
8010445e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104461:	c9                   	leave  
80104462:	c3                   	ret    
80104463:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104470 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
80104470:	55                   	push   %ebp
80104471:	89 e5                	mov    %esp,%ebp
80104473:	56                   	push   %esi
80104474:	53                   	push   %ebx
80104475:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104478:	83 ec 0c             	sub    $0xc,%esp
8010447b:	8d 73 04             	lea    0x4(%ebx),%esi
8010447e:	56                   	push   %esi
8010447f:	e8 dc 00 00 00       	call   80104560 <acquire>
  while (lk->locked) {
80104484:	8b 13                	mov    (%ebx),%edx
80104486:	83 c4 10             	add    $0x10,%esp
80104489:	85 d2                	test   %edx,%edx
8010448b:	74 16                	je     801044a3 <acquiresleep+0x33>
8010448d:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
80104490:	83 ec 08             	sub    $0x8,%esp
80104493:	56                   	push   %esi
80104494:	53                   	push   %ebx
80104495:	e8 46 fa ff ff       	call   80103ee0 <sleep>

void
acquiresleep(struct sleeplock *lk)
{
  acquire(&lk->lk);
  while (lk->locked) {
8010449a:	8b 03                	mov    (%ebx),%eax
8010449c:	83 c4 10             	add    $0x10,%esp
8010449f:	85 c0                	test   %eax,%eax
801044a1:	75 ed                	jne    80104490 <acquiresleep+0x20>
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
801044a3:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = proc->pid;
801044a9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801044af:	8b 40 10             	mov    0x10(%eax),%eax
801044b2:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
801044b5:	89 75 08             	mov    %esi,0x8(%ebp)
}
801044b8:	8d 65 f8             	lea    -0x8(%ebp),%esp
801044bb:	5b                   	pop    %ebx
801044bc:	5e                   	pop    %esi
801044bd:	5d                   	pop    %ebp
  while (lk->locked) {
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
  lk->pid = proc->pid;
  release(&lk->lk);
801044be:	e9 7d 02 00 00       	jmp    80104740 <release>
801044c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801044c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801044d0 <releasesleep>:
}

void
releasesleep(struct sleeplock *lk)
{
801044d0:	55                   	push   %ebp
801044d1:	89 e5                	mov    %esp,%ebp
801044d3:	56                   	push   %esi
801044d4:	53                   	push   %ebx
801044d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801044d8:	83 ec 0c             	sub    $0xc,%esp
801044db:	8d 73 04             	lea    0x4(%ebx),%esi
801044de:	56                   	push   %esi
801044df:	e8 7c 00 00 00       	call   80104560 <acquire>
  lk->locked = 0;
801044e4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
801044ea:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
801044f1:	89 1c 24             	mov    %ebx,(%esp)
801044f4:	e8 97 fb ff ff       	call   80104090 <wakeup>
  release(&lk->lk);
801044f9:	89 75 08             	mov    %esi,0x8(%ebp)
801044fc:	83 c4 10             	add    $0x10,%esp
}
801044ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104502:	5b                   	pop    %ebx
80104503:	5e                   	pop    %esi
80104504:	5d                   	pop    %ebp
{
  acquire(&lk->lk);
  lk->locked = 0;
  lk->pid = 0;
  wakeup(lk);
  release(&lk->lk);
80104505:	e9 36 02 00 00       	jmp    80104740 <release>
8010450a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104510 <holdingsleep>:
}

int
holdingsleep(struct sleeplock *lk)
{
80104510:	55                   	push   %ebp
80104511:	89 e5                	mov    %esp,%ebp
80104513:	56                   	push   %esi
80104514:	53                   	push   %ebx
80104515:	8b 75 08             	mov    0x8(%ebp),%esi
  int r;
  
  acquire(&lk->lk);
80104518:	83 ec 0c             	sub    $0xc,%esp
8010451b:	8d 5e 04             	lea    0x4(%esi),%ebx
8010451e:	53                   	push   %ebx
8010451f:	e8 3c 00 00 00       	call   80104560 <acquire>
  r = lk->locked;
80104524:	8b 36                	mov    (%esi),%esi
  release(&lk->lk);
80104526:	89 1c 24             	mov    %ebx,(%esp)
80104529:	e8 12 02 00 00       	call   80104740 <release>
  return r;
}
8010452e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104531:	89 f0                	mov    %esi,%eax
80104533:	5b                   	pop    %ebx
80104534:	5e                   	pop    %esi
80104535:	5d                   	pop    %ebp
80104536:	c3                   	ret    
80104537:	66 90                	xchg   %ax,%ax
80104539:	66 90                	xchg   %ax,%ax
8010453b:	66 90                	xchg   %ax,%ax
8010453d:	66 90                	xchg   %ax,%ax
8010453f:	90                   	nop

80104540 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
80104540:	55                   	push   %ebp
80104541:	89 e5                	mov    %esp,%ebp
80104543:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
80104546:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
80104549:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
  lk->name = name;
8010454f:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
  lk->cpu = 0;
80104552:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80104559:	5d                   	pop    %ebp
8010455a:	c3                   	ret    
8010455b:	90                   	nop
8010455c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104560 <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
80104560:	55                   	push   %ebp
80104561:	89 e5                	mov    %esp,%ebp
80104563:	53                   	push   %ebx
80104564:	83 ec 04             	sub    $0x4,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104567:	9c                   	pushf  
80104568:	5a                   	pop    %edx
}

static inline void
cli(void)
{
  asm volatile("cli");
80104569:	fa                   	cli    
{
  int eflags;

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
8010456a:	65 8b 0d 00 00 00 00 	mov    %gs:0x0,%ecx
80104571:	8b 81 ac 00 00 00    	mov    0xac(%ecx),%eax
80104577:	85 c0                	test   %eax,%eax
80104579:	75 0c                	jne    80104587 <acquire+0x27>
    cpu->intena = eflags & FL_IF;
8010457b:	81 e2 00 02 00 00    	and    $0x200,%edx
80104581:	89 91 b0 00 00 00    	mov    %edx,0xb0(%ecx)
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
80104587:	8b 55 08             	mov    0x8(%ebp),%edx

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
    cpu->intena = eflags & FL_IF;
  cpu->ncli += 1;
8010458a:	83 c0 01             	add    $0x1,%eax
8010458d:	89 81 ac 00 00 00    	mov    %eax,0xac(%ecx)

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
80104593:	8b 02                	mov    (%edx),%eax
80104595:	85 c0                	test   %eax,%eax
80104597:	74 05                	je     8010459e <acquire+0x3e>
80104599:	39 4a 08             	cmp    %ecx,0x8(%edx)
8010459c:	74 7a                	je     80104618 <acquire+0xb8>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
8010459e:	b9 01 00 00 00       	mov    $0x1,%ecx
801045a3:	90                   	nop
801045a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801045a8:	89 c8                	mov    %ecx,%eax
801045aa:	f0 87 02             	lock xchg %eax,(%edx)
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");

  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
801045ad:	85 c0                	test   %eax,%eax
801045af:	75 f7                	jne    801045a8 <acquire+0x48>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
801045b1:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
801045b6:	8b 4d 08             	mov    0x8(%ebp),%ecx
801045b9:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
getcallerpcs(void *v, uint pcs[])
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
801045bf:	89 ea                	mov    %ebp,%edx
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
801045c1:	89 41 08             	mov    %eax,0x8(%ecx)
  getcallerpcs(&lk, lk->pcs);
801045c4:	83 c1 0c             	add    $0xc,%ecx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801045c7:	31 c0                	xor    %eax,%eax
801045c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801045d0:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801045d6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801045dc:	77 1a                	ja     801045f8 <acquire+0x98>
      break;
    pcs[i] = ebp[1];     // saved %eip
801045de:	8b 5a 04             	mov    0x4(%edx),%ebx
801045e1:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801045e4:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
801045e7:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801045e9:	83 f8 0a             	cmp    $0xa,%eax
801045ec:	75 e2                	jne    801045d0 <acquire+0x70>
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
  getcallerpcs(&lk, lk->pcs);
}
801045ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801045f1:	c9                   	leave  
801045f2:	c3                   	ret    
801045f3:	90                   	nop
801045f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
801045f8:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801045ff:	83 c0 01             	add    $0x1,%eax
80104602:	83 f8 0a             	cmp    $0xa,%eax
80104605:	74 e7                	je     801045ee <acquire+0x8e>
    pcs[i] = 0;
80104607:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010460e:	83 c0 01             	add    $0x1,%eax
80104611:	83 f8 0a             	cmp    $0xa,%eax
80104614:	75 e2                	jne    801045f8 <acquire+0x98>
80104616:	eb d6                	jmp    801045ee <acquire+0x8e>
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");
80104618:	83 ec 0c             	sub    $0xc,%esp
8010461b:	68 a3 79 10 80       	push   $0x801079a3
80104620:	e8 4b bd ff ff       	call   80100370 <panic>
80104625:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104630 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104630:	55                   	push   %ebp
80104631:	89 e5                	mov    %esp,%ebp
80104633:	53                   	push   %ebx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
80104634:	8b 45 08             	mov    0x8(%ebp),%eax
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104637:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
8010463a:	8d 50 f8             	lea    -0x8(%eax),%edx
  for(i = 0; i < 10; i++){
8010463d:	31 c0                	xor    %eax,%eax
8010463f:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104640:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104646:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010464c:	77 1a                	ja     80104668 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
8010464e:	8b 5a 04             	mov    0x4(%edx),%ebx
80104651:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104654:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
80104657:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104659:	83 f8 0a             	cmp    $0xa,%eax
8010465c:	75 e2                	jne    80104640 <getcallerpcs+0x10>
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
8010465e:	5b                   	pop    %ebx
8010465f:	5d                   	pop    %ebp
80104660:	c3                   	ret    
80104661:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
80104668:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010466f:	83 c0 01             	add    $0x1,%eax
80104672:	83 f8 0a             	cmp    $0xa,%eax
80104675:	74 e7                	je     8010465e <getcallerpcs+0x2e>
    pcs[i] = 0;
80104677:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010467e:	83 c0 01             	add    $0x1,%eax
80104681:	83 f8 0a             	cmp    $0xa,%eax
80104684:	75 e2                	jne    80104668 <getcallerpcs+0x38>
80104686:	eb d6                	jmp    8010465e <getcallerpcs+0x2e>
80104688:	90                   	nop
80104689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104690 <holding>:
}

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
80104690:	55                   	push   %ebp
80104691:	89 e5                	mov    %esp,%ebp
80104693:	8b 55 08             	mov    0x8(%ebp),%edx
  return lock->locked && lock->cpu == cpu;
80104696:	8b 02                	mov    (%edx),%eax
80104698:	85 c0                	test   %eax,%eax
8010469a:	74 14                	je     801046b0 <holding+0x20>
8010469c:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801046a2:	39 42 08             	cmp    %eax,0x8(%edx)
}
801046a5:	5d                   	pop    %ebp

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
801046a6:	0f 94 c0             	sete   %al
801046a9:	0f b6 c0             	movzbl %al,%eax
}
801046ac:	c3                   	ret    
801046ad:	8d 76 00             	lea    0x0(%esi),%esi
801046b0:	31 c0                	xor    %eax,%eax
801046b2:	5d                   	pop    %ebp
801046b3:	c3                   	ret    
801046b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801046ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801046c0 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
801046c0:	55                   	push   %ebp
801046c1:	89 e5                	mov    %esp,%ebp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801046c3:	9c                   	pushf  
801046c4:	59                   	pop    %ecx
}

static inline void
cli(void)
{
  asm volatile("cli");
801046c5:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
801046c6:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
801046cd:	8b 82 ac 00 00 00    	mov    0xac(%edx),%eax
801046d3:	85 c0                	test   %eax,%eax
801046d5:	75 0c                	jne    801046e3 <pushcli+0x23>
    cpu->intena = eflags & FL_IF;
801046d7:	81 e1 00 02 00 00    	and    $0x200,%ecx
801046dd:	89 8a b0 00 00 00    	mov    %ecx,0xb0(%edx)
  cpu->ncli += 1;
801046e3:	83 c0 01             	add    $0x1,%eax
801046e6:	89 82 ac 00 00 00    	mov    %eax,0xac(%edx)
}
801046ec:	5d                   	pop    %ebp
801046ed:	c3                   	ret    
801046ee:	66 90                	xchg   %ax,%ax

801046f0 <popcli>:

void
popcli(void)
{
801046f0:	55                   	push   %ebp
801046f1:	89 e5                	mov    %esp,%ebp
801046f3:	83 ec 08             	sub    $0x8,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801046f6:	9c                   	pushf  
801046f7:	58                   	pop    %eax
  if(readeflags()&FL_IF)
801046f8:	f6 c4 02             	test   $0x2,%ah
801046fb:	75 2c                	jne    80104729 <popcli+0x39>
    panic("popcli - interruptible");
  if(--cpu->ncli < 0)
801046fd:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104704:	83 aa ac 00 00 00 01 	subl   $0x1,0xac(%edx)
8010470b:	78 0f                	js     8010471c <popcli+0x2c>
    panic("popcli");
  if(cpu->ncli == 0 && cpu->intena)
8010470d:	75 0b                	jne    8010471a <popcli+0x2a>
8010470f:	8b 82 b0 00 00 00    	mov    0xb0(%edx),%eax
80104715:	85 c0                	test   %eax,%eax
80104717:	74 01                	je     8010471a <popcli+0x2a>
}

static inline void
sti(void)
{
  asm volatile("sti");
80104719:	fb                   	sti    
    sti();
}
8010471a:	c9                   	leave  
8010471b:	c3                   	ret    
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--cpu->ncli < 0)
    panic("popcli");
8010471c:	83 ec 0c             	sub    $0xc,%esp
8010471f:	68 c2 79 10 80       	push   $0x801079c2
80104724:	e8 47 bc ff ff       	call   80100370 <panic>

void
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
80104729:	83 ec 0c             	sub    $0xc,%esp
8010472c:	68 ab 79 10 80       	push   $0x801079ab
80104731:	e8 3a bc ff ff       	call   80100370 <panic>
80104736:	8d 76 00             	lea    0x0(%esi),%esi
80104739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104740 <release>:
}

// Release the lock.
void
release(struct spinlock *lk)
{
80104740:	55                   	push   %ebp
80104741:	89 e5                	mov    %esp,%ebp
80104743:	83 ec 08             	sub    $0x8,%esp
80104746:	8b 45 08             	mov    0x8(%ebp),%eax

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
80104749:	8b 10                	mov    (%eax),%edx
8010474b:	85 d2                	test   %edx,%edx
8010474d:	74 0c                	je     8010475b <release+0x1b>
8010474f:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104756:	39 50 08             	cmp    %edx,0x8(%eax)
80104759:	74 15                	je     80104770 <release+0x30>
// Release the lock.
void
release(struct spinlock *lk)
{
  if(!holding(lk))
    panic("release");
8010475b:	83 ec 0c             	sub    $0xc,%esp
8010475e:	68 c9 79 10 80       	push   $0x801079c9
80104763:	e8 08 bc ff ff       	call   80100370 <panic>
80104768:	90                   	nop
80104769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  lk->pcs[0] = 0;
80104770:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  lk->cpu = 0;
80104777:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();
8010477e:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
80104783:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  popcli();
}
80104789:	c9                   	leave  
  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );

  popcli();
8010478a:	e9 61 ff ff ff       	jmp    801046f0 <popcli>
8010478f:	90                   	nop

80104790 <memset>:
80104790:	55                   	push   %ebp
80104791:	89 e5                	mov    %esp,%ebp
80104793:	57                   	push   %edi
80104794:	53                   	push   %ebx
80104795:	8b 55 08             	mov    0x8(%ebp),%edx
80104798:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010479b:	f6 c2 03             	test   $0x3,%dl
8010479e:	75 05                	jne    801047a5 <memset+0x15>
801047a0:	f6 c1 03             	test   $0x3,%cl
801047a3:	74 13                	je     801047b8 <memset+0x28>
801047a5:	89 d7                	mov    %edx,%edi
801047a7:	8b 45 0c             	mov    0xc(%ebp),%eax
801047aa:	fc                   	cld    
801047ab:	f3 aa                	rep stos %al,%es:(%edi)
801047ad:	5b                   	pop    %ebx
801047ae:	89 d0                	mov    %edx,%eax
801047b0:	5f                   	pop    %edi
801047b1:	5d                   	pop    %ebp
801047b2:	c3                   	ret    
801047b3:	90                   	nop
801047b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801047b8:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
801047bc:	c1 e9 02             	shr    $0x2,%ecx
801047bf:	89 fb                	mov    %edi,%ebx
801047c1:	89 f8                	mov    %edi,%eax
801047c3:	c1 e3 18             	shl    $0x18,%ebx
801047c6:	c1 e0 10             	shl    $0x10,%eax
801047c9:	09 d8                	or     %ebx,%eax
801047cb:	09 f8                	or     %edi,%eax
801047cd:	c1 e7 08             	shl    $0x8,%edi
801047d0:	09 f8                	or     %edi,%eax
801047d2:	89 d7                	mov    %edx,%edi
801047d4:	fc                   	cld    
801047d5:	f3 ab                	rep stos %eax,%es:(%edi)
801047d7:	5b                   	pop    %ebx
801047d8:	89 d0                	mov    %edx,%eax
801047da:	5f                   	pop    %edi
801047db:	5d                   	pop    %ebp
801047dc:	c3                   	ret    
801047dd:	8d 76 00             	lea    0x0(%esi),%esi

801047e0 <memcmp>:
801047e0:	55                   	push   %ebp
801047e1:	89 e5                	mov    %esp,%ebp
801047e3:	57                   	push   %edi
801047e4:	56                   	push   %esi
801047e5:	8b 45 10             	mov    0x10(%ebp),%eax
801047e8:	53                   	push   %ebx
801047e9:	8b 75 0c             	mov    0xc(%ebp),%esi
801047ec:	8b 5d 08             	mov    0x8(%ebp),%ebx
801047ef:	85 c0                	test   %eax,%eax
801047f1:	74 29                	je     8010481c <memcmp+0x3c>
801047f3:	0f b6 13             	movzbl (%ebx),%edx
801047f6:	0f b6 0e             	movzbl (%esi),%ecx
801047f9:	38 d1                	cmp    %dl,%cl
801047fb:	75 2b                	jne    80104828 <memcmp+0x48>
801047fd:	8d 78 ff             	lea    -0x1(%eax),%edi
80104800:	31 c0                	xor    %eax,%eax
80104802:	eb 14                	jmp    80104818 <memcmp+0x38>
80104804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104808:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
8010480d:	83 c0 01             	add    $0x1,%eax
80104810:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
80104814:	38 ca                	cmp    %cl,%dl
80104816:	75 10                	jne    80104828 <memcmp+0x48>
80104818:	39 f8                	cmp    %edi,%eax
8010481a:	75 ec                	jne    80104808 <memcmp+0x28>
8010481c:	5b                   	pop    %ebx
8010481d:	31 c0                	xor    %eax,%eax
8010481f:	5e                   	pop    %esi
80104820:	5f                   	pop    %edi
80104821:	5d                   	pop    %ebp
80104822:	c3                   	ret    
80104823:	90                   	nop
80104824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104828:	0f b6 c2             	movzbl %dl,%eax
8010482b:	5b                   	pop    %ebx
8010482c:	29 c8                	sub    %ecx,%eax
8010482e:	5e                   	pop    %esi
8010482f:	5f                   	pop    %edi
80104830:	5d                   	pop    %ebp
80104831:	c3                   	ret    
80104832:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104840 <memmove>:
80104840:	55                   	push   %ebp
80104841:	89 e5                	mov    %esp,%ebp
80104843:	56                   	push   %esi
80104844:	53                   	push   %ebx
80104845:	8b 45 08             	mov    0x8(%ebp),%eax
80104848:	8b 75 0c             	mov    0xc(%ebp),%esi
8010484b:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010484e:	39 c6                	cmp    %eax,%esi
80104850:	73 2e                	jae    80104880 <memmove+0x40>
80104852:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
80104855:	39 c8                	cmp    %ecx,%eax
80104857:	73 27                	jae    80104880 <memmove+0x40>
80104859:	85 db                	test   %ebx,%ebx
8010485b:	8d 53 ff             	lea    -0x1(%ebx),%edx
8010485e:	74 17                	je     80104877 <memmove+0x37>
80104860:	29 d9                	sub    %ebx,%ecx
80104862:	89 cb                	mov    %ecx,%ebx
80104864:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104868:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
8010486c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
8010486f:	83 ea 01             	sub    $0x1,%edx
80104872:	83 fa ff             	cmp    $0xffffffff,%edx
80104875:	75 f1                	jne    80104868 <memmove+0x28>
80104877:	5b                   	pop    %ebx
80104878:	5e                   	pop    %esi
80104879:	5d                   	pop    %ebp
8010487a:	c3                   	ret    
8010487b:	90                   	nop
8010487c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104880:	31 d2                	xor    %edx,%edx
80104882:	85 db                	test   %ebx,%ebx
80104884:	74 f1                	je     80104877 <memmove+0x37>
80104886:	8d 76 00             	lea    0x0(%esi),%esi
80104889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104890:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104894:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104897:	83 c2 01             	add    $0x1,%edx
8010489a:	39 d3                	cmp    %edx,%ebx
8010489c:	75 f2                	jne    80104890 <memmove+0x50>
8010489e:	5b                   	pop    %ebx
8010489f:	5e                   	pop    %esi
801048a0:	5d                   	pop    %ebp
801048a1:	c3                   	ret    
801048a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801048a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801048b0 <memcpy>:
801048b0:	55                   	push   %ebp
801048b1:	89 e5                	mov    %esp,%ebp
801048b3:	5d                   	pop    %ebp
801048b4:	eb 8a                	jmp    80104840 <memmove>
801048b6:	8d 76 00             	lea    0x0(%esi),%esi
801048b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801048c0 <strncmp>:
801048c0:	55                   	push   %ebp
801048c1:	89 e5                	mov    %esp,%ebp
801048c3:	57                   	push   %edi
801048c4:	56                   	push   %esi
801048c5:	8b 4d 10             	mov    0x10(%ebp),%ecx
801048c8:	53                   	push   %ebx
801048c9:	8b 7d 08             	mov    0x8(%ebp),%edi
801048cc:	8b 75 0c             	mov    0xc(%ebp),%esi
801048cf:	85 c9                	test   %ecx,%ecx
801048d1:	74 37                	je     8010490a <strncmp+0x4a>
801048d3:	0f b6 17             	movzbl (%edi),%edx
801048d6:	0f b6 1e             	movzbl (%esi),%ebx
801048d9:	84 d2                	test   %dl,%dl
801048db:	74 3f                	je     8010491c <strncmp+0x5c>
801048dd:	38 d3                	cmp    %dl,%bl
801048df:	75 3b                	jne    8010491c <strncmp+0x5c>
801048e1:	8d 47 01             	lea    0x1(%edi),%eax
801048e4:	01 cf                	add    %ecx,%edi
801048e6:	eb 1b                	jmp    80104903 <strncmp+0x43>
801048e8:	90                   	nop
801048e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801048f0:	0f b6 10             	movzbl (%eax),%edx
801048f3:	84 d2                	test   %dl,%dl
801048f5:	74 21                	je     80104918 <strncmp+0x58>
801048f7:	0f b6 19             	movzbl (%ecx),%ebx
801048fa:	83 c0 01             	add    $0x1,%eax
801048fd:	89 ce                	mov    %ecx,%esi
801048ff:	38 da                	cmp    %bl,%dl
80104901:	75 19                	jne    8010491c <strncmp+0x5c>
80104903:	39 c7                	cmp    %eax,%edi
80104905:	8d 4e 01             	lea    0x1(%esi),%ecx
80104908:	75 e6                	jne    801048f0 <strncmp+0x30>
8010490a:	5b                   	pop    %ebx
8010490b:	31 c0                	xor    %eax,%eax
8010490d:	5e                   	pop    %esi
8010490e:	5f                   	pop    %edi
8010490f:	5d                   	pop    %ebp
80104910:	c3                   	ret    
80104911:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104918:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
8010491c:	0f b6 c2             	movzbl %dl,%eax
8010491f:	29 d8                	sub    %ebx,%eax
80104921:	5b                   	pop    %ebx
80104922:	5e                   	pop    %esi
80104923:	5f                   	pop    %edi
80104924:	5d                   	pop    %ebp
80104925:	c3                   	ret    
80104926:	8d 76 00             	lea    0x0(%esi),%esi
80104929:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104930 <strncpy>:
80104930:	55                   	push   %ebp
80104931:	89 e5                	mov    %esp,%ebp
80104933:	56                   	push   %esi
80104934:	53                   	push   %ebx
80104935:	8b 45 08             	mov    0x8(%ebp),%eax
80104938:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010493b:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010493e:	89 c2                	mov    %eax,%edx
80104940:	eb 19                	jmp    8010495b <strncpy+0x2b>
80104942:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104948:	83 c3 01             	add    $0x1,%ebx
8010494b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
8010494f:	83 c2 01             	add    $0x1,%edx
80104952:	84 c9                	test   %cl,%cl
80104954:	88 4a ff             	mov    %cl,-0x1(%edx)
80104957:	74 09                	je     80104962 <strncpy+0x32>
80104959:	89 f1                	mov    %esi,%ecx
8010495b:	85 c9                	test   %ecx,%ecx
8010495d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104960:	7f e6                	jg     80104948 <strncpy+0x18>
80104962:	31 c9                	xor    %ecx,%ecx
80104964:	85 f6                	test   %esi,%esi
80104966:	7e 17                	jle    8010497f <strncpy+0x4f>
80104968:	90                   	nop
80104969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104970:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104974:	89 f3                	mov    %esi,%ebx
80104976:	83 c1 01             	add    $0x1,%ecx
80104979:	29 cb                	sub    %ecx,%ebx
8010497b:	85 db                	test   %ebx,%ebx
8010497d:	7f f1                	jg     80104970 <strncpy+0x40>
8010497f:	5b                   	pop    %ebx
80104980:	5e                   	pop    %esi
80104981:	5d                   	pop    %ebp
80104982:	c3                   	ret    
80104983:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104990 <safestrcpy>:
80104990:	55                   	push   %ebp
80104991:	89 e5                	mov    %esp,%ebp
80104993:	56                   	push   %esi
80104994:	53                   	push   %ebx
80104995:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104998:	8b 45 08             	mov    0x8(%ebp),%eax
8010499b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010499e:	85 c9                	test   %ecx,%ecx
801049a0:	7e 26                	jle    801049c8 <safestrcpy+0x38>
801049a2:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
801049a6:	89 c1                	mov    %eax,%ecx
801049a8:	eb 17                	jmp    801049c1 <safestrcpy+0x31>
801049aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801049b0:	83 c2 01             	add    $0x1,%edx
801049b3:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
801049b7:	83 c1 01             	add    $0x1,%ecx
801049ba:	84 db                	test   %bl,%bl
801049bc:	88 59 ff             	mov    %bl,-0x1(%ecx)
801049bf:	74 04                	je     801049c5 <safestrcpy+0x35>
801049c1:	39 f2                	cmp    %esi,%edx
801049c3:	75 eb                	jne    801049b0 <safestrcpy+0x20>
801049c5:	c6 01 00             	movb   $0x0,(%ecx)
801049c8:	5b                   	pop    %ebx
801049c9:	5e                   	pop    %esi
801049ca:	5d                   	pop    %ebp
801049cb:	c3                   	ret    
801049cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801049d0 <strlen>:
801049d0:	55                   	push   %ebp
801049d1:	31 c0                	xor    %eax,%eax
801049d3:	89 e5                	mov    %esp,%ebp
801049d5:	8b 55 08             	mov    0x8(%ebp),%edx
801049d8:	80 3a 00             	cmpb   $0x0,(%edx)
801049db:	74 0c                	je     801049e9 <strlen+0x19>
801049dd:	8d 76 00             	lea    0x0(%esi),%esi
801049e0:	83 c0 01             	add    $0x1,%eax
801049e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
801049e7:	75 f7                	jne    801049e0 <strlen+0x10>
801049e9:	5d                   	pop    %ebp
801049ea:	c3                   	ret    

801049eb <swtch>:
801049eb:	8b 44 24 04          	mov    0x4(%esp),%eax
801049ef:	8b 54 24 08          	mov    0x8(%esp),%edx
801049f3:	55                   	push   %ebp
801049f4:	53                   	push   %ebx
801049f5:	56                   	push   %esi
801049f6:	57                   	push   %edi
801049f7:	89 20                	mov    %esp,(%eax)
801049f9:	89 d4                	mov    %edx,%esp
801049fb:	5f                   	pop    %edi
801049fc:	5e                   	pop    %esi
801049fd:	5b                   	pop    %ebx
801049fe:	5d                   	pop    %ebp
801049ff:	c3                   	ret    

80104a00 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104a00:	55                   	push   %ebp
  if(addr >= proc->sz || addr+4 > proc->sz)
80104a01:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104a08:	89 e5                	mov    %esp,%ebp
80104a0a:	8b 45 08             	mov    0x8(%ebp),%eax
  if(addr >= proc->sz || addr+4 > proc->sz)
80104a0d:	8b 12                	mov    (%edx),%edx
80104a0f:	39 c2                	cmp    %eax,%edx
80104a11:	76 15                	jbe    80104a28 <fetchint+0x28>
80104a13:	8d 48 04             	lea    0x4(%eax),%ecx
80104a16:	39 ca                	cmp    %ecx,%edx
80104a18:	72 0e                	jb     80104a28 <fetchint+0x28>
    return -1;
  *ip = *(int*)(addr);
80104a1a:	8b 10                	mov    (%eax),%edx
80104a1c:	8b 45 0c             	mov    0xc(%ebp),%eax
80104a1f:	89 10                	mov    %edx,(%eax)
  return 0;
80104a21:	31 c0                	xor    %eax,%eax
}
80104a23:	5d                   	pop    %ebp
80104a24:	c3                   	ret    
80104a25:	8d 76 00             	lea    0x0(%esi),%esi
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
80104a28:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  *ip = *(int*)(addr);
  return 0;
}
80104a2d:	5d                   	pop    %ebp
80104a2e:	c3                   	ret    
80104a2f:	90                   	nop

80104a30 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104a30:	55                   	push   %ebp
  char *s, *ep;

  if(addr >= proc->sz)
80104a31:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104a37:	89 e5                	mov    %esp,%ebp
80104a39:	8b 4d 08             	mov    0x8(%ebp),%ecx
  char *s, *ep;

  if(addr >= proc->sz)
80104a3c:	39 08                	cmp    %ecx,(%eax)
80104a3e:	76 2c                	jbe    80104a6c <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
80104a40:	8b 55 0c             	mov    0xc(%ebp),%edx
80104a43:	89 c8                	mov    %ecx,%eax
80104a45:	89 0a                	mov    %ecx,(%edx)
  ep = (char*)proc->sz;
80104a47:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104a4e:	8b 12                	mov    (%edx),%edx
  for(s = *pp; s < ep; s++)
80104a50:	39 d1                	cmp    %edx,%ecx
80104a52:	73 18                	jae    80104a6c <fetchstr+0x3c>
    if(*s == 0)
80104a54:	80 39 00             	cmpb   $0x0,(%ecx)
80104a57:	75 0c                	jne    80104a65 <fetchstr+0x35>
80104a59:	eb 1d                	jmp    80104a78 <fetchstr+0x48>
80104a5b:	90                   	nop
80104a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104a60:	80 38 00             	cmpb   $0x0,(%eax)
80104a63:	74 13                	je     80104a78 <fetchstr+0x48>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
80104a65:	83 c0 01             	add    $0x1,%eax
80104a68:	39 c2                	cmp    %eax,%edx
80104a6a:	77 f4                	ja     80104a60 <fetchstr+0x30>
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= proc->sz)
    return -1;
80104a6c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
    if(*s == 0)
      return s - *pp;
  return -1;
}
80104a71:	5d                   	pop    %ebp
80104a72:	c3                   	ret    
80104a73:	90                   	nop
80104a74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
    if(*s == 0)
      return s - *pp;
80104a78:	29 c8                	sub    %ecx,%eax
  return -1;
}
80104a7a:	5d                   	pop    %ebp
80104a7b:	c3                   	ret    
80104a7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104a80 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104a80:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
}

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104a87:	55                   	push   %ebp
80104a88:	89 e5                	mov    %esp,%ebp
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104a8a:	8b 42 18             	mov    0x18(%edx),%eax
80104a8d:	8b 4d 08             	mov    0x8(%ebp),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104a90:	8b 12                	mov    (%edx),%edx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104a92:	8b 40 44             	mov    0x44(%eax),%eax
80104a95:	8d 04 88             	lea    (%eax,%ecx,4),%eax
80104a98:	8d 48 04             	lea    0x4(%eax),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104a9b:	39 d1                	cmp    %edx,%ecx
80104a9d:	73 19                	jae    80104ab8 <argint+0x38>
80104a9f:	8d 48 08             	lea    0x8(%eax),%ecx
80104aa2:	39 ca                	cmp    %ecx,%edx
80104aa4:	72 12                	jb     80104ab8 <argint+0x38>
    return -1;
  *ip = *(int*)(addr);
80104aa6:	8b 50 04             	mov    0x4(%eax),%edx
80104aa9:	8b 45 0c             	mov    0xc(%ebp),%eax
80104aac:	89 10                	mov    %edx,(%eax)
  return 0;
80104aae:	31 c0                	xor    %eax,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
}
80104ab0:	5d                   	pop    %ebp
80104ab1:	c3                   	ret    
80104ab2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
80104ab8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
}
80104abd:	5d                   	pop    %ebp
80104abe:	c3                   	ret    
80104abf:	90                   	nop

80104ac0 <argptr>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104ac0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104ac6:	55                   	push   %ebp
80104ac7:	89 e5                	mov    %esp,%ebp
80104ac9:	56                   	push   %esi
80104aca:	53                   	push   %ebx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104acb:	8b 48 18             	mov    0x18(%eax),%ecx
80104ace:	8b 5d 08             	mov    0x8(%ebp),%ebx
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104ad1:	8b 55 10             	mov    0x10(%ebp),%edx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104ad4:	8b 49 44             	mov    0x44(%ecx),%ecx
80104ad7:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104ada:	8b 08                	mov    (%eax),%ecx
argptr(int n, char **pp, int size)
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
80104adc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104ae1:	8d 73 04             	lea    0x4(%ebx),%esi

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104ae4:	39 ce                	cmp    %ecx,%esi
80104ae6:	73 1f                	jae    80104b07 <argptr+0x47>
80104ae8:	8d 73 08             	lea    0x8(%ebx),%esi
80104aeb:	39 f1                	cmp    %esi,%ecx
80104aed:	72 18                	jb     80104b07 <argptr+0x47>
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= proc->sz || (uint)i+size > proc->sz)
80104aef:	85 d2                	test   %edx,%edx
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
  *ip = *(int*)(addr);
80104af1:	8b 5b 04             	mov    0x4(%ebx),%ebx
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= proc->sz || (uint)i+size > proc->sz)
80104af4:	78 11                	js     80104b07 <argptr+0x47>
80104af6:	39 cb                	cmp    %ecx,%ebx
80104af8:	73 0d                	jae    80104b07 <argptr+0x47>
80104afa:	01 da                	add    %ebx,%edx
80104afc:	39 ca                	cmp    %ecx,%edx
80104afe:	77 07                	ja     80104b07 <argptr+0x47>
    return -1;
  *pp = (char*)i;
80104b00:	8b 45 0c             	mov    0xc(%ebp),%eax
80104b03:	89 18                	mov    %ebx,(%eax)
  return 0;
80104b05:	31 c0                	xor    %eax,%eax
}
80104b07:	5b                   	pop    %ebx
80104b08:	5e                   	pop    %esi
80104b09:	5d                   	pop    %ebp
80104b0a:	c3                   	ret    
80104b0b:	90                   	nop
80104b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104b10 <argstr>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104b10:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104b16:	55                   	push   %ebp
80104b17:	89 e5                	mov    %esp,%ebp

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104b19:	8b 50 18             	mov    0x18(%eax),%edx
80104b1c:	8b 4d 08             	mov    0x8(%ebp),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104b1f:	8b 00                	mov    (%eax),%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104b21:	8b 52 44             	mov    0x44(%edx),%edx
80104b24:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
80104b27:	8d 4a 04             	lea    0x4(%edx),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104b2a:	39 c1                	cmp    %eax,%ecx
80104b2c:	73 07                	jae    80104b35 <argstr+0x25>
80104b2e:	8d 4a 08             	lea    0x8(%edx),%ecx
80104b31:	39 c8                	cmp    %ecx,%eax
80104b33:	73 0b                	jae    80104b40 <argstr+0x30>
int
argstr(int n, char **pp)
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
80104b35:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchstr(addr, pp);
}
80104b3a:	5d                   	pop    %ebp
80104b3b:	c3                   	ret    
80104b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
  *ip = *(int*)(addr);
80104b40:	8b 4a 04             	mov    0x4(%edx),%ecx
int
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= proc->sz)
80104b43:	39 c1                	cmp    %eax,%ecx
80104b45:	73 ee                	jae    80104b35 <argstr+0x25>
    return -1;
  *pp = (char*)addr;
80104b47:	8b 55 0c             	mov    0xc(%ebp),%edx
80104b4a:	89 c8                	mov    %ecx,%eax
80104b4c:	89 0a                	mov    %ecx,(%edx)
  ep = (char*)proc->sz;
80104b4e:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104b55:	8b 12                	mov    (%edx),%edx
  for(s = *pp; s < ep; s++)
80104b57:	39 d1                	cmp    %edx,%ecx
80104b59:	73 da                	jae    80104b35 <argstr+0x25>
    if(*s == 0)
80104b5b:	80 39 00             	cmpb   $0x0,(%ecx)
80104b5e:	75 0d                	jne    80104b6d <argstr+0x5d>
80104b60:	eb 1e                	jmp    80104b80 <argstr+0x70>
80104b62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104b68:	80 38 00             	cmpb   $0x0,(%eax)
80104b6b:	74 13                	je     80104b80 <argstr+0x70>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
80104b6d:	83 c0 01             	add    $0x1,%eax
80104b70:	39 c2                	cmp    %eax,%edx
80104b72:	77 f4                	ja     80104b68 <argstr+0x58>
80104b74:	eb bf                	jmp    80104b35 <argstr+0x25>
80104b76:	8d 76 00             	lea    0x0(%esi),%esi
80104b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(*s == 0)
      return s - *pp;
80104b80:	29 c8                	sub    %ecx,%eax
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
  return fetchstr(addr, pp);
}
80104b82:	5d                   	pop    %ebp
80104b83:	c3                   	ret    
80104b84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104b8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104b90 <syscall>:
[SYS_cht]     sys_cht,
};

void
syscall(void)
{
80104b90:	55                   	push   %ebp
80104b91:	89 e5                	mov    %esp,%ebp
80104b93:	53                   	push   %ebx
80104b94:	83 ec 04             	sub    $0x4,%esp
  int num;

  num = proc->tf->eax;
80104b97:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104b9e:	8b 5a 18             	mov    0x18(%edx),%ebx
80104ba1:	8b 43 1c             	mov    0x1c(%ebx),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104ba4:	8d 48 ff             	lea    -0x1(%eax),%ecx
80104ba7:	83 f9 16             	cmp    $0x16,%ecx
80104baa:	77 1c                	ja     80104bc8 <syscall+0x38>
80104bac:	8b 0c 85 00 7a 10 80 	mov    -0x7fef8600(,%eax,4),%ecx
80104bb3:	85 c9                	test   %ecx,%ecx
80104bb5:	74 11                	je     80104bc8 <syscall+0x38>
    proc->tf->eax = syscalls[num]();
80104bb7:	ff d1                	call   *%ecx
80104bb9:	89 43 1c             	mov    %eax,0x1c(%ebx)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
  }
}
80104bbc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104bbf:	c9                   	leave  
80104bc0:	c3                   	ret    
80104bc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104bc8:	50                   	push   %eax
            proc->pid, proc->name, num);
80104bc9:	8d 42 6c             	lea    0x6c(%edx),%eax

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104bcc:	50                   	push   %eax
80104bcd:	ff 72 10             	pushl  0x10(%edx)
80104bd0:	68 d1 79 10 80       	push   $0x801079d1
80104bd5:	e8 86 ba ff ff       	call   80100660 <cprintf>
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
80104bda:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104be0:	83 c4 10             	add    $0x10,%esp
80104be3:	8b 40 18             	mov    0x18(%eax),%eax
80104be6:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
}
80104bed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104bf0:	c9                   	leave  
80104bf1:	c3                   	ret    
80104bf2:	66 90                	xchg   %ax,%ax
80104bf4:	66 90                	xchg   %ax,%ax
80104bf6:	66 90                	xchg   %ax,%ax
80104bf8:	66 90                	xchg   %ax,%ax
80104bfa:	66 90                	xchg   %ax,%ax
80104bfc:	66 90                	xchg   %ax,%ax
80104bfe:	66 90                	xchg   %ax,%ax

80104c00 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104c00:	55                   	push   %ebp
80104c01:	89 e5                	mov    %esp,%ebp
80104c03:	57                   	push   %edi
80104c04:	56                   	push   %esi
80104c05:	53                   	push   %ebx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104c06:	8d 75 da             	lea    -0x26(%ebp),%esi
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104c09:	83 ec 44             	sub    $0x44,%esp
80104c0c:	89 4d c0             	mov    %ecx,-0x40(%ebp)
80104c0f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104c12:	56                   	push   %esi
80104c13:	50                   	push   %eax
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104c14:	89 55 c4             	mov    %edx,-0x3c(%ebp)
80104c17:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104c1a:	e8 91 d2 ff ff       	call   80101eb0 <nameiparent>
80104c1f:	83 c4 10             	add    $0x10,%esp
80104c22:	85 c0                	test   %eax,%eax
80104c24:	0f 84 f6 00 00 00    	je     80104d20 <create+0x120>
    return 0;
  ilock(dp);
80104c2a:	83 ec 0c             	sub    $0xc,%esp
80104c2d:	89 c7                	mov    %eax,%edi
80104c2f:	50                   	push   %eax
80104c30:	e8 2b ca ff ff       	call   80101660 <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
80104c35:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104c38:	83 c4 0c             	add    $0xc,%esp
80104c3b:	50                   	push   %eax
80104c3c:	56                   	push   %esi
80104c3d:	57                   	push   %edi
80104c3e:	e8 2d cf ff ff       	call   80101b70 <dirlookup>
80104c43:	83 c4 10             	add    $0x10,%esp
80104c46:	85 c0                	test   %eax,%eax
80104c48:	89 c3                	mov    %eax,%ebx
80104c4a:	74 54                	je     80104ca0 <create+0xa0>
    iunlockput(dp);
80104c4c:	83 ec 0c             	sub    $0xc,%esp
80104c4f:	57                   	push   %edi
80104c50:	e8 7b cc ff ff       	call   801018d0 <iunlockput>
    ilock(ip);
80104c55:	89 1c 24             	mov    %ebx,(%esp)
80104c58:	e8 03 ca ff ff       	call   80101660 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80104c5d:	83 c4 10             	add    $0x10,%esp
80104c60:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104c65:	75 19                	jne    80104c80 <create+0x80>
80104c67:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
80104c6c:	89 d8                	mov    %ebx,%eax
80104c6e:	75 10                	jne    80104c80 <create+0x80>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104c70:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104c73:	5b                   	pop    %ebx
80104c74:	5e                   	pop    %esi
80104c75:	5f                   	pop    %edi
80104c76:	5d                   	pop    %ebp
80104c77:	c3                   	ret    
80104c78:	90                   	nop
80104c79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if((ip = dirlookup(dp, name, &off)) != 0){
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
80104c80:	83 ec 0c             	sub    $0xc,%esp
80104c83:	53                   	push   %ebx
80104c84:	e8 47 cc ff ff       	call   801018d0 <iunlockput>
    return 0;
80104c89:	83 c4 10             	add    $0x10,%esp
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104c8c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
    return 0;
80104c8f:	31 c0                	xor    %eax,%eax
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104c91:	5b                   	pop    %ebx
80104c92:	5e                   	pop    %esi
80104c93:	5f                   	pop    %edi
80104c94:	5d                   	pop    %ebp
80104c95:	c3                   	ret    
80104c96:	8d 76 00             	lea    0x0(%esi),%esi
80104c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      return ip;
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
80104ca0:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104ca4:	83 ec 08             	sub    $0x8,%esp
80104ca7:	50                   	push   %eax
80104ca8:	ff 37                	pushl  (%edi)
80104caa:	e8 41 c8 ff ff       	call   801014f0 <ialloc>
80104caf:	83 c4 10             	add    $0x10,%esp
80104cb2:	85 c0                	test   %eax,%eax
80104cb4:	89 c3                	mov    %eax,%ebx
80104cb6:	0f 84 cc 00 00 00    	je     80104d88 <create+0x188>
    panic("create: ialloc");

  ilock(ip);
80104cbc:	83 ec 0c             	sub    $0xc,%esp
80104cbf:	50                   	push   %eax
80104cc0:	e8 9b c9 ff ff       	call   80101660 <ilock>
  ip->major = major;
80104cc5:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104cc9:	66 89 43 52          	mov    %ax,0x52(%ebx)
  ip->minor = minor;
80104ccd:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104cd1:	66 89 43 54          	mov    %ax,0x54(%ebx)
  ip->nlink = 1;
80104cd5:	b8 01 00 00 00       	mov    $0x1,%eax
80104cda:	66 89 43 56          	mov    %ax,0x56(%ebx)
  iupdate(ip);
80104cde:	89 1c 24             	mov    %ebx,(%esp)
80104ce1:	e8 ca c8 ff ff       	call   801015b0 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
80104ce6:	83 c4 10             	add    $0x10,%esp
80104ce9:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
80104cee:	74 40                	je     80104d30 <create+0x130>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
      panic("create dots");
  }

  if(dirlink(dp, name, ip->inum) < 0)
80104cf0:	83 ec 04             	sub    $0x4,%esp
80104cf3:	ff 73 04             	pushl  0x4(%ebx)
80104cf6:	56                   	push   %esi
80104cf7:	57                   	push   %edi
80104cf8:	e8 d3 d0 ff ff       	call   80101dd0 <dirlink>
80104cfd:	83 c4 10             	add    $0x10,%esp
80104d00:	85 c0                	test   %eax,%eax
80104d02:	78 77                	js     80104d7b <create+0x17b>
    panic("create: dirlink");

  iunlockput(dp);
80104d04:	83 ec 0c             	sub    $0xc,%esp
80104d07:	57                   	push   %edi
80104d08:	e8 c3 cb ff ff       	call   801018d0 <iunlockput>

  return ip;
80104d0d:	83 c4 10             	add    $0x10,%esp
}
80104d10:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
80104d13:	89 d8                	mov    %ebx,%eax
}
80104d15:	5b                   	pop    %ebx
80104d16:	5e                   	pop    %esi
80104d17:	5f                   	pop    %edi
80104d18:	5d                   	pop    %ebp
80104d19:	c3                   	ret    
80104d1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    return 0;
80104d20:	31 c0                	xor    %eax,%eax
80104d22:	e9 49 ff ff ff       	jmp    80104c70 <create+0x70>
80104d27:	89 f6                	mov    %esi,%esi
80104d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  ip->minor = minor;
  ip->nlink = 1;
  iupdate(ip);

  if(type == T_DIR){  // Create . and .. entries.
    dp->nlink++;  // for ".."
80104d30:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
    iupdate(dp);
80104d35:	83 ec 0c             	sub    $0xc,%esp
80104d38:	57                   	push   %edi
80104d39:	e8 72 c8 ff ff       	call   801015b0 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104d3e:	83 c4 0c             	add    $0xc,%esp
80104d41:	ff 73 04             	pushl  0x4(%ebx)
80104d44:	68 7c 7a 10 80       	push   $0x80107a7c
80104d49:	53                   	push   %ebx
80104d4a:	e8 81 d0 ff ff       	call   80101dd0 <dirlink>
80104d4f:	83 c4 10             	add    $0x10,%esp
80104d52:	85 c0                	test   %eax,%eax
80104d54:	78 18                	js     80104d6e <create+0x16e>
80104d56:	83 ec 04             	sub    $0x4,%esp
80104d59:	ff 77 04             	pushl  0x4(%edi)
80104d5c:	68 7b 7a 10 80       	push   $0x80107a7b
80104d61:	53                   	push   %ebx
80104d62:	e8 69 d0 ff ff       	call   80101dd0 <dirlink>
80104d67:	83 c4 10             	add    $0x10,%esp
80104d6a:	85 c0                	test   %eax,%eax
80104d6c:	79 82                	jns    80104cf0 <create+0xf0>
      panic("create dots");
80104d6e:	83 ec 0c             	sub    $0xc,%esp
80104d71:	68 6f 7a 10 80       	push   $0x80107a6f
80104d76:	e8 f5 b5 ff ff       	call   80100370 <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");
80104d7b:	83 ec 0c             	sub    $0xc,%esp
80104d7e:	68 7e 7a 10 80       	push   $0x80107a7e
80104d83:	e8 e8 b5 ff ff       	call   80100370 <panic>
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    panic("create: ialloc");
80104d88:	83 ec 0c             	sub    $0xc,%esp
80104d8b:	68 60 7a 10 80       	push   $0x80107a60
80104d90:	e8 db b5 ff ff       	call   80100370 <panic>
80104d95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104d99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104da0 <argfd.constprop.0>:
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104da0:	55                   	push   %ebp
80104da1:	89 e5                	mov    %esp,%ebp
80104da3:	56                   	push   %esi
80104da4:	53                   	push   %ebx
80104da5:	89 c6                	mov    %eax,%esi
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104da7:	8d 45 f4             	lea    -0xc(%ebp),%eax
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104daa:	89 d3                	mov    %edx,%ebx
80104dac:	83 ec 18             	sub    $0x18,%esp
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104daf:	50                   	push   %eax
80104db0:	6a 00                	push   $0x0
80104db2:	e8 c9 fc ff ff       	call   80104a80 <argint>
80104db7:	83 c4 10             	add    $0x10,%esp
80104dba:	85 c0                	test   %eax,%eax
80104dbc:	78 3a                	js     80104df8 <argfd.constprop.0+0x58>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=proc->ofile[fd]) == 0)
80104dbe:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104dc1:	83 f8 0f             	cmp    $0xf,%eax
80104dc4:	77 32                	ja     80104df8 <argfd.constprop.0+0x58>
80104dc6:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104dcd:	8b 54 82 28          	mov    0x28(%edx,%eax,4),%edx
80104dd1:	85 d2                	test   %edx,%edx
80104dd3:	74 23                	je     80104df8 <argfd.constprop.0+0x58>
    return -1;
  if(pfd)
80104dd5:	85 f6                	test   %esi,%esi
80104dd7:	74 02                	je     80104ddb <argfd.constprop.0+0x3b>
    *pfd = fd;
80104dd9:	89 06                	mov    %eax,(%esi)
  if(pf)
80104ddb:	85 db                	test   %ebx,%ebx
80104ddd:	74 11                	je     80104df0 <argfd.constprop.0+0x50>
    *pf = f;
80104ddf:	89 13                	mov    %edx,(%ebx)
  return 0;
80104de1:	31 c0                	xor    %eax,%eax
}
80104de3:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104de6:	5b                   	pop    %ebx
80104de7:	5e                   	pop    %esi
80104de8:	5d                   	pop    %ebp
80104de9:	c3                   	ret    
80104dea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
80104df0:	31 c0                	xor    %eax,%eax
80104df2:	eb ef                	jmp    80104de3 <argfd.constprop.0+0x43>
80104df4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    return -1;
80104df8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104dfd:	eb e4                	jmp    80104de3 <argfd.constprop.0+0x43>
80104dff:	90                   	nop

80104e00 <sys_dup>:
  return -1;
}

int
sys_dup(void)
{
80104e00:	55                   	push   %ebp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104e01:	31 c0                	xor    %eax,%eax
  return -1;
}

int
sys_dup(void)
{
80104e03:	89 e5                	mov    %esp,%ebp
80104e05:	53                   	push   %ebx
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104e06:	8d 55 f4             	lea    -0xc(%ebp),%edx
  return -1;
}

int
sys_dup(void)
{
80104e09:	83 ec 14             	sub    $0x14,%esp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104e0c:	e8 8f ff ff ff       	call   80104da0 <argfd.constprop.0>
80104e11:	85 c0                	test   %eax,%eax
80104e13:	78 1b                	js     80104e30 <sys_dup+0x30>
    return -1;
  if((fd=fdalloc(f)) < 0)
80104e15:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104e18:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80104e1e:	31 db                	xor    %ebx,%ebx
    if(proc->ofile[fd] == 0){
80104e20:	8b 4c 98 28          	mov    0x28(%eax,%ebx,4),%ecx
80104e24:	85 c9                	test   %ecx,%ecx
80104e26:	74 18                	je     80104e40 <sys_dup+0x40>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80104e28:	83 c3 01             	add    $0x1,%ebx
80104e2b:	83 fb 10             	cmp    $0x10,%ebx
80104e2e:	75 f0                	jne    80104e20 <sys_dup+0x20>
{
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
80104e30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
80104e35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104e38:	c9                   	leave  
80104e39:	c3                   	ret    
80104e3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
80104e40:	83 ec 0c             	sub    $0xc,%esp
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80104e43:	89 54 98 28          	mov    %edx,0x28(%eax,%ebx,4)

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
80104e47:	52                   	push   %edx
80104e48:	e8 83 bf ff ff       	call   80100dd0 <filedup>
  return fd;
80104e4d:	89 d8                	mov    %ebx,%eax
80104e4f:	83 c4 10             	add    $0x10,%esp
}
80104e52:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104e55:	c9                   	leave  
80104e56:	c3                   	ret    
80104e57:	89 f6                	mov    %esi,%esi
80104e59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e60 <sys_read>:

int
sys_read(void)
{
80104e60:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104e61:	31 c0                	xor    %eax,%eax
  return fd;
}

int
sys_read(void)
{
80104e63:	89 e5                	mov    %esp,%ebp
80104e65:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104e68:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104e6b:	e8 30 ff ff ff       	call   80104da0 <argfd.constprop.0>
80104e70:	85 c0                	test   %eax,%eax
80104e72:	78 4c                	js     80104ec0 <sys_read+0x60>
80104e74:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104e77:	83 ec 08             	sub    $0x8,%esp
80104e7a:	50                   	push   %eax
80104e7b:	6a 02                	push   $0x2
80104e7d:	e8 fe fb ff ff       	call   80104a80 <argint>
80104e82:	83 c4 10             	add    $0x10,%esp
80104e85:	85 c0                	test   %eax,%eax
80104e87:	78 37                	js     80104ec0 <sys_read+0x60>
80104e89:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104e8c:	83 ec 04             	sub    $0x4,%esp
80104e8f:	ff 75 f0             	pushl  -0x10(%ebp)
80104e92:	50                   	push   %eax
80104e93:	6a 01                	push   $0x1
80104e95:	e8 26 fc ff ff       	call   80104ac0 <argptr>
80104e9a:	83 c4 10             	add    $0x10,%esp
80104e9d:	85 c0                	test   %eax,%eax
80104e9f:	78 1f                	js     80104ec0 <sys_read+0x60>
    return -1;
  return fileread(f, p, n);
80104ea1:	83 ec 04             	sub    $0x4,%esp
80104ea4:	ff 75 f0             	pushl  -0x10(%ebp)
80104ea7:	ff 75 f4             	pushl  -0xc(%ebp)
80104eaa:	ff 75 ec             	pushl  -0x14(%ebp)
80104ead:	e8 8e c0 ff ff       	call   80100f40 <fileread>
80104eb2:	83 c4 10             	add    $0x10,%esp
}
80104eb5:	c9                   	leave  
80104eb6:	c3                   	ret    
80104eb7:	89 f6                	mov    %esi,%esi
80104eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104ec0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fileread(f, p, n);
}
80104ec5:	c9                   	leave  
80104ec6:	c3                   	ret    
80104ec7:	89 f6                	mov    %esi,%esi
80104ec9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ed0 <sys_write>:

int
sys_write(void)
{
80104ed0:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104ed1:	31 c0                	xor    %eax,%eax
  return fileread(f, p, n);
}

int
sys_write(void)
{
80104ed3:	89 e5                	mov    %esp,%ebp
80104ed5:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104ed8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104edb:	e8 c0 fe ff ff       	call   80104da0 <argfd.constprop.0>
80104ee0:	85 c0                	test   %eax,%eax
80104ee2:	78 4c                	js     80104f30 <sys_write+0x60>
80104ee4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104ee7:	83 ec 08             	sub    $0x8,%esp
80104eea:	50                   	push   %eax
80104eeb:	6a 02                	push   $0x2
80104eed:	e8 8e fb ff ff       	call   80104a80 <argint>
80104ef2:	83 c4 10             	add    $0x10,%esp
80104ef5:	85 c0                	test   %eax,%eax
80104ef7:	78 37                	js     80104f30 <sys_write+0x60>
80104ef9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104efc:	83 ec 04             	sub    $0x4,%esp
80104eff:	ff 75 f0             	pushl  -0x10(%ebp)
80104f02:	50                   	push   %eax
80104f03:	6a 01                	push   $0x1
80104f05:	e8 b6 fb ff ff       	call   80104ac0 <argptr>
80104f0a:	83 c4 10             	add    $0x10,%esp
80104f0d:	85 c0                	test   %eax,%eax
80104f0f:	78 1f                	js     80104f30 <sys_write+0x60>
    return -1;
  return filewrite(f, p, n);
80104f11:	83 ec 04             	sub    $0x4,%esp
80104f14:	ff 75 f0             	pushl  -0x10(%ebp)
80104f17:	ff 75 f4             	pushl  -0xc(%ebp)
80104f1a:	ff 75 ec             	pushl  -0x14(%ebp)
80104f1d:	e8 ae c0 ff ff       	call   80100fd0 <filewrite>
80104f22:	83 c4 10             	add    $0x10,%esp
}
80104f25:	c9                   	leave  
80104f26:	c3                   	ret    
80104f27:	89 f6                	mov    %esi,%esi
80104f29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104f30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filewrite(f, p, n);
}
80104f35:	c9                   	leave  
80104f36:	c3                   	ret    
80104f37:	89 f6                	mov    %esi,%esi
80104f39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104f40 <sys_close>:

int
sys_close(void)
{
80104f40:	55                   	push   %ebp
80104f41:	89 e5                	mov    %esp,%ebp
80104f43:	83 ec 18             	sub    $0x18,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
80104f46:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104f49:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104f4c:	e8 4f fe ff ff       	call   80104da0 <argfd.constprop.0>
80104f51:	85 c0                	test   %eax,%eax
80104f53:	78 2b                	js     80104f80 <sys_close+0x40>
    return -1;
  proc->ofile[fd] = 0;
80104f55:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104f58:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  fileclose(f);
80104f5e:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
  proc->ofile[fd] = 0;
80104f61:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104f68:	00 
  fileclose(f);
80104f69:	ff 75 f4             	pushl  -0xc(%ebp)
80104f6c:	e8 af be ff ff       	call   80100e20 <fileclose>
  return 0;
80104f71:	83 c4 10             	add    $0x10,%esp
80104f74:	31 c0                	xor    %eax,%eax
}
80104f76:	c9                   	leave  
80104f77:	c3                   	ret    
80104f78:	90                   	nop
80104f79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
80104f80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  proc->ofile[fd] = 0;
  fileclose(f);
  return 0;
}
80104f85:	c9                   	leave  
80104f86:	c3                   	ret    
80104f87:	89 f6                	mov    %esi,%esi
80104f89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104f90 <sys_fstat>:

int
sys_fstat(void)
{
80104f90:	55                   	push   %ebp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104f91:	31 c0                	xor    %eax,%eax
  return 0;
}

int
sys_fstat(void)
{
80104f93:	89 e5                	mov    %esp,%ebp
80104f95:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104f98:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104f9b:	e8 00 fe ff ff       	call   80104da0 <argfd.constprop.0>
80104fa0:	85 c0                	test   %eax,%eax
80104fa2:	78 2c                	js     80104fd0 <sys_fstat+0x40>
80104fa4:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104fa7:	83 ec 04             	sub    $0x4,%esp
80104faa:	6a 14                	push   $0x14
80104fac:	50                   	push   %eax
80104fad:	6a 01                	push   $0x1
80104faf:	e8 0c fb ff ff       	call   80104ac0 <argptr>
80104fb4:	83 c4 10             	add    $0x10,%esp
80104fb7:	85 c0                	test   %eax,%eax
80104fb9:	78 15                	js     80104fd0 <sys_fstat+0x40>
    return -1;
  return filestat(f, st);
80104fbb:	83 ec 08             	sub    $0x8,%esp
80104fbe:	ff 75 f4             	pushl  -0xc(%ebp)
80104fc1:	ff 75 f0             	pushl  -0x10(%ebp)
80104fc4:	e8 27 bf ff ff       	call   80100ef0 <filestat>
80104fc9:	83 c4 10             	add    $0x10,%esp
}
80104fcc:	c9                   	leave  
80104fcd:	c3                   	ret    
80104fce:	66 90                	xchg   %ax,%ax
{
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
    return -1;
80104fd0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filestat(f, st);
}
80104fd5:	c9                   	leave  
80104fd6:	c3                   	ret    
80104fd7:	89 f6                	mov    %esi,%esi
80104fd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104fe0 <sys_link>:

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104fe0:	55                   	push   %ebp
80104fe1:	89 e5                	mov    %esp,%ebp
80104fe3:	57                   	push   %edi
80104fe4:	56                   	push   %esi
80104fe5:	53                   	push   %ebx
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104fe6:	8d 45 d4             	lea    -0x2c(%ebp),%eax
}

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104fe9:	83 ec 34             	sub    $0x34,%esp
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104fec:	50                   	push   %eax
80104fed:	6a 00                	push   $0x0
80104fef:	e8 1c fb ff ff       	call   80104b10 <argstr>
80104ff4:	83 c4 10             	add    $0x10,%esp
80104ff7:	85 c0                	test   %eax,%eax
80104ff9:	0f 88 fb 00 00 00    	js     801050fa <sys_link+0x11a>
80104fff:	8d 45 d0             	lea    -0x30(%ebp),%eax
80105002:	83 ec 08             	sub    $0x8,%esp
80105005:	50                   	push   %eax
80105006:	6a 01                	push   $0x1
80105008:	e8 03 fb ff ff       	call   80104b10 <argstr>
8010500d:	83 c4 10             	add    $0x10,%esp
80105010:	85 c0                	test   %eax,%eax
80105012:	0f 88 e2 00 00 00    	js     801050fa <sys_link+0x11a>
    return -1;

  begin_op();
80105018:	e8 73 db ff ff       	call   80102b90 <begin_op>
  if((ip = namei(old)) == 0){
8010501d:	83 ec 0c             	sub    $0xc,%esp
80105020:	ff 75 d4             	pushl  -0x2c(%ebp)
80105023:	e8 68 ce ff ff       	call   80101e90 <namei>
80105028:	83 c4 10             	add    $0x10,%esp
8010502b:	85 c0                	test   %eax,%eax
8010502d:	89 c3                	mov    %eax,%ebx
8010502f:	0f 84 f3 00 00 00    	je     80105128 <sys_link+0x148>
    end_op();
    return -1;
  }

  ilock(ip);
80105035:	83 ec 0c             	sub    $0xc,%esp
80105038:	50                   	push   %eax
80105039:	e8 22 c6 ff ff       	call   80101660 <ilock>
  if(ip->type == T_DIR){
8010503e:	83 c4 10             	add    $0x10,%esp
80105041:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105046:	0f 84 c4 00 00 00    	je     80105110 <sys_link+0x130>
    iunlockput(ip);
    end_op();
    return -1;
  }

  ip->nlink++;
8010504c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
80105051:	83 ec 0c             	sub    $0xc,%esp
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
80105054:	8d 7d da             	lea    -0x26(%ebp),%edi
    end_op();
    return -1;
  }

  ip->nlink++;
  iupdate(ip);
80105057:	53                   	push   %ebx
80105058:	e8 53 c5 ff ff       	call   801015b0 <iupdate>
  iunlock(ip);
8010505d:	89 1c 24             	mov    %ebx,(%esp)
80105060:	e8 db c6 ff ff       	call   80101740 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
80105065:	58                   	pop    %eax
80105066:	5a                   	pop    %edx
80105067:	57                   	push   %edi
80105068:	ff 75 d0             	pushl  -0x30(%ebp)
8010506b:	e8 40 ce ff ff       	call   80101eb0 <nameiparent>
80105070:	83 c4 10             	add    $0x10,%esp
80105073:	85 c0                	test   %eax,%eax
80105075:	89 c6                	mov    %eax,%esi
80105077:	74 5b                	je     801050d4 <sys_link+0xf4>
    goto bad;
  ilock(dp);
80105079:	83 ec 0c             	sub    $0xc,%esp
8010507c:	50                   	push   %eax
8010507d:	e8 de c5 ff ff       	call   80101660 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80105082:	83 c4 10             	add    $0x10,%esp
80105085:	8b 03                	mov    (%ebx),%eax
80105087:	39 06                	cmp    %eax,(%esi)
80105089:	75 3d                	jne    801050c8 <sys_link+0xe8>
8010508b:	83 ec 04             	sub    $0x4,%esp
8010508e:	ff 73 04             	pushl  0x4(%ebx)
80105091:	57                   	push   %edi
80105092:	56                   	push   %esi
80105093:	e8 38 cd ff ff       	call   80101dd0 <dirlink>
80105098:	83 c4 10             	add    $0x10,%esp
8010509b:	85 c0                	test   %eax,%eax
8010509d:	78 29                	js     801050c8 <sys_link+0xe8>
    iunlockput(dp);
    goto bad;
  }
  iunlockput(dp);
8010509f:	83 ec 0c             	sub    $0xc,%esp
801050a2:	56                   	push   %esi
801050a3:	e8 28 c8 ff ff       	call   801018d0 <iunlockput>
  iput(ip);
801050a8:	89 1c 24             	mov    %ebx,(%esp)
801050ab:	e8 e0 c6 ff ff       	call   80101790 <iput>

  end_op();
801050b0:	e8 4b db ff ff       	call   80102c00 <end_op>

  return 0;
801050b5:	83 c4 10             	add    $0x10,%esp
801050b8:	31 c0                	xor    %eax,%eax
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
}
801050ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
801050bd:	5b                   	pop    %ebx
801050be:	5e                   	pop    %esi
801050bf:	5f                   	pop    %edi
801050c0:	5d                   	pop    %ebp
801050c1:	c3                   	ret    
801050c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
  ilock(dp);
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    iunlockput(dp);
801050c8:	83 ec 0c             	sub    $0xc,%esp
801050cb:	56                   	push   %esi
801050cc:	e8 ff c7 ff ff       	call   801018d0 <iunlockput>
    goto bad;
801050d1:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  ilock(ip);
801050d4:	83 ec 0c             	sub    $0xc,%esp
801050d7:	53                   	push   %ebx
801050d8:	e8 83 c5 ff ff       	call   80101660 <ilock>
  ip->nlink--;
801050dd:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
801050e2:	89 1c 24             	mov    %ebx,(%esp)
801050e5:	e8 c6 c4 ff ff       	call   801015b0 <iupdate>
  iunlockput(ip);
801050ea:	89 1c 24             	mov    %ebx,(%esp)
801050ed:	e8 de c7 ff ff       	call   801018d0 <iunlockput>
  end_op();
801050f2:	e8 09 db ff ff       	call   80102c00 <end_op>
  return -1;
801050f7:	83 c4 10             	add    $0x10,%esp
}
801050fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
  ilock(ip);
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
801050fd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105102:	5b                   	pop    %ebx
80105103:	5e                   	pop    %esi
80105104:	5f                   	pop    %edi
80105105:	5d                   	pop    %ebp
80105106:	c3                   	ret    
80105107:	89 f6                	mov    %esi,%esi
80105109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
  }

  ilock(ip);
  if(ip->type == T_DIR){
    iunlockput(ip);
80105110:	83 ec 0c             	sub    $0xc,%esp
80105113:	53                   	push   %ebx
80105114:	e8 b7 c7 ff ff       	call   801018d0 <iunlockput>
    end_op();
80105119:	e8 e2 da ff ff       	call   80102c00 <end_op>
    return -1;
8010511e:	83 c4 10             	add    $0x10,%esp
80105121:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105126:	eb 92                	jmp    801050ba <sys_link+0xda>
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
    return -1;

  begin_op();
  if((ip = namei(old)) == 0){
    end_op();
80105128:	e8 d3 da ff ff       	call   80102c00 <end_op>
    return -1;
8010512d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105132:	eb 86                	jmp    801050ba <sys_link+0xda>
80105134:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010513a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105140 <sys_unlink>:
}

//PAGEBREAK!
int
sys_unlink(void)
{
80105140:	55                   	push   %ebp
80105141:	89 e5                	mov    %esp,%ebp
80105143:	57                   	push   %edi
80105144:	56                   	push   %esi
80105145:	53                   	push   %ebx
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80105146:	8d 45 c0             	lea    -0x40(%ebp),%eax
}

//PAGEBREAK!
int
sys_unlink(void)
{
80105149:	83 ec 54             	sub    $0x54,%esp
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
8010514c:	50                   	push   %eax
8010514d:	6a 00                	push   $0x0
8010514f:	e8 bc f9 ff ff       	call   80104b10 <argstr>
80105154:	83 c4 10             	add    $0x10,%esp
80105157:	85 c0                	test   %eax,%eax
80105159:	0f 88 82 01 00 00    	js     801052e1 <sys_unlink+0x1a1>
    return -1;

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
8010515f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
  uint off;

  if(argstr(0, &path) < 0)
    return -1;

  begin_op();
80105162:	e8 29 da ff ff       	call   80102b90 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80105167:	83 ec 08             	sub    $0x8,%esp
8010516a:	53                   	push   %ebx
8010516b:	ff 75 c0             	pushl  -0x40(%ebp)
8010516e:	e8 3d cd ff ff       	call   80101eb0 <nameiparent>
80105173:	83 c4 10             	add    $0x10,%esp
80105176:	85 c0                	test   %eax,%eax
80105178:	89 45 b4             	mov    %eax,-0x4c(%ebp)
8010517b:	0f 84 6a 01 00 00    	je     801052eb <sys_unlink+0x1ab>
    end_op();
    return -1;
  }

  ilock(dp);
80105181:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80105184:	83 ec 0c             	sub    $0xc,%esp
80105187:	56                   	push   %esi
80105188:	e8 d3 c4 ff ff       	call   80101660 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
8010518d:	58                   	pop    %eax
8010518e:	5a                   	pop    %edx
8010518f:	68 7c 7a 10 80       	push   $0x80107a7c
80105194:	53                   	push   %ebx
80105195:	e8 b6 c9 ff ff       	call   80101b50 <namecmp>
8010519a:	83 c4 10             	add    $0x10,%esp
8010519d:	85 c0                	test   %eax,%eax
8010519f:	0f 84 fc 00 00 00    	je     801052a1 <sys_unlink+0x161>
801051a5:	83 ec 08             	sub    $0x8,%esp
801051a8:	68 7b 7a 10 80       	push   $0x80107a7b
801051ad:	53                   	push   %ebx
801051ae:	e8 9d c9 ff ff       	call   80101b50 <namecmp>
801051b3:	83 c4 10             	add    $0x10,%esp
801051b6:	85 c0                	test   %eax,%eax
801051b8:	0f 84 e3 00 00 00    	je     801052a1 <sys_unlink+0x161>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
801051be:	8d 45 c4             	lea    -0x3c(%ebp),%eax
801051c1:	83 ec 04             	sub    $0x4,%esp
801051c4:	50                   	push   %eax
801051c5:	53                   	push   %ebx
801051c6:	56                   	push   %esi
801051c7:	e8 a4 c9 ff ff       	call   80101b70 <dirlookup>
801051cc:	83 c4 10             	add    $0x10,%esp
801051cf:	85 c0                	test   %eax,%eax
801051d1:	89 c3                	mov    %eax,%ebx
801051d3:	0f 84 c8 00 00 00    	je     801052a1 <sys_unlink+0x161>
    goto bad;
  ilock(ip);
801051d9:	83 ec 0c             	sub    $0xc,%esp
801051dc:	50                   	push   %eax
801051dd:	e8 7e c4 ff ff       	call   80101660 <ilock>

  if(ip->nlink < 1)
801051e2:	83 c4 10             	add    $0x10,%esp
801051e5:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801051ea:	0f 8e 24 01 00 00    	jle    80105314 <sys_unlink+0x1d4>
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
801051f0:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801051f5:	8d 75 d8             	lea    -0x28(%ebp),%esi
801051f8:	74 66                	je     80105260 <sys_unlink+0x120>
    iunlockput(ip);
    goto bad;
  }

  memset(&de, 0, sizeof(de));
801051fa:	83 ec 04             	sub    $0x4,%esp
801051fd:	6a 10                	push   $0x10
801051ff:	6a 00                	push   $0x0
80105201:	56                   	push   %esi
80105202:	e8 89 f5 ff ff       	call   80104790 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80105207:	6a 10                	push   $0x10
80105209:	ff 75 c4             	pushl  -0x3c(%ebp)
8010520c:	56                   	push   %esi
8010520d:	ff 75 b4             	pushl  -0x4c(%ebp)
80105210:	e8 0b c8 ff ff       	call   80101a20 <writei>
80105215:	83 c4 20             	add    $0x20,%esp
80105218:	83 f8 10             	cmp    $0x10,%eax
8010521b:	0f 85 e6 00 00 00    	jne    80105307 <sys_unlink+0x1c7>
    panic("unlink: writei");
  if(ip->type == T_DIR){
80105221:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105226:	0f 84 9c 00 00 00    	je     801052c8 <sys_unlink+0x188>
    dp->nlink--;
    iupdate(dp);
  }
  iunlockput(dp);
8010522c:	83 ec 0c             	sub    $0xc,%esp
8010522f:	ff 75 b4             	pushl  -0x4c(%ebp)
80105232:	e8 99 c6 ff ff       	call   801018d0 <iunlockput>

  ip->nlink--;
80105237:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
8010523c:	89 1c 24             	mov    %ebx,(%esp)
8010523f:	e8 6c c3 ff ff       	call   801015b0 <iupdate>
  iunlockput(ip);
80105244:	89 1c 24             	mov    %ebx,(%esp)
80105247:	e8 84 c6 ff ff       	call   801018d0 <iunlockput>

  end_op();
8010524c:	e8 af d9 ff ff       	call   80102c00 <end_op>

  return 0;
80105251:	83 c4 10             	add    $0x10,%esp
80105254:	31 c0                	xor    %eax,%eax

bad:
  iunlockput(dp);
  end_op();
  return -1;
}
80105256:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105259:	5b                   	pop    %ebx
8010525a:	5e                   	pop    %esi
8010525b:	5f                   	pop    %edi
8010525c:	5d                   	pop    %ebp
8010525d:	c3                   	ret    
8010525e:	66 90                	xchg   %ax,%ax
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80105260:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80105264:	76 94                	jbe    801051fa <sys_unlink+0xba>
80105266:	bf 20 00 00 00       	mov    $0x20,%edi
8010526b:	eb 0f                	jmp    8010527c <sys_unlink+0x13c>
8010526d:	8d 76 00             	lea    0x0(%esi),%esi
80105270:	83 c7 10             	add    $0x10,%edi
80105273:	3b 7b 58             	cmp    0x58(%ebx),%edi
80105276:	0f 83 7e ff ff ff    	jae    801051fa <sys_unlink+0xba>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
8010527c:	6a 10                	push   $0x10
8010527e:	57                   	push   %edi
8010527f:	56                   	push   %esi
80105280:	53                   	push   %ebx
80105281:	e8 9a c6 ff ff       	call   80101920 <readi>
80105286:	83 c4 10             	add    $0x10,%esp
80105289:	83 f8 10             	cmp    $0x10,%eax
8010528c:	75 6c                	jne    801052fa <sys_unlink+0x1ba>
      panic("isdirempty: readi");
    if(de.inum != 0)
8010528e:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105293:	74 db                	je     80105270 <sys_unlink+0x130>
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
    iunlockput(ip);
80105295:	83 ec 0c             	sub    $0xc,%esp
80105298:	53                   	push   %ebx
80105299:	e8 32 c6 ff ff       	call   801018d0 <iunlockput>
    goto bad;
8010529e:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  iunlockput(dp);
801052a1:	83 ec 0c             	sub    $0xc,%esp
801052a4:	ff 75 b4             	pushl  -0x4c(%ebp)
801052a7:	e8 24 c6 ff ff       	call   801018d0 <iunlockput>
  end_op();
801052ac:	e8 4f d9 ff ff       	call   80102c00 <end_op>
  return -1;
801052b1:	83 c4 10             	add    $0x10,%esp
}
801052b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;

bad:
  iunlockput(dp);
  end_op();
  return -1;
801052b7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801052bc:	5b                   	pop    %ebx
801052bd:	5e                   	pop    %esi
801052be:	5f                   	pop    %edi
801052bf:	5d                   	pop    %ebp
801052c0:	c3                   	ret    
801052c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
801052c8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    iupdate(dp);
801052cb:	83 ec 0c             	sub    $0xc,%esp

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
801052ce:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
801052d3:	50                   	push   %eax
801052d4:	e8 d7 c2 ff ff       	call   801015b0 <iupdate>
801052d9:	83 c4 10             	add    $0x10,%esp
801052dc:	e9 4b ff ff ff       	jmp    8010522c <sys_unlink+0xec>
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
    return -1;
801052e1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801052e6:	e9 6b ff ff ff       	jmp    80105256 <sys_unlink+0x116>

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
    end_op();
801052eb:	e8 10 d9 ff ff       	call   80102c00 <end_op>
    return -1;
801052f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801052f5:	e9 5c ff ff ff       	jmp    80105256 <sys_unlink+0x116>
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
801052fa:	83 ec 0c             	sub    $0xc,%esp
801052fd:	68 a0 7a 10 80       	push   $0x80107aa0
80105302:	e8 69 b0 ff ff       	call   80100370 <panic>
    goto bad;
  }

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
80105307:	83 ec 0c             	sub    $0xc,%esp
8010530a:	68 b2 7a 10 80       	push   $0x80107ab2
8010530f:	e8 5c b0 ff ff       	call   80100370 <panic>
  if((ip = dirlookup(dp, name, &off)) == 0)
    goto bad;
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
80105314:	83 ec 0c             	sub    $0xc,%esp
80105317:	68 8e 7a 10 80       	push   $0x80107a8e
8010531c:	e8 4f b0 ff ff       	call   80100370 <panic>
80105321:	eb 0d                	jmp    80105330 <sys_open>
80105323:	90                   	nop
80105324:	90                   	nop
80105325:	90                   	nop
80105326:	90                   	nop
80105327:	90                   	nop
80105328:	90                   	nop
80105329:	90                   	nop
8010532a:	90                   	nop
8010532b:	90                   	nop
8010532c:	90                   	nop
8010532d:	90                   	nop
8010532e:	90                   	nop
8010532f:	90                   	nop

80105330 <sys_open>:
  return ip;
}

int
sys_open(void)
{
80105330:	55                   	push   %ebp
80105331:	89 e5                	mov    %esp,%ebp
80105333:	57                   	push   %edi
80105334:	56                   	push   %esi
80105335:	53                   	push   %ebx
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80105336:	8d 45 e0             	lea    -0x20(%ebp),%eax
  return ip;
}

int
sys_open(void)
{
80105339:	83 ec 24             	sub    $0x24,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
8010533c:	50                   	push   %eax
8010533d:	6a 00                	push   $0x0
8010533f:	e8 cc f7 ff ff       	call   80104b10 <argstr>
80105344:	83 c4 10             	add    $0x10,%esp
80105347:	85 c0                	test   %eax,%eax
80105349:	0f 88 9e 00 00 00    	js     801053ed <sys_open+0xbd>
8010534f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105352:	83 ec 08             	sub    $0x8,%esp
80105355:	50                   	push   %eax
80105356:	6a 01                	push   $0x1
80105358:	e8 23 f7 ff ff       	call   80104a80 <argint>
8010535d:	83 c4 10             	add    $0x10,%esp
80105360:	85 c0                	test   %eax,%eax
80105362:	0f 88 85 00 00 00    	js     801053ed <sys_open+0xbd>
    return -1;

  begin_op();
80105368:	e8 23 d8 ff ff       	call   80102b90 <begin_op>

  if(omode & O_CREATE){
8010536d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105371:	0f 85 89 00 00 00    	jne    80105400 <sys_open+0xd0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
80105377:	83 ec 0c             	sub    $0xc,%esp
8010537a:	ff 75 e0             	pushl  -0x20(%ebp)
8010537d:	e8 0e cb ff ff       	call   80101e90 <namei>
80105382:	83 c4 10             	add    $0x10,%esp
80105385:	85 c0                	test   %eax,%eax
80105387:	89 c7                	mov    %eax,%edi
80105389:	0f 84 8e 00 00 00    	je     8010541d <sys_open+0xed>
      end_op();
      return -1;
    }
    ilock(ip);
8010538f:	83 ec 0c             	sub    $0xc,%esp
80105392:	50                   	push   %eax
80105393:	e8 c8 c2 ff ff       	call   80101660 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80105398:	83 c4 10             	add    $0x10,%esp
8010539b:	66 83 7f 50 01       	cmpw   $0x1,0x50(%edi)
801053a0:	0f 84 d2 00 00 00    	je     80105478 <sys_open+0x148>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
801053a6:	e8 b5 b9 ff ff       	call   80100d60 <filealloc>
801053ab:	85 c0                	test   %eax,%eax
801053ad:	89 c6                	mov    %eax,%esi
801053af:	74 2b                	je     801053dc <sys_open+0xac>
801053b1:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801053b8:	31 db                	xor    %ebx,%ebx
801053ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
801053c0:	8b 44 9a 28          	mov    0x28(%edx,%ebx,4),%eax
801053c4:	85 c0                	test   %eax,%eax
801053c6:	74 68                	je     80105430 <sys_open+0x100>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
801053c8:	83 c3 01             	add    $0x1,%ebx
801053cb:	83 fb 10             	cmp    $0x10,%ebx
801053ce:	75 f0                	jne    801053c0 <sys_open+0x90>
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
801053d0:	83 ec 0c             	sub    $0xc,%esp
801053d3:	56                   	push   %esi
801053d4:	e8 47 ba ff ff       	call   80100e20 <fileclose>
801053d9:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
801053dc:	83 ec 0c             	sub    $0xc,%esp
801053df:	57                   	push   %edi
801053e0:	e8 eb c4 ff ff       	call   801018d0 <iunlockput>
    end_op();
801053e5:	e8 16 d8 ff ff       	call   80102c00 <end_op>
    return -1;
801053ea:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
801053ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
801053f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
801053f5:	5b                   	pop    %ebx
801053f6:	5e                   	pop    %esi
801053f7:	5f                   	pop    %edi
801053f8:	5d                   	pop    %ebp
801053f9:	c3                   	ret    
801053fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
80105400:	83 ec 0c             	sub    $0xc,%esp
80105403:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105406:	31 c9                	xor    %ecx,%ecx
80105408:	6a 00                	push   $0x0
8010540a:	ba 02 00 00 00       	mov    $0x2,%edx
8010540f:	e8 ec f7 ff ff       	call   80104c00 <create>
    if(ip == 0){
80105414:	83 c4 10             	add    $0x10,%esp
80105417:	85 c0                	test   %eax,%eax
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
80105419:	89 c7                	mov    %eax,%edi
    if(ip == 0){
8010541b:	75 89                	jne    801053a6 <sys_open+0x76>
      end_op();
8010541d:	e8 de d7 ff ff       	call   80102c00 <end_op>
      return -1;
80105422:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105427:	eb 43                	jmp    8010546c <sys_open+0x13c>
80105429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105430:	83 ec 0c             	sub    $0xc,%esp
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80105433:	89 74 9a 28          	mov    %esi,0x28(%edx,%ebx,4)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105437:	57                   	push   %edi
80105438:	e8 03 c3 ff ff       	call   80101740 <iunlock>
  end_op();
8010543d:	e8 be d7 ff ff       	call   80102c00 <end_op>

  f->type = FD_INODE;
80105442:	c7 06 02 00 00 00    	movl   $0x2,(%esi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80105448:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
8010544b:	83 c4 10             	add    $0x10,%esp
  }
  iunlock(ip);
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
8010544e:	89 7e 10             	mov    %edi,0x10(%esi)
  f->off = 0;
80105451:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
  f->readable = !(omode & O_WRONLY);
80105458:	89 d0                	mov    %edx,%eax
8010545a:	83 e0 01             	and    $0x1,%eax
8010545d:	83 f0 01             	xor    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105460:	83 e2 03             	and    $0x3,%edx
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80105463:	88 46 08             	mov    %al,0x8(%esi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105466:	0f 95 46 09          	setne  0x9(%esi)
  return fd;
8010546a:	89 d8                	mov    %ebx,%eax
}
8010546c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010546f:	5b                   	pop    %ebx
80105470:	5e                   	pop    %esi
80105471:	5f                   	pop    %edi
80105472:	5d                   	pop    %ebp
80105473:	c3                   	ret    
80105474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((ip = namei(path)) == 0){
      end_op();
      return -1;
    }
    ilock(ip);
    if(ip->type == T_DIR && omode != O_RDONLY){
80105478:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010547b:	85 d2                	test   %edx,%edx
8010547d:	0f 84 23 ff ff ff    	je     801053a6 <sys_open+0x76>
80105483:	e9 54 ff ff ff       	jmp    801053dc <sys_open+0xac>
80105488:	90                   	nop
80105489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105490 <sys_mkdir>:
  return fd;
}

int
sys_mkdir(void)
{
80105490:	55                   	push   %ebp
80105491:	89 e5                	mov    %esp,%ebp
80105493:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105496:	e8 f5 d6 ff ff       	call   80102b90 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
8010549b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010549e:	83 ec 08             	sub    $0x8,%esp
801054a1:	50                   	push   %eax
801054a2:	6a 00                	push   $0x0
801054a4:	e8 67 f6 ff ff       	call   80104b10 <argstr>
801054a9:	83 c4 10             	add    $0x10,%esp
801054ac:	85 c0                	test   %eax,%eax
801054ae:	78 30                	js     801054e0 <sys_mkdir+0x50>
801054b0:	83 ec 0c             	sub    $0xc,%esp
801054b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801054b6:	31 c9                	xor    %ecx,%ecx
801054b8:	6a 00                	push   $0x0
801054ba:	ba 01 00 00 00       	mov    $0x1,%edx
801054bf:	e8 3c f7 ff ff       	call   80104c00 <create>
801054c4:	83 c4 10             	add    $0x10,%esp
801054c7:	85 c0                	test   %eax,%eax
801054c9:	74 15                	je     801054e0 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
801054cb:	83 ec 0c             	sub    $0xc,%esp
801054ce:	50                   	push   %eax
801054cf:	e8 fc c3 ff ff       	call   801018d0 <iunlockput>
  end_op();
801054d4:	e8 27 d7 ff ff       	call   80102c00 <end_op>
  return 0;
801054d9:	83 c4 10             	add    $0x10,%esp
801054dc:	31 c0                	xor    %eax,%eax
}
801054de:	c9                   	leave  
801054df:	c3                   	ret    
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    end_op();
801054e0:	e8 1b d7 ff ff       	call   80102c00 <end_op>
    return -1;
801054e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
801054ea:	c9                   	leave  
801054eb:	c3                   	ret    
801054ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801054f0 <sys_mknod>:

int
sys_mknod(void)
{
801054f0:	55                   	push   %ebp
801054f1:	89 e5                	mov    %esp,%ebp
801054f3:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
801054f6:	e8 95 d6 ff ff       	call   80102b90 <begin_op>
  if((argstr(0, &path)) < 0 ||
801054fb:	8d 45 ec             	lea    -0x14(%ebp),%eax
801054fe:	83 ec 08             	sub    $0x8,%esp
80105501:	50                   	push   %eax
80105502:	6a 00                	push   $0x0
80105504:	e8 07 f6 ff ff       	call   80104b10 <argstr>
80105509:	83 c4 10             	add    $0x10,%esp
8010550c:	85 c0                	test   %eax,%eax
8010550e:	78 60                	js     80105570 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
80105510:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105513:	83 ec 08             	sub    $0x8,%esp
80105516:	50                   	push   %eax
80105517:	6a 01                	push   $0x1
80105519:	e8 62 f5 ff ff       	call   80104a80 <argint>
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
8010551e:	83 c4 10             	add    $0x10,%esp
80105521:	85 c0                	test   %eax,%eax
80105523:	78 4b                	js     80105570 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
80105525:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105528:	83 ec 08             	sub    $0x8,%esp
8010552b:	50                   	push   %eax
8010552c:	6a 02                	push   $0x2
8010552e:	e8 4d f5 ff ff       	call   80104a80 <argint>
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
80105533:	83 c4 10             	add    $0x10,%esp
80105536:	85 c0                	test   %eax,%eax
80105538:	78 36                	js     80105570 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
8010553a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
8010553e:	83 ec 0c             	sub    $0xc,%esp
80105541:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80105545:	ba 03 00 00 00       	mov    $0x3,%edx
8010554a:	50                   	push   %eax
8010554b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010554e:	e8 ad f6 ff ff       	call   80104c00 <create>
80105553:	83 c4 10             	add    $0x10,%esp
80105556:	85 c0                	test   %eax,%eax
80105558:	74 16                	je     80105570 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
    return -1;
  }
  iunlockput(ip);
8010555a:	83 ec 0c             	sub    $0xc,%esp
8010555d:	50                   	push   %eax
8010555e:	e8 6d c3 ff ff       	call   801018d0 <iunlockput>
  end_op();
80105563:	e8 98 d6 ff ff       	call   80102c00 <end_op>
  return 0;
80105568:	83 c4 10             	add    $0x10,%esp
8010556b:	31 c0                	xor    %eax,%eax
}
8010556d:	c9                   	leave  
8010556e:	c3                   	ret    
8010556f:	90                   	nop
  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
80105570:	e8 8b d6 ff ff       	call   80102c00 <end_op>
    return -1;
80105575:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010557a:	c9                   	leave  
8010557b:	c3                   	ret    
8010557c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105580 <sys_chdir>:

int
sys_chdir(void)
{
80105580:	55                   	push   %ebp
80105581:	89 e5                	mov    %esp,%ebp
80105583:	53                   	push   %ebx
80105584:	83 ec 14             	sub    $0x14,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105587:	e8 04 d6 ff ff       	call   80102b90 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
8010558c:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010558f:	83 ec 08             	sub    $0x8,%esp
80105592:	50                   	push   %eax
80105593:	6a 00                	push   $0x0
80105595:	e8 76 f5 ff ff       	call   80104b10 <argstr>
8010559a:	83 c4 10             	add    $0x10,%esp
8010559d:	85 c0                	test   %eax,%eax
8010559f:	78 7f                	js     80105620 <sys_chdir+0xa0>
801055a1:	83 ec 0c             	sub    $0xc,%esp
801055a4:	ff 75 f4             	pushl  -0xc(%ebp)
801055a7:	e8 e4 c8 ff ff       	call   80101e90 <namei>
801055ac:	83 c4 10             	add    $0x10,%esp
801055af:	85 c0                	test   %eax,%eax
801055b1:	89 c3                	mov    %eax,%ebx
801055b3:	74 6b                	je     80105620 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
801055b5:	83 ec 0c             	sub    $0xc,%esp
801055b8:	50                   	push   %eax
801055b9:	e8 a2 c0 ff ff       	call   80101660 <ilock>
  if(ip->type != T_DIR){
801055be:	83 c4 10             	add    $0x10,%esp
801055c1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801055c6:	75 38                	jne    80105600 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801055c8:	83 ec 0c             	sub    $0xc,%esp
801055cb:	53                   	push   %ebx
801055cc:	e8 6f c1 ff ff       	call   80101740 <iunlock>
  iput(proc->cwd);
801055d1:	58                   	pop    %eax
801055d2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801055d8:	ff 70 68             	pushl  0x68(%eax)
801055db:	e8 b0 c1 ff ff       	call   80101790 <iput>
  end_op();
801055e0:	e8 1b d6 ff ff       	call   80102c00 <end_op>
  proc->cwd = ip;
801055e5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  return 0;
801055eb:	83 c4 10             	add    $0x10,%esp
    return -1;
  }
  iunlock(ip);
  iput(proc->cwd);
  end_op();
  proc->cwd = ip;
801055ee:	89 58 68             	mov    %ebx,0x68(%eax)
  return 0;
801055f1:	31 c0                	xor    %eax,%eax
}
801055f3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801055f6:	c9                   	leave  
801055f7:	c3                   	ret    
801055f8:	90                   	nop
801055f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    end_op();
    return -1;
  }
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
80105600:	83 ec 0c             	sub    $0xc,%esp
80105603:	53                   	push   %ebx
80105604:	e8 c7 c2 ff ff       	call   801018d0 <iunlockput>
    end_op();
80105609:	e8 f2 d5 ff ff       	call   80102c00 <end_op>
    return -1;
8010560e:	83 c4 10             	add    $0x10,%esp
80105611:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105616:	eb db                	jmp    801055f3 <sys_chdir+0x73>
80105618:	90                   	nop
80105619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
    end_op();
80105620:	e8 db d5 ff ff       	call   80102c00 <end_op>
    return -1;
80105625:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010562a:	eb c7                	jmp    801055f3 <sys_chdir+0x73>
8010562c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105630 <sys_exec>:
  return 0;
}

int
sys_exec(void)
{
80105630:	55                   	push   %ebp
80105631:	89 e5                	mov    %esp,%ebp
80105633:	57                   	push   %edi
80105634:	56                   	push   %esi
80105635:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105636:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
  return 0;
}

int
sys_exec(void)
{
8010563c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105642:	50                   	push   %eax
80105643:	6a 00                	push   $0x0
80105645:	e8 c6 f4 ff ff       	call   80104b10 <argstr>
8010564a:	83 c4 10             	add    $0x10,%esp
8010564d:	85 c0                	test   %eax,%eax
8010564f:	78 7f                	js     801056d0 <sys_exec+0xa0>
80105651:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80105657:	83 ec 08             	sub    $0x8,%esp
8010565a:	50                   	push   %eax
8010565b:	6a 01                	push   $0x1
8010565d:	e8 1e f4 ff ff       	call   80104a80 <argint>
80105662:	83 c4 10             	add    $0x10,%esp
80105665:	85 c0                	test   %eax,%eax
80105667:	78 67                	js     801056d0 <sys_exec+0xa0>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
80105669:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
8010566f:	83 ec 04             	sub    $0x4,%esp
80105672:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
80105678:	68 80 00 00 00       	push   $0x80
8010567d:	6a 00                	push   $0x0
8010567f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105685:	50                   	push   %eax
80105686:	31 db                	xor    %ebx,%ebx
80105688:	e8 03 f1 ff ff       	call   80104790 <memset>
8010568d:	83 c4 10             	add    $0x10,%esp
  for(i=0;; i++){
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80105690:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105696:	83 ec 08             	sub    $0x8,%esp
80105699:	57                   	push   %edi
8010569a:	8d 04 98             	lea    (%eax,%ebx,4),%eax
8010569d:	50                   	push   %eax
8010569e:	e8 5d f3 ff ff       	call   80104a00 <fetchint>
801056a3:	83 c4 10             	add    $0x10,%esp
801056a6:	85 c0                	test   %eax,%eax
801056a8:	78 26                	js     801056d0 <sys_exec+0xa0>
      return -1;
    if(uarg == 0){
801056aa:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
801056b0:	85 c0                	test   %eax,%eax
801056b2:	74 2c                	je     801056e0 <sys_exec+0xb0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
801056b4:	83 ec 08             	sub    $0x8,%esp
801056b7:	56                   	push   %esi
801056b8:	50                   	push   %eax
801056b9:	e8 72 f3 ff ff       	call   80104a30 <fetchstr>
801056be:	83 c4 10             	add    $0x10,%esp
801056c1:	85 c0                	test   %eax,%eax
801056c3:	78 0b                	js     801056d0 <sys_exec+0xa0>

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
801056c5:	83 c3 01             	add    $0x1,%ebx
801056c8:	83 c6 04             	add    $0x4,%esi
    if(i >= NELEM(argv))
801056cb:	83 fb 20             	cmp    $0x20,%ebx
801056ce:	75 c0                	jne    80105690 <sys_exec+0x60>
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
801056d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
801056d3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
801056d8:	5b                   	pop    %ebx
801056d9:	5e                   	pop    %esi
801056da:	5f                   	pop    %edi
801056db:	5d                   	pop    %ebp
801056dc:	c3                   	ret    
801056dd:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
801056e0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801056e6:	83 ec 08             	sub    $0x8,%esp
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
      argv[i] = 0;
801056e9:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
801056f0:	00 00 00 00 
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
801056f4:	50                   	push   %eax
801056f5:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
801056fb:	e8 f0 b2 ff ff       	call   801009f0 <exec>
80105700:	83 c4 10             	add    $0x10,%esp
}
80105703:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105706:	5b                   	pop    %ebx
80105707:	5e                   	pop    %esi
80105708:	5f                   	pop    %edi
80105709:	5d                   	pop    %ebp
8010570a:	c3                   	ret    
8010570b:	90                   	nop
8010570c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105710 <sys_pipe>:

int
sys_pipe(void)
{
80105710:	55                   	push   %ebp
80105711:	89 e5                	mov    %esp,%ebp
80105713:	57                   	push   %edi
80105714:	56                   	push   %esi
80105715:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80105716:	8d 45 dc             	lea    -0x24(%ebp),%eax
  return exec(path, argv);
}

int
sys_pipe(void)
{
80105719:	83 ec 20             	sub    $0x20,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
8010571c:	6a 08                	push   $0x8
8010571e:	50                   	push   %eax
8010571f:	6a 00                	push   $0x0
80105721:	e8 9a f3 ff ff       	call   80104ac0 <argptr>
80105726:	83 c4 10             	add    $0x10,%esp
80105729:	85 c0                	test   %eax,%eax
8010572b:	78 48                	js     80105775 <sys_pipe+0x65>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
8010572d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105730:	83 ec 08             	sub    $0x8,%esp
80105733:	50                   	push   %eax
80105734:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105737:	50                   	push   %eax
80105738:	e8 f3 db ff ff       	call   80103330 <pipealloc>
8010573d:	83 c4 10             	add    $0x10,%esp
80105740:	85 c0                	test   %eax,%eax
80105742:	78 31                	js     80105775 <sys_pipe+0x65>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105744:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80105747:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
8010574e:	31 c0                	xor    %eax,%eax
    if(proc->ofile[fd] == 0){
80105750:	8b 54 81 28          	mov    0x28(%ecx,%eax,4),%edx
80105754:	85 d2                	test   %edx,%edx
80105756:	74 28                	je     80105780 <sys_pipe+0x70>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105758:	83 c0 01             	add    $0x1,%eax
8010575b:	83 f8 10             	cmp    $0x10,%eax
8010575e:	75 f0                	jne    80105750 <sys_pipe+0x40>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      proc->ofile[fd0] = 0;
    fileclose(rf);
80105760:	83 ec 0c             	sub    $0xc,%esp
80105763:	53                   	push   %ebx
80105764:	e8 b7 b6 ff ff       	call   80100e20 <fileclose>
    fileclose(wf);
80105769:	58                   	pop    %eax
8010576a:	ff 75 e4             	pushl  -0x1c(%ebp)
8010576d:	e8 ae b6 ff ff       	call   80100e20 <fileclose>
    return -1;
80105772:	83 c4 10             	add    $0x10,%esp
80105775:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010577a:	eb 45                	jmp    801057c1 <sys_pipe+0xb1>
8010577c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105780:	8d 34 81             	lea    (%ecx,%eax,4),%esi
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105783:	8b 7d e4             	mov    -0x1c(%ebp),%edi
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105786:	31 d2                	xor    %edx,%edx
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80105788:	89 5e 28             	mov    %ebx,0x28(%esi)
8010578b:	90                   	nop
8010578c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
80105790:	83 7c 91 28 00       	cmpl   $0x0,0x28(%ecx,%edx,4)
80105795:	74 19                	je     801057b0 <sys_pipe+0xa0>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105797:	83 c2 01             	add    $0x1,%edx
8010579a:	83 fa 10             	cmp    $0x10,%edx
8010579d:	75 f1                	jne    80105790 <sys_pipe+0x80>
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      proc->ofile[fd0] = 0;
8010579f:	c7 46 28 00 00 00 00 	movl   $0x0,0x28(%esi)
801057a6:	eb b8                	jmp    80105760 <sys_pipe+0x50>
801057a8:	90                   	nop
801057a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
801057b0:	89 7c 91 28          	mov    %edi,0x28(%ecx,%edx,4)
      proc->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
801057b4:	8b 4d dc             	mov    -0x24(%ebp),%ecx
801057b7:	89 01                	mov    %eax,(%ecx)
  fd[1] = fd1;
801057b9:	8b 45 dc             	mov    -0x24(%ebp),%eax
801057bc:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
801057bf:	31 c0                	xor    %eax,%eax
}
801057c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801057c4:	5b                   	pop    %ebx
801057c5:	5e                   	pop    %esi
801057c6:	5f                   	pop    %edi
801057c7:	5d                   	pop    %ebp
801057c8:	c3                   	ret    
801057c9:	66 90                	xchg   %ax,%ax
801057cb:	66 90                	xchg   %ax,%ax
801057cd:	66 90                	xchg   %ax,%ax
801057cf:	90                   	nop

801057d0 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(int tickets)
{
801057d0:	55                   	push   %ebp
801057d1:	89 e5                	mov    %esp,%ebp
  return fork(tickets);
}
801057d3:	5d                   	pop    %ebp
#include "proc.h"

int
sys_fork(int tickets)
{
  return fork(tickets);
801057d4:	e9 e7 e1 ff ff       	jmp    801039c0 <fork>
801057d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801057e0 <sys_exit>:
}

int
sys_exit(void)
{
801057e0:	55                   	push   %ebp
801057e1:	89 e5                	mov    %esp,%ebp
801057e3:	83 ec 08             	sub    $0x8,%esp
  exit();
801057e6:	e8 65 e5 ff ff       	call   80103d50 <exit>
  return 0;  // not reached
}
801057eb:	31 c0                	xor    %eax,%eax
801057ed:	c9                   	leave  
801057ee:	c3                   	ret    
801057ef:	90                   	nop

801057f0 <sys_wait>:

int
sys_wait(void)
{
801057f0:	55                   	push   %ebp
801057f1:	89 e5                	mov    %esp,%ebp
  return wait();
}
801057f3:	5d                   	pop    %ebp
}

int
sys_wait(void)
{
  return wait();
801057f4:	e9 a7 e7 ff ff       	jmp    80103fa0 <wait>
801057f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105800 <sys_kill>:
}

int
sys_kill(void)
{
80105800:	55                   	push   %ebp
80105801:	89 e5                	mov    %esp,%ebp
80105803:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105806:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105809:	50                   	push   %eax
8010580a:	6a 00                	push   $0x0
8010580c:	e8 6f f2 ff ff       	call   80104a80 <argint>
80105811:	83 c4 10             	add    $0x10,%esp
80105814:	85 c0                	test   %eax,%eax
80105816:	78 18                	js     80105830 <sys_kill+0x30>
    return -1;
  return kill(pid);
80105818:	83 ec 0c             	sub    $0xc,%esp
8010581b:	ff 75 f4             	pushl  -0xc(%ebp)
8010581e:	e8 cd e8 ff ff       	call   801040f0 <kill>
80105823:	83 c4 10             	add    $0x10,%esp
}
80105826:	c9                   	leave  
80105827:	c3                   	ret    
80105828:	90                   	nop
80105829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
80105830:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return kill(pid);
}
80105835:	c9                   	leave  
80105836:	c3                   	ret    
80105837:	89 f6                	mov    %esi,%esi
80105839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105840 <sys_getpid>:

int
sys_getpid(void)
{
  return proc->pid;
80105840:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  return kill(pid);
}

int
sys_getpid(void)
{
80105846:	55                   	push   %ebp
80105847:	89 e5                	mov    %esp,%ebp
  return proc->pid;
80105849:	8b 40 10             	mov    0x10(%eax),%eax
}
8010584c:	5d                   	pop    %ebp
8010584d:	c3                   	ret    
8010584e:	66 90                	xchg   %ax,%ax

80105850 <sys_sbrk>:

int
sys_sbrk(void)
{
80105850:	55                   	push   %ebp
80105851:	89 e5                	mov    %esp,%ebp
80105853:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105854:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return proc->pid;
}

int
sys_sbrk(void)
{
80105857:	83 ec 1c             	sub    $0x1c,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
8010585a:	50                   	push   %eax
8010585b:	6a 00                	push   $0x0
8010585d:	e8 1e f2 ff ff       	call   80104a80 <argint>
80105862:	83 c4 10             	add    $0x10,%esp
80105865:	85 c0                	test   %eax,%eax
80105867:	78 27                	js     80105890 <sys_sbrk+0x40>
    return -1;
  addr = proc->sz;
80105869:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  if(growproc(n) < 0)
8010586f:	83 ec 0c             	sub    $0xc,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = proc->sz;
80105872:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80105874:	ff 75 f4             	pushl  -0xc(%ebp)
80105877:	e8 d4 e0 ff ff       	call   80103950 <growproc>
8010587c:	83 c4 10             	add    $0x10,%esp
8010587f:	85 c0                	test   %eax,%eax
80105881:	78 0d                	js     80105890 <sys_sbrk+0x40>
    return -1;
  return addr;
80105883:	89 d8                	mov    %ebx,%eax
}
80105885:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105888:	c9                   	leave  
80105889:	c3                   	ret    
8010588a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
80105890:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105895:	eb ee                	jmp    80105885 <sys_sbrk+0x35>
80105897:	89 f6                	mov    %esi,%esi
80105899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801058a0 <sys_sleep>:
  return addr;
}

int
sys_sleep(void)
{
801058a0:	55                   	push   %ebp
801058a1:	89 e5                	mov    %esp,%ebp
801058a3:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
801058a4:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return addr;
}

int
sys_sleep(void)
{
801058a7:	83 ec 1c             	sub    $0x1c,%esp
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
801058aa:	50                   	push   %eax
801058ab:	6a 00                	push   $0x0
801058ad:	e8 ce f1 ff ff       	call   80104a80 <argint>
801058b2:	83 c4 10             	add    $0x10,%esp
801058b5:	85 c0                	test   %eax,%eax
801058b7:	0f 88 8a 00 00 00    	js     80105947 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
801058bd:	83 ec 0c             	sub    $0xc,%esp
801058c0:	68 a0 4d 11 80       	push   $0x80114da0
801058c5:	e8 96 ec ff ff       	call   80104560 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
801058ca:	8b 55 f4             	mov    -0xc(%ebp),%edx
801058cd:	83 c4 10             	add    $0x10,%esp
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
801058d0:	8b 1d e0 55 11 80    	mov    0x801155e0,%ebx
  while(ticks - ticks0 < n){
801058d6:	85 d2                	test   %edx,%edx
801058d8:	75 27                	jne    80105901 <sys_sleep+0x61>
801058da:	eb 54                	jmp    80105930 <sys_sleep+0x90>
801058dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(proc->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
801058e0:	83 ec 08             	sub    $0x8,%esp
801058e3:	68 a0 4d 11 80       	push   $0x80114da0
801058e8:	68 e0 55 11 80       	push   $0x801155e0
801058ed:	e8 ee e5 ff ff       	call   80103ee0 <sleep>

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
801058f2:	a1 e0 55 11 80       	mov    0x801155e0,%eax
801058f7:	83 c4 10             	add    $0x10,%esp
801058fa:	29 d8                	sub    %ebx,%eax
801058fc:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801058ff:	73 2f                	jae    80105930 <sys_sleep+0x90>
    if(proc->killed){
80105901:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105907:	8b 40 24             	mov    0x24(%eax),%eax
8010590a:	85 c0                	test   %eax,%eax
8010590c:	74 d2                	je     801058e0 <sys_sleep+0x40>
      release(&tickslock);
8010590e:	83 ec 0c             	sub    $0xc,%esp
80105911:	68 a0 4d 11 80       	push   $0x80114da0
80105916:	e8 25 ee ff ff       	call   80104740 <release>
      return -1;
8010591b:	83 c4 10             	add    $0x10,%esp
8010591e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}
80105923:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105926:	c9                   	leave  
80105927:	c3                   	ret    
80105928:	90                   	nop
80105929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
80105930:	83 ec 0c             	sub    $0xc,%esp
80105933:	68 a0 4d 11 80       	push   $0x80114da0
80105938:	e8 03 ee ff ff       	call   80104740 <release>
  return 0;
8010593d:	83 c4 10             	add    $0x10,%esp
80105940:	31 c0                	xor    %eax,%eax
}
80105942:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105945:	c9                   	leave  
80105946:	c3                   	ret    
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
80105947:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010594c:	eb d5                	jmp    80105923 <sys_sleep+0x83>
8010594e:	66 90                	xchg   %ax,%ax

80105950 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105950:	55                   	push   %ebp
80105951:	89 e5                	mov    %esp,%ebp
80105953:	53                   	push   %ebx
80105954:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80105957:	68 a0 4d 11 80       	push   $0x80114da0
8010595c:	e8 ff eb ff ff       	call   80104560 <acquire>
  xticks = ticks;
80105961:	8b 1d e0 55 11 80    	mov    0x801155e0,%ebx
  release(&tickslock);
80105967:	c7 04 24 a0 4d 11 80 	movl   $0x80114da0,(%esp)
8010596e:	e8 cd ed ff ff       	call   80104740 <release>
  return xticks;
}
80105973:	89 d8                	mov    %ebx,%eax
80105975:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105978:	c9                   	leave  
80105979:	c3                   	ret    
8010597a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105980 <sys_cps>:

int
sys_cps(void)
{
80105980:	55                   	push   %ebp
80105981:	89 e5                	mov    %esp,%ebp
  return cps();
}
80105983:	5d                   	pop    %ebp
}

int
sys_cps(void)
{
  return cps();
80105984:	e9 d7 e8 ff ff       	jmp    80104260 <cps>
80105989:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105990 <sys_cht>:
}

int
sys_cht(void)
{
80105990:	55                   	push   %ebp
80105991:	89 e5                	mov    %esp,%ebp
80105993:	83 ec 20             	sub    $0x20,%esp
  int pid, tickets;
  if(argint(0, &pid) < 0)
80105996:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105999:	50                   	push   %eax
8010599a:	6a 00                	push   $0x0
8010599c:	e8 df f0 ff ff       	call   80104a80 <argint>
801059a1:	83 c4 10             	add    $0x10,%esp
801059a4:	85 c0                	test   %eax,%eax
801059a6:	78 28                	js     801059d0 <sys_cht+0x40>
    return -1;
  if(argint(1, &tickets) < 0)
801059a8:	8d 45 f4             	lea    -0xc(%ebp),%eax
801059ab:	83 ec 08             	sub    $0x8,%esp
801059ae:	50                   	push   %eax
801059af:	6a 01                	push   $0x1
801059b1:	e8 ca f0 ff ff       	call   80104a80 <argint>
801059b6:	83 c4 10             	add    $0x10,%esp
801059b9:	85 c0                	test   %eax,%eax
801059bb:	78 13                	js     801059d0 <sys_cht+0x40>
    return -1;
  
  return cht(pid, tickets);
801059bd:	83 ec 08             	sub    $0x8,%esp
801059c0:	ff 75 f4             	pushl  -0xc(%ebp)
801059c3:	ff 75 f0             	pushl  -0x10(%ebp)
801059c6:	e8 e5 e9 ff ff       	call   801043b0 <cht>
801059cb:	83 c4 10             	add    $0x10,%esp
}
801059ce:	c9                   	leave  
801059cf:	c3                   	ret    
int
sys_cht(void)
{
  int pid, tickets;
  if(argint(0, &pid) < 0)
    return -1;
801059d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(argint(1, &tickets) < 0)
    return -1;
  
  return cht(pid, tickets);
}
801059d5:	c9                   	leave  
801059d6:	c3                   	ret    
801059d7:	66 90                	xchg   %ax,%ax
801059d9:	66 90                	xchg   %ax,%ax
801059db:	66 90                	xchg   %ax,%ax
801059dd:	66 90                	xchg   %ax,%ax
801059df:	90                   	nop

801059e0 <timerinit>:
801059e0:	55                   	push   %ebp
801059e1:	ba 43 00 00 00       	mov    $0x43,%edx
801059e6:	b8 34 00 00 00       	mov    $0x34,%eax
801059eb:	89 e5                	mov    %esp,%ebp
801059ed:	83 ec 14             	sub    $0x14,%esp
801059f0:	ee                   	out    %al,(%dx)
801059f1:	ba 40 00 00 00       	mov    $0x40,%edx
801059f6:	b8 9c ff ff ff       	mov    $0xffffff9c,%eax
801059fb:	ee                   	out    %al,(%dx)
801059fc:	b8 2e 00 00 00       	mov    $0x2e,%eax
80105a01:	ee                   	out    %al,(%dx)
80105a02:	6a 00                	push   $0x0
80105a04:	e8 57 d8 ff ff       	call   80103260 <picenable>
80105a09:	83 c4 10             	add    $0x10,%esp
80105a0c:	c9                   	leave  
80105a0d:	c3                   	ret    

80105a0e <alltraps>:
80105a0e:	1e                   	push   %ds
80105a0f:	06                   	push   %es
80105a10:	0f a0                	push   %fs
80105a12:	0f a8                	push   %gs
80105a14:	60                   	pusha  
80105a15:	66 b8 10 00          	mov    $0x10,%ax
80105a19:	8e d8                	mov    %eax,%ds
80105a1b:	8e c0                	mov    %eax,%es
80105a1d:	66 b8 18 00          	mov    $0x18,%ax
80105a21:	8e e0                	mov    %eax,%fs
80105a23:	8e e8                	mov    %eax,%gs
80105a25:	54                   	push   %esp
80105a26:	e8 e5 00 00 00       	call   80105b10 <trap>
80105a2b:	83 c4 04             	add    $0x4,%esp

80105a2e <trapret>:
80105a2e:	61                   	popa   
80105a2f:	0f a9                	pop    %gs
80105a31:	0f a1                	pop    %fs
80105a33:	07                   	pop    %es
80105a34:	1f                   	pop    %ds
80105a35:	83 c4 08             	add    $0x8,%esp
80105a38:	cf                   	iret   
80105a39:	66 90                	xchg   %ax,%ax
80105a3b:	66 90                	xchg   %ax,%ax
80105a3d:	66 90                	xchg   %ax,%ax
80105a3f:	90                   	nop

80105a40 <tvinit>:
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
80105a40:	31 c0                	xor    %eax,%eax
80105a42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105a48:	8b 14 85 0c a0 10 80 	mov    -0x7fef5ff4(,%eax,4),%edx
80105a4f:	b9 08 00 00 00       	mov    $0x8,%ecx
80105a54:	c6 04 c5 e4 4d 11 80 	movb   $0x0,-0x7feeb21c(,%eax,8)
80105a5b:	00 
80105a5c:	66 89 0c c5 e2 4d 11 	mov    %cx,-0x7feeb21e(,%eax,8)
80105a63:	80 
80105a64:	c6 04 c5 e5 4d 11 80 	movb   $0x8e,-0x7feeb21b(,%eax,8)
80105a6b:	8e 
80105a6c:	66 89 14 c5 e0 4d 11 	mov    %dx,-0x7feeb220(,%eax,8)
80105a73:	80 
80105a74:	c1 ea 10             	shr    $0x10,%edx
80105a77:	66 89 14 c5 e6 4d 11 	mov    %dx,-0x7feeb21a(,%eax,8)
80105a7e:	80 
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
80105a7f:	83 c0 01             	add    $0x1,%eax
80105a82:	3d 00 01 00 00       	cmp    $0x100,%eax
80105a87:	75 bf                	jne    80105a48 <tvinit+0x8>
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105a89:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105a8a:	ba 08 00 00 00       	mov    $0x8,%edx
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105a8f:	89 e5                	mov    %esp,%ebp
80105a91:	83 ec 10             	sub    $0x10,%esp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105a94:	a1 0c a1 10 80       	mov    0x8010a10c,%eax

  initlock(&tickslock, "time");
80105a99:	68 c1 7a 10 80       	push   $0x80107ac1
80105a9e:	68 a0 4d 11 80       	push   $0x80114da0
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105aa3:	66 89 15 e2 4f 11 80 	mov    %dx,0x80114fe2
80105aaa:	c6 05 e4 4f 11 80 00 	movb   $0x0,0x80114fe4
80105ab1:	66 a3 e0 4f 11 80    	mov    %ax,0x80114fe0
80105ab7:	c1 e8 10             	shr    $0x10,%eax
80105aba:	c6 05 e5 4f 11 80 ef 	movb   $0xef,0x80114fe5
80105ac1:	66 a3 e6 4f 11 80    	mov    %ax,0x80114fe6

  initlock(&tickslock, "time");
80105ac7:	e8 74 ea ff ff       	call   80104540 <initlock>
}
80105acc:	83 c4 10             	add    $0x10,%esp
80105acf:	c9                   	leave  
80105ad0:	c3                   	ret    
80105ad1:	eb 0d                	jmp    80105ae0 <idtinit>
80105ad3:	90                   	nop
80105ad4:	90                   	nop
80105ad5:	90                   	nop
80105ad6:	90                   	nop
80105ad7:	90                   	nop
80105ad8:	90                   	nop
80105ad9:	90                   	nop
80105ada:	90                   	nop
80105adb:	90                   	nop
80105adc:	90                   	nop
80105add:	90                   	nop
80105ade:	90                   	nop
80105adf:	90                   	nop

80105ae0 <idtinit>:

void
idtinit(void)
{
80105ae0:	55                   	push   %ebp
static inline void
lidt(struct gatedesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80105ae1:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105ae6:	89 e5                	mov    %esp,%ebp
80105ae8:	83 ec 10             	sub    $0x10,%esp
80105aeb:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
80105aef:	b8 e0 4d 11 80       	mov    $0x80114de0,%eax
80105af4:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105af8:	c1 e8 10             	shr    $0x10,%eax
80105afb:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
80105aff:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105b02:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105b05:	c9                   	leave  
80105b06:	c3                   	ret    
80105b07:	89 f6                	mov    %esi,%esi
80105b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105b10 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105b10:	55                   	push   %ebp
80105b11:	89 e5                	mov    %esp,%ebp
80105b13:	57                   	push   %edi
80105b14:	56                   	push   %esi
80105b15:	53                   	push   %ebx
80105b16:	83 ec 0c             	sub    $0xc,%esp
80105b19:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(tf->trapno == T_SYSCALL){
80105b1c:	8b 43 30             	mov    0x30(%ebx),%eax
80105b1f:	83 f8 40             	cmp    $0x40,%eax
80105b22:	0f 84 f8 00 00 00    	je     80105c20 <trap+0x110>
    if(proc->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80105b28:	83 e8 20             	sub    $0x20,%eax
80105b2b:	83 f8 1f             	cmp    $0x1f,%eax
80105b2e:	77 68                	ja     80105b98 <trap+0x88>
80105b30:	ff 24 85 68 7b 10 80 	jmp    *-0x7fef8498(,%eax,4)
80105b37:	89 f6                	mov    %esi,%esi
80105b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
80105b40:	e8 9b cb ff ff       	call   801026e0 <cpunum>
80105b45:	85 c0                	test   %eax,%eax
80105b47:	0f 84 b3 01 00 00    	je     80105d00 <trap+0x1f0>
    kbdintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_COM1:
    uartintr();
    lapiceoi();
80105b4d:	e8 fe cb ff ff       	call   80102750 <lapiceoi>
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105b52:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105b58:	85 c0                	test   %eax,%eax
80105b5a:	74 2d                	je     80105b89 <trap+0x79>
80105b5c:	8b 50 24             	mov    0x24(%eax),%edx
80105b5f:	85 d2                	test   %edx,%edx
80105b61:	0f 85 86 00 00 00    	jne    80105bed <trap+0xdd>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105b67:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105b6b:	0f 84 ef 00 00 00    	je     80105c60 <trap+0x150>
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105b71:	8b 40 24             	mov    0x24(%eax),%eax
80105b74:	85 c0                	test   %eax,%eax
80105b76:	74 11                	je     80105b89 <trap+0x79>
80105b78:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105b7c:	83 e0 03             	and    $0x3,%eax
80105b7f:	66 83 f8 03          	cmp    $0x3,%ax
80105b83:	0f 84 c1 00 00 00    	je     80105c4a <trap+0x13a>
    exit();
}
80105b89:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b8c:	5b                   	pop    %ebx
80105b8d:	5e                   	pop    %esi
80105b8e:	5f                   	pop    %edi
80105b8f:	5d                   	pop    %ebp
80105b90:	c3                   	ret    
80105b91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
80105b98:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
80105b9f:	85 c9                	test   %ecx,%ecx
80105ba1:	0f 84 8d 01 00 00    	je     80105d34 <trap+0x224>
80105ba7:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
80105bab:	0f 84 83 01 00 00    	je     80105d34 <trap+0x224>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105bb1:	0f 20 d7             	mov    %cr2,%edi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105bb4:	8b 73 38             	mov    0x38(%ebx),%esi
80105bb7:	e8 24 cb ff ff       	call   801026e0 <cpunum>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
80105bbc:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105bc3:	57                   	push   %edi
80105bc4:	56                   	push   %esi
80105bc5:	50                   	push   %eax
80105bc6:	ff 73 34             	pushl  0x34(%ebx)
80105bc9:	ff 73 30             	pushl  0x30(%ebx)
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
80105bcc:	8d 42 6c             	lea    0x6c(%edx),%eax
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105bcf:	50                   	push   %eax
80105bd0:	ff 72 10             	pushl  0x10(%edx)
80105bd3:	68 24 7b 10 80       	push   $0x80107b24
80105bd8:	e8 83 aa ff ff       	call   80100660 <cprintf>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
            rcr2());
    proc->killed = 1;
80105bdd:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105be3:	83 c4 20             	add    $0x20,%esp
80105be6:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105bed:	0f b7 53 3c          	movzwl 0x3c(%ebx),%edx
80105bf1:	83 e2 03             	and    $0x3,%edx
80105bf4:	66 83 fa 03          	cmp    $0x3,%dx
80105bf8:	0f 85 69 ff ff ff    	jne    80105b67 <trap+0x57>
    exit();
80105bfe:	e8 4d e1 ff ff       	call   80103d50 <exit>
80105c03:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105c09:	85 c0                	test   %eax,%eax
80105c0b:	0f 85 56 ff ff ff    	jne    80105b67 <trap+0x57>
80105c11:	e9 73 ff ff ff       	jmp    80105b89 <trap+0x79>
80105c16:	8d 76 00             	lea    0x0(%esi),%esi
80105c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
80105c20:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105c26:	8b 70 24             	mov    0x24(%eax),%esi
80105c29:	85 f6                	test   %esi,%esi
80105c2b:	0f 85 bf 00 00 00    	jne    80105cf0 <trap+0x1e0>
      exit();
    proc->tf = tf;
80105c31:	89 58 18             	mov    %ebx,0x18(%eax)
    syscall();
80105c34:	e8 57 ef ff ff       	call   80104b90 <syscall>
    if(proc->killed)
80105c39:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105c3f:	8b 58 24             	mov    0x24(%eax),%ebx
80105c42:	85 db                	test   %ebx,%ebx
80105c44:	0f 84 3f ff ff ff    	je     80105b89 <trap+0x79>
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();
}
80105c4a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105c4d:	5b                   	pop    %ebx
80105c4e:	5e                   	pop    %esi
80105c4f:	5f                   	pop    %edi
80105c50:	5d                   	pop    %ebp
    if(proc->killed)
      exit();
    proc->tf = tf;
    syscall();
    if(proc->killed)
      exit();
80105c51:	e9 fa e0 ff ff       	jmp    80103d50 <exit>
80105c56:	8d 76 00             	lea    0x0(%esi),%esi
80105c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105c60:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
80105c64:	0f 85 07 ff ff ff    	jne    80105b71 <trap+0x61>
    yield();
80105c6a:	e8 31 e2 ff ff       	call   80103ea0 <yield>
80105c6f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105c75:	85 c0                	test   %eax,%eax
80105c77:	0f 85 f4 fe ff ff    	jne    80105b71 <trap+0x61>
80105c7d:	e9 07 ff ff ff       	jmp    80105b89 <trap+0x79>
80105c82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    break;
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
80105c88:	e8 33 c9 ff ff       	call   801025c0 <kbdintr>
    lapiceoi();
80105c8d:	e8 be ca ff ff       	call   80102750 <lapiceoi>
    break;
80105c92:	e9 bb fe ff ff       	jmp    80105b52 <trap+0x42>
80105c97:	89 f6                	mov    %esi,%esi
80105c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  case T_IRQ0 + IRQ_COM1:
    uartintr();
80105ca0:	e8 2b 02 00 00       	call   80105ed0 <uartintr>
80105ca5:	e9 a3 fe ff ff       	jmp    80105b4d <trap+0x3d>
80105caa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105cb0:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
80105cb4:	8b 7b 38             	mov    0x38(%ebx),%edi
80105cb7:	e8 24 ca ff ff       	call   801026e0 <cpunum>
80105cbc:	57                   	push   %edi
80105cbd:	56                   	push   %esi
80105cbe:	50                   	push   %eax
80105cbf:	68 cc 7a 10 80       	push   $0x80107acc
80105cc4:	e8 97 a9 ff ff       	call   80100660 <cprintf>
            cpunum(), tf->cs, tf->eip);
    lapiceoi();
80105cc9:	e8 82 ca ff ff       	call   80102750 <lapiceoi>
    break;
80105cce:	83 c4 10             	add    $0x10,%esp
80105cd1:	e9 7c fe ff ff       	jmp    80105b52 <trap+0x42>
80105cd6:	8d 76 00             	lea    0x0(%esi),%esi
80105cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
80105ce0:	e8 4b c3 ff ff       	call   80102030 <ideintr>
    lapiceoi();
80105ce5:	e8 66 ca ff ff       	call   80102750 <lapiceoi>
    break;
80105cea:	e9 63 fe ff ff       	jmp    80105b52 <trap+0x42>
80105cef:	90                   	nop
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
      exit();
80105cf0:	e8 5b e0 ff ff       	call   80103d50 <exit>
80105cf5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105cfb:	e9 31 ff ff ff       	jmp    80105c31 <trap+0x121>
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
      acquire(&tickslock);
80105d00:	83 ec 0c             	sub    $0xc,%esp
80105d03:	68 a0 4d 11 80       	push   $0x80114da0
80105d08:	e8 53 e8 ff ff       	call   80104560 <acquire>
      ticks++;
      wakeup(&ticks);
80105d0d:	c7 04 24 e0 55 11 80 	movl   $0x801155e0,(%esp)

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
      acquire(&tickslock);
      ticks++;
80105d14:	83 05 e0 55 11 80 01 	addl   $0x1,0x801155e0
      wakeup(&ticks);
80105d1b:	e8 70 e3 ff ff       	call   80104090 <wakeup>
      release(&tickslock);
80105d20:	c7 04 24 a0 4d 11 80 	movl   $0x80114da0,(%esp)
80105d27:	e8 14 ea ff ff       	call   80104740 <release>
80105d2c:	83 c4 10             	add    $0x10,%esp
80105d2f:	e9 19 fe ff ff       	jmp    80105b4d <trap+0x3d>
80105d34:	0f 20 d7             	mov    %cr2,%edi

  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105d37:	8b 73 38             	mov    0x38(%ebx),%esi
80105d3a:	e8 a1 c9 ff ff       	call   801026e0 <cpunum>
80105d3f:	83 ec 0c             	sub    $0xc,%esp
80105d42:	57                   	push   %edi
80105d43:	56                   	push   %esi
80105d44:	50                   	push   %eax
80105d45:	ff 73 30             	pushl  0x30(%ebx)
80105d48:	68 f0 7a 10 80       	push   $0x80107af0
80105d4d:	e8 0e a9 ff ff       	call   80100660 <cprintf>
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
80105d52:	83 c4 14             	add    $0x14,%esp
80105d55:	68 c6 7a 10 80       	push   $0x80107ac6
80105d5a:	e8 11 a6 ff ff       	call   80100370 <panic>
80105d5f:	90                   	nop

80105d60 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105d60:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
  outb(COM1+0, c);
}

static int
uartgetc(void)
{
80105d65:	55                   	push   %ebp
80105d66:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105d68:	85 c0                	test   %eax,%eax
80105d6a:	74 1c                	je     80105d88 <uartgetc+0x28>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105d6c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105d71:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105d72:	a8 01                	test   $0x1,%al
80105d74:	74 12                	je     80105d88 <uartgetc+0x28>
80105d76:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105d7b:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105d7c:	0f b6 c0             	movzbl %al,%eax
}
80105d7f:	5d                   	pop    %ebp
80105d80:	c3                   	ret    
80105d81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

static int
uartgetc(void)
{
  if(!uart)
    return -1;
80105d88:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(!(inb(COM1+5) & 0x01))
    return -1;
  return inb(COM1+0);
}
80105d8d:	5d                   	pop    %ebp
80105d8e:	c3                   	ret    
80105d8f:	90                   	nop

80105d90 <uartputc.part.0>:
  for(p="xv6...\n"; *p; p++)
    uartputc(*p);
}

void
uartputc(int c)
80105d90:	55                   	push   %ebp
80105d91:	89 e5                	mov    %esp,%ebp
80105d93:	57                   	push   %edi
80105d94:	56                   	push   %esi
80105d95:	53                   	push   %ebx
80105d96:	89 c7                	mov    %eax,%edi
80105d98:	bb 80 00 00 00       	mov    $0x80,%ebx
80105d9d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105da2:	83 ec 0c             	sub    $0xc,%esp
80105da5:	eb 1b                	jmp    80105dc2 <uartputc.part.0+0x32>
80105da7:	89 f6                	mov    %esi,%esi
80105da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
80105db0:	83 ec 0c             	sub    $0xc,%esp
80105db3:	6a 0a                	push   $0xa
80105db5:	e8 b6 c9 ff ff       	call   80102770 <microdelay>
{
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105dba:	83 c4 10             	add    $0x10,%esp
80105dbd:	83 eb 01             	sub    $0x1,%ebx
80105dc0:	74 07                	je     80105dc9 <uartputc.part.0+0x39>
80105dc2:	89 f2                	mov    %esi,%edx
80105dc4:	ec                   	in     (%dx),%al
80105dc5:	a8 20                	test   $0x20,%al
80105dc7:	74 e7                	je     80105db0 <uartputc.part.0+0x20>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105dc9:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105dce:	89 f8                	mov    %edi,%eax
80105dd0:	ee                   	out    %al,(%dx)
    microdelay(10);
  outb(COM1+0, c);
}
80105dd1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105dd4:	5b                   	pop    %ebx
80105dd5:	5e                   	pop    %esi
80105dd6:	5f                   	pop    %edi
80105dd7:	5d                   	pop    %ebp
80105dd8:	c3                   	ret    
80105dd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105de0 <uartinit>:

static int uart;    // is there a uart?

void
uartinit(void)
{
80105de0:	55                   	push   %ebp
80105de1:	31 c9                	xor    %ecx,%ecx
80105de3:	89 c8                	mov    %ecx,%eax
80105de5:	89 e5                	mov    %esp,%ebp
80105de7:	57                   	push   %edi
80105de8:	56                   	push   %esi
80105de9:	53                   	push   %ebx
80105dea:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105def:	89 da                	mov    %ebx,%edx
80105df1:	83 ec 0c             	sub    $0xc,%esp
80105df4:	ee                   	out    %al,(%dx)
80105df5:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105dfa:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105dff:	89 fa                	mov    %edi,%edx
80105e01:	ee                   	out    %al,(%dx)
80105e02:	b8 0c 00 00 00       	mov    $0xc,%eax
80105e07:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105e0c:	ee                   	out    %al,(%dx)
80105e0d:	be f9 03 00 00       	mov    $0x3f9,%esi
80105e12:	89 c8                	mov    %ecx,%eax
80105e14:	89 f2                	mov    %esi,%edx
80105e16:	ee                   	out    %al,(%dx)
80105e17:	b8 03 00 00 00       	mov    $0x3,%eax
80105e1c:	89 fa                	mov    %edi,%edx
80105e1e:	ee                   	out    %al,(%dx)
80105e1f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105e24:	89 c8                	mov    %ecx,%eax
80105e26:	ee                   	out    %al,(%dx)
80105e27:	b8 01 00 00 00       	mov    $0x1,%eax
80105e2c:	89 f2                	mov    %esi,%edx
80105e2e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105e2f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105e34:	ec                   	in     (%dx),%al
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
  outb(COM1+4, 0);
  outb(COM1+1, 0x01);    // Enable receive interrupts.

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
80105e35:	3c ff                	cmp    $0xff,%al
80105e37:	74 5a                	je     80105e93 <uartinit+0xb3>
    return;
  uart = 1;
80105e39:	c7 05 c0 a5 10 80 01 	movl   $0x1,0x8010a5c0
80105e40:	00 00 00 
80105e43:	89 da                	mov    %ebx,%edx
80105e45:	ec                   	in     (%dx),%al
80105e46:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105e4b:	ec                   	in     (%dx),%al

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  inb(COM1+0);
  picenable(IRQ_COM1);
80105e4c:	83 ec 0c             	sub    $0xc,%esp
80105e4f:	6a 04                	push   $0x4
80105e51:	e8 0a d4 ff ff       	call   80103260 <picenable>
  ioapicenable(IRQ_COM1, 0);
80105e56:	59                   	pop    %ecx
80105e57:	5b                   	pop    %ebx
80105e58:	6a 00                	push   $0x0
80105e5a:	6a 04                	push   $0x4
80105e5c:	bb e8 7b 10 80       	mov    $0x80107be8,%ebx
80105e61:	e8 2a c4 ff ff       	call   80102290 <ioapicenable>
80105e66:	83 c4 10             	add    $0x10,%esp
80105e69:	b8 78 00 00 00       	mov    $0x78,%eax
80105e6e:	eb 0a                	jmp    80105e7a <uartinit+0x9a>

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105e70:	83 c3 01             	add    $0x1,%ebx
80105e73:	0f be 03             	movsbl (%ebx),%eax
80105e76:	84 c0                	test   %al,%al
80105e78:	74 19                	je     80105e93 <uartinit+0xb3>
void
uartputc(int c)
{
  int i;

  if(!uart)
80105e7a:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
80105e80:	85 d2                	test   %edx,%edx
80105e82:	74 ec                	je     80105e70 <uartinit+0x90>
  inb(COM1+0);
  picenable(IRQ_COM1);
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105e84:	83 c3 01             	add    $0x1,%ebx
80105e87:	e8 04 ff ff ff       	call   80105d90 <uartputc.part.0>
80105e8c:	0f be 03             	movsbl (%ebx),%eax
80105e8f:	84 c0                	test   %al,%al
80105e91:	75 e7                	jne    80105e7a <uartinit+0x9a>
    uartputc(*p);
}
80105e93:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105e96:	5b                   	pop    %ebx
80105e97:	5e                   	pop    %esi
80105e98:	5f                   	pop    %edi
80105e99:	5d                   	pop    %ebp
80105e9a:	c3                   	ret    
80105e9b:	90                   	nop
80105e9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105ea0 <uartputc>:
void
uartputc(int c)
{
  int i;

  if(!uart)
80105ea0:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
80105ea6:	55                   	push   %ebp
80105ea7:	89 e5                	mov    %esp,%ebp
  int i;

  if(!uart)
80105ea9:	85 d2                	test   %edx,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
80105eab:	8b 45 08             	mov    0x8(%ebp),%eax
  int i;

  if(!uart)
80105eae:	74 10                	je     80105ec0 <uartputc+0x20>
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
  outb(COM1+0, c);
}
80105eb0:	5d                   	pop    %ebp
80105eb1:	e9 da fe ff ff       	jmp    80105d90 <uartputc.part.0>
80105eb6:	8d 76 00             	lea    0x0(%esi),%esi
80105eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105ec0:	5d                   	pop    %ebp
80105ec1:	c3                   	ret    
80105ec2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105ec9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105ed0 <uartintr>:
  return inb(COM1+0);
}

void
uartintr(void)
{
80105ed0:	55                   	push   %ebp
80105ed1:	89 e5                	mov    %esp,%ebp
80105ed3:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
80105ed6:	68 60 5d 10 80       	push   $0x80105d60
80105edb:	e8 10 a9 ff ff       	call   801007f0 <consoleintr>
}
80105ee0:	83 c4 10             	add    $0x10,%esp
80105ee3:	c9                   	leave  
80105ee4:	c3                   	ret    

80105ee5 <vector0>:
80105ee5:	6a 00                	push   $0x0
80105ee7:	6a 00                	push   $0x0
80105ee9:	e9 20 fb ff ff       	jmp    80105a0e <alltraps>

80105eee <vector1>:
80105eee:	6a 00                	push   $0x0
80105ef0:	6a 01                	push   $0x1
80105ef2:	e9 17 fb ff ff       	jmp    80105a0e <alltraps>

80105ef7 <vector2>:
80105ef7:	6a 00                	push   $0x0
80105ef9:	6a 02                	push   $0x2
80105efb:	e9 0e fb ff ff       	jmp    80105a0e <alltraps>

80105f00 <vector3>:
80105f00:	6a 00                	push   $0x0
80105f02:	6a 03                	push   $0x3
80105f04:	e9 05 fb ff ff       	jmp    80105a0e <alltraps>

80105f09 <vector4>:
80105f09:	6a 00                	push   $0x0
80105f0b:	6a 04                	push   $0x4
80105f0d:	e9 fc fa ff ff       	jmp    80105a0e <alltraps>

80105f12 <vector5>:
80105f12:	6a 00                	push   $0x0
80105f14:	6a 05                	push   $0x5
80105f16:	e9 f3 fa ff ff       	jmp    80105a0e <alltraps>

80105f1b <vector6>:
80105f1b:	6a 00                	push   $0x0
80105f1d:	6a 06                	push   $0x6
80105f1f:	e9 ea fa ff ff       	jmp    80105a0e <alltraps>

80105f24 <vector7>:
80105f24:	6a 00                	push   $0x0
80105f26:	6a 07                	push   $0x7
80105f28:	e9 e1 fa ff ff       	jmp    80105a0e <alltraps>

80105f2d <vector8>:
80105f2d:	6a 08                	push   $0x8
80105f2f:	e9 da fa ff ff       	jmp    80105a0e <alltraps>

80105f34 <vector9>:
80105f34:	6a 00                	push   $0x0
80105f36:	6a 09                	push   $0x9
80105f38:	e9 d1 fa ff ff       	jmp    80105a0e <alltraps>

80105f3d <vector10>:
80105f3d:	6a 0a                	push   $0xa
80105f3f:	e9 ca fa ff ff       	jmp    80105a0e <alltraps>

80105f44 <vector11>:
80105f44:	6a 0b                	push   $0xb
80105f46:	e9 c3 fa ff ff       	jmp    80105a0e <alltraps>

80105f4b <vector12>:
80105f4b:	6a 0c                	push   $0xc
80105f4d:	e9 bc fa ff ff       	jmp    80105a0e <alltraps>

80105f52 <vector13>:
80105f52:	6a 0d                	push   $0xd
80105f54:	e9 b5 fa ff ff       	jmp    80105a0e <alltraps>

80105f59 <vector14>:
80105f59:	6a 0e                	push   $0xe
80105f5b:	e9 ae fa ff ff       	jmp    80105a0e <alltraps>

80105f60 <vector15>:
80105f60:	6a 00                	push   $0x0
80105f62:	6a 0f                	push   $0xf
80105f64:	e9 a5 fa ff ff       	jmp    80105a0e <alltraps>

80105f69 <vector16>:
80105f69:	6a 00                	push   $0x0
80105f6b:	6a 10                	push   $0x10
80105f6d:	e9 9c fa ff ff       	jmp    80105a0e <alltraps>

80105f72 <vector17>:
80105f72:	6a 11                	push   $0x11
80105f74:	e9 95 fa ff ff       	jmp    80105a0e <alltraps>

80105f79 <vector18>:
80105f79:	6a 00                	push   $0x0
80105f7b:	6a 12                	push   $0x12
80105f7d:	e9 8c fa ff ff       	jmp    80105a0e <alltraps>

80105f82 <vector19>:
80105f82:	6a 00                	push   $0x0
80105f84:	6a 13                	push   $0x13
80105f86:	e9 83 fa ff ff       	jmp    80105a0e <alltraps>

80105f8b <vector20>:
80105f8b:	6a 00                	push   $0x0
80105f8d:	6a 14                	push   $0x14
80105f8f:	e9 7a fa ff ff       	jmp    80105a0e <alltraps>

80105f94 <vector21>:
80105f94:	6a 00                	push   $0x0
80105f96:	6a 15                	push   $0x15
80105f98:	e9 71 fa ff ff       	jmp    80105a0e <alltraps>

80105f9d <vector22>:
80105f9d:	6a 00                	push   $0x0
80105f9f:	6a 16                	push   $0x16
80105fa1:	e9 68 fa ff ff       	jmp    80105a0e <alltraps>

80105fa6 <vector23>:
80105fa6:	6a 00                	push   $0x0
80105fa8:	6a 17                	push   $0x17
80105faa:	e9 5f fa ff ff       	jmp    80105a0e <alltraps>

80105faf <vector24>:
80105faf:	6a 00                	push   $0x0
80105fb1:	6a 18                	push   $0x18
80105fb3:	e9 56 fa ff ff       	jmp    80105a0e <alltraps>

80105fb8 <vector25>:
80105fb8:	6a 00                	push   $0x0
80105fba:	6a 19                	push   $0x19
80105fbc:	e9 4d fa ff ff       	jmp    80105a0e <alltraps>

80105fc1 <vector26>:
80105fc1:	6a 00                	push   $0x0
80105fc3:	6a 1a                	push   $0x1a
80105fc5:	e9 44 fa ff ff       	jmp    80105a0e <alltraps>

80105fca <vector27>:
80105fca:	6a 00                	push   $0x0
80105fcc:	6a 1b                	push   $0x1b
80105fce:	e9 3b fa ff ff       	jmp    80105a0e <alltraps>

80105fd3 <vector28>:
80105fd3:	6a 00                	push   $0x0
80105fd5:	6a 1c                	push   $0x1c
80105fd7:	e9 32 fa ff ff       	jmp    80105a0e <alltraps>

80105fdc <vector29>:
80105fdc:	6a 00                	push   $0x0
80105fde:	6a 1d                	push   $0x1d
80105fe0:	e9 29 fa ff ff       	jmp    80105a0e <alltraps>

80105fe5 <vector30>:
80105fe5:	6a 00                	push   $0x0
80105fe7:	6a 1e                	push   $0x1e
80105fe9:	e9 20 fa ff ff       	jmp    80105a0e <alltraps>

80105fee <vector31>:
80105fee:	6a 00                	push   $0x0
80105ff0:	6a 1f                	push   $0x1f
80105ff2:	e9 17 fa ff ff       	jmp    80105a0e <alltraps>

80105ff7 <vector32>:
80105ff7:	6a 00                	push   $0x0
80105ff9:	6a 20                	push   $0x20
80105ffb:	e9 0e fa ff ff       	jmp    80105a0e <alltraps>

80106000 <vector33>:
80106000:	6a 00                	push   $0x0
80106002:	6a 21                	push   $0x21
80106004:	e9 05 fa ff ff       	jmp    80105a0e <alltraps>

80106009 <vector34>:
80106009:	6a 00                	push   $0x0
8010600b:	6a 22                	push   $0x22
8010600d:	e9 fc f9 ff ff       	jmp    80105a0e <alltraps>

80106012 <vector35>:
80106012:	6a 00                	push   $0x0
80106014:	6a 23                	push   $0x23
80106016:	e9 f3 f9 ff ff       	jmp    80105a0e <alltraps>

8010601b <vector36>:
8010601b:	6a 00                	push   $0x0
8010601d:	6a 24                	push   $0x24
8010601f:	e9 ea f9 ff ff       	jmp    80105a0e <alltraps>

80106024 <vector37>:
80106024:	6a 00                	push   $0x0
80106026:	6a 25                	push   $0x25
80106028:	e9 e1 f9 ff ff       	jmp    80105a0e <alltraps>

8010602d <vector38>:
8010602d:	6a 00                	push   $0x0
8010602f:	6a 26                	push   $0x26
80106031:	e9 d8 f9 ff ff       	jmp    80105a0e <alltraps>

80106036 <vector39>:
80106036:	6a 00                	push   $0x0
80106038:	6a 27                	push   $0x27
8010603a:	e9 cf f9 ff ff       	jmp    80105a0e <alltraps>

8010603f <vector40>:
8010603f:	6a 00                	push   $0x0
80106041:	6a 28                	push   $0x28
80106043:	e9 c6 f9 ff ff       	jmp    80105a0e <alltraps>

80106048 <vector41>:
80106048:	6a 00                	push   $0x0
8010604a:	6a 29                	push   $0x29
8010604c:	e9 bd f9 ff ff       	jmp    80105a0e <alltraps>

80106051 <vector42>:
80106051:	6a 00                	push   $0x0
80106053:	6a 2a                	push   $0x2a
80106055:	e9 b4 f9 ff ff       	jmp    80105a0e <alltraps>

8010605a <vector43>:
8010605a:	6a 00                	push   $0x0
8010605c:	6a 2b                	push   $0x2b
8010605e:	e9 ab f9 ff ff       	jmp    80105a0e <alltraps>

80106063 <vector44>:
80106063:	6a 00                	push   $0x0
80106065:	6a 2c                	push   $0x2c
80106067:	e9 a2 f9 ff ff       	jmp    80105a0e <alltraps>

8010606c <vector45>:
8010606c:	6a 00                	push   $0x0
8010606e:	6a 2d                	push   $0x2d
80106070:	e9 99 f9 ff ff       	jmp    80105a0e <alltraps>

80106075 <vector46>:
80106075:	6a 00                	push   $0x0
80106077:	6a 2e                	push   $0x2e
80106079:	e9 90 f9 ff ff       	jmp    80105a0e <alltraps>

8010607e <vector47>:
8010607e:	6a 00                	push   $0x0
80106080:	6a 2f                	push   $0x2f
80106082:	e9 87 f9 ff ff       	jmp    80105a0e <alltraps>

80106087 <vector48>:
80106087:	6a 00                	push   $0x0
80106089:	6a 30                	push   $0x30
8010608b:	e9 7e f9 ff ff       	jmp    80105a0e <alltraps>

80106090 <vector49>:
80106090:	6a 00                	push   $0x0
80106092:	6a 31                	push   $0x31
80106094:	e9 75 f9 ff ff       	jmp    80105a0e <alltraps>

80106099 <vector50>:
80106099:	6a 00                	push   $0x0
8010609b:	6a 32                	push   $0x32
8010609d:	e9 6c f9 ff ff       	jmp    80105a0e <alltraps>

801060a2 <vector51>:
801060a2:	6a 00                	push   $0x0
801060a4:	6a 33                	push   $0x33
801060a6:	e9 63 f9 ff ff       	jmp    80105a0e <alltraps>

801060ab <vector52>:
801060ab:	6a 00                	push   $0x0
801060ad:	6a 34                	push   $0x34
801060af:	e9 5a f9 ff ff       	jmp    80105a0e <alltraps>

801060b4 <vector53>:
801060b4:	6a 00                	push   $0x0
801060b6:	6a 35                	push   $0x35
801060b8:	e9 51 f9 ff ff       	jmp    80105a0e <alltraps>

801060bd <vector54>:
801060bd:	6a 00                	push   $0x0
801060bf:	6a 36                	push   $0x36
801060c1:	e9 48 f9 ff ff       	jmp    80105a0e <alltraps>

801060c6 <vector55>:
801060c6:	6a 00                	push   $0x0
801060c8:	6a 37                	push   $0x37
801060ca:	e9 3f f9 ff ff       	jmp    80105a0e <alltraps>

801060cf <vector56>:
801060cf:	6a 00                	push   $0x0
801060d1:	6a 38                	push   $0x38
801060d3:	e9 36 f9 ff ff       	jmp    80105a0e <alltraps>

801060d8 <vector57>:
801060d8:	6a 00                	push   $0x0
801060da:	6a 39                	push   $0x39
801060dc:	e9 2d f9 ff ff       	jmp    80105a0e <alltraps>

801060e1 <vector58>:
801060e1:	6a 00                	push   $0x0
801060e3:	6a 3a                	push   $0x3a
801060e5:	e9 24 f9 ff ff       	jmp    80105a0e <alltraps>

801060ea <vector59>:
801060ea:	6a 00                	push   $0x0
801060ec:	6a 3b                	push   $0x3b
801060ee:	e9 1b f9 ff ff       	jmp    80105a0e <alltraps>

801060f3 <vector60>:
801060f3:	6a 00                	push   $0x0
801060f5:	6a 3c                	push   $0x3c
801060f7:	e9 12 f9 ff ff       	jmp    80105a0e <alltraps>

801060fc <vector61>:
801060fc:	6a 00                	push   $0x0
801060fe:	6a 3d                	push   $0x3d
80106100:	e9 09 f9 ff ff       	jmp    80105a0e <alltraps>

80106105 <vector62>:
80106105:	6a 00                	push   $0x0
80106107:	6a 3e                	push   $0x3e
80106109:	e9 00 f9 ff ff       	jmp    80105a0e <alltraps>

8010610e <vector63>:
8010610e:	6a 00                	push   $0x0
80106110:	6a 3f                	push   $0x3f
80106112:	e9 f7 f8 ff ff       	jmp    80105a0e <alltraps>

80106117 <vector64>:
80106117:	6a 00                	push   $0x0
80106119:	6a 40                	push   $0x40
8010611b:	e9 ee f8 ff ff       	jmp    80105a0e <alltraps>

80106120 <vector65>:
80106120:	6a 00                	push   $0x0
80106122:	6a 41                	push   $0x41
80106124:	e9 e5 f8 ff ff       	jmp    80105a0e <alltraps>

80106129 <vector66>:
80106129:	6a 00                	push   $0x0
8010612b:	6a 42                	push   $0x42
8010612d:	e9 dc f8 ff ff       	jmp    80105a0e <alltraps>

80106132 <vector67>:
80106132:	6a 00                	push   $0x0
80106134:	6a 43                	push   $0x43
80106136:	e9 d3 f8 ff ff       	jmp    80105a0e <alltraps>

8010613b <vector68>:
8010613b:	6a 00                	push   $0x0
8010613d:	6a 44                	push   $0x44
8010613f:	e9 ca f8 ff ff       	jmp    80105a0e <alltraps>

80106144 <vector69>:
80106144:	6a 00                	push   $0x0
80106146:	6a 45                	push   $0x45
80106148:	e9 c1 f8 ff ff       	jmp    80105a0e <alltraps>

8010614d <vector70>:
8010614d:	6a 00                	push   $0x0
8010614f:	6a 46                	push   $0x46
80106151:	e9 b8 f8 ff ff       	jmp    80105a0e <alltraps>

80106156 <vector71>:
80106156:	6a 00                	push   $0x0
80106158:	6a 47                	push   $0x47
8010615a:	e9 af f8 ff ff       	jmp    80105a0e <alltraps>

8010615f <vector72>:
8010615f:	6a 00                	push   $0x0
80106161:	6a 48                	push   $0x48
80106163:	e9 a6 f8 ff ff       	jmp    80105a0e <alltraps>

80106168 <vector73>:
80106168:	6a 00                	push   $0x0
8010616a:	6a 49                	push   $0x49
8010616c:	e9 9d f8 ff ff       	jmp    80105a0e <alltraps>

80106171 <vector74>:
80106171:	6a 00                	push   $0x0
80106173:	6a 4a                	push   $0x4a
80106175:	e9 94 f8 ff ff       	jmp    80105a0e <alltraps>

8010617a <vector75>:
8010617a:	6a 00                	push   $0x0
8010617c:	6a 4b                	push   $0x4b
8010617e:	e9 8b f8 ff ff       	jmp    80105a0e <alltraps>

80106183 <vector76>:
80106183:	6a 00                	push   $0x0
80106185:	6a 4c                	push   $0x4c
80106187:	e9 82 f8 ff ff       	jmp    80105a0e <alltraps>

8010618c <vector77>:
8010618c:	6a 00                	push   $0x0
8010618e:	6a 4d                	push   $0x4d
80106190:	e9 79 f8 ff ff       	jmp    80105a0e <alltraps>

80106195 <vector78>:
80106195:	6a 00                	push   $0x0
80106197:	6a 4e                	push   $0x4e
80106199:	e9 70 f8 ff ff       	jmp    80105a0e <alltraps>

8010619e <vector79>:
8010619e:	6a 00                	push   $0x0
801061a0:	6a 4f                	push   $0x4f
801061a2:	e9 67 f8 ff ff       	jmp    80105a0e <alltraps>

801061a7 <vector80>:
801061a7:	6a 00                	push   $0x0
801061a9:	6a 50                	push   $0x50
801061ab:	e9 5e f8 ff ff       	jmp    80105a0e <alltraps>

801061b0 <vector81>:
801061b0:	6a 00                	push   $0x0
801061b2:	6a 51                	push   $0x51
801061b4:	e9 55 f8 ff ff       	jmp    80105a0e <alltraps>

801061b9 <vector82>:
801061b9:	6a 00                	push   $0x0
801061bb:	6a 52                	push   $0x52
801061bd:	e9 4c f8 ff ff       	jmp    80105a0e <alltraps>

801061c2 <vector83>:
801061c2:	6a 00                	push   $0x0
801061c4:	6a 53                	push   $0x53
801061c6:	e9 43 f8 ff ff       	jmp    80105a0e <alltraps>

801061cb <vector84>:
801061cb:	6a 00                	push   $0x0
801061cd:	6a 54                	push   $0x54
801061cf:	e9 3a f8 ff ff       	jmp    80105a0e <alltraps>

801061d4 <vector85>:
801061d4:	6a 00                	push   $0x0
801061d6:	6a 55                	push   $0x55
801061d8:	e9 31 f8 ff ff       	jmp    80105a0e <alltraps>

801061dd <vector86>:
801061dd:	6a 00                	push   $0x0
801061df:	6a 56                	push   $0x56
801061e1:	e9 28 f8 ff ff       	jmp    80105a0e <alltraps>

801061e6 <vector87>:
801061e6:	6a 00                	push   $0x0
801061e8:	6a 57                	push   $0x57
801061ea:	e9 1f f8 ff ff       	jmp    80105a0e <alltraps>

801061ef <vector88>:
801061ef:	6a 00                	push   $0x0
801061f1:	6a 58                	push   $0x58
801061f3:	e9 16 f8 ff ff       	jmp    80105a0e <alltraps>

801061f8 <vector89>:
801061f8:	6a 00                	push   $0x0
801061fa:	6a 59                	push   $0x59
801061fc:	e9 0d f8 ff ff       	jmp    80105a0e <alltraps>

80106201 <vector90>:
80106201:	6a 00                	push   $0x0
80106203:	6a 5a                	push   $0x5a
80106205:	e9 04 f8 ff ff       	jmp    80105a0e <alltraps>

8010620a <vector91>:
8010620a:	6a 00                	push   $0x0
8010620c:	6a 5b                	push   $0x5b
8010620e:	e9 fb f7 ff ff       	jmp    80105a0e <alltraps>

80106213 <vector92>:
80106213:	6a 00                	push   $0x0
80106215:	6a 5c                	push   $0x5c
80106217:	e9 f2 f7 ff ff       	jmp    80105a0e <alltraps>

8010621c <vector93>:
8010621c:	6a 00                	push   $0x0
8010621e:	6a 5d                	push   $0x5d
80106220:	e9 e9 f7 ff ff       	jmp    80105a0e <alltraps>

80106225 <vector94>:
80106225:	6a 00                	push   $0x0
80106227:	6a 5e                	push   $0x5e
80106229:	e9 e0 f7 ff ff       	jmp    80105a0e <alltraps>

8010622e <vector95>:
8010622e:	6a 00                	push   $0x0
80106230:	6a 5f                	push   $0x5f
80106232:	e9 d7 f7 ff ff       	jmp    80105a0e <alltraps>

80106237 <vector96>:
80106237:	6a 00                	push   $0x0
80106239:	6a 60                	push   $0x60
8010623b:	e9 ce f7 ff ff       	jmp    80105a0e <alltraps>

80106240 <vector97>:
80106240:	6a 00                	push   $0x0
80106242:	6a 61                	push   $0x61
80106244:	e9 c5 f7 ff ff       	jmp    80105a0e <alltraps>

80106249 <vector98>:
80106249:	6a 00                	push   $0x0
8010624b:	6a 62                	push   $0x62
8010624d:	e9 bc f7 ff ff       	jmp    80105a0e <alltraps>

80106252 <vector99>:
80106252:	6a 00                	push   $0x0
80106254:	6a 63                	push   $0x63
80106256:	e9 b3 f7 ff ff       	jmp    80105a0e <alltraps>

8010625b <vector100>:
8010625b:	6a 00                	push   $0x0
8010625d:	6a 64                	push   $0x64
8010625f:	e9 aa f7 ff ff       	jmp    80105a0e <alltraps>

80106264 <vector101>:
80106264:	6a 00                	push   $0x0
80106266:	6a 65                	push   $0x65
80106268:	e9 a1 f7 ff ff       	jmp    80105a0e <alltraps>

8010626d <vector102>:
8010626d:	6a 00                	push   $0x0
8010626f:	6a 66                	push   $0x66
80106271:	e9 98 f7 ff ff       	jmp    80105a0e <alltraps>

80106276 <vector103>:
80106276:	6a 00                	push   $0x0
80106278:	6a 67                	push   $0x67
8010627a:	e9 8f f7 ff ff       	jmp    80105a0e <alltraps>

8010627f <vector104>:
8010627f:	6a 00                	push   $0x0
80106281:	6a 68                	push   $0x68
80106283:	e9 86 f7 ff ff       	jmp    80105a0e <alltraps>

80106288 <vector105>:
80106288:	6a 00                	push   $0x0
8010628a:	6a 69                	push   $0x69
8010628c:	e9 7d f7 ff ff       	jmp    80105a0e <alltraps>

80106291 <vector106>:
80106291:	6a 00                	push   $0x0
80106293:	6a 6a                	push   $0x6a
80106295:	e9 74 f7 ff ff       	jmp    80105a0e <alltraps>

8010629a <vector107>:
8010629a:	6a 00                	push   $0x0
8010629c:	6a 6b                	push   $0x6b
8010629e:	e9 6b f7 ff ff       	jmp    80105a0e <alltraps>

801062a3 <vector108>:
801062a3:	6a 00                	push   $0x0
801062a5:	6a 6c                	push   $0x6c
801062a7:	e9 62 f7 ff ff       	jmp    80105a0e <alltraps>

801062ac <vector109>:
801062ac:	6a 00                	push   $0x0
801062ae:	6a 6d                	push   $0x6d
801062b0:	e9 59 f7 ff ff       	jmp    80105a0e <alltraps>

801062b5 <vector110>:
801062b5:	6a 00                	push   $0x0
801062b7:	6a 6e                	push   $0x6e
801062b9:	e9 50 f7 ff ff       	jmp    80105a0e <alltraps>

801062be <vector111>:
801062be:	6a 00                	push   $0x0
801062c0:	6a 6f                	push   $0x6f
801062c2:	e9 47 f7 ff ff       	jmp    80105a0e <alltraps>

801062c7 <vector112>:
801062c7:	6a 00                	push   $0x0
801062c9:	6a 70                	push   $0x70
801062cb:	e9 3e f7 ff ff       	jmp    80105a0e <alltraps>

801062d0 <vector113>:
801062d0:	6a 00                	push   $0x0
801062d2:	6a 71                	push   $0x71
801062d4:	e9 35 f7 ff ff       	jmp    80105a0e <alltraps>

801062d9 <vector114>:
801062d9:	6a 00                	push   $0x0
801062db:	6a 72                	push   $0x72
801062dd:	e9 2c f7 ff ff       	jmp    80105a0e <alltraps>

801062e2 <vector115>:
801062e2:	6a 00                	push   $0x0
801062e4:	6a 73                	push   $0x73
801062e6:	e9 23 f7 ff ff       	jmp    80105a0e <alltraps>

801062eb <vector116>:
801062eb:	6a 00                	push   $0x0
801062ed:	6a 74                	push   $0x74
801062ef:	e9 1a f7 ff ff       	jmp    80105a0e <alltraps>

801062f4 <vector117>:
801062f4:	6a 00                	push   $0x0
801062f6:	6a 75                	push   $0x75
801062f8:	e9 11 f7 ff ff       	jmp    80105a0e <alltraps>

801062fd <vector118>:
801062fd:	6a 00                	push   $0x0
801062ff:	6a 76                	push   $0x76
80106301:	e9 08 f7 ff ff       	jmp    80105a0e <alltraps>

80106306 <vector119>:
80106306:	6a 00                	push   $0x0
80106308:	6a 77                	push   $0x77
8010630a:	e9 ff f6 ff ff       	jmp    80105a0e <alltraps>

8010630f <vector120>:
8010630f:	6a 00                	push   $0x0
80106311:	6a 78                	push   $0x78
80106313:	e9 f6 f6 ff ff       	jmp    80105a0e <alltraps>

80106318 <vector121>:
80106318:	6a 00                	push   $0x0
8010631a:	6a 79                	push   $0x79
8010631c:	e9 ed f6 ff ff       	jmp    80105a0e <alltraps>

80106321 <vector122>:
80106321:	6a 00                	push   $0x0
80106323:	6a 7a                	push   $0x7a
80106325:	e9 e4 f6 ff ff       	jmp    80105a0e <alltraps>

8010632a <vector123>:
8010632a:	6a 00                	push   $0x0
8010632c:	6a 7b                	push   $0x7b
8010632e:	e9 db f6 ff ff       	jmp    80105a0e <alltraps>

80106333 <vector124>:
80106333:	6a 00                	push   $0x0
80106335:	6a 7c                	push   $0x7c
80106337:	e9 d2 f6 ff ff       	jmp    80105a0e <alltraps>

8010633c <vector125>:
8010633c:	6a 00                	push   $0x0
8010633e:	6a 7d                	push   $0x7d
80106340:	e9 c9 f6 ff ff       	jmp    80105a0e <alltraps>

80106345 <vector126>:
80106345:	6a 00                	push   $0x0
80106347:	6a 7e                	push   $0x7e
80106349:	e9 c0 f6 ff ff       	jmp    80105a0e <alltraps>

8010634e <vector127>:
8010634e:	6a 00                	push   $0x0
80106350:	6a 7f                	push   $0x7f
80106352:	e9 b7 f6 ff ff       	jmp    80105a0e <alltraps>

80106357 <vector128>:
80106357:	6a 00                	push   $0x0
80106359:	68 80 00 00 00       	push   $0x80
8010635e:	e9 ab f6 ff ff       	jmp    80105a0e <alltraps>

80106363 <vector129>:
80106363:	6a 00                	push   $0x0
80106365:	68 81 00 00 00       	push   $0x81
8010636a:	e9 9f f6 ff ff       	jmp    80105a0e <alltraps>

8010636f <vector130>:
8010636f:	6a 00                	push   $0x0
80106371:	68 82 00 00 00       	push   $0x82
80106376:	e9 93 f6 ff ff       	jmp    80105a0e <alltraps>

8010637b <vector131>:
8010637b:	6a 00                	push   $0x0
8010637d:	68 83 00 00 00       	push   $0x83
80106382:	e9 87 f6 ff ff       	jmp    80105a0e <alltraps>

80106387 <vector132>:
80106387:	6a 00                	push   $0x0
80106389:	68 84 00 00 00       	push   $0x84
8010638e:	e9 7b f6 ff ff       	jmp    80105a0e <alltraps>

80106393 <vector133>:
80106393:	6a 00                	push   $0x0
80106395:	68 85 00 00 00       	push   $0x85
8010639a:	e9 6f f6 ff ff       	jmp    80105a0e <alltraps>

8010639f <vector134>:
8010639f:	6a 00                	push   $0x0
801063a1:	68 86 00 00 00       	push   $0x86
801063a6:	e9 63 f6 ff ff       	jmp    80105a0e <alltraps>

801063ab <vector135>:
801063ab:	6a 00                	push   $0x0
801063ad:	68 87 00 00 00       	push   $0x87
801063b2:	e9 57 f6 ff ff       	jmp    80105a0e <alltraps>

801063b7 <vector136>:
801063b7:	6a 00                	push   $0x0
801063b9:	68 88 00 00 00       	push   $0x88
801063be:	e9 4b f6 ff ff       	jmp    80105a0e <alltraps>

801063c3 <vector137>:
801063c3:	6a 00                	push   $0x0
801063c5:	68 89 00 00 00       	push   $0x89
801063ca:	e9 3f f6 ff ff       	jmp    80105a0e <alltraps>

801063cf <vector138>:
801063cf:	6a 00                	push   $0x0
801063d1:	68 8a 00 00 00       	push   $0x8a
801063d6:	e9 33 f6 ff ff       	jmp    80105a0e <alltraps>

801063db <vector139>:
801063db:	6a 00                	push   $0x0
801063dd:	68 8b 00 00 00       	push   $0x8b
801063e2:	e9 27 f6 ff ff       	jmp    80105a0e <alltraps>

801063e7 <vector140>:
801063e7:	6a 00                	push   $0x0
801063e9:	68 8c 00 00 00       	push   $0x8c
801063ee:	e9 1b f6 ff ff       	jmp    80105a0e <alltraps>

801063f3 <vector141>:
801063f3:	6a 00                	push   $0x0
801063f5:	68 8d 00 00 00       	push   $0x8d
801063fa:	e9 0f f6 ff ff       	jmp    80105a0e <alltraps>

801063ff <vector142>:
801063ff:	6a 00                	push   $0x0
80106401:	68 8e 00 00 00       	push   $0x8e
80106406:	e9 03 f6 ff ff       	jmp    80105a0e <alltraps>

8010640b <vector143>:
8010640b:	6a 00                	push   $0x0
8010640d:	68 8f 00 00 00       	push   $0x8f
80106412:	e9 f7 f5 ff ff       	jmp    80105a0e <alltraps>

80106417 <vector144>:
80106417:	6a 00                	push   $0x0
80106419:	68 90 00 00 00       	push   $0x90
8010641e:	e9 eb f5 ff ff       	jmp    80105a0e <alltraps>

80106423 <vector145>:
80106423:	6a 00                	push   $0x0
80106425:	68 91 00 00 00       	push   $0x91
8010642a:	e9 df f5 ff ff       	jmp    80105a0e <alltraps>

8010642f <vector146>:
8010642f:	6a 00                	push   $0x0
80106431:	68 92 00 00 00       	push   $0x92
80106436:	e9 d3 f5 ff ff       	jmp    80105a0e <alltraps>

8010643b <vector147>:
8010643b:	6a 00                	push   $0x0
8010643d:	68 93 00 00 00       	push   $0x93
80106442:	e9 c7 f5 ff ff       	jmp    80105a0e <alltraps>

80106447 <vector148>:
80106447:	6a 00                	push   $0x0
80106449:	68 94 00 00 00       	push   $0x94
8010644e:	e9 bb f5 ff ff       	jmp    80105a0e <alltraps>

80106453 <vector149>:
80106453:	6a 00                	push   $0x0
80106455:	68 95 00 00 00       	push   $0x95
8010645a:	e9 af f5 ff ff       	jmp    80105a0e <alltraps>

8010645f <vector150>:
8010645f:	6a 00                	push   $0x0
80106461:	68 96 00 00 00       	push   $0x96
80106466:	e9 a3 f5 ff ff       	jmp    80105a0e <alltraps>

8010646b <vector151>:
8010646b:	6a 00                	push   $0x0
8010646d:	68 97 00 00 00       	push   $0x97
80106472:	e9 97 f5 ff ff       	jmp    80105a0e <alltraps>

80106477 <vector152>:
80106477:	6a 00                	push   $0x0
80106479:	68 98 00 00 00       	push   $0x98
8010647e:	e9 8b f5 ff ff       	jmp    80105a0e <alltraps>

80106483 <vector153>:
80106483:	6a 00                	push   $0x0
80106485:	68 99 00 00 00       	push   $0x99
8010648a:	e9 7f f5 ff ff       	jmp    80105a0e <alltraps>

8010648f <vector154>:
8010648f:	6a 00                	push   $0x0
80106491:	68 9a 00 00 00       	push   $0x9a
80106496:	e9 73 f5 ff ff       	jmp    80105a0e <alltraps>

8010649b <vector155>:
8010649b:	6a 00                	push   $0x0
8010649d:	68 9b 00 00 00       	push   $0x9b
801064a2:	e9 67 f5 ff ff       	jmp    80105a0e <alltraps>

801064a7 <vector156>:
801064a7:	6a 00                	push   $0x0
801064a9:	68 9c 00 00 00       	push   $0x9c
801064ae:	e9 5b f5 ff ff       	jmp    80105a0e <alltraps>

801064b3 <vector157>:
801064b3:	6a 00                	push   $0x0
801064b5:	68 9d 00 00 00       	push   $0x9d
801064ba:	e9 4f f5 ff ff       	jmp    80105a0e <alltraps>

801064bf <vector158>:
801064bf:	6a 00                	push   $0x0
801064c1:	68 9e 00 00 00       	push   $0x9e
801064c6:	e9 43 f5 ff ff       	jmp    80105a0e <alltraps>

801064cb <vector159>:
801064cb:	6a 00                	push   $0x0
801064cd:	68 9f 00 00 00       	push   $0x9f
801064d2:	e9 37 f5 ff ff       	jmp    80105a0e <alltraps>

801064d7 <vector160>:
801064d7:	6a 00                	push   $0x0
801064d9:	68 a0 00 00 00       	push   $0xa0
801064de:	e9 2b f5 ff ff       	jmp    80105a0e <alltraps>

801064e3 <vector161>:
801064e3:	6a 00                	push   $0x0
801064e5:	68 a1 00 00 00       	push   $0xa1
801064ea:	e9 1f f5 ff ff       	jmp    80105a0e <alltraps>

801064ef <vector162>:
801064ef:	6a 00                	push   $0x0
801064f1:	68 a2 00 00 00       	push   $0xa2
801064f6:	e9 13 f5 ff ff       	jmp    80105a0e <alltraps>

801064fb <vector163>:
801064fb:	6a 00                	push   $0x0
801064fd:	68 a3 00 00 00       	push   $0xa3
80106502:	e9 07 f5 ff ff       	jmp    80105a0e <alltraps>

80106507 <vector164>:
80106507:	6a 00                	push   $0x0
80106509:	68 a4 00 00 00       	push   $0xa4
8010650e:	e9 fb f4 ff ff       	jmp    80105a0e <alltraps>

80106513 <vector165>:
80106513:	6a 00                	push   $0x0
80106515:	68 a5 00 00 00       	push   $0xa5
8010651a:	e9 ef f4 ff ff       	jmp    80105a0e <alltraps>

8010651f <vector166>:
8010651f:	6a 00                	push   $0x0
80106521:	68 a6 00 00 00       	push   $0xa6
80106526:	e9 e3 f4 ff ff       	jmp    80105a0e <alltraps>

8010652b <vector167>:
8010652b:	6a 00                	push   $0x0
8010652d:	68 a7 00 00 00       	push   $0xa7
80106532:	e9 d7 f4 ff ff       	jmp    80105a0e <alltraps>

80106537 <vector168>:
80106537:	6a 00                	push   $0x0
80106539:	68 a8 00 00 00       	push   $0xa8
8010653e:	e9 cb f4 ff ff       	jmp    80105a0e <alltraps>

80106543 <vector169>:
80106543:	6a 00                	push   $0x0
80106545:	68 a9 00 00 00       	push   $0xa9
8010654a:	e9 bf f4 ff ff       	jmp    80105a0e <alltraps>

8010654f <vector170>:
8010654f:	6a 00                	push   $0x0
80106551:	68 aa 00 00 00       	push   $0xaa
80106556:	e9 b3 f4 ff ff       	jmp    80105a0e <alltraps>

8010655b <vector171>:
8010655b:	6a 00                	push   $0x0
8010655d:	68 ab 00 00 00       	push   $0xab
80106562:	e9 a7 f4 ff ff       	jmp    80105a0e <alltraps>

80106567 <vector172>:
80106567:	6a 00                	push   $0x0
80106569:	68 ac 00 00 00       	push   $0xac
8010656e:	e9 9b f4 ff ff       	jmp    80105a0e <alltraps>

80106573 <vector173>:
80106573:	6a 00                	push   $0x0
80106575:	68 ad 00 00 00       	push   $0xad
8010657a:	e9 8f f4 ff ff       	jmp    80105a0e <alltraps>

8010657f <vector174>:
8010657f:	6a 00                	push   $0x0
80106581:	68 ae 00 00 00       	push   $0xae
80106586:	e9 83 f4 ff ff       	jmp    80105a0e <alltraps>

8010658b <vector175>:
8010658b:	6a 00                	push   $0x0
8010658d:	68 af 00 00 00       	push   $0xaf
80106592:	e9 77 f4 ff ff       	jmp    80105a0e <alltraps>

80106597 <vector176>:
80106597:	6a 00                	push   $0x0
80106599:	68 b0 00 00 00       	push   $0xb0
8010659e:	e9 6b f4 ff ff       	jmp    80105a0e <alltraps>

801065a3 <vector177>:
801065a3:	6a 00                	push   $0x0
801065a5:	68 b1 00 00 00       	push   $0xb1
801065aa:	e9 5f f4 ff ff       	jmp    80105a0e <alltraps>

801065af <vector178>:
801065af:	6a 00                	push   $0x0
801065b1:	68 b2 00 00 00       	push   $0xb2
801065b6:	e9 53 f4 ff ff       	jmp    80105a0e <alltraps>

801065bb <vector179>:
801065bb:	6a 00                	push   $0x0
801065bd:	68 b3 00 00 00       	push   $0xb3
801065c2:	e9 47 f4 ff ff       	jmp    80105a0e <alltraps>

801065c7 <vector180>:
801065c7:	6a 00                	push   $0x0
801065c9:	68 b4 00 00 00       	push   $0xb4
801065ce:	e9 3b f4 ff ff       	jmp    80105a0e <alltraps>

801065d3 <vector181>:
801065d3:	6a 00                	push   $0x0
801065d5:	68 b5 00 00 00       	push   $0xb5
801065da:	e9 2f f4 ff ff       	jmp    80105a0e <alltraps>

801065df <vector182>:
801065df:	6a 00                	push   $0x0
801065e1:	68 b6 00 00 00       	push   $0xb6
801065e6:	e9 23 f4 ff ff       	jmp    80105a0e <alltraps>

801065eb <vector183>:
801065eb:	6a 00                	push   $0x0
801065ed:	68 b7 00 00 00       	push   $0xb7
801065f2:	e9 17 f4 ff ff       	jmp    80105a0e <alltraps>

801065f7 <vector184>:
801065f7:	6a 00                	push   $0x0
801065f9:	68 b8 00 00 00       	push   $0xb8
801065fe:	e9 0b f4 ff ff       	jmp    80105a0e <alltraps>

80106603 <vector185>:
80106603:	6a 00                	push   $0x0
80106605:	68 b9 00 00 00       	push   $0xb9
8010660a:	e9 ff f3 ff ff       	jmp    80105a0e <alltraps>

8010660f <vector186>:
8010660f:	6a 00                	push   $0x0
80106611:	68 ba 00 00 00       	push   $0xba
80106616:	e9 f3 f3 ff ff       	jmp    80105a0e <alltraps>

8010661b <vector187>:
8010661b:	6a 00                	push   $0x0
8010661d:	68 bb 00 00 00       	push   $0xbb
80106622:	e9 e7 f3 ff ff       	jmp    80105a0e <alltraps>

80106627 <vector188>:
80106627:	6a 00                	push   $0x0
80106629:	68 bc 00 00 00       	push   $0xbc
8010662e:	e9 db f3 ff ff       	jmp    80105a0e <alltraps>

80106633 <vector189>:
80106633:	6a 00                	push   $0x0
80106635:	68 bd 00 00 00       	push   $0xbd
8010663a:	e9 cf f3 ff ff       	jmp    80105a0e <alltraps>

8010663f <vector190>:
8010663f:	6a 00                	push   $0x0
80106641:	68 be 00 00 00       	push   $0xbe
80106646:	e9 c3 f3 ff ff       	jmp    80105a0e <alltraps>

8010664b <vector191>:
8010664b:	6a 00                	push   $0x0
8010664d:	68 bf 00 00 00       	push   $0xbf
80106652:	e9 b7 f3 ff ff       	jmp    80105a0e <alltraps>

80106657 <vector192>:
80106657:	6a 00                	push   $0x0
80106659:	68 c0 00 00 00       	push   $0xc0
8010665e:	e9 ab f3 ff ff       	jmp    80105a0e <alltraps>

80106663 <vector193>:
80106663:	6a 00                	push   $0x0
80106665:	68 c1 00 00 00       	push   $0xc1
8010666a:	e9 9f f3 ff ff       	jmp    80105a0e <alltraps>

8010666f <vector194>:
8010666f:	6a 00                	push   $0x0
80106671:	68 c2 00 00 00       	push   $0xc2
80106676:	e9 93 f3 ff ff       	jmp    80105a0e <alltraps>

8010667b <vector195>:
8010667b:	6a 00                	push   $0x0
8010667d:	68 c3 00 00 00       	push   $0xc3
80106682:	e9 87 f3 ff ff       	jmp    80105a0e <alltraps>

80106687 <vector196>:
80106687:	6a 00                	push   $0x0
80106689:	68 c4 00 00 00       	push   $0xc4
8010668e:	e9 7b f3 ff ff       	jmp    80105a0e <alltraps>

80106693 <vector197>:
80106693:	6a 00                	push   $0x0
80106695:	68 c5 00 00 00       	push   $0xc5
8010669a:	e9 6f f3 ff ff       	jmp    80105a0e <alltraps>

8010669f <vector198>:
8010669f:	6a 00                	push   $0x0
801066a1:	68 c6 00 00 00       	push   $0xc6
801066a6:	e9 63 f3 ff ff       	jmp    80105a0e <alltraps>

801066ab <vector199>:
801066ab:	6a 00                	push   $0x0
801066ad:	68 c7 00 00 00       	push   $0xc7
801066b2:	e9 57 f3 ff ff       	jmp    80105a0e <alltraps>

801066b7 <vector200>:
801066b7:	6a 00                	push   $0x0
801066b9:	68 c8 00 00 00       	push   $0xc8
801066be:	e9 4b f3 ff ff       	jmp    80105a0e <alltraps>

801066c3 <vector201>:
801066c3:	6a 00                	push   $0x0
801066c5:	68 c9 00 00 00       	push   $0xc9
801066ca:	e9 3f f3 ff ff       	jmp    80105a0e <alltraps>

801066cf <vector202>:
801066cf:	6a 00                	push   $0x0
801066d1:	68 ca 00 00 00       	push   $0xca
801066d6:	e9 33 f3 ff ff       	jmp    80105a0e <alltraps>

801066db <vector203>:
801066db:	6a 00                	push   $0x0
801066dd:	68 cb 00 00 00       	push   $0xcb
801066e2:	e9 27 f3 ff ff       	jmp    80105a0e <alltraps>

801066e7 <vector204>:
801066e7:	6a 00                	push   $0x0
801066e9:	68 cc 00 00 00       	push   $0xcc
801066ee:	e9 1b f3 ff ff       	jmp    80105a0e <alltraps>

801066f3 <vector205>:
801066f3:	6a 00                	push   $0x0
801066f5:	68 cd 00 00 00       	push   $0xcd
801066fa:	e9 0f f3 ff ff       	jmp    80105a0e <alltraps>

801066ff <vector206>:
801066ff:	6a 00                	push   $0x0
80106701:	68 ce 00 00 00       	push   $0xce
80106706:	e9 03 f3 ff ff       	jmp    80105a0e <alltraps>

8010670b <vector207>:
8010670b:	6a 00                	push   $0x0
8010670d:	68 cf 00 00 00       	push   $0xcf
80106712:	e9 f7 f2 ff ff       	jmp    80105a0e <alltraps>

80106717 <vector208>:
80106717:	6a 00                	push   $0x0
80106719:	68 d0 00 00 00       	push   $0xd0
8010671e:	e9 eb f2 ff ff       	jmp    80105a0e <alltraps>

80106723 <vector209>:
80106723:	6a 00                	push   $0x0
80106725:	68 d1 00 00 00       	push   $0xd1
8010672a:	e9 df f2 ff ff       	jmp    80105a0e <alltraps>

8010672f <vector210>:
8010672f:	6a 00                	push   $0x0
80106731:	68 d2 00 00 00       	push   $0xd2
80106736:	e9 d3 f2 ff ff       	jmp    80105a0e <alltraps>

8010673b <vector211>:
8010673b:	6a 00                	push   $0x0
8010673d:	68 d3 00 00 00       	push   $0xd3
80106742:	e9 c7 f2 ff ff       	jmp    80105a0e <alltraps>

80106747 <vector212>:
80106747:	6a 00                	push   $0x0
80106749:	68 d4 00 00 00       	push   $0xd4
8010674e:	e9 bb f2 ff ff       	jmp    80105a0e <alltraps>

80106753 <vector213>:
80106753:	6a 00                	push   $0x0
80106755:	68 d5 00 00 00       	push   $0xd5
8010675a:	e9 af f2 ff ff       	jmp    80105a0e <alltraps>

8010675f <vector214>:
8010675f:	6a 00                	push   $0x0
80106761:	68 d6 00 00 00       	push   $0xd6
80106766:	e9 a3 f2 ff ff       	jmp    80105a0e <alltraps>

8010676b <vector215>:
8010676b:	6a 00                	push   $0x0
8010676d:	68 d7 00 00 00       	push   $0xd7
80106772:	e9 97 f2 ff ff       	jmp    80105a0e <alltraps>

80106777 <vector216>:
80106777:	6a 00                	push   $0x0
80106779:	68 d8 00 00 00       	push   $0xd8
8010677e:	e9 8b f2 ff ff       	jmp    80105a0e <alltraps>

80106783 <vector217>:
80106783:	6a 00                	push   $0x0
80106785:	68 d9 00 00 00       	push   $0xd9
8010678a:	e9 7f f2 ff ff       	jmp    80105a0e <alltraps>

8010678f <vector218>:
8010678f:	6a 00                	push   $0x0
80106791:	68 da 00 00 00       	push   $0xda
80106796:	e9 73 f2 ff ff       	jmp    80105a0e <alltraps>

8010679b <vector219>:
8010679b:	6a 00                	push   $0x0
8010679d:	68 db 00 00 00       	push   $0xdb
801067a2:	e9 67 f2 ff ff       	jmp    80105a0e <alltraps>

801067a7 <vector220>:
801067a7:	6a 00                	push   $0x0
801067a9:	68 dc 00 00 00       	push   $0xdc
801067ae:	e9 5b f2 ff ff       	jmp    80105a0e <alltraps>

801067b3 <vector221>:
801067b3:	6a 00                	push   $0x0
801067b5:	68 dd 00 00 00       	push   $0xdd
801067ba:	e9 4f f2 ff ff       	jmp    80105a0e <alltraps>

801067bf <vector222>:
801067bf:	6a 00                	push   $0x0
801067c1:	68 de 00 00 00       	push   $0xde
801067c6:	e9 43 f2 ff ff       	jmp    80105a0e <alltraps>

801067cb <vector223>:
801067cb:	6a 00                	push   $0x0
801067cd:	68 df 00 00 00       	push   $0xdf
801067d2:	e9 37 f2 ff ff       	jmp    80105a0e <alltraps>

801067d7 <vector224>:
801067d7:	6a 00                	push   $0x0
801067d9:	68 e0 00 00 00       	push   $0xe0
801067de:	e9 2b f2 ff ff       	jmp    80105a0e <alltraps>

801067e3 <vector225>:
801067e3:	6a 00                	push   $0x0
801067e5:	68 e1 00 00 00       	push   $0xe1
801067ea:	e9 1f f2 ff ff       	jmp    80105a0e <alltraps>

801067ef <vector226>:
801067ef:	6a 00                	push   $0x0
801067f1:	68 e2 00 00 00       	push   $0xe2
801067f6:	e9 13 f2 ff ff       	jmp    80105a0e <alltraps>

801067fb <vector227>:
801067fb:	6a 00                	push   $0x0
801067fd:	68 e3 00 00 00       	push   $0xe3
80106802:	e9 07 f2 ff ff       	jmp    80105a0e <alltraps>

80106807 <vector228>:
80106807:	6a 00                	push   $0x0
80106809:	68 e4 00 00 00       	push   $0xe4
8010680e:	e9 fb f1 ff ff       	jmp    80105a0e <alltraps>

80106813 <vector229>:
80106813:	6a 00                	push   $0x0
80106815:	68 e5 00 00 00       	push   $0xe5
8010681a:	e9 ef f1 ff ff       	jmp    80105a0e <alltraps>

8010681f <vector230>:
8010681f:	6a 00                	push   $0x0
80106821:	68 e6 00 00 00       	push   $0xe6
80106826:	e9 e3 f1 ff ff       	jmp    80105a0e <alltraps>

8010682b <vector231>:
8010682b:	6a 00                	push   $0x0
8010682d:	68 e7 00 00 00       	push   $0xe7
80106832:	e9 d7 f1 ff ff       	jmp    80105a0e <alltraps>

80106837 <vector232>:
80106837:	6a 00                	push   $0x0
80106839:	68 e8 00 00 00       	push   $0xe8
8010683e:	e9 cb f1 ff ff       	jmp    80105a0e <alltraps>

80106843 <vector233>:
80106843:	6a 00                	push   $0x0
80106845:	68 e9 00 00 00       	push   $0xe9
8010684a:	e9 bf f1 ff ff       	jmp    80105a0e <alltraps>

8010684f <vector234>:
8010684f:	6a 00                	push   $0x0
80106851:	68 ea 00 00 00       	push   $0xea
80106856:	e9 b3 f1 ff ff       	jmp    80105a0e <alltraps>

8010685b <vector235>:
8010685b:	6a 00                	push   $0x0
8010685d:	68 eb 00 00 00       	push   $0xeb
80106862:	e9 a7 f1 ff ff       	jmp    80105a0e <alltraps>

80106867 <vector236>:
80106867:	6a 00                	push   $0x0
80106869:	68 ec 00 00 00       	push   $0xec
8010686e:	e9 9b f1 ff ff       	jmp    80105a0e <alltraps>

80106873 <vector237>:
80106873:	6a 00                	push   $0x0
80106875:	68 ed 00 00 00       	push   $0xed
8010687a:	e9 8f f1 ff ff       	jmp    80105a0e <alltraps>

8010687f <vector238>:
8010687f:	6a 00                	push   $0x0
80106881:	68 ee 00 00 00       	push   $0xee
80106886:	e9 83 f1 ff ff       	jmp    80105a0e <alltraps>

8010688b <vector239>:
8010688b:	6a 00                	push   $0x0
8010688d:	68 ef 00 00 00       	push   $0xef
80106892:	e9 77 f1 ff ff       	jmp    80105a0e <alltraps>

80106897 <vector240>:
80106897:	6a 00                	push   $0x0
80106899:	68 f0 00 00 00       	push   $0xf0
8010689e:	e9 6b f1 ff ff       	jmp    80105a0e <alltraps>

801068a3 <vector241>:
801068a3:	6a 00                	push   $0x0
801068a5:	68 f1 00 00 00       	push   $0xf1
801068aa:	e9 5f f1 ff ff       	jmp    80105a0e <alltraps>

801068af <vector242>:
801068af:	6a 00                	push   $0x0
801068b1:	68 f2 00 00 00       	push   $0xf2
801068b6:	e9 53 f1 ff ff       	jmp    80105a0e <alltraps>

801068bb <vector243>:
801068bb:	6a 00                	push   $0x0
801068bd:	68 f3 00 00 00       	push   $0xf3
801068c2:	e9 47 f1 ff ff       	jmp    80105a0e <alltraps>

801068c7 <vector244>:
801068c7:	6a 00                	push   $0x0
801068c9:	68 f4 00 00 00       	push   $0xf4
801068ce:	e9 3b f1 ff ff       	jmp    80105a0e <alltraps>

801068d3 <vector245>:
801068d3:	6a 00                	push   $0x0
801068d5:	68 f5 00 00 00       	push   $0xf5
801068da:	e9 2f f1 ff ff       	jmp    80105a0e <alltraps>

801068df <vector246>:
801068df:	6a 00                	push   $0x0
801068e1:	68 f6 00 00 00       	push   $0xf6
801068e6:	e9 23 f1 ff ff       	jmp    80105a0e <alltraps>

801068eb <vector247>:
801068eb:	6a 00                	push   $0x0
801068ed:	68 f7 00 00 00       	push   $0xf7
801068f2:	e9 17 f1 ff ff       	jmp    80105a0e <alltraps>

801068f7 <vector248>:
801068f7:	6a 00                	push   $0x0
801068f9:	68 f8 00 00 00       	push   $0xf8
801068fe:	e9 0b f1 ff ff       	jmp    80105a0e <alltraps>

80106903 <vector249>:
80106903:	6a 00                	push   $0x0
80106905:	68 f9 00 00 00       	push   $0xf9
8010690a:	e9 ff f0 ff ff       	jmp    80105a0e <alltraps>

8010690f <vector250>:
8010690f:	6a 00                	push   $0x0
80106911:	68 fa 00 00 00       	push   $0xfa
80106916:	e9 f3 f0 ff ff       	jmp    80105a0e <alltraps>

8010691b <vector251>:
8010691b:	6a 00                	push   $0x0
8010691d:	68 fb 00 00 00       	push   $0xfb
80106922:	e9 e7 f0 ff ff       	jmp    80105a0e <alltraps>

80106927 <vector252>:
80106927:	6a 00                	push   $0x0
80106929:	68 fc 00 00 00       	push   $0xfc
8010692e:	e9 db f0 ff ff       	jmp    80105a0e <alltraps>

80106933 <vector253>:
80106933:	6a 00                	push   $0x0
80106935:	68 fd 00 00 00       	push   $0xfd
8010693a:	e9 cf f0 ff ff       	jmp    80105a0e <alltraps>

8010693f <vector254>:
8010693f:	6a 00                	push   $0x0
80106941:	68 fe 00 00 00       	push   $0xfe
80106946:	e9 c3 f0 ff ff       	jmp    80105a0e <alltraps>

8010694b <vector255>:
8010694b:	6a 00                	push   $0x0
8010694d:	68 ff 00 00 00       	push   $0xff
80106952:	e9 b7 f0 ff ff       	jmp    80105a0e <alltraps>
80106957:	66 90                	xchg   %ax,%ax
80106959:	66 90                	xchg   %ax,%ax
8010695b:	66 90                	xchg   %ax,%ax
8010695d:	66 90                	xchg   %ax,%ax
8010695f:	90                   	nop

80106960 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106960:	55                   	push   %ebp
80106961:	89 e5                	mov    %esp,%ebp
80106963:	57                   	push   %edi
80106964:	56                   	push   %esi
80106965:	53                   	push   %ebx
80106966:	89 d3                	mov    %edx,%ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80106968:	c1 ea 16             	shr    $0x16,%edx
8010696b:	8d 3c 90             	lea    (%eax,%edx,4),%edi
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
8010696e:	83 ec 0c             	sub    $0xc,%esp
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
80106971:	8b 07                	mov    (%edi),%eax
80106973:	a8 01                	test   $0x1,%al
80106975:	74 29                	je     801069a0 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106977:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010697c:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
80106982:	8d 65 f4             	lea    -0xc(%ebp),%esp
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
80106985:	c1 eb 0a             	shr    $0xa,%ebx
80106988:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
8010698e:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
}
80106991:	5b                   	pop    %ebx
80106992:	5e                   	pop    %esi
80106993:	5f                   	pop    %edi
80106994:	5d                   	pop    %ebp
80106995:	c3                   	ret    
80106996:	8d 76 00             	lea    0x0(%esi),%esi
80106999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
801069a0:	85 c9                	test   %ecx,%ecx
801069a2:	74 2c                	je     801069d0 <walkpgdir+0x70>
801069a4:	e8 d7 ba ff ff       	call   80102480 <kalloc>
801069a9:	85 c0                	test   %eax,%eax
801069ab:	89 c6                	mov    %eax,%esi
801069ad:	74 21                	je     801069d0 <walkpgdir+0x70>
      return 0;
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
801069af:	83 ec 04             	sub    $0x4,%esp
801069b2:	68 00 10 00 00       	push   $0x1000
801069b7:	6a 00                	push   $0x0
801069b9:	50                   	push   %eax
801069ba:	e8 d1 dd ff ff       	call   80104790 <memset>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
801069bf:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
801069c5:	83 c4 10             	add    $0x10,%esp
801069c8:	83 c8 07             	or     $0x7,%eax
801069cb:	89 07                	mov    %eax,(%edi)
801069cd:	eb b3                	jmp    80106982 <walkpgdir+0x22>
801069cf:	90                   	nop
  }
  return &pgtab[PTX(va)];
}
801069d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
      return 0;
801069d3:	31 c0                	xor    %eax,%eax
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
801069d5:	5b                   	pop    %ebx
801069d6:	5e                   	pop    %esi
801069d7:	5f                   	pop    %edi
801069d8:	5d                   	pop    %ebp
801069d9:	c3                   	ret    
801069da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801069e0 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
801069e0:	55                   	push   %ebp
801069e1:	89 e5                	mov    %esp,%ebp
801069e3:	57                   	push   %edi
801069e4:	56                   	push   %esi
801069e5:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
801069e6:	89 d3                	mov    %edx,%ebx
801069e8:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
801069ee:	83 ec 1c             	sub    $0x1c,%esp
801069f1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
801069f4:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
801069f8:	8b 7d 08             	mov    0x8(%ebp),%edi
801069fb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106a00:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
80106a03:	8b 45 0c             	mov    0xc(%ebp),%eax
80106a06:	29 df                	sub    %ebx,%edi
80106a08:	83 c8 01             	or     $0x1,%eax
80106a0b:	89 45 dc             	mov    %eax,-0x24(%ebp)
80106a0e:	eb 15                	jmp    80106a25 <mappages+0x45>
  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
80106a10:	f6 00 01             	testb  $0x1,(%eax)
80106a13:	75 45                	jne    80106a5a <mappages+0x7a>
      panic("remap");
    *pte = pa | perm | PTE_P;
80106a15:	0b 75 dc             	or     -0x24(%ebp),%esi
    if(a == last)
80106a18:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
80106a1b:	89 30                	mov    %esi,(%eax)
    if(a == last)
80106a1d:	74 31                	je     80106a50 <mappages+0x70>
      break;
    a += PGSIZE;
80106a1f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106a25:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106a28:	b9 01 00 00 00       	mov    $0x1,%ecx
80106a2d:	89 da                	mov    %ebx,%edx
80106a2f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106a32:	e8 29 ff ff ff       	call   80106960 <walkpgdir>
80106a37:	85 c0                	test   %eax,%eax
80106a39:	75 d5                	jne    80106a10 <mappages+0x30>
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
80106a3b:	8d 65 f4             	lea    -0xc(%ebp),%esp

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
80106a3e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
80106a43:	5b                   	pop    %ebx
80106a44:	5e                   	pop    %esi
80106a45:	5f                   	pop    %edi
80106a46:	5d                   	pop    %ebp
80106a47:	c3                   	ret    
80106a48:	90                   	nop
80106a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106a50:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
80106a53:	31 c0                	xor    %eax,%eax
}
80106a55:	5b                   	pop    %ebx
80106a56:	5e                   	pop    %esi
80106a57:	5f                   	pop    %edi
80106a58:	5d                   	pop    %ebp
80106a59:	c3                   	ret    
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
80106a5a:	83 ec 0c             	sub    $0xc,%esp
80106a5d:	68 f0 7b 10 80       	push   $0x80107bf0
80106a62:	e8 09 99 ff ff       	call   80100370 <panic>
80106a67:	89 f6                	mov    %esi,%esi
80106a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a70 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106a70:	55                   	push   %ebp
80106a71:	89 e5                	mov    %esp,%ebp
80106a73:	57                   	push   %edi
80106a74:	56                   	push   %esi
80106a75:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106a76:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106a7c:	89 c7                	mov    %eax,%edi
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106a7e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106a84:	83 ec 1c             	sub    $0x1c,%esp
80106a87:	89 4d e0             	mov    %ecx,-0x20(%ebp)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106a8a:	39 d3                	cmp    %edx,%ebx
80106a8c:	73 66                	jae    80106af4 <deallocuvm.part.0+0x84>
80106a8e:	89 d6                	mov    %edx,%esi
80106a90:	eb 3d                	jmp    80106acf <deallocuvm.part.0+0x5f>
80106a92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
80106a98:	8b 10                	mov    (%eax),%edx
80106a9a:	f6 c2 01             	test   $0x1,%dl
80106a9d:	74 26                	je     80106ac5 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
80106a9f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106aa5:	74 58                	je     80106aff <deallocuvm.part.0+0x8f>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
80106aa7:	83 ec 0c             	sub    $0xc,%esp
80106aaa:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106ab0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106ab3:	52                   	push   %edx
80106ab4:	e8 17 b8 ff ff       	call   801022d0 <kfree>
      *pte = 0;
80106ab9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106abc:	83 c4 10             	add    $0x10,%esp
80106abf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106ac5:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106acb:	39 f3                	cmp    %esi,%ebx
80106acd:	73 25                	jae    80106af4 <deallocuvm.part.0+0x84>
    pte = walkpgdir(pgdir, (char*)a, 0);
80106acf:	31 c9                	xor    %ecx,%ecx
80106ad1:	89 da                	mov    %ebx,%edx
80106ad3:	89 f8                	mov    %edi,%eax
80106ad5:	e8 86 fe ff ff       	call   80106960 <walkpgdir>
    if(!pte)
80106ada:	85 c0                	test   %eax,%eax
80106adc:	75 ba                	jne    80106a98 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
80106ade:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106ae4:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106aea:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106af0:	39 f3                	cmp    %esi,%ebx
80106af2:	72 db                	jb     80106acf <deallocuvm.part.0+0x5f>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106af4:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106af7:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106afa:	5b                   	pop    %ebx
80106afb:	5e                   	pop    %esi
80106afc:	5f                   	pop    %edi
80106afd:	5d                   	pop    %ebp
80106afe:	c3                   	ret    
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
      pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
80106aff:	83 ec 0c             	sub    $0xc,%esp
80106b02:	68 32 75 10 80       	push   $0x80107532
80106b07:	e8 64 98 ff ff       	call   80100370 <panic>
80106b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106b10 <seginit>:

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106b10:	55                   	push   %ebp
80106b11:	89 e5                	mov    %esp,%ebp
80106b13:	53                   	push   %ebx
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106b14:	31 db                	xor    %ebx,%ebx

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106b16:	83 ec 14             	sub    $0x14,%esp

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
80106b19:	e8 c2 bb ff ff       	call   801026e0 <cpunum>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106b1e:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80106b24:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80106b29:	8d 90 a0 27 11 80    	lea    -0x7feed860(%eax),%edx
80106b2f:	c6 80 1d 28 11 80 9a 	movb   $0x9a,-0x7feed7e3(%eax)
80106b36:	c6 80 1e 28 11 80 cf 	movb   $0xcf,-0x7feed7e2(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106b3d:	c6 80 25 28 11 80 92 	movb   $0x92,-0x7feed7db(%eax)
80106b44:	c6 80 26 28 11 80 cf 	movb   $0xcf,-0x7feed7da(%eax)
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106b4b:	66 89 4a 78          	mov    %cx,0x78(%edx)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106b4f:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106b54:	66 89 5a 7a          	mov    %bx,0x7a(%edx)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106b58:	66 89 8a 80 00 00 00 	mov    %cx,0x80(%edx)
80106b5f:	31 db                	xor    %ebx,%ebx
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106b61:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106b66:	66 89 9a 82 00 00 00 	mov    %bx,0x82(%edx)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106b6d:	66 89 8a 90 00 00 00 	mov    %cx,0x90(%edx)
80106b74:	31 db                	xor    %ebx,%ebx
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106b76:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106b7b:	66 89 9a 92 00 00 00 	mov    %bx,0x92(%edx)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106b82:	31 db                	xor    %ebx,%ebx
80106b84:	66 89 8a 98 00 00 00 	mov    %cx,0x98(%edx)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106b8b:	8d 88 54 28 11 80    	lea    -0x7feed7ac(%eax),%ecx
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106b91:	66 89 9a 9a 00 00 00 	mov    %bx,0x9a(%edx)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106b98:	31 db                	xor    %ebx,%ebx
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106b9a:	c6 80 35 28 11 80 fa 	movb   $0xfa,-0x7feed7cb(%eax)
80106ba1:	c6 80 36 28 11 80 cf 	movb   $0xcf,-0x7feed7ca(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106ba8:	66 89 9a 88 00 00 00 	mov    %bx,0x88(%edx)
80106baf:	66 89 8a 8a 00 00 00 	mov    %cx,0x8a(%edx)
80106bb6:	89 cb                	mov    %ecx,%ebx
80106bb8:	c1 e9 18             	shr    $0x18,%ecx
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106bbb:	c6 80 3d 28 11 80 f2 	movb   $0xf2,-0x7feed7c3(%eax)
80106bc2:	c6 80 3e 28 11 80 cf 	movb   $0xcf,-0x7feed7c2(%eax)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106bc9:	88 8a 8f 00 00 00    	mov    %cl,0x8f(%edx)
80106bcf:	c6 80 2d 28 11 80 92 	movb   $0x92,-0x7feed7d3(%eax)
static inline void
lgdt(struct segdesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80106bd6:	b9 37 00 00 00       	mov    $0x37,%ecx
80106bdb:	c6 80 2e 28 11 80 c0 	movb   $0xc0,-0x7feed7d2(%eax)

  lgdt(c->gdt, sizeof(c->gdt));
80106be2:	05 10 28 11 80       	add    $0x80112810,%eax
80106be7:	66 89 4d f2          	mov    %cx,-0xe(%ebp)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106beb:	c1 eb 10             	shr    $0x10,%ebx
  pd[1] = (uint)p;
80106bee:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106bf2:	c1 e8 10             	shr    $0x10,%eax
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106bf5:	c6 42 7c 00          	movb   $0x0,0x7c(%edx)
80106bf9:	c6 42 7f 00          	movb   $0x0,0x7f(%edx)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106bfd:	c6 82 84 00 00 00 00 	movb   $0x0,0x84(%edx)
80106c04:	c6 82 87 00 00 00 00 	movb   $0x0,0x87(%edx)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106c0b:	c6 82 94 00 00 00 00 	movb   $0x0,0x94(%edx)
80106c12:	c6 82 97 00 00 00 00 	movb   $0x0,0x97(%edx)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106c19:	c6 82 9c 00 00 00 00 	movb   $0x0,0x9c(%edx)
80106c20:	c6 82 9f 00 00 00 00 	movb   $0x0,0x9f(%edx)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106c27:	88 9a 8c 00 00 00    	mov    %bl,0x8c(%edx)
80106c2d:	66 89 45 f6          	mov    %ax,-0xa(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
80106c31:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106c34:	0f 01 10             	lgdtl  (%eax)
}

static inline void
loadgs(ushort v)
{
  asm volatile("movw %0, %%gs" : : "r" (v));
80106c37:	b8 18 00 00 00       	mov    $0x18,%eax
80106c3c:	8e e8                	mov    %eax,%gs
  lgdt(c->gdt, sizeof(c->gdt));
  loadgs(SEG_KCPU << 3);

  // Initialize cpu-local storage.
  cpu = c;
  proc = 0;
80106c3e:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80106c45:	00 00 00 00 

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
80106c49:	65 89 15 00 00 00 00 	mov    %edx,%gs:0x0
  loadgs(SEG_KCPU << 3);

  // Initialize cpu-local storage.
  cpu = c;
  proc = 0;
}
80106c50:	83 c4 14             	add    $0x14,%esp
80106c53:	5b                   	pop    %ebx
80106c54:	5d                   	pop    %ebp
80106c55:	c3                   	ret    
80106c56:	8d 76 00             	lea    0x0(%esi),%esi
80106c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106c60 <setupkvm>:
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
80106c60:	55                   	push   %ebp
80106c61:	89 e5                	mov    %esp,%ebp
80106c63:	56                   	push   %esi
80106c64:	53                   	push   %ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
80106c65:	e8 16 b8 ff ff       	call   80102480 <kalloc>
80106c6a:	85 c0                	test   %eax,%eax
80106c6c:	74 52                	je     80106cc0 <setupkvm+0x60>
    return 0;
  memset(pgdir, 0, PGSIZE);
80106c6e:	83 ec 04             	sub    $0x4,%esp
80106c71:	89 c6                	mov    %eax,%esi
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106c73:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
80106c78:	68 00 10 00 00       	push   $0x1000
80106c7d:	6a 00                	push   $0x0
80106c7f:	50                   	push   %eax
80106c80:	e8 0b db ff ff       	call   80104790 <memset>
80106c85:	83 c4 10             	add    $0x10,%esp
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106c88:	8b 43 04             	mov    0x4(%ebx),%eax
80106c8b:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106c8e:	83 ec 08             	sub    $0x8,%esp
80106c91:	8b 13                	mov    (%ebx),%edx
80106c93:	ff 73 0c             	pushl  0xc(%ebx)
80106c96:	50                   	push   %eax
80106c97:	29 c1                	sub    %eax,%ecx
80106c99:	89 f0                	mov    %esi,%eax
80106c9b:	e8 40 fd ff ff       	call   801069e0 <mappages>
80106ca0:	83 c4 10             	add    $0x10,%esp
80106ca3:	85 c0                	test   %eax,%eax
80106ca5:	78 19                	js     80106cc0 <setupkvm+0x60>
  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106ca7:	83 c3 10             	add    $0x10,%ebx
80106caa:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106cb0:	75 d6                	jne    80106c88 <setupkvm+0x28>
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0)
      return 0;
  return pgdir;
}
80106cb2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106cb5:	89 f0                	mov    %esi,%eax
80106cb7:	5b                   	pop    %ebx
80106cb8:	5e                   	pop    %esi
80106cb9:	5d                   	pop    %ebp
80106cba:	c3                   	ret    
80106cbb:	90                   	nop
80106cbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106cc0:	8d 65 f8             	lea    -0x8(%ebp),%esp
{
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
80106cc3:	31 c0                	xor    %eax,%eax
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0)
      return 0;
  return pgdir;
}
80106cc5:	5b                   	pop    %ebx
80106cc6:	5e                   	pop    %esi
80106cc7:	5d                   	pop    %ebp
80106cc8:	c3                   	ret    
80106cc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106cd0 <kvmalloc>:

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
80106cd0:	55                   	push   %ebp
80106cd1:	89 e5                	mov    %esp,%ebp
80106cd3:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80106cd6:	e8 85 ff ff ff       	call   80106c60 <setupkvm>
80106cdb:	a3 e4 55 11 80       	mov    %eax,0x801155e4
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106ce0:	05 00 00 00 80       	add    $0x80000000,%eax
80106ce5:	0f 22 d8             	mov    %eax,%cr3
  switchkvm();
}
80106ce8:	c9                   	leave  
80106ce9:	c3                   	ret    
80106cea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106cf0 <switchkvm>:
80106cf0:	a1 e4 55 11 80       	mov    0x801155e4,%eax

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
80106cf5:	55                   	push   %ebp
80106cf6:	89 e5                	mov    %esp,%ebp
80106cf8:	05 00 00 00 80       	add    $0x80000000,%eax
80106cfd:	0f 22 d8             	mov    %eax,%cr3
  lcr3(V2P(kpgdir));   // switch to the kernel page table
}
80106d00:	5d                   	pop    %ebp
80106d01:	c3                   	ret    
80106d02:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106d10 <switchuvm>:

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
80106d10:	55                   	push   %ebp
80106d11:	89 e5                	mov    %esp,%ebp
80106d13:	53                   	push   %ebx
80106d14:	83 ec 04             	sub    $0x4,%esp
80106d17:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(p == 0)
80106d1a:	85 db                	test   %ebx,%ebx
80106d1c:	0f 84 93 00 00 00    	je     80106db5 <switchuvm+0xa5>
    panic("switchuvm: no process");
  if(p->kstack == 0)
80106d22:	8b 43 08             	mov    0x8(%ebx),%eax
80106d25:	85 c0                	test   %eax,%eax
80106d27:	0f 84 a2 00 00 00    	je     80106dcf <switchuvm+0xbf>
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
80106d2d:	8b 43 04             	mov    0x4(%ebx),%eax
80106d30:	85 c0                	test   %eax,%eax
80106d32:	0f 84 8a 00 00 00    	je     80106dc2 <switchuvm+0xb2>
    panic("switchuvm: no pgdir");

  pushcli();
80106d38:	e8 83 d9 ff ff       	call   801046c0 <pushcli>
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106d3d:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80106d43:	b9 67 00 00 00       	mov    $0x67,%ecx
80106d48:	8d 50 08             	lea    0x8(%eax),%edx
80106d4b:	66 89 88 a0 00 00 00 	mov    %cx,0xa0(%eax)
80106d52:	c6 80 a6 00 00 00 40 	movb   $0x40,0xa6(%eax)
  cpu->gdt[SEG_TSS].s = 0;
80106d59:	c6 80 a5 00 00 00 89 	movb   $0x89,0xa5(%eax)
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");

  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106d60:	66 89 90 a2 00 00 00 	mov    %dx,0xa2(%eax)
80106d67:	89 d1                	mov    %edx,%ecx
80106d69:	c1 ea 18             	shr    $0x18,%edx
80106d6c:	88 90 a7 00 00 00    	mov    %dl,0xa7(%eax)
80106d72:	c1 e9 10             	shr    $0x10,%ecx
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
80106d75:	ba 10 00 00 00       	mov    $0x10,%edx
80106d7a:	66 89 50 10          	mov    %dx,0x10(%eax)
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");

  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106d7e:	88 88 a4 00 00 00    	mov    %cl,0xa4(%eax)
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
  cpu->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106d84:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106d87:	8d 91 00 10 00 00    	lea    0x1000(%ecx),%edx
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
80106d8d:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80106d92:	66 89 48 6e          	mov    %cx,0x6e(%eax)

  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
  cpu->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106d96:	89 50 0c             	mov    %edx,0xc(%eax)
}

static inline void
ltr(ushort sel)
{
  asm volatile("ltr %0" : : "r" (sel));
80106d99:	b8 30 00 00 00       	mov    $0x30,%eax
80106d9e:	0f 00 d8             	ltr    %ax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106da1:	8b 43 04             	mov    0x4(%ebx),%eax
80106da4:	05 00 00 00 80       	add    $0x80000000,%eax
80106da9:	0f 22 d8             	mov    %eax,%cr3
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
}
80106dac:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80106daf:	c9                   	leave  
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
80106db0:	e9 3b d9 ff ff       	jmp    801046f0 <popcli>
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
80106db5:	83 ec 0c             	sub    $0xc,%esp
80106db8:	68 f6 7b 10 80       	push   $0x80107bf6
80106dbd:	e8 ae 95 ff ff       	call   80100370 <panic>
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");
80106dc2:	83 ec 0c             	sub    $0xc,%esp
80106dc5:	68 21 7c 10 80       	push   $0x80107c21
80106dca:	e8 a1 95 ff ff       	call   80100370 <panic>
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
80106dcf:	83 ec 0c             	sub    $0xc,%esp
80106dd2:	68 0c 7c 10 80       	push   $0x80107c0c
80106dd7:	e8 94 95 ff ff       	call   80100370 <panic>
80106ddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106de0 <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106de0:	55                   	push   %ebp
80106de1:	89 e5                	mov    %esp,%ebp
80106de3:	57                   	push   %edi
80106de4:	56                   	push   %esi
80106de5:	53                   	push   %ebx
80106de6:	83 ec 1c             	sub    $0x1c,%esp
80106de9:	8b 75 10             	mov    0x10(%ebp),%esi
80106dec:	8b 45 08             	mov    0x8(%ebp),%eax
80106def:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *mem;

  if(sz >= PGSIZE)
80106df2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106df8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *mem;

  if(sz >= PGSIZE)
80106dfb:	77 49                	ja     80106e46 <inituvm+0x66>
    panic("inituvm: more than a page");
  mem = kalloc();
80106dfd:	e8 7e b6 ff ff       	call   80102480 <kalloc>
  memset(mem, 0, PGSIZE);
80106e02:	83 ec 04             	sub    $0x4,%esp
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
80106e05:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106e07:	68 00 10 00 00       	push   $0x1000
80106e0c:	6a 00                	push   $0x0
80106e0e:	50                   	push   %eax
80106e0f:	e8 7c d9 ff ff       	call   80104790 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106e14:	58                   	pop    %eax
80106e15:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106e1b:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106e20:	5a                   	pop    %edx
80106e21:	6a 06                	push   $0x6
80106e23:	50                   	push   %eax
80106e24:	31 d2                	xor    %edx,%edx
80106e26:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106e29:	e8 b2 fb ff ff       	call   801069e0 <mappages>
  memmove(mem, init, sz);
80106e2e:	89 75 10             	mov    %esi,0x10(%ebp)
80106e31:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106e34:	83 c4 10             	add    $0x10,%esp
80106e37:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106e3a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e3d:	5b                   	pop    %ebx
80106e3e:	5e                   	pop    %esi
80106e3f:	5f                   	pop    %edi
80106e40:	5d                   	pop    %ebp
  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
80106e41:	e9 fa d9 ff ff       	jmp    80104840 <memmove>
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
80106e46:	83 ec 0c             	sub    $0xc,%esp
80106e49:	68 35 7c 10 80       	push   $0x80107c35
80106e4e:	e8 1d 95 ff ff       	call   80100370 <panic>
80106e53:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106e59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106e60 <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
80106e60:	55                   	push   %ebp
80106e61:	89 e5                	mov    %esp,%ebp
80106e63:	57                   	push   %edi
80106e64:	56                   	push   %esi
80106e65:	53                   	push   %ebx
80106e66:	83 ec 0c             	sub    $0xc,%esp
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
80106e69:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106e70:	0f 85 91 00 00 00    	jne    80106f07 <loaduvm+0xa7>
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
80106e76:	8b 75 18             	mov    0x18(%ebp),%esi
80106e79:	31 db                	xor    %ebx,%ebx
80106e7b:	85 f6                	test   %esi,%esi
80106e7d:	75 1a                	jne    80106e99 <loaduvm+0x39>
80106e7f:	eb 6f                	jmp    80106ef0 <loaduvm+0x90>
80106e81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e88:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106e8e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106e94:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106e97:	76 57                	jbe    80106ef0 <loaduvm+0x90>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106e99:	8b 55 0c             	mov    0xc(%ebp),%edx
80106e9c:	8b 45 08             	mov    0x8(%ebp),%eax
80106e9f:	31 c9                	xor    %ecx,%ecx
80106ea1:	01 da                	add    %ebx,%edx
80106ea3:	e8 b8 fa ff ff       	call   80106960 <walkpgdir>
80106ea8:	85 c0                	test   %eax,%eax
80106eaa:	74 4e                	je     80106efa <loaduvm+0x9a>
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106eac:	8b 00                	mov    (%eax),%eax
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106eae:	8b 4d 14             	mov    0x14(%ebp),%ecx
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
    if(sz - i < PGSIZE)
80106eb1:	bf 00 10 00 00       	mov    $0x1000,%edi
  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106eb6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106ebb:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106ec1:	0f 46 fe             	cmovbe %esi,%edi
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106ec4:	01 d9                	add    %ebx,%ecx
80106ec6:	05 00 00 00 80       	add    $0x80000000,%eax
80106ecb:	57                   	push   %edi
80106ecc:	51                   	push   %ecx
80106ecd:	50                   	push   %eax
80106ece:	ff 75 10             	pushl  0x10(%ebp)
80106ed1:	e8 4a aa ff ff       	call   80101920 <readi>
80106ed6:	83 c4 10             	add    $0x10,%esp
80106ed9:	39 c7                	cmp    %eax,%edi
80106edb:	74 ab                	je     80106e88 <loaduvm+0x28>
      return -1;
  }
  return 0;
}
80106edd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
80106ee0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return 0;
}
80106ee5:	5b                   	pop    %ebx
80106ee6:	5e                   	pop    %esi
80106ee7:	5f                   	pop    %edi
80106ee8:	5d                   	pop    %ebp
80106ee9:	c3                   	ret    
80106eea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106ef0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
80106ef3:	31 c0                	xor    %eax,%eax
}
80106ef5:	5b                   	pop    %ebx
80106ef6:	5e                   	pop    %esi
80106ef7:	5f                   	pop    %edi
80106ef8:	5d                   	pop    %ebp
80106ef9:	c3                   	ret    

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
80106efa:	83 ec 0c             	sub    $0xc,%esp
80106efd:	68 4f 7c 10 80       	push   $0x80107c4f
80106f02:	e8 69 94 ff ff       	call   80100370 <panic>
{
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
80106f07:	83 ec 0c             	sub    $0xc,%esp
80106f0a:	68 f0 7c 10 80       	push   $0x80107cf0
80106f0f:	e8 5c 94 ff ff       	call   80100370 <panic>
80106f14:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106f1a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106f20 <allocuvm>:

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106f20:	55                   	push   %ebp
80106f21:	89 e5                	mov    %esp,%ebp
80106f23:	57                   	push   %edi
80106f24:	56                   	push   %esi
80106f25:	53                   	push   %ebx
80106f26:	83 ec 0c             	sub    $0xc,%esp
80106f29:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
80106f2c:	85 ff                	test   %edi,%edi
80106f2e:	0f 88 ca 00 00 00    	js     80106ffe <allocuvm+0xde>
    return 0;
  if(newsz < oldsz)
80106f34:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    return oldsz;
80106f37:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
    return 0;
  if(newsz < oldsz)
80106f3a:	0f 82 82 00 00 00    	jb     80106fc2 <allocuvm+0xa2>
    return oldsz;

  a = PGROUNDUP(oldsz);
80106f40:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106f46:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80106f4c:	39 df                	cmp    %ebx,%edi
80106f4e:	77 43                	ja     80106f93 <allocuvm+0x73>
80106f50:	e9 bb 00 00 00       	jmp    80107010 <allocuvm+0xf0>
80106f55:	8d 76 00             	lea    0x0(%esi),%esi
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
80106f58:	83 ec 04             	sub    $0x4,%esp
80106f5b:	68 00 10 00 00       	push   $0x1000
80106f60:	6a 00                	push   $0x0
80106f62:	50                   	push   %eax
80106f63:	e8 28 d8 ff ff       	call   80104790 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106f68:	58                   	pop    %eax
80106f69:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106f6f:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106f74:	5a                   	pop    %edx
80106f75:	6a 06                	push   $0x6
80106f77:	50                   	push   %eax
80106f78:	89 da                	mov    %ebx,%edx
80106f7a:	8b 45 08             	mov    0x8(%ebp),%eax
80106f7d:	e8 5e fa ff ff       	call   801069e0 <mappages>
80106f82:	83 c4 10             	add    $0x10,%esp
80106f85:	85 c0                	test   %eax,%eax
80106f87:	78 47                	js     80106fd0 <allocuvm+0xb0>
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106f89:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106f8f:	39 df                	cmp    %ebx,%edi
80106f91:	76 7d                	jbe    80107010 <allocuvm+0xf0>
    mem = kalloc();
80106f93:	e8 e8 b4 ff ff       	call   80102480 <kalloc>
    if(mem == 0){
80106f98:	85 c0                	test   %eax,%eax
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
80106f9a:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80106f9c:	75 ba                	jne    80106f58 <allocuvm+0x38>
      cprintf("allocuvm out of memory\n");
80106f9e:	83 ec 0c             	sub    $0xc,%esp
80106fa1:	68 6d 7c 10 80       	push   $0x80107c6d
80106fa6:	e8 b5 96 ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106fab:	83 c4 10             	add    $0x10,%esp
80106fae:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106fb1:	76 4b                	jbe    80106ffe <allocuvm+0xde>
80106fb3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106fb6:	8b 45 08             	mov    0x8(%ebp),%eax
80106fb9:	89 fa                	mov    %edi,%edx
80106fbb:	e8 b0 fa ff ff       	call   80106a70 <deallocuvm.part.0>
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
80106fc0:	31 c0                	xor    %eax,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80106fc2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106fc5:	5b                   	pop    %ebx
80106fc6:	5e                   	pop    %esi
80106fc7:	5f                   	pop    %edi
80106fc8:	5d                   	pop    %ebp
80106fc9:	c3                   	ret    
80106fca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
80106fd0:	83 ec 0c             	sub    $0xc,%esp
80106fd3:	68 85 7c 10 80       	push   $0x80107c85
80106fd8:	e8 83 96 ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106fdd:	83 c4 10             	add    $0x10,%esp
80106fe0:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106fe3:	76 0d                	jbe    80106ff2 <allocuvm+0xd2>
80106fe5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106fe8:	8b 45 08             	mov    0x8(%ebp),%eax
80106feb:	89 fa                	mov    %edi,%edx
80106fed:	e8 7e fa ff ff       	call   80106a70 <deallocuvm.part.0>
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
80106ff2:	83 ec 0c             	sub    $0xc,%esp
80106ff5:	56                   	push   %esi
80106ff6:	e8 d5 b2 ff ff       	call   801022d0 <kfree>
      return 0;
80106ffb:	83 c4 10             	add    $0x10,%esp
    }
  }
  return newsz;
}
80106ffe:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
      return 0;
80107001:	31 c0                	xor    %eax,%eax
    }
  }
  return newsz;
}
80107003:	5b                   	pop    %ebx
80107004:	5e                   	pop    %esi
80107005:	5f                   	pop    %edi
80107006:	5d                   	pop    %ebp
80107007:	c3                   	ret    
80107008:	90                   	nop
80107009:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107010:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80107013:	89 f8                	mov    %edi,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80107015:	5b                   	pop    %ebx
80107016:	5e                   	pop    %esi
80107017:	5f                   	pop    %edi
80107018:	5d                   	pop    %ebp
80107019:	c3                   	ret    
8010701a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80107020 <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80107020:	55                   	push   %ebp
80107021:	89 e5                	mov    %esp,%ebp
80107023:	8b 55 0c             	mov    0xc(%ebp),%edx
80107026:	8b 4d 10             	mov    0x10(%ebp),%ecx
80107029:	8b 45 08             	mov    0x8(%ebp),%eax
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
8010702c:	39 d1                	cmp    %edx,%ecx
8010702e:	73 10                	jae    80107040 <deallocuvm+0x20>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80107030:	5d                   	pop    %ebp
80107031:	e9 3a fa ff ff       	jmp    80106a70 <deallocuvm.part.0>
80107036:	8d 76 00             	lea    0x0(%esi),%esi
80107039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107040:	89 d0                	mov    %edx,%eax
80107042:	5d                   	pop    %ebp
80107043:	c3                   	ret    
80107044:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010704a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107050 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80107050:	55                   	push   %ebp
80107051:	89 e5                	mov    %esp,%ebp
80107053:	57                   	push   %edi
80107054:	56                   	push   %esi
80107055:	53                   	push   %ebx
80107056:	83 ec 0c             	sub    $0xc,%esp
80107059:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
8010705c:	85 f6                	test   %esi,%esi
8010705e:	74 59                	je     801070b9 <freevm+0x69>
80107060:	31 c9                	xor    %ecx,%ecx
80107062:	ba 00 00 00 80       	mov    $0x80000000,%edx
80107067:	89 f0                	mov    %esi,%eax
80107069:	e8 02 fa ff ff       	call   80106a70 <deallocuvm.part.0>
8010706e:	89 f3                	mov    %esi,%ebx
80107070:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80107076:	eb 0f                	jmp    80107087 <freevm+0x37>
80107078:	90                   	nop
80107079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107080:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80107083:	39 fb                	cmp    %edi,%ebx
80107085:	74 23                	je     801070aa <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80107087:	8b 03                	mov    (%ebx),%eax
80107089:	a8 01                	test   $0x1,%al
8010708b:	74 f3                	je     80107080 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
8010708d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107092:	83 ec 0c             	sub    $0xc,%esp
80107095:	83 c3 04             	add    $0x4,%ebx
80107098:	05 00 00 00 80       	add    $0x80000000,%eax
8010709d:	50                   	push   %eax
8010709e:	e8 2d b2 ff ff       	call   801022d0 <kfree>
801070a3:	83 c4 10             	add    $0x10,%esp
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
801070a6:	39 fb                	cmp    %edi,%ebx
801070a8:	75 dd                	jne    80107087 <freevm+0x37>
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
801070aa:	89 75 08             	mov    %esi,0x8(%ebp)
}
801070ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
801070b0:	5b                   	pop    %ebx
801070b1:	5e                   	pop    %esi
801070b2:	5f                   	pop    %edi
801070b3:	5d                   	pop    %ebp
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
801070b4:	e9 17 b2 ff ff       	jmp    801022d0 <kfree>
freevm(pde_t *pgdir)
{
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
801070b9:	83 ec 0c             	sub    $0xc,%esp
801070bc:	68 a1 7c 10 80       	push   $0x80107ca1
801070c1:	e8 aa 92 ff ff       	call   80100370 <panic>
801070c6:	8d 76 00             	lea    0x0(%esi),%esi
801070c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801070d0 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
801070d0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801070d1:	31 c9                	xor    %ecx,%ecx

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
801070d3:	89 e5                	mov    %esp,%ebp
801070d5:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801070d8:	8b 55 0c             	mov    0xc(%ebp),%edx
801070db:	8b 45 08             	mov    0x8(%ebp),%eax
801070de:	e8 7d f8 ff ff       	call   80106960 <walkpgdir>
  if(pte == 0)
801070e3:	85 c0                	test   %eax,%eax
801070e5:	74 05                	je     801070ec <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
801070e7:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
801070ea:	c9                   	leave  
801070eb:	c3                   	ret    
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("clearpteu");
801070ec:	83 ec 0c             	sub    $0xc,%esp
801070ef:	68 b2 7c 10 80       	push   $0x80107cb2
801070f4:	e8 77 92 ff ff       	call   80100370 <panic>
801070f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80107100 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80107100:	55                   	push   %ebp
80107101:	89 e5                	mov    %esp,%ebp
80107103:	57                   	push   %edi
80107104:	56                   	push   %esi
80107105:	53                   	push   %ebx
80107106:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80107109:	e8 52 fb ff ff       	call   80106c60 <setupkvm>
8010710e:	85 c0                	test   %eax,%eax
80107110:	89 45 e0             	mov    %eax,-0x20(%ebp)
80107113:	0f 84 b2 00 00 00    	je     801071cb <copyuvm+0xcb>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80107119:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010711c:	85 c9                	test   %ecx,%ecx
8010711e:	0f 84 9c 00 00 00    	je     801071c0 <copyuvm+0xc0>
80107124:	31 f6                	xor    %esi,%esi
80107126:	eb 4a                	jmp    80107172 <copyuvm+0x72>
80107128:	90                   	nop
80107129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80107130:	83 ec 04             	sub    $0x4,%esp
80107133:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80107139:	68 00 10 00 00       	push   $0x1000
8010713e:	57                   	push   %edi
8010713f:	50                   	push   %eax
80107140:	e8 fb d6 ff ff       	call   80104840 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
80107145:	58                   	pop    %eax
80107146:	5a                   	pop    %edx
80107147:	8d 93 00 00 00 80    	lea    -0x80000000(%ebx),%edx
8010714d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80107150:	ff 75 e4             	pushl  -0x1c(%ebp)
80107153:	b9 00 10 00 00       	mov    $0x1000,%ecx
80107158:	52                   	push   %edx
80107159:	89 f2                	mov    %esi,%edx
8010715b:	e8 80 f8 ff ff       	call   801069e0 <mappages>
80107160:	83 c4 10             	add    $0x10,%esp
80107163:	85 c0                	test   %eax,%eax
80107165:	78 3e                	js     801071a5 <copyuvm+0xa5>
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80107167:	81 c6 00 10 00 00    	add    $0x1000,%esi
8010716d:	39 75 0c             	cmp    %esi,0xc(%ebp)
80107170:	76 4e                	jbe    801071c0 <copyuvm+0xc0>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80107172:	8b 45 08             	mov    0x8(%ebp),%eax
80107175:	31 c9                	xor    %ecx,%ecx
80107177:	89 f2                	mov    %esi,%edx
80107179:	e8 e2 f7 ff ff       	call   80106960 <walkpgdir>
8010717e:	85 c0                	test   %eax,%eax
80107180:	74 5a                	je     801071dc <copyuvm+0xdc>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
80107182:	8b 18                	mov    (%eax),%ebx
80107184:	f6 c3 01             	test   $0x1,%bl
80107187:	74 46                	je     801071cf <copyuvm+0xcf>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80107189:	89 df                	mov    %ebx,%edi
    flags = PTE_FLAGS(*pte);
8010718b:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80107191:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80107194:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
8010719a:	e8 e1 b2 ff ff       	call   80102480 <kalloc>
8010719f:	85 c0                	test   %eax,%eax
801071a1:	89 c3                	mov    %eax,%ebx
801071a3:	75 8b                	jne    80107130 <copyuvm+0x30>
      goto bad;
  }
  return d;

bad:
  freevm(d);
801071a5:	83 ec 0c             	sub    $0xc,%esp
801071a8:	ff 75 e0             	pushl  -0x20(%ebp)
801071ab:	e8 a0 fe ff ff       	call   80107050 <freevm>
  return 0;
801071b0:	83 c4 10             	add    $0x10,%esp
801071b3:	31 c0                	xor    %eax,%eax
}
801071b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801071b8:	5b                   	pop    %ebx
801071b9:	5e                   	pop    %esi
801071ba:	5f                   	pop    %edi
801071bb:	5d                   	pop    %ebp
801071bc:	c3                   	ret    
801071bd:	8d 76 00             	lea    0x0(%esi),%esi
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
801071c0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  return d;

bad:
  freevm(d);
  return 0;
}
801071c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801071c6:	5b                   	pop    %ebx
801071c7:	5e                   	pop    %esi
801071c8:	5f                   	pop    %edi
801071c9:	5d                   	pop    %ebp
801071ca:	c3                   	ret    
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
801071cb:	31 c0                	xor    %eax,%eax
801071cd:	eb e6                	jmp    801071b5 <copyuvm+0xb5>
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
801071cf:	83 ec 0c             	sub    $0xc,%esp
801071d2:	68 d6 7c 10 80       	push   $0x80107cd6
801071d7:	e8 94 91 ff ff       	call   80100370 <panic>

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
801071dc:	83 ec 0c             	sub    $0xc,%esp
801071df:	68 bc 7c 10 80       	push   $0x80107cbc
801071e4:	e8 87 91 ff ff       	call   80100370 <panic>
801071e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801071f0 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
801071f0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801071f1:	31 c9                	xor    %ecx,%ecx

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
801071f3:	89 e5                	mov    %esp,%ebp
801071f5:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801071f8:	8b 55 0c             	mov    0xc(%ebp),%edx
801071fb:	8b 45 08             	mov    0x8(%ebp),%eax
801071fe:	e8 5d f7 ff ff       	call   80106960 <walkpgdir>
  if((*pte & PTE_P) == 0)
80107203:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
80107205:	89 c2                	mov    %eax,%edx
80107207:	83 e2 05             	and    $0x5,%edx
8010720a:	83 fa 05             	cmp    $0x5,%edx
8010720d:	75 11                	jne    80107220 <uva2ka+0x30>
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
8010720f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
}
80107214:	c9                   	leave  
  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80107215:	05 00 00 00 80       	add    $0x80000000,%eax
}
8010721a:	c3                   	ret    
8010721b:	90                   	nop
8010721c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
80107220:	31 c0                	xor    %eax,%eax
  return (char*)P2V(PTE_ADDR(*pte));
}
80107222:	c9                   	leave  
80107223:	c3                   	ret    
80107224:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010722a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107230 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80107230:	55                   	push   %ebp
80107231:	89 e5                	mov    %esp,%ebp
80107233:	57                   	push   %edi
80107234:	56                   	push   %esi
80107235:	53                   	push   %ebx
80107236:	83 ec 1c             	sub    $0x1c,%esp
80107239:	8b 5d 14             	mov    0x14(%ebp),%ebx
8010723c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010723f:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107242:	85 db                	test   %ebx,%ebx
80107244:	75 40                	jne    80107286 <copyout+0x56>
80107246:	eb 70                	jmp    801072b8 <copyout+0x88>
80107248:	90                   	nop
80107249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80107250:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107253:	89 f1                	mov    %esi,%ecx
80107255:	29 d1                	sub    %edx,%ecx
80107257:	81 c1 00 10 00 00    	add    $0x1000,%ecx
8010725d:	39 d9                	cmp    %ebx,%ecx
8010725f:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80107262:	29 f2                	sub    %esi,%edx
80107264:	83 ec 04             	sub    $0x4,%esp
80107267:	01 d0                	add    %edx,%eax
80107269:	51                   	push   %ecx
8010726a:	57                   	push   %edi
8010726b:	50                   	push   %eax
8010726c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010726f:	e8 cc d5 ff ff       	call   80104840 <memmove>
    len -= n;
    buf += n;
80107274:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107277:	83 c4 10             	add    $0x10,%esp
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
8010727a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    n = PGSIZE - (va - va0);
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
80107280:	01 cf                	add    %ecx,%edi
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107282:	29 cb                	sub    %ecx,%ebx
80107284:	74 32                	je     801072b8 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
80107286:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107288:	83 ec 08             	sub    $0x8,%esp
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
8010728b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010728e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107294:	56                   	push   %esi
80107295:	ff 75 08             	pushl  0x8(%ebp)
80107298:	e8 53 ff ff ff       	call   801071f0 <uva2ka>
    if(pa0 == 0)
8010729d:	83 c4 10             	add    $0x10,%esp
801072a0:	85 c0                	test   %eax,%eax
801072a2:	75 ac                	jne    80107250 <copyout+0x20>
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
801072a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
801072a7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
801072ac:	5b                   	pop    %ebx
801072ad:	5e                   	pop    %esi
801072ae:	5f                   	pop    %edi
801072af:	5d                   	pop    %ebp
801072b0:	c3                   	ret    
801072b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801072b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
801072bb:	31 c0                	xor    %eax,%eax
}
801072bd:	5b                   	pop    %ebx
801072be:	5e                   	pop    %esi
801072bf:	5f                   	pop    %edi
801072c0:	5d                   	pop    %ebp
801072c1:	c3                   	ret    
