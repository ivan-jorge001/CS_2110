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

;;YOUR CODE HERE

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