;;=============================================================
;; CS 2110 - Fall 2021
;; Final Exam - Set Pixel
;;=============================================================
;; Name: Andrew Friedman
;;=============================================================

;; Pseudocode (see PDF for additional information)
;;
;; offset = 0;
;; for (i = 0; i < ROW; i++) {
;;		offset += WIDTH;
;; }
;; offset += COL;
;; VIDEOBUFFER[offset] = COLOR

.orig x3000

AND R0, R0, #0 ; offset = 0;
AND R1, R1, #0 ; i = 0
FOR
LD R2, ROW ; R2 = ROW
NOT R2, R2
ADD R2, R2, #1
ADD R2, R2, R1
BRZP ENDFOR
LD R3, WIDTH
ADD R0, R0, R3 ;		offset += WIDTH;
ADD R1, R1, #1 ; i++
BR FOR

ENDFOR
LD R3, COL
ADD R0, R0, R3 ; offset += COL;
LD R3, COLOR
LD R4, VIDEOBUFFER
ADD R4, R4, R0
STR R3, R4, #0          ; mem[R4] = R3



HALT

COLOR .fill xFFFF
ROW .fill 1
COL .fill 1

HEIGHT .fill 2
WIDTH .fill 2

VIDEOBUFFER .fill x4000

.end

.orig x4000
    .fill 2
    .fill 1
    .fill 1
    .fill 0
.end
