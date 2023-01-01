package example

import "core:c"
import "core:fmt"

import "Termios:termios"

example_general :: proc() {
	using terminal
	termios := new(Termios)
	defer free(termios)
	if (tcgetattr(0, termios) < 0) {
		fmt.eprintln("ERROR: could not get terminal state")
		return
	}
	fmt.printf("Fetched Attribs:\n\t %v\n", termios)
}
