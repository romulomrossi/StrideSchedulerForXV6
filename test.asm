
_test:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    exit();
}

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "test\n");
  11:	68 f8 07 00 00       	push   $0x7f8
  16:	6a 01                	push   $0x1
  18:	e8 93 04 00 00       	call   4b0 <printf>
  new_fork(100);
  1d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
  24:	e8 57 00 00 00       	call   80 <new_fork>

  exit();
  29:	e8 24 03 00 00       	call   352 <exit>
  2e:	66 90                	xchg   %ax,%ax

00000030 <lcg_rand>:
#define N 10

unsigned long next=1;
unsigned int lcg_rand()
{ 
    unsigned long a = ((unsigned long)next++ * 279470273UL) % 42949671UL;
  30:	8b 0d fc 0a 00 00    	mov    0xafc,%ecx
    return a < 0 ? -1*a : a;
  36:	ba 33 01 00 90       	mov    $0x90000133,%edx

#define N 10

unsigned long next=1;
unsigned int lcg_rand()
{ 
  3b:	55                   	push   %ebp
  3c:	89 e5                	mov    %esp,%ebp
    unsigned long a = ((unsigned long)next++ * 279470273UL) % 42949671UL;
  3e:	8d 41 01             	lea    0x1(%ecx),%eax
    return a < 0 ? -1*a : a;
  41:	69 c9 c1 60 a8 10    	imul   $0x10a860c1,%ecx,%ecx
#define N 10

unsigned long next=1;
unsigned int lcg_rand()
{ 
    unsigned long a = ((unsigned long)next++ * 279470273UL) % 42949671UL;
  47:	a3 fc 0a 00 00       	mov    %eax,0xafc
    return a < 0 ? -1*a : a;
}
  4c:	5d                   	pop    %ebp

unsigned long next=1;
unsigned int lcg_rand()
{ 
    unsigned long a = ((unsigned long)next++ * 279470273UL) % 42949671UL;
    return a < 0 ? -1*a : a;
  4d:	89 c8                	mov    %ecx,%eax
  4f:	f7 e2                	mul    %edx
  51:	89 c8                	mov    %ecx,%eax
  53:	29 d0                	sub    %edx,%eax
  55:	d1 e8                	shr    %eax
  57:	01 d0                	add    %edx,%eax
  59:	c1 e8 19             	shr    $0x19,%eax
  5c:	69 c0 27 5c 8f 02    	imul   $0x28f5c27,%eax,%eax
  62:	29 c1                	sub    %eax,%ecx
  64:	89 c8                	mov    %ecx,%eax
}
  66:	c3                   	ret    
  67:	89 f6                	mov    %esi,%esi
  69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000070 <wait_>:

void 
wait_(unsigned int  seed)
{
  70:	55                   	push   %ebp
  71:	89 e5                	mov    %esp,%ebp
  if(seed<=0)
    return;
  seed--;
  wait_(seed);
}
  73:	5d                   	pop    %ebp
  74:	c3                   	ret    
  75:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000080 <new_fork>:

int counter = 0;

void new_fork(unsigned int tickets){
   
    if(counter >=  N)
  80:	a1 00 0b 00 00       	mov    0xb00,%eax
  85:	83 f8 09             	cmp    $0x9,%eax
  88:	7e 02                	jle    8c <new_fork+0xc>
  8a:	f3 c3                	repz ret 
  wait_(seed);
}

int counter = 0;

void new_fork(unsigned int tickets){
  8c:	55                   	push   %ebp
   
    if(counter >=  N)
      return;

    counter++;
  8d:	83 c0 01             	add    $0x1,%eax
  wait_(seed);
}

int counter = 0;

void new_fork(unsigned int tickets){
  90:	89 e5                	mov    %esp,%ebp
  92:	53                   	push   %ebx
  93:	83 ec 10             	sub    $0x10,%esp
   
    if(counter >=  N)
      return;

    counter++;
  96:	a3 00 0b 00 00       	mov    %eax,0xb00
    int pid = fork(-1);
  9b:	6a ff                	push   $0xffffffff
  9d:	e8 a8 02 00 00       	call   34a <fork>
  a2:	89 c3                	mov    %eax,%ebx
    cht(pid, tickets);
  a4:	58                   	pop    %eax
  a5:	5a                   	pop    %edx
  a6:	ff 75 08             	pushl  0x8(%ebp)
  a9:	53                   	push   %ebx
  aa:	e8 4b 03 00 00       	call   3fa <cht>
    if(pid == 0){
  af:	83 c4 10             	add    $0x10,%esp
  b2:	85 db                	test   %ebx,%ebx
  b4:	74 21                	je     d7 <new_fork+0x57>
#define N 10

unsigned long next=1;
unsigned int lcg_rand()
{ 
    unsigned long a = ((unsigned long)next++ * 279470273UL) % 42949671UL;
  b6:	83 05 fc 0a 00 00 01 	addl   $0x1,0xafc
          for(int j = 0; j < 1123456789; j++)
                 wait_(10000000);
        }
    }
    wait_(lcg_rand());
    wait();
  bd:	e8 98 02 00 00       	call   35a <wait>
    printf(1, "Returning Pid >>>> %d with %d tickets\n", pid, tickets);
  c2:	ff 75 08             	pushl  0x8(%ebp)
  c5:	53                   	push   %ebx
  c6:	68 d0 07 00 00       	push   $0x7d0
  cb:	6a 01                	push   $0x1
  cd:	e8 de 03 00 00       	call   4b0 <printf>
    exit();
  d2:	e8 7b 02 00 00       	call   352 <exit>
#define N 10

unsigned long next=1;
unsigned int lcg_rand()
{ 
    unsigned long a = ((unsigned long)next++ * 279470273UL) % 42949671UL;
  d7:	a1 fc 0a 00 00       	mov    0xafc,%eax

    counter++;
    int pid = fork(-1);
    cht(pid, tickets);
    if(pid == 0){
      new_fork(lcg_rand()%200);
  dc:	b9 27 5c 8f 02       	mov    $0x28f5c27,%ecx
  e1:	83 ec 0c             	sub    $0xc,%esp
#define N 10

unsigned long next=1;
unsigned int lcg_rand()
{ 
    unsigned long a = ((unsigned long)next++ * 279470273UL) % 42949671UL;
  e4:	8d 50 01             	lea    0x1(%eax),%edx

    counter++;
    int pid = fork(-1);
    cht(pid, tickets);
    if(pid == 0){
      new_fork(lcg_rand()%200);
  e7:	69 c0 c1 60 a8 10    	imul   $0x10a860c1,%eax,%eax
#define N 10

unsigned long next=1;
unsigned int lcg_rand()
{ 
    unsigned long a = ((unsigned long)next++ * 279470273UL) % 42949671UL;
  ed:	89 15 fc 0a 00 00    	mov    %edx,0xafc

    counter++;
    int pid = fork(-1);
    cht(pid, tickets);
    if(pid == 0){
      new_fork(lcg_rand()%200);
  f3:	31 d2                	xor    %edx,%edx
  f5:	f7 f1                	div    %ecx
  f7:	b9 c8 00 00 00       	mov    $0xc8,%ecx
  fc:	89 d0                	mov    %edx,%eax
  fe:	31 d2                	xor    %edx,%edx
 100:	f7 f1                	div    %ecx
 102:	52                   	push   %edx
 103:	e8 78 ff ff ff       	call   80 <new_fork>
 108:	83 c4 10             	add    $0x10,%esp
 10b:	eb a9                	jmp    b6 <new_fork+0x36>
 10d:	66 90                	xchg   %ax,%ax
 10f:	90                   	nop

00000110 <strcpy>:
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	53                   	push   %ebx
 114:	8b 45 08             	mov    0x8(%ebp),%eax
 117:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 11a:	89 c2                	mov    %eax,%edx
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 120:	83 c1 01             	add    $0x1,%ecx
 123:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 127:	83 c2 01             	add    $0x1,%edx
 12a:	84 db                	test   %bl,%bl
 12c:	88 5a ff             	mov    %bl,-0x1(%edx)
 12f:	75 ef                	jne    120 <strcpy+0x10>
 131:	5b                   	pop    %ebx
 132:	5d                   	pop    %ebp
 133:	c3                   	ret    
 134:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 13a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000140 <strcmp>:
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	56                   	push   %esi
 144:	53                   	push   %ebx
 145:	8b 55 08             	mov    0x8(%ebp),%edx
 148:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 14b:	0f b6 02             	movzbl (%edx),%eax
 14e:	0f b6 19             	movzbl (%ecx),%ebx
 151:	84 c0                	test   %al,%al
 153:	75 1e                	jne    173 <strcmp+0x33>
 155:	eb 29                	jmp    180 <strcmp+0x40>
 157:	89 f6                	mov    %esi,%esi
 159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 160:	83 c2 01             	add    $0x1,%edx
 163:	0f b6 02             	movzbl (%edx),%eax
 166:	8d 71 01             	lea    0x1(%ecx),%esi
 169:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 16d:	84 c0                	test   %al,%al
 16f:	74 0f                	je     180 <strcmp+0x40>
 171:	89 f1                	mov    %esi,%ecx
 173:	38 d8                	cmp    %bl,%al
 175:	74 e9                	je     160 <strcmp+0x20>
 177:	29 d8                	sub    %ebx,%eax
 179:	5b                   	pop    %ebx
 17a:	5e                   	pop    %esi
 17b:	5d                   	pop    %ebp
 17c:	c3                   	ret    
 17d:	8d 76 00             	lea    0x0(%esi),%esi
 180:	31 c0                	xor    %eax,%eax
 182:	29 d8                	sub    %ebx,%eax
 184:	5b                   	pop    %ebx
 185:	5e                   	pop    %esi
 186:	5d                   	pop    %ebp
 187:	c3                   	ret    
 188:	90                   	nop
 189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000190 <strlen>:
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	8b 4d 08             	mov    0x8(%ebp),%ecx
 196:	80 39 00             	cmpb   $0x0,(%ecx)
 199:	74 12                	je     1ad <strlen+0x1d>
 19b:	31 d2                	xor    %edx,%edx
 19d:	8d 76 00             	lea    0x0(%esi),%esi
 1a0:	83 c2 01             	add    $0x1,%edx
 1a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1a7:	89 d0                	mov    %edx,%eax
 1a9:	75 f5                	jne    1a0 <strlen+0x10>
 1ab:	5d                   	pop    %ebp
 1ac:	c3                   	ret    
 1ad:	31 c0                	xor    %eax,%eax
 1af:	5d                   	pop    %ebp
 1b0:	c3                   	ret    
 1b1:	eb 0d                	jmp    1c0 <memset>
 1b3:	90                   	nop
 1b4:	90                   	nop
 1b5:	90                   	nop
 1b6:	90                   	nop
 1b7:	90                   	nop
 1b8:	90                   	nop
 1b9:	90                   	nop
 1ba:	90                   	nop
 1bb:	90                   	nop
 1bc:	90                   	nop
 1bd:	90                   	nop
 1be:	90                   	nop
 1bf:	90                   	nop

000001c0 <memset>:
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	57                   	push   %edi
 1c4:	8b 55 08             	mov    0x8(%ebp),%edx
 1c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cd:	89 d7                	mov    %edx,%edi
 1cf:	fc                   	cld    
 1d0:	f3 aa                	rep stos %al,%es:(%edi)
 1d2:	89 d0                	mov    %edx,%eax
 1d4:	5f                   	pop    %edi
 1d5:	5d                   	pop    %ebp
 1d6:	c3                   	ret    
 1d7:	89 f6                	mov    %esi,%esi
 1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001e0 <strchr>:
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	53                   	push   %ebx
 1e4:	8b 45 08             	mov    0x8(%ebp),%eax
 1e7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1ea:	0f b6 10             	movzbl (%eax),%edx
 1ed:	84 d2                	test   %dl,%dl
 1ef:	74 1d                	je     20e <strchr+0x2e>
 1f1:	38 d3                	cmp    %dl,%bl
 1f3:	89 d9                	mov    %ebx,%ecx
 1f5:	75 0d                	jne    204 <strchr+0x24>
 1f7:	eb 17                	jmp    210 <strchr+0x30>
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 200:	38 ca                	cmp    %cl,%dl
 202:	74 0c                	je     210 <strchr+0x30>
 204:	83 c0 01             	add    $0x1,%eax
 207:	0f b6 10             	movzbl (%eax),%edx
 20a:	84 d2                	test   %dl,%dl
 20c:	75 f2                	jne    200 <strchr+0x20>
 20e:	31 c0                	xor    %eax,%eax
 210:	5b                   	pop    %ebx
 211:	5d                   	pop    %ebp
 212:	c3                   	ret    
 213:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000220 <gets>:
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	57                   	push   %edi
 224:	56                   	push   %esi
 225:	53                   	push   %ebx
 226:	31 f6                	xor    %esi,%esi
 228:	8d 7d e7             	lea    -0x19(%ebp),%edi
 22b:	83 ec 1c             	sub    $0x1c,%esp
 22e:	eb 29                	jmp    259 <gets+0x39>
 230:	83 ec 04             	sub    $0x4,%esp
 233:	6a 01                	push   $0x1
 235:	57                   	push   %edi
 236:	6a 00                	push   $0x0
 238:	e8 2d 01 00 00       	call   36a <read>
 23d:	83 c4 10             	add    $0x10,%esp
 240:	85 c0                	test   %eax,%eax
 242:	7e 1d                	jle    261 <gets+0x41>
 244:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 248:	8b 55 08             	mov    0x8(%ebp),%edx
 24b:	89 de                	mov    %ebx,%esi
 24d:	3c 0a                	cmp    $0xa,%al
 24f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 253:	74 1b                	je     270 <gets+0x50>
 255:	3c 0d                	cmp    $0xd,%al
 257:	74 17                	je     270 <gets+0x50>
 259:	8d 5e 01             	lea    0x1(%esi),%ebx
 25c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 25f:	7c cf                	jl     230 <gets+0x10>
 261:	8b 45 08             	mov    0x8(%ebp),%eax
 264:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 268:	8d 65 f4             	lea    -0xc(%ebp),%esp
 26b:	5b                   	pop    %ebx
 26c:	5e                   	pop    %esi
 26d:	5f                   	pop    %edi
 26e:	5d                   	pop    %ebp
 26f:	c3                   	ret    
 270:	8b 45 08             	mov    0x8(%ebp),%eax
 273:	89 de                	mov    %ebx,%esi
 275:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 279:	8d 65 f4             	lea    -0xc(%ebp),%esp
 27c:	5b                   	pop    %ebx
 27d:	5e                   	pop    %esi
 27e:	5f                   	pop    %edi
 27f:	5d                   	pop    %ebp
 280:	c3                   	ret    
 281:	eb 0d                	jmp    290 <stat>
 283:	90                   	nop
 284:	90                   	nop
 285:	90                   	nop
 286:	90                   	nop
 287:	90                   	nop
 288:	90                   	nop
 289:	90                   	nop
 28a:	90                   	nop
 28b:	90                   	nop
 28c:	90                   	nop
 28d:	90                   	nop
 28e:	90                   	nop
 28f:	90                   	nop

00000290 <stat>:
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	56                   	push   %esi
 294:	53                   	push   %ebx
 295:	83 ec 08             	sub    $0x8,%esp
 298:	6a 00                	push   $0x0
 29a:	ff 75 08             	pushl  0x8(%ebp)
 29d:	e8 f0 00 00 00       	call   392 <open>
 2a2:	83 c4 10             	add    $0x10,%esp
 2a5:	85 c0                	test   %eax,%eax
 2a7:	78 27                	js     2d0 <stat+0x40>
 2a9:	83 ec 08             	sub    $0x8,%esp
 2ac:	ff 75 0c             	pushl  0xc(%ebp)
 2af:	89 c3                	mov    %eax,%ebx
 2b1:	50                   	push   %eax
 2b2:	e8 f3 00 00 00       	call   3aa <fstat>
 2b7:	89 c6                	mov    %eax,%esi
 2b9:	89 1c 24             	mov    %ebx,(%esp)
 2bc:	e8 b9 00 00 00       	call   37a <close>
 2c1:	83 c4 10             	add    $0x10,%esp
 2c4:	89 f0                	mov    %esi,%eax
 2c6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2c9:	5b                   	pop    %ebx
 2ca:	5e                   	pop    %esi
 2cb:	5d                   	pop    %ebp
 2cc:	c3                   	ret    
 2cd:	8d 76 00             	lea    0x0(%esi),%esi
 2d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2d5:	eb ef                	jmp    2c6 <stat+0x36>
 2d7:	89 f6                	mov    %esi,%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <atoi>:
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	53                   	push   %ebx
 2e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2e7:	0f be 11             	movsbl (%ecx),%edx
 2ea:	8d 42 d0             	lea    -0x30(%edx),%eax
 2ed:	3c 09                	cmp    $0x9,%al
 2ef:	b8 00 00 00 00       	mov    $0x0,%eax
 2f4:	77 1f                	ja     315 <atoi+0x35>
 2f6:	8d 76 00             	lea    0x0(%esi),%esi
 2f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 300:	8d 04 80             	lea    (%eax,%eax,4),%eax
 303:	83 c1 01             	add    $0x1,%ecx
 306:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 30a:	0f be 11             	movsbl (%ecx),%edx
 30d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 310:	80 fb 09             	cmp    $0x9,%bl
 313:	76 eb                	jbe    300 <atoi+0x20>
 315:	5b                   	pop    %ebx
 316:	5d                   	pop    %ebp
 317:	c3                   	ret    
 318:	90                   	nop
 319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000320 <memmove>:
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	56                   	push   %esi
 324:	53                   	push   %ebx
 325:	8b 5d 10             	mov    0x10(%ebp),%ebx
 328:	8b 45 08             	mov    0x8(%ebp),%eax
 32b:	8b 75 0c             	mov    0xc(%ebp),%esi
 32e:	85 db                	test   %ebx,%ebx
 330:	7e 14                	jle    346 <memmove+0x26>
 332:	31 d2                	xor    %edx,%edx
 334:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 338:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 33c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 33f:	83 c2 01             	add    $0x1,%edx
 342:	39 da                	cmp    %ebx,%edx
 344:	75 f2                	jne    338 <memmove+0x18>
 346:	5b                   	pop    %ebx
 347:	5e                   	pop    %esi
 348:	5d                   	pop    %ebp
 349:	c3                   	ret    

0000034a <fork>:
 34a:	b8 01 00 00 00       	mov    $0x1,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <exit>:
 352:	b8 02 00 00 00       	mov    $0x2,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <wait>:
 35a:	b8 03 00 00 00       	mov    $0x3,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <pipe>:
 362:	b8 04 00 00 00       	mov    $0x4,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <read>:
 36a:	b8 05 00 00 00       	mov    $0x5,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <write>:
 372:	b8 10 00 00 00       	mov    $0x10,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <close>:
 37a:	b8 15 00 00 00       	mov    $0x15,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <kill>:
 382:	b8 06 00 00 00       	mov    $0x6,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <exec>:
 38a:	b8 07 00 00 00       	mov    $0x7,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <open>:
 392:	b8 0f 00 00 00       	mov    $0xf,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <mknod>:
 39a:	b8 11 00 00 00       	mov    $0x11,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <unlink>:
 3a2:	b8 12 00 00 00       	mov    $0x12,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <fstat>:
 3aa:	b8 08 00 00 00       	mov    $0x8,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <link>:
 3b2:	b8 13 00 00 00       	mov    $0x13,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <mkdir>:
 3ba:	b8 14 00 00 00       	mov    $0x14,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <chdir>:
 3c2:	b8 09 00 00 00       	mov    $0x9,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <dup>:
 3ca:	b8 0a 00 00 00       	mov    $0xa,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <getpid>:
 3d2:	b8 0b 00 00 00       	mov    $0xb,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <sbrk>:
 3da:	b8 0c 00 00 00       	mov    $0xc,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <sleep>:
 3e2:	b8 0d 00 00 00       	mov    $0xd,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <uptime>:
 3ea:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <cps>:
 3f2:	b8 16 00 00 00       	mov    $0x16,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <cht>:
 3fa:	b8 17 00 00 00       	mov    $0x17,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    
 402:	66 90                	xchg   %ax,%ax
 404:	66 90                	xchg   %ax,%ax
 406:	66 90                	xchg   %ax,%ax
 408:	66 90                	xchg   %ax,%ax
 40a:	66 90                	xchg   %ax,%ax
 40c:	66 90                	xchg   %ax,%ax
 40e:	66 90                	xchg   %ax,%ax

00000410 <printint>:
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	53                   	push   %ebx
 416:	89 c6                	mov    %eax,%esi
 418:	83 ec 3c             	sub    $0x3c,%esp
 41b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 41e:	85 db                	test   %ebx,%ebx
 420:	74 7e                	je     4a0 <printint+0x90>
 422:	89 d0                	mov    %edx,%eax
 424:	c1 e8 1f             	shr    $0x1f,%eax
 427:	84 c0                	test   %al,%al
 429:	74 75                	je     4a0 <printint+0x90>
 42b:	89 d0                	mov    %edx,%eax
 42d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 434:	f7 d8                	neg    %eax
 436:	89 75 c0             	mov    %esi,-0x40(%ebp)
 439:	31 ff                	xor    %edi,%edi
 43b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 43e:	89 ce                	mov    %ecx,%esi
 440:	eb 08                	jmp    44a <printint+0x3a>
 442:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 448:	89 cf                	mov    %ecx,%edi
 44a:	31 d2                	xor    %edx,%edx
 44c:	8d 4f 01             	lea    0x1(%edi),%ecx
 44f:	f7 f6                	div    %esi
 451:	0f b6 92 08 08 00 00 	movzbl 0x808(%edx),%edx
 458:	85 c0                	test   %eax,%eax
 45a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 45d:	75 e9                	jne    448 <printint+0x38>
 45f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 462:	8b 75 c0             	mov    -0x40(%ebp),%esi
 465:	85 c0                	test   %eax,%eax
 467:	74 08                	je     471 <printint+0x61>
 469:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 46e:	8d 4f 02             	lea    0x2(%edi),%ecx
 471:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 475:	8d 76 00             	lea    0x0(%esi),%esi
 478:	0f b6 07             	movzbl (%edi),%eax
 47b:	83 ec 04             	sub    $0x4,%esp
 47e:	83 ef 01             	sub    $0x1,%edi
 481:	6a 01                	push   $0x1
 483:	53                   	push   %ebx
 484:	56                   	push   %esi
 485:	88 45 d7             	mov    %al,-0x29(%ebp)
 488:	e8 e5 fe ff ff       	call   372 <write>
 48d:	83 c4 10             	add    $0x10,%esp
 490:	39 df                	cmp    %ebx,%edi
 492:	75 e4                	jne    478 <printint+0x68>
 494:	8d 65 f4             	lea    -0xc(%ebp),%esp
 497:	5b                   	pop    %ebx
 498:	5e                   	pop    %esi
 499:	5f                   	pop    %edi
 49a:	5d                   	pop    %ebp
 49b:	c3                   	ret    
 49c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4a0:	89 d0                	mov    %edx,%eax
 4a2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 4a9:	eb 8b                	jmp    436 <printint+0x26>
 4ab:	90                   	nop
 4ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004b0 <printf>:
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
 4b6:	8d 45 10             	lea    0x10(%ebp),%eax
 4b9:	83 ec 2c             	sub    $0x2c,%esp
 4bc:	8b 75 0c             	mov    0xc(%ebp),%esi
 4bf:	8b 7d 08             	mov    0x8(%ebp),%edi
 4c2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4c5:	0f b6 1e             	movzbl (%esi),%ebx
 4c8:	83 c6 01             	add    $0x1,%esi
 4cb:	84 db                	test   %bl,%bl
 4cd:	0f 84 b0 00 00 00    	je     583 <printf+0xd3>
 4d3:	31 d2                	xor    %edx,%edx
 4d5:	eb 39                	jmp    510 <printf+0x60>
 4d7:	89 f6                	mov    %esi,%esi
 4d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 4e0:	83 f8 25             	cmp    $0x25,%eax
 4e3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 4e6:	ba 25 00 00 00       	mov    $0x25,%edx
 4eb:	74 18                	je     505 <printf+0x55>
 4ed:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 4f0:	83 ec 04             	sub    $0x4,%esp
 4f3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 4f6:	6a 01                	push   $0x1
 4f8:	50                   	push   %eax
 4f9:	57                   	push   %edi
 4fa:	e8 73 fe ff ff       	call   372 <write>
 4ff:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 502:	83 c4 10             	add    $0x10,%esp
 505:	83 c6 01             	add    $0x1,%esi
 508:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 50c:	84 db                	test   %bl,%bl
 50e:	74 73                	je     583 <printf+0xd3>
 510:	85 d2                	test   %edx,%edx
 512:	0f be cb             	movsbl %bl,%ecx
 515:	0f b6 c3             	movzbl %bl,%eax
 518:	74 c6                	je     4e0 <printf+0x30>
 51a:	83 fa 25             	cmp    $0x25,%edx
 51d:	75 e6                	jne    505 <printf+0x55>
 51f:	83 f8 64             	cmp    $0x64,%eax
 522:	0f 84 f8 00 00 00    	je     620 <printf+0x170>
 528:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 52e:	83 f9 70             	cmp    $0x70,%ecx
 531:	74 5d                	je     590 <printf+0xe0>
 533:	83 f8 73             	cmp    $0x73,%eax
 536:	0f 84 84 00 00 00    	je     5c0 <printf+0x110>
 53c:	83 f8 63             	cmp    $0x63,%eax
 53f:	0f 84 ea 00 00 00    	je     62f <printf+0x17f>
 545:	83 f8 25             	cmp    $0x25,%eax
 548:	0f 84 c2 00 00 00    	je     610 <printf+0x160>
 54e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 551:	83 ec 04             	sub    $0x4,%esp
 554:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 558:	6a 01                	push   $0x1
 55a:	50                   	push   %eax
 55b:	57                   	push   %edi
 55c:	e8 11 fe ff ff       	call   372 <write>
 561:	83 c4 0c             	add    $0xc,%esp
 564:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 567:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 56a:	6a 01                	push   $0x1
 56c:	50                   	push   %eax
 56d:	57                   	push   %edi
 56e:	83 c6 01             	add    $0x1,%esi
 571:	e8 fc fd ff ff       	call   372 <write>
 576:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 57a:	83 c4 10             	add    $0x10,%esp
 57d:	31 d2                	xor    %edx,%edx
 57f:	84 db                	test   %bl,%bl
 581:	75 8d                	jne    510 <printf+0x60>
 583:	8d 65 f4             	lea    -0xc(%ebp),%esp
 586:	5b                   	pop    %ebx
 587:	5e                   	pop    %esi
 588:	5f                   	pop    %edi
 589:	5d                   	pop    %ebp
 58a:	c3                   	ret    
 58b:	90                   	nop
 58c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 590:	83 ec 0c             	sub    $0xc,%esp
 593:	b9 10 00 00 00       	mov    $0x10,%ecx
 598:	6a 00                	push   $0x0
 59a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 59d:	89 f8                	mov    %edi,%eax
 59f:	8b 13                	mov    (%ebx),%edx
 5a1:	e8 6a fe ff ff       	call   410 <printint>
 5a6:	89 d8                	mov    %ebx,%eax
 5a8:	83 c4 10             	add    $0x10,%esp
 5ab:	31 d2                	xor    %edx,%edx
 5ad:	83 c0 04             	add    $0x4,%eax
 5b0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5b3:	e9 4d ff ff ff       	jmp    505 <printf+0x55>
 5b8:	90                   	nop
 5b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5c3:	8b 18                	mov    (%eax),%ebx
 5c5:	83 c0 04             	add    $0x4,%eax
 5c8:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5cb:	b8 fe 07 00 00       	mov    $0x7fe,%eax
 5d0:	85 db                	test   %ebx,%ebx
 5d2:	0f 44 d8             	cmove  %eax,%ebx
 5d5:	0f b6 03             	movzbl (%ebx),%eax
 5d8:	84 c0                	test   %al,%al
 5da:	74 23                	je     5ff <printf+0x14f>
 5dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5e0:	88 45 e3             	mov    %al,-0x1d(%ebp)
 5e3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 5e6:	83 ec 04             	sub    $0x4,%esp
 5e9:	6a 01                	push   $0x1
 5eb:	83 c3 01             	add    $0x1,%ebx
 5ee:	50                   	push   %eax
 5ef:	57                   	push   %edi
 5f0:	e8 7d fd ff ff       	call   372 <write>
 5f5:	0f b6 03             	movzbl (%ebx),%eax
 5f8:	83 c4 10             	add    $0x10,%esp
 5fb:	84 c0                	test   %al,%al
 5fd:	75 e1                	jne    5e0 <printf+0x130>
 5ff:	31 d2                	xor    %edx,%edx
 601:	e9 ff fe ff ff       	jmp    505 <printf+0x55>
 606:	8d 76 00             	lea    0x0(%esi),%esi
 609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 610:	83 ec 04             	sub    $0x4,%esp
 613:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 616:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 619:	6a 01                	push   $0x1
 61b:	e9 4c ff ff ff       	jmp    56c <printf+0xbc>
 620:	83 ec 0c             	sub    $0xc,%esp
 623:	b9 0a 00 00 00       	mov    $0xa,%ecx
 628:	6a 01                	push   $0x1
 62a:	e9 6b ff ff ff       	jmp    59a <printf+0xea>
 62f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 632:	83 ec 04             	sub    $0x4,%esp
 635:	8b 03                	mov    (%ebx),%eax
 637:	6a 01                	push   $0x1
 639:	88 45 e4             	mov    %al,-0x1c(%ebp)
 63c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 63f:	50                   	push   %eax
 640:	57                   	push   %edi
 641:	e8 2c fd ff ff       	call   372 <write>
 646:	e9 5b ff ff ff       	jmp    5a6 <printf+0xf6>
 64b:	66 90                	xchg   %ax,%ax
 64d:	66 90                	xchg   %ax,%ax
 64f:	90                   	nop

00000650 <free>:
 650:	55                   	push   %ebp
 651:	a1 04 0b 00 00       	mov    0xb04,%eax
 656:	89 e5                	mov    %esp,%ebp
 658:	57                   	push   %edi
 659:	56                   	push   %esi
 65a:	53                   	push   %ebx
 65b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 65e:	8b 10                	mov    (%eax),%edx
 660:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 663:	39 c8                	cmp    %ecx,%eax
 665:	73 19                	jae    680 <free+0x30>
 667:	89 f6                	mov    %esi,%esi
 669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 670:	39 d1                	cmp    %edx,%ecx
 672:	72 1c                	jb     690 <free+0x40>
 674:	39 d0                	cmp    %edx,%eax
 676:	73 18                	jae    690 <free+0x40>
 678:	89 d0                	mov    %edx,%eax
 67a:	39 c8                	cmp    %ecx,%eax
 67c:	8b 10                	mov    (%eax),%edx
 67e:	72 f0                	jb     670 <free+0x20>
 680:	39 d0                	cmp    %edx,%eax
 682:	72 f4                	jb     678 <free+0x28>
 684:	39 d1                	cmp    %edx,%ecx
 686:	73 f0                	jae    678 <free+0x28>
 688:	90                   	nop
 689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 690:	8b 73 fc             	mov    -0x4(%ebx),%esi
 693:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 696:	39 d7                	cmp    %edx,%edi
 698:	74 19                	je     6b3 <free+0x63>
 69a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 69d:	8b 50 04             	mov    0x4(%eax),%edx
 6a0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6a3:	39 f1                	cmp    %esi,%ecx
 6a5:	74 23                	je     6ca <free+0x7a>
 6a7:	89 08                	mov    %ecx,(%eax)
 6a9:	a3 04 0b 00 00       	mov    %eax,0xb04
 6ae:	5b                   	pop    %ebx
 6af:	5e                   	pop    %esi
 6b0:	5f                   	pop    %edi
 6b1:	5d                   	pop    %ebp
 6b2:	c3                   	ret    
 6b3:	03 72 04             	add    0x4(%edx),%esi
 6b6:	89 73 fc             	mov    %esi,-0x4(%ebx)
 6b9:	8b 10                	mov    (%eax),%edx
 6bb:	8b 12                	mov    (%edx),%edx
 6bd:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6c0:	8b 50 04             	mov    0x4(%eax),%edx
 6c3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6c6:	39 f1                	cmp    %esi,%ecx
 6c8:	75 dd                	jne    6a7 <free+0x57>
 6ca:	03 53 fc             	add    -0x4(%ebx),%edx
 6cd:	a3 04 0b 00 00       	mov    %eax,0xb04
 6d2:	89 50 04             	mov    %edx,0x4(%eax)
 6d5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6d8:	89 10                	mov    %edx,(%eax)
 6da:	5b                   	pop    %ebx
 6db:	5e                   	pop    %esi
 6dc:	5f                   	pop    %edi
 6dd:	5d                   	pop    %ebp
 6de:	c3                   	ret    
 6df:	90                   	nop

000006e0 <malloc>:
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	57                   	push   %edi
 6e4:	56                   	push   %esi
 6e5:	53                   	push   %ebx
 6e6:	83 ec 0c             	sub    $0xc,%esp
 6e9:	8b 45 08             	mov    0x8(%ebp),%eax
 6ec:	8b 15 04 0b 00 00    	mov    0xb04,%edx
 6f2:	8d 78 07             	lea    0x7(%eax),%edi
 6f5:	c1 ef 03             	shr    $0x3,%edi
 6f8:	83 c7 01             	add    $0x1,%edi
 6fb:	85 d2                	test   %edx,%edx
 6fd:	0f 84 a3 00 00 00    	je     7a6 <malloc+0xc6>
 703:	8b 02                	mov    (%edx),%eax
 705:	8b 48 04             	mov    0x4(%eax),%ecx
 708:	39 cf                	cmp    %ecx,%edi
 70a:	76 74                	jbe    780 <malloc+0xa0>
 70c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 712:	be 00 10 00 00       	mov    $0x1000,%esi
 717:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 71e:	0f 43 f7             	cmovae %edi,%esi
 721:	ba 00 80 00 00       	mov    $0x8000,%edx
 726:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 72c:	0f 46 da             	cmovbe %edx,%ebx
 72f:	eb 10                	jmp    741 <malloc+0x61>
 731:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 738:	8b 02                	mov    (%edx),%eax
 73a:	8b 48 04             	mov    0x4(%eax),%ecx
 73d:	39 cf                	cmp    %ecx,%edi
 73f:	76 3f                	jbe    780 <malloc+0xa0>
 741:	39 05 04 0b 00 00    	cmp    %eax,0xb04
 747:	89 c2                	mov    %eax,%edx
 749:	75 ed                	jne    738 <malloc+0x58>
 74b:	83 ec 0c             	sub    $0xc,%esp
 74e:	53                   	push   %ebx
 74f:	e8 86 fc ff ff       	call   3da <sbrk>
 754:	83 c4 10             	add    $0x10,%esp
 757:	83 f8 ff             	cmp    $0xffffffff,%eax
 75a:	74 1c                	je     778 <malloc+0x98>
 75c:	89 70 04             	mov    %esi,0x4(%eax)
 75f:	83 ec 0c             	sub    $0xc,%esp
 762:	83 c0 08             	add    $0x8,%eax
 765:	50                   	push   %eax
 766:	e8 e5 fe ff ff       	call   650 <free>
 76b:	8b 15 04 0b 00 00    	mov    0xb04,%edx
 771:	83 c4 10             	add    $0x10,%esp
 774:	85 d2                	test   %edx,%edx
 776:	75 c0                	jne    738 <malloc+0x58>
 778:	31 c0                	xor    %eax,%eax
 77a:	eb 1c                	jmp    798 <malloc+0xb8>
 77c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 780:	39 cf                	cmp    %ecx,%edi
 782:	74 1c                	je     7a0 <malloc+0xc0>
 784:	29 f9                	sub    %edi,%ecx
 786:	89 48 04             	mov    %ecx,0x4(%eax)
 789:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 78c:	89 78 04             	mov    %edi,0x4(%eax)
 78f:	89 15 04 0b 00 00    	mov    %edx,0xb04
 795:	83 c0 08             	add    $0x8,%eax
 798:	8d 65 f4             	lea    -0xc(%ebp),%esp
 79b:	5b                   	pop    %ebx
 79c:	5e                   	pop    %esi
 79d:	5f                   	pop    %edi
 79e:	5d                   	pop    %ebp
 79f:	c3                   	ret    
 7a0:	8b 08                	mov    (%eax),%ecx
 7a2:	89 0a                	mov    %ecx,(%edx)
 7a4:	eb e9                	jmp    78f <malloc+0xaf>
 7a6:	c7 05 04 0b 00 00 08 	movl   $0xb08,0xb04
 7ad:	0b 00 00 
 7b0:	c7 05 08 0b 00 00 08 	movl   $0xb08,0xb08
 7b7:	0b 00 00 
 7ba:	b8 08 0b 00 00       	mov    $0xb08,%eax
 7bf:	c7 05 0c 0b 00 00 00 	movl   $0x0,0xb0c
 7c6:	00 00 00 
 7c9:	e9 3e ff ff ff       	jmp    70c <malloc+0x2c>