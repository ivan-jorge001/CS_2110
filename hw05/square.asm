;;=============================================================
;; CS 2110 - Fall 2021
;; Homework 5 - Square
;;=============================================================
;; Name: Andrew Friedman
;;=============================================================

;; Pseudocode (see PDF for explanation)
;; a = (argument 1);
;; ANSWER = 0;
;; for (int i = 0; i < a; i++) {
;;		ANSWER += a;
;; }
;; return ANSWER;

.orig x3000

LD R3, A 					    ; R3 = argument 1
AND R2, R2, #0				; R2 = 0
LD R1, A 					    ; R1 = A

WHILE                 ; loop label
  	BRZ END 			    ; if (R1 == 0) stop
		ADD R2, R3, R2		; R2 = R3 + R2
		ADD R1, R1, #-1 	; R1--
    BRP WHILE 			  ; Repeat while R1 > 0

ST R2, ANSWER         ; return ANSWER
END 	HALT            ; game over man

A .fill 9

ANSWER .blkw 1

.end
