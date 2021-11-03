;; Timed Lab 3
;; Student Name: Andrew Friedman

;; Please read the PDF for full directions.
;; The pseudocode for the program you must implement is listed below; it is also listed in the PDF.
;; If there are any discrepancies between the PDF's pseudocode and the pseudocode below, notify a TA immediately.
;; However, in the end, the pseudocode is just an example of a program that would fulfill the requirements specified in the PDF.

;; Pseudocode:
;; // (checkpoint 1)
;; int MAX(int a, int b) {
;;   if (a > b) {
;;       return 0;
;;   } else {
;;       return 1;
;;   }
;; }
;;
;;
;;
;;
;; DIV(x, y) {
;;	   // (checkpoint 2) - Base Case
;;     if (y > x) {
;;         return 0;
;;     // (checkpoint 3) - Recursion
;;     } else {
;;         return 1 + DIV(x - y, y);
;;     }
;; }
;;
;;
;;
;; // (checkpoint 4)
;; void MAP(array, length) {
;;   int i = 0;
;;   while (i < length) {
;;      int firstElem = arr[i];
;;      int secondElem = arr[i + 1];
;;      int div = DIV(firstElem, secondElem);
;;      int offset = MAX(firstElem, secondElem);
;;      arr[i + offset] = div;
;;      i += 2;
;;   }
;; }


.orig x3000
HALT

STACK .fill xF000

; DO NOT MODIFY ABOVE


; START MAX SUBROUTINE
MAX
  ; setup  (always the same)
  ADD R6, R6, -4      ; Allocate space
  STR R7, R6, 2       ; Save Ret Addr
  STR R5, R6, 1       ; Save Old FP
  ADD R5, R6, 0       ; Copy SP to FP
  ADD R6, R6, -5      ; Room for 5 regs
  STR R0, R5, -1
  STR R1, R5, -2
  STR R2, R5, -3
  STR R3, R5, -4
  STR R4, R5, -5


  LDR R0, R5, #4      ; Load a into R1
  LDR R1, R5, #5      ; Load b into R2
  NOT R2, R1          ; R2 = !R1
  ADD R2, R2, #1      ; R2 = -R1
  ADD R2, R2, R0      ; R2 += R0
  BRP GREATER         ; if R0 - R1 > 0 goto GREATER
  ; a < b
  AND R0, R0, #0      ; R0 = 0
  ADD R0, R0, #1      ; R0 = 1
  STR R0, R5, #0      ; answer = R0
  BR TEAR1            ; goto teardown
  GREATER             ; a > b
  AND R0, R0, #0      ; return 0
  STR R0, R5, #0      ; answer = R1

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
; END MAX SUBROUTINE




; START DIV SUBROUTINE
DIV
  ; setup  (always the same)
  ADD R6, R6, -4      ; Allocate space
  STR R7, R6, 2       ; Save Ret Addr
  STR R5, R6, 1       ; Save Old FP
  ADD R5, R6, 0       ; Copy SP to FP
  ADD R6, R6, -5      ; Room for 5 regs
  STR R0, R5, -1
  STR R1, R5, -2
  STR R2, R5, -3
  STR R3, R5, -4
  STR R4, R5, -5


  LDR R0, R5, #4      ; Load x into R1
  LDR R1, R5, #5      ; Load y into R2
  NOT R2, R1          ; R2 = !R1
  ADD R2, R2, #1      ; R2 = -R1
  ADD R2, R2, R0      ; R2 += R0
  BRN GREATER2        ; if R0 - R1 > 0 goto GREATER
  ADD R6, R6, #-1     ; Push one spot on stack
  STR R1, R6, #0      ; Push y on stack
  ADD R6, R6, #-1     ; Push one spot on stack
  STR R2, R6, #0      ; Push x - y on stack
  JSR DIV             ; DIV(x - y, y)
  LDR R0, R6, #0      ; Load DIV(x - y, y) into R0
  ADD R6, R6, #3      ; Pop two spots on stack
  ADD R0, R0, #1      ; R0 += 1
  STR R0, R5, #0      ; answer = R0
  BR TEAR2            ; goto teardown
  GREATER2            ; a > b
  AND R0, R0, #0      ; return 0
  STR R0, R5, #0      ; answer = R0

  TEAR2
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
; END DIV SUBROUTINE



; START MAP SUBROUTINE
MAP
  setup  (always the same)
  ADD R6, R6, -4      ; Allocate space
  STR R7, R6, 2       ; Save Ret Addr
  STR R5, R6, 1       ; Save Old FP
  ADD R5, R6, 0       ; Copy SP to FP
  ADD R6, R6, -5      ; Room for 5 regs
  STR R0, R5, -1
  STR R1, R5, -2
  STR R2, R5, -3
  STR R3, R5, -4
  STR R4, R5, -5


  AND R0, R0, #0      ; R0 = 0 or (i = 0)
  WHILE1
    LDR R1, R5, #5    ; Load len into R1
    NOT R1, R1        ; R1 = !R1
    ADD R1, R1, #1    ; R1 = -R1
    ADD R1, R1, R0    ; R1 += R0
    BRZP TEAR3        ; if (i >= len) then end loop
    LDR R1, R5, #4    ; R1 = addr[ARRAY[0]]
    ADD R1, R1, R0    ; R1 = addr[ARRAY[i]]
    LDR R1, R1, #0    ; R1 = mem[ARRAY[i]]
    LDR R2, R5, #4    ; R2 = addr[ARRAY[0]]
    ADD R2, R2, R0    ; R2 = addr[ARRAY[i]]
    ADD R2, R2, #1    ; R2 += 1
    LDR R2, R2, #0    ; R2 = mem[ARRAY[i + 1]]
    ; div part
    ADD R6, R6, #-1   ; Push one spot on stack
    STR R2, R6, #0    ; Push arr[i + 1] on stack
    ADD R6, R6, #-1   ; Push one spot on stack
    STR R1, R6, #0    ; Push arr[i] on stack
    JSR DIV           ; DIV(firstElem, secondElem)
    LDR R3, R6, #0    ; Load DIV(arr[i], arr[i + 1]) into R3
    ADD R6, R6, #3    ; Pop two spots on stack
    ; offset part
    ADD R6, R6, #-1   ; Push one spot on stack
    STR R2, R6, #0    ; Push arr[i + 1] on stack
    ADD R6, R6, #-1   ; Push one spot on stack
    STR R1, R6, #0    ; Push arr[i] on stack
    JSR MAX           ; MAX(firstElem, secondElem)
    LDR R4, R6, #0    ; Load MAX(arr[i], arr[i + 1]) into R4
    ADD R6, R6, #3    ; Pop two spots on stack
    ; arr[i + offset] = div;
    LDR R2, R5, #4    ; R2 = addr[ARRAY[0]]
    ADD R4, R4, R2    ; offset += i
    ADD R4, R4, R0    ; offset += i
    STR R3, R4, #0    ; mem[R4] = R3
    ; i+= 2
    ADD R0, R0, #2    ; R0 += 2
    BR WHILE1         ; loop

  TEAR3
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
; END MAP SUBROUTINE


; LENGTH FOR TESTING

LENGTH .fill x12

; ARRAY FOR TESTING
ARRAY .fill x4000

.end

.orig x4000
.fill 12
.fill 3
.fill 5
.fill 7
.fill 16
.fill 2
.fill 5
.fill 5
.fill 25
.fill 7
.fill 48
.fill 60
.end
