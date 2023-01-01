package termios

import "core:c"

foreign import libc "system:c"

@(default_calling_convention = "c")
foreign libc {
	// <unistd.h>
	isatty :: proc(fd: c.int) -> c.int ---
	// <sys/ioctl.h>
	ioctl :: proc(fd: c.int, request: TTY_REQUEST, #c_vararg args: ..any) -> c.int ---
	// <termios.h>
	tcgetattr :: proc(fd: c.int, termios: ^Termios) -> c.int ---
	tcsetattr :: proc(fd: c.int, optional_actions: SET_ATTR_ACTIONS, termios: ^Termios) -> c.int ---
	cfgetispeed :: proc(termios: ^Termios) -> speed_t ---
	cfgetospeed :: proc(termios: ^Termios) -> speed_t ---
	cfsetispeed :: proc(termios: ^Termios, speed: speed_t) -> c.int ---
	cfsetospeed :: proc(termios: ^Termios, speed: speed_t) -> c.int ---
	tcdrain :: proc(fd: c.int) -> c.int ---
	tcflush :: proc(fd: c.int, queue_selector: LINE_CONTROL) -> c.int ---
	tcflow :: proc(fd: c.int, action: LINE_CONTROL) -> c.int ---
	tcgetsid :: proc(fd: c.int) -> pid_t ---
	tcsendbreak :: proc(fd: c.int, duration: c.int) -> c.int ---
}
