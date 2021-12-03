;;=============================================================
;; CS 2110 - Fall 2021
;; Homework 5 - Toggle Case
;;=============================================================
;; Name: Andrew Friedman
;;=============================================================

;; Pseudocode (see PDF for explanation):
;;
;;	string = "Assembly is interesting"; // given string
;;	Array[string.len()] answer; // array to store the result string
;;	i = 0;
;;
;;	while (string[i] != '\0') {
;;	    if (string[i] == " ") {
;;	        answer[i] = " ";
;;	    } else if (string[i] >= "A" && string[i] <= "Z") {
;;	        answer[i] = string[i].lowerCase();
;;	    } else {
;;	        answer[i] = string[i].upperCase();
;;	    }
;;	    i++;
;;	}


.orig x3000


AND R1, R1, #0          ; R1 = 0 (string index)
LD R2, STRING           ; R2 = mem[STRING[0]]

WHILE                   ; loop label
    ADD R3, R2, R1      ; R3 = R2 + R1
    LDR R4, R3, #0      ; R4 = mem[R3] or mem[STRING[i]]
    BRZ NULL_TERMINATE  ; if R5 isn't 0 continue

    LD R5, A            ; R5 = addr[A]
    NOT R5, R5          ; R5 = !R5
    ADD R5, R5, #1      ; R5++
    ADD R5, R5, R4      ; R5 = R4 - 'A'
    BRN ELSE            ; non alpha char
    LD R5, Z            ; R5 = addr[Z]
    NOT R5, R5          ; R5 = !R5
    ADD R5, R5, #1      ; R5++
    ADD R5, R5, R4      ; R5 = R4 - 'Z'
    BRP ELSEIF          ; lowercase?
    LD R7, diff         ; R7 = addr[diff]
    ADD R4, R4, R7      ; R4 += R7
    BR ELSE             ; GOTO end
    ELSEIF              ; maybe lower case
      LD R5, a          ; R5 = addr[a]
      NOT R5, R5        ; R5 = !R5
      ADD R5, R5, #1    ; R5++
      ADD R5, R5, R4    ; R5 = R4 - 'a'
      BRN ELSE          ; non alpha char
      LD R5, z          ; R5 = addr[z]
      NOT R5, R5        ; R5 = !R5
      ADD R5, R5, #1    ; R5++
      ADD R5, R5, R4    ; R5 = R4 - 'z'
      BRP ELSE          ; non alpha char
      LD R7, diff       ; R7 = addr[diff]
      NOT R7, R7        ; R7 = !R7
      ADD R7, R7, #1    ; R7++
      ADD R4, R4, R7    ; R4 += R7
    ELSE ; non alpha or done converting
    LD R6, ANSWER       ; R6 = ANSWER
    ADD R6, R6, R1      ; R6 += R1
    STR R4, R6, #0      ; mem[R6] = R4

    CONTINUE
      ADD R1, R1, #1    ; R1++
      BR WHILE          ; continue loop
NULL_TERMINATE          ; Adds end to string
LD R6, ANSWER           ; R6 = ANSWER
ADD R6, R6, R1          ; R6 += R1
AND R4, R4, #0          ; R4 = 0
STR R4, R6, #0          ; mem[R6] = R4

END 	HALT              ; game over man


;; ASCII table: https://www.asciitable.com/


;; FILL OUT THESE ASCII CHARACTER VALUE FIRST TO USE IT IN YOUR CODE
SPACE	.fill x20
A		.fill x41
Z		.fill x5a
a   .fill x61
z   .fill x7a
diff .fill x20
BREAK	.fill x5D	;; this is the middle of uppercase and lowercase characters

STRING .fill x4000
ANSWER .fill x4100
.end

.orig x4000
.stringz "Assembly is INTERESTING"
.end

.orig x4100
.blkw 23
.end
