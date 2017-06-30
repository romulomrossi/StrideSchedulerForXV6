
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
8010004c:	68 c0 72 10 80       	push   $0x801072c0
80100051:	68 e0 b5 10 80       	push   $0x8010b5e0
80100056:	e8 c5 44 00 00       	call   80104520 <initlock>

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
80100092:	68 c7 72 10 80       	push   $0x801072c7
80100097:	50                   	push   %eax
80100098:	e8 73 43 00 00       	call   80104410 <initsleeplock>
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
801000e4:	e8 57 44 00 00       	call   80104540 <acquire>

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
80100162:	e8 b9 45 00 00       	call   80104720 <release>
      acquiresleep(&b->lock);
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 de 42 00 00       	call   80104450 <acquiresleep>
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
80100193:	68 ce 72 10 80       	push   $0x801072ce
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
801001ae:	e8 3d 43 00 00       	call   801044f0 <holdingsleep>
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
801001cc:	68 df 72 10 80       	push   $0x801072df
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
801001ef:	e8 fc 42 00 00       	call   801044f0 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
    panic("brelse");

  releasesleep(&b->lock);
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 ac 42 00 00       	call   801044b0 <releasesleep>

  acquire(&bcache.lock);
80100204:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
8010020b:	e8 30 43 00 00       	call   80104540 <acquire>
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
8010025c:	e9 bf 44 00 00       	jmp    80104720 <release>
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("brelse");
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 e6 72 10 80       	push   $0x801072e6
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
8010028c:	e8 af 42 00 00       	call   80104540 <acquire>
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
801002e7:	e8 34 44 00 00       	call   80104720 <release>
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
80100346:	e8 d5 43 00 00       	call   80104720 <release>
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
80100393:	68 ed 72 10 80       	push   $0x801072ed
80100398:	e8 c3 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
8010039d:	58                   	pop    %eax
8010039e:	ff 75 08             	pushl  0x8(%ebp)
801003a1:	e8 ba 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003a6:	c7 04 24 11 79 10 80 	movl   $0x80107911,(%esp)
801003ad:	e8 ae 02 00 00       	call   80100660 <cprintf>
  getcallerpcs(&s, pcs);
801003b2:	5a                   	pop    %edx
801003b3:	8d 45 08             	lea    0x8(%ebp),%eax
801003b6:	59                   	pop    %ecx
801003b7:	53                   	push   %ebx
801003b8:	50                   	push   %eax
801003b9:	e8 52 42 00 00       	call   80104610 <getcallerpcs>
801003be:	83 c4 10             	add    $0x10,%esp
801003c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i=0; i<10; i++)
    cprintf(" %p", pcs[i]);
801003c8:	83 ec 08             	sub    $0x8,%esp
801003cb:	ff 33                	pushl  (%ebx)
801003cd:	83 c3 04             	add    $0x4,%ebx
801003d0:	68 09 73 10 80       	push   $0x80107309
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
8010041a:	e8 61 5a 00 00       	call   80105e80 <uartputc>
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
801004d3:	e8 a8 59 00 00       	call   80105e80 <uartputc>
801004d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004df:	e8 9c 59 00 00       	call   80105e80 <uartputc>
801004e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004eb:	e8 90 59 00 00       	call   80105e80 <uartputc>
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
80100514:	e8 07 43 00 00       	call   80104820 <memmove>
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100519:	b8 80 07 00 00       	mov    $0x780,%eax
8010051e:	83 c4 0c             	add    $0xc,%esp
80100521:	29 d8                	sub    %ebx,%eax
80100523:	01 c0                	add    %eax,%eax
80100525:	50                   	push   %eax
80100526:	6a 00                	push   $0x0
80100528:	56                   	push   %esi
80100529:	e8 42 42 00 00       	call   80104770 <memset>
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
80100540:	68 0d 73 10 80       	push   $0x8010730d
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
801005b1:	0f b6 92 38 73 10 80 	movzbl -0x7fef8cc8(%edx),%edx
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
8010061b:	e8 20 3f 00 00       	call   80104540 <acquire>
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
80100647:	e8 d4 40 00 00       	call   80104720 <release>
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
8010070d:	e8 0e 40 00 00       	call   80104720 <release>
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
80100788:	b8 20 73 10 80       	mov    $0x80107320,%eax
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
801007c8:	e8 73 3d 00 00       	call   80104540 <acquire>
801007cd:	83 c4 10             	add    $0x10,%esp
801007d0:	e9 a4 fe ff ff       	jmp    80100679 <cprintf+0x19>

  if (fmt == 0)
    panic("null fmt");
801007d5:	83 ec 0c             	sub    $0xc,%esp
801007d8:	68 27 73 10 80       	push   $0x80107327
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
80100803:	e8 38 3d 00 00       	call   80104540 <acquire>
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
80100868:	e8 b3 3e 00 00       	call   80104720 <release>
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
801009a6:	68 30 73 10 80       	push   $0x80107330
801009ab:	68 20 a5 10 80       	push   $0x8010a520
801009b0:	e8 6b 3b 00 00       	call   80104520 <initlock>

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
80100a6c:	e8 cf 61 00 00       	call   80106c40 <setupkvm>
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
80100afc:	e8 ff 63 00 00       	call   80106f00 <allocuvm>
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
80100b32:	e8 09 63 00 00       	call   80106e40 <loaduvm>
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
80100b51:	e8 da 64 00 00       	call   80107030 <freevm>
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
80100b8d:	e8 6e 63 00 00       	call   80106f00 <allocuvm>
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
80100ba4:	e8 87 64 00 00       	call   80107030 <freevm>
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
80100bd9:	e8 d2 64 00 00       	call   801070b0 <clearpteu>
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
80100c09:	e8 a2 3d 00 00       	call   801049b0 <strlen>
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
80100c1c:	e8 8f 3d 00 00       	call   801049b0 <strlen>
80100c21:	83 c0 01             	add    $0x1,%eax
80100c24:	50                   	push   %eax
80100c25:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c28:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c2b:	53                   	push   %ebx
80100c2c:	56                   	push   %esi
80100c2d:	e8 de 65 00 00       	call   80107210 <copyout>
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
80100c97:	e8 74 65 00 00       	call   80107210 <copyout>
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
80100cda:	e8 91 3c 00 00       	call   80104970 <safestrcpy>

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
80100d1f:	e8 cc 5f 00 00       	call   80106cf0 <switchuvm>
  freevm(oldpgdir);
80100d24:	89 3c 24             	mov    %edi,(%esp)
80100d27:	e8 04 63 00 00       	call   80107030 <freevm>
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
80100d46:	68 49 73 10 80       	push   $0x80107349
80100d4b:	68 e0 ff 10 80       	push   $0x8010ffe0
80100d50:	e8 cb 37 00 00       	call   80104520 <initlock>
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
80100d71:	e8 ca 37 00 00       	call   80104540 <acquire>
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
80100da1:	e8 7a 39 00 00       	call   80104720 <release>
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
80100db8:	e8 63 39 00 00       	call   80104720 <release>
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
80100ddf:	e8 5c 37 00 00       	call   80104540 <acquire>
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
80100dfc:	e8 1f 39 00 00       	call   80104720 <release>
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
80100e0b:	68 50 73 10 80       	push   $0x80107350
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
80100e31:	e8 0a 37 00 00       	call   80104540 <acquire>
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
80100e5c:	e9 bf 38 00 00       	jmp    80104720 <release>
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
80100e88:	e8 93 38 00 00       	call   80104720 <release>

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
80100ee2:	68 58 73 10 80       	push   $0x80107358
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
80100fc2:	68 62 73 10 80       	push   $0x80107362
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
801010d4:	68 6b 73 10 80       	push   $0x8010736b
801010d9:	e8 92 f2 ff ff       	call   80100370 <panic>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
801010de:	83 ec 0c             	sub    $0xc,%esp
801010e1:	68 71 73 10 80       	push   $0x80107371
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
80101192:	68 7b 73 10 80       	push   $0x8010737b
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
801011d5:	e8 96 35 00 00       	call   80104770 <memset>
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
8010121a:	e8 21 33 00 00       	call   80104540 <acquire>
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
80101262:	e8 b9 34 00 00       	call   80104720 <release>
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
801012af:	e8 6c 34 00 00       	call   80104720 <release>

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
801012c4:	68 91 73 10 80       	push   $0x80107391
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
8010138a:	68 a1 73 10 80       	push   $0x801073a1
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
801013c1:	e8 5a 34 00 00       	call   80104820 <memmove>
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
80101456:	68 b4 73 10 80       	push   $0x801073b4
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
8010146c:	68 c7 73 10 80       	push   $0x801073c7
80101471:	68 00 0a 11 80       	push   $0x80110a00
80101476:	e8 a5 30 00 00       	call   80104520 <initlock>
8010147b:	83 c4 10             	add    $0x10,%esp
8010147e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < NINODE; i++) {
    initsleeplock(&icache.inode[i].lock, "inode");
80101480:	83 ec 08             	sub    $0x8,%esp
80101483:	68 ce 73 10 80       	push   $0x801073ce
80101488:	53                   	push   %ebx
80101489:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010148f:	e8 7c 2f 00 00       	call   80104410 <initsleeplock>
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
801014d9:	68 24 74 10 80       	push   $0x80107424
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
8010156e:	e8 fd 31 00 00       	call   80104770 <memset>
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
801015a3:	68 d4 73 10 80       	push   $0x801073d4
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
80101611:	e8 0a 32 00 00       	call   80104820 <memmove>
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
8010163f:	e8 fc 2e 00 00       	call   80104540 <acquire>
  ip->ref++;
80101644:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
80101648:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010164f:	e8 cc 30 00 00       	call   80104720 <release>
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
80101682:	e8 c9 2d 00 00       	call   80104450 <acquiresleep>

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
801016f8:	e8 23 31 00 00       	call   80104820 <memmove>
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
8010171a:	68 ec 73 10 80       	push   $0x801073ec
8010171f:	e8 4c ec ff ff       	call   80100370 <panic>
{
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    panic("ilock");
80101724:	83 ec 0c             	sub    $0xc,%esp
80101727:	68 e6 73 10 80       	push   $0x801073e6
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
80101753:	e8 98 2d 00 00       	call   801044f0 <holdingsleep>
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
8010176f:	e9 3c 2d 00 00       	jmp    801044b0 <releasesleep>
// Unlock the given inode.
void
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");
80101774:	83 ec 0c             	sub    $0xc,%esp
80101777:	68 fb 73 10 80       	push   $0x801073fb
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
801017a1:	e8 9a 2d 00 00       	call   80104540 <acquire>
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
801017c5:	e9 56 2f 00 00       	jmp    80104720 <release>
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
801017ee:	e8 2d 2f 00 00       	call   80104720 <release>
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
8010184f:	e8 ec 2c 00 00       	call   80104540 <acquire>
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
801019c8:	e8 53 2e 00 00       	call   80104820 <memmove>
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
80101ac4:	e8 57 2d 00 00       	call   80104820 <memmove>
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
80101b5e:	e8 3d 2d 00 00       	call   801048a0 <strncmp>
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
80101bc5:	e8 d6 2c 00 00       	call   801048a0 <strncmp>
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
80101bfd:	68 15 74 10 80       	push   $0x80107415
80101c02:	e8 69 e7 ff ff       	call   80100370 <panic>
{
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    panic("dirlookup not DIR");
80101c07:	83 ec 0c             	sub    $0xc,%esp
80101c0a:	68 03 74 10 80       	push   $0x80107403
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
80101c4a:	e8 f1 28 00 00       	call   80104540 <acquire>
  ip->ref++;
80101c4f:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101c53:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101c5a:	e8 c1 2a 00 00       	call   80104720 <release>
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
80101cb5:	e8 66 2b 00 00       	call   80104820 <memmove>
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
80101d44:	e8 d7 2a 00 00       	call   80104820 <memmove>
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
80101e2d:	e8 de 2a 00 00       	call   80104910 <strncpy>
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
80101e6b:	68 15 74 10 80       	push   $0x80107415
80101e70:	e8 fb e4 ff ff       	call   80100370 <panic>
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("dirlink");
80101e75:	83 ec 0c             	sub    $0xc,%esp
80101e78:	68 66 7a 10 80       	push   $0x80107a66
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
80101f80:	68 80 74 10 80       	push   $0x80107480
80101f85:	e8 e6 e3 ff ff       	call   80100370 <panic>
// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
80101f8a:	83 ec 0c             	sub    $0xc,%esp
80101f8d:	68 77 74 10 80       	push   $0x80107477
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
80101fa6:	68 92 74 10 80       	push   $0x80107492
80101fab:	68 80 a5 10 80       	push   $0x8010a580
80101fb0:	e8 6b 25 00 00       	call   80104520 <initlock>
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
8010203e:	e8 fd 24 00 00       	call   80104540 <acquire>
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
8010208c:	e8 8f 26 00 00       	call   80104720 <release>
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
801020de:	e8 0d 24 00 00       	call   801044f0 <holdingsleep>
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
80102118:	e8 23 24 00 00       	call   80104540 <acquire>

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
80102186:	e9 95 25 00 00       	jmp    80104720 <release>

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
8010219e:	68 96 74 10 80       	push   $0x80107496
801021a3:	e8 c8 e1 ff ff       	call   80100370 <panic>
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
    panic("iderw: ide disk 1 not present");
801021a8:	83 ec 0c             	sub    $0xc,%esp
801021ab:	68 c1 74 10 80       	push   $0x801074c1
801021b0:	e8 bb e1 ff ff       	call   80100370 <panic>
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
801021b5:	83 ec 0c             	sub    $0xc,%esp
801021b8:	68 ac 74 10 80       	push   $0x801074ac
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
80102227:	68 e0 74 10 80       	push   $0x801074e0
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
80102302:	e8 69 24 00 00       	call   80104770 <memset>

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
8010233b:	e9 e0 23 00 00       	jmp    80104720 <release>

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);

  if(kmem.use_lock)
    acquire(&kmem.lock);
80102340:	83 ec 0c             	sub    $0xc,%esp
80102343:	68 60 26 11 80       	push   $0x80112660
80102348:	e8 f3 21 00 00       	call   80104540 <acquire>
8010234d:	83 c4 10             	add    $0x10,%esp
80102350:	eb c2                	jmp    80102314 <kfree+0x44>
kfree(char *v)
{
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
    panic("kfree");
80102352:	83 ec 0c             	sub    $0xc,%esp
80102355:	68 12 75 10 80       	push   $0x80107512
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
801023bb:	68 18 75 10 80       	push   $0x80107518
801023c0:	68 60 26 11 80       	push   $0x80112660
801023c5:	e8 56 21 00 00       	call   80104520 <initlock>

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
801024ae:	e8 6d 22 00 00       	call   80104720 <release>
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
801024c8:	e8 73 20 00 00       	call   80104540 <acquire>
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
80102526:	0f b6 82 40 76 10 80 	movzbl -0x7fef89c0(%edx),%eax
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
8010254e:	0f b6 82 40 76 10 80 	movzbl -0x7fef89c0(%edx),%eax
80102555:	09 c1                	or     %eax,%ecx
80102557:	0f b6 82 40 75 10 80 	movzbl -0x7fef8ac0(%edx),%eax
8010255e:	31 c1                	xor    %eax,%ecx
80102560:	89 c8                	mov    %ecx,%eax
80102562:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
80102568:	83 e0 03             	and    $0x3,%eax
8010256b:	83 e1 08             	and    $0x8,%ecx
8010256e:	8b 04 85 20 75 10 80 	mov    -0x7fef8ae0(,%eax,4),%eax
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
80102726:	68 6c 77 10 80       	push   $0x8010776c
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
8010273e:	68 40 77 10 80       	push   $0x80107740
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
80102924:	e8 97 1e 00 00       	call   801047c0 <memcmp>
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
80102a54:	e8 c7 1d 00 00       	call   80104820 <memmove>
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
80102afa:	68 7c 77 10 80       	push   $0x8010777c
80102aff:	68 a0 26 11 80       	push   $0x801126a0
80102b04:	e8 17 1a 00 00       	call   80104520 <initlock>
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
80102b9b:	e8 a0 19 00 00       	call   80104540 <acquire>
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
80102bec:	e8 2f 1b 00 00       	call   80104720 <release>
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
80102c0e:	e8 2d 19 00 00       	call   80104540 <acquire>
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
80102c4d:	e8 ce 1a 00 00       	call   80104720 <release>
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
80102cac:	e8 6f 1b 00 00       	call   80104820 <memmove>
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
80102cf5:	e8 46 18 00 00       	call   80104540 <acquire>
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
80102d17:	e8 04 1a 00 00       	call   80104720 <release>
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
80102d44:	e8 d7 19 00 00       	call   80104720 <release>
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
80102d57:	68 80 77 10 80       	push   $0x80107780
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
80102dae:	e8 8d 17 00 00       	call   80104540 <acquire>
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
80102dfe:	e9 1d 19 00 00       	jmp    80104720 <release>
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
80102e23:	68 8f 77 10 80       	push   $0x8010778f
80102e28:	e8 43 d5 ff ff       	call   80100370 <panic>
  if (log.outstanding < 1)
    panic("log_write outside of trans");
80102e2d:	83 ec 0c             	sub    $0xc,%esp
80102e30:	68 a5 77 10 80       	push   $0x801077a5
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
80102e4f:	68 c0 77 10 80       	push   $0x801077c0
80102e54:	e8 07 d8 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
80102e59:	e8 62 2c 00 00       	call   80105ac0 <idtinit>
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
80102e86:	e8 45 3e 00 00       	call   80106cd0 <switchkvm>
  seginit();
80102e8b:	e8 60 3c 00 00       	call   80106af0 <seginit>
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
80102ec1:	e8 ea 3d 00 00       	call   80106cb0 <kvmalloc>
  mpinit();        // detect other processors
80102ec6:	e8 b5 01 00 00       	call   80103080 <mpinit>
  lapicinit();     // interrupt controller
80102ecb:	e8 10 f7 ff ff       	call   801025e0 <lapicinit>
  seginit();       // segment descriptors
80102ed0:	e8 1b 3c 00 00       	call   80106af0 <seginit>
  cprintf("\ncpu%d: starting xv6\n\n", cpunum());
80102ed5:	e8 06 f8 ff ff       	call   801026e0 <cpunum>
80102eda:	5a                   	pop    %edx
80102edb:	59                   	pop    %ecx
80102edc:	50                   	push   %eax
80102edd:	68 d1 77 10 80       	push   $0x801077d1
80102ee2:	e8 79 d7 ff ff       	call   80100660 <cprintf>
  picinit();       // another interrupt controller
80102ee7:	e8 a4 03 00 00       	call   80103290 <picinit>
  ioapicinit();    // another interrupt controller
80102eec:	e8 df f2 ff ff       	call   801021d0 <ioapicinit>
  consoleinit();   // console hardware
80102ef1:	e8 aa da ff ff       	call   801009a0 <consoleinit>
  uartinit();      // serial port
80102ef6:	e8 c5 2e 00 00       	call   80105dc0 <uartinit>
  pinit();         // process table
80102efb:	e8 40 09 00 00       	call   80103840 <pinit>
  tvinit();        // trap vectors
80102f00:	e8 1b 2b 00 00       	call   80105a20 <tvinit>
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
80102f3c:	e8 df 18 00 00       	call   80104820 <memmove>

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
80102fef:	e8 cc 29 00 00       	call   801059c0 <timerinit>
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
80103028:	68 e8 77 10 80       	push   $0x801077e8
8010302d:	56                   	push   %esi
8010302e:	e8 8d 17 00 00       	call   801047c0 <memcmp>
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
801030e8:	68 ed 77 10 80       	push   $0x801077ed
801030ed:	50                   	push   %eax
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
801030ee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(memcmp(conf, "PCMP", 4) != 0)
801030f1:	e8 ca 16 00 00       	call   801047c0 <memcmp>
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
80103178:	ff 24 95 f4 77 10 80 	jmp    *-0x7fef880c(,%edx,4)
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
801033a3:	68 08 78 10 80       	push   $0x80107808
801033a8:	50                   	push   %eax
801033a9:	e8 72 11 00 00       	call   80104520 <initlock>
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
8010343f:	e8 fc 10 00 00       	call   80104540 <acquire>
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
80103484:	e9 97 12 00 00       	jmp    80104720 <release>
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
801034b4:	e8 67 12 00 00       	call   80104720 <release>
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
801034dd:	e8 5e 10 00 00       	call   80104540 <acquire>
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
801035c8:	e8 53 11 00 00       	call   80104720 <release>
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
801035dc:	e8 3f 11 00 00       	call   80104720 <release>
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
80103610:	e8 2b 0f 00 00       	call   80104540 <acquire>
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
8010367b:	e8 a0 10 00 00       	call   80104720 <release>
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
801036e7:	e8 34 10 00 00       	call   80104720 <release>
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
80103731:	e8 0a 0e 00 00       	call   80104540 <acquire>
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
80103775:	e8 a6 0f 00 00       	call   80104720 <release>

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
8010379a:	c7 40 14 0e 5a 10 80 	movl   $0x80105a0e,0x14(%eax)

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
801037a9:	e8 c2 0f 00 00       	call   80104770 <memset>
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
801037d0:	e8 4b 0f 00 00       	call   80104720 <release>
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
801037fb:	e8 20 0f 00 00       	call   80104720 <release>

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
80103846:	68 0d 78 10 80       	push   $0x8010780d
8010384b:	68 60 28 11 80       	push   $0x80112860
80103850:	e8 cb 0c 00 00       	call   80104520 <initlock>
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
80103873:	e8 c8 33 00 00       	call   80106c40 <setupkvm>
80103878:	85 c0                	test   %eax,%eax
8010387a:	89 43 04             	mov    %eax,0x4(%ebx)
8010387d:	0f 84 bd 00 00 00    	je     80103940 <userinit+0xe0>
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103883:	83 ec 04             	sub    $0x4,%esp
80103886:	68 2c 00 00 00       	push   $0x2c
8010388b:	68 60 a4 10 80       	push   $0x8010a460
80103890:	50                   	push   %eax
80103891:	e8 2a 35 00 00       	call   80106dc0 <inituvm>
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
801038a6:	e8 c5 0e 00 00       	call   80104770 <memset>
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
801038ff:	68 2d 78 10 80       	push   $0x8010782d
80103904:	50                   	push   %eax
80103905:	e8 66 10 00 00       	call   80104970 <safestrcpy>
  p->cwd = namei("/");
8010390a:	c7 04 24 36 78 10 80 	movl   $0x80107836,(%esp)
80103911:	e8 7a e5 ff ff       	call   80101e90 <namei>
80103916:	89 43 68             	mov    %eax,0x68(%ebx)

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);
80103919:	c7 04 24 60 28 11 80 	movl   $0x80112860,(%esp)
80103920:	e8 1b 0c 00 00       	call   80104540 <acquire>

  p->state = RUNNABLE;
80103925:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
8010392c:	c7 04 24 60 28 11 80 	movl   $0x80112860,(%esp)
80103933:	e8 e8 0d 00 00       	call   80104720 <release>
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
80103943:	68 14 78 10 80       	push   $0x80107814
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
80103971:	e8 8a 35 00 00       	call   80106f00 <allocuvm>
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
80103990:	e8 5b 33 00 00       	call   80106cf0 <switchuvm>
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
801039ac:	e8 4f 36 00 00       	call   80107000 <deallocuvm>
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
801039f5:	e8 e6 36 00 00       	call   801070e0 <copyuvm>
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
80103a88:	e8 e3 0e 00 00       	call   80104970 <safestrcpy>

  pid = np->pid;
80103a8d:	8b 73 10             	mov    0x10(%ebx),%esi

  acquire(&ptable.lock);
80103a90:	c7 04 24 60 28 11 80 	movl   $0x80112860,(%esp)
80103a97:	e8 a4 0a 00 00       	call   80104540 <acquire>

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
80103ae6:	e8 35 0c 00 00       	call   80104720 <release>

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
80103bbe:	e8 7d 09 00 00       	call   80104540 <acquire>
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
80103c4e:	e8 9d 30 00 00       	call   80106cf0 <switchuvm>
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
80103c81:	e8 45 0d 00 00       	call   801049cb <swtch>
    proc = 0;
80103c86:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80103c8d:	00 00 00 00 
    switchkvm();
80103c91:	e8 3a 30 00 00       	call   80106cd0 <switchkvm>
    release(&ptable.lock);
80103c96:	c7 04 24 60 28 11 80 	movl   $0x80112860,(%esp)
80103c9d:	e8 7e 0a 00 00       	call   80104720 <release>
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
80103cbc:	e8 af 09 00 00       	call   80104670 <holding>
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
80103cfb:	e8 cb 0c 00 00       	call   801049cb <swtch>
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
80103d17:	68 38 78 10 80       	push   $0x80107838
80103d1c:	e8 4f c6 ff ff       	call   80100370 <panic>
  if(cpu->ncli != 1)
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
80103d21:	83 ec 0c             	sub    $0xc,%esp
80103d24:	68 64 78 10 80       	push   $0x80107864
80103d29:	e8 42 c6 ff ff       	call   80100370 <panic>
  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
80103d2e:	83 ec 0c             	sub    $0xc,%esp
80103d31:	68 56 78 10 80       	push   $0x80107856
80103d36:	e8 35 c6 ff ff       	call   80100370 <panic>
  int intena;

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
    panic("sched locks");
80103d3b:	83 ec 0c             	sub    $0xc,%esp
80103d3e:	68 4a 78 10 80       	push   $0x8010784a
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
80103dcd:	e8 6e 07 00 00       	call   80104540 <acquire>

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
80103e87:	68 85 78 10 80       	push   $0x80107885
80103e8c:	e8 df c4 ff ff       	call   80100370 <panic>
{
  struct proc *p;
  int fd;

  if(proc == initproc)
    panic("init exiting");
80103e91:	83 ec 0c             	sub    $0xc,%esp
80103e94:	68 78 78 10 80       	push   $0x80107878
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
80103eab:	e8 90 06 00 00       	call   80104540 <acquire>
  proc->state = RUNNABLE;
80103eb0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103eb6:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  sched();
80103ebd:	e8 ee fd ff ff       	call   80103cb0 <sched>
  release(&ptable.lock);
80103ec2:	c7 04 24 60 28 11 80 	movl   $0x80112860,(%esp)
80103ec9:	e8 52 08 00 00       	call   80104720 <release>
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
80103f11:	e8 2a 06 00 00       	call   80104540 <acquire>
    release(lk);
80103f16:	89 1c 24             	mov    %ebx,(%esp)
80103f19:	e8 02 08 00 00       	call   80104720 <release>
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
80103f47:	e8 d4 07 00 00       	call   80104720 <release>
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
80103f58:	e9 e3 05 00 00       	jmp    80104540 <acquire>
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
80103f86:	68 97 78 10 80       	push   $0x80107897
80103f8b:	e8 e0 c3 ff ff       	call   80100370 <panic>
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  if(proc == 0)
    panic("sleep");
80103f90:	83 ec 0c             	sub    $0xc,%esp
80103f93:	68 91 78 10 80       	push   $0x80107891
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
80103fad:	e8 8e 05 00 00       	call   80104540 <acquire>
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
8010402f:	e8 fc 2f 00 00       	call   80107030 <freevm>
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
8010405b:	e8 c0 06 00 00       	call   80104720 <release>
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
80104074:	e8 a7 06 00 00       	call   80104720 <release>
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
8010409f:	e8 9c 04 00 00       	call   80104540 <acquire>
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
801040e5:	e9 36 06 00 00       	jmp    80104720 <release>
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
801040ff:	e8 3c 04 00 00       	call   80104540 <acquire>
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
80104136:	e8 e5 05 00 00       	call   80104720 <release>
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
80104160:	e8 bb 05 00 00       	call   80104720 <release>
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
8010419b:	68 11 79 10 80       	push   $0x80107911
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
801041c4:	ba a8 78 10 80       	mov    $0x801078a8,%edx
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801041c9:	77 11                	ja     801041dc <procdump+0x5c>
801041cb:	8b 14 85 60 79 10 80 	mov    -0x7fef86a0(,%eax,4),%edx
      state = states[p->state];
    else
      state = "???";
801041d2:	b8 a8 78 10 80       	mov    $0x801078a8,%eax
801041d7:	85 d2                	test   %edx,%edx
801041d9:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s %d", p->pid, state, p->name, p->tickets);
801041dc:	83 ec 08             	sub    $0x8,%esp
801041df:	ff 73 14             	pushl  0x14(%ebx)
801041e2:	ff 73 10             	pushl  0x10(%ebx)
801041e5:	53                   	push   %ebx
801041e6:	52                   	push   %edx
801041e7:	ff 73 a4             	pushl  -0x5c(%ebx)
801041ea:	68 ac 78 10 80       	push   $0x801078ac
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
80104211:	e8 fa 03 00 00       	call   80104610 <getcallerpcs>
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
80104231:	68 09 73 10 80       	push   $0x80107309
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
80104272:	e8 c9 02 00 00       	call   80104540 <acquire>

  cprintf("name \t pid \t tickets \t state \n");
80104277:	c7 04 24 40 79 10 80 	movl   $0x80107940,(%esp)
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
801042c9:	b9 b9 78 10 80       	mov    $0x801078b9,%ecx
801042ce:	83 ec 08             	sub    $0x8,%esp
801042d1:	51                   	push   %ecx
801042d2:	52                   	push   %edx
801042d3:	50                   	push   %eax
801042d4:	ff 73 a4             	pushl  -0x5c(%ebx)
801042d7:	53                   	push   %ebx
801042d8:	68 ba 78 10 80       	push   $0x801078ba
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
801042fb:	e8 20 04 00 00       	call   80104720 <release>
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
8010431d:	b9 b9 78 10 80       	mov    $0x801078b9,%ecx
80104322:	83 ec 08             	sub    $0x8,%esp
80104325:	51                   	push   %ecx
80104326:	52                   	push   %edx
80104327:	50                   	push   %eax
80104328:	ff 73 a4             	pushl  -0x5c(%ebx)
8010432b:	53                   	push   %ebx
8010432c:	68 d7 78 10 80       	push   $0x801078d7
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
8010434d:	b9 b9 78 10 80       	mov    $0x801078b9,%ecx
80104352:	83 ec 08             	sub    $0x8,%esp
80104355:	51                   	push   %ecx
80104356:	52                   	push   %edx
80104357:	50                   	push   %eax
80104358:	ff 73 a4             	pushl  -0x5c(%ebx)
8010435b:	53                   	push   %ebx
8010435c:	68 f5 78 10 80       	push   $0x801078f5
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
8010437b:	b9 b8 78 10 80       	mov    $0x801078b8,%ecx
80104380:	e9 49 ff ff ff       	jmp    801042ce <cps+0x6e>
80104385:	8d 76 00             	lea    0x0(%esi),%esi
    else if(p->state == SLEEPING)
      cprintf("%s \t %d \t %d %s \t SLEEPING \t\n", p->name, p->pid, p->tickets, p->tickets < 1000 ? "\t" : "");  
80104388:	3d e7 03 00 00       	cmp    $0x3e7,%eax
8010438d:	77 8e                	ja     8010431d <cps+0xbd>
8010438f:	b9 b8 78 10 80       	mov    $0x801078b8,%ecx
80104394:	eb 8c                	jmp    80104322 <cps+0xc2>
80104396:	8d 76 00             	lea    0x0(%esi),%esi
80104399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    else if(p->state == RUNNABLE)
      cprintf("%s \t %d \t %d %s \t RUNNABLE \t\n", p->name, p->pid, p->tickets,  p->tickets < 1000 ? "\t" : "");     
801043a0:	3d e7 03 00 00       	cmp    $0x3e7,%eax
801043a5:	77 a6                	ja     8010434d <cps+0xed>
801043a7:	b9 b8 78 10 80       	mov    $0x801078b8,%ecx
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
801043b3:	53                   	push   %ebx
801043b4:	83 ec 10             	sub    $0x10,%esp
801043b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801043ba:	fb                   	sti    
  struct proc *p;

  sti();
  acquire(&ptable.lock);
801043bb:	68 60 28 11 80       	push   $0x80112860
801043c0:	e8 7b 01 00 00       	call   80104540 <acquire>
801043c5:	83 c4 10             	add    $0x10,%esp

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801043c8:	ba 94 28 11 80       	mov    $0x80112894,%edx
801043cd:	eb 0f                	jmp    801043de <cht+0x2e>
801043cf:	90                   	nop
801043d0:	81 c2 94 00 00 00    	add    $0x94,%edx
801043d6:	81 fa 94 4d 11 80    	cmp    $0x80114d94,%edx
801043dc:	74 14                	je     801043f2 <cht+0x42>
  {
    if(p->pid == pid)
801043de:	39 5a 10             	cmp    %ebx,0x10(%edx)
801043e1:	75 ed                	jne    801043d0 <cht+0x20>
    {
      p->tickets = ntickets;
801043e3:	8b 45 0c             	mov    0xc(%ebp),%eax
801043e6:	89 42 7c             	mov    %eax,0x7c(%edx)
801043e9:	c1 f8 1f             	sar    $0x1f,%eax
801043ec:	89 82 80 00 00 00    	mov    %eax,0x80(%edx)
      break;
    }
  }
  release(&ptable.lock);
801043f2:	83 ec 0c             	sub    $0xc,%esp
801043f5:	68 60 28 11 80       	push   $0x80112860
801043fa:	e8 21 03 00 00       	call   80104720 <release>
  return pid;
801043ff:	89 d8                	mov    %ebx,%eax
80104401:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104404:	c9                   	leave  
80104405:	c3                   	ret    
80104406:	66 90                	xchg   %ax,%ax
80104408:	66 90                	xchg   %ax,%ax
8010440a:	66 90                	xchg   %ax,%ax
8010440c:	66 90                	xchg   %ax,%ax
8010440e:	66 90                	xchg   %ax,%ax

80104410 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80104410:	55                   	push   %ebp
80104411:	89 e5                	mov    %esp,%ebp
80104413:	53                   	push   %ebx
80104414:	83 ec 0c             	sub    $0xc,%esp
80104417:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
8010441a:	68 78 79 10 80       	push   $0x80107978
8010441f:	8d 43 04             	lea    0x4(%ebx),%eax
80104422:	50                   	push   %eax
80104423:	e8 f8 00 00 00       	call   80104520 <initlock>
  lk->name = name;
80104428:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
8010442b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
80104431:	83 c4 10             	add    $0x10,%esp
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
  lk->locked = 0;
  lk->pid = 0;
80104434:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)

void
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
8010443b:	89 43 38             	mov    %eax,0x38(%ebx)
  lk->locked = 0;
  lk->pid = 0;
}
8010443e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104441:	c9                   	leave  
80104442:	c3                   	ret    
80104443:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104450 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
80104450:	55                   	push   %ebp
80104451:	89 e5                	mov    %esp,%ebp
80104453:	56                   	push   %esi
80104454:	53                   	push   %ebx
80104455:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104458:	83 ec 0c             	sub    $0xc,%esp
8010445b:	8d 73 04             	lea    0x4(%ebx),%esi
8010445e:	56                   	push   %esi
8010445f:	e8 dc 00 00 00       	call   80104540 <acquire>
  while (lk->locked) {
80104464:	8b 13                	mov    (%ebx),%edx
80104466:	83 c4 10             	add    $0x10,%esp
80104469:	85 d2                	test   %edx,%edx
8010446b:	74 16                	je     80104483 <acquiresleep+0x33>
8010446d:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
80104470:	83 ec 08             	sub    $0x8,%esp
80104473:	56                   	push   %esi
80104474:	53                   	push   %ebx
80104475:	e8 66 fa ff ff       	call   80103ee0 <sleep>

void
acquiresleep(struct sleeplock *lk)
{
  acquire(&lk->lk);
  while (lk->locked) {
8010447a:	8b 03                	mov    (%ebx),%eax
8010447c:	83 c4 10             	add    $0x10,%esp
8010447f:	85 c0                	test   %eax,%eax
80104481:	75 ed                	jne    80104470 <acquiresleep+0x20>
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
80104483:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = proc->pid;
80104489:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010448f:	8b 40 10             	mov    0x10(%eax),%eax
80104492:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
80104495:	89 75 08             	mov    %esi,0x8(%ebp)
}
80104498:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010449b:	5b                   	pop    %ebx
8010449c:	5e                   	pop    %esi
8010449d:	5d                   	pop    %ebp
  while (lk->locked) {
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
  lk->pid = proc->pid;
  release(&lk->lk);
8010449e:	e9 7d 02 00 00       	jmp    80104720 <release>
801044a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801044a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801044b0 <releasesleep>:
}

void
releasesleep(struct sleeplock *lk)
{
801044b0:	55                   	push   %ebp
801044b1:	89 e5                	mov    %esp,%ebp
801044b3:	56                   	push   %esi
801044b4:	53                   	push   %ebx
801044b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801044b8:	83 ec 0c             	sub    $0xc,%esp
801044bb:	8d 73 04             	lea    0x4(%ebx),%esi
801044be:	56                   	push   %esi
801044bf:	e8 7c 00 00 00       	call   80104540 <acquire>
  lk->locked = 0;
801044c4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
801044ca:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
801044d1:	89 1c 24             	mov    %ebx,(%esp)
801044d4:	e8 b7 fb ff ff       	call   80104090 <wakeup>
  release(&lk->lk);
801044d9:	89 75 08             	mov    %esi,0x8(%ebp)
801044dc:	83 c4 10             	add    $0x10,%esp
}
801044df:	8d 65 f8             	lea    -0x8(%ebp),%esp
801044e2:	5b                   	pop    %ebx
801044e3:	5e                   	pop    %esi
801044e4:	5d                   	pop    %ebp
{
  acquire(&lk->lk);
  lk->locked = 0;
  lk->pid = 0;
  wakeup(lk);
  release(&lk->lk);
801044e5:	e9 36 02 00 00       	jmp    80104720 <release>
801044ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801044f0 <holdingsleep>:
}

int
holdingsleep(struct sleeplock *lk)
{
801044f0:	55                   	push   %ebp
801044f1:	89 e5                	mov    %esp,%ebp
801044f3:	56                   	push   %esi
801044f4:	53                   	push   %ebx
801044f5:	8b 75 08             	mov    0x8(%ebp),%esi
  int r;
  
  acquire(&lk->lk);
801044f8:	83 ec 0c             	sub    $0xc,%esp
801044fb:	8d 5e 04             	lea    0x4(%esi),%ebx
801044fe:	53                   	push   %ebx
801044ff:	e8 3c 00 00 00       	call   80104540 <acquire>
  r = lk->locked;
80104504:	8b 36                	mov    (%esi),%esi
  release(&lk->lk);
80104506:	89 1c 24             	mov    %ebx,(%esp)
80104509:	e8 12 02 00 00       	call   80104720 <release>
  return r;
}
8010450e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104511:	89 f0                	mov    %esi,%eax
80104513:	5b                   	pop    %ebx
80104514:	5e                   	pop    %esi
80104515:	5d                   	pop    %ebp
80104516:	c3                   	ret    
80104517:	66 90                	xchg   %ax,%ax
80104519:	66 90                	xchg   %ax,%ax
8010451b:	66 90                	xchg   %ax,%ax
8010451d:	66 90                	xchg   %ax,%ax
8010451f:	90                   	nop

80104520 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
80104520:	55                   	push   %ebp
80104521:	89 e5                	mov    %esp,%ebp
80104523:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
80104526:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
80104529:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
  lk->name = name;
8010452f:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
  lk->cpu = 0;
80104532:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80104539:	5d                   	pop    %ebp
8010453a:	c3                   	ret    
8010453b:	90                   	nop
8010453c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104540 <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
80104540:	55                   	push   %ebp
80104541:	89 e5                	mov    %esp,%ebp
80104543:	53                   	push   %ebx
80104544:	83 ec 04             	sub    $0x4,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104547:	9c                   	pushf  
80104548:	5a                   	pop    %edx
}

static inline void
cli(void)
{
  asm volatile("cli");
80104549:	fa                   	cli    
{
  int eflags;

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
8010454a:	65 8b 0d 00 00 00 00 	mov    %gs:0x0,%ecx
80104551:	8b 81 ac 00 00 00    	mov    0xac(%ecx),%eax
80104557:	85 c0                	test   %eax,%eax
80104559:	75 0c                	jne    80104567 <acquire+0x27>
    cpu->intena = eflags & FL_IF;
8010455b:	81 e2 00 02 00 00    	and    $0x200,%edx
80104561:	89 91 b0 00 00 00    	mov    %edx,0xb0(%ecx)
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
80104567:	8b 55 08             	mov    0x8(%ebp),%edx

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
    cpu->intena = eflags & FL_IF;
  cpu->ncli += 1;
8010456a:	83 c0 01             	add    $0x1,%eax
8010456d:	89 81 ac 00 00 00    	mov    %eax,0xac(%ecx)

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
80104573:	8b 02                	mov    (%edx),%eax
80104575:	85 c0                	test   %eax,%eax
80104577:	74 05                	je     8010457e <acquire+0x3e>
80104579:	39 4a 08             	cmp    %ecx,0x8(%edx)
8010457c:	74 7a                	je     801045f8 <acquire+0xb8>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
8010457e:	b9 01 00 00 00       	mov    $0x1,%ecx
80104583:	90                   	nop
80104584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104588:	89 c8                	mov    %ecx,%eax
8010458a:	f0 87 02             	lock xchg %eax,(%edx)
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");

  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
8010458d:	85 c0                	test   %eax,%eax
8010458f:	75 f7                	jne    80104588 <acquire+0x48>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
80104591:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
80104596:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104599:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
getcallerpcs(void *v, uint pcs[])
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
8010459f:	89 ea                	mov    %ebp,%edx
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
801045a1:	89 41 08             	mov    %eax,0x8(%ecx)
  getcallerpcs(&lk, lk->pcs);
801045a4:	83 c1 0c             	add    $0xc,%ecx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801045a7:	31 c0                	xor    %eax,%eax
801045a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801045b0:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801045b6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801045bc:	77 1a                	ja     801045d8 <acquire+0x98>
      break;
    pcs[i] = ebp[1];     // saved %eip
801045be:	8b 5a 04             	mov    0x4(%edx),%ebx
801045c1:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801045c4:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
801045c7:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801045c9:	83 f8 0a             	cmp    $0xa,%eax
801045cc:	75 e2                	jne    801045b0 <acquire+0x70>
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
  getcallerpcs(&lk, lk->pcs);
}
801045ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801045d1:	c9                   	leave  
801045d2:	c3                   	ret    
801045d3:	90                   	nop
801045d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
801045d8:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801045df:	83 c0 01             	add    $0x1,%eax
801045e2:	83 f8 0a             	cmp    $0xa,%eax
801045e5:	74 e7                	je     801045ce <acquire+0x8e>
    pcs[i] = 0;
801045e7:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801045ee:	83 c0 01             	add    $0x1,%eax
801045f1:	83 f8 0a             	cmp    $0xa,%eax
801045f4:	75 e2                	jne    801045d8 <acquire+0x98>
801045f6:	eb d6                	jmp    801045ce <acquire+0x8e>
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");
801045f8:	83 ec 0c             	sub    $0xc,%esp
801045fb:	68 83 79 10 80       	push   $0x80107983
80104600:	e8 6b bd ff ff       	call   80100370 <panic>
80104605:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104610 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104610:	55                   	push   %ebp
80104611:	89 e5                	mov    %esp,%ebp
80104613:	53                   	push   %ebx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
80104614:	8b 45 08             	mov    0x8(%ebp),%eax
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104617:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
8010461a:	8d 50 f8             	lea    -0x8(%eax),%edx
  for(i = 0; i < 10; i++){
8010461d:	31 c0                	xor    %eax,%eax
8010461f:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104620:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104626:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010462c:	77 1a                	ja     80104648 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
8010462e:	8b 5a 04             	mov    0x4(%edx),%ebx
80104631:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104634:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
80104637:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104639:	83 f8 0a             	cmp    $0xa,%eax
8010463c:	75 e2                	jne    80104620 <getcallerpcs+0x10>
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
8010463e:	5b                   	pop    %ebx
8010463f:	5d                   	pop    %ebp
80104640:	c3                   	ret    
80104641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
80104648:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010464f:	83 c0 01             	add    $0x1,%eax
80104652:	83 f8 0a             	cmp    $0xa,%eax
80104655:	74 e7                	je     8010463e <getcallerpcs+0x2e>
    pcs[i] = 0;
80104657:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010465e:	83 c0 01             	add    $0x1,%eax
80104661:	83 f8 0a             	cmp    $0xa,%eax
80104664:	75 e2                	jne    80104648 <getcallerpcs+0x38>
80104666:	eb d6                	jmp    8010463e <getcallerpcs+0x2e>
80104668:	90                   	nop
80104669:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104670 <holding>:
}

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
80104670:	55                   	push   %ebp
80104671:	89 e5                	mov    %esp,%ebp
80104673:	8b 55 08             	mov    0x8(%ebp),%edx
  return lock->locked && lock->cpu == cpu;
80104676:	8b 02                	mov    (%edx),%eax
80104678:	85 c0                	test   %eax,%eax
8010467a:	74 14                	je     80104690 <holding+0x20>
8010467c:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104682:	39 42 08             	cmp    %eax,0x8(%edx)
}
80104685:	5d                   	pop    %ebp

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
80104686:	0f 94 c0             	sete   %al
80104689:	0f b6 c0             	movzbl %al,%eax
}
8010468c:	c3                   	ret    
8010468d:	8d 76 00             	lea    0x0(%esi),%esi
80104690:	31 c0                	xor    %eax,%eax
80104692:	5d                   	pop    %ebp
80104693:	c3                   	ret    
80104694:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010469a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801046a0 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
801046a0:	55                   	push   %ebp
801046a1:	89 e5                	mov    %esp,%ebp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801046a3:	9c                   	pushf  
801046a4:	59                   	pop    %ecx
}

