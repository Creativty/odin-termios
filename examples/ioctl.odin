package example

import "core:fmt"
import "Termios:termios"

example_ioctl :: proc() {
	using terminal
	size: Winsize
	assert(ioctl(STDOUT_FILENO, TTY_REQUEST.TIOCGWINSZ, &size) == 0)
	fmt.printf(
		"Screen width: %i  Screen height: %i\n",
		size.ws_col,
		size.ws_row,
	)
}
