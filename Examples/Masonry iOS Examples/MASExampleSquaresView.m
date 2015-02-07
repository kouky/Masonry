//
//  MASExampleSquaresView.m
//  Masonry iOS Examples
//
//  Created by Michael Koukoullis on 7/02/2015.
//  Copyright (c) 2015 Jonas Budelmann. All rights reserved.
//

#import "MASExampleSquaresView.h"

@interface MASExampleSquaresView ()
@property UIView *pinkSquareView;
@property UIView *blueSquareView;
@end

@implementation MASExampleSquaresView

// Designated initializer
- (instancetype)init
{
    self = [super initWithFrame:CGRectZero];
    
    if (self) {
        
        self.blueSquareView = [[UIView alloc] initWithFrame:CGRectZero];
        self.blueSquareView.backgroundColor = [UIColor colorWithRed:0.118 green:0.533 blue:0.969 alpha:1];
        [self addSubview:self.blueSquareView];
        
        self.pinkSquareView = [[UIView alloc] initWithFrame:CGRectZero];
        self.pinkSquareView.backgroundColor = [UIColor colorWithRed:0.918 green:0.314 blue:0.529 alpha:1];
        [self addSubview:self.pinkSquareView];
        
        [self setNeedsUpdateConstraints];
    }
    
    return self;
}

// Override UIView designated initializer
- (instancetype)initWithFrame:(CGRect)frame
{
    return [self init];
}

- (void)updateConstraints
{
    UIView *superView = self;
    UIEdgeInsets padding = UIEdgeInsetsMake(20, 20, 0, 20);
    
    [self.blueSquareView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        // Make the view a square
        make.height.equalTo(self.blueSquareView.mas_width);
        
        // Pin the view to the superview
        make.top.and.left.equalTo(superView).with.insets(padding);
        
        // Make the blue square width equal to the pink square
        make.width.equalTo(self.pinkSquareView);
        
        // Pin the blue square right edge to the pink square left edge
        make.right.equalTo(self.pinkSquareView.mas_left).with.offset(-20);
    }];
    
    [self.pinkSquareView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.and.right.equalTo(superView).with.insets(padding);
        make.height.equalTo(self.pinkSquareView.mas_width);
    }];

    [super updateConstraints];
}

@end