static inline void
cli(void)
{
  asm volatile("cli");
801046a5:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
801046a6:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
801046ad:	8b 82 ac 00 00 00    	mov    0xac(%edx),%eax
801046b3:	85 c0                	test   %eax,%eax
801046b5:	75 0c                	jne    801046c3 <pushcli+0x23>
    cpu->intena = eflags & FL_IF;
801046b7:	81 e1 00 02 00 00    	and    $0x200,%ecx
801046bd:	89 8a b0 00 00 00    	mov    %ecx,0xb0(%edx)
  cpu->ncli += 1;
801046c3:	83 c0 01             	add    $0x1,%eax
801046c6:	89 82 ac 00 00 00    	mov    %eax,0xac(%edx)
}
801046cc:	5d                   	pop    %ebp
801046cd:	c3                   	ret    
801046ce:	66 90                	xchg   %ax,%ax

801046d0 <popcli>:

void
popcli(void)
{
801046d0:	55                   	push   %ebp
801046d1:	89 e5                	mov    %esp,%ebp
801046d3:	83 ec 08             	sub    $0x8,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801046d6:	9c                   	pushf  
801046d7:	58                   	pop    %eax
  if(readeflags()&FL_IF)
801046d8:	f6 c4 02             	test   $0x2,%ah
801046db:	75 2c                	jne    80104709 <popcli+0x39>
    panic("popcli - interruptible");
  if(--cpu->ncli < 0)
801046dd:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
801046e4:	83 aa ac 00 00 00 01 	subl   $0x1,0xac(%edx)
801046eb:	78 0f                	js     801046fc <popcli+0x2c>
    panic("popcli");
  if(cpu->ncli == 0 && cpu->intena)
801046ed:	75 0b                	jne    801046fa <popcli+0x2a>
801046ef:	8b 82 b0 00 00 00    	mov    0xb0(%edx),%eax
801046f5:	85 c0                	test   %eax,%eax
801046f7:	74 01                	je     801046fa <popcli+0x2a>
}

static inline void
sti(void)
{
  asm volatile("sti");
801046f9:	fb                   	sti    
    sti();
}
801046fa:	c9                   	leave  
801046fb:	c3                   	ret    
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--cpu->ncli < 0)
    panic("popcli");
801046fc:	83 ec 0c             	sub    $0xc,%esp
801046ff:	68 a2 79 10 80       	push   $0x801079a2
80104704:	e8 67 bc ff ff       	call   80100370 <panic>

void
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
80104709:	83 ec 0c             	sub    $0xc,%esp
8010470c:	68 8b 79 10 80       	push   $0x8010798b
80104711:	e8 5a bc ff ff       	call   80100370 <panic>
80104716:	8d 76 00             	lea    0x0(%esi),%esi
80104719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104720 <release>:
}

// Release the lock.
void
release(struct spinlock *lk)
{
80104720:	55                   	push   %ebp
80104721:	89 e5                	mov    %esp,%ebp
80104723:	83 ec 08             	sub    $0x8,%esp
80104726:	8b 45 08             	mov    0x8(%ebp),%eax

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
80104729:	8b 10                	mov    (%eax),%edx
8010472b:	85 d2                	test   %edx,%edx
8010472d:	74 0c                	je     8010473b <release+0x1b>
8010472f:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104736:	39 50 08             	cmp    %edx,0x8(%eax)
80104739:	74 15                	je     80104750 <release+0x30>
// Release the lock.
void
release(struct spinlock *lk)
{
  if(!holding(lk))
    panic("release");
8010473b:	83 ec 0c             	sub    $0xc,%esp
8010473e:	68 a9 79 10 80       	push   $0x801079a9
80104743:	e8 28 bc ff ff       	call   80100370 <panic>
80104748:	90                   	nop
80104749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  lk->pcs[0] = 0;
80104750:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  lk->cpu = 0;
80104757:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();
8010475e:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
80104763:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  popcli();
}
80104769:	c9                   	leave  
  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );

  popcli();
8010476a:	e9 61 ff ff ff       	jmp    801046d0 <popcli>
8010476f:	90                   	nop

80104770 <memset>:
80104770:	55                   	push   %ebp
80104771:	89 e5                	mov    %esp,%ebp
80104773:	57                   	push   %edi
80104774:	53                   	push   %ebx
80104775:	8b 55 08             	mov    0x8(%ebp),%edx
80104778:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010477b:	f6 c2 03             	test   $0x3,%dl
8010477e:	75 05                	jne    80104785 <memset+0x15>
80104780:	f6 c1 03             	test   $0x3,%cl
80104783:	74 13                	je     80104798 <memset+0x28>
80104785:	89 d7                	mov    %edx,%edi
80104787:	8b 45 0c             	mov    0xc(%ebp),%eax
8010478a:	fc                   	cld    
8010478b:	f3 aa                	rep stos %al,%es:(%edi)
8010478d:	5b                   	pop    %ebx
8010478e:	89 d0                	mov    %edx,%eax
80104790:	5f                   	pop    %edi
80104791:	5d                   	pop    %ebp
80104792:	c3                   	ret    
80104793:	90                   	nop
80104794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104798:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
8010479c:	c1 e9 02             	shr    $0x2,%ecx
8010479f:	89 fb                	mov    %edi,%ebx
801047a1:	89 f8                	mov    %edi,%eax
801047a3:	c1 e3 18             	shl    $0x18,%ebx
801047a6:	c1 e0 10             	shl    $0x10,%eax
801047a9:	09 d8                	or     %ebx,%eax
801047ab:	09 f8                	or     %edi,%eax
801047ad:	c1 e7 08             	shl    $0x8,%edi
801047b0:	09 f8                	or     %edi,%eax
801047b2:	89 d7                	mov    %edx,%edi
801047b4:	fc                   	cld    
801047b5:	f3 ab                	rep stos %eax,%es:(%edi)
801047b7:	5b                   	pop    %ebx
801047b8:	89 d0                	mov    %edx,%eax
801047ba:	5f                   	pop    %edi
801047bb:	5d                   	pop    %ebp
801047bc:	c3                   	ret    
801047bd:	8d 76 00             	lea    0x0(%esi),%esi

801047c0 <memcmp>:
801047c0:	55                   	push   %ebp
801047c1:	89 e5                	mov    %esp,%ebp
801047c3:	57                   	push   %edi
801047c4:	56                   	push   %esi
801047c5:	8b 45 10             	mov    0x10(%ebp),%eax
801047c8:	53                   	push   %ebx
801047c9:	8b 75 0c             	mov    0xc(%ebp),%esi
801047cc:	8b 5d 08             	mov    0x8(%ebp),%ebx
801047cf:	85 c0                	test   %eax,%eax
801047d1:	74 29                	je     801047fc <memcmp+0x3c>
801047d3:	0f b6 13             	movzbl (%ebx),%edx
801047d6:	0f b6 0e             	movzbl (%esi),%ecx
801047d9:	38 d1                	cmp    %dl,%cl
801047db:	75 2b                	jne    80104808 <memcmp+0x48>
801047dd:	8d 78 ff             	lea    -0x1(%eax),%edi
801047e0:	31 c0                	xor    %eax,%eax
801047e2:	eb 14                	jmp    801047f8 <memcmp+0x38>
801047e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801047e8:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
801047ed:	83 c0 01             	add    $0x1,%eax
801047f0:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
801047f4:	38 ca                	cmp    %cl,%dl
801047f6:	75 10                	jne    80104808 <memcmp+0x48>
801047f8:	39 f8                	cmp    %edi,%eax
801047fa:	75 ec                	jne    801047e8 <memcmp+0x28>
801047fc:	5b                   	pop    %ebx
801047fd:	31 c0                	xor    %eax,%eax
801047ff:	5e                   	pop    %esi
80104800:	5f                   	pop    %edi
80104801:	5d                   	pop    %ebp
80104802:	c3                   	ret    
80104803:	90                   	nop
80104804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104808:	0f b6 c2             	movzbl %dl,%eax
8010480b:	5b                   	pop    %ebx
8010480c:	29 c8                	sub    %ecx,%eax
8010480e:	5e                   	pop    %esi
8010480f:	5f                   	pop    %edi
80104810:	5d                   	pop    %ebp
80104811:	c3                   	ret    
80104812:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104820 <memmove>:
80104820:	55                   	push   %ebp
80104821:	89 e5                	mov    %esp,%ebp
80104823:	56                   	push   %esi
80104824:	53                   	push   %ebx
80104825:	8b 45 08             	mov    0x8(%ebp),%eax
80104828:	8b 75 0c             	mov    0xc(%ebp),%esi
8010482b:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010482e:	39 c6                	cmp    %eax,%esi
80104830:	73 2e                	jae    80104860 <memmove+0x40>
80104832:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
80104835:	39 c8                	cmp    %ecx,%eax
80104837:	73 27                	jae    80104860 <memmove+0x40>
80104839:	85 db                	test   %ebx,%ebx
8010483b:	8d 53 ff             	lea    -0x1(%ebx),%edx
8010483e:	74 17                	je     80104857 <memmove+0x37>
80104840:	29 d9                	sub    %ebx,%ecx
80104842:	89 cb                	mov    %ecx,%ebx
80104844:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104848:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
8010484c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
8010484f:	83 ea 01             	sub    $0x1,%edx
80104852:	83 fa ff             	cmp    $0xffffffff,%edx
80104855:	75 f1                	jne    80104848 <memmove+0x28>
80104857:	5b                   	pop    %ebx
80104858:	5e                   	pop    %esi
80104859:	5d                   	pop    %ebp
8010485a:	c3                   	ret    
8010485b:	90                   	nop
8010485c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104860:	31 d2                	xor    %edx,%edx
80104862:	85 db                	test   %ebx,%ebx
80104864:	74 f1                	je     80104857 <memmove+0x37>
80104866:	8d 76 00             	lea    0x0(%esi),%esi
80104869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104870:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104874:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104877:	83 c2 01             	add    $0x1,%edx
8010487a:	39 d3                	cmp    %edx,%ebx
8010487c:	75 f2                	jne    80104870 <memmove+0x50>
8010487e:	5b                   	pop    %ebx
8010487f:	5e                   	pop    %esi
80104880:	5d                   	pop    %ebp
80104881:	c3                   	ret    
80104882:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104890 <memcpy>:
80104890:	55                   	push   %ebp
80104891:	89 e5                	mov    %esp,%ebp
80104893:	5d                   	pop    %ebp
80104894:	eb 8a                	jmp    80104820 <memmove>
80104896:	8d 76 00             	lea    0x0(%esi),%esi
80104899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801048a0 <strncmp>:
801048a0:	55                   	push   %ebp
801048a1:	89 e5                	mov    %esp,%ebp
801048a3:	57                   	push   %edi
801048a4:	56                   	push   %esi
801048a5:	8b 4d 10             	mov    0x10(%ebp),%ecx
801048a8:	53                   	push   %ebx
801048a9:	8b 7d 08             	mov    0x8(%ebp),%edi
801048ac:	8b 75 0c             	mov    0xc(%ebp),%esi
801048af:	85 c9                	test   %ecx,%ecx
801048b1:	74 37                	je     801048ea <strncmp+0x4a>
801048b3:	0f b6 17             	movzbl (%edi),%edx
801048b6:	0f b6 1e             	movzbl (%esi),%ebx
801048b9:	84 d2                	test   %dl,%dl
801048bb:	74 3f                	je     801048fc <strncmp+0x5c>
801048bd:	38 d3                	cmp    %dl,%bl
801048bf:	75 3b                	jne    801048fc <strncmp+0x5c>
801048c1:	8d 47 01             	lea    0x1(%edi),%eax
801048c4:	01 cf                	add    %ecx,%edi
801048c6:	eb 1b                	jmp    801048e3 <strncmp+0x43>
801048c8:	90                   	nop
801048c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801048d0:	0f b6 10             	movzbl (%eax),%edx
801048d3:	84 d2                	test   %dl,%dl
801048d5:	74 21                	je     801048f8 <strncmp+0x58>
801048d7:	0f b6 19             	movzbl (%ecx),%ebx
801048da:	83 c0 01             	add    $0x1,%eax
801048dd:	89 ce                	mov    %ecx,%esi
801048df:	38 da                	cmp    %bl,%dl
801048e1:	75 19                	jne    801048fc <strncmp+0x5c>
801048e3:	39 c7                	cmp    %eax,%edi
801048e5:	8d 4e 01             	lea    0x1(%esi),%ecx
801048e8:	75 e6                	jne    801048d0 <strncmp+0x30>
801048ea:	5b                   	pop    %ebx
801048eb:	31 c0                	xor    %eax,%eax
801048ed:	5e                   	pop    %esi
801048ee:	5f                   	pop    %edi
801048ef:	5d                   	pop    %ebp
801048f0:	c3                   	ret    
801048f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801048f8:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
801048fc:	0f b6 c2             	movzbl %dl,%eax
801048ff:	29 d8                	sub    %ebx,%eax
80104901:	5b                   	pop    %ebx
80104902:	5e                   	pop    %esi
80104903:	5f                   	pop    %edi
80104904:	5d                   	pop    %ebp
80104905:	c3                   	ret    
80104906:	8d 76 00             	lea    0x0(%esi),%esi
80104909:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104910 <strncpy>:
80104910:	55                   	push   %ebp
80104911:	89 e5                	mov    %esp,%ebp
80104913:	56                   	push   %esi
80104914:	53                   	push   %ebx
80104915:	8b 45 08             	mov    0x8(%ebp),%eax
80104918:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010491b:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010491e:	89 c2                	mov    %eax,%edx
80104920:	eb 19                	jmp    8010493b <strncpy+0x2b>
80104922:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104928:	83 c3 01             	add    $0x1,%ebx
8010492b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
8010492f:	83 c2 01             	add    $0x1,%edx
80104932:	84 c9                	test   %cl,%cl
80104934:	88 4a ff             	mov    %cl,-0x1(%edx)
80104937:	74 09                	je     80104942 <strncpy+0x32>
80104939:	89 f1                	mov    %esi,%ecx
8010493b:	85 c9                	test   %ecx,%ecx
8010493d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104940:	7f e6                	jg     80104928 <strncpy+0x18>
80104942:	31 c9                	xor    %ecx,%ecx
80104944:	85 f6                	test   %esi,%esi
80104946:	7e 17                	jle    8010495f <strncpy+0x4f>
80104948:	90                   	nop
80104949:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104950:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104954:	89 f3                	mov    %esi,%ebx
80104956:	83 c1 01             	add    $0x1,%ecx
80104959:	29 cb                	sub    %ecx,%ebx
8010495b:	85 db                	test   %ebx,%ebx
8010495d:	7f f1                	jg     80104950 <strncpy+0x40>
8010495f:	5b                   	pop    %ebx
80104960:	5e                   	pop    %esi
80104961:	5d                   	pop    %ebp
80104962:	c3                   	ret    
80104963:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104969:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104970 <safestrcpy>:
80104970:	55                   	push   %ebp
80104971:	89 e5                	mov    %esp,%ebp
80104973:	56                   	push   %esi
80104974:	53                   	push   %ebx
80104975:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104978:	8b 45 08             	mov    0x8(%ebp),%eax
8010497b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010497e:	85 c9                	test   %ecx,%ecx
80104980:	7e 26                	jle    801049a8 <safestrcpy+0x38>
80104982:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104986:	89 c1                	mov    %eax,%ecx
80104988:	eb 17                	jmp    801049a1 <safestrcpy+0x31>
8010498a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104990:	83 c2 01             	add    $0x1,%edx
80104993:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104997:	83 c1 01             	add    $0x1,%ecx
8010499a:	84 db                	test   %bl,%bl
8010499c:	88 59 ff             	mov    %bl,-0x1(%ecx)
8010499f:	74 04                	je     801049a5 <safestrcpy+0x35>
801049a1:	39 f2                	cmp    %esi,%edx
801049a3:	75 eb                	jne    80104990 <safestrcpy+0x20>
801049a5:	c6 01 00             	movb   $0x0,(%ecx)
801049a8:	5b                   	pop    %ebx
801049a9:	5e                   	pop    %esi
801049aa:	5d                   	pop    %ebp
801049ab:	c3                   	ret    
801049ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801049b0 <strlen>:
801049b0:	55                   	push   %ebp
801049b1:	31 c0                	xor    %eax,%eax
801049b3:	89 e5                	mov    %esp,%ebp
801049b5:	8b 55 08             	mov    0x8(%ebp),%edx
801049b8:	80 3a 00             	cmpb   $0x0,(%edx)
801049bb:	74 0c                	je     801049c9 <strlen+0x19>
801049bd:	8d 76 00             	lea    0x0(%esi),%esi
801049c0:	83 c0 01             	add    $0x1,%eax
801049c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
801049c7:	75 f7                	jne    801049c0 <strlen+0x10>
801049c9:	5d                   	pop    %ebp
801049ca:	c3                   	ret    

801049cb <swtch>:
801049cb:	8b 44 24 04          	mov    0x4(%esp),%eax
801049cf:	8b 54 24 08          	mov    0x8(%esp),%edx
801049d3:	55                   	push   %ebp
801049d4:	53                   	push   %ebx
801049d5:	56                   	push   %esi
801049d6:	57                   	push   %edi
801049d7:	89 20                	mov    %esp,(%eax)
801049d9:	89 d4                	mov    %edx,%esp
801049db:	5f                   	pop    %edi
801049dc:	5e                   	pop    %esi
801049dd:	5b                   	pop    %ebx
801049de:	5d                   	pop    %ebp
801049df:	c3                   	ret    

801049e0 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
801049e0:	55                   	push   %ebp
  if(addr >= proc->sz || addr+4 > proc->sz)
801049e1:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
801049e8:	89 e5                	mov    %esp,%ebp
801049ea:	8b 45 08             	mov    0x8(%ebp),%eax
  if(addr >= proc->sz || addr+4 > proc->sz)
801049ed:	8b 12                	mov    (%edx),%edx
801049ef:	39 c2                	cmp    %eax,%edx
801049f1:	76 15                	jbe    80104a08 <fetchint+0x28>
801049f3:	8d 48 04             	lea    0x4(%eax),%ecx
801049f6:	39 ca                	cmp    %ecx,%edx
801049f8:	72 0e                	jb     80104a08 <fetchint+0x28>
    return -1;
  *ip = *(int*)(addr);
801049fa:	8b 10                	mov    (%eax),%edx
801049fc:	8b 45 0c             	mov    0xc(%ebp),%eax
801049ff:	89 10                	mov    %edx,(%eax)
  return 0;
80104a01:	31 c0                	xor    %eax,%eax
}
80104a03:	5d                   	pop    %ebp
80104a04:	c3                   	ret    
80104a05:	8d 76 00             	lea    0x0(%esi),%esi
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
80104a08:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  *ip = *(int*)(addr);
  return 0;
}
80104a0d:	5d                   	pop    %ebp
80104a0e:	c3                   	ret    
80104a0f:	90                   	nop

80104a10 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104a10:	55                   	push   %ebp
  char *s, *ep;

  if(addr >= proc->sz)
80104a11:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104a17:	89 e5                	mov    %esp,%ebp
80104a19:	8b 4d 08             	mov    0x8(%ebp),%ecx
  char *s, *ep;

  if(addr >= proc->sz)
80104a1c:	39 08                	cmp    %ecx,(%eax)
80104a1e:	76 2c                	jbe    80104a4c <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
80104a20:	8b 55 0c             	mov    0xc(%ebp),%edx
80104a23:	89 c8                	mov    %ecx,%eax
80104a25:	89 0a                	mov    %ecx,(%edx)
  ep = (char*)proc->sz;
80104a27:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104a2e:	8b 12                	mov    (%edx),%edx
  for(s = *pp; s < ep; s++)
80104a30:	39 d1                	cmp    %edx,%ecx
80104a32:	73 18                	jae    80104a4c <fetchstr+0x3c>
    if(*s == 0)
80104a34:	80 39 00             	cmpb   $0x0,(%ecx)
80104a37:	75 0c                	jne    80104a45 <fetchstr+0x35>
80104a39:	eb 1d                	jmp    80104a58 <fetchstr+0x48>
80104a3b:	90                   	nop
80104a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104a40:	80 38 00             	cmpb   $0x0,(%eax)
80104a43:	74 13                	je     80104a58 <fetchstr+0x48>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
80104a45:	83 c0 01             	add    $0x1,%eax
80104a48:	39 c2                	cmp    %eax,%edx
80104a4a:	77 f4                	ja     80104a40 <fetchstr+0x30>
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= proc->sz)
    return -1;
80104a4c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
    if(*s == 0)
      return s - *pp;
  return -1;
}
80104a51:	5d                   	pop    %ebp
80104a52:	c3                   	ret    
80104a53:	90                   	nop
80104a54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
    if(*s == 0)
      return s - *pp;
80104a58:	29 c8                	sub    %ecx,%eax
  return -1;
}
80104a5a:	5d                   	pop    %ebp
80104a5b:	c3                   	ret    
80104a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104a60 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104a60:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
}

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104a67:	55                   	push   %ebp
80104a68:	89 e5                	mov    %esp,%ebp
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104a6a:	8b 42 18             	mov    0x18(%edx),%eax
80104a6d:	8b 4d 08             	mov    0x8(%ebp),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104a70:	8b 12                	mov    (%edx),%edx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104a72:	8b 40 44             	mov    0x44(%eax),%eax
80104a75:	8d 04 88             	lea    (%eax,%ecx,4),%eax
80104a78:	8d 48 04             	lea    0x4(%eax),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104a7b:	39 d1                	cmp    %edx,%ecx
80104a7d:	73 19                	jae    80104a98 <argint+0x38>
80104a7f:	8d 48 08             	lea    0x8(%eax),%ecx
80104a82:	39 ca                	cmp    %ecx,%edx
80104a84:	72 12                	jb     80104a98 <argint+0x38>
    return -1;
  *ip = *(int*)(addr);
