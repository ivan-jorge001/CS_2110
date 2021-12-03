;;=============================================================
;; CS 2110 - Fall 2021
;; Homework 5 - Array Modify
;;=============================================================
;; Name: Andrew Friedman
;;=============================================================

;; Pseudocode (see PDF for explanation)
;;
;;    i = 0; // first index
;;    len = Len(ARR_X);
;;
;;    while (i < len) {
;;        if (i % 2 == 0) {
;;            //if we are at an even index, subtract 10 and save it to the array at that index
;;    	    ARR_Y[i] = ARR_X[i] - 10];
;;        } else {
;;            //if we are at odd index, multiply by 2 and save it to the array at that index
;;    	    ARR_Y[i] = ARR_X[i] * 2;
;;        }
;;        	i++;
;;    }

.orig x3000

AND R1, R1, #0				      ; R1 = 0
LD R2, LENGTH               ; R2 = Len(ARR_X)

WHILE
    NOT R3, R2              ; R3 = -R2
    ADD R3, R1, R3          ; R3 += R1
    BRZP END 			          ; if (R1 >= R2) stop

    LD R4, ARR_Y            ; R4 = ARR_Y address
    ADD R4, R4, R1          ; R4 += offset (i)
    LD R5, ARR_X            ; R5 = ARR_X address
    ADD R5, R5, R1          ; R5 += offset (i)
    AND R3, R1, #1          ; mask for last bit being 1
    BRNP ELSE               ; if (R1 % 2 != 0) goto else
        LDR R6, R5, #0      ; R6 = mem[R5]
        ADD R6, R6, #-10    ; R6 -= 10
        STR R6, R4, #0      ; mem[R4] = R6
        BR DONE             ; exit if else statement
    ELSE
        LDR R6, R5, #0      ; R6 = mem[R5]
        ADD R6, R6, R6      ; R6 *= 2
        STR R6, R4, #0      ; mem[R4] = R6
    DONE
        ADD R1, R1, #1      ; R1 += 1
        BR WHILE            ; restart loop

END 	HALT                  ; game over man

ARR_X       .fill x4000
ARR_Y       .fill x4100
LENGTH      .fill 4
.end

.orig x4000
.fill 1
.fill 5
.fill 10
.fill 11
.end

.orig x4100
.blkw 4
.end
