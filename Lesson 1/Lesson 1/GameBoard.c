//
//  GameBoard.c
//  Lesson 1
//
//  Created by Lucas Derraugh on 9/5/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

#include "GameBoard.h"

const char * CreateCurrentScoreText(const GameBoard *gameBoard) {
    char *outText;
    asprintf(&outText, "P1 | P2\n%3d|%3d", gameBoard->p1Score, gameBoard->p2Score);
    return outText;
}