80104a86:	8b 50 04             	mov    0x4(%eax),%edx
80104a89:	8b 45 0c             	mov    0xc(%ebp),%eax
80104a8c:	89 10                	mov    %edx,(%eax)
  return 0;
80104a8e:	31 c0                	xor    %eax,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
}
80104a90:	5d                   	pop    %ebp
80104a91:	c3                   	ret    
80104a92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
80104a98:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
}
80104a9d:	5d                   	pop    %ebp
80104a9e:	c3                   	ret    
80104a9f:	90                   	nop

80104aa0 <argptr>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104aa0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104aa6:	55                   	push   %ebp
80104aa7:	89 e5                	mov    %esp,%ebp
80104aa9:	56                   	push   %esi
80104aaa:	53                   	push   %ebx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104aab:	8b 48 18             	mov    0x18(%eax),%ecx
80104aae:	8b 5d 08             	mov    0x8(%ebp),%ebx
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104ab1:	8b 55 10             	mov    0x10(%ebp),%edx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104ab4:	8b 49 44             	mov    0x44(%ecx),%ecx
80104ab7:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104aba:	8b 08                	mov    (%eax),%ecx
argptr(int n, char **pp, int size)
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
80104abc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104ac1:	8d 73 04             	lea    0x4(%ebx),%esi

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104ac4:	39 ce                	cmp    %ecx,%esi
80104ac6:	73 1f                	jae    80104ae7 <argptr+0x47>
80104ac8:	8d 73 08             	lea    0x8(%ebx),%esi
80104acb:	39 f1                	cmp    %esi,%ecx
80104acd:	72 18                	jb     80104ae7 <argptr+0x47>
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= proc->sz || (uint)i+size > proc->sz)
80104acf:	85 d2                	test   %edx,%edx
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
  *ip = *(int*)(addr);
80104ad1:	8b 5b 04             	mov    0x4(%ebx),%ebx
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= proc->sz || (uint)i+size > proc->sz)
80104ad4:	78 11                	js     80104ae7 <argptr+0x47>
80104ad6:	39 cb                	cmp    %ecx,%ebx
80104ad8:	73 0d                	jae    80104ae7 <argptr+0x47>
80104ada:	01 da                	add    %ebx,%edx
80104adc:	39 ca                	cmp    %ecx,%edx
80104ade:	77 07                	ja     80104ae7 <argptr+0x47>
    return -1;
  *pp = (char*)i;
80104ae0:	8b 45 0c             	mov    0xc(%ebp),%eax
80104ae3:	89 18                	mov    %ebx,(%eax)
  return 0;
80104ae5:	31 c0                	xor    %eax,%eax
}
80104ae7:	5b                   	pop    %ebx
80104ae8:	5e                   	pop    %esi
80104ae9:	5d                   	pop    %ebp
80104aea:	c3                   	ret    
80104aeb:	90                   	nop
80104aec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104af0 <argstr>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104af0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104af6:	55                   	push   %ebp
80104af7:	89 e5                	mov    %esp,%ebp

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104af9:	8b 50 18             	mov    0x18(%eax),%edx
80104afc:	8b 4d 08             	mov    0x8(%ebp),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104aff:	8b 00                	mov    (%eax),%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104b01:	8b 52 44             	mov    0x44(%edx),%edx
80104b04:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
80104b07:	8d 4a 04             	lea    0x4(%edx),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104b0a:	39 c1                	cmp    %eax,%ecx
80104b0c:	73 07                	jae    80104b15 <argstr+0x25>
80104b0e:	8d 4a 08             	lea    0x8(%edx),%ecx
80104b11:	39 c8                	cmp    %ecx,%eax
80104b13:	73 0b                	jae    80104b20 <argstr+0x30>
int
argstr(int n, char **pp)
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
80104b15:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchstr(addr, pp);
}
80104b1a:	5d                   	pop    %ebp
80104b1b:	c3                   	ret    
80104b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
  *ip = *(int*)(addr);
80104b20:	8b 4a 04             	mov    0x4(%edx),%ecx
int
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= proc->sz)
80104b23:	39 c1                	cmp    %eax,%ecx
80104b25:	73 ee                	jae    80104b15 <argstr+0x25>
    return -1;
  *pp = (char*)addr;
80104b27:	8b 55 0c             	mov    0xc(%ebp),%edx
80104b2a:	89 c8                	mov    %ecx,%eax
80104b2c:	89 0a                	mov    %ecx,(%edx)
  ep = (char*)proc->sz;
80104b2e:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104b35:	8b 12                	mov    (%edx),%edx
  for(s = *pp; s < ep; s++)
80104b37:	39 d1                	cmp    %edx,%ecx
80104b39:	73 da                	jae    80104b15 <argstr+0x25>
    if(*s == 0)
80104b3b:	80 39 00             	cmpb   $0x0,(%ecx)
80104b3e:	75 0d                	jne    80104b4d <argstr+0x5d>
80104b40:	eb 1e                	jmp    80104b60 <argstr+0x70>
80104b42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104b48:	80 38 00             	cmpb   $0x0,(%eax)
80104b4b:	74 13                	je     80104b60 <argstr+0x70>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
80104b4d:	83 c0 01             	add    $0x1,%eax
80104b50:	39 c2                	cmp    %eax,%edx
80104b52:	77 f4                	ja     80104b48 <argstr+0x58>
80104b54:	eb bf                	jmp    80104b15 <argstr+0x25>
80104b56:	8d 76 00             	lea    0x0(%esi),%esi
80104b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(*s == 0)
      return s - *pp;
80104b60:	29 c8                	sub    %ecx,%eax
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
  return fetchstr(addr, pp);
}
80104b62:	5d                   	pop    %ebp
80104b63:	c3                   	ret    
80104b64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104b6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104b70 <syscall>:
[SYS_cht]     sys_cht,
};

void
syscall(void)
{
80104b70:	55                   	push   %ebp
80104b71:	89 e5                	mov    %esp,%ebp
80104b73:	53                   	push   %ebx
80104b74:	83 ec 04             	sub    $0x4,%esp
  int num;

  num = proc->tf->eax;
80104b77:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104b7e:	8b 5a 18             	mov    0x18(%edx),%ebx
80104b81:	8b 43 1c             	mov    0x1c(%ebx),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104b84:	8d 48 ff             	lea    -0x1(%eax),%ecx
80104b87:	83 f9 16             	cmp    $0x16,%ecx
80104b8a:	77 1c                	ja     80104ba8 <syscall+0x38>
80104b8c:	8b 0c 85 e0 79 10 80 	mov    -0x7fef8620(,%eax,4),%ecx
80104b93:	85 c9                	test   %ecx,%ecx
80104b95:	74 11                	je     80104ba8 <syscall+0x38>
    proc->tf->eax = syscalls[num]();
80104b97:	ff d1                	call   *%ecx
80104b99:	89 43 1c             	mov    %eax,0x1c(%ebx)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
  }
}
80104b9c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104b9f:	c9                   	leave  
80104ba0:	c3                   	ret    
80104ba1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104ba8:	50                   	push   %eax
            proc->pid, proc->name, num);
80104ba9:	8d 42 6c             	lea    0x6c(%edx),%eax

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104bac:	50                   	push   %eax
80104bad:	ff 72 10             	pushl  0x10(%edx)
80104bb0:	68 b1 79 10 80       	push   $0x801079b1
80104bb5:	e8 a6 ba ff ff       	call   80100660 <cprintf>
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
80104bba:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104bc0:	83 c4 10             	add    $0x10,%esp
80104bc3:	8b 40 18             	mov    0x18(%eax),%eax
80104bc6:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
}
80104bcd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104bd0:	c9                   	leave  
80104bd1:	c3                   	ret    
80104bd2:	66 90                	xchg   %ax,%ax
80104bd4:	66 90                	xchg   %ax,%ax
80104bd6:	66 90                	xchg   %ax,%ax
80104bd8:	66 90                	xchg   %ax,%ax
80104bda:	66 90                	xchg   %ax,%ax
80104bdc:	66 90                	xchg   %ax,%ax
80104bde:	66 90                	xchg   %ax,%ax

80104be0 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104be0:	55                   	push   %ebp
80104be1:	89 e5                	mov    %esp,%ebp
80104be3:	57                   	push   %edi
80104be4:	56                   	push   %esi
80104be5:	53                   	push   %ebx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104be6:	8d 75 da             	lea    -0x26(%ebp),%esi
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104be9:	83 ec 44             	sub    $0x44,%esp
80104bec:	89 4d c0             	mov    %ecx,-0x40(%ebp)
80104bef:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104bf2:	56                   	push   %esi
80104bf3:	50                   	push   %eax
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104bf4:	89 55 c4             	mov    %edx,-0x3c(%ebp)
80104bf7:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104bfa:	e8 b1 d2 ff ff       	call   80101eb0 <nameiparent>
80104bff:	83 c4 10             	add    $0x10,%esp
80104c02:	85 c0                	test   %eax,%eax
80104c04:	0f 84 f6 00 00 00    	je     80104d00 <create+0x120>
    return 0;
  ilock(dp);
80104c0a:	83 ec 0c             	sub    $0xc,%esp
80104c0d:	89 c7                	mov    %eax,%edi
80104c0f:	50                   	push   %eax
80104c10:	e8 4b ca ff ff       	call   80101660 <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
80104c15:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104c18:	83 c4 0c             	add    $0xc,%esp
80104c1b:	50                   	push   %eax
80104c1c:	56                   	push   %esi
80104c1d:	57                   	push   %edi
80104c1e:	e8 4d cf ff ff       	call   80101b70 <dirlookup>
80104c23:	83 c4 10             	add    $0x10,%esp
80104c26:	85 c0                	test   %eax,%eax
80104c28:	89 c3                	mov    %eax,%ebx
80104c2a:	74 54                	je     80104c80 <create+0xa0>
    iunlockput(dp);
80104c2c:	83 ec 0c             	sub    $0xc,%esp
80104c2f:	57                   	push   %edi
80104c30:	e8 9b cc ff ff       	call   801018d0 <iunlockput>
    ilock(ip);
80104c35:	89 1c 24             	mov    %ebx,(%esp)
80104c38:	e8 23 ca ff ff       	call   80101660 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80104c3d:	83 c4 10             	add    $0x10,%esp
80104c40:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104c45:	75 19                	jne    80104c60 <create+0x80>
80104c47:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
80104c4c:	89 d8                	mov    %ebx,%eax
80104c4e:	75 10                	jne    80104c60 <create+0x80>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104c50:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104c53:	5b                   	pop    %ebx
80104c54:	5e                   	pop    %esi
80104c55:	5f                   	pop    %edi
80104c56:	5d                   	pop    %ebp
80104c57:	c3                   	ret    
80104c58:	90                   	nop
80104c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if((ip = dirlookup(dp, name, &off)) != 0){
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
80104c60:	83 ec 0c             	sub    $0xc,%esp
80104c63:	53                   	push   %ebx
80104c64:	e8 67 cc ff ff       	call   801018d0 <iunlockput>
    return 0;
80104c69:	83 c4 10             	add    $0x10,%esp
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104c6c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
    return 0;
80104c6f:	31 c0                	xor    %eax,%eax
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104c71:	5b                   	pop    %ebx
80104c72:	5e                   	pop    %esi
80104c73:	5f                   	pop    %edi
80104c74:	5d                   	pop    %ebp
80104c75:	c3                   	ret    
80104c76:	8d 76 00             	lea    0x0(%esi),%esi
80104c79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      return ip;
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
80104c80:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104c84:	83 ec 08             	sub    $0x8,%esp
80104c87:	50                   	push   %eax
80104c88:	ff 37                	pushl  (%edi)
80104c8a:	e8 61 c8 ff ff       	call   801014f0 <ialloc>
80104c8f:	83 c4 10             	add    $0x10,%esp
80104c92:	85 c0                	test   %eax,%eax
80104c94:	89 c3                	mov    %eax,%ebx
80104c96:	0f 84 cc 00 00 00    	je     80104d68 <create+0x188>
    panic("create: ialloc");

  ilock(ip);
80104c9c:	83 ec 0c             	sub    $0xc,%esp
80104c9f:	50                   	push   %eax
80104ca0:	e8 bb c9 ff ff       	call   80101660 <ilock>
  ip->major = major;
80104ca5:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104ca9:	66 89 43 52          	mov    %ax,0x52(%ebx)
  ip->minor = minor;
80104cad:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104cb1:	66 89 43 54          	mov    %ax,0x54(%ebx)
  ip->nlink = 1;
80104cb5:	b8 01 00 00 00       	mov    $0x1,%eax
80104cba:	66 89 43 56          	mov    %ax,0x56(%ebx)
  iupdate(ip);
80104cbe:	89 1c 24             	mov    %ebx,(%esp)
80104cc1:	e8 ea c8 ff ff       	call   801015b0 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
80104cc6:	83 c4 10             	add    $0x10,%esp
80104cc9:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
80104cce:	74 40                	je     80104d10 <create+0x130>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
      panic("create dots");
  }

  if(dirlink(dp, name, ip->inum) < 0)
80104cd0:	83 ec 04             	sub    $0x4,%esp
80104cd3:	ff 73 04             	pushl  0x4(%ebx)
80104cd6:	56                   	push   %esi
80104cd7:	57                   	push   %edi
80104cd8:	e8 f3 d0 ff ff       	call   80101dd0 <dirlink>
80104cdd:	83 c4 10             	add    $0x10,%esp
80104ce0:	85 c0                	test   %eax,%eax
80104ce2:	78 77                	js     80104d5b <create+0x17b>
    panic("create: dirlink");

  iunlockput(dp);
80104ce4:	83 ec 0c             	sub    $0xc,%esp
80104ce7:	57                   	push   %edi
80104ce8:	e8 e3 cb ff ff       	call   801018d0 <iunlockput>

  return ip;
80104ced:	83 c4 10             	add    $0x10,%esp
}
80104cf0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
80104cf3:	89 d8                	mov    %ebx,%eax
}
80104cf5:	5b                   	pop    %ebx
80104cf6:	5e                   	pop    %esi
80104cf7:	5f                   	pop    %edi
80104cf8:	5d                   	pop    %ebp
80104cf9:	c3                   	ret    
80104cfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    return 0;
80104d00:	31 c0                	xor    %eax,%eax
80104d02:	e9 49 ff ff ff       	jmp    80104c50 <create+0x70>
80104d07:	89 f6                	mov    %esi,%esi
80104d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  ip->minor = minor;
  ip->nlink = 1;
  iupdate(ip);

  if(type == T_DIR){  // Create . and .. entries.
    dp->nlink++;  // for ".."
80104d10:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
    iupdate(dp);
80104d15:	83 ec 0c             	sub    $0xc,%esp
80104d18:	57                   	push   %edi
80104d19:	e8 92 c8 ff ff       	call   801015b0 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104d1e:	83 c4 0c             	add    $0xc,%esp
80104d21:	ff 73 04             	pushl  0x4(%ebx)
80104d24:	68 5c 7a 10 80       	push   $0x80107a5c
80104d29:	53                   	push   %ebx
80104d2a:	e8 a1 d0 ff ff       	call   80101dd0 <dirlink>
80104d2f:	83 c4 10             	add    $0x10,%esp
80104d32:	85 c0                	test   %eax,%eax
80104d34:	78 18                	js     80104d4e <create+0x16e>
80104d36:	83 ec 04             	sub    $0x4,%esp
80104d39:	ff 77 04             	pushl  0x4(%edi)
80104d3c:	68 5b 7a 10 80       	push   $0x80107a5b
80104d41:	53                   	push   %ebx
80104d42:	e8 89 d0 ff ff       	call   80101dd0 <dirlink>
80104d47:	83 c4 10             	add    $0x10,%esp
80104d4a:	85 c0                	test   %eax,%eax
80104d4c:	79 82                	jns    80104cd0 <create+0xf0>
      panic("create dots");
80104d4e:	83 ec 0c             	sub    $0xc,%esp
80104d51:	68 4f 7a 10 80       	push   $0x80107a4f
80104d56:	e8 15 b6 ff ff       	call   80100370 <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");
80104d5b:	83 ec 0c             	sub    $0xc,%esp
80104d5e:	68 5e 7a 10 80       	push   $0x80107a5e
80104d63:	e8 08 b6 ff ff       	call   80100370 <panic>
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    panic("create: ialloc");
80104d68:	83 ec 0c             	sub    $0xc,%esp
80104d6b:	68 40 7a 10 80       	push   $0x80107a40
80104d70:	e8 fb b5 ff ff       	call   80100370 <panic>
80104d75:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d80 <argfd.constprop.0>:
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104d80:	55                   	push   %ebp
80104d81:	89 e5                	mov    %esp,%ebp
80104d83:	56                   	push   %esi
80104d84:	53                   	push   %ebx
80104d85:	89 c6                	mov    %eax,%esi
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104d87:	8d 45 f4             	lea    -0xc(%ebp),%eax
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104d8a:	89 d3                	mov    %edx,%ebx
80104d8c:	83 ec 18             	sub    $0x18,%esp
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104d8f:	50                   	push   %eax
80104d90:	6a 00                	push   $0x0
80104d92:	e8 c9 fc ff ff       	call   80104a60 <argint>
80104d97:	83 c4 10             	add    $0x10,%esp
80104d9a:	85 c0                	test   %eax,%eax
80104d9c:	78 3a                	js     80104dd8 <argfd.constprop.0+0x58>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=proc->ofile[fd]) == 0)
80104d9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104da1:	83 f8 0f             	cmp    $0xf,%eax
80104da4:	77 32                	ja     80104dd8 <argfd.constprop.0+0x58>
80104da6:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104dad:	8b 54 82 28          	mov    0x28(%edx,%eax,4),%edx
80104db1:	85 d2                	test   %edx,%edx
80104db3:	74 23                	je     80104dd8 <argfd.constprop.0+0x58>
    return -1;
  if(pfd)
80104db5:	85 f6                	test   %esi,%esi
80104db7:	74 02                	je     80104dbb <argfd.constprop.0+0x3b>
    *pfd = fd;
80104db9:	89 06                	mov    %eax,(%esi)
  if(pf)
80104dbb:	85 db                	test   %ebx,%ebx
80104dbd:	74 11                	je     80104dd0 <argfd.constprop.0+0x50>
    *pf = f;
80104dbf:	89 13                	mov    %edx,(%ebx)
  return 0;
80104dc1:	31 c0                	xor    %eax,%eax
}
80104dc3:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104dc6:	5b                   	pop    %ebx
80104dc7:	5e                   	pop    %esi
80104dc8:	5d                   	pop    %ebp
80104dc9:	c3                   	ret    
80104dca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
80104dd0:	31 c0                	xor    %eax,%eax
80104dd2:	eb ef                	jmp    80104dc3 <argfd.constprop.0+0x43>
80104dd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    return -1;
80104dd8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ddd:	eb e4                	jmp    80104dc3 <argfd.constprop.0+0x43>
80104ddf:	90                   	nop

80104de0 <sys_dup>:
  return -1;
}

int
sys_dup(void)
{
80104de0:	55                   	push   %ebp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104de1:	31 c0                	xor    %eax,%eax
  return -1;
}

int
sys_dup(void)
{
80104de3:	89 e5                	mov    %esp,%ebp
80104de5:	53                   	push   %ebx
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104de6:	8d 55 f4             	lea    -0xc(%ebp),%edx
  return -1;
}

int
sys_dup(void)
{
80104de9:	83 ec 14             	sub    $0x14,%esp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104dec:	e8 8f ff ff ff       	call   80104d80 <argfd.constprop.0>
80104df1:	85 c0                	test   %eax,%eax
80104df3:	78 1b                	js     80104e10 <sys_dup+0x30>
    return -1;
  if((fd=fdalloc(f)) < 0)
80104df5:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104df8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80104dfe:	31 db                	xor    %ebx,%ebx
    if(proc->ofile[fd] == 0){
80104e00:	8b 4c 98 28          	mov    0x28(%eax,%ebx,4),%ecx
80104e04:	85 c9                	test   %ecx,%ecx
80104e06:	74 18                	je     80104e20 <sys_dup+0x40>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80104e08:	83 c3 01             	add    $0x1,%ebx
80104e0b:	83 fb 10             	cmp    $0x10,%ebx
80104e0e:	75 f0                	jne    80104e00 <sys_dup+0x20>
{
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
80104e10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
80104e15:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104e18:	c9                   	leave  
80104e19:	c3                   	ret    
80104e1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
80104e20:	83 ec 0c             	sub    $0xc,%esp
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80104e23:	89 54 98 28          	mov    %edx,0x28(%eax,%ebx,4)

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
80104e27:	52                   	push   %edx
80104e28:	e8 a3 bf ff ff       	call   80100dd0 <filedup>
  return fd;
80104e2d:	89 d8                	mov    %ebx,%eax
80104e2f:	83 c4 10             	add    $0x10,%esp
}
80104e32:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104e35:	c9                   	leave  
80104e36:	c3                   	ret    
80104e37:	89 f6                	mov    %esi,%esi
80104e39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e40 <sys_read>:

int
sys_read(void)
{
80104e40:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104e41:	31 c0                	xor    %eax,%eax
  return fd;
}

int
sys_read(void)
{
80104e43:	89 e5                	mov    %esp,%ebp
80104e45:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104e48:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104e4b:	e8 30 ff ff ff       	call   80104d80 <argfd.constprop.0>
80104e50:	85 c0                	test   %eax,%eax
80104e52:	78 4c                	js     80104ea0 <sys_read+0x60>
80104e54:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104e57:	83 ec 08             	sub    $0x8,%esp
80104e5a:	50                   	push   %eax
80104e5b:	6a 02                	push   $0x2
80104e5d:	e8 fe fb ff ff       	call   80104a60 <argint>
80104e62:	83 c4 10             	add    $0x10,%esp
80104e65:	85 c0                	test   %eax,%eax
80104e67:	78 37                	js     80104ea0 <sys_read+0x60>
80104e69:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104e6c:	83 ec 04             	sub    $0x4,%esp
80104e6f:	ff 75 f0             	pushl  -0x10(%ebp)
80104e72:	50                   	push   %eax
80104e73:	6a 01                	push   $0x1
80104e75:	e8 26 fc ff ff       	call   80104aa0 <argptr>
80104e7a:	83 c4 10             	add    $0x10,%esp
80104e7d:	85 c0                	test   %eax,%eax
80104e7f:	78 1f                	js     80104ea0 <sys_read+0x60>
    return -1;
  return fileread(f, p, n);
80104e81:	83 ec 04             	sub    $0x4,%esp
80104e84:	ff 75 f0             	pushl  -0x10(%ebp)
80104e87:	ff 75 f4             	pushl  -0xc(%ebp)
80104e8a:	ff 75 ec             	pushl  -0x14(%ebp)
80104e8d:	e8 ae c0 ff ff       	call   80100f40 <fileread>
80104e92:	83 c4 10             	add    $0x10,%esp
}
80104e95:	c9                   	leave  
80104e96:	c3                   	ret    
80104e97:	89 f6                	mov    %esi,%esi
80104e99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104ea0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fileread(f, p, n);
}
80104ea5:	c9                   	leave  
80104ea6:	c3                   	ret    
80104ea7:	89 f6                	mov    %esi,%esi
80104ea9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104eb0 <sys_write>:

int
sys_write(void)
{
80104eb0:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104eb1:	31 c0                	xor    %eax,%eax
  return fileread(f, p, n);
}

int
sys_write(void)
{
80104eb3:	89 e5                	mov    %esp,%ebp
80104eb5:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104eb8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104ebb:	e8 c0 fe ff ff       	call   80104d80 <argfd.constprop.0>
80104ec0:	85 c0                	test   %eax,%eax
80104ec2:	78 4c                	js     80104f10 <sys_write+0x60>
80104ec4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104ec7:	83 ec 08             	sub    $0x8,%esp
80104eca:	50                   	push   %eax
80104ecb:	6a 02                	push   $0x2
80104ecd:	e8 8e fb ff ff       	call   80104a60 <argint>
80104ed2:	83 c4 10             	add    $0x10,%esp
80104ed5:	85 c0                	test   %eax,%eax
80104ed7:	78 37                	js     80104f10 <sys_write+0x60>
80104ed9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104edc:	83 ec 04             	sub    $0x4,%esp
80104edf:	ff 75 f0             	pushl  -0x10(%ebp)
80104ee2:	50                   	push   %eax
80104ee3:	6a 01                	push   $0x1
80104ee5:	e8 b6 fb ff ff       	call   80104aa0 <argptr>
80104eea:	83 c4 10             	add    $0x10,%esp
80104eed:	85 c0                	test   %eax,%eax
80104eef:	78 1f                	js     80104f10 <sys_write+0x60>
    return -1;
  return filewrite(f, p, n);
80104ef1:	83 ec 04             	sub    $0x4,%esp
80104ef4:	ff 75 f0             	pushl  -0x10(%ebp)
80104ef7:	ff 75 f4             	pushl  -0xc(%ebp)
80104efa:	ff 75 ec             	pushl  -0x14(%ebp)
80104efd:	e8 ce c0 ff ff       	call   80100fd0 <filewrite>
80104f02:	83 c4 10             	add    $0x10,%esp
}
80104f05:	c9                   	leave  
80104f06:	c3                   	ret    
80104f07:	89 f6                	mov    %esi,%esi
80104f09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104f10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filewrite(f, p, n);
}
80104f15:	c9                   	leave  
80104f16:	c3                   	ret    
80104f17:	89 f6                	mov    %esi,%esi
80104f19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104f20 <sys_close>:

int
sys_close(void)
{
80104f20:	55                   	push   %ebp
80104f21:	89 e5                	mov    %esp,%ebp
80104f23:	83 ec 18             	sub    $0x18,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
80104f26:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104f29:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104f2c:	e8 4f fe ff ff       	call   80104d80 <argfd.constprop.0>
80104f31:	85 c0                	test   %eax,%eax
80104f33:	78 2b                	js     80104f60 <sys_close+0x40>
    return -1;
  proc->ofile[fd] = 0;
80104f35:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104f38:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  fileclose(f);
80104f3e:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
  proc->ofile[fd] = 0;
80104f41:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104f48:	00 
  fileclose(f);
80104f49:	ff 75 f4             	pushl  -0xc(%ebp)
80104f4c:	e8 cf be ff ff       	call   80100e20 <fileclose>
  return 0;
80104f51:	83 c4 10             	add    $0x10,%esp
80104f54:	31 c0                	xor    %eax,%eax
}
80104f56:	c9                   	leave  
80104f57:	c3                   	ret    
80104f58:	90                   	nop
80104f59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
80104f60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  proc->ofile[fd] = 0;
  fileclose(f);
  return 0;
}
80104f65:	c9                   	leave  
80104f66:	c3                   	ret    
80104f67:	89 f6                	mov    %esi,%esi
80104f69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104f70 <sys_fstat>:

int
sys_fstat(void)
{
80104f70:	55                   	push   %ebp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104f71:	31 c0                	xor    %eax,%eax
  return 0;
}

int
sys_fstat(void)
{
80104f73:	89 e5                	mov    %esp,%ebp
80104f75:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104f78:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104f7b:	e8 00 fe ff ff       	call   80104d80 <argfd.constprop.0>
80104f80:	85 c0                	test   %eax,%eax
80104f82:	78 2c                	js     80104fb0 <sys_fstat+0x40>
80104f84:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104f87:	83 ec 04             	sub    $0x4,%esp
80104f8a:	6a 14                	push   $0x14
80104f8c:	50                   	push   %eax
80104f8d:	6a 01                	push   $0x1
80104f8f:	e8 0c fb ff ff       	call   80104aa0 <argptr>
80104f94:	83 c4 10             	add    $0x10,%esp
80104f97:	85 c0                	test   %eax,%eax
80104f99:	78 15                	js     80104fb0 <sys_fstat+0x40>
    return -1;
  return filestat(f, st);
80104f9b:	83 ec 08             	sub    $0x8,%esp
80104f9e:	ff 75 f4             	pushl  -0xc(%ebp)
80104fa1:	ff 75 f0             	pushl  -0x10(%ebp)
80104fa4:	e8 47 bf ff ff       	call   80100ef0 <filestat>
80104fa9:	83 c4 10             	add    $0x10,%esp
}
80104fac:	c9                   	leave  
80104fad:	c3                   	ret    
80104fae:	66 90                	xchg   %ax,%ax
{
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
    return -1;
80104fb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filestat(f, st);
}
80104fb5:	c9                   	leave  
80104fb6:	c3                   	ret    
80104fb7:	89 f6                	mov    %esi,%esi
80104fb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104fc0 <sys_link>:

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104fc0:	55                   	push   %ebp
80104fc1:	89 e5                	mov    %esp,%ebp
80104fc3:	57                   	push   %edi
80104fc4:	56                   	push   %esi
80104fc5:	53                   	push   %ebx
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104fc6:	8d 45 d4             	lea    -0x2c(%ebp),%eax
}

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104fc9:	83 ec 34             	sub    $0x34,%esp
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104fcc:	50                   	push   %eax
80104fcd:	6a 00                	push   $0x0
80104fcf:	e8 1c fb ff ff       	call   80104af0 <argstr>
80104fd4:	83 c4 10             	add    $0x10,%esp
80104fd7:	85 c0                	test   %eax,%eax
80104fd9:	0f 88 fb 00 00 00    	js     801050da <sys_link+0x11a>
80104fdf:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104fe2:	83 ec 08             	sub    $0x8,%esp
80104fe5:	50                   	push   %eax
80104fe6:	6a 01                	push   $0x1
80104fe8:	e8 03 fb ff ff       	call   80104af0 <argstr>
80104fed:	83 c4 10             	add    $0x10,%esp
80104ff0:	85 c0                	test   %eax,%eax
80104ff2:	0f 88 e2 00 00 00    	js     801050da <sys_link+0x11a>
    return -1;

  begin_op();
80104ff8:	e8 93 db ff ff       	call   80102b90 <begin_op>
  if((ip = namei(old)) == 0){
80104ffd:	83 ec 0c             	sub    $0xc,%esp
80105000:	ff 75 d4             	pushl  -0x2c(%ebp)
80105003:	e8 88 ce ff ff       	call   80101e90 <namei>
80105008:	83 c4 10             	add    $0x10,%esp
8010500b:	85 c0                	test   %eax,%eax
8010500d:	89 c3                	mov    %eax,%ebx
8010500f:	0f 84 f3 00 00 00    	je     80105108 <sys_link+0x148>
    end_op();
    return -1;
  }

  ilock(ip);
80105015:	83 ec 0c             	sub    $0xc,%esp
80105018:	50                   	push   %eax
80105019:	e8 42 c6 ff ff       	call   80101660 <ilock>
  if(ip->type == T_DIR){
8010501e:	83 c4 10             	add    $0x10,%esp
80105021:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105026:	0f 84 c4 00 00 00    	je     801050f0 <sys_link+0x130>
    iunlockput(ip);
    end_op();
    return -1;
  }

  ip->nlink++;
8010502c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
80105031:	83 ec 0c             	sub    $0xc,%esp
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
80105034:	8d 7d da             	lea    -0x26(%ebp),%edi
    end_op();
    return -1;
  }

  ip->nlink++;
  iupdate(ip);
80105037:	53                   	push   %ebx
80105038:	e8 73 c5 ff ff       	call   801015b0 <iupdate>
  iunlock(ip);
8010503d:	89 1c 24             	mov    %ebx,(%esp)
80105040:	e8 fb c6 ff ff       	call   80101740 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
80105045:	58                   	pop    %eax
80105046:	5a                   	pop    %edx
80105047:	57                   	push   %edi
80105048:	ff 75 d0             	pushl  -0x30(%ebp)
8010504b:	e8 60 ce ff ff       	call   80101eb0 <nameiparent>
80105050:	83 c4 10             	add    $0x10,%esp
80105053:	85 c0                	test   %eax,%eax
80105055:	89 c6                	mov    %eax,%esi
80105057:	74 5b                	je     801050b4 <sys_link+0xf4>
    goto bad;
  ilock(dp);
80105059:	83 ec 0c             	sub    $0xc,%esp
8010505c:	50                   	push   %eax
8010505d:	e8 fe c5 ff ff       	call   80101660 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80105062:	83 c4 10             	add    $0x10,%esp
80105065:	8b 03                	mov    (%ebx),%eax
80105067:	39 06                	cmp    %eax,(%esi)
80105069:	75 3d                	jne    801050a8 <sys_link+0xe8>
8010506b:	83 ec 04             	sub    $0x4,%esp
8010506e:	ff 73 04             	pushl  0x4(%ebx)
80105071:	57                   	push   %edi
80105072:	56                   	push   %esi
80105073:	e8 58 cd ff ff       	call   80101dd0 <dirlink>
80105078:	83 c4 10             	add    $0x10,%esp
8010507b:	85 c0                	test   %eax,%eax
8010507d:	78 29                	js     801050a8 <sys_link+0xe8>
    iunlockput(dp);
    goto bad;
  }
  iunlockput(dp);
8010507f:	83 ec 0c             	sub    $0xc,%esp
80105082:	56                   	push   %esi
80105083:	e8 48 c8 ff ff       	call   801018d0 <iunlockput>
  iput(ip);
80105088:	89 1c 24             	mov    %ebx,(%esp)
8010508b:	e8 00 c7 ff ff       	call   80101790 <iput>

  end_op();
80105090:	e8 6b db ff ff       	call   80102c00 <end_op>

  return 0;
80105095:	83 c4 10             	add    $0x10,%esp
80105098:	31 c0                	xor    %eax,%eax
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
}
8010509a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010509d:	5b                   	pop    %ebx
8010509e:	5e                   	pop    %esi
8010509f:	5f                   	pop    %edi
801050a0:	5d                   	pop    %ebp
801050a1:	c3                   	ret    
801050a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
  ilock(dp);
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    iunlockput(dp);
801050a8:	83 ec 0c             	sub    $0xc,%esp
801050ab:	56                   	push   %esi
801050ac:	e8 1f c8 ff ff       	call   801018d0 <iunlockput>
    goto bad;
