//================================================================
// Runs a loop to fill the memory cell from 100 to 120 to value -1
// for (int i = 0; i < n; i++) {
//     arr[i] = -1;   
// }
//================================================================

//----------------------------------------------------------------
// Variable initialization
//----------------------------------------------------------------
(START)
    // i = 0
    @i
    M = 0

    // n = 10
    @10
    D = A
    @n
    M = D

    // arr = 100
    @100
    D = A
    @arr
    M = D

(LOOP)
    // if (i - n >= 0) {Jump to END}
    @i
    D = M
    @n
    D = D - M
    @END
    D; JGE

    // arr[i] = -1 (RAM[arr + i] = -1)
    @arr
    D = M
    @i
    A = D + M
    M = -1

    // i++
    @i
    M = M + 1

    @LOOP
    0; JMP


(END)
    @END
    0; JMP