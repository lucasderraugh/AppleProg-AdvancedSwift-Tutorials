//
//  GameBoard.h
//  Lesson 1
//
//  Created by Lucas Derraugh on 9/5/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

#ifndef GameBoard_h
#define GameBoard_h

#include <stdio.h>

typedef struct {
    int p1Score;
    int p2Score;
} GameBoard;

const char * CreateCurrentScoreText(const GameBoard *);

#endif /* GameBoard_h */
