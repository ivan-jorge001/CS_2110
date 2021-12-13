;;=======================================
;; CS 2110 - Fall 2021
;; Final Exam - Modulo
;;=======================================
;; Name: Andrew Friedman
;;=======================================

;; In this file, you must implement the 'mod' subroutine.

;; Little reminder from your friendly neighborhood 2110 TA staff:
;; don't run this directly by pressing 'RUN' in Complx, since there is nothing
;; put at address x3000. Instead, load it and use 'Debug' -> 'Simulate
;; Subroutine Call' and choose the 'mod' label.


.orig x3000
HALT

mod
;; See the PDF for more information on what this subroutine should do.
;;
;; Arguments of mod: integer a, positive integer b
;;
;; Pseudocode:
;;
;; mod(a, b) {
;;     if (a < 0) {
;;         return mod(a + b, b);
;;     }
;;
;;     if (a < b) {
;;         return a;
;;     }
;;
;;     return mod(a - b, b);
;; }
;;


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

LDR R0, R5, #4      ; Load a into R0
BRN LESSZERO        ; if (a < 0) goto LESSZERO
LDR R1, R5, #5
NOT R0, R0
ADD R0, R0, #1
ADD R0, R0, R1
BRP LESSB
LDR R0, R5, #4
LDR R1, R5, #5
NOT R1, R1
ADD R1, R1, #1
ADD R0, R0, R1
LDR R1, R5, #5
ADD R6, R6, #-1     ; Push one spot on stack
STR R1, R6, #0      ; Push a - b on stack
ADD R6, R6, #-1     ; Push one spot on stack
STR R0, R6, #0      ; Push b on stack
JSR mod            ; mod(x - y, y)
LDR R0, R6, #0      ; Load DIV(x - y, y) into R0
ADD R6, R6, #3      ; Pop two spots on stack
STR R0, R5, #0      ; answer = R0
BR TEAR1            ; goto teardown


LESSZERO
LDR R1, R5, #5      ; Load b into R2
ADD R2, R1, R0      ; R2 = R1(b) + R0(a)
ADD R6, R6, #-1     ; Push one spot on stack
STR R1, R6, #0      ; Push a+b on stack
ADD R6, R6, #-1     ; Push one spot on stack
STR R2, R6, #0      ; Push b on stack
JSR mod             ; mod(a + b, b)
LDR R0, R6, #0      ; Load mod(a + b, b) into R0
ADD R6, R6, #3      ; Pop two spots on stack
STR R0, R5, #0      ; answer = R0
BR TEAR1            ; goto teardown

LESSB
LDR R0, R5, #4      ; Load a into R0
STR R0, R5, #0      ; answer = R0
BR TEAR1            ; goto teardown


TEAR1
  LDR R0, R5, 0     ; Ret val = answer
  STR R0, R5, 3
  LDR R4, R5, -5    ; Restore R4
  LDR R3, R5, -4    ; Restore R3
  LDR R2, R5, -3    ; Restore R2
  LDR R1, R5, -2    ; Restore R0
  LDR R0, R5, -1    ; Restore R1
  ADD R6, R5, 0     ; Restore SP
  LDR R5, R6, 1     ; Restore FP
  LDR R7, R6, 2     ; Restore RA
  ADD R6, R6, 3     ; Pop ra,fp,lv1

RET

;; Needed by Simulate Subroutine Call in Complx
STACK .fill xF000
.end
