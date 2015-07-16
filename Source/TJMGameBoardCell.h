//
//  TJMGameBoardCell.h
//  Game Board
//
//  Created by Tyler Milner on 3/3/14.
//  Copyright (c) 2014 Tyler Milner. All rights reserved.
//

//
//  TODO: Would probably be better to make the cell states dynamic in some way...simple NSArray of NSStrings constants? Would allow user to inject possible states array along with initial state (default is 1st state in array, exception if empty array)
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, TJMGameBoardCellState) {
    TJMGameBoardCellStateEmpty = 0,
    TJMGameBoardCellStateBlack = 1,
    TJMGameBoardCellStateWhite = 2
};

#define NSStringFromTJMGameBoardCellState(state) [@[@"-", @"B", @"W"] objectAtIndex:state]

@interface TJMGameBoardCell : NSObject <NSCoding>

@property (assign, nonatomic) TJMGameBoardCellState state;

+ (instancetype)gameBoardCell;

- (instancetype)initWithGameBoardCellState:(TJMGameBoardCellState)state;

@end
