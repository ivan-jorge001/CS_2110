;;=============================================================
;; CS 2110 - Fall 2021
;; Homework 5 - Remove Vowels
;;=============================================================
;; Name: Andrew Friedman
;;=============================================================

;; Pseudocode (see PDF for explanation)
;; STRING = (argument 1);
;; ANSWER = "";
;; for (int i = 0; i < a.length; i++) {
;;       if (string[i] == '\0'){
;;          break
;;        }

;;       if (string[i] == ’A’) {
;;           continue;
;;        } else if (string[i] == ’E’) {
;;            continue;
;;        } else if (string[i] == ’I’) {
;;            continue;
;;        } else if (string[i] == ’O’) {
;;            continue;
;;        } else if (string[i] == ’U’) {
;;            continue;
;;        } else if (string[i] == ’a’) {
;;            continue;
;;        } else if (string[i] == ’e’) {
;;            continue;
;;        } else if (string[i] == ’i’) {
;;            continue;
;;        } else if (string[i] == ’o’) {
;;            continue;
;;        } else if (string[i] == 'u') {
;;            continue;
;;        }
;;
;;        ANSWER += STRING[i];
;;	}
;;  ANSWER += '\0';
;;
;;  return ANSWER;
;; }

.orig x3000

AND R1, R1, #0          ; R1 = 0 (string index)
AND R7, R7, #0          ; R7 = 0 (answer index)
LD R2, STRING           ; R2 = mem[STRING[0]]

WHILE                   ; loop label
    ADD R3, R2, R1      ; R3 = R2 + R1
    LDR R4, R3, #0      ; R4 = mem[R3] or mem[STRING[i]]
    BRZ NULL_TERMINATE  ; if R5 isn't 0 continue

    LD R5, LOWERA       ; R5 = 'a'
    NOT R5, R5          ; R5 = !R5
    ADD R5, R5, #1      ; R5 -= 1
    ADD R5, R4, R5      ; R5 = R4 - 'a'
    BRZ CONTINUE        ; if R5 is 'a' continue
    LD R5, A            ; R5 = 'a'
    NOT R5, R5          ; R5 = !R5
    ADD R5, R5, #1      ; R5 -= 1
    ADD R5, R4, R5      ; R5 = R4 - 'A'
    BRZ CONTINUE        ; if R5 is 'A' continue
    LD R5, LOWERE       ; R5 = 'a'
    NOT R5, R5          ; R5 = !R5
    ADD R5, R5, #1      ; R5 -= 1
    ADD R5, R4, R5      ; R5 = R4 - 'e'
    BRZ CONTINUE        ; if R5 is 'e' continue
    LD R5, E            ; R5 = 'a'
    NOT R5, R5          ; R5 = !R5
    ADD R5, R5, #1      ; R5 -= 1
    ADD R5, R4, R5      ; R5 = R4 - 'E'
    BRZ CONTINUE        ; if R5 is 'E' continue
    LD R5, LOWERI       ; R5 = 'a'
    NOT R5, R5          ; R5 = !R5
    ADD R5, R5, #1      ; R5 -= 1
    ADD R5, R4, R5      ; R5 = R4 - 'i'
    BRZ CONTINUE        ; if R5 is 'i' continue
    LD R5, I            ; R5 = 'a'
    NOT R5, R5          ; R5 = !R5
    ADD R5, R5, #1      ; R5 -= 1
    ADD R5, R4, R5      ; R5 = R4 - 'I'
    BRZ CONTINUE        ; if R5 is 'I' continue
    LD R5, LOWERO       ; R5 = 'a'
    NOT R5, R5          ; R5 = !R5
    ADD R5, R5, #1      ; R5 -= 1
    ADD R5, R4, R5      ; R5 = R4 - 'o'
    BRZ CONTINUE        ; if R5 is 'o' continue
    LD R5, O            ; R5 = 'a'
    NOT R5, R5          ; R5 = !R5
    ADD R5, R5, #1      ; R5 -= 1
    ADD R5, R4, R5      ; R5 = R4 - 'O'
    BRZ CONTINUE        ; if R5 is 'O' continue
    LD R5, LOWERU       ; R5 = 'a'
    NOT R5, R5          ; R5 = !R5
    ADD R5, R5, #1      ; R5 -= 1
    ADD R5, R4, R5      ; R5 = R4 - 'u'
    BRZ CONTINUE        ; if R5 is 'u' continue
    LD R5, U            ; R5 = 'a'
    NOT R5, R5          ; R5 = !R5
    ADD R5, R5, #1      ; R5 -= 1
    ADD R5, R4, R5      ; R5 = R4 - 'U'
    BRZ CONTINUE        ; if R5 is 'U' continue

    LD R6, ANSWER       ; R6 = ANSWER
    ADD R6, R6, R7      ; R6 += R7
    STR R4, R6, #0      ; mem[R6] = R4
    ADD R7, R7, #1      ; R7++

    CONTINUE
      ADD R1, R1, #1    ; R1++
      BR WHILE          ; continue loop
NULL_TERMINATE          ; Adds end to string
LD R6, ANSWER           ; R6 = ANSWER
ADD R6, R6, R7          ; R6 += R7
AND R4, R4, #0          ; R4 = 0
STR R4, R6, #0          ; mem[R6] = R4

END 	HALT              ; game over man

STRING .fill x4000
ANSWER .fill x4100



;;NOTE: For your convenience, you can make new labels for
;;the ASCII values of other vowels here! 2 have been done
;;here as an example.

LOWERA .fill x61    ;; 'a'
LOWERE .fill x65    ;; 'e'
LOWERI .fill x69    ;; 'i'
LOWERO .fill x6f    ;; 'o'
LOWERU .fill x75    ;; 'u'

A .fill x41         ;; 'A'
E .fill x45         ;; 'E'
I .fill x49         ;; 'I'
O .fill x4f         ;; 'O'
U .fill x55         ;; 'U'


.end

.orig x4000

.stringz "spongebob and SQUIDWARD"

.end
