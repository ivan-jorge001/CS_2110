.orig x0000

LDI R1, MYLABEL2
ADD R2, R1, 5
STI R2, MYLABEL2
LDI R3, MYLABEL2

HALT

MYLABEL .fill x0001
MYLABEL2 .fill x0007
MYLABEL3 .fill x0003

.end

;; R1: x0003, R2: x0008, R3: 0x0008
