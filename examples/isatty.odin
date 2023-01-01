package example

import "core:fmt"
import "Termios:termios"

example_isatty :: proc() {
	using terminal
	if isatty(STDIN_FILENO) == 1 {
		fmt.printf("Program is running in tty mode.\n")
	} else {
		fmt.printf("Program is not running in tty mode (Probably piping).\n")
	}
}