801050b1:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  ilock(ip);
801050b4:	83 ec 0c             	sub    $0xc,%esp
801050b7:	53                   	push   %ebx
801050b8:	e8 a3 c5 ff ff       	call   80101660 <ilock>
  ip->nlink--;
801050bd:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
801050c2:	89 1c 24             	mov    %ebx,(%esp)
801050c5:	e8 e6 c4 ff ff       	call   801015b0 <iupdate>
  iunlockput(ip);
801050ca:	89 1c 24             	mov    %ebx,(%esp)
801050cd:	e8 fe c7 ff ff       	call   801018d0 <iunlockput>
  end_op();
801050d2:	e8 29 db ff ff       	call   80102c00 <end_op>
  return -1;
801050d7:	83 c4 10             	add    $0x10,%esp
}
801050da:	8d 65 f4             	lea    -0xc(%ebp),%esp
  ilock(ip);
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
801050dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801050e2:	5b                   	pop    %ebx
801050e3:	5e                   	pop    %esi
801050e4:	5f                   	pop    %edi
801050e5:	5d                   	pop    %ebp
801050e6:	c3                   	ret    
801050e7:	89 f6                	mov    %esi,%esi
801050e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
  }

  ilock(ip);
  if(ip->type == T_DIR){
    iunlockput(ip);
801050f0:	83 ec 0c             	sub    $0xc,%esp
801050f3:	53                   	push   %ebx
801050f4:	e8 d7 c7 ff ff       	call   801018d0 <iunlockput>
    end_op();
801050f9:	e8 02 db ff ff       	call   80102c00 <end_op>
    return -1;
801050fe:	83 c4 10             	add    $0x10,%esp
80105101:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105106:	eb 92                	jmp    8010509a <sys_link+0xda>
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
    return -1;

  begin_op();
  if((ip = namei(old)) == 0){
    end_op();
80105108:	e8 f3 da ff ff       	call   80102c00 <end_op>
    return -1;
8010510d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105112:	eb 86                	jmp    8010509a <sys_link+0xda>
80105114:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010511a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105120 <sys_unlink>:
}

//PAGEBREAK!
int
sys_unlink(void)
{
80105120:	55                   	push   %ebp
80105121:	89 e5                	mov    %esp,%ebp
80105123:	57                   	push   %edi
80105124:	56                   	push   %esi
80105125:	53                   	push   %ebx
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80105126:	8d 45 c0             	lea    -0x40(%ebp),%eax
}

//PAGEBREAK!
int
sys_unlink(void)
{
80105129:	83 ec 54             	sub    $0x54,%esp
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
8010512c:	50                   	push   %eax
8010512d:	6a 00                	push   $0x0
8010512f:	e8 bc f9 ff ff       	call   80104af0 <argstr>
80105134:	83 c4 10             	add    $0x10,%esp
80105137:	85 c0                	test   %eax,%eax
80105139:	0f 88 82 01 00 00    	js     801052c1 <sys_unlink+0x1a1>
    return -1;

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
8010513f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
  uint off;

  if(argstr(0, &path) < 0)
    return -1;

  begin_op();
80105142:	e8 49 da ff ff       	call   80102b90 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80105147:	83 ec 08             	sub    $0x8,%esp
8010514a:	53                   	push   %ebx
8010514b:	ff 75 c0             	pushl  -0x40(%ebp)
8010514e:	e8 5d cd ff ff       	call   80101eb0 <nameiparent>
80105153:	83 c4 10             	add    $0x10,%esp
80105156:	85 c0                	test   %eax,%eax
80105158:	89 45 b4             	mov    %eax,-0x4c(%ebp)
8010515b:	0f 84 6a 01 00 00    	je     801052cb <sys_unlink+0x1ab>
    end_op();
    return -1;
  }

  ilock(dp);
80105161:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80105164:	83 ec 0c             	sub    $0xc,%esp
80105167:	56                   	push   %esi
80105168:	e8 f3 c4 ff ff       	call   80101660 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
8010516d:	58                   	pop    %eax
8010516e:	5a                   	pop    %edx
8010516f:	68 5c 7a 10 80       	push   $0x80107a5c
80105174:	53                   	push   %ebx
80105175:	e8 d6 c9 ff ff       	call   80101b50 <namecmp>
8010517a:	83 c4 10             	add    $0x10,%esp
8010517d:	85 c0                	test   %eax,%eax
8010517f:	0f 84 fc 00 00 00    	je     80105281 <sys_unlink+0x161>
80105185:	83 ec 08             	sub    $0x8,%esp
80105188:	68 5b 7a 10 80       	push   $0x80107a5b
8010518d:	53                   	push   %ebx
8010518e:	e8 bd c9 ff ff       	call   80101b50 <namecmp>
80105193:	83 c4 10             	add    $0x10,%esp
80105196:	85 c0                	test   %eax,%eax
80105198:	0f 84 e3 00 00 00    	je     80105281 <sys_unlink+0x161>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
8010519e:	8d 45 c4             	lea    -0x3c(%ebp),%eax
801051a1:	83 ec 04             	sub    $0x4,%esp
801051a4:	50                   	push   %eax
801051a5:	53                   	push   %ebx
801051a6:	56                   	push   %esi
801051a7:	e8 c4 c9 ff ff       	call   80101b70 <dirlookup>
801051ac:	83 c4 10             	add    $0x10,%esp
801051af:	85 c0                	test   %eax,%eax
801051b1:	89 c3                	mov    %eax,%ebx
801051b3:	0f 84 c8 00 00 00    	je     80105281 <sys_unlink+0x161>
    goto bad;
  ilock(ip);
801051b9:	83 ec 0c             	sub    $0xc,%esp
801051bc:	50                   	push   %eax
801051bd:	e8 9e c4 ff ff       	call   80101660 <ilock>

  if(ip->nlink < 1)
801051c2:	83 c4 10             	add    $0x10,%esp
801051c5:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801051ca:	0f 8e 24 01 00 00    	jle    801052f4 <sys_unlink+0x1d4>
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
801051d0:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801051d5:	8d 75 d8             	lea    -0x28(%ebp),%esi
801051d8:	74 66                	je     80105240 <sys_unlink+0x120>
    iunlockput(ip);
    goto bad;
  }

  memset(&de, 0, sizeof(de));
801051da:	83 ec 04             	sub    $0x4,%esp
801051dd:	6a 10                	push   $0x10
801051df:	6a 00                	push   $0x0
801051e1:	56                   	push   %esi
801051e2:	e8 89 f5 ff ff       	call   80104770 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
801051e7:	6a 10                	push   $0x10
801051e9:	ff 75 c4             	pushl  -0x3c(%ebp)
801051ec:	56                   	push   %esi
801051ed:	ff 75 b4             	pushl  -0x4c(%ebp)
801051f0:	e8 2b c8 ff ff       	call   80101a20 <writei>
801051f5:	83 c4 20             	add    $0x20,%esp
801051f8:	83 f8 10             	cmp    $0x10,%eax
801051fb:	0f 85 e6 00 00 00    	jne    801052e7 <sys_unlink+0x1c7>
    panic("unlink: writei");
  if(ip->type == T_DIR){
80105201:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105206:	0f 84 9c 00 00 00    	je     801052a8 <sys_unlink+0x188>
    dp->nlink--;
    iupdate(dp);
  }
  iunlockput(dp);
8010520c:	83 ec 0c             	sub    $0xc,%esp
8010520f:	ff 75 b4             	pushl  -0x4c(%ebp)
80105212:	e8 b9 c6 ff ff       	call   801018d0 <iunlockput>

  ip->nlink--;
80105217:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
8010521c:	89 1c 24             	mov    %ebx,(%esp)
8010521f:	e8 8c c3 ff ff       	call   801015b0 <iupdate>
  iunlockput(ip);
80105224:	89 1c 24             	mov    %ebx,(%esp)
80105227:	e8 a4 c6 ff ff       	call   801018d0 <iunlockput>

  end_op();
8010522c:	e8 cf d9 ff ff       	call   80102c00 <end_op>

  return 0;
80105231:	83 c4 10             	add    $0x10,%esp
80105234:	31 c0                	xor    %eax,%eax

bad:
  iunlockput(dp);
  end_op();
  return -1;
}
80105236:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105239:	5b                   	pop    %ebx
8010523a:	5e                   	pop    %esi
8010523b:	5f                   	pop    %edi
8010523c:	5d                   	pop    %ebp
8010523d:	c3                   	ret    
8010523e:	66 90                	xchg   %ax,%ax
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80105240:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80105244:	76 94                	jbe    801051da <sys_unlink+0xba>
80105246:	bf 20 00 00 00       	mov    $0x20,%edi
8010524b:	eb 0f                	jmp    8010525c <sys_unlink+0x13c>
8010524d:	8d 76 00             	lea    0x0(%esi),%esi
80105250:	83 c7 10             	add    $0x10,%edi
80105253:	3b 7b 58             	cmp    0x58(%ebx),%edi
80105256:	0f 83 7e ff ff ff    	jae    801051da <sys_unlink+0xba>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
8010525c:	6a 10                	push   $0x10
8010525e:	57                   	push   %edi
8010525f:	56                   	push   %esi
80105260:	53                   	push   %ebx
80105261:	e8 ba c6 ff ff       	call   80101920 <readi>
80105266:	83 c4 10             	add    $0x10,%esp
80105269:	83 f8 10             	cmp    $0x10,%eax
8010526c:	75 6c                	jne    801052da <sys_unlink+0x1ba>
      panic("isdirempty: readi");
    if(de.inum != 0)
8010526e:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105273:	74 db                	je     80105250 <sys_unlink+0x130>
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
    iunlockput(ip);
80105275:	83 ec 0c             	sub    $0xc,%esp
80105278:	53                   	push   %ebx
80105279:	e8 52 c6 ff ff       	call   801018d0 <iunlockput>
    goto bad;
8010527e:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  iunlockput(dp);
80105281:	83 ec 0c             	sub    $0xc,%esp
80105284:	ff 75 b4             	pushl  -0x4c(%ebp)
80105287:	e8 44 c6 ff ff       	call   801018d0 <iunlockput>
  end_op();
8010528c:	e8 6f d9 ff ff       	call   80102c00 <end_op>
  return -1;
80105291:	83 c4 10             	add    $0x10,%esp
}
80105294:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;

bad:
  iunlockput(dp);
  end_op();
  return -1;
80105297:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010529c:	5b                   	pop    %ebx
8010529d:	5e                   	pop    %esi
8010529e:	5f                   	pop    %edi
8010529f:	5d                   	pop    %ebp
801052a0:	c3                   	ret    
801052a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
801052a8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    iupdate(dp);
801052ab:	83 ec 0c             	sub    $0xc,%esp

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
801052ae:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
801052b3:	50                   	push   %eax
801052b4:	e8 f7 c2 ff ff       	call   801015b0 <iupdate>
801052b9:	83 c4 10             	add    $0x10,%esp
801052bc:	e9 4b ff ff ff       	jmp    8010520c <sys_unlink+0xec>
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
    return -1;
801052c1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801052c6:	e9 6b ff ff ff       	jmp    80105236 <sys_unlink+0x116>

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
    end_op();
801052cb:	e8 30 d9 ff ff       	call   80102c00 <end_op>
    return -1;
801052d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801052d5:	e9 5c ff ff ff       	jmp    80105236 <sys_unlink+0x116>
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
801052da:	83 ec 0c             	sub    $0xc,%esp
801052dd:	68 80 7a 10 80       	push   $0x80107a80
801052e2:	e8 89 b0 ff ff       	call   80100370 <panic>
    goto bad;
  }

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
801052e7:	83 ec 0c             	sub    $0xc,%esp
801052ea:	68 92 7a 10 80       	push   $0x80107a92
801052ef:	e8 7c b0 ff ff       	call   80100370 <panic>
  if((ip = dirlookup(dp, name, &off)) == 0)
    goto bad;
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
801052f4:	83 ec 0c             	sub    $0xc,%esp
801052f7:	68 6e 7a 10 80       	push   $0x80107a6e
801052fc:	e8 6f b0 ff ff       	call   80100370 <panic>
80105301:	eb 0d                	jmp    80105310 <sys_open>
80105303:	90                   	nop
80105304:	90                   	nop
80105305:	90                   	nop
80105306:	90                   	nop
80105307:	90                   	nop
80105308:	90                   	nop
80105309:	90                   	nop
8010530a:	90                   	nop
8010530b:	90                   	nop
8010530c:	90                   	nop
8010530d:	90                   	nop
8010530e:	90                   	nop
8010530f:	90                   	nop

80105310 <sys_open>:
  return ip;
}

int
sys_open(void)
{
80105310:	55                   	push   %ebp
80105311:	89 e5                	mov    %esp,%ebp
80105313:	57                   	push   %edi
80105314:	56                   	push   %esi
80105315:	53                   	push   %ebx
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80105316:	8d 45 e0             	lea    -0x20(%ebp),%eax
  return ip;
}

int
sys_open(void)
{
80105319:	83 ec 24             	sub    $0x24,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
8010531c:	50                   	push   %eax
8010531d:	6a 00                	push   $0x0
8010531f:	e8 cc f7 ff ff       	call   80104af0 <argstr>
80105324:	83 c4 10             	add    $0x10,%esp
80105327:	85 c0                	test   %eax,%eax
80105329:	0f 88 9e 00 00 00    	js     801053cd <sys_open+0xbd>
8010532f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105332:	83 ec 08             	sub    $0x8,%esp
80105335:	50                   	push   %eax
80105336:	6a 01                	push   $0x1
80105338:	e8 23 f7 ff ff       	call   80104a60 <argint>
8010533d:	83 c4 10             	add    $0x10,%esp
80105340:	85 c0                	test   %eax,%eax
80105342:	0f 88 85 00 00 00    	js     801053cd <sys_open+0xbd>
    return -1;

  begin_op();
80105348:	e8 43 d8 ff ff       	call   80102b90 <begin_op>

  if(omode & O_CREATE){
8010534d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105351:	0f 85 89 00 00 00    	jne    801053e0 <sys_open+0xd0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
80105357:	83 ec 0c             	sub    $0xc,%esp
8010535a:	ff 75 e0             	pushl  -0x20(%ebp)
8010535d:	e8 2e cb ff ff       	call   80101e90 <namei>
80105362:	83 c4 10             	add    $0x10,%esp
80105365:	85 c0                	test   %eax,%eax
80105367:	89 c7                	mov    %eax,%edi
80105369:	0f 84 8e 00 00 00    	je     801053fd <sys_open+0xed>
      end_op();
      return -1;
    }
    ilock(ip);
8010536f:	83 ec 0c             	sub    $0xc,%esp
80105372:	50                   	push   %eax
80105373:	e8 e8 c2 ff ff       	call   80101660 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80105378:	83 c4 10             	add    $0x10,%esp
8010537b:	66 83 7f 50 01       	cmpw   $0x1,0x50(%edi)
80105380:	0f 84 d2 00 00 00    	je     80105458 <sys_open+0x148>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80105386:	e8 d5 b9 ff ff       	call   80100d60 <filealloc>
8010538b:	85 c0                	test   %eax,%eax
8010538d:	89 c6                	mov    %eax,%esi
8010538f:	74 2b                	je     801053bc <sys_open+0xac>
80105391:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80105398:	31 db                	xor    %ebx,%ebx
8010539a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
801053a0:	8b 44 9a 28          	mov    0x28(%edx,%ebx,4),%eax
801053a4:	85 c0                	test   %eax,%eax
801053a6:	74 68                	je     80105410 <sys_open+0x100>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
801053a8:	83 c3 01             	add    $0x1,%ebx
801053ab:	83 fb 10             	cmp    $0x10,%ebx
801053ae:	75 f0                	jne    801053a0 <sys_open+0x90>
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
801053b0:	83 ec 0c             	sub    $0xc,%esp
801053b3:	56                   	push   %esi
801053b4:	e8 67 ba ff ff       	call   80100e20 <fileclose>
801053b9:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
801053bc:	83 ec 0c             	sub    $0xc,%esp
801053bf:	57                   	push   %edi
801053c0:	e8 0b c5 ff ff       	call   801018d0 <iunlockput>
    end_op();
801053c5:	e8 36 d8 ff ff       	call   80102c00 <end_op>
    return -1;
801053ca:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
801053cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
801053d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
801053d5:	5b                   	pop    %ebx
801053d6:	5e                   	pop    %esi
801053d7:	5f                   	pop    %edi
801053d8:	5d                   	pop    %ebp
801053d9:	c3                   	ret    
801053da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
801053e0:	83 ec 0c             	sub    $0xc,%esp
801053e3:	8b 45 e0             	mov    -0x20(%ebp),%eax
801053e6:	31 c9                	xor    %ecx,%ecx
801053e8:	6a 00                	push   $0x0
801053ea:	ba 02 00 00 00       	mov    $0x2,%edx
801053ef:	e8 ec f7 ff ff       	call   80104be0 <create>
    if(ip == 0){
801053f4:	83 c4 10             	add    $0x10,%esp
801053f7:	85 c0                	test   %eax,%eax
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
801053f9:	89 c7                	mov    %eax,%edi
    if(ip == 0){
801053fb:	75 89                	jne    80105386 <sys_open+0x76>
      end_op();
801053fd:	e8 fe d7 ff ff       	call   80102c00 <end_op>
      return -1;
80105402:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105407:	eb 43                	jmp    8010544c <sys_open+0x13c>
80105409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105410:	83 ec 0c             	sub    $0xc,%esp
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80105413:	89 74 9a 28          	mov    %esi,0x28(%edx,%ebx,4)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105417:	57                   	push   %edi
80105418:	e8 23 c3 ff ff       	call   80101740 <iunlock>
  end_op();
8010541d:	e8 de d7 ff ff       	call   80102c00 <end_op>

  f->type = FD_INODE;
80105422:	c7 06 02 00 00 00    	movl   $0x2,(%esi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80105428:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
8010542b:	83 c4 10             	add    $0x10,%esp
  }
  iunlock(ip);
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
8010542e:	89 7e 10             	mov    %edi,0x10(%esi)
  f->off = 0;
80105431:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
  f->readable = !(omode & O_WRONLY);
80105438:	89 d0                	mov    %edx,%eax
8010543a:	83 e0 01             	and    $0x1,%eax
8010543d:	83 f0 01             	xor    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105440:	83 e2 03             	and    $0x3,%edx
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80105443:	88 46 08             	mov    %al,0x8(%esi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105446:	0f 95 46 09          	setne  0x9(%esi)
  return fd;
8010544a:	89 d8                	mov    %ebx,%eax
}
8010544c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010544f:	5b                   	pop    %ebx
80105450:	5e                   	pop    %esi
80105451:	5f                   	pop    %edi
80105452:	5d                   	pop    %ebp
80105453:	c3                   	ret    
80105454:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((ip = namei(path)) == 0){
      end_op();
      return -1;
    }
    ilock(ip);
    if(ip->type == T_DIR && omode != O_RDONLY){
80105458:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010545b:	85 d2                	test   %edx,%edx
8010545d:	0f 84 23 ff ff ff    	je     80105386 <sys_open+0x76>
80105463:	e9 54 ff ff ff       	jmp    801053bc <sys_open+0xac>
80105468:	90                   	nop
80105469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105470 <sys_mkdir>:
  return fd;
}

int
sys_mkdir(void)
{
80105470:	55                   	push   %ebp
80105471:	89 e5                	mov    %esp,%ebp
80105473:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105476:	e8 15 d7 ff ff       	call   80102b90 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
8010547b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010547e:	83 ec 08             	sub    $0x8,%esp
80105481:	50                   	push   %eax
80105482:	6a 00                	push   $0x0
80105484:	e8 67 f6 ff ff       	call   80104af0 <argstr>
80105489:	83 c4 10             	add    $0x10,%esp
8010548c:	85 c0                	test   %eax,%eax
8010548e:	78 30                	js     801054c0 <sys_mkdir+0x50>
80105490:	83 ec 0c             	sub    $0xc,%esp
80105493:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105496:	31 c9                	xor    %ecx,%ecx
80105498:	6a 00                	push   $0x0
8010549a:	ba 01 00 00 00       	mov    $0x1,%edx
8010549f:	e8 3c f7 ff ff       	call   80104be0 <create>
801054a4:	83 c4 10             	add    $0x10,%esp
801054a7:	85 c0                	test   %eax,%eax
801054a9:	74 15                	je     801054c0 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
801054ab:	83 ec 0c             	sub    $0xc,%esp
801054ae:	50                   	push   %eax
801054af:	e8 1c c4 ff ff       	call   801018d0 <iunlockput>
  end_op();
801054b4:	e8 47 d7 ff ff       	call   80102c00 <end_op>
  return 0;
801054b9:	83 c4 10             	add    $0x10,%esp
801054bc:	31 c0                	xor    %eax,%eax
}
801054be:	c9                   	leave  
801054bf:	c3                   	ret    
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    end_op();
801054c0:	e8 3b d7 ff ff       	call   80102c00 <end_op>
    return -1;
801054c5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
801054ca:	c9                   	leave  
801054cb:	c3                   	ret    
801054cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801054d0 <sys_mknod>:

int
sys_mknod(void)
{
801054d0:	55                   	push   %ebp
801054d1:	89 e5                	mov    %esp,%ebp
801054d3:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
801054d6:	e8 b5 d6 ff ff       	call   80102b90 <begin_op>
  if((argstr(0, &path)) < 0 ||
801054db:	8d 45 ec             	lea    -0x14(%ebp),%eax
801054de:	83 ec 08             	sub    $0x8,%esp
801054e1:	50                   	push   %eax
801054e2:	6a 00                	push   $0x0
801054e4:	e8 07 f6 ff ff       	call   80104af0 <argstr>
801054e9:	83 c4 10             	add    $0x10,%esp
801054ec:	85 c0                	test   %eax,%eax
801054ee:	78 60                	js     80105550 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
801054f0:	8d 45 f0             	lea    -0x10(%ebp),%eax
801054f3:	83 ec 08             	sub    $0x8,%esp
801054f6:	50                   	push   %eax
801054f7:	6a 01                	push   $0x1
801054f9:	e8 62 f5 ff ff       	call   80104a60 <argint>
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
801054fe:	83 c4 10             	add    $0x10,%esp
80105501:	85 c0                	test   %eax,%eax
80105503:	78 4b                	js     80105550 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
80105505:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105508:	83 ec 08             	sub    $0x8,%esp
8010550b:	50                   	push   %eax
8010550c:	6a 02                	push   $0x2
8010550e:	e8 4d f5 ff ff       	call   80104a60 <argint>
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
80105513:	83 c4 10             	add    $0x10,%esp
80105516:	85 c0                	test   %eax,%eax
80105518:	78 36                	js     80105550 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
8010551a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
8010551e:	83 ec 0c             	sub    $0xc,%esp
80105521:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80105525:	ba 03 00 00 00       	mov    $0x3,%edx
8010552a:	50                   	push   %eax
8010552b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010552e:	e8 ad f6 ff ff       	call   80104be0 <create>
80105533:	83 c4 10             	add    $0x10,%esp
80105536:	85 c0                	test   %eax,%eax
80105538:	74 16                	je     80105550 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
    return -1;
  }
  iunlockput(ip);
8010553a:	83 ec 0c             	sub    $0xc,%esp
8010553d:	50                   	push   %eax
8010553e:	e8 8d c3 ff ff       	call   801018d0 <iunlockput>
  end_op();
80105543:	e8 b8 d6 ff ff       	call   80102c00 <end_op>
  return 0;
80105548:	83 c4 10             	add    $0x10,%esp
8010554b:	31 c0                	xor    %eax,%eax
}
8010554d:	c9                   	leave  
8010554e:	c3                   	ret    
8010554f:	90                   	nop
  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
80105550:	e8 ab d6 ff ff       	call   80102c00 <end_op>
    return -1;
80105555:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010555a:	c9                   	leave  
8010555b:	c3                   	ret    
8010555c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105560 <sys_chdir>:

int
sys_chdir(void)
{
80105560:	55                   	push   %ebp
80105561:	89 e5                	mov    %esp,%ebp
80105563:	53                   	push   %ebx
80105564:	83 ec 14             	sub    $0x14,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105567:	e8 24 d6 ff ff       	call   80102b90 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
8010556c:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010556f:	83 ec 08             	sub    $0x8,%esp
80105572:	50                   	push   %eax
80105573:	6a 00                	push   $0x0
80105575:	e8 76 f5 ff ff       	call   80104af0 <argstr>
8010557a:	83 c4 10             	add    $0x10,%esp
8010557d:	85 c0                	test   %eax,%eax
8010557f:	78 7f                	js     80105600 <sys_chdir+0xa0>
80105581:	83 ec 0c             	sub    $0xc,%esp
80105584:	ff 75 f4             	pushl  -0xc(%ebp)
80105587:	e8 04 c9 ff ff       	call   80101e90 <namei>
8010558c:	83 c4 10             	add    $0x10,%esp
8010558f:	85 c0                	test   %eax,%eax
80105591:	89 c3                	mov    %eax,%ebx
80105593:	74 6b                	je     80105600 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
80105595:	83 ec 0c             	sub    $0xc,%esp
80105598:	50                   	push   %eax
80105599:	e8 c2 c0 ff ff       	call   80101660 <ilock>
  if(ip->type != T_DIR){
8010559e:	83 c4 10             	add    $0x10,%esp
801055a1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801055a6:	75 38                	jne    801055e0 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801055a8:	83 ec 0c             	sub    $0xc,%esp
801055ab:	53                   	push   %ebx
801055ac:	e8 8f c1 ff ff       	call   80101740 <iunlock>
  iput(proc->cwd);
801055b1:	58                   	pop    %eax
801055b2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801055b8:	ff 70 68             	pushl  0x68(%eax)
801055bb:	e8 d0 c1 ff ff       	call   80101790 <iput>
  end_op();
801055c0:	e8 3b d6 ff ff       	call   80102c00 <end_op>
  proc->cwd = ip;
801055c5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  return 0;
801055cb:	83 c4 10             	add    $0x10,%esp
    return -1;
  }
  iunlock(ip);
  iput(proc->cwd);
  end_op();
  proc->cwd = ip;
801055ce:	89 58 68             	mov    %ebx,0x68(%eax)
  return 0;
801055d1:	31 c0                	xor    %eax,%eax
}
801055d3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801055d6:	c9                   	leave  
801055d7:	c3                   	ret    
801055d8:	90                   	nop
801055d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    end_op();
    return -1;
  }
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
801055e0:	83 ec 0c             	sub    $0xc,%esp
801055e3:	53                   	push   %ebx
801055e4:	e8 e7 c2 ff ff       	call   801018d0 <iunlockput>
    end_op();
801055e9:	e8 12 d6 ff ff       	call   80102c00 <end_op>
    return -1;
801055ee:	83 c4 10             	add    $0x10,%esp
801055f1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055f6:	eb db                	jmp    801055d3 <sys_chdir+0x73>
801055f8:	90                   	nop
801055f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
    end_op();
80105600:	e8 fb d5 ff ff       	call   80102c00 <end_op>
    return -1;
80105605:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010560a:	eb c7                	jmp    801055d3 <sys_chdir+0x73>
8010560c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105610 <sys_exec>:
  return 0;
}

int
sys_exec(void)
{
80105610:	55                   	push   %ebp
80105611:	89 e5                	mov    %esp,%ebp
80105613:	57                   	push   %edi
80105614:	56                   	push   %esi
80105615:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105616:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
  return 0;
}

int
sys_exec(void)
{
8010561c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105622:	50                   	push   %eax
80105623:	6a 00                	push   $0x0
80105625:	e8 c6 f4 ff ff       	call   80104af0 <argstr>
8010562a:	83 c4 10             	add    $0x10,%esp
8010562d:	85 c0                	test   %eax,%eax
8010562f:	78 7f                	js     801056b0 <sys_exec+0xa0>
80105631:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80105637:	83 ec 08             	sub    $0x8,%esp
8010563a:	50                   	push   %eax
8010563b:	6a 01                	push   $0x1
8010563d:	e8 1e f4 ff ff       	call   80104a60 <argint>
80105642:	83 c4 10             	add    $0x10,%esp
80105645:	85 c0                	test   %eax,%eax
80105647:	78 67                	js     801056b0 <sys_exec+0xa0>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
80105649:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
8010564f:	83 ec 04             	sub    $0x4,%esp
80105652:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
80105658:	68 80 00 00 00       	push   $0x80
8010565d:	6a 00                	push   $0x0
8010565f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105665:	50                   	push   %eax
80105666:	31 db                	xor    %ebx,%ebx
80105668:	e8 03 f1 ff ff       	call   80104770 <memset>
8010566d:	83 c4 10             	add    $0x10,%esp
  for(i=0;; i++){
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80105670:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105676:	83 ec 08             	sub    $0x8,%esp
80105679:	57                   	push   %edi
8010567a:	8d 04 98             	lea    (%eax,%ebx,4),%eax
8010567d:	50                   	push   %eax
8010567e:	e8 5d f3 ff ff       	call   801049e0 <fetchint>
80105683:	83 c4 10             	add    $0x10,%esp
80105686:	85 c0                	test   %eax,%eax
80105688:	78 26                	js     801056b0 <sys_exec+0xa0>
      return -1;
    if(uarg == 0){
8010568a:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105690:	85 c0                	test   %eax,%eax
80105692:	74 2c                	je     801056c0 <sys_exec+0xb0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
80105694:	83 ec 08             	sub    $0x8,%esp
80105697:	56                   	push   %esi
80105698:	50                   	push   %eax
80105699:	e8 72 f3 ff ff       	call   80104a10 <fetchstr>
8010569e:	83 c4 10             	add    $0x10,%esp
801056a1:	85 c0                	test   %eax,%eax
801056a3:	78 0b                	js     801056b0 <sys_exec+0xa0>

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
801056a5:	83 c3 01             	add    $0x1,%ebx
801056a8:	83 c6 04             	add    $0x4,%esi
    if(i >= NELEM(argv))
801056ab:	83 fb 20             	cmp    $0x20,%ebx
801056ae:	75 c0                	jne    80105670 <sys_exec+0x60>
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
801056b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
801056b3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
801056b8:	5b                   	pop    %ebx
801056b9:	5e                   	pop    %esi
801056ba:	5f                   	pop    %edi
801056bb:	5d                   	pop    %ebp
801056bc:	c3                   	ret    
801056bd:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
801056c0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801056c6:	83 ec 08             	sub    $0x8,%esp
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
      argv[i] = 0;
801056c9:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
801056d0:	00 00 00 00 
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
801056d4:	50                   	push   %eax
801056d5:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
801056db:	e8 10 b3 ff ff       	call   801009f0 <exec>
801056e0:	83 c4 10             	add    $0x10,%esp
}
801056e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801056e6:	5b                   	pop    %ebx
801056e7:	5e                   	pop    %esi
801056e8:	5f                   	pop    %edi
801056e9:	5d                   	pop    %ebp
801056ea:	c3                   	ret    
801056eb:	90                   	nop
801056ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801056f0 <sys_pipe>:

int
sys_pipe(void)
{
801056f0:	55                   	push   %ebp
801056f1:	89 e5                	mov    %esp,%ebp
801056f3:	57                   	push   %edi
801056f4:	56                   	push   %esi
801056f5:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
801056f6:	8d 45 dc             	lea    -0x24(%ebp),%eax
  return exec(path, argv);
}

int
sys_pipe(void)
{
801056f9:	83 ec 20             	sub    $0x20,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
801056fc:	6a 08                	push   $0x8
801056fe:	50                   	push   %eax
801056ff:	6a 00                	push   $0x0
80105701:	e8 9a f3 ff ff       	call   80104aa0 <argptr>
80105706:	83 c4 10             	add    $0x10,%esp
80105709:	85 c0                	test   %eax,%eax
8010570b:	78 48                	js     80105755 <sys_pipe+0x65>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
8010570d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105710:	83 ec 08             	sub    $0x8,%esp
80105713:	50                   	push   %eax
80105714:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105717:	50                   	push   %eax
80105718:	e8 13 dc ff ff       	call   80103330 <pipealloc>
8010571d:	83 c4 10             	add    $0x10,%esp
80105720:	85 c0                	test   %eax,%eax
80105722:	78 31                	js     80105755 <sys_pipe+0x65>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105724:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80105727:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
8010572e:	31 c0                	xor    %eax,%eax
    if(proc->ofile[fd] == 0){
80105730:	8b 54 81 28          	mov    0x28(%ecx,%eax,4),%edx
80105734:	85 d2                	test   %edx,%edx
80105736:	74 28                	je     80105760 <sys_pipe+0x70>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105738:	83 c0 01             	add    $0x1,%eax
8010573b:	83 f8 10             	cmp    $0x10,%eax
8010573e:	75 f0                	jne    80105730 <sys_pipe+0x40>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      proc->ofile[fd0] = 0;
    fileclose(rf);
80105740:	83 ec 0c             	sub    $0xc,%esp
80105743:	53                   	push   %ebx
80105744:	e8 d7 b6 ff ff       	call   80100e20 <fileclose>
    fileclose(wf);
80105749:	58                   	pop    %eax
8010574a:	ff 75 e4             	pushl  -0x1c(%ebp)
8010574d:	e8 ce b6 ff ff       	call   80100e20 <fileclose>
    return -1;
80105752:	83 c4 10             	add    $0x10,%esp
80105755:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010575a:	eb 45                	jmp    801057a1 <sys_pipe+0xb1>
8010575c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105760:	8d 34 81             	lea    (%ecx,%eax,4),%esi
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105763:	8b 7d e4             	mov    -0x1c(%ebp),%edi
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105766:	31 d2                	xor    %edx,%edx
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80105768:	89 5e 28             	mov    %ebx,0x28(%esi)
8010576b:	90                   	nop
8010576c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
80105770:	83 7c 91 28 00       	cmpl   $0x0,0x28(%ecx,%edx,4)
80105775:	74 19                	je     80105790 <sys_pipe+0xa0>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105777:	83 c2 01             	add    $0x1,%edx
8010577a:	83 fa 10             	cmp    $0x10,%edx
8010577d:	75 f1                	jne    80105770 <sys_pipe+0x80>
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      proc->ofile[fd0] = 0;
8010577f:	c7 46 28 00 00 00 00 	movl   $0x0,0x28(%esi)
80105786:	eb b8                	jmp    80105740 <sys_pipe+0x50>
80105788:	90                   	nop
80105789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80105790:	89 7c 91 28          	mov    %edi,0x28(%ecx,%edx,4)
      proc->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
80105794:	8b 4d dc             	mov    -0x24(%ebp),%ecx
80105797:	89 01                	mov    %eax,(%ecx)
  fd[1] = fd1;
80105799:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010579c:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
8010579f:	31 c0                	xor    %eax,%eax
}
801057a1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801057a4:	5b                   	pop    %ebx
801057a5:	5e                   	pop    %esi
801057a6:	5f                   	pop    %edi
801057a7:	5d                   	pop    %ebp
801057a8:	c3                   	ret    
801057a9:	66 90                	xchg   %ax,%ax
801057ab:	66 90                	xchg   %ax,%ax
801057ad:	66 90                	xchg   %ax,%ax
801057af:	90                   	nop

801057b0 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(int tickets)
{
801057b0:	55                   	push   %ebp
801057b1:	89 e5                	mov    %esp,%ebp
  return fork(tickets);
}
801057b3:	5d                   	pop    %ebp
#include "proc.h"

int
sys_fork(int tickets)
{
  return fork(tickets);
801057b4:	e9 07 e2 ff ff       	jmp    801039c0 <fork>
801057b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801057c0 <sys_exit>:
}

int
sys_exit(void)
{
801057c0:	55                   	push   %ebp
801057c1:	89 e5                	mov    %esp,%ebp
801057c3:	83 ec 08             	sub    $0x8,%esp
  exit();
801057c6:	e8 85 e5 ff ff       	call   80103d50 <exit>
  return 0;  // not reached
}
801057cb:	31 c0                	xor    %eax,%eax
801057cd:	c9                   	leave  
801057ce:	c3                   	ret    
801057cf:	90                   	nop

801057d0 <sys_wait>:

int
sys_wait(void)
{
801057d0:	55                   	push   %ebp
801057d1:	89 e5                	mov    %esp,%ebp
  return wait();
}
801057d3:	5d                   	pop    %ebp
}

int
sys_wait(void)
{
  return wait();
801057d4:	e9 c7 e7 ff ff       	jmp    80103fa0 <wait>
801057d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801057e0 <sys_kill>:
}

int
sys_kill(void)
{
801057e0:	55                   	push   %ebp
801057e1:	89 e5                	mov    %esp,%ebp
801057e3:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
801057e6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801057e9:	50                   	push   %eax
801057ea:	6a 00                	push   $0x0
801057ec:	e8 6f f2 ff ff       	call   80104a60 <argint>
801057f1:	83 c4 10             	add    $0x10,%esp
801057f4:	85 c0                	test   %eax,%eax
801057f6:	78 18                	js     80105810 <sys_kill+0x30>
    return -1;
  return kill(pid);
801057f8:	83 ec 0c             	sub    $0xc,%esp
801057fb:	ff 75 f4             	pushl  -0xc(%ebp)
801057fe:	e8 ed e8 ff ff       	call   801040f0 <kill>
80105803:	83 c4 10             	add    $0x10,%esp
}
80105806:	c9                   	leave  
80105807:	c3                   	ret    
80105808:	90                   	nop
80105809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
80105810:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return kill(pid);
}
80105815:	c9                   	leave  
80105816:	c3                   	ret    
80105817:	89 f6                	mov    %esi,%esi
80105819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105820 <sys_getpid>:

int
sys_getpid(void)
{
  return proc->pid;
80105820:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  return kill(pid);
}

int
sys_getpid(void)
{
80105826:	55                   	push   %ebp
80105827:	89 e5                	mov    %esp,%ebp
  return proc->pid;
80105829:	8b 40 10             	mov    0x10(%eax),%eax
}
8010582c:	5d                   	pop    %ebp
8010582d:	c3                   	ret    
8010582e:	66 90                	xchg   %ax,%ax

80105830 <sys_sbrk>:

int
sys_sbrk(void)
{
80105830:	55                   	push   %ebp
80105831:	89 e5                	mov    %esp,%ebp
80105833:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105834:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return proc->pid;
}

int
sys_sbrk(void)
{
80105837:	83 ec 1c             	sub    $0x1c,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
8010583a:	50                   	push   %eax
8010583b:	6a 00                	push   $0x0
8010583d:	e8 1e f2 ff ff       	call   80104a60 <argint>
80105842:	83 c4 10             	add    $0x10,%esp
80105845:	85 c0                	test   %eax,%eax
80105847:	78 27                	js     80105870 <sys_sbrk+0x40>
    return -1;
  addr = proc->sz;
80105849:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  if(growproc(n) < 0)
8010584f:	83 ec 0c             	sub    $0xc,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = proc->sz;
80105852:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80105854:	ff 75 f4             	pushl  -0xc(%ebp)
80105857:	e8 f4 e0 ff ff       	call   80103950 <growproc>
8010585c:	83 c4 10             	add    $0x10,%esp
8010585f:	85 c0                	test   %eax,%eax
80105861:	78 0d                	js     80105870 <sys_sbrk+0x40>
    return -1;
  return addr;
80105863:	89 d8                	mov    %ebx,%eax
}
80105865:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105868:	c9                   	leave  
80105869:	c3                   	ret    
8010586a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
80105870:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105875:	eb ee                	jmp    80105865 <sys_sbrk+0x35>
80105877:	89 f6                	mov    %esi,%esi
80105879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105880 <sys_sleep>:
  return addr;
}

int
sys_sleep(void)
{
80105880:	55                   	push   %ebp
80105881:	89 e5                	mov    %esp,%ebp
80105883:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80105884:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return addr;
}

int
sys_sleep(void)
{
80105887:	83 ec 1c             	sub    $0x1c,%esp
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
8010588a:	50                   	push   %eax
8010588b:	6a 00                	push   $0x0
8010588d:	e8 ce f1 ff ff       	call   80104a60 <argint>
80105892:	83 c4 10             	add    $0x10,%esp
80105895:	85 c0                	test   %eax,%eax
80105897:	0f 88 8a 00 00 00    	js     80105927 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
8010589d:	83 ec 0c             	sub    $0xc,%esp
801058a0:	68 a0 4d 11 80       	push   $0x80114da0
801058a5:	e8 96 ec ff ff       	call   80104540 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
801058aa:	8b 55 f4             	mov    -0xc(%ebp),%edx
801058ad:	83 c4 10             	add    $0x10,%esp
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
801058b0:	8b 1d e0 55 11 80    	mov    0x801155e0,%ebx
  while(ticks - ticks0 < n){
801058b6:	85 d2                	test   %edx,%edx
801058b8:	75 27                	jne    801058e1 <sys_sleep+0x61>
801058ba:	eb 54                	jmp    80105910 <sys_sleep+0x90>
801058bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(proc->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
801058c0:	83 ec 08             	sub    $0x8,%esp
801058c3:	68 a0 4d 11 80       	push   $0x80114da0
801058c8:	68 e0 55 11 80       	push   $0x801155e0
801058cd:	e8 0e e6 ff ff       	call   80103ee0 <sleep>

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
801058d2:	a1 e0 55 11 80       	mov    0x801155e0,%eax
801058d7:	83 c4 10             	add    $0x10,%esp
801058da:	29 d8                	sub    %ebx,%eax
801058dc:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801058df:	73 2f                	jae    80105910 <sys_sleep+0x90>
    if(proc->killed){
801058e1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801058e7:	8b 40 24             	mov    0x24(%eax),%eax
801058ea:	85 c0                	test   %eax,%eax
801058ec:	74 d2                	je     801058c0 <sys_sleep+0x40>
      release(&tickslock);
801058ee:	83 ec 0c             	sub    $0xc,%esp
801058f1:	68 a0 4d 11 80       	push   $0x80114da0
801058f6:	e8 25 ee ff ff       	call   80104720 <release>
      return -1;
801058fb:	83 c4 10             	add    $0x10,%esp
801058fe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}
80105903:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105906:	c9                   	leave  
80105907:	c3                   	ret    
80105908:	90                   	nop
80105909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
80105910:	83 ec 0c             	sub    $0xc,%esp
80105913:	68 a0 4d 11 80       	push   $0x80114da0
80105918:	e8 03 ee ff ff       	call   80104720 <release>
  return 0;
8010591d:	83 c4 10             	add    $0x10,%esp
80105920:	31 c0                	xor    %eax,%eax
}
80105922:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105925:	c9                   	leave  
80105926:	c3                   	ret    
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
80105927:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010592c:	eb d5                	jmp    80105903 <sys_sleep+0x83>
8010592e:	66 90                	xchg   %ax,%ax

80105930 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105930:	55                   	push   %ebp
80105931:	89 e5                	mov    %esp,%ebp
80105933:	53                   	push   %ebx
80105934:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80105937:	68 a0 4d 11 80       	push   $0x80114da0
8010593c:	e8 ff eb ff ff       	call   80104540 <acquire>
  xticks = ticks;
80105941:	8b 1d e0 55 11 80    	mov    0x801155e0,%ebx
  release(&tickslock);
80105947:	c7 04 24 a0 4d 11 80 	movl   $0x80114da0,(%esp)
8010594e:	e8 cd ed ff ff       	call   80104720 <release>
  return xticks;
}
80105953:	89 d8                	mov    %ebx,%eax
80105955:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105958:	c9                   	leave  
80105959:	c3                   	ret    
8010595a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105960 <sys_cps>:

int
sys_cps(void)
{
80105960:	55                   	push   %ebp
80105961:	89 e5                	mov    %esp,%ebp
  return cps();
}
80105963:	5d                   	pop    %ebp
}

int
sys_cps(void)
{
  return cps();
80105964:	e9 f7 e8 ff ff       	jmp    80104260 <cps>
80105969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105970 <sys_cht>:
}

int
sys_cht(void)
{
80105970:	55                   	push   %ebp
80105971:	89 e5                	mov    %esp,%ebp
80105973:	83 ec 20             	sub    $0x20,%esp
  int pid, tickets;
  if(argint(0, &pid) < 0)
80105976:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105979:	50                   	push   %eax
8010597a:	6a 00                	push   $0x0
8010597c:	e8 df f0 ff ff       	call   80104a60 <argint>
80105981:	83 c4 10             	add    $0x10,%esp
80105984:	85 c0                	test   %eax,%eax
80105986:	78 28                	js     801059b0 <sys_cht+0x40>
    return -1;
  if(argint(1, &tickets) < 0)
80105988:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010598b:	83 ec 08             	sub    $0x8,%esp
8010598e:	50                   	push   %eax
8010598f:	6a 01                	push   $0x1
80105991:	e8 ca f0 ff ff       	call   80104a60 <argint>
80105996:	83 c4 10             	add    $0x10,%esp
80105999:	85 c0                	test   %eax,%eax
8010599b:	78 13                	js     801059b0 <sys_cht+0x40>
    return -1;
  
  return cht(pid, tickets);
8010599d:	83 ec 08             	sub    $0x8,%esp
801059a0:	ff 75 f4             	pushl  -0xc(%ebp)
801059a3:	ff 75 f0             	pushl  -0x10(%ebp)
801059a6:	e8 05 ea ff ff       	call   801043b0 <cht>
801059ab:	83 c4 10             	add    $0x10,%esp
}
801059ae:	c9                   	leave  
801059af:	c3                   	ret    
int
sys_cht(void)
{
  int pid, tickets;
  if(argint(0, &pid) < 0)
    return -1;
801059b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(argint(1, &tickets) < 0)
    return -1;
  
  return cht(pid, tickets);
}
801059b5:	c9                   	leave  
801059b6:	c3                   	ret    
801059b7:	66 90                	xchg   %ax,%ax
801059b9:	66 90                	xchg   %ax,%ax
801059bb:	66 90                	xchg   %ax,%ax
801059bd:	66 90                	xchg   %ax,%ax
801059bf:	90                   	nop

801059c0 <timerinit>:
801059c0:	55                   	push   %ebp
801059c1:	ba 43 00 00 00       	mov    $0x43,%edx
801059c6:	b8 34 00 00 00       	mov    $0x34,%eax
801059cb:	89 e5                	mov    %esp,%ebp
801059cd:	83 ec 14             	sub    $0x14,%esp
801059d0:	ee                   	out    %al,(%dx)
801059d1:	ba 40 00 00 00       	mov    $0x40,%edx
801059d6:	b8 9c ff ff ff       	mov    $0xffffff9c,%eax
801059db:	ee                   	out    %al,(%dx)
801059dc:	b8 2e 00 00 00       	mov    $0x2e,%eax
801059e1:	ee                   	out    %al,(%dx)
801059e2:	6a 00                	push   $0x0
801059e4:	e8 77 d8 ff ff       	call   80103260 <picenable>
801059e9:	83 c4 10             	add    $0x10,%esp
801059ec:	c9                   	leave  
801059ed:	c3                   	ret    

801059ee <alltraps>:
801059ee:	1e                   	push   %ds
801059ef:	06                   	push   %es
801059f0:	0f a0                	push   %fs
801059f2:	0f a8                	push   %gs
801059f4:	60                   	pusha  
801059f5:	66 b8 10 00          	mov    $0x10,%ax
801059f9:	8e d8                	mov    %eax,%ds
801059fb:	8e c0                	mov    %eax,%es
801059fd:	66 b8 18 00          	mov    $0x18,%ax
80105a01:	8e e0                	mov    %eax,%fs
80105a03:	8e e8                	mov    %eax,%gs
80105a05:	54                   	push   %esp
80105a06:	e8 e5 00 00 00       	call   80105af0 <trap>
80105a0b:	83 c4 04             	add    $0x4,%esp

80105a0e <trapret>:
80105a0e:	61                   	popa   
80105a0f:	0f a9                	pop    %gs
80105a11:	0f a1                	pop    %fs
80105a13:	07                   	pop    %es
80105a14:	1f                   	pop    %ds
80105a15:	83 c4 08             	add    $0x8,%esp
80105a18:	cf                   	iret   
80105a19:	66 90                	xchg   %ax,%ax
80105a1b:	66 90                	xchg   %ax,%ax
80105a1d:	66 90                	xchg   %ax,%ax
80105a1f:	90                   	nop

80105a20 <tvinit>:
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
80105a20:	31 c0                	xor    %eax,%eax
80105a22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105a28:	8b 14 85 0c a0 10 80 	mov    -0x7fef5ff4(,%eax,4),%edx
80105a2f:	b9 08 00 00 00       	mov    $0x8,%ecx
80105a34:	c6 04 c5 e4 4d 11 80 	movb   $0x0,-0x7feeb21c(,%eax,8)
80105a3b:	00 
80105a3c:	66 89 0c c5 e2 4d 11 	mov    %cx,-0x7feeb21e(,%eax,8)
80105a43:	80 
80105a44:	c6 04 c5 e5 4d 11 80 	movb   $0x8e,-0x7feeb21b(,%eax,8)
80105a4b:	8e 
80105a4c:	66 89 14 c5 e0 4d 11 	mov    %dx,-0x7feeb220(,%eax,8)
80105a53:	80 
80105a54:	c1 ea 10             	shr    $0x10,%edx
80105a57:	66 89 14 c5 e6 4d 11 	mov    %dx,-0x7feeb21a(,%eax,8)
80105a5e:	80 
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
80105a5f:	83 c0 01             	add    $0x1,%eax
80105a62:	3d 00 01 00 00       	cmp    $0x100,%eax
80105a67:	75 bf                	jne    80105a28 <tvinit+0x8>
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105a69:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105a6a:	ba 08 00 00 00       	mov    $0x8,%edx
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105a6f:	89 e5                	mov    %esp,%ebp
80105a71:	83 ec 10             	sub    $0x10,%esp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105a74:	a1 0c a1 10 80       	mov    0x8010a10c,%eax

  initlock(&tickslock, "time");
80105a79:	68 a1 7a 10 80       	push   $0x80107aa1
80105a7e:	68 a0 4d 11 80       	push   $0x80114da0
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105a83:	66 89 15 e2 4f 11 80 	mov    %dx,0x80114fe2
80105a8a:	c6 05 e4 4f 11 80 00 	movb   $0x0,0x80114fe4
80105a91:	66 a3 e0 4f 11 80    	mov    %ax,0x80114fe0
80105a97:	c1 e8 10             	shr    $0x10,%eax
80105a9a:	c6 05 e5 4f 11 80 ef 	movb   $0xef,0x80114fe5
80105aa1:	66 a3 e6 4f 11 80    	mov    %ax,0x80114fe6

  initlock(&tickslock, "time");
80105aa7:	e8 74 ea ff ff       	call   80104520 <initlock>
}
80105aac:	83 c4 10             	add    $0x10,%esp
80105aaf:	c9                   	leave  
80105ab0:	c3                   	ret    
80105ab1:	eb 0d                	jmp    80105ac0 <idtinit>
80105ab3:	90                   	nop
80105ab4:	90                   	nop
80105ab5:	90                   	nop
80105ab6:	90                   	nop
80105ab7:	90                   	nop
80105ab8:	90                   	nop
80105ab9:	90                   	nop
80105aba:	90                   	nop
80105abb:	90                   	nop
80105abc:	90                   	nop
80105abd:	90                   	nop
80105abe:	90                   	nop
80105abf:	90                   	nop

