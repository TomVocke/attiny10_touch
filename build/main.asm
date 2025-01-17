	.file	"main.c"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__CCP__ = 0x3c
__tmp_reg__ = 16
__zero_reg__ = 17
	.global __do_copy_data
	.global __do_clear_bss
	.text
.Ltext0:
	.cfi_sections	.debug_frame
.global	init
	.type	init, @function
init:
.LFB7:
	.file 1 "main.c"
	.loc 1 178 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 180 0
/* #APP */
 ;  180 "main.c" 1
	cli
 ;  0 "" 2
	.loc 1 183 0
/* #NOAPP */
	ldi r24,lo8(-40)
	out 60-0,r24
	.loc 1 184 0
	out 54-0,__zero_reg__
	.loc 1 185 0
	out 55-0,__zero_reg__
	.loc 1 188 0
	ldi r24,lo8(9)
	out 2-0,r24
	.loc 1 189 0
	ldi r24,lo8(11)
	out 1-0,r24
	.loc 1 190 0
	ldi r24,lo8(4)
	out 3-0,r24
	.loc 1 202 0
	out 46-0,__zero_reg__
	.loc 1 203 0
	ldi r24,lo8(-64)
	out 45-0,r24
	.loc 1 205 0
	out 43-0,__zero_reg__
	.loc 1 206 0
	out 40+1-0,__zero_reg__
	out 40-0,__zero_reg__
	.loc 1 209 0
	ldi r24,lo8(8000)
	ldi r25,hi8(8000)
	sts touch_avg+1,r25
	sts touch_avg,r24
	.loc 1 211 0
	sts cur_rx,__zero_reg__
	.loc 1 212 0
	ldi r24,lo8(85)
	sts cur_tx,r24
	.loc 1 213 0
	sts tx_cnt,__zero_reg__
	.loc 1 216 0
	ldi r24,lo8(-4096)
	ldi r25,hi8(-4096)
	out 36+1-0,r25
	out 36-0,r24
	.loc 1 217 0
	in r24,43-0
	ori r24,lo8(4)
	out 43-0,r24
	.loc 1 218 0
	in r24,43-0
	ori r24,lo8(1)
	out 43-0,r24
	.loc 1 219 0
	in r24,45-0
	ori r24,lo8(1)
	out 45-0,r24
	.loc 1 223 0
/* #APP */
 ;  223 "main.c" 1
	sei
 ;  0 "" 2
/* epilogue start */
	.loc 1 225 0
/* #NOAPP */
	ret
	.cfi_endproc
.LFE7:
	.size	init, .-init
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB6:
	.loc 1 111 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 113 0
	rcall init
.L8:
	.loc 1 121 0
	in r24,40-0
	in r25,40+1-0
	ldi r22,hi8(-25536)
	cpi r24,lo8(-25536)
	cpc r25,r22
	brlo .L4
	.loc 1 121 0 is_stmt 0 discriminator 1
	lds r24,state
	sbrc r24,4
	rjmp .L4
	.loc 1 122 0 is_stmt 1
	sbi 1-0,1
	.loc 1 123 0
	ori r24,lo8(16)
	sts state,r24
	.loc 1 124 0
/* #APP */
 ;  124 "main.c" 1
	cli
 ;  0 "" 2
	.loc 1 125 0
/* #NOAPP */
	in r24,34-0
	in r25,34+1-0
	sts touch_new+1,r25
	sts touch_new,r24
	.loc 1 126 0
/* #APP */
 ;  126 "main.c" 1
	sei
 ;  0 "" 2
	.loc 1 128 0
/* #NOAPP */
	in r24,42-0
	ori r24,lo8(32)
	out 42-0,r24
	.loc 1 129 0
	in r24,43-0
	ori r24,lo8(4)
	out 43-0,r24
	.loc 1 130 0
	sbi 1-0,1
	rjmp .L8
