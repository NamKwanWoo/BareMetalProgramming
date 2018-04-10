
.extern csd_main

.align 8

.global main

main:
    ldr r10, =length    // load memory address lable length:
    ldr r10, [r10]      // load a word r10 data [r10] == size of array
                        // It wiil be used for loop condition for(int i=sizeof(arr); i>0; i--)

	mov r11, #1			// Just Flag go back Loop

    //================================================= register usage =================================================\\
    // r10 = Size of Array                                                                                              \\
    // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]                                                                               \\
    // [x, x, x, x, x, x, x, x, x, x, o]                                                                                \\
    //==================================================================================================================\\

OuterLoop:
    mov r2, #0      // initialize for index flag
    sub r10, #1     // update (r10 = r10 - 1)   Index down

    ldr r0, =Input_data // load src first memory  address to r0  (It's like array in C code: int *cpy = src_arr)
    mov r4, #1			// r4 = #1  It is optinal instruction to reduce time complexity if array is sorted

    //================================================= register usage =================================================\\
    // r0 = point input_data address                                                                                    \\
    // r2 = flag for exit condition                                                                                     \\
    // r4 = index for inner loop circuit                                                                                \\
    // r10 = Size of Array                                                                                              \\
    // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]                                                                               \\
    // [o, x, o, x, o, x, x, x, x, x, o]                                                                                \\
    //==================================================================================================================\\
//
    InnerLoop:

        ldr r5, [r0]            // load a word into register r5   [r0] = data in r0 address
        ldr r6, = WordAligned   // load memory address lable wordalinged number
        ldr r6, [r6]            // load a word into register r6   [r6] = data in r6 address
        ldr r7, [r0, r6]        // load a word into register r7   [r0, r6] = data in (r0 + 4) address (next number)

        //================================================= register usage =================================================\\
        // r0 = point input_data address                                                                                    \\
        // r2 = flag for exit condition                                                                                     \\
        // r4 = index for inner loop circuit                                                                                \\
        // r5 = Input_data[i]                                                                                               \\
        // r6 = 4 (type word, int)                                                                                          \\
        // r7 = Input_data[i+1]                                                                                             \\
        // r10 = Size of Array                                                                                              \\
        // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]                                                                               \\
        // [o, x, o, x, o, o, o, o, x, x, o]                                                                                \\
        //==================================================================================================================\\


        cmp r5, r7              // compare r5 and r7  if(r5 == r7)  if(Input_data[i] == Input_data[i+1])
        bne Swap				// branch Swap Lable if r5 and r7 is not equal	(check zero flag)
        ComebackHere:

        add r0, r6          // r0 = r0+4 = r0+r6

		//================================================= register usage =================================================\\
		// r0 = point input_data address                                                                                    \\
		// r2 = flag for exit condition                                                                                     \\
		// r4 = index for inner loop circuit                                                                                \\
		// r5 = Input_data[i]                                                                                               \\
		// r6 = 4 (type word, int)                                                                                          \\
		// r7 = Input_data[i+1]                                                                                             \\
		// r10 = Size of Array                                                                                              \\
		// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]                                                                               \\
		// [o, x, o, x, o, o, o, o, x, x, o]                                                                                \\
		//==================================================================================================================\\

        cmp r4, r10         // compare total length and inner loop  (this can make O(n^2) time complexity)
        add r4, #1          // add r4 = r4 + 1  (inner loop index ++)
        blt InnerLoop       // if (r4 < r10) then branch InnerLoop
                            // branch InnerLoop address if r4 < r10

    cmp r2, #1				// compare (inner loop access flag) and #1
    beq OuterLoop			// branch OuterLoop Lable if r2 and #1 is equal (check zero flag)