80105ac0 <idtinit>:

void
idtinit(void)
{
80105ac0:	55                   	push   %ebp
static inline void
lidt(struct gatedesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80105ac1:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105ac6:	89 e5                	mov    %esp,%ebp
80105ac8:	83 ec 10             	sub    $0x10,%esp
80105acb:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
80105acf:	b8 e0 4d 11 80       	mov    $0x80114de0,%eax
80105ad4:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105ad8:	c1 e8 10             	shr    $0x10,%eax
80105adb:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
80105adf:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105ae2:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105ae5:	c9                   	leave  
80105ae6:	c3                   	ret    
80105ae7:	89 f6                	mov    %esi,%esi
80105ae9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105af0 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105af0:	55                   	push   %ebp
80105af1:	89 e5                	mov    %esp,%ebp
80105af3:	57                   	push   %edi
80105af4:	56                   	push   %esi
80105af5:	53                   	push   %ebx
80105af6:	83 ec 0c             	sub    $0xc,%esp
80105af9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(tf->trapno == T_SYSCALL){
80105afc:	8b 43 30             	mov    0x30(%ebx),%eax
80105aff:	83 f8 40             	cmp    $0x40,%eax
80105b02:	0f 84 f8 00 00 00    	je     80105c00 <trap+0x110>
    if(proc->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80105b08:	83 e8 20             	sub    $0x20,%eax
80105b0b:	83 f8 1f             	cmp    $0x1f,%eax
80105b0e:	77 68                	ja     80105b78 <trap+0x88>
80105b10:	ff 24 85 48 7b 10 80 	jmp    *-0x7fef84b8(,%eax,4)
80105b17:	89 f6                	mov    %esi,%esi
80105b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
80105b20:	e8 bb cb ff ff       	call   801026e0 <cpunum>
80105b25:	85 c0                	test   %eax,%eax
80105b27:	0f 84 b3 01 00 00    	je     80105ce0 <trap+0x1f0>
    kbdintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_COM1:
    uartintr();
    lapiceoi();
80105b2d:	e8 1e cc ff ff       	call   80102750 <lapiceoi>
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105b32:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105b38:	85 c0                	test   %eax,%eax
80105b3a:	74 2d                	je     80105b69 <trap+0x79>
80105b3c:	8b 50 24             	mov    0x24(%eax),%edx
80105b3f:	85 d2                	test   %edx,%edx
80105b41:	0f 85 86 00 00 00    	jne    80105bcd <trap+0xdd>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105b47:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105b4b:	0f 84 ef 00 00 00    	je     80105c40 <trap+0x150>
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105b51:	8b 40 24             	mov    0x24(%eax),%eax
80105b54:	85 c0                	test   %eax,%eax
80105b56:	74 11                	je     80105b69 <trap+0x79>
80105b58:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105b5c:	83 e0 03             	and    $0x3,%eax
80105b5f:	66 83 f8 03          	cmp    $0x3,%ax
80105b63:	0f 84 c1 00 00 00    	je     80105c2a <trap+0x13a>
    exit();
}
80105b69:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b6c:	5b                   	pop    %ebx
80105b6d:	5e                   	pop    %esi
80105b6e:	5f                   	pop    %edi
80105b6f:	5d                   	pop    %ebp
80105b70:	c3                   	ret    
80105b71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
80105b78:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
80105b7f:	85 c9                	test   %ecx,%ecx
80105b81:	0f 84 8d 01 00 00    	je     80105d14 <trap+0x224>
80105b87:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
80105b8b:	0f 84 83 01 00 00    	je     80105d14 <trap+0x224>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105b91:	0f 20 d7             	mov    %cr2,%edi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105b94:	8b 73 38             	mov    0x38(%ebx),%esi
80105b97:	e8 44 cb ff ff       	call   801026e0 <cpunum>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
80105b9c:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105ba3:	57                   	push   %edi
80105ba4:	56                   	push   %esi
80105ba5:	50                   	push   %eax
80105ba6:	ff 73 34             	pushl  0x34(%ebx)
80105ba9:	ff 73 30             	pushl  0x30(%ebx)
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
80105bac:	8d 42 6c             	lea    0x6c(%edx),%eax
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105baf:	50                   	push   %eax
80105bb0:	ff 72 10             	pushl  0x10(%edx)
80105bb3:	68 04 7b 10 80       	push   $0x80107b04
80105bb8:	e8 a3 aa ff ff       	call   80100660 <cprintf>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
            rcr2());
    proc->killed = 1;
80105bbd:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105bc3:	83 c4 20             	add    $0x20,%esp
80105bc6:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105bcd:	0f b7 53 3c          	movzwl 0x3c(%ebx),%edx
80105bd1:	83 e2 03             	and    $0x3,%edx
80105bd4:	66 83 fa 03          	cmp    $0x3,%dx
80105bd8:	0f 85 69 ff ff ff    	jne    80105b47 <trap+0x57>
    exit();
80105bde:	e8 6d e1 ff ff       	call   80103d50 <exit>
80105be3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105be9:	85 c0                	test   %eax,%eax
80105beb:	0f 85 56 ff ff ff    	jne    80105b47 <trap+0x57>
80105bf1:	e9 73 ff ff ff       	jmp    80105b69 <trap+0x79>
80105bf6:	8d 76 00             	lea    0x0(%esi),%esi
80105bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
80105c00:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105c06:	8b 70 24             	mov    0x24(%eax),%esi
80105c09:	85 f6                	test   %esi,%esi
80105c0b:	0f 85 bf 00 00 00    	jne    80105cd0 <trap+0x1e0>
      exit();
    proc->tf = tf;
80105c11:	89 58 18             	mov    %ebx,0x18(%eax)
    syscall();
80105c14:	e8 57 ef ff ff       	call   80104b70 <syscall>
    if(proc->killed)
80105c19:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105c1f:	8b 58 24             	mov    0x24(%eax),%ebx
80105c22:	85 db                	test   %ebx,%ebx
80105c24:	0f 84 3f ff ff ff    	je     80105b69 <trap+0x79>
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();
}
80105c2a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105c2d:	5b                   	pop    %ebx
80105c2e:	5e                   	pop    %esi
80105c2f:	5f                   	pop    %edi
80105c30:	5d                   	pop    %ebp
    if(proc->killed)
      exit();
    proc->tf = tf;
    syscall();
    if(proc->killed)
      exit();
80105c31:	e9 1a e1 ff ff       	jmp    80103d50 <exit>
80105c36:	8d 76 00             	lea    0x0(%esi),%esi
80105c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105c40:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
80105c44:	0f 85 07 ff ff ff    	jne    80105b51 <trap+0x61>
    yield();
80105c4a:	e8 51 e2 ff ff       	call   80103ea0 <yield>
80105c4f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105c55:	85 c0                	test   %eax,%eax
80105c57:	0f 85 f4 fe ff ff    	jne    80105b51 <trap+0x61>
80105c5d:	e9 07 ff ff ff       	jmp    80105b69 <trap+0x79>
80105c62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    break;
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
80105c68:	e8 53 c9 ff ff       	call   801025c0 <kbdintr>
    lapiceoi();
80105c6d:	e8 de ca ff ff       	call   80102750 <lapiceoi>
    break;
80105c72:	e9 bb fe ff ff       	jmp    80105b32 <trap+0x42>
80105c77:	89 f6                	mov    %esi,%esi
80105c79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  case T_IRQ0 + IRQ_COM1:
    uartintr();
80105c80:	e8 2b 02 00 00       	call   80105eb0 <uartintr>
80105c85:	e9 a3 fe ff ff       	jmp    80105b2d <trap+0x3d>
80105c8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105c90:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
80105c94:	8b 7b 38             	mov    0x38(%ebx),%edi
80105c97:	e8 44 ca ff ff       	call   801026e0 <cpunum>
80105c9c:	57                   	push   %edi
80105c9d:	56                   	push   %esi
80105c9e:	50                   	push   %eax
80105c9f:	68 ac 7a 10 80       	push   $0x80107aac
80105ca4:	e8 b7 a9 ff ff       	call   80100660 <cprintf>
            cpunum(), tf->cs, tf->eip);
    lapiceoi();
80105ca9:	e8 a2 ca ff ff       	call   80102750 <lapiceoi>
    break;
80105cae:	83 c4 10             	add    $0x10,%esp
80105cb1:	e9 7c fe ff ff       	jmp    80105b32 <trap+0x42>
80105cb6:	8d 76 00             	lea    0x0(%esi),%esi
80105cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
80105cc0:	e8 6b c3 ff ff       	call   80102030 <ideintr>
    lapiceoi();
80105cc5:	e8 86 ca ff ff       	call   80102750 <lapiceoi>
    break;
80105cca:	e9 63 fe ff ff       	jmp    80105b32 <trap+0x42>
80105ccf:	90                   	nop
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
      exit();
80105cd0:	e8 7b e0 ff ff       	call   80103d50 <exit>
80105cd5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105cdb:	e9 31 ff ff ff       	jmp    80105c11 <trap+0x121>
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
      acquire(&tickslock);
80105ce0:	83 ec 0c             	sub    $0xc,%esp
80105ce3:	68 a0 4d 11 80       	push   $0x80114da0
80105ce8:	e8 53 e8 ff ff       	call   80104540 <acquire>
      ticks++;
      wakeup(&ticks);
80105ced:	c7 04 24 e0 55 11 80 	movl   $0x801155e0,(%esp)

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
      acquire(&tickslock);
      ticks++;
80105cf4:	83 05 e0 55 11 80 01 	addl   $0x1,0x801155e0
      wakeup(&ticks);
80105cfb:	e8 90 e3 ff ff       	call   80104090 <wakeup>
      release(&tickslock);
80105d00:	c7 04 24 a0 4d 11 80 	movl   $0x80114da0,(%esp)
80105d07:	e8 14 ea ff ff       	call   80104720 <release>
80105d0c:	83 c4 10             	add    $0x10,%esp
80105d0f:	e9 19 fe ff ff       	jmp    80105b2d <trap+0x3d>
80105d14:	0f 20 d7             	mov    %cr2,%edi

  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105d17:	8b 73 38             	mov    0x38(%ebx),%esi
80105d1a:	e8 c1 c9 ff ff       	call   801026e0 <cpunum>
80105d1f:	83 ec 0c             	sub    $0xc,%esp
80105d22:	57                   	push   %edi
80105d23:	56                   	push   %esi
80105d24:	50                   	push   %eax
80105d25:	ff 73 30             	pushl  0x30(%ebx)
80105d28:	68 d0 7a 10 80       	push   $0x80107ad0
80105d2d:	e8 2e a9 ff ff       	call   80100660 <cprintf>
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
80105d32:	83 c4 14             	add    $0x14,%esp
80105d35:	68 a6 7a 10 80       	push   $0x80107aa6
80105d3a:	e8 31 a6 ff ff       	call   80100370 <panic>
80105d3f:	90                   	nop

80105d40 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105d40:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
  outb(COM1+0, c);
}

static int
uartgetc(void)
{
80105d45:	55                   	push   %ebp
80105d46:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105d48:	85 c0                	test   %eax,%eax
80105d4a:	74 1c                	je     80105d68 <uartgetc+0x28>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105d4c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105d51:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105d52:	a8 01                	test   $0x1,%al
80105d54:	74 12                	je     80105d68 <uartgetc+0x28>
80105d56:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105d5b:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105d5c:	0f b6 c0             	movzbl %al,%eax
}
80105d5f:	5d                   	pop    %ebp
80105d60:	c3                   	ret    
80105d61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

static int
uartgetc(void)
{
  if(!uart)
    return -1;
80105d68:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(!(inb(COM1+5) & 0x01))
    return -1;
  return inb(COM1+0);
}
80105d6d:	5d                   	pop    %ebp
80105d6e:	c3                   	ret    
80105d6f:	90                   	nop

80105d70 <uartputc.part.0>:
  for(p="xv6...\n"; *p; p++)
    uartputc(*p);
}

void
uartputc(int c)
80105d70:	55                   	push   %ebp
80105d71:	89 e5                	mov    %esp,%ebp
80105d73:	57                   	push   %edi
80105d74:	56                   	push   %esi
80105d75:	53                   	push   %ebx
80105d76:	89 c7                	mov    %eax,%edi
80105d78:	bb 80 00 00 00       	mov    $0x80,%ebx
80105d7d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105d82:	83 ec 0c             	sub    $0xc,%esp
80105d85:	eb 1b                	jmp    80105da2 <uartputc.part.0+0x32>
80105d87:	89 f6                	mov    %esi,%esi
80105d89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
80105d90:	83 ec 0c             	sub    $0xc,%esp
80105d93:	6a 0a                	push   $0xa
80105d95:	e8 d6 c9 ff ff       	call   80102770 <microdelay>
{
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105d9a:	83 c4 10             	add    $0x10,%esp
80105d9d:	83 eb 01             	sub    $0x1,%ebx
80105da0:	74 07                	je     80105da9 <uartputc.part.0+0x39>
80105da2:	89 f2                	mov    %esi,%edx
80105da4:	ec                   	in     (%dx),%al
80105da5:	a8 20                	test   $0x20,%al
80105da7:	74 e7                	je     80105d90 <uartputc.part.0+0x20>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105da9:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105dae:	89 f8                	mov    %edi,%eax
80105db0:	ee                   	out    %al,(%dx)
    microdelay(10);
  outb(COM1+0, c);
}
80105db1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105db4:	5b                   	pop    %ebx
80105db5:	5e                   	pop    %esi
80105db6:	5f                   	pop    %edi
80105db7:	5d                   	pop    %ebp
80105db8:	c3                   	ret    
80105db9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105dc0 <uartinit>:

static int uart;    // is there a uart?

