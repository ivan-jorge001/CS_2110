;;=============================================================
;; CS 2110 - Fall 2021
;; Homework 6 - Linked List Sum
;;=============================================================
;; Name:
;;============================================================

;; In this file, you must implement the 'llsum' subroutine.

;; Little reminder from your friendly neighborhood 2110 TA staff: don't run
;; this directly by pressing 'RUN' in complx, since there is nothing put at
;; address x3000. Instead, load it and use 'Debug' -> 'Simulate
;; Subroutine Call' and choose the 'reverseCopy' label.

.orig x3000
HALT

;; Pseudocode (see PDF for explanation):
;;
;; Arguments of llsum: Node head
;;
;; llsum(Node head) {
;;     // note that a NULL address is the same thing as the value 0
;;     if (head == NULL) {
;;         return 0;
;;     }
;;     Node next = head.next;
;;     sum = head.data + llsum(next);
;;     return sum;
;; }

llsum

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

LDR R0, R5, #4    ; Load Node address into R0
ADD R0, R0, #0    ; R0 += 0
BRnp ELSE1        ; Branch to else statement if node is not null
AND R0, R0, #0    ; R0 = 0
STR R0, R5, #0    ; answer = R0
BR TEAR           ; teardown

ELSE1
  LDR R1, R0, #0  ; R1 = head.next
  LDR R2, R0, #1  ; R2 = head.data
  ADD R6, R6, #-1 ; Push one spot on stack
  STR R1, R6, #0  ; Push head.next on stack
  JSR llsum       ; llsum(head.next)
  LDR R0, R6, #0  ; Load llsum(head.next) into R0
  ADD R6, R6, #2  ; Pop rv and arg1
  ADD R0, R0, R2  ; R0 += head.data
  STR R0, R5, #0  ; answer = head.data + llsum(head.next) (or R0)

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

;; used by the autograder
STACK .fill xF000
.end

;; The following is an example of a small linked list that starts at x4000.
;;
;; The first number (offset 0) contains the address of the next node in the
;; linked list, or zero if this is the final node.
;;
;; The second number (offset 1) contains the data of this node.
.orig x4000
.fill x4008
.fill 5
.end

.orig x4008
.fill x4010
.fill 12
.end

.orig x4010
.fill 0
.fill -7
.end