.L4:
	.loc 1 131 0
	in r24,40-0
	in r25,40+1-0
	ldi r22,hi8(-25536)
	cpi r24,lo8(-25536)
	cpc r25,r22
	brsh .L8
	.loc 1 132 0
	lds r24,state
	andi r24,lo8(-17)
	sts state,r24
	rjmp .L8
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.text
.global	__vector_1
	.type	__vector_1, @function
__vector_1:
.LFB8:
	.loc 1 235 0
	.cfi_startproc
	push r17
.LCFI0:
	.cfi_def_cfa_offset 3
	.cfi_offset 17, -2
	push r16
.LCFI1:
	.cfi_def_cfa_offset 4
	.cfi_offset 16, -3
	in r16,__SREG__
	push r16
	ldi __zero_reg__,lo8(0)
	push r24
.LCFI2:
	.cfi_def_cfa_offset 5
	.cfi_offset 24, -4
	push r25
.LCFI3:
	.cfi_def_cfa_offset 6
	.cfi_offset 25, -5
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 5 */
.L__stack_usage = 5
	.loc 1 238 0
/* #APP */
 ;  238 "main.c" 1
	sei
 ;  0 "" 2
	.loc 1 241 0
/* #NOAPP */
	in r24,40-0
	in r25,40+1-0
	subi r24,lo8(-(188))
	sbci r25,hi8(-(188))
	out 36+1-0,r25
	out 36-0,r24
	.loc 1 243 0
	sbi 20-0,0
	.loc 1 244 0
	cbi 19-0,0
	.loc 1 245 0
	in r24,42-0
	ori r24,lo8(4)
	out 42-0,r24
	.loc 1 246 0
	in r24,43-0
	ori r24,lo8(4)
	out 43-0,r24
/* epilogue start */
	.loc 1 248 0
	pop r25
	pop r24
	pop r16
	out __SREG__,r16
	pop r16
	pop r17
	reti
	.cfi_endproc
.LFE8:
	.size	__vector_1, .-__vector_1
.global	__vector_6
	.type	__vector_6, @function
__vector_6:
.LFB9:
	.loc 1 254 0
	.cfi_startproc
	push r17
.LCFI4:
	.cfi_def_cfa_offset 3
	.cfi_offset 17, -2
	push r16
.LCFI5:
	.cfi_def_cfa_offset 4
	.cfi_offset 16, -3
	in r16,__SREG__
	push r16
	ldi __zero_reg__,lo8(0)
	push r24
.LCFI6:
	.cfi_def_cfa_offset 5
	.cfi_offset 24, -4
	push r25
.LCFI7:
	.cfi_def_cfa_offset 6
	.cfi_offset 25, -5
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 5 */
.L__stack_usage = 5
	.loc 1 257 0
/* #APP */
 ;  257 "main.c" 1
	sei
 ;  0 "" 2
	.loc 1 260 0
/* #NOAPP */
	in r24,36-0
	in r25,36+1-0
	subi r24,lo8(-(416))
	sbci r25,hi8(-(416))
	out 36+1-0,r25
	out 36-0,r24
	.loc 1 261 0
	lds r24,tx_cnt
	subi r24,lo8(-(1))
	sts tx_cnt,r24
	.loc 1 264 0
	cpi r24,lo8(1)
	breq .L21
.L11:
	.loc 1 267 0
	cpi r24,lo8(9)
	brsh .L13
	lds r24,cur_rx
	.loc 1 269 0
	sbis 0-0,2
	rjmp .L14
	.loc 1 269 0 is_stmt 0 discriminator 1
	ori r24,lo8(-128)
	rjmp .L22
.L14:
	.loc 1 269 0 discriminator 2
	andi r24,lo8(127)
.L22:
	sts cur_rx,r24
	.loc 1 270 0 is_stmt 1 discriminator 2
	lds r24,cur_rx
	lsr r24
	sts cur_rx,r24
	.loc 1 272 0 discriminator 2
	lds r24,cur_tx
	sbrs r24,0
	rjmp .L16
	.loc 1 272 0 is_stmt 0 discriminator 1
	sbi 2-0,0
	rjmp .L17
