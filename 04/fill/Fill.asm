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

// Pseudo-code
// Init part
// press  = 0
// filled = 0
//
// if (M[KBD] != 0) {
//     goto FILL_CHECK   
// } else {
//     goto RESET_CHECK
// }
//
// FILL_CHECK
// if (filled != 0) {
//     goto KEY_CHECK
// }

(START)
    @pressed
    M = 0
    @filled
    M = 0
    
    @total_row
    M = 512
    @total_col
    M = 32

(KEYBOARD_CHECK)
    @KBD
    D = M            // D = M[KBD]
    @FILL_CHECK
    D; JNE           // Key pressed, goto FILL_CHECK

    @RESET_CHECK     // Key not pressed, goto RESET_CHECK
    0; JMP

(FILL_CHECK)
    @filled
    D = M

    @KEYBOARD_CHECK
    D ; JNE          // Already filled, no need to fill

    @FILL            // Not filled, go and fill the screen
    0 ; JMP

(RESET_CHECK)
    @filled
    D = M

    @RESET           // Filled, Needs reset
    D ; JNE

    @KEYBOARD_CHECK  // Already reset, no need to reset
    0 ; JMP

(FILL)
    @SCREEN
    M = -1
    @row
    M = 0
    @col
    M = 0

(FILL_FINISHED)
    @filled
    M = 1
    @KEYBOARD_CHECK
    0 ; JMP

(RESET)
    @SCREEN
    M = 0
    @row
    M = 0
    @col
    M = 0

(RESET_FINISHED)
    @filled
    M = 0
    @KEYBOARD_CHECK
    0 ; JMP