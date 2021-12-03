#include "main.h"

#include <stdio.h>
#include <stdlib.h>

#include "gba.h"

#include "images/titleScreen.h"
#include "images/gameBack.h"
#include "images/body.h"

enum gba_state {
  START,
  PLAY,
  WIN,
  LOSE,
};

Snake player;
Food pellet;
enum gba_state state;

int main(void) {
  // Manipulate REG_DISPCNT here to set Mode 3. //
  REG_DISPCNT = MODE3 | BG2_ENABLE;

  // Save current and previous state of button input.
  u32 previousButtons = BUTTONS;
  u32 currentButtons = BUTTONS;

  // Load initial application state
  state = START;

  while (1) {
    // Load the current state of the buttons
    currentButtons = BUTTONS;

    waitForVBlank();

    switch (state) {
      case START:
        fillScreenDMA(WHITE);
        drawFullScreenImageDMA(titleScreen);
        if (KEY_DOWN(BUTTON_START, BUTTONS)) {
          state = PLAY;
        }
        break;
      case PLAY:
        // setup game
        drawFullScreenImageDMA(gameBack);
        drawRectDMA(0,40,WIDTH - 80, HEIGHT, GREEN); // playable area
        drawRectDMA(0, 200, 40, 10, BLACK); // score background
        drawString(0, 200, "score:", WHITE);
        player.length = 1;
        printScore();
        player.body[0][0] = 0;
        player.body[0][1] = 0;
        player.direction[0] = 1;
        player.direction[1] = 0;
        drawWholeSnake();
        generateFood();
        snakeMain();
        break;
      case WIN:
        drawString(HEIGHT - 20, 0, "YOU", WHITE);
        drawString(HEIGHT - 10, 0, "WIN!", WHITE);
        if (KEY_DOWN(BUTTON_SELECT, BUTTONS)) {
          state = START;
        }
        break;
      case LOSE:
        drawString(HEIGHT - 20, 0, "YOU", WHITE);
        drawString(HEIGHT - 10, 0, "LOSE!", WHITE);
        if (KEY_DOWN(BUTTON_SELECT, BUTTONS)) {
          state = START;
        }
        break;
    }

    // Store the current state of the buttons
    previousButtons = currentButtons;
  }

  UNUSED(previousButtons); // You can remove this once previousButtons is used

  return 0;
}

int counter = 0;

void snakeMain(void) {
  while (1) {
    waitForVBlank();
    if (KEY_DOWN(BUTTON_SELECT, BUTTONS)) {
      state = START;
      return;
    }else if (KEY_DOWN(BUTTON_RIGHT, BUTTONS)) {
      player.direction[0] = 1;
      player.direction[1] = 0;
    }else if (KEY_DOWN(BUTTON_LEFT, BUTTONS)) {
      player.direction[0] = -1;
      player.direction[1] = 0;
    }else if (KEY_DOWN(BUTTON_DOWN, BUTTONS)) {
      player.direction[0] = 0;
      player.direction[1] = 1;
    }else if (KEY_DOWN(BUTTON_UP, BUTTONS)) {
      player.direction[0] = 0;
      player.direction[1] = -1;
    }

    if (counter > 20) { // movement
      if (player.length >= 10) {
        state = WIN;
        return;
      }
      if (player.body[0][0] < 0 || player.body[0][0] > 15
          || player.body[0][1] < 0 || player.body[0][1] > 15) {
        state = LOSE;
        return;
      }else if (player.length > 2) {
        for (int i = 2; i < player.length; i++) {
          if (player.body[0][0] == player.body[i][0] && player.body[0][1] == player.body[i][1]) {
            state = LOSE;
            return;
          }
        }
      }

      if (player.body[0][0] == pellet.x && player.body[0][1] == pellet.y) {
        increaseSnake(1);
        generateFood();
      }
      drawRectDMA(player.body[player.length-1][1] * 10, player.body[player.length-1][0] * 10 + 40, 10, 10, GREEN); // erase tail
      if (player.length > 1) {
        for (int i = player.length - 1; i > 0; i--) {
          player.body[i][0] = player.body[i-1][0];
          player.body[i][1] = player.body[i-1][1];
        }
      }
      player.body[0][0] += player.direction[0];
      player.body[0][1] += player.direction[1];
      drawImageDMA(player.body[0][1] * 10, player.body[0][0] * 10 + 40, 10, 10, body); // draw head
      counter = 0;
    }
    counter++;
  }
  return;
}

void drawWholeSnake(void) {
  for (int i = 0; i < player.length; i++) {
    drawImageDMA(player.body[i][1] * 10, player.body[i][0] * 10 + 40, 10, 10, body);
  }
}

void increaseSnake(int amount) {
  for (int i = 0; i < amount; i++) {
    player.length++;
    player.body[player.length-1][0] = player.body[player.length-2][0];
    player.body[player.length-1][1] = player.body[player.length-2][1];
    printScore();
  }
  return;
}

void generateFood(void) { // BOGO FTW
  int isNotIn = 0;
  while (!isNotIn) {
    pellet.x = rand() % 16;
    pellet.y = rand() % 16;
    isNotIn = 1;
    for (int i = 0; i < player.length; i++) {
      if (pellet.x == player.body[i][0] && pellet.y == player.body[i][1]) {
        isNotIn = 0;
      }
    }
  }
  drawRectDMA(pellet.y * 10, pellet.x * 10 + 40, 10, 10, RED);
  return;
}

void printScore(void) {
  char text[3];
  sprintf(text, "%d", player.length);
  drawRectDMA(10, 200, 40, 10, BLACK);
  drawString(10, 200, text, WHITE);
}
