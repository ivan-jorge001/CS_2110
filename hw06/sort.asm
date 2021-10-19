;;=============================================================
;; CS 2110 - Fall 2021
;; Homework 6 - Selection Sort
;;=============================================================
;; Name:
;;=============================================================

;; In this file, you must implement the 'SORT' subroutine.

;; Little reminder from your friendly neighborhood 2110 TA staff: don't run
;; this directly by pressing 'RUN' in complx, since there is nothing put at
;; address x3000. Instead, load it and use 'Debug' -> 'Simulate
;; Subroutine Call' and choose the 'sort' label.

.orig x3000
HALT

;;Pseudocode (see PDF for explanation)
;;  arr: memory address of the first element in the array
;;  n: integer value of the number of elements in the array
;;
;;  sort(array, len, function compare) {
;;      i = 0;
;;      while (i < len - 1) {
;;          j = i;
;;          k = i + 1;
;;          while (k < len) {
;;              // update j if ARRAY[j] > ARRAY[k]
;;              if (compare(ARRAY[j], ARRAY[k]) > 0) {
;;                  j = k;
;;              }
;;              k++;
;;          }
;;          temp = ARRAY[i];
;;          ARRAY[i] = ARRAY[j];
;;          ARRAY[j] = temp;
;;          i++;
;;      }
;;  }

sort

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

AND R1, R3, #0      ; R3 = 0 or (i = 0)
WHILE1
  LDR R2, R5, #5    ; Load len into R2
  NOT R2, R2        ; R2 = !R2
  ADD R2, R2, R1    ; R2 += R1
  BRZP ENDWHILE1    ; if (i >= len - 1) then end loop
  AND R3, R3, #0    ; R3 = 0
  ADD R3, R3, R1    ; R3 += R1 or (j = i)
  AND R4, R4, #0    ; R4 = 0
  ADD R4, R4, R1    ; R4 += R1
  ADD R4, R4, #1    ; R4 += 1 or (k = i + 1)
  WHILE2
    LDR R2, R5, #5  ; Load len into R2
    NOT R2, R2      ; R2 = !R2
    ADD R2, R2, #1  ; R2 += 1
    ADD R2, R2, R4  ; R2 += R4
    BRZP ENDWHILE2  ; if (k >= len) then end loop
    ADD R6, R6, #-2 ; Push two spots on stack
    LDR R0, R5, #4  ; R0 = addr[ARRAY[0]]
    ADD R0, R0, R3  ; R0 = addr[ARRAY[j]]
    LDR R0, R0, #0  ; R0 = mem[ARRAY[j]]
    STR R0, R6, #0  ; Push ARRAY[j] on stack
    LDR R0, R5, #4  ; R0 = addr[ARRAY[0]]
    ADD R0, R0, R4  ; R0 = addr[ARRAY[k]]
    LDR R0, R0, #0  ; R0 = mem[ARRAY[k]]
    STR R0, R6, #1  ; Push ARRAY[k] on stack
    LDR R0, R5, #6  ; Load compare function into R0
    JSRR R0         ; Call compare()
    LDR R0, R6, #0  ; Load compare(ARRAY[j], ARRAY[k]) into R0
    BRNZ NOTIF      ; if compare(ARRAY[j], ARRAY[k]) <= 0 then end if
    AND R3, R3, #0  ; R3 = 0
    ADD R3, R3, R4  ; R3 = R4 or j = k
    NOTIF           ; end of if
    ADD R4, R4, #1  ; k++
    ADD R6, R6, #3  ; Pop three spots on stack
    BR WHILE2       ; loop
  ENDWHILE2
  LDR R0, R5, #4    ; R0 = addr[ARRAY[0]]
  ADD R0, R0, R1    ; R0 = addr[ARRAY[i]]
  LDR R0, R0, #0    ; R0 = mem[ARRAY[i]]
  LDR R4, R5, #4    ; R4 = addr[ARRAY[0]]
  ADD R4, R4, R3    ; R4 = addr[ARRAY[j]]
  LDR R4, R4, #0    ; R4 = mem[ARRAY[j]]
  LDR R2, R5, #4    ; R2 = addr[ARRAY[0]]
  ADD R2, R2, R1    ; R2 = addr[ARRAY[i]]
  STR R4, R2, #0    ; ARRAY[i] = ARRAY[j]
  LDR R2, R5, #4    ; R2 = addr[ARRAY[0]]
  ADD R2, R2, R3    ; R2 = addr[ARRAY[j]]
  STR R0, R2, #0    ; ARRAY[j] = ARRAY[i]
  ADD R1, R1, #1    ; i++
  BR WHILE1         ; loop
ENDWHILE1


; stack teardown (always the same)
TEAR
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

;; used by the autograder
STACK .fill xF000
.end

;; USE FOR DEBUGGING IN COMPLX
;; load array at x4000 and put the length as 7

;; ARRAY
.orig x4000
    .fill 4
    .fill -9
    .fill 0
    .fill -2
    .fill 9
    .fill 3
    .fill -10
.end

;; The following subroutine is the compare function that is passed
;; as the function address parameter into the sorting function. It
;; will work perfectly fine as long as you follow the
;; convention on the caller's side.
;; DO NOT edit the code below; it will be used by the autograder.
.orig x5000
    ;;greater than
CMPGT
    .fill x1DBD
    .fill x7180
    .fill x7381
    .fill x6183
    .fill x6384
    .fill x927F
    .fill x1261
    .fill x1201
    .fill x0C03
    .fill x5020
    .fill x1021
    .fill x0E01
    .fill x5020
    .fill x7182
    .fill x6180
    .fill x6381
    .fill x1DA2
    .fill xC1C0
    .fill x9241
.end