void
uartinit(void)
{
80105dc0:	55                   	push   %ebp
80105dc1:	31 c9                	xor    %ecx,%ecx
80105dc3:	89 c8                	mov    %ecx,%eax
80105dc5:	89 e5                	mov    %esp,%ebp
80105dc7:	57                   	push   %edi
80105dc8:	56                   	push   %esi
80105dc9:	53                   	push   %ebx
80105dca:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105dcf:	89 da                	mov    %ebx,%edx
80105dd1:	83 ec 0c             	sub    $0xc,%esp
80105dd4:	ee                   	out    %al,(%dx)
80105dd5:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105dda:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105ddf:	89 fa                	mov    %edi,%edx
80105de1:	ee                   	out    %al,(%dx)
80105de2:	b8 0c 00 00 00       	mov    $0xc,%eax
80105de7:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105dec:	ee                   	out    %al,(%dx)
80105ded:	be f9 03 00 00       	mov    $0x3f9,%esi
80105df2:	89 c8                	mov    %ecx,%eax
80105df4:	89 f2                	mov    %esi,%edx
80105df6:	ee                   	out    %al,(%dx)
80105df7:	b8 03 00 00 00       	mov    $0x3,%eax
80105dfc:	89 fa                	mov    %edi,%edx
80105dfe:	ee                   	out    %al,(%dx)
80105dff:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105e04:	89 c8                	mov    %ecx,%eax
80105e06:	ee                   	out    %al,(%dx)
80105e07:	b8 01 00 00 00       	mov    $0x1,%eax
80105e0c:	89 f2                	mov    %esi,%edx
80105e0e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105e0f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105e14:	ec                   	in     (%dx),%al
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
  outb(COM1+4, 0);
  outb(COM1+1, 0x01);    // Enable receive interrupts.

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
80105e15:	3c ff                	cmp    $0xff,%al
80105e17:	74 5a                	je     80105e73 <uartinit+0xb3>
    return;
  uart = 1;
80105e19:	c7 05 c0 a5 10 80 01 	movl   $0x1,0x8010a5c0
80105e20:	00 00 00 
80105e23:	89 da                	mov    %ebx,%edx
80105e25:	ec                   	in     (%dx),%al
80105e26:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105e2b:	ec                   	in     (%dx),%al

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  inb(COM1+0);
  picenable(IRQ_COM1);
80105e2c:	83 ec 0c             	sub    $0xc,%esp
80105e2f:	6a 04                	push   $0x4
80105e31:	e8 2a d4 ff ff       	call   80103260 <picenable>
  ioapicenable(IRQ_COM1, 0);
80105e36:	59                   	pop    %ecx
80105e37:	5b                   	pop    %ebx
80105e38:	6a 00                	push   $0x0
80105e3a:	6a 04                	push   $0x4
80105e3c:	bb c8 7b 10 80       	mov    $0x80107bc8,%ebx
80105e41:	e8 4a c4 ff ff       	call   80102290 <ioapicenable>
80105e46:	83 c4 10             	add    $0x10,%esp
80105e49:	b8 78 00 00 00       	mov    $0x78,%eax
80105e4e:	eb 0a                	jmp    80105e5a <uartinit+0x9a>

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105e50:	83 c3 01             	add    $0x1,%ebx
80105e53:	0f be 03             	movsbl (%ebx),%eax
80105e56:	84 c0                	test   %al,%al
80105e58:	74 19                	je     80105e73 <uartinit+0xb3>
void
uartputc(int c)
{
  int i;

  if(!uart)
80105e5a:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
80105e60:	85 d2                	test   %edx,%edx
80105e62:	74 ec                	je     80105e50 <uartinit+0x90>
  inb(COM1+0);
  picenable(IRQ_COM1);
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105e64:	83 c3 01             	add    $0x1,%ebx
80105e67:	e8 04 ff ff ff       	call   80105d70 <uartputc.part.0>
80105e6c:	0f be 03             	movsbl (%ebx),%eax
80105e6f:	84 c0                	test   %al,%al
80105e71:	75 e7                	jne    80105e5a <uartinit+0x9a>
    uartputc(*p);
}
80105e73:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105e76:	5b                   	pop    %ebx
80105e77:	5e                   	pop    %esi
80105e78:	5f                   	pop    %edi
80105e79:	5d                   	pop    %ebp
80105e7a:	c3                   	ret    
80105e7b:	90                   	nop
80105e7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105e80 <uartputc>:
void
uartputc(int c)
{
  int i;

  if(!uart)
80105e80:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
80105e86:	55                   	push   %ebp
80105e87:	89 e5                	mov    %esp,%ebp
  int i;

  if(!uart)
80105e89:	85 d2                	test   %edx,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
80105e8b:	8b 45 08             	mov    0x8(%ebp),%eax
  int i;

  if(!uart)
80105e8e:	74 10                	je     80105ea0 <uartputc+0x20>
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
  outb(COM1+0, c);
}
80105e90:	5d                   	pop    %ebp
80105e91:	e9 da fe ff ff       	jmp    80105d70 <uartputc.part.0>
80105e96:	8d 76 00             	lea    0x0(%esi),%esi
80105e99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105ea0:	5d                   	pop    %ebp
80105ea1:	c3                   	ret    
80105ea2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105ea9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105eb0 <uartintr>:
  return inb(COM1+0);
}

void
uartintr(void)
{
80105eb0:	55                   	push   %ebp
80105eb1:	89 e5                	mov    %esp,%ebp
80105eb3:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
80105eb6:	68 40 5d 10 80       	push   $0x80105d40
80105ebb:	e8 30 a9 ff ff       	call   801007f0 <consoleintr>
}
80105ec0:	83 c4 10             	add    $0x10,%esp
80105ec3:	c9                   	leave  
80105ec4:	c3                   	ret    

80105ec5 <vector0>:
80105ec5:	6a 00                	push   $0x0
80105ec7:	6a 00                	push   $0x0
80105ec9:	e9 20 fb ff ff       	jmp    801059ee <alltraps>

80105ece <vector1>:
80105ece:	6a 00                	push   $0x0
80105ed0:	6a 01                	push   $0x1
80105ed2:	e9 17 fb ff ff       	jmp    801059ee <alltraps>

80105ed7 <vector2>:
80105ed7:	6a 00                	push   $0x0
80105ed9:	6a 02                	push   $0x2
80105edb:	e9 0e fb ff ff       	jmp    801059ee <alltraps>

80105ee0 <vector3>:
80105ee0:	6a 00                	push   $0x0
80105ee2:	6a 03                	push   $0x3
80105ee4:	e9 05 fb ff ff       	jmp    801059ee <alltraps>

80105ee9 <vector4>:
80105ee9:	6a 00                	push   $0x0
80105eeb:	6a 04                	push   $0x4
80105eed:	e9 fc fa ff ff       	jmp    801059ee <alltraps>

80105ef2 <vector5>:
80105ef2:	6a 00                	push   $0x0
80105ef4:	6a 05                	push   $0x5
80105ef6:	e9 f3 fa ff ff       	jmp    801059ee <alltraps>

80105efb <vector6>:
80105efb:	6a 00                	push   $0x0
80105efd:	6a 06                	push   $0x6
80105eff:	e9 ea fa ff ff       	jmp    801059ee <alltraps>

80105f04 <vector7>:
80105f04:	6a 00                	push   $0x0
80105f06:	6a 07                	push   $0x7
80105f08:	e9 e1 fa ff ff       	jmp    801059ee <alltraps>

80105f0d <vector8>:
80105f0d:	6a 08                	push   $0x8
80105f0f:	e9 da fa ff ff       	jmp    801059ee <alltraps>

80105f14 <vector9>:
80105f14:	6a 00                	push   $0x0
80105f16:	6a 09                	push   $0x9
80105f18:	e9 d1 fa ff ff       	jmp    801059ee <alltraps>

80105f1d <vector10>:
80105f1d:	6a 0a                	push   $0xa
80105f1f:	e9 ca fa ff ff       	jmp    801059ee <alltraps>

80105f24 <vector11>:
80105f24:	6a 0b                	push   $0xb
80105f26:	e9 c3 fa ff ff       	jmp    801059ee <alltraps>

80105f2b <vector12>:
80105f2b:	6a 0c                	push   $0xc
80105f2d:	e9 bc fa ff ff       	jmp    801059ee <alltraps>

80105f32 <vector13>:
80105f32:	6a 0d                	push   $0xd
80105f34:	e9 b5 fa ff ff       	jmp    801059ee <alltraps>

80105f39 <vector14>:
80105f39:	6a 0e                	push   $0xe
80105f3b:	e9 ae fa ff ff       	jmp    801059ee <alltraps>

80105f40 <vector15>:
80105f40:	6a 00                	push   $0x0
80105f42:	6a 0f                	push   $0xf
80105f44:	e9 a5 fa ff ff       	jmp    801059ee <alltraps>

80105f49 <vector16>:
80105f49:	6a 00                	push   $0x0
80105f4b:	6a 10                	push   $0x10
80105f4d:	e9 9c fa ff ff       	jmp    801059ee <alltraps>

80105f52 <vector17>:
80105f52:	6a 11                	push   $0x11
80105f54:	e9 95 fa ff ff       	jmp    801059ee <alltraps>

80105f59 <vector18>:
80105f59:	6a 00                	push   $0x0
80105f5b:	6a 12                	push   $0x12
80105f5d:	e9 8c fa ff ff       	jmp    801059ee <alltraps>

80105f62 <vector19>:
80105f62:	6a 00                	push   $0x0
80105f64:	6a 13                	push   $0x13
80105f66:	e9 83 fa ff ff       	jmp    801059ee <alltraps>

80105f6b <vector20>:
80105f6b:	6a 00                	push   $0x0
80105f6d:	6a 14                	push   $0x14
80105f6f:	e9 7a fa ff ff       	jmp    801059ee <alltraps>

80105f74 <vector21>:
80105f74:	6a 00                	push   $0x0
80105f76:	6a 15                	push   $0x15
80105f78:	e9 71 fa ff ff       	jmp    801059ee <alltraps>

80105f7d <vector22>:
80105f7d:	6a 00                	push   $0x0
80105f7f:	6a 16                	push   $0x16
80105f81:	e9 68 fa ff ff       	jmp    801059ee <alltraps>

80105f86 <vector23>:
80105f86:	6a 00                	push   $0x0
80105f88:	6a 17                	push   $0x17
80105f8a:	e9 5f fa ff ff       	jmp    801059ee <alltraps>

80105f8f <vector24>:
80105f8f:	6a 00                	push   $0x0
80105f91:	6a 18                	push   $0x18
80105f93:	e9 56 fa ff ff       	jmp    801059ee <alltraps>

80105f98 <vector25>:
80105f98:	6a 00                	push   $0x0
80105f9a:	6a 19                	push   $0x19
80105f9c:	e9 4d fa ff ff       	jmp    801059ee <alltraps>

80105fa1 <vector26>:
80105fa1:	6a 00                	push   $0x0
80105fa3:	6a 1a                	push   $0x1a
80105fa5:	e9 44 fa ff ff       	jmp    801059ee <alltraps>

80105faa <vector27>:
80105faa:	6a 00                	push   $0x0
80105fac:	6a 1b                	push   $0x1b
80105fae:	e9 3b fa ff ff       	jmp    801059ee <alltraps>

80105fb3 <vector28>:
80105fb3:	6a 00                	push   $0x0
80105fb5:	6a 1c                	push   $0x1c
80105fb7:	e9 32 fa ff ff       	jmp    801059ee <alltraps>

80105fbc <vector29>:
80105fbc:	6a 00                	push   $0x0
80105fbe:	6a 1d                	push   $0x1d
80105fc0:	e9 29 fa ff ff       	jmp    801059ee <alltraps>

80105fc5 <vector30>:
80105fc5:	6a 00                	push   $0x0
80105fc7:	6a 1e                	push   $0x1e
80105fc9:	e9 20 fa ff ff       	jmp    801059ee <alltraps>

80105fce <vector31>:
80105fce:	6a 00                	push   $0x0
80105fd0:	6a 1f                	push   $0x1f
80105fd2:	e9 17 fa ff ff       	jmp    801059ee <alltraps>

80105fd7 <vector32>:
80105fd7:	6a 00                	push   $0x0
80105fd9:	6a 20                	push   $0x20
80105fdb:	e9 0e fa ff ff       	jmp    801059ee <alltraps>

80105fe0 <vector33>:
80105fe0:	6a 00                	push   $0x0
80105fe2:	6a 21                	push   $0x21
80105fe4:	e9 05 fa ff ff       	jmp    801059ee <alltraps>

80105fe9 <vector34>:
80105fe9:	6a 00                	push   $0x0
80105feb:	6a 22                	push   $0x22
80105fed:	e9 fc f9 ff ff       	jmp    801059ee <alltraps>

80105ff2 <vector35>:
80105ff2:	6a 00                	push   $0x0
80105ff4:	6a 23                	push   $0x23
80105ff6:	e9 f3 f9 ff ff       	jmp    801059ee <alltraps>

80105ffb <vector36>:
80105ffb:	6a 00                	push   $0x0
80105ffd:	6a 24                	push   $0x24
80105fff:	e9 ea f9 ff ff       	jmp    801059ee <alltraps>

80106004 <vector37>:
80106004:	6a 00                	push   $0x0
80106006:	6a 25                	push   $0x25
80106008:	e9 e1 f9 ff ff       	jmp    801059ee <alltraps>

8010600d <vector38>:
8010600d:	6a 00                	push   $0x0
8010600f:	6a 26                	push   $0x26
80106011:	e9 d8 f9 ff ff       	jmp    801059ee <alltraps>

80106016 <vector39>:
80106016:	6a 00                	push   $0x0
80106018:	6a 27                	push   $0x27
8010601a:	e9 cf f9 ff ff       	jmp    801059ee <alltraps>

8010601f <vector40>:
8010601f:	6a 00                	push   $0x0
80106021:	6a 28                	push   $0x28
80106023:	e9 c6 f9 ff ff       	jmp    801059ee <alltraps>

80106028 <vector41>:
80106028:	6a 00                	push   $0x0
8010602a:	6a 29                	push   $0x29
8010602c:	e9 bd f9 ff ff       	jmp    801059ee <alltraps>

80106031 <vector42>:
80106031:	6a 00                	push   $0x0
80106033:	6a 2a                	push   $0x2a
80106035:	e9 b4 f9 ff ff       	jmp    801059ee <alltraps>

8010603a <vector43>:
8010603a:	6a 00                	push   $0x0
8010603c:	6a 2b                	push   $0x2b
8010603e:	e9 ab f9 ff ff       	jmp    801059ee <alltraps>

80106043 <vector44>:
80106043:	6a 00                	push   $0x0
80106045:	6a 2c                	push   $0x2c
80106047:	e9 a2 f9 ff ff       	jmp    801059ee <alltraps>

8010604c <vector45>:
8010604c:	6a 00                	push   $0x0
8010604e:	6a 2d                	push   $0x2d
80106050:	e9 99 f9 ff ff       	jmp    801059ee <alltraps>

80106055 <vector46>:
80106055:	6a 00                	push   $0x0
80106057:	6a 2e                	push   $0x2e
80106059:	e9 90 f9 ff ff       	jmp    801059ee <alltraps>

8010605e <vector47>:
8010605e:	6a 00                	push   $0x0
80106060:	6a 2f                	push   $0x2f
80106062:	e9 87 f9 ff ff       	jmp    801059ee <alltraps>

80106067 <vector48>:
80106067:	6a 00                	push   $0x0
80106069:	6a 30                	push   $0x30
8010606b:	e9 7e f9 ff ff       	jmp    801059ee <alltraps>

80106070 <vector49>:
80106070:	6a 00                	push   $0x0
80106072:	6a 31                	push   $0x31
80106074:	e9 75 f9 ff ff       	jmp    801059ee <alltraps>

80106079 <vector50>:
80106079:	6a 00                	push   $0x0
8010607b:	6a 32                	push   $0x32
8010607d:	e9 6c f9 ff ff       	jmp    801059ee <alltraps>

80106082 <vector51>:
80106082:	6a 00                	push   $0x0
80106084:	6a 33                	push   $0x33
80106086:	e9 63 f9 ff ff       	jmp    801059ee <alltraps>

8010608b <vector52>:
8010608b:	6a 00                	push   $0x0
8010608d:	6a 34                	push   $0x34
8010608f:	e9 5a f9 ff ff       	jmp    801059ee <alltraps>

80106094 <vector53>:
80106094:	6a 00                	push   $0x0
80106096:	6a 35                	push   $0x35
80106098:	e9 51 f9 ff ff       	jmp    801059ee <alltraps>

8010609d <vector54>:
8010609d:	6a 00                	push   $0x0
8010609f:	6a 36                	push   $0x36
801060a1:	e9 48 f9 ff ff       	jmp    801059ee <alltraps>

801060a6 <vector55>:
801060a6:	6a 00                	push   $0x0
801060a8:	6a 37                	push   $0x37
801060aa:	e9 3f f9 ff ff       	jmp    801059ee <alltraps>

801060af <vector56>:
801060af:	6a 00                	push   $0x0
801060b1:	6a 38                	push   $0x38
801060b3:	e9 36 f9 ff ff       	jmp    801059ee <alltraps>

801060b8 <vector57>:
801060b8:	6a 00                	push   $0x0
801060ba:	6a 39                	push   $0x39
801060bc:	e9 2d f9 ff ff       	jmp    801059ee <alltraps>

801060c1 <vector58>:
801060c1:	6a 00                	push   $0x0
801060c3:	6a 3a                	push   $0x3a
801060c5:	e9 24 f9 ff ff       	jmp    801059ee <alltraps>

801060ca <vector59>:
801060ca:	6a 00                	push   $0x0
801060cc:	6a 3b                	push   $0x3b
801060ce:	e9 1b f9 ff ff       	jmp    801059ee <alltraps>

801060d3 <vector60>:
801060d3:	6a 00                	push   $0x0
801060d5:	6a 3c                	push   $0x3c
801060d7:	e9 12 f9 ff ff       	jmp    801059ee <alltraps>

801060dc <vector61>:
801060dc:	6a 00                	push   $0x0
801060de:	6a 3d                	push   $0x3d
801060e0:	e9 09 f9 ff ff       	jmp    801059ee <alltraps>

801060e5 <vector62>:
801060e5:	6a 00                	push   $0x0
801060e7:	6a 3e                	push   $0x3e
801060e9:	e9 00 f9 ff ff       	jmp    801059ee <alltraps>

801060ee <vector63>:
801060ee:	6a 00                	push   $0x0
801060f0:	6a 3f                	push   $0x3f
801060f2:	e9 f7 f8 ff ff       	jmp    801059ee <alltraps>

801060f7 <vector64>:
801060f7:	6a 00                	push   $0x0
801060f9:	6a 40                	push   $0x40
801060fb:	e9 ee f8 ff ff       	jmp    801059ee <alltraps>

80106100 <vector65>:
80106100:	6a 00                	push   $0x0
80106102:	6a 41                	push   $0x41
80106104:	e9 e5 f8 ff ff       	jmp    801059ee <alltraps>

80106109 <vector66>:
80106109:	6a 00                	push   $0x0
8010610b:	6a 42                	push   $0x42
8010610d:	e9 dc f8 ff ff       	jmp    801059ee <alltraps>

80106112 <vector67>:
80106112:	6a 00                	push   $0x0
80106114:	6a 43                	push   $0x43
80106116:	e9 d3 f8 ff ff       	jmp    801059ee <alltraps>

8010611b <vector68>:
8010611b:	6a 00                	push   $0x0
8010611d:	6a 44                	push   $0x44
8010611f:	e9 ca f8 ff ff       	jmp    801059ee <alltraps>

80106124 <vector69>:
80106124:	6a 00                	push   $0x0
80106126:	6a 45                	push   $0x45
80106128:	e9 c1 f8 ff ff       	jmp    801059ee <alltraps>

8010612d <vector70>:
8010612d:	6a 00                	push   $0x0
8010612f:	6a 46                	push   $0x46
80106131:	e9 b8 f8 ff ff       	jmp    801059ee <alltraps>

80106136 <vector71>:
80106136:	6a 00                	push   $0x0
80106138:	6a 47                	push   $0x47
8010613a:	e9 af f8 ff ff       	jmp    801059ee <alltraps>

8010613f <vector72>:
8010613f:	6a 00                	push   $0x0
80106141:	6a 48                	push   $0x48
80106143:	e9 a6 f8 ff ff       	jmp    801059ee <alltraps>

80106148 <vector73>:
80106148:	6a 00                	push   $0x0
8010614a:	6a 49                	push   $0x49
8010614c:	e9 9d f8 ff ff       	jmp    801059ee <alltraps>

80106151 <vector74>:
80106151:	6a 00                	push   $0x0
80106153:	6a 4a                	push   $0x4a
80106155:	e9 94 f8 ff ff       	jmp    801059ee <alltraps>

8010615a <vector75>:
8010615a:	6a 00                	push   $0x0
8010615c:	6a 4b                	push   $0x4b
8010615e:	e9 8b f8 ff ff       	jmp    801059ee <alltraps>

80106163 <vector76>:
80106163:	6a 00                	push   $0x0
80106165:	6a 4c                	push   $0x4c
80106167:	e9 82 f8 ff ff       	jmp    801059ee <alltraps>

8010616c <vector77>:
8010616c:	6a 00                	push   $0x0
8010616e:	6a 4d                	push   $0x4d
80106170:	e9 79 f8 ff ff       	jmp    801059ee <alltraps>

80106175 <vector78>:
80106175:	6a 00                	push   $0x0
80106177:	6a 4e                	push   $0x4e
80106179:	e9 70 f8 ff ff       	jmp    801059ee <alltraps>

8010617e <vector79>:
8010617e:	6a 00                	push   $0x0
80106180:	6a 4f                	push   $0x4f
80106182:	e9 67 f8 ff ff       	jmp    801059ee <alltraps>

80106187 <vector80>:
80106187:	6a 00                	push   $0x0
80106189:	6a 50                	push   $0x50
8010618b:	e9 5e f8 ff ff       	jmp    801059ee <alltraps>

80106190 <vector81>:
80106190:	6a 00                	push   $0x0
80106192:	6a 51                	push   $0x51
80106194:	e9 55 f8 ff ff       	jmp    801059ee <alltraps>

80106199 <vector82>:
80106199:	6a 00                	push   $0x0
8010619b:	6a 52                	push   $0x52
8010619d:	e9 4c f8 ff ff       	jmp    801059ee <alltraps>

801061a2 <vector83>:
801061a2:	6a 00                	push   $0x0
801061a4:	6a 53                	push   $0x53
801061a6:	e9 43 f8 ff ff       	jmp    801059ee <alltraps>

801061ab <vector84>:
801061ab:	6a 00                	push   $0x0
801061ad:	6a 54                	push   $0x54
801061af:	e9 3a f8 ff ff       	jmp    801059ee <alltraps>

801061b4 <vector85>:
801061b4:	6a 00                	push   $0x0
801061b6:	6a 55                	push   $0x55
801061b8:	e9 31 f8 ff ff       	jmp    801059ee <alltraps>

801061bd <vector86>:
801061bd:	6a 00                	push   $0x0
801061bf:	6a 56                	push   $0x56
801061c1:	e9 28 f8 ff ff       	jmp    801059ee <alltraps>

801061c6 <vector87>:
801061c6:	6a 00                	push   $0x0
801061c8:	6a 57                	push   $0x57
801061ca:	e9 1f f8 ff ff       	jmp    801059ee <alltraps>

801061cf <vector88>:
801061cf:	6a 00                	push   $0x0
801061d1:	6a 58                	push   $0x58
801061d3:	e9 16 f8 ff ff       	jmp    801059ee <alltraps>

801061d8 <vector89>:
801061d8:	6a 00                	push   $0x0
801061da:	6a 59                	push   $0x59
801061dc:	e9 0d f8 ff ff       	jmp    801059ee <alltraps>

801061e1 <vector90>:
801061e1:	6a 00                	push   $0x0
801061e3:	6a 5a                	push   $0x5a
801061e5:	e9 04 f8 ff ff       	jmp    801059ee <alltraps>

801061ea <vector91>:
801061ea:	6a 00                	push   $0x0
801061ec:	6a 5b                	push   $0x5b
801061ee:	e9 fb f7 ff ff       	jmp    801059ee <alltraps>

801061f3 <vector92>:
801061f3:	6a 00                	push   $0x0
801061f5:	6a 5c                	push   $0x5c
801061f7:	e9 f2 f7 ff ff       	jmp    801059ee <alltraps>

801061fc <vector93>:
801061fc:	6a 00                	push   $0x0
801061fe:	6a 5d                	push   $0x5d
80106200:	e9 e9 f7 ff ff       	jmp    801059ee <alltraps>

80106205 <vector94>:
80106205:	6a 00                	push   $0x0
80106207:	6a 5e                	push   $0x5e
80106209:	e9 e0 f7 ff ff       	jmp    801059ee <alltraps>

8010620e <vector95>:
8010620e:	6a 00                	push   $0x0
80106210:	6a 5f                	push   $0x5f
80106212:	e9 d7 f7 ff ff       	jmp    801059ee <alltraps>

80106217 <vector96>:
80106217:	6a 00                	push   $0x0
80106219:	6a 60                	push   $0x60
8010621b:	e9 ce f7 ff ff       	jmp    801059ee <alltraps>

80106220 <vector97>:
80106220:	6a 00                	push   $0x0
80106222:	6a 61                	push   $0x61
80106224:	e9 c5 f7 ff ff       	jmp    801059ee <alltraps>

80106229 <vector98>:
80106229:	6a 00                	push   $0x0
8010622b:	6a 62                	push   $0x62
8010622d:	e9 bc f7 ff ff       	jmp    801059ee <alltraps>

80106232 <vector99>:
80106232:	6a 00                	push   $0x0
80106234:	6a 63                	push   $0x63
80106236:	e9 b3 f7 ff ff       	jmp    801059ee <alltraps>

8010623b <vector100>:
8010623b:	6a 00                	push   $0x0
8010623d:	6a 64                	push   $0x64
8010623f:	e9 aa f7 ff ff       	jmp    801059ee <alltraps>

80106244 <vector101>:
80106244:	6a 00                	push   $0x0
80106246:	6a 65                	push   $0x65
80106248:	e9 a1 f7 ff ff       	jmp    801059ee <alltraps>

8010624d <vector102>:
8010624d:	6a 00                	push   $0x0
8010624f:	6a 66                	push   $0x66
80106251:	e9 98 f7 ff ff       	jmp    801059ee <alltraps>

80106256 <vector103>:
80106256:	6a 00                	push   $0x0
80106258:	6a 67                	push   $0x67
8010625a:	e9 8f f7 ff ff       	jmp    801059ee <alltraps>

8010625f <vector104>:
8010625f:	6a 00                	push   $0x0
80106261:	6a 68                	push   $0x68
80106263:	e9 86 f7 ff ff       	jmp    801059ee <alltraps>

80106268 <vector105>:
80106268:	6a 00                	push   $0x0
8010626a:	6a 69                	push   $0x69
8010626c:	e9 7d f7 ff ff       	jmp    801059ee <alltraps>

80106271 <vector106>:
80106271:	6a 00                	push   $0x0
80106273:	6a 6a                	push   $0x6a
80106275:	e9 74 f7 ff ff       	jmp    801059ee <alltraps>

8010627a <vector107>:
8010627a:	6a 00                	push   $0x0
8010627c:	6a 6b                	push   $0x6b
8010627e:	e9 6b f7 ff ff       	jmp    801059ee <alltraps>

80106283 <vector108>:
80106283:	6a 00                	push   $0x0
80106285:	6a 6c                	push   $0x6c
80106287:	e9 62 f7 ff ff       	jmp    801059ee <alltraps>

8010628c <vector109>:
8010628c:	6a 00                	push   $0x0
8010628e:	6a 6d                	push   $0x6d
80106290:	e9 59 f7 ff ff       	jmp    801059ee <alltraps>

80106295 <vector110>:
80106295:	6a 00                	push   $0x0
80106297:	6a 6e                	push   $0x6e
80106299:	e9 50 f7 ff ff       	jmp    801059ee <alltraps>

8010629e <vector111>:
8010629e:	6a 00                	push   $0x0
801062a0:	6a 6f                	push   $0x6f
801062a2:	e9 47 f7 ff ff       	jmp    801059ee <alltraps>

801062a7 <vector112>:
801062a7:	6a 00                	push   $0x0
801062a9:	6a 70                	push   $0x70
801062ab:	e9 3e f7 ff ff       	jmp    801059ee <alltraps>

801062b0 <vector113>:
801062b0:	6a 00                	push   $0x0
801062b2:	6a 71                	push   $0x71
801062b4:	e9 35 f7 ff ff       	jmp    801059ee <alltraps>

801062b9 <vector114>:
801062b9:	6a 00                	push   $0x0
801062bb:	6a 72                	push   $0x72
801062bd:	e9 2c f7 ff ff       	jmp    801059ee <alltraps>

801062c2 <vector115>:
801062c2:	6a 00                	push   $0x0
801062c4:	6a 73                	push   $0x73
801062c6:	e9 23 f7 ff ff       	jmp    801059ee <alltraps>

801062cb <vector116>:
801062cb:	6a 00                	push   $0x0
801062cd:	6a 74                	push   $0x74
801062cf:	e9 1a f7 ff ff       	jmp    801059ee <alltraps>

801062d4 <vector117>:
801062d4:	6a 00                	push   $0x0
801062d6:	6a 75                	push   $0x75
801062d8:	e9 11 f7 ff ff       	jmp    801059ee <alltraps>

801062dd <vector118>:
801062dd:	6a 00                	push   $0x0
801062df:	6a 76                	push   $0x76
801062e1:	e9 08 f7 ff ff       	jmp    801059ee <alltraps>

801062e6 <vector119>:
801062e6:	6a 00                	push   $0x0
801062e8:	6a 77                	push   $0x77
801062ea:	e9 ff f6 ff ff       	jmp    801059ee <alltraps>

801062ef <vector120>:
801062ef:	6a 00                	push   $0x0
801062f1:	6a 78                	push   $0x78
801062f3:	e9 f6 f6 ff ff       	jmp    801059ee <alltraps>

801062f8 <vector121>:
801062f8:	6a 00                	push   $0x0
801062fa:	6a 79                	push   $0x79
801062fc:	e9 ed f6 ff ff       	jmp    801059ee <alltraps>

80106301 <vector122>:
80106301:	6a 00                	push   $0x0
80106303:	6a 7a                	push   $0x7a
80106305:	e9 e4 f6 ff ff       	jmp    801059ee <alltraps>

8010630a <vector123>:
8010630a:	6a 00                	push   $0x0
8010630c:	6a 7b                	push   $0x7b
8010630e:	e9 db f6 ff ff       	jmp    801059ee <alltraps>

80106313 <vector124>:
80106313:	6a 00                	push   $0x0
80106315:	6a 7c                	push   $0x7c
80106317:	e9 d2 f6 ff ff       	jmp    801059ee <alltraps>

8010631c <vector125>:
8010631c:	6a 00                	push   $0x0
8010631e:	6a 7d                	push   $0x7d
80106320:	e9 c9 f6 ff ff       	jmp    801059ee <alltraps>

80106325 <vector126>:
80106325:	6a 00                	push   $0x0
80106327:	6a 7e                	push   $0x7e
80106329:	e9 c0 f6 ff ff       	jmp    801059ee <alltraps>

8010632e <vector127>:
8010632e:	6a 00                	push   $0x0
80106330:	6a 7f                	push   $0x7f
80106332:	e9 b7 f6 ff ff       	jmp    801059ee <alltraps>

80106337 <vector128>:
80106337:	6a 00                	push   $0x0
80106339:	68 80 00 00 00       	push   $0x80
8010633e:	e9 ab f6 ff ff       	jmp    801059ee <alltraps>

80106343 <vector129>:
80106343:	6a 00                	push   $0x0
80106345:	68 81 00 00 00       	push   $0x81
8010634a:	e9 9f f6 ff ff       	jmp    801059ee <alltraps>

8010634f <vector130>:
8010634f:	6a 00                	push   $0x0
80106351:	68 82 00 00 00       	push   $0x82
80106356:	e9 93 f6 ff ff       	jmp    801059ee <alltraps>

8010635b <vector131>:
8010635b:	6a 00                	push   $0x0
8010635d:	68 83 00 00 00       	push   $0x83
80106362:	e9 87 f6 ff ff       	jmp    801059ee <alltraps>

80106367 <vector132>:
80106367:	6a 00                	push   $0x0
80106369:	68 84 00 00 00       	push   $0x84
8010636e:	e9 7b f6 ff ff       	jmp    801059ee <alltraps>

80106373 <vector133>:
80106373:	6a 00                	push   $0x0
80106375:	68 85 00 00 00       	push   $0x85
8010637a:	e9 6f f6 ff ff       	jmp    801059ee <alltraps>

8010637f <vector134>:
8010637f:	6a 00                	push   $0x0
80106381:	68 86 00 00 00       	push   $0x86
80106386:	e9 63 f6 ff ff       	jmp    801059ee <alltraps>

8010638b <vector135>:
8010638b:	6a 00                	push   $0x0
8010638d:	68 87 00 00 00       	push   $0x87
80106392:	e9 57 f6 ff ff       	jmp    801059ee <alltraps>

80106397 <vector136>:
80106397:	6a 00                	push   $0x0
80106399:	68 88 00 00 00       	push   $0x88
8010639e:	e9 4b f6 ff ff       	jmp    801059ee <alltraps>

801063a3 <vector137>:
801063a3:	6a 00                	push   $0x0
801063a5:	68 89 00 00 00       	push   $0x89
801063aa:	e9 3f f6 ff ff       	jmp    801059ee <alltraps>

801063af <vector138>:
801063af:	6a 00                	push   $0x0
801063b1:	68 8a 00 00 00       	push   $0x8a
801063b6:	e9 33 f6 ff ff       	jmp    801059ee <alltraps>

801063bb <vector139>:
801063bb:	6a 00                	push   $0x0
801063bd:	68 8b 00 00 00       	push   $0x8b
801063c2:	e9 27 f6 ff ff       	jmp    801059ee <alltraps>

801063c7 <vector140>:
801063c7:	6a 00                	push   $0x0
801063c9:	68 8c 00 00 00       	push   $0x8c
801063ce:	e9 1b f6 ff ff       	jmp    801059ee <alltraps>

801063d3 <vector141>:
801063d3:	6a 00                	push   $0x0
801063d5:	68 8d 00 00 00       	push   $0x8d
801063da:	e9 0f f6 ff ff       	jmp    801059ee <alltraps>

801063df <vector142>:
801063df:	6a 00                	push   $0x0
801063e1:	68 8e 00 00 00       	push   $0x8e
801063e6:	e9 03 f6 ff ff       	jmp    801059ee <alltraps>

801063eb <vector143>:
801063eb:	6a 00                	push   $0x0
801063ed:	68 8f 00 00 00       	push   $0x8f
801063f2:	e9 f7 f5 ff ff       	jmp    801059ee <alltraps>

801063f7 <vector144>:
801063f7:	6a 00                	push   $0x0
801063f9:	68 90 00 00 00       	push   $0x90
801063fe:	e9 eb f5 ff ff       	jmp    801059ee <alltraps>

80106403 <vector145>:
80106403:	6a 00                	push   $0x0
80106405:	68 91 00 00 00       	push   $0x91
8010640a:	e9 df f5 ff ff       	jmp    801059ee <alltraps>

8010640f <vector146>:
8010640f:	6a 00                	push   $0x0
80106411:	68 92 00 00 00       	push   $0x92
80106416:	e9 d3 f5 ff ff       	jmp    801059ee <alltraps>

8010641b <vector147>:
8010641b:	6a 00                	push   $0x0
8010641d:	68 93 00 00 00       	push   $0x93
80106422:	e9 c7 f5 ff ff       	jmp    801059ee <alltraps>

80106427 <vector148>:
80106427:	6a 00                	push   $0x0
80106429:	68 94 00 00 00       	push   $0x94
8010642e:	e9 bb f5 ff ff       	jmp    801059ee <alltraps>

