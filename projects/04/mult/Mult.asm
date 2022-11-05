// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

	@R2    // R2 = 0
	M=0

	@R0    // if R0 == 0 then DONE
	D=M
	@DONE
	D;JEQ

	@R1    // if R1 == 0 then DONE
	D=M
	@DONE
	D;JEQ

(LOOP)

	@R1    // R2 += R1
	D=M
	@R2
	M=D+M

	@R0    // if --R0 > 0 then LOOP
	MD=M-1
	@LOOP
	D;JGT

(DONE)