.L16:
	.loc 1 272 0 discriminator 2
	cbi 2-0,0
.L17:
	.loc 1 273 0 is_stmt 1
	lsr r24
	sts cur_tx,r24
	rjmp .L10
.L13:
	.loc 1 274 0
	cpi r24,lo8(9)
	brne .L18
	lds r24,cur_rx
	.loc 1 276 0
	sbis 0-0,2
	rjmp .L19
	.loc 1 276 0 is_stmt 0 discriminator 1
	ori r24,lo8(-128)
	rjmp .L23
.L19:
	.loc 1 276 0 discriminator 2
	andi r24,lo8(127)
.L23:
	sts cur_rx,r24
	.loc 1 278 0 is_stmt 1 discriminator 2
	lds r24,cur_tx
	sbrs r24,0
	rjmp .L21
	.loc 1 278 0 is_stmt 0 discriminator 1
	sbi 2-0,0
	rjmp .L10
.L21:
	.loc 1 278 0 discriminator 2
	cbi 2-0,0
	rjmp .L10
.L18:
	.loc 1 281 0 is_stmt 1
	sbi 2-0,0
	.loc 1 282 0
	in r24,36-0
	in r25,36+1-0
	subi r24,lo8(-(4160))
	sbci r25,hi8(-(4160))
	out 36+1-0,r25
	out 36-0,r24
	.loc 1 297 0
	lds r24,touch_new
	lds r25,touch_new+1
	lsr r25
	ror r24
	lsr r25
	ror r24
	lsr r25
	ror r24
	sts cur_tx,r24
	.loc 1 301 0
	sts cur_rx,__zero_reg__
	.loc 1 302 0
	sts tx_cnt,__zero_reg__
	.loc 1 305 0
	in r24,43-0
	andi r24,lo8(-5)
	out 43-0,r24
.L10:
/* epilogue start */
	.loc 1 310 0
	pop r25
	pop r24
	pop r16
	out __SREG__,r16
	pop r16
	pop r17
	reti
	.cfi_endproc
.LFE9:
	.size	__vector_6, .-__vector_6
.global	__vector_4
	.type	__vector_4, @function
__vector_4:
.LFB10:
	.loc 1 324 0
	.cfi_startproc
/* prologue: naked */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 328 0
/* #APP */
 ;  328 "main.c" 1
	cbi 2,3
 ;  0 "" 2
	.loc 1 329 0
 ;  329 "main.c" 1
	cbi 1,1
 ;  0 "" 2
	.loc 1 330 0
 ;  330 "main.c" 1
	reti
 ;  0 "" 2
/* epilogue start */
	.loc 1 331 0
/* #NOAPP */
	.cfi_endproc
.LFE10:
	.size	__vector_4, .-__vector_4
.global	__vector_5
	.type	__vector_5, @function
__vector_5:
.LFB11:
	.loc 1 337 0
	.cfi_startproc
/* prologue: naked */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 340 0
/* #APP */
 ;  340 "main.c" 1
	sbi 2,3
 ;  0 "" 2
	.loc 1 341 0
 ;  341 "main.c" 1
	reti
 ;  0 "" 2
/* epilogue start */
	.loc 1 342 0
/* #NOAPP */
	.cfi_endproc
.LFE11:
	.size	__vector_5, .-__vector_5
	.comm touch_avg,2,1
	.comm touch_new,2,1
	.comm touch_cnt,1,1
	.comm led_val,1,1
	.comm state,1,1
	.comm tx_cnt,1,1
	.comm cur_tx,1,1
	.comm cur_rx,1,1
	.comm cur_touch,1,1
	.comm cur_conf,1,1
	.comm cur_meas,2,1