80106433 <vector149>:
80106433:	6a 00                	push   $0x0
80106435:	68 95 00 00 00       	push   $0x95
8010643a:	e9 af f5 ff ff       	jmp    801059ee <alltraps>

8010643f <vector150>:
8010643f:	6a 00                	push   $0x0
80106441:	68 96 00 00 00       	push   $0x96
80106446:	e9 a3 f5 ff ff       	jmp    801059ee <alltraps>

8010644b <vector151>:
8010644b:	6a 00                	push   $0x0
8010644d:	68 97 00 00 00       	push   $0x97
80106452:	e9 97 f5 ff ff       	jmp    801059ee <alltraps>

80106457 <vector152>:
80106457:	6a 00                	push   $0x0
80106459:	68 98 00 00 00       	push   $0x98
8010645e:	e9 8b f5 ff ff       	jmp    801059ee <alltraps>

80106463 <vector153>:
80106463:	6a 00                	push   $0x0
80106465:	68 99 00 00 00       	push   $0x99
8010646a:	e9 7f f5 ff ff       	jmp    801059ee <alltraps>

8010646f <vector154>:
8010646f:	6a 00                	push   $0x0
80106471:	68 9a 00 00 00       	push   $0x9a
80106476:	e9 73 f5 ff ff       	jmp    801059ee <alltraps>

8010647b <vector155>:
8010647b:	6a 00                	push   $0x0
8010647d:	68 9b 00 00 00       	push   $0x9b
80106482:	e9 67 f5 ff ff       	jmp    801059ee <alltraps>

80106487 <vector156>:
80106487:	6a 00                	push   $0x0
80106489:	68 9c 00 00 00       	push   $0x9c
8010648e:	e9 5b f5 ff ff       	jmp    801059ee <alltraps>

80106493 <vector157>:
80106493:	6a 00                	push   $0x0
80106495:	68 9d 00 00 00       	push   $0x9d
8010649a:	e9 4f f5 ff ff       	jmp    801059ee <alltraps>

8010649f <vector158>:
8010649f:	6a 00                	push   $0x0
801064a1:	68 9e 00 00 00       	push   $0x9e
801064a6:	e9 43 f5 ff ff       	jmp    801059ee <alltraps>

801064ab <vector159>:
801064ab:	6a 00                	push   $0x0
801064ad:	68 9f 00 00 00       	push   $0x9f
801064b2:	e9 37 f5 ff ff       	jmp    801059ee <alltraps>

801064b7 <vector160>:
801064b7:	6a 00                	push   $0x0
801064b9:	68 a0 00 00 00       	push   $0xa0
801064be:	e9 2b f5 ff ff       	jmp    801059ee <alltraps>

801064c3 <vector161>:
801064c3:	6a 00                	push   $0x0
801064c5:	68 a1 00 00 00       	push   $0xa1
801064ca:	e9 1f f5 ff ff       	jmp    801059ee <alltraps>

801064cf <vector162>:
801064cf:	6a 00                	push   $0x0
801064d1:	68 a2 00 00 00       	push   $0xa2
801064d6:	e9 13 f5 ff ff       	jmp    801059ee <alltraps>

801064db <vector163>:
801064db:	6a 00                	push   $0x0
801064dd:	68 a3 00 00 00       	push   $0xa3
801064e2:	e9 07 f5 ff ff       	jmp    801059ee <alltraps>

801064e7 <vector164>:
801064e7:	6a 00                	push   $0x0
801064e9:	68 a4 00 00 00       	push   $0xa4
801064ee:	e9 fb f4 ff ff       	jmp    801059ee <alltraps>

801064f3 <vector165>:
801064f3:	6a 00                	push   $0x0
801064f5:	68 a5 00 00 00       	push   $0xa5
801064fa:	e9 ef f4 ff ff       	jmp    801059ee <alltraps>

801064ff <vector166>:
801064ff:	6a 00                	push   $0x0
80106501:	68 a6 00 00 00       	push   $0xa6
80106506:	e9 e3 f4 ff ff       	jmp    801059ee <alltraps>

8010650b <vector167>:
8010650b:	6a 00                	push   $0x0
8010650d:	68 a7 00 00 00       	push   $0xa7
80106512:	e9 d7 f4 ff ff       	jmp    801059ee <alltraps>

80106517 <vector168>:
80106517:	6a 00                	push   $0x0
80106519:	68 a8 00 00 00       	push   $0xa8
8010651e:	e9 cb f4 ff ff       	jmp    801059ee <alltraps>

80106523 <vector169>:
80106523:	6a 00                	push   $0x0
80106525:	68 a9 00 00 00       	push   $0xa9
8010652a:	e9 bf f4 ff ff       	jmp    801059ee <alltraps>

8010652f <vector170>:
8010652f:	6a 00                	push   $0x0
80106531:	68 aa 00 00 00       	push   $0xaa
80106536:	e9 b3 f4 ff ff       	jmp    801059ee <alltraps>

8010653b <vector171>:
8010653b:	6a 00                	push   $0x0
8010653d:	68 ab 00 00 00       	push   $0xab
80106542:	e9 a7 f4 ff ff       	jmp    801059ee <alltraps>

80106547 <vector172>:
80106547:	6a 00                	push   $0x0
80106549:	68 ac 00 00 00       	push   $0xac
8010654e:	e9 9b f4 ff ff       	jmp    801059ee <alltraps>

80106553 <vector173>:
80106553:	6a 00                	push   $0x0
80106555:	68 ad 00 00 00       	push   $0xad
8010655a:	e9 8f f4 ff ff       	jmp    801059ee <alltraps>

8010655f <vector174>:
8010655f:	6a 00                	push   $0x0
80106561:	68 ae 00 00 00       	push   $0xae
80106566:	e9 83 f4 ff ff       	jmp    801059ee <alltraps>

8010656b <vector175>:
8010656b:	6a 00                	push   $0x0
8010656d:	68 af 00 00 00       	push   $0xaf
80106572:	e9 77 f4 ff ff       	jmp    801059ee <alltraps>

80106577 <vector176>:
80106577:	6a 00                	push   $0x0
80106579:	68 b0 00 00 00       	push   $0xb0
8010657e:	e9 6b f4 ff ff       	jmp    801059ee <alltraps>

80106583 <vector177>:
80106583:	6a 00                	push   $0x0
80106585:	68 b1 00 00 00       	push   $0xb1
8010658a:	e9 5f f4 ff ff       	jmp    801059ee <alltraps>

8010658f <vector178>:
8010658f:	6a 00                	push   $0x0
80106591:	68 b2 00 00 00       	push   $0xb2
80106596:	e9 53 f4 ff ff       	jmp    801059ee <alltraps>

8010659b <vector179>:
8010659b:	6a 00                	push   $0x0
8010659d:	68 b3 00 00 00       	push   $0xb3
801065a2:	e9 47 f4 ff ff       	jmp    801059ee <alltraps>

801065a7 <vector180>:
801065a7:	6a 00                	push   $0x0
801065a9:	68 b4 00 00 00       	push   $0xb4
801065ae:	e9 3b f4 ff ff       	jmp    801059ee <alltraps>

801065b3 <vector181>:
801065b3:	6a 00                	push   $0x0
801065b5:	68 b5 00 00 00       	push   $0xb5
801065ba:	e9 2f f4 ff ff       	jmp    801059ee <alltraps>

801065bf <vector182>:
801065bf:	6a 00                	push   $0x0
801065c1:	68 b6 00 00 00       	push   $0xb6
801065c6:	e9 23 f4 ff ff       	jmp    801059ee <alltraps>

801065cb <vector183>:
801065cb:	6a 00                	push   $0x0
801065cd:	68 b7 00 00 00       	push   $0xb7
801065d2:	e9 17 f4 ff ff       	jmp    801059ee <alltraps>

801065d7 <vector184>:
801065d7:	6a 00                	push   $0x0
801065d9:	68 b8 00 00 00       	push   $0xb8
801065de:	e9 0b f4 ff ff       	jmp    801059ee <alltraps>

801065e3 <vector185>:
801065e3:	6a 00                	push   $0x0
801065e5:	68 b9 00 00 00       	push   $0xb9
801065ea:	e9 ff f3 ff ff       	jmp    801059ee <alltraps>

801065ef <vector186>:
801065ef:	6a 00                	push   $0x0
801065f1:	68 ba 00 00 00       	push   $0xba
801065f6:	e9 f3 f3 ff ff       	jmp    801059ee <alltraps>

801065fb <vector187>:
801065fb:	6a 00                	push   $0x0
801065fd:	68 bb 00 00 00       	push   $0xbb
80106602:	e9 e7 f3 ff ff       	jmp    801059ee <alltraps>

80106607 <vector188>:
80106607:	6a 00                	push   $0x0
80106609:	68 bc 00 00 00       	push   $0xbc
8010660e:	e9 db f3 ff ff       	jmp    801059ee <alltraps>

80106613 <vector189>:
80106613:	6a 00                	push   $0x0
80106615:	68 bd 00 00 00       	push   $0xbd
8010661a:	e9 cf f3 ff ff       	jmp    801059ee <alltraps>

8010661f <vector190>:
8010661f:	6a 00                	push   $0x0
80106621:	68 be 00 00 00       	push   $0xbe
80106626:	e9 c3 f3 ff ff       	jmp    801059ee <alltraps>

8010662b <vector191>:
8010662b:	6a 00                	push   $0x0
8010662d:	68 bf 00 00 00       	push   $0xbf
80106632:	e9 b7 f3 ff ff       	jmp    801059ee <alltraps>

80106637 <vector192>:
80106637:	6a 00                	push   $0x0
80106639:	68 c0 00 00 00       	push   $0xc0
8010663e:	e9 ab f3 ff ff       	jmp    801059ee <alltraps>

80106643 <vector193>:
80106643:	6a 00                	push   $0x0
80106645:	68 c1 00 00 00       	push   $0xc1
8010664a:	e9 9f f3 ff ff       	jmp    801059ee <alltraps>

8010664f <vector194>:
8010664f:	6a 00                	push   $0x0
80106651:	68 c2 00 00 00       	push   $0xc2
80106656:	e9 93 f3 ff ff       	jmp    801059ee <alltraps>

8010665b <vector195>:
8010665b:	6a 00                	push   $0x0
8010665d:	68 c3 00 00 00       	push   $0xc3
80106662:	e9 87 f3 ff ff       	jmp    801059ee <alltraps>

80106667 <vector196>:
80106667:	6a 00                	push   $0x0
80106669:	68 c4 00 00 00       	push   $0xc4
8010666e:	e9 7b f3 ff ff       	jmp    801059ee <alltraps>

80106673 <vector197>:
80106673:	6a 00                	push   $0x0
80106675:	68 c5 00 00 00       	push   $0xc5
8010667a:	e9 6f f3 ff ff       	jmp    801059ee <alltraps>

8010667f <vector198>:
8010667f:	6a 00                	push   $0x0
80106681:	68 c6 00 00 00       	push   $0xc6
80106686:	e9 63 f3 ff ff       	jmp    801059ee <alltraps>

8010668b <vector199>:
8010668b:	6a 00                	push   $0x0
8010668d:	68 c7 00 00 00       	push   $0xc7
80106692:	e9 57 f3 ff ff       	jmp    801059ee <alltraps>

80106697 <vector200>:
80106697:	6a 00                	push   $0x0
80106699:	68 c8 00 00 00       	push   $0xc8
8010669e:	e9 4b f3 ff ff       	jmp    801059ee <alltraps>

801066a3 <vector201>:
801066a3:	6a 00                	push   $0x0
801066a5:	68 c9 00 00 00       	push   $0xc9
801066aa:	e9 3f f3 ff ff       	jmp    801059ee <alltraps>

801066af <vector202>:
801066af:	6a 00                	push   $0x0
801066b1:	68 ca 00 00 00       	push   $0xca
801066b6:	e9 33 f3 ff ff       	jmp    801059ee <alltraps>

801066bb <vector203>:
801066bb:	6a 00                	push   $0x0
801066bd:	68 cb 00 00 00       	push   $0xcb
801066c2:	e9 27 f3 ff ff       	jmp    801059ee <alltraps>

801066c7 <vector204>:
801066c7:	6a 00                	push   $0x0
801066c9:	68 cc 00 00 00       	push   $0xcc
801066ce:	e9 1b f3 ff ff       	jmp    801059ee <alltraps>

801066d3 <vector205>:
801066d3:	6a 00                	push   $0x0
801066d5:	68 cd 00 00 00       	push   $0xcd
801066da:	e9 0f f3 ff ff       	jmp    801059ee <alltraps>

801066df <vector206>:
801066df:	6a 00                	push   $0x0
801066e1:	68 ce 00 00 00       	push   $0xce
801066e6:	e9 03 f3 ff ff       	jmp    801059ee <alltraps>

801066eb <vector207>:
801066eb:	6a 00                	push   $0x0
801066ed:	68 cf 00 00 00       	push   $0xcf
801066f2:	e9 f7 f2 ff ff       	jmp    801059ee <alltraps>

801066f7 <vector208>:
801066f7:	6a 00                	push   $0x0
801066f9:	68 d0 00 00 00       	push   $0xd0
801066fe:	e9 eb f2 ff ff       	jmp    801059ee <alltraps>

80106703 <vector209>:
80106703:	6a 00                	push   $0x0
80106705:	68 d1 00 00 00       	push   $0xd1
8010670a:	e9 df f2 ff ff       	jmp    801059ee <alltraps>

8010670f <vector210>:
8010670f:	6a 00                	push   $0x0
80106711:	68 d2 00 00 00       	push   $0xd2
80106716:	e9 d3 f2 ff ff       	jmp    801059ee <alltraps>

8010671b <vector211>:
8010671b:	6a 00                	push   $0x0
8010671d:	68 d3 00 00 00       	push   $0xd3
80106722:	e9 c7 f2 ff ff       	jmp    801059ee <alltraps>

80106727 <vector212>:
80106727:	6a 00                	push   $0x0
80106729:	68 d4 00 00 00       	push   $0xd4
8010672e:	e9 bb f2 ff ff       	jmp    801059ee <alltraps>

80106733 <vector213>:
80106733:	6a 00                	push   $0x0
80106735:	68 d5 00 00 00       	push   $0xd5
8010673a:	e9 af f2 ff ff       	jmp    801059ee <alltraps>

8010673f <vector214>:
8010673f:	6a 00                	push   $0x0
80106741:	68 d6 00 00 00       	push   $0xd6
80106746:	e9 a3 f2 ff ff       	jmp    801059ee <alltraps>

8010674b <vector215>:
8010674b:	6a 00                	push   $0x0
8010674d:	68 d7 00 00 00       	push   $0xd7
80106752:	e9 97 f2 ff ff       	jmp    801059ee <alltraps>

80106757 <vector216>:
80106757:	6a 00                	push   $0x0
80106759:	68 d8 00 00 00       	push   $0xd8
8010675e:	e9 8b f2 ff ff       	jmp    801059ee <alltraps>

80106763 <vector217>:
80106763:	6a 00                	push   $0x0
80106765:	68 d9 00 00 00       	push   $0xd9
8010676a:	e9 7f f2 ff ff       	jmp    801059ee <alltraps>

8010676f <vector218>:
8010676f:	6a 00                	push   $0x0
80106771:	68 da 00 00 00       	push   $0xda
80106776:	e9 73 f2 ff ff       	jmp    801059ee <alltraps>

8010677b <vector219>:
8010677b:	6a 00                	push   $0x0
8010677d:	68 db 00 00 00       	push   $0xdb
80106782:	e9 67 f2 ff ff       	jmp    801059ee <alltraps>

80106787 <vector220>:
80106787:	6a 00                	push   $0x0
80106789:	68 dc 00 00 00       	push   $0xdc
8010678e:	e9 5b f2 ff ff       	jmp    801059ee <alltraps>

80106793 <vector221>:
80106793:	6a 00                	push   $0x0
80106795:	68 dd 00 00 00       	push   $0xdd
8010679a:	e9 4f f2 ff ff       	jmp    801059ee <alltraps>

8010679f <vector222>:
8010679f:	6a 00                	push   $0x0
801067a1:	68 de 00 00 00       	push   $0xde
801067a6:	e9 43 f2 ff ff       	jmp    801059ee <alltraps>

801067ab <vector223>:
801067ab:	6a 00                	push   $0x0
801067ad:	68 df 00 00 00       	push   $0xdf
801067b2:	e9 37 f2 ff ff       	jmp    801059ee <alltraps>

801067b7 <vector224>:
801067b7:	6a 00                	push   $0x0
801067b9:	68 e0 00 00 00       	push   $0xe0
801067be:	e9 2b f2 ff ff       	jmp    801059ee <alltraps>

801067c3 <vector225>:
801067c3:	6a 00                	push   $0x0
801067c5:	68 e1 00 00 00       	push   $0xe1
801067ca:	e9 1f f2 ff ff       	jmp    801059ee <alltraps>

801067cf <vector226>:
801067cf:	6a 00                	push   $0x0
801067d1:	68 e2 00 00 00       	push   $0xe2
801067d6:	e9 13 f2 ff ff       	jmp    801059ee <alltraps>

801067db <vector227>:
801067db:	6a 00                	push   $0x0
801067dd:	68 e3 00 00 00       	push   $0xe3
801067e2:	e9 07 f2 ff ff       	jmp    801059ee <alltraps>

801067e7 <vector228>:
801067e7:	6a 00                	push   $0x0
801067e9:	68 e4 00 00 00       	push   $0xe4
801067ee:	e9 fb f1 ff ff       	jmp    801059ee <alltraps>

801067f3 <vector229>:
801067f3:	6a 00                	push   $0x0
801067f5:	68 e5 00 00 00       	push   $0xe5
801067fa:	e9 ef f1 ff ff       	jmp    801059ee <alltraps>

801067ff <vector230>:
801067ff:	6a 00                	push   $0x0
80106801:	68 e6 00 00 00       	push   $0xe6
80106806:	e9 e3 f1 ff ff       	jmp    801059ee <alltraps>

8010680b <vector231>:
8010680b:	6a 00                	push   $0x0
8010680d:	68 e7 00 00 00       	push   $0xe7
80106812:	e9 d7 f1 ff ff       	jmp    801059ee <alltraps>

80106817 <vector232>:
80106817:	6a 00                	push   $0x0
80106819:	68 e8 00 00 00       	push   $0xe8
8010681e:	e9 cb f1 ff ff       	jmp    801059ee <alltraps>

80106823 <vector233>:
80106823:	6a 00                	push   $0x0
80106825:	68 e9 00 00 00       	push   $0xe9
8010682a:	e9 bf f1 ff ff       	jmp    801059ee <alltraps>

8010682f <vector234>:
8010682f:	6a 00                	push   $0x0
80106831:	68 ea 00 00 00       	push   $0xea
80106836:	e9 b3 f1 ff ff       	jmp    801059ee <alltraps>

8010683b <vector235>:
8010683b:	6a 00                	push   $0x0
8010683d:	68 eb 00 00 00       	push   $0xeb
80106842:	e9 a7 f1 ff ff       	jmp    801059ee <alltraps>

80106847 <vector236>:
80106847:	6a 00                	push   $0x0
80106849:	68 ec 00 00 00       	push   $0xec
8010684e:	e9 9b f1 ff ff       	jmp    801059ee <alltraps>

80106853 <vector237>:
80106853:	6a 00                	push   $0x0
80106855:	68 ed 00 00 00       	push   $0xed
8010685a:	e9 8f f1 ff ff       	jmp    801059ee <alltraps>

8010685f <vector238>:
8010685f:	6a 00                	push   $0x0
80106861:	68 ee 00 00 00       	push   $0xee
80106866:	e9 83 f1 ff ff       	jmp    801059ee <alltraps>

8010686b <vector239>:
8010686b:	6a 00                	push   $0x0
8010686d:	68 ef 00 00 00       	push   $0xef
80106872:	e9 77 f1 ff ff       	jmp    801059ee <alltraps>

80106877 <vector240>:
80106877:	6a 00                	push   $0x0
80106879:	68 f0 00 00 00       	push   $0xf0
8010687e:	e9 6b f1 ff ff       	jmp    801059ee <alltraps>

80106883 <vector241>:
80106883:	6a 00                	push   $0x0
80106885:	68 f1 00 00 00       	push   $0xf1
8010688a:	e9 5f f1 ff ff       	jmp    801059ee <alltraps>

8010688f <vector242>:
8010688f:	6a 00                	push   $0x0
80106891:	68 f2 00 00 00       	push   $0xf2
80106896:	e9 53 f1 ff ff       	jmp    801059ee <alltraps>

8010689b <vector243>:
8010689b:	6a 00                	push   $0x0
8010689d:	68 f3 00 00 00       	push   $0xf3
801068a2:	e9 47 f1 ff ff       	jmp    801059ee <alltraps>

801068a7 <vector244>:
801068a7:	6a 00                	push   $0x0
801068a9:	68 f4 00 00 00       	push   $0xf4
801068ae:	e9 3b f1 ff ff       	jmp    801059ee <alltraps>

801068b3 <vector245>:
801068b3:	6a 00                	push   $0x0
801068b5:	68 f5 00 00 00       	push   $0xf5
801068ba:	e9 2f f1 ff ff       	jmp    801059ee <alltraps>

801068bf <vector246>:
801068bf:	6a 00                	push   $0x0
801068c1:	68 f6 00 00 00       	push   $0xf6
801068c6:	e9 23 f1 ff ff       	jmp    801059ee <alltraps>

801068cb <vector247>:
801068cb:	6a 00                	push   $0x0
801068cd:	68 f7 00 00 00       	push   $0xf7
801068d2:	e9 17 f1 ff ff       	jmp    801059ee <alltraps>

801068d7 <vector248>:
801068d7:	6a 00                	push   $0x0
801068d9:	68 f8 00 00 00       	push   $0xf8
801068de:	e9 0b f1 ff ff       	jmp    801059ee <alltraps>

801068e3 <vector249>:
801068e3:	6a 00                	push   $0x0
801068e5:	68 f9 00 00 00       	push   $0xf9
801068ea:	e9 ff f0 ff ff       	jmp    801059ee <alltraps>

801068ef <vector250>:
801068ef:	6a 00                	push   $0x0
801068f1:	68 fa 00 00 00       	push   $0xfa
801068f6:	e9 f3 f0 ff ff       	jmp    801059ee <alltraps>

801068fb <vector251>:
801068fb:	6a 00                	push   $0x0
801068fd:	68 fb 00 00 00       	push   $0xfb
80106902:	e9 e7 f0 ff ff       	jmp    801059ee <alltraps>

80106907 <vector252>:
80106907:	6a 00                	push   $0x0
80106909:	68 fc 00 00 00       	push   $0xfc
8010690e:	e9 db f0 ff ff       	jmp    801059ee <alltraps>

80106913 <vector253>:
80106913:	6a 00                	push   $0x0
80106915:	68 fd 00 00 00       	push   $0xfd
8010691a:	e9 cf f0 ff ff       	jmp    801059ee <alltraps>

8010691f <vector254>:
8010691f:	6a 00                	push   $0x0
80106921:	68 fe 00 00 00       	push   $0xfe
80106926:	e9 c3 f0 ff ff       	jmp    801059ee <alltraps>

8010692b <vector255>:
8010692b:	6a 00                	push   $0x0
8010692d:	68 ff 00 00 00       	push   $0xff
80106932:	e9 b7 f0 ff ff       	jmp    801059ee <alltraps>
80106937:	66 90                	xchg   %ax,%ax
80106939:	66 90                	xchg   %ax,%ax
8010693b:	66 90                	xchg   %ax,%ax
8010693d:	66 90                	xchg   %ax,%ax
8010693f:	90                   	nop

80106940 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106940:	55                   	push   %ebp
80106941:	89 e5                	mov    %esp,%ebp
80106943:	57                   	push   %edi
80106944:	56                   	push   %esi
80106945:	53                   	push   %ebx
80106946:	89 d3                	mov    %edx,%ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80106948:	c1 ea 16             	shr    $0x16,%edx
8010694b:	8d 3c 90             	lea    (%eax,%edx,4),%edi
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
8010694e:	83 ec 0c             	sub    $0xc,%esp
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
80106951:	8b 07                	mov    (%edi),%eax
80106953:	a8 01                	test   $0x1,%al
80106955:	74 29                	je     80106980 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106957:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010695c:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
80106962:	8d 65 f4             	lea    -0xc(%ebp),%esp
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
80106965:	c1 eb 0a             	shr    $0xa,%ebx
80106968:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
8010696e:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
}
80106971:	5b                   	pop    %ebx
80106972:	5e                   	pop    %esi
80106973:	5f                   	pop    %edi
80106974:	5d                   	pop    %ebp
80106975:	c3                   	ret    
80106976:	8d 76 00             	lea    0x0(%esi),%esi
80106979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106980:	85 c9                	test   %ecx,%ecx
80106982:	74 2c                	je     801069b0 <walkpgdir+0x70>
80106984:	e8 f7 ba ff ff       	call   80102480 <kalloc>
80106989:	85 c0                	test   %eax,%eax
8010698b:	89 c6                	mov    %eax,%esi
8010698d:	74 21                	je     801069b0 <walkpgdir+0x70>
      return 0;
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
8010698f:	83 ec 04             	sub    $0x4,%esp
80106992:	68 00 10 00 00       	push   $0x1000
80106997:	6a 00                	push   $0x0
80106999:	50                   	push   %eax
8010699a:	e8 d1 dd ff ff       	call   80104770 <memset>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
8010699f:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
801069a5:	83 c4 10             	add    $0x10,%esp
801069a8:	83 c8 07             	or     $0x7,%eax
801069ab:	89 07                	mov    %eax,(%edi)
801069ad:	eb b3                	jmp    80106962 <walkpgdir+0x22>
801069af:	90                   	nop
  }
  return &pgtab[PTX(va)];
}
801069b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
      return 0;
801069b3:	31 c0                	xor    %eax,%eax
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
801069b5:	5b                   	pop    %ebx
801069b6:	5e                   	pop    %esi
801069b7:	5f                   	pop    %edi
801069b8:	5d                   	pop    %ebp
801069b9:	c3                   	ret    
801069ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801069c0 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
801069c0:	55                   	push   %ebp
801069c1:	89 e5                	mov    %esp,%ebp
801069c3:	57                   	push   %edi
801069c4:	56                   	push   %esi
801069c5:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
801069c6:	89 d3                	mov    %edx,%ebx
801069c8:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
801069ce:	83 ec 1c             	sub    $0x1c,%esp
801069d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
801069d4:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
801069d8:	8b 7d 08             	mov    0x8(%ebp),%edi
801069db:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801069e0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
801069e3:	8b 45 0c             	mov    0xc(%ebp),%eax
801069e6:	29 df                	sub    %ebx,%edi
801069e8:	83 c8 01             	or     $0x1,%eax
801069eb:	89 45 dc             	mov    %eax,-0x24(%ebp)
801069ee:	eb 15                	jmp    80106a05 <mappages+0x45>
  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
801069f0:	f6 00 01             	testb  $0x1,(%eax)
801069f3:	75 45                	jne    80106a3a <mappages+0x7a>
      panic("remap");
    *pte = pa | perm | PTE_P;
801069f5:	0b 75 dc             	or     -0x24(%ebp),%esi
    if(a == last)
801069f8:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
801069fb:	89 30                	mov    %esi,(%eax)
    if(a == last)
801069fd:	74 31                	je     80106a30 <mappages+0x70>
      break;
    a += PGSIZE;
801069ff:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106a05:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106a08:	b9 01 00 00 00       	mov    $0x1,%ecx
80106a0d:	89 da                	mov    %ebx,%edx
80106a0f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106a12:	e8 29 ff ff ff       	call   80106940 <walkpgdir>
80106a17:	85 c0                	test   %eax,%eax
80106a19:	75 d5                	jne    801069f0 <mappages+0x30>
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
80106a1b:	8d 65 f4             	lea    -0xc(%ebp),%esp

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
80106a1e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
80106a23:	5b                   	pop    %ebx
80106a24:	5e                   	pop    %esi
80106a25:	5f                   	pop    %edi
80106a26:	5d                   	pop    %ebp
80106a27:	c3                   	ret    
80106a28:	90                   	nop
80106a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106a30:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
80106a33:	31 c0                	xor    %eax,%eax
}
80106a35:	5b                   	pop    %ebx
80106a36:	5e                   	pop    %esi
80106a37:	5f                   	pop    %edi
80106a38:	5d                   	pop    %ebp
80106a39:	c3                   	ret    
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
80106a3a:	83 ec 0c             	sub    $0xc,%esp
80106a3d:	68 d0 7b 10 80       	push   $0x80107bd0
80106a42:	e8 29 99 ff ff       	call   80100370 <panic>
80106a47:	89 f6                	mov    %esi,%esi
80106a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a50 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106a50:	55                   	push   %ebp
80106a51:	89 e5                	mov    %esp,%ebp
80106a53:	57                   	push   %edi
80106a54:	56                   	push   %esi
80106a55:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106a56:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106a5c:	89 c7                	mov    %eax,%edi
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106a5e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106a64:	83 ec 1c             	sub    $0x1c,%esp
80106a67:	89 4d e0             	mov    %ecx,-0x20(%ebp)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106a6a:	39 d3                	cmp    %edx,%ebx
80106a6c:	73 66                	jae    80106ad4 <deallocuvm.part.0+0x84>
80106a6e:	89 d6                	mov    %edx,%esi
80106a70:	eb 3d                	jmp    80106aaf <deallocuvm.part.0+0x5f>
80106a72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
80106a78:	8b 10                	mov    (%eax),%edx
80106a7a:	f6 c2 01             	test   $0x1,%dl
80106a7d:	74 26                	je     80106aa5 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
80106a7f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106a85:	74 58                	je     80106adf <deallocuvm.part.0+0x8f>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
80106a87:	83 ec 0c             	sub    $0xc,%esp
80106a8a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106a90:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106a93:	52                   	push   %edx
80106a94:	e8 37 b8 ff ff       	call   801022d0 <kfree>
      *pte = 0;
80106a99:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106a9c:	83 c4 10             	add    $0x10,%esp
80106a9f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106aa5:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106aab:	39 f3                	cmp    %esi,%ebx
80106aad:	73 25                	jae    80106ad4 <deallocuvm.part.0+0x84>
    pte = walkpgdir(pgdir, (char*)a, 0);
80106aaf:	31 c9                	xor    %ecx,%ecx
80106ab1:	89 da                	mov    %ebx,%edx
80106ab3:	89 f8                	mov    %edi,%eax
80106ab5:	e8 86 fe ff ff       	call   80106940 <walkpgdir>
    if(!pte)
80106aba:	85 c0                	test   %eax,%eax
80106abc:	75 ba                	jne    80106a78 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
80106abe:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106ac4:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106aca:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106ad0:	39 f3                	cmp    %esi,%ebx
80106ad2:	72 db                	jb     80106aaf <deallocuvm.part.0+0x5f>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106ad4:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106ad7:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ada:	5b                   	pop    %ebx
80106adb:	5e                   	pop    %esi
80106adc:	5f                   	pop    %edi
80106add:	5d                   	pop    %ebp
80106ade:	c3                   	ret    
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
      pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
