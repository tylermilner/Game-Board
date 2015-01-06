//
//  TJMGameBoard.h
//  Game Board
//
//  Created by Tyler Milner on 3/3/14.
//  Copyright (c) 2014 Tyler Milner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TJMGameBoardCell.h"


@interface TJMGameBoard : NSObject <NSCoding>

@property (assign, nonatomic) NSUInteger numberOfRows;
@property (assign, nonatomic) NSUInteger numberOfColumns;

- (instancetype)initWithNumberOfRows:(NSUInteger)numberOfRows numberOfColumns:(NSUInteger)numberOfColumns;

- (TJMGameBoardCellState)gameBoardCellStateAtRow:(NSUInteger)row column:(NSUInteger)column;
- (void)setGameBoardCellState:(TJMGameBoardCellState)state AtRow:(NSUInteger)row column:(NSUInteger)column;

- (void)resetGameBoard;

@end
