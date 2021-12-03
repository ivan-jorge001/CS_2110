#ifndef MAIN_H
#define MAIN_H

#include "gba.h"

typedef struct snake {
  int body[256][2]; // 16 x 16 grid
  int length;
  int direction[2];
} Snake;

typedef struct food {
  int x;
  int y;
} Food;

typedef struct prevDirection {
  int x;
  int y;
} PrevDirection;

void snakeMain(void);
void drawWholeSnake(void);
void increaseSnake(int);
void generateFood(void);
void printScore(void);

#endif
