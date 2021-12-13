;;=============================================================
;; CS 2110 - Fall 2021
;; Final Exam - Set Pixel
;;=============================================================
;; Name:
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

;; offset = 0;
ADD R0, R0, 0


;;while(ROW > 0) {
;;  offset+=width;
;;  row--;
;;}
LD R2, WIDTH
LD R1, ROW
WHILE
  ADD R0, R0, R2
  ADD R1, R1, #-1
  BRnz ENDWHILE

  BR WHILE
ENDWHILE


;; offset += COL;
LD R3, COL
ADD R0, R0, R3
AND R3, R3, 0

;; VIDEOBUFFER[offset] = COLOR

LD R3, VIDEOBUFFER
ADD R3, R3, R0
LD R4, COLOR
STR R4, R3, #0



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
