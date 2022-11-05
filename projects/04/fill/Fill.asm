// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(READ)

	@KBD
	D=M
	@WHITE
	D;JEQ

(BLACK)

	@color  // color = black
	M=-1
	@FILL
	0;JMP

(WHITE)

	@color	// color = white
	M=0

(FILL)

	@i			// i = -1
	MD=-1

(FILL_LOOP)
	@i			// D = i++
	M=M+1
	D=M

	@SCREEN // D = *SCREEN + i
	D=D+A

	@ptr		// ptr = D
	M=D

	@color	// D = color
	D=M

	@ptr    // *ptr = color
	A=M
	M=D

	@i
	D=M
	@8191
	D=A-D
	@FILL_LOOP
	D;JGT

(DONE)

	@READ
	0;JMP