.Letext0:
	.file 2 "/opt/cross/avr/bin/../lib/gcc/avr/4.6.2/../../../../avr/include/stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x291
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF44
	.byte	0x1
	.long	.LASF45
	.long	.LASF46
	.long	0
	.long	0
	.long	.Ldebug_ranges0+0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x2
	.byte	0x7a
	.long	0x3b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF3
	.byte	0x2
	.byte	0x7c
	.long	0x54
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.long	.LASF6
	.byte	0x2
	.byte	0x7e
	.long	0x6d
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0x5
	.long	.LASF18
	.byte	0x1
	.byte	0x1
	.byte	0xf
	.long	0xbf
	.uleb128 0x6
	.long	.LASF10
	.sleb128 0
	.uleb128 0x6
	.long	.LASF11
	.sleb128 1
	.uleb128 0x6
	.long	.LASF12
	.sleb128 2
	.uleb128 0x6
	.long	.LASF13
	.sleb128 3
	.uleb128 0x6
	.long	.LASF14
	.sleb128 4
	.uleb128 0x6
	.long	.LASF15
	.sleb128 5
	.uleb128 0x6
	.long	.LASF16
	.sleb128 6
	.uleb128 0x6
	.long	.LASF17
	.sleb128 7
	.byte	0
	.uleb128 0x5
	.long	.LASF19
	.byte	0x1
	.byte	0x1
	.byte	0x1c
	.long	0xfc
	.uleb128 0x6
	.long	.LASF20
	.sleb128 0
	.uleb128 0x6
	.long	.LASF21
	.sleb128 1
	.uleb128 0x6
	.long	.LASF22
	.sleb128 2
	.uleb128 0x6
	.long	.LASF23
	.sleb128 3
	.uleb128 0x6
	.long	.LASF24
	.sleb128 4
	.uleb128 0x6
	.long	.LASF25
	.sleb128 5
	.uleb128 0x6
	.long	.LASF26
	.sleb128 6
	.uleb128 0x6
	.long	.LASF27
	.sleb128 7
	.byte	0
	.uleb128 0x7
	.byte	0x1
	.long	.LASF28
	.byte	0x1
	.byte	0xb2
	.byte	0x1
	.long	.LFB7
	.long	.LFE7
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.uleb128 0x8
	.byte	0x1
	.long	.LASF47
	.byte	0x1
	.byte	0x6f
	.byte	0x1
	.long	0x42
	.long	.LFB6
	.long	.LFE6
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.uleb128 0x9
	.byte	0x1
	.long	.LASF29
	.byte	0x1
	.byte	0xeb
	.byte	0x1
	.long	.LFB8
	.long	.LFE8
	.long	.LLST0
	.uleb128 0x9
	.byte	0x1
	.long	.LASF30
	.byte	0x1
	.byte	0xfe
	.byte	0x1
	.long	.LFB9
	.long	.LFE9
	.long	.LLST1
	.uleb128 0xa
	.byte	0x1
	.long	.LASF31
	.byte	0x1
	.word	0x144
	.byte	0x1
	.long	.LFB10
	.long	.LFE10
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.uleb128 0xa
	.byte	0x1
	.long	.LASF32
	.byte	0x1
	.word	0x151
	.byte	0x1
	.long	.LFB11
	.long	.LFE11
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.uleb128 0xb
	.long	.LASF33
	.byte	0x1
	.byte	0x65
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xb
	.long	.LASF34
	.byte	0x1
	.byte	0x65
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xb
	.long	.LASF35
	.byte	0x1
	.byte	0x65
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xb
	.long	.LASF36
	.byte	0x1
	.byte	0x66
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xb
	.long	.LASF37
	.byte	0x1
	.byte	0x6a
	.long	0x49
	.byte	0x1
	.byte	0x1
	.uleb128 0xb
	.long	.LASF38
	.byte	0x1
	.byte	0x6b
	.long	0x49
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	.LASF39
	.byte	0x1
	.byte	0x63
	.long	0x49
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_meas
	.uleb128 0xc
	.long	.LASF40
	.byte	0x1
	.byte	0x64
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_conf
	.uleb128 0xc
	.long	.LASF41
	.byte	0x1
	.byte	0x64
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_touch
	.uleb128 0xc
	.long	.LASF33
	.byte	0x1
	.byte	0x65
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_rx
	.uleb128 0xc
	.long	.LASF34
	.byte	0x1
	.byte	0x65
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_tx
	.uleb128 0xc
	.long	.LASF35
	.byte	0x1
	.byte	0x65
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	tx_cnt
	.uleb128 0xc
	.long	.LASF36
	.byte	0x1
	.byte	0x66
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	state
	.uleb128 0xc
	.long	.LASF42
	.byte	0x1
	.byte	0x67
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	led_val
	.uleb128 0xc
	.long	.LASF43
	.byte	0x1
	.byte	0x69
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	touch_cnt
	.uleb128 0xc
	.long	.LASF37
	.byte	0x1
	.byte	0x6a
	.long	0x49
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	touch_new
	.uleb128 0xc
	.long	.LASF38
	.byte	0x1
	.byte	0x6b
	.long	0x49
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	touch_avg
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB8
	.long	.LCFI0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI0
	.long	.LCFI1
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI1
	.long	.LCFI2
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI2
	.long	.LCFI3
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI3
	.long	.LFE8
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	0
	.long	0
