;;=============================================================
;; CS 2110 - Fall 2021
;; Homework 5 - Array Modify
;;=============================================================
;; Name: (Your name Here)
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

;;put your code here

HALT

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