80106adf:	83 ec 0c             	sub    $0xc,%esp
80106ae2:	68 12 75 10 80       	push   $0x80107512
80106ae7:	e8 84 98 ff ff       	call   80100370 <panic>
80106aec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106af0 <seginit>:

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106af0:	55                   	push   %ebp
80106af1:	89 e5                	mov    %esp,%ebp
80106af3:	53                   	push   %ebx
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106af4:	31 db                	xor    %ebx,%ebx

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106af6:	83 ec 14             	sub    $0x14,%esp

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
80106af9:	e8 e2 bb ff ff       	call   801026e0 <cpunum>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106afe:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80106b04:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80106b09:	8d 90 a0 27 11 80    	lea    -0x7feed860(%eax),%edx
80106b0f:	c6 80 1d 28 11 80 9a 	movb   $0x9a,-0x7feed7e3(%eax)
80106b16:	c6 80 1e 28 11 80 cf 	movb   $0xcf,-0x7feed7e2(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106b1d:	c6 80 25 28 11 80 92 	movb   $0x92,-0x7feed7db(%eax)
80106b24:	c6 80 26 28 11 80 cf 	movb   $0xcf,-0x7feed7da(%eax)
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106b2b:	66 89 4a 78          	mov    %cx,0x78(%edx)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106b2f:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106b34:	66 89 5a 7a          	mov    %bx,0x7a(%edx)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106b38:	66 89 8a 80 00 00 00 	mov    %cx,0x80(%edx)
80106b3f:	31 db                	xor    %ebx,%ebx
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106b41:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106b46:	66 89 9a 82 00 00 00 	mov    %bx,0x82(%edx)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106b4d:	66 89 8a 90 00 00 00 	mov    %cx,0x90(%edx)
80106b54:	31 db                	xor    %ebx,%ebx
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106b56:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106b5b:	66 89 9a 92 00 00 00 	mov    %bx,0x92(%edx)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106b62:	31 db                	xor    %ebx,%ebx
80106b64:	66 89 8a 98 00 00 00 	mov    %cx,0x98(%edx)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106b6b:	8d 88 54 28 11 80    	lea    -0x7feed7ac(%eax),%ecx
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106b71:	66 89 9a 9a 00 00 00 	mov    %bx,0x9a(%edx)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106b78:	31 db                	xor    %ebx,%ebx
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106b7a:	c6 80 35 28 11 80 fa 	movb   $0xfa,-0x7feed7cb(%eax)
80106b81:	c6 80 36 28 11 80 cf 	movb   $0xcf,-0x7feed7ca(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106b88:	66 89 9a 88 00 00 00 	mov    %bx,0x88(%edx)
80106b8f:	66 89 8a 8a 00 00 00 	mov    %cx,0x8a(%edx)
80106b96:	89 cb                	mov    %ecx,%ebx
80106b98:	c1 e9 18             	shr    $0x18,%ecx
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106b9b:	c6 80 3d 28 11 80 f2 	movb   $0xf2,-0x7feed7c3(%eax)
80106ba2:	c6 80 3e 28 11 80 cf 	movb   $0xcf,-0x7feed7c2(%eax)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106ba9:	88 8a 8f 00 00 00    	mov    %cl,0x8f(%edx)
80106baf:	c6 80 2d 28 11 80 92 	movb   $0x92,-0x7feed7d3(%eax)
static inline void
lgdt(struct segdesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80106bb6:	b9 37 00 00 00       	mov    $0x37,%ecx
80106bbb:	c6 80 2e 28 11 80 c0 	movb   $0xc0,-0x7feed7d2(%eax)

  lgdt(c->gdt, sizeof(c->gdt));
80106bc2:	05 10 28 11 80       	add    $0x80112810,%eax
80106bc7:	66 89 4d f2          	mov    %cx,-0xe(%ebp)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106bcb:	c1 eb 10             	shr    $0x10,%ebx
  pd[1] = (uint)p;
80106bce:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106bd2:	c1 e8 10             	shr    $0x10,%eax
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106bd5:	c6 42 7c 00          	movb   $0x0,0x7c(%edx)
80106bd9:	c6 42 7f 00          	movb   $0x0,0x7f(%edx)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106bdd:	c6 82 84 00 00 00 00 	movb   $0x0,0x84(%edx)
80106be4:	c6 82 87 00 00 00 00 	movb   $0x0,0x87(%edx)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106beb:	c6 82 94 00 00 00 00 	movb   $0x0,0x94(%edx)
80106bf2:	c6 82 97 00 00 00 00 	movb   $0x0,0x97(%edx)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106bf9:	c6 82 9c 00 00 00 00 	movb   $0x0,0x9c(%edx)
80106c00:	c6 82 9f 00 00 00 00 	movb   $0x0,0x9f(%edx)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106c07:	88 9a 8c 00 00 00    	mov    %bl,0x8c(%edx)
80106c0d:	66 89 45 f6          	mov    %ax,-0xa(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
80106c11:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106c14:	0f 01 10             	lgdtl  (%eax)
}

static inline void
loadgs(ushort v)
{
  asm volatile("movw %0, %%gs" : : "r" (v));
80106c17:	b8 18 00 00 00       	mov    $0x18,%eax
80106c1c:	8e e8                	mov    %eax,%gs
  lgdt(c->gdt, sizeof(c->gdt));
  loadgs(SEG_KCPU << 3);

  // Initialize cpu-local storage.
  cpu = c;
  proc = 0;
80106c1e:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80106c25:	00 00 00 00 

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
80106c29:	65 89 15 00 00 00 00 	mov    %edx,%gs:0x0
  loadgs(SEG_KCPU << 3);

  // Initialize cpu-local storage.
  cpu = c;
  proc = 0;
}
80106c30:	83 c4 14             	add    $0x14,%esp
80106c33:	5b                   	pop    %ebx
80106c34:	5d                   	pop    %ebp
80106c35:	c3                   	ret    
80106c36:	8d 76 00             	lea    0x0(%esi),%esi
80106c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106c40 <setupkvm>:
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
80106c40:	55                   	push   %ebp
80106c41:	89 e5                	mov    %esp,%ebp
80106c43:	56                   	push   %esi
80106c44:	53                   	push   %ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
80106c45:	e8 36 b8 ff ff       	call   80102480 <kalloc>
80106c4a:	85 c0                	test   %eax,%eax
80106c4c:	74 52                	je     80106ca0 <setupkvm+0x60>
    return 0;
  memset(pgdir, 0, PGSIZE);
80106c4e:	83 ec 04             	sub    $0x4,%esp
80106c51:	89 c6                	mov    %eax,%esi
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106c53:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
80106c58:	68 00 10 00 00       	push   $0x1000
80106c5d:	6a 00                	push   $0x0
80106c5f:	50                   	push   %eax
80106c60:	e8 0b db ff ff       	call   80104770 <memset>
80106c65:	83 c4 10             	add    $0x10,%esp
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106c68:	8b 43 04             	mov    0x4(%ebx),%eax
80106c6b:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106c6e:	83 ec 08             	sub    $0x8,%esp
80106c71:	8b 13                	mov    (%ebx),%edx
80106c73:	ff 73 0c             	pushl  0xc(%ebx)
80106c76:	50                   	push   %eax
80106c77:	29 c1                	sub    %eax,%ecx
80106c79:	89 f0                	mov    %esi,%eax
80106c7b:	e8 40 fd ff ff       	call   801069c0 <mappages>
80106c80:	83 c4 10             	add    $0x10,%esp
80106c83:	85 c0                	test   %eax,%eax
80106c85:	78 19                	js     80106ca0 <setupkvm+0x60>
  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106c87:	83 c3 10             	add    $0x10,%ebx
80106c8a:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106c90:	75 d6                	jne    80106c68 <setupkvm+0x28>
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0)
      return 0;
  return pgdir;
}
80106c92:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106c95:	89 f0                	mov    %esi,%eax
80106c97:	5b                   	pop    %ebx
80106c98:	5e                   	pop    %esi
80106c99:	5d                   	pop    %ebp
80106c9a:	c3                   	ret    
80106c9b:	90                   	nop
80106c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106ca0:	8d 65 f8             	lea    -0x8(%ebp),%esp
{
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
80106ca3:	31 c0                	xor    %eax,%eax
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0)
      return 0;
  return pgdir;
}
80106ca5:	5b                   	pop    %ebx
80106ca6:	5e                   	pop    %esi
80106ca7:	5d                   	pop    %ebp
80106ca8:	c3                   	ret    
80106ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106cb0 <kvmalloc>:

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
80106cb0:	55                   	push   %ebp
80106cb1:	89 e5                	mov    %esp,%ebp
80106cb3:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80106cb6:	e8 85 ff ff ff       	call   80106c40 <setupkvm>
80106cbb:	a3 e4 55 11 80       	mov    %eax,0x801155e4
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106cc0:	05 00 00 00 80       	add    $0x80000000,%eax
80106cc5:	0f 22 d8             	mov    %eax,%cr3
  switchkvm();
}
80106cc8:	c9                   	leave  
80106cc9:	c3                   	ret    
80106cca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106cd0 <switchkvm>:
80106cd0:	a1 e4 55 11 80       	mov    0x801155e4,%eax

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
80106cd5:	55                   	push   %ebp
80106cd6:	89 e5                	mov    %esp,%ebp
80106cd8:	05 00 00 00 80       	add    $0x80000000,%eax
80106cdd:	0f 22 d8             	mov    %eax,%cr3
  lcr3(V2P(kpgdir));   // switch to the kernel page table
}
80106ce0:	5d                   	pop    %ebp
80106ce1:	c3                   	ret    
80106ce2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106cf0 <switchuvm>:

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
80106cf0:	55                   	push   %ebp
80106cf1:	89 e5                	mov    %esp,%ebp
80106cf3:	53                   	push   %ebx
80106cf4:	83 ec 04             	sub    $0x4,%esp
80106cf7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(p == 0)
80106cfa:	85 db                	test   %ebx,%ebx
80106cfc:	0f 84 93 00 00 00    	je     80106d95 <switchuvm+0xa5>
    panic("switchuvm: no process");
  if(p->kstack == 0)
80106d02:	8b 43 08             	mov    0x8(%ebx),%eax
80106d05:	85 c0                	test   %eax,%eax
80106d07:	0f 84 a2 00 00 00    	je     80106daf <switchuvm+0xbf>
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
80106d0d:	8b 43 04             	mov    0x4(%ebx),%eax
80106d10:	85 c0                	test   %eax,%eax
80106d12:	0f 84 8a 00 00 00    	je     80106da2 <switchuvm+0xb2>
    panic("switchuvm: no pgdir");

  pushcli();
80106d18:	e8 83 d9 ff ff       	call   801046a0 <pushcli>
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106d1d:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80106d23:	b9 67 00 00 00       	mov    $0x67,%ecx
80106d28:	8d 50 08             	lea    0x8(%eax),%edx
80106d2b:	66 89 88 a0 00 00 00 	mov    %cx,0xa0(%eax)
80106d32:	c6 80 a6 00 00 00 40 	movb   $0x40,0xa6(%eax)
  cpu->gdt[SEG_TSS].s = 0;
80106d39:	c6 80 a5 00 00 00 89 	movb   $0x89,0xa5(%eax)
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");

  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106d40:	66 89 90 a2 00 00 00 	mov    %dx,0xa2(%eax)
80106d47:	89 d1                	mov    %edx,%ecx
80106d49:	c1 ea 18             	shr    $0x18,%edx
80106d4c:	88 90 a7 00 00 00    	mov    %dl,0xa7(%eax)
80106d52:	c1 e9 10             	shr    $0x10,%ecx
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
80106d55:	ba 10 00 00 00       	mov    $0x10,%edx
80106d5a:	66 89 50 10          	mov    %dx,0x10(%eax)
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");

  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106d5e:	88 88 a4 00 00 00    	mov    %cl,0xa4(%eax)
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
  cpu->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106d64:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106d67:	8d 91 00 10 00 00    	lea    0x1000(%ecx),%edx
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
80106d6d:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80106d72:	66 89 48 6e          	mov    %cx,0x6e(%eax)

  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
  cpu->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106d76:	89 50 0c             	mov    %edx,0xc(%eax)
}

static inline void
ltr(ushort sel)
{
  asm volatile("ltr %0" : : "r" (sel));
80106d79:	b8 30 00 00 00       	mov    $0x30,%eax
80106d7e:	0f 00 d8             	ltr    %ax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106d81:	8b 43 04             	mov    0x4(%ebx),%eax
80106d84:	05 00 00 00 80       	add    $0x80000000,%eax
80106d89:	0f 22 d8             	mov    %eax,%cr3
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
}
80106d8c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80106d8f:	c9                   	leave  
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
80106d90:	e9 3b d9 ff ff       	jmp    801046d0 <popcli>
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
80106d95:	83 ec 0c             	sub    $0xc,%esp
80106d98:	68 d6 7b 10 80       	push   $0x80107bd6
80106d9d:	e8 ce 95 ff ff       	call   80100370 <panic>
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");
80106da2:	83 ec 0c             	sub    $0xc,%esp
80106da5:	68 01 7c 10 80       	push   $0x80107c01
80106daa:	e8 c1 95 ff ff       	call   80100370 <panic>
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
80106daf:	83 ec 0c             	sub    $0xc,%esp
80106db2:	68 ec 7b 10 80       	push   $0x80107bec
80106db7:	e8 b4 95 ff ff       	call   80100370 <panic>
80106dbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106dc0 <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106dc0:	55                   	push   %ebp
80106dc1:	89 e5                	mov    %esp,%ebp
80106dc3:	57                   	push   %edi
80106dc4:	56                   	push   %esi
80106dc5:	53                   	push   %ebx
80106dc6:	83 ec 1c             	sub    $0x1c,%esp
80106dc9:	8b 75 10             	mov    0x10(%ebp),%esi
80106dcc:	8b 45 08             	mov    0x8(%ebp),%eax
80106dcf:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *mem;

  if(sz >= PGSIZE)
80106dd2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106dd8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *mem;

  if(sz >= PGSIZE)
80106ddb:	77 49                	ja     80106e26 <inituvm+0x66>
    panic("inituvm: more than a page");
  mem = kalloc();
80106ddd:	e8 9e b6 ff ff       	call   80102480 <kalloc>
  memset(mem, 0, PGSIZE);
80106de2:	83 ec 04             	sub    $0x4,%esp
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
80106de5:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106de7:	68 00 10 00 00       	push   $0x1000
80106dec:	6a 00                	push   $0x0
80106dee:	50                   	push   %eax
80106def:	e8 7c d9 ff ff       	call   80104770 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106df4:	58                   	pop    %eax
80106df5:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106dfb:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106e00:	5a                   	pop    %edx
80106e01:	6a 06                	push   $0x6
80106e03:	50                   	push   %eax
80106e04:	31 d2                	xor    %edx,%edx
80106e06:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106e09:	e8 b2 fb ff ff       	call   801069c0 <mappages>
  memmove(mem, init, sz);
80106e0e:	89 75 10             	mov    %esi,0x10(%ebp)
80106e11:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106e14:	83 c4 10             	add    $0x10,%esp
80106e17:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106e1a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e1d:	5b                   	pop    %ebx
80106e1e:	5e                   	pop    %esi
80106e1f:	5f                   	pop    %edi
80106e20:	5d                   	pop    %ebp
  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
80106e21:	e9 fa d9 ff ff       	jmp    80104820 <memmove>
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
80106e26:	83 ec 0c             	sub    $0xc,%esp
80106e29:	68 15 7c 10 80       	push   $0x80107c15
80106e2e:	e8 3d 95 ff ff       	call   80100370 <panic>
80106e33:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106e39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106e40 <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
80106e40:	55                   	push   %ebp
80106e41:	89 e5                	mov    %esp,%ebp
80106e43:	57                   	push   %edi
80106e44:	56                   	push   %esi
80106e45:	53                   	push   %ebx
80106e46:	83 ec 0c             	sub    $0xc,%esp
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
80106e49:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106e50:	0f 85 91 00 00 00    	jne    80106ee7 <loaduvm+0xa7>
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
80106e56:	8b 75 18             	mov    0x18(%ebp),%esi
80106e59:	31 db                	xor    %ebx,%ebx
80106e5b:	85 f6                	test   %esi,%esi
80106e5d:	75 1a                	jne    80106e79 <loaduvm+0x39>
80106e5f:	eb 6f                	jmp    80106ed0 <loaduvm+0x90>
80106e61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e68:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106e6e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106e74:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106e77:	76 57                	jbe    80106ed0 <loaduvm+0x90>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106e79:	8b 55 0c             	mov    0xc(%ebp),%edx
80106e7c:	8b 45 08             	mov    0x8(%ebp),%eax
80106e7f:	31 c9                	xor    %ecx,%ecx
80106e81:	01 da                	add    %ebx,%edx
80106e83:	e8 b8 fa ff ff       	call   80106940 <walkpgdir>
80106e88:	85 c0                	test   %eax,%eax
80106e8a:	74 4e                	je     80106eda <loaduvm+0x9a>
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106e8c:	8b 00                	mov    (%eax),%eax
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106e8e:	8b 4d 14             	mov    0x14(%ebp),%ecx
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
    if(sz - i < PGSIZE)
80106e91:	bf 00 10 00 00       	mov    $0x1000,%edi
  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106e96:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106e9b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106ea1:	0f 46 fe             	cmovbe %esi,%edi
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106ea4:	01 d9                	add    %ebx,%ecx
80106ea6:	05 00 00 00 80       	add    $0x80000000,%eax
80106eab:	57                   	push   %edi
80106eac:	51                   	push   %ecx
80106ead:	50                   	push   %eax
80106eae:	ff 75 10             	pushl  0x10(%ebp)
80106eb1:	e8 6a aa ff ff       	call   80101920 <readi>
80106eb6:	83 c4 10             	add    $0x10,%esp
80106eb9:	39 c7                	cmp    %eax,%edi
80106ebb:	74 ab                	je     80106e68 <loaduvm+0x28>
      return -1;
  }
  return 0;
}
80106ebd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
80106ec0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return 0;
}
80106ec5:	5b                   	pop    %ebx
80106ec6:	5e                   	pop    %esi
80106ec7:	5f                   	pop    %edi
80106ec8:	5d                   	pop    %ebp
80106ec9:	c3                   	ret    
80106eca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106ed0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
80106ed3:	31 c0                	xor    %eax,%eax
}
80106ed5:	5b                   	pop    %ebx
80106ed6:	5e                   	pop    %esi
80106ed7:	5f                   	pop    %edi
80106ed8:	5d                   	pop    %ebp
80106ed9:	c3                   	ret    

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
80106eda:	83 ec 0c             	sub    $0xc,%esp
80106edd:	68 2f 7c 10 80       	push   $0x80107c2f
80106ee2:	e8 89 94 ff ff       	call   80100370 <panic>
{
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
80106ee7:	83 ec 0c             	sub    $0xc,%esp
80106eea:	68 d0 7c 10 80       	push   $0x80107cd0
80106eef:	e8 7c 94 ff ff       	call   80100370 <panic>
80106ef4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106efa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106f00 <allocuvm>:

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106f00:	55                   	push   %ebp
80106f01:	89 e5                	mov    %esp,%ebp
80106f03:	57                   	push   %edi
80106f04:	56                   	push   %esi
80106f05:	53                   	push   %ebx
80106f06:	83 ec 0c             	sub    $0xc,%esp
80106f09:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
80106f0c:	85 ff                	test   %edi,%edi
80106f0e:	0f 88 ca 00 00 00    	js     80106fde <allocuvm+0xde>
    return 0;
  if(newsz < oldsz)
80106f14:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    return oldsz;
80106f17:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
    return 0;
  if(newsz < oldsz)
80106f1a:	0f 82 82 00 00 00    	jb     80106fa2 <allocuvm+0xa2>
    return oldsz;

  a = PGROUNDUP(oldsz);
80106f20:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106f26:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80106f2c:	39 df                	cmp    %ebx,%edi
80106f2e:	77 43                	ja     80106f73 <allocuvm+0x73>
80106f30:	e9 bb 00 00 00       	jmp    80106ff0 <allocuvm+0xf0>
80106f35:	8d 76 00             	lea    0x0(%esi),%esi
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
80106f38:	83 ec 04             	sub    $0x4,%esp
80106f3b:	68 00 10 00 00       	push   $0x1000
80106f40:	6a 00                	push   $0x0
80106f42:	50                   	push   %eax
80106f43:	e8 28 d8 ff ff       	call   80104770 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106f48:	58                   	pop    %eax
80106f49:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106f4f:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106f54:	5a                   	pop    %edx
80106f55:	6a 06                	push   $0x6
80106f57:	50                   	push   %eax
80106f58:	89 da                	mov    %ebx,%edx
80106f5a:	8b 45 08             	mov    0x8(%ebp),%eax
80106f5d:	e8 5e fa ff ff       	call   801069c0 <mappages>
80106f62:	83 c4 10             	add    $0x10,%esp
80106f65:	85 c0                	test   %eax,%eax
80106f67:	78 47                	js     80106fb0 <allocuvm+0xb0>
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106f69:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106f6f:	39 df                	cmp    %ebx,%edi
80106f71:	76 7d                	jbe    80106ff0 <allocuvm+0xf0>
    mem = kalloc();
80106f73:	e8 08 b5 ff ff       	call   80102480 <kalloc>
    if(mem == 0){
80106f78:	85 c0                	test   %eax,%eax
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
80106f7a:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80106f7c:	75 ba                	jne    80106f38 <allocuvm+0x38>
      cprintf("allocuvm out of memory\n");
80106f7e:	83 ec 0c             	sub    $0xc,%esp
80106f81:	68 4d 7c 10 80       	push   $0x80107c4d
80106f86:	e8 d5 96 ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106f8b:	83 c4 10             	add    $0x10,%esp
80106f8e:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106f91:	76 4b                	jbe    80106fde <allocuvm+0xde>
80106f93:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106f96:	8b 45 08             	mov    0x8(%ebp),%eax
80106f99:	89 fa                	mov    %edi,%edx
80106f9b:	e8 b0 fa ff ff       	call   80106a50 <deallocuvm.part.0>
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
80106fa0:	31 c0                	xor    %eax,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80106fa2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106fa5:	5b                   	pop    %ebx
80106fa6:	5e                   	pop    %esi
80106fa7:	5f                   	pop    %edi
80106fa8:	5d                   	pop    %ebp
80106fa9:	c3                   	ret    
80106faa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
80106fb0:	83 ec 0c             	sub    $0xc,%esp
80106fb3:	68 65 7c 10 80       	push   $0x80107c65
80106fb8:	e8 a3 96 ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106fbd:	83 c4 10             	add    $0x10,%esp
80106fc0:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106fc3:	76 0d                	jbe    80106fd2 <allocuvm+0xd2>
80106fc5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106fc8:	8b 45 08             	mov    0x8(%ebp),%eax
80106fcb:	89 fa                	mov    %edi,%edx
80106fcd:	e8 7e fa ff ff       	call   80106a50 <deallocuvm.part.0>
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
80106fd2:	83 ec 0c             	sub    $0xc,%esp
80106fd5:	56                   	push   %esi
80106fd6:	e8 f5 b2 ff ff       	call   801022d0 <kfree>
      return 0;
80106fdb:	83 c4 10             	add    $0x10,%esp
    }
  }
  return newsz;
}
80106fde:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
      return 0;
80106fe1:	31 c0                	xor    %eax,%eax
    }
  }
  return newsz;
}
80106fe3:	5b                   	pop    %ebx
80106fe4:	5e                   	pop    %esi
80106fe5:	5f                   	pop    %edi
80106fe6:	5d                   	pop    %ebp
80106fe7:	c3                   	ret    
80106fe8:	90                   	nop
80106fe9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ff0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106ff3:	89 f8                	mov    %edi,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80106ff5:	5b                   	pop    %ebx
80106ff6:	5e                   	pop    %esi
80106ff7:	5f                   	pop    %edi
80106ff8:	5d                   	pop    %ebp
80106ff9:	c3                   	ret    
80106ffa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80107000 <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80107000:	55                   	push   %ebp
80107001:	89 e5                	mov    %esp,%ebp
80107003:	8b 55 0c             	mov    0xc(%ebp),%edx
80107006:	8b 4d 10             	mov    0x10(%ebp),%ecx
80107009:	8b 45 08             	mov    0x8(%ebp),%eax
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
8010700c:	39 d1                	cmp    %edx,%ecx
8010700e:	73 10                	jae    80107020 <deallocuvm+0x20>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80107010:	5d                   	pop    %ebp
80107011:	e9 3a fa ff ff       	jmp    80106a50 <deallocuvm.part.0>
80107016:	8d 76 00             	lea    0x0(%esi),%esi
80107019:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107020:	89 d0                	mov    %edx,%eax
80107022:	5d                   	pop    %ebp
80107023:	c3                   	ret    
80107024:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010702a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107030 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80107030:	55                   	push   %ebp
80107031:	89 e5                	mov    %esp,%ebp
80107033:	57                   	push   %edi
80107034:	56                   	push   %esi
80107035:	53                   	push   %ebx
80107036:	83 ec 0c             	sub    $0xc,%esp
80107039:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
8010703c:	85 f6                	test   %esi,%esi
8010703e:	74 59                	je     80107099 <freevm+0x69>
80107040:	31 c9                	xor    %ecx,%ecx
80107042:	ba 00 00 00 80       	mov    $0x80000000,%edx
80107047:	89 f0                	mov    %esi,%eax
80107049:	e8 02 fa ff ff       	call   80106a50 <deallocuvm.part.0>
8010704e:	89 f3                	mov    %esi,%ebx
80107050:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80107056:	eb 0f                	jmp    80107067 <freevm+0x37>
80107058:	90                   	nop
80107059:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107060:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80107063:	39 fb                	cmp    %edi,%ebx
80107065:	74 23                	je     8010708a <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80107067:	8b 03                	mov    (%ebx),%eax
80107069:	a8 01                	test   $0x1,%al
8010706b:	74 f3                	je     80107060 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
8010706d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107072:	83 ec 0c             	sub    $0xc,%esp
80107075:	83 c3 04             	add    $0x4,%ebx
80107078:	05 00 00 00 80       	add    $0x80000000,%eax
8010707d:	50                   	push   %eax
8010707e:	e8 4d b2 ff ff       	call   801022d0 <kfree>
80107083:	83 c4 10             	add    $0x10,%esp
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80107086:	39 fb                	cmp    %edi,%ebx
80107088:	75 dd                	jne    80107067 <freevm+0x37>
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
8010708a:	89 75 08             	mov    %esi,0x8(%ebp)
}
8010708d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107090:	5b                   	pop    %ebx
80107091:	5e                   	pop    %esi
80107092:	5f                   	pop    %edi
80107093:	5d                   	pop    %ebp
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80107094:	e9 37 b2 ff ff       	jmp    801022d0 <kfree>
freevm(pde_t *pgdir)
{
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
80107099:	83 ec 0c             	sub    $0xc,%esp
8010709c:	68 81 7c 10 80       	push   $0x80107c81
801070a1:	e8 ca 92 ff ff       	call   80100370 <panic>
801070a6:	8d 76 00             	lea    0x0(%esi),%esi
801070a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801070b0 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
801070b0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801070b1:	31 c9                	xor    %ecx,%ecx

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
801070b3:	89 e5                	mov    %esp,%ebp
801070b5:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801070b8:	8b 55 0c             	mov    0xc(%ebp),%edx
801070bb:	8b 45 08             	mov    0x8(%ebp),%eax
801070be:	e8 7d f8 ff ff       	call   80106940 <walkpgdir>
  if(pte == 0)
801070c3:	85 c0                	test   %eax,%eax
801070c5:	74 05                	je     801070cc <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
801070c7:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
801070ca:	c9                   	leave  
801070cb:	c3                   	ret    
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("clearpteu");
801070cc:	83 ec 0c             	sub    $0xc,%esp
801070cf:	68 92 7c 10 80       	push   $0x80107c92
801070d4:	e8 97 92 ff ff       	call   80100370 <panic>
801070d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801070e0 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
801070e0:	55                   	push   %ebp
801070e1:	89 e5                	mov    %esp,%ebp
801070e3:	57                   	push   %edi
801070e4:	56                   	push   %esi
801070e5:	53                   	push   %ebx
801070e6:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
801070e9:	e8 52 fb ff ff       	call   80106c40 <setupkvm>
801070ee:	85 c0                	test   %eax,%eax
801070f0:	89 45 e0             	mov    %eax,-0x20(%ebp)
801070f3:	0f 84 b2 00 00 00    	je     801071ab <copyuvm+0xcb>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
801070f9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801070fc:	85 c9                	test   %ecx,%ecx
801070fe:	0f 84 9c 00 00 00    	je     801071a0 <copyuvm+0xc0>
80107104:	31 f6                	xor    %esi,%esi
80107106:	eb 4a                	jmp    80107152 <copyuvm+0x72>
80107108:	90                   	nop
80107109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80107110:	83 ec 04             	sub    $0x4,%esp
80107113:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80107119:	68 00 10 00 00       	push   $0x1000
8010711e:	57                   	push   %edi
8010711f:	50                   	push   %eax
80107120:	e8 fb d6 ff ff       	call   80104820 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
80107125:	58                   	pop    %eax
80107126:	5a                   	pop    %edx
80107127:	8d 93 00 00 00 80    	lea    -0x80000000(%ebx),%edx
8010712d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80107130:	ff 75 e4             	pushl  -0x1c(%ebp)
80107133:	b9 00 10 00 00       	mov    $0x1000,%ecx
80107138:	52                   	push   %edx
80107139:	89 f2                	mov    %esi,%edx
8010713b:	e8 80 f8 ff ff       	call   801069c0 <mappages>
80107140:	83 c4 10             	add    $0x10,%esp
80107143:	85 c0                	test   %eax,%eax
80107145:	78 3e                	js     80107185 <copyuvm+0xa5>
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80107147:	81 c6 00 10 00 00    	add    $0x1000,%esi
8010714d:	39 75 0c             	cmp    %esi,0xc(%ebp)
80107150:	76 4e                	jbe    801071a0 <copyuvm+0xc0>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80107152:	8b 45 08             	mov    0x8(%ebp),%eax
80107155:	31 c9                	xor    %ecx,%ecx
80107157:	89 f2                	mov    %esi,%edx
80107159:	e8 e2 f7 ff ff       	call   80106940 <walkpgdir>
8010715e:	85 c0                	test   %eax,%eax
80107160:	74 5a                	je     801071bc <copyuvm+0xdc>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
80107162:	8b 18                	mov    (%eax),%ebx
80107164:	f6 c3 01             	test   $0x1,%bl
80107167:	74 46                	je     801071af <copyuvm+0xcf>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80107169:	89 df                	mov    %ebx,%edi
    flags = PTE_FLAGS(*pte);
8010716b:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80107171:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80107174:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
8010717a:	e8 01 b3 ff ff       	call   80102480 <kalloc>
8010717f:	85 c0                	test   %eax,%eax
80107181:	89 c3                	mov    %eax,%ebx
80107183:	75 8b                	jne    80107110 <copyuvm+0x30>
      goto bad;
  }
  return d;

bad:
  freevm(d);
80107185:	83 ec 0c             	sub    $0xc,%esp
80107188:	ff 75 e0             	pushl  -0x20(%ebp)
8010718b:	e8 a0 fe ff ff       	call   80107030 <freevm>
  return 0;
80107190:	83 c4 10             	add    $0x10,%esp
80107193:	31 c0                	xor    %eax,%eax
}
80107195:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107198:	5b                   	pop    %ebx
80107199:	5e                   	pop    %esi
8010719a:	5f                   	pop    %edi
8010719b:	5d                   	pop    %ebp
8010719c:	c3                   	ret    
8010719d:	8d 76 00             	lea    0x0(%esi),%esi
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
801071a0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  return d;

bad:
  freevm(d);
  return 0;
}
801071a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801071a6:	5b                   	pop    %ebx
801071a7:	5e                   	pop    %esi
801071a8:	5f                   	pop    %edi
801071a9:	5d                   	pop    %ebp
801071aa:	c3                   	ret    
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
801071ab:	31 c0                	xor    %eax,%eax
801071ad:	eb e6                	jmp    80107195 <copyuvm+0xb5>
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
801071af:	83 ec 0c             	sub    $0xc,%esp
801071b2:	68 b6 7c 10 80       	push   $0x80107cb6
801071b7:	e8 b4 91 ff ff       	call   80100370 <panic>

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
801071bc:	83 ec 0c             	sub    $0xc,%esp
801071bf:	68 9c 7c 10 80       	push   $0x80107c9c
801071c4:	e8 a7 91 ff ff       	call   80100370 <panic>
801071c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801071d0 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
801071d0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801071d1:	31 c9                	xor    %ecx,%ecx

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
801071d3:	89 e5                	mov    %esp,%ebp
801071d5:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801071d8:	8b 55 0c             	mov    0xc(%ebp),%edx
801071db:	8b 45 08             	mov    0x8(%ebp),%eax
801071de:	e8 5d f7 ff ff       	call   80106940 <walkpgdir>
  if((*pte & PTE_P) == 0)
801071e3:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
801071e5:	89 c2                	mov    %eax,%edx
801071e7:	83 e2 05             	and    $0x5,%edx
801071ea:	83 fa 05             	cmp    $0x5,%edx
801071ed:	75 11                	jne    80107200 <uva2ka+0x30>
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
801071ef:	25 00 f0 ff ff       	and    $0xfffff000,%eax
}
801071f4:	c9                   	leave  
  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
801071f5:	05 00 00 00 80       	add    $0x80000000,%eax
}
801071fa:	c3                   	ret    
801071fb:	90                   	nop
801071fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
80107200:	31 c0                	xor    %eax,%eax
  return (char*)P2V(PTE_ADDR(*pte));
}
80107202:	c9                   	leave  
80107203:	c3                   	ret    
80107204:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010720a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107210 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80107210:	55                   	push   %ebp
80107211:	89 e5                	mov    %esp,%ebp
80107213:	57                   	push   %edi
80107214:	56                   	push   %esi
80107215:	53                   	push   %ebx
80107216:	83 ec 1c             	sub    $0x1c,%esp
80107219:	8b 5d 14             	mov    0x14(%ebp),%ebx
8010721c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010721f:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107222:	85 db                	test   %ebx,%ebx
80107224:	75 40                	jne    80107266 <copyout+0x56>
80107226:	eb 70                	jmp    80107298 <copyout+0x88>
80107228:	90                   	nop
80107229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80107230:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107233:	89 f1                	mov    %esi,%ecx
80107235:	29 d1                	sub    %edx,%ecx
80107237:	81 c1 00 10 00 00    	add    $0x1000,%ecx
8010723d:	39 d9                	cmp    %ebx,%ecx
8010723f:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80107242:	29 f2                	sub    %esi,%edx
80107244:	83 ec 04             	sub    $0x4,%esp
80107247:	01 d0                	add    %edx,%eax
80107249:	51                   	push   %ecx
8010724a:	57                   	push   %edi
8010724b:	50                   	push   %eax
8010724c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010724f:	e8 cc d5 ff ff       	call   80104820 <memmove>
    len -= n;
    buf += n;
80107254:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107257:	83 c4 10             	add    $0x10,%esp
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
8010725a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    n = PGSIZE - (va - va0);
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
80107260:	01 cf                	add    %ecx,%edi
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107262:	29 cb                	sub    %ecx,%ebx
80107264:	74 32                	je     80107298 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
80107266:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107268:	83 ec 08             	sub    $0x8,%esp
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
8010726b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010726e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107274:	56                   	push   %esi
80107275:	ff 75 08             	pushl  0x8(%ebp)
80107278:	e8 53 ff ff ff       	call   801071d0 <uva2ka>
    if(pa0 == 0)
8010727d:	83 c4 10             	add    $0x10,%esp
80107280:	85 c0                	test   %eax,%eax
80107282:	75 ac                	jne    80107230 <copyout+0x20>
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
80107284:	8d 65 f4             	lea    -0xc(%ebp),%esp
  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
80107287:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
8010728c:	5b                   	pop    %ebx
8010728d:	5e                   	pop    %esi
8010728e:	5f                   	pop    %edi
8010728f:	5d                   	pop    %ebp
80107290:	c3                   	ret    
80107291:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107298:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
8010729b:	31 c0                	xor    %eax,%eax
}
8010729d:	5b                   	pop    %ebx
8010729e:	5e                   	pop    %esi
8010729f:	5f                   	pop    %edi
801072a0:	5d                   	pop    %ebp
801072a1:	c3                   	ret    
