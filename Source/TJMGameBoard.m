//
//  TJMGameBoard.m
//  Game Board
//
//  Created by Tyler Milner on 3/3/14.
//  Copyright (c) 2014 Tyler Milner. All rights reserved.
//

//
//  TODO: Probably would be better to do more coordinate validation here rather than let NSMutableArray handle the generation of exceptions. Alternatively though, less code was written me.
//

#import "TJMGameBoard.h"
#import "TJMTwoDimensionalArray.h"

#define DEFAULT_NUM_ROWS 4
#define DEFAULT_NUM_COLS 4
#define kNSCodingGameBoardKey @"gameBoard"
#define kNSCodingNumberOfRowsKey @"numberOfRows"
#define kNSCodingNumberOfColumnsKey @"numberOfColumns"

@interface TJMGameBoard()

@property (strong, nonatomic) TJMTwoDimensionalArray *gameBoard;

@end

@implementation TJMGameBoard


#pragma mark - Init

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _numberOfRows = DEFAULT_NUM_ROWS;
        _numberOfColumns = DEFAULT_NUM_COLS;
        [self gameBoardCommonInit];
    }
    
    return self;
}

- (instancetype)initWithNumberOfRows:(NSUInteger)numberOfRows numberOfColumns:(NSUInteger)numberOfColumns
{
    self = [super init];
    
    if (self)
    {
        _numberOfRows = numberOfRows;
        _numberOfColumns = numberOfColumns;
        [self gameBoardCommonInit];
    }
    
    return self;
}

- (instancetype)initWithNumberOfRows:(NSUInteger)numberOfRows numberOfColumns:(NSUInteger)numberOfColumns gameBoard:(TJMTwoDimensionalArray *)gameBoard
{
    self = [super init];
    
    if (self)
    {
        _numberOfRows = numberOfRows;
        _numberOfColumns = numberOfColumns;
        _gameBoard = gameBoard;
    }
    
    return self;
}

- (void)gameBoardCommonInit
{
    _gameBoard = [[TJMTwoDimensionalArray alloc] initWithNumberOfRows:_numberOfRows numberOfColumns:_numberOfColumns];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.gameBoard forKey:kNSCodingGameBoardKey];
    [aCoder encodeInteger:self.numberOfRows forKey:kNSCodingNumberOfRowsKey];
    [aCoder encodeInteger:self.numberOfColumns forKey:kNSCodingNumberOfColumnsKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    TJMTwoDimensionalArray *gameBoard = [aDecoder decodeObjectForKey:kNSCodingGameBoardKey];
    NSUInteger numberOfRows = [aDecoder decodeIntegerForKey:kNSCodingNumberOfRowsKey];
    NSUInteger numberOfColumns = [aDecoder decodeIntegerForKey:kNSCodingNumberOfColumnsKey];
    
    return [self initWithNumberOfRows:numberOfRows numberOfColumns:numberOfColumns gameBoard:gameBoard];
}

#pragma mark - Properties

- (void)setNumberOfRows:(NSUInteger)numberOfRows
{
    if (_numberOfRows != numberOfRows)
    {
        _numberOfRows = numberOfRows;
        self.gameBoard.numberOfRows = numberOfRows;
    }
}

- (void)setNumberOfColumns:(NSUInteger)numberOfColumns
{
    if (_numberOfColumns != numberOfColumns)
    {
        _numberOfColumns = numberOfColumns;
        self.gameBoard.numberOfColumns = numberOfColumns;
    }
}

#pragma mark - Public

- (TJMGameBoardCellState)gameBoardCellStateAtRow:(NSUInteger)row column:(NSUInteger)column
{
    TJMGameBoardCellState state = TJMGameBoardCellStateEmpty;
    id gameBoardCell = [self.gameBoard objectAtRow:row column:column];
    
    if ([gameBoardCell isKindOfClass:[TJMGameBoardCell class]])
    {
        state = ((TJMGameBoardCell *)gameBoardCell).state;
    }
    
    return state;
}

- (void)setGameBoardCellState:(TJMGameBoardCellState)state AtRow:(NSUInteger)row column:(NSUInteger)column
{
    NSAssert(state <= TJMGameBoardCellStateWhite, @"Trying to set an invalid TJMGameBoardCellState!");
    
    TJMGameBoardCell *gameBoardCell = [[TJMGameBoardCell alloc] initWithGameBoardCellState:state];
    [self.gameBoard setObject:gameBoardCell atRow:row column:column];    
}

- (void)resetGameBoard
{
    [self.gameBoard clearArray];
}

- (NSString *)description
{
    NSMutableString *description = [NSMutableString stringWithFormat:@"%@\n", [super description]];
    
    for (NSUInteger row = 0; row < self.numberOfRows; row++)
    {
        for (NSUInteger col = 0; col < self.numberOfColumns; col++)
        {
            TJMGameBoardCellState state = [self gameBoardCellStateAtRow:row column:col];
            
            NSString *gamePieceColor =  NSStringFromTJMGameBoardCellState(state);
            [description appendFormat:@"%@ ", gamePieceColor];
        }
        
        [description appendString:@"\n"];
    }
    
    return description;
}

@end