Store:
    ldr r0, =Input_data     // load src first memory  address to r0  (It's like array in C code: int *cpy = src_arr)
    ldr r1, =Output_data	// load dst first memory  address to r1  (It's like array in C code: int *cpy = dst_arr)
    ldr r6, = WordAligned   // load memory address lable wordalinged number
    ldr r6, [r6]            // load a word into register r6   [r6] = data in r6 address    ldr r10, =length        // load memory address lable length:
    ldr r10, =length    	// load memory address lable length:
    ldr r10, [r10]      	// load a word r10 data [r10] == size of array
                        	// It wiil be used for loop condition for(int i=sizeof(arr); i>0; i--)

    loop:
	    ldr r3, [r0], r6    // load a word into r3 and update r0 (= r0 + 4)
	    str r3, [r1], r6    // store the word to memory and update r1 (= r1 + 4)
	    subs r10, r10, #1   // subtraction r10 = r10 - 1 and update cpsr (nzcv flags)
	    bne  loop			// branch loop Lable if zero flag is 0

exit:
    mov r0, #0				// r0 = #0	(initialize)
    mov r1, #0				// r1 = #0	(initialize)
	mov r2, #0				// r2 = #0	(initialize)
    mov r5, #0				// r5 = #0	(initialize)
    mov r7, #0				// r7 = #0	(initialize)
    mov r8, #0				// r8 = #0	(initialize)
    mov r11, #0				// r11 = #0	(initialize)


//
//================================================= register usage =================================================\\
// r0 = point input_data address                                                                                    \\
// r2 = flag for exit condition                                                                                     \\
// r4 = index for inner loop circuit                                                                                \\
// r5 = Input_data[i]                                                                                               \\
// r6 = 4 (type word, int)                                                                                          \\
// r7 = Input_data[i+1]                                                                                             \\
// r8 = temp variable for exchange [i] and [i+1]                                                                    \\
// r10 = Size of Array                                                                                              \\
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]                                                                               \\
// [o, x, o, x, o, o, o, o, o, x, o]                                                                                \\
//==================================================================================================================\\


Swap:
    movgt r8, r7		    // greater than   z=0 & n=v
    movgt r7, r5		    // greater than   z=0 & n=v
    movgt r5, r8		    // greater than   z=0 & n=v
    strgt r5, [r0]			// greater than   z=0 & n=v store r5 to address r0 data space
    strgt r7, [r0, r6]		// greater than   z=0 & n=v store r7 to address r0+r6 data space (r6=4)
    movgt r2, #1		    // greater than   z=0 & n=v r2 = #1
    cmp r11, #0				// it is always not true
    bne ComebackHere		// branch ComebackHere Lable if r11 and #0 is not equal (check zero flag)


.data											// data section start
.align 4										// we will use int type data so align is 4byte



Input_data:										// Input_data lable
 		.word 2, 0, -7, -1, 3, 8, -4, 10
 		.word -9, -16, 15, 13, 1, 4, -3, 14
 		.word -8, -10, -15, 6, -13, -5, 9, 12
 		.word -11, -14, -6, 11, 5, 7, -2, -12

Output_data:									// Output_data lable
		.word 0, 0, 0, 0, 0, 0, 0, 0
 		.word 0, 0, 0, 0, 0, 0, 0, 0
 		.word 0, 0, 0, 0, 0, 0, 0, 0
 		.word 0, 0, 0, 0, 0, 0, 0, 0


length:											// Length lable
    .word (Output_data - Input_data) >> 2		// this operation can obtain proper array size (Output_data-Input_data) / 4
    											// data is 4byte word aligned and only lable means its memory address
    											// sample) 	input: 0x1000, 0x1004, 0x1008, 0x100C
    											// 			output: 0x1010, 0x1014, 0x1018, 0x101C
    											// 			output - input = 0x1010 - 0x1000 = 0x0010 = b'10000
    											//          b'10000 >> 2 = b'00100 = d'4
    											//			we can calculate array length directly.

WordAligned:									// WordAligned lable
    .word 4										// it just give user to notify whole word type 4byte (I think typedef)
