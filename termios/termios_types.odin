package termios
import "core:c"

/* Type Aliases */
tcflag_t :: c.int
speed_t :: c.int
pid_t :: c.int

Termios :: struct {
	c_iflag: IN_FLAGS,
	c_oflag: OUT_FLAGS,
	c_cflag: CONTROL_MODES,
	c_lflag: LOCAL_MODES,
	c_line:  c.uchar,
	c_cc:    [^]c.int,
}

Winsize :: struct {
	ws_row:    c.ushort, /* rows, in characters. */
	ws_col:    c.ushort, /* columns, in characters. */
	ws_xpixel: c.ushort, /* horizontal size, in pixels */
	ws_ypixel: c.ushort, /* vertical size, in pixels */
}

TTY_REQUEST :: enum c.ulong {
	TCGETS       = 0x5401,
	TCSETS       = 0x5402,
	TCSETSW      = 0x5403,
	TCSETSF      = 0x5404,
	TCGETA       = 0x5405,
	TCSETA       = 0x5406,
	TCSETAW      = 0x5407,
	TCSETAF      = 0x5408,
	TCSBRK       = 0x5409,
	TCXONC       = 0x540A,
	TCFLSH       = 0x540B,
	TIOCEXCL     = 0x540C,
	TIOCNXCL     = 0x540D,
	TIOCSCTTY    = 0x540E,
	TIOCGPGRP    = 0x540F,
	TIOCSPGRP    = 0x5410,
	TIOCOUTQ     = 0x5411,
	TIOCSTI      = 0x5412,
	TIOCGWINSZ   = 0x5413,
	TIOCSWINSZ   = 0x5414,
	TIOCMGET     = 0x5415,
	TIOCMBIS     = 0x5416,
	TIOCMBIC     = 0x5417,
	TIOCMSET     = 0x5418,
	TIOCGSOFTCAR = 0x5419,
	TIOCSSOFTCAR = 0x541A,
	FIONREAD     = 0x541B,
	TIOCINQ      = 0x541B,
	TIOCLINUX    = 0x541C,
	TIOCCONS     = 0x541D,
	TIOCGSERIAL  = 0x541E,
	TIOCSSERIAL  = 0x541F,
	TIOCPKT      = 0x5420,
	FIONBIO      = 0x5421,
	TIOCNOTTY    = 0x5422,
	TIOCSETD     = 0x5423,
	TIOCGETD     = 0x5424,
	TCSBRKP      = 0x5425, /* Needed for POSIX tcsendbreak() */
	TIOCSBRK     = 0x5427, /* BSD compatibility */
	TIOCCBRK     = 0x5428, /* BSD compatibility */
	TIOCGSID     = 0x5429, /* Return the session ID of FD */
	TIOCGRS485   = 0x542E,
}

SET_ATTR_ACTIONS :: enum c.int {
	TCSANOW   = 0,
	TCSADRAIN = 1,
	TCSAFLUSH = 2,
}

LINE_CONTROL :: enum c.int {
	TCIFLUSH  = 0,
	TCIOFLUSH = 2,
	TCOFLUSH  = 1,
	TCIOFF    = 2,
	TCION     = 3,
	TCOOFF    = 0,
	TCOON     = 1,
}

IN_FLAGS :: enum c.int {
	BRKINT = 2,
	ICRNL  = 256,
	IGNBRK = 1,
	IGNCR  = 128,
	IGNPAR = 4,
	INLCR  = 64,
	INPCK  = 16,
	ISTRIP = 32,
	IXANY  = 2048,
	IXOFF  = 4096,
	IXON   = 1024,
	PARMRK = 8,
}

OUT_FLAGS :: enum c.int {
	OPOST  = 1,
	ONLCR  = 4,
	OCRNL  = 8,
	ONOCR  = 16,
	ONLRET = 32,
	OFDEL  = 128,
	OFILL  = 64,
	NLDLY  = 256,
	NL0    = 0,
	NL1    = 256,
	CRDLY  = 1536,
	CR0    = 0,
	CR1    = 512,
	CR2    = 1024,
	CR3    = 1536,
	TABDLY = 6144,
	TAB0   = 0,
	TAB1   = 2048,
	TAB2   = 4096,
	TAB3   = 6144,
	BSDLY  = 8192,
	BS0    = 0,
	BS1    = 8192,
	VTDLY  = 16384,
	VT0    = 0,
	VT1    = 16384,
	FFDLY  = 32768,
	FF0    = 0,
	FF1    = 32768,
}

CONTROL_MODES :: enum c.int {
	FF1    = 32768,
	CSIZE  = 48,
	CS5    = 0,
	CS6    = 16,
	CS7    = 32,
	CS8    = 48,
	CSTOPB = 64,
	CREAD  = 128,
	PARENB = 256,
	PARODD = 512,
	HUPCL  = 1024,
	CLOCAL = 2048,
}

LOCAL_MODES :: enum c.int {
	ECHO   = 8,
	ECHOE  = 16,
	ECHOK  = 32,
	ECHONL = 64,
	ICANON = 2,
	IEXTEN = 32768,
	ISIG   = 1,
	NOFLSH = 128,
	TOSTOP = 256,
}

TTYDEF_IFLAG: IN_FLAGS : (.BRKINT | .ISTRIP | .ICRNL | .IXON | .IXANY)
TTYDEF_OFLAG: OUT_FLAGS : (.OPOST | .ONLCR)
TTYDEF_LFLAG: LOCAL_MODES : (.ECHO | .ICANON | .ISIG | .IEXTEN | .ECHOE)
TTYDEF_CFLAG: CONTROL_MODES : (.CREAD | .CS7 | .PARENB | .HUPCL)