.LLST1:
	.long	.LFB9
	.long	.LCFI4
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI4
	.long	.LCFI5
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI5
	.long	.LCFI6
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI6
	.long	.LCFI7
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI7
	.long	.LFE9
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x24
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.LFB6
	.long	.LFE6-.LFB6
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.Ltext0
	.long	.Letext0
	.long	.LFB6
	.long	.LFE6
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF23:
	.string	"MSG_IS_TOUCHED"
.LASF36:
	.string	"state"
.LASF43:
	.string	"touch_cnt"
.LASF21:
	.string	"MSG_LED_EN"
.LASF22:
	.string	"MSG_LED_DIRECT"
.LASF42:
	.string	"led_val"
.LASF28:
	.string	"init"
.LASF33:
	.string	"cur_rx"
.LASF34:
	.string	"cur_tx"
.LASF14:
	.string	"MEAS_DONE"
.LASF46:
	.string	"/home/tomv/workspace/attiny10_touch/"
.LASF27:
	.string	"MSG_LED2"
.LASF1:
	.string	"unsigned char"
.LASF7:
	.string	"long unsigned int"
.LASF11:
	.string	"LED_EN"
.LASF31:
	.string	"__vector_4"
.LASF32:
	.string	"__vector_5"
.LASF44:
	.string	"GNU C 4.6.2"
.LASF18:
	.string	"state_t"
.LASF20:
	.string	"MSG_SLOT_TAKEN"
.LASF24:
	.string	"MSG_RESERVED"
.LASF13:
	.string	"TOUCHED"
.LASF47:
	.string	"main"
.LASF12:
	.string	"SET_LED_DIRECT"
.LASF35:
	.string	"tx_cnt"
.LASF38:
	.string	"touch_avg"
.LASF4:
	.string	"unsigned int"
.LASF39:
	.string	"cur_meas"
.LASF9:
	.string	"long long unsigned int"
.LASF2:
	.string	"uint8_t"
.LASF41:
	.string	"cur_touch"
.LASF19:
	.string	"msg_t"
.LASF40:
	.string	"cur_conf"
.LASF8:
	.string	"long long int"
.LASF45:
	.string	"main.c"
.LASF15:
	.string	"LED0"
.LASF16:
	.string	"LED1"
.LASF17:
	.string	"LED2"
.LASF29:
	.string	"__vector_1"
.LASF3:
	.string	"uint16_t"
.LASF25:
	.string	"MSG_LED0"
.LASF10:
	.string	"TAKEN_PASSED"
.LASF26:
	.string	"MSG_LED1"
.LASF30:
	.string	"__vector_6"
.LASF6:
	.string	"uint32_t"
.LASF5:
	.string	"long int"
.LASF37:
	.string	"touch_new"
.LASF0:
	.string	"signed char"
