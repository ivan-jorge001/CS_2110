;;=======================================
;; CS 2110 - Fall 2021
;; HW6 - Collatz Conjecture
;;=======================================
;; Name:
;;=======================================

;; In this file, you must implement the 'collatz' subroutine.

;; Little reminder from your friendly neighborhood 2110 TA staff:
;; don't run this directly by pressing 'RUN' in Complx, since there is nothing
;; put at address x3000. Instead, load it and use 'Debug' -> 'Simulate
;; Subroutine Call' and choose the 'collatz' label.


.orig x3000
HALT

collatz
;; See the PDF for more information on what this subroutine should do.
;;
;; Arguments of collatz: postive integer n
;;
;; Pseudocode:
;; collatz(int n) {
;;     if (n == 1) {
;;         return 0;
;;     }
;;     if (n % 2 == 0) {
;;         return collatz(n/2) + 1;
;;     } else {
;;         return collatz(3 * n + 1) + 1;
;;     }
;; }

; setup  (always the same)
ADD R6, R6, -4    ; Allocate space
STR R7, R6, 2     ; Save Ret Addr
STR R5, R6, 1     ; Save Old FP
ADD R5, R6, 0     ; Copy SP to FP
ADD R6, R6, -5    ; Room for 5 regs
STR R0, R5, -1
STR R1, R5, -2
STR R2, R5, -3
STR R3, R5, -4
STR R4, R5, -5

LDR R0, R5, #4    ; Load n into R0
ADD R0, R0, #-1   ; R0 -= 1
BRZ     IF1       ; if n == 1
ADD R0, R0, #1    ; R0 += 1
AND R1, R0, #1    ; R0 &= 1
BRZ IF2           ; if (R0 % 2 == 0) even
BR IF3            ; if (R0 % 2 == 1) odd

IF1               ; n == 1
  AND R0, R0, #0  ; Clear R0
  STR R0, R5, #0  ; answer = R0
  BR TEAR         ; Branch to the tear down

IF2               ; isEven case
  ADD R6, R6, #-1 ; Push one spot on stack
  STR R0, R6, #0  ; Push n on stack
  JSR divideBy2   ; divideBy2(n)
  LDR R0, R6, #0  ; Load divideBy2(n) into R0
  ADD R6, R6, #2  ; Pop rv and arg1

FINAL             ; answer = collatz(R0) + 1
  ADD R6, R6, #-1 ; Push one spot on stack
  STR R0, R6, #0  ; Push n on stack
  JSR collatz     ; collatz(R0)
  LDR R0, R6, #0  ; Load collatz(R0) into R0
  ADD R6, R6, #2  ; Pop two spots on stack
  ADD R0, R0, #1  ; R0 += 1
  STR R0, R5, #0  ; answer = R0
  BR TEAR         ; teardown

IF3               ; isOdd case (R1 currently 1)
  ADD R1, R1, R0  ; R1 += R0
  ADD R1, R1, R0  ; R1 += R0
  ADD R1, R1, R0  ; R1 += R0
  AND R0, R0, #0  ; R0 = 0
  ADD R0, R0, R1  ; R0 = 3 * N + 1
  BR FINAL        ; Finish off condition


; stack teardown (always the same)
TEAR
  LDR R0, R5, 0   ; Ret val = answer
  STR R0, R5, 3
  LDR R4, R5, -5  ; Restore R4
  LDR R3, R5, -4  ; Restore R3
  LDR R2, R5, -3  ; Restore R2
  LDR R1, R5, -2  ; Restore R0
  LDR R0, R5, -1  ; Restore R1
  ADD R6, R5, 0   ; Restore SP
  LDR R5, R6, 1   ; Restore FP
  LDR R7, R6, 2   ; Restore RA
  ADD R6, R6, 3   ; Pop ra,fp,lv1

RET


;; The following is a subroutine that takes a single number n and returns n/2.
;; You may call this subroutine to help you with 'collatz'.

;; DO NOT CHANGE THIS SUBROUTINE IN ANY WAY
divideBy2
.fill x1DBC
.fill x7F82
.fill x7B81
.fill x1BA0
.fill x1DBB
.fill x7184
.fill x7383
.fill x7582
.fill x7781
.fill x7980
.fill x6144
.fill x5260
.fill x1020
.fill x0C03
.fill x103E
.fill x1261
.fill x0FFB
.fill x7343
.fill x6980
.fill x6781
.fill x6582
.fill x6383
.fill x6184
.fill x1D60
.fill x6B81
.fill x6F82
.fill x1DA3
.fill xC1C0


; Needed by Simulate Subroutine Call in Complx
STACK .fill xF000
.end
