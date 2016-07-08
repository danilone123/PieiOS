//
//  PieView.h
//  Cake
//
//  Created by Daniel Velasco on 10/13/14.
//  Copyright (c) 2014 jam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PieView : UIView

@property (nonatomic, strong) id controller;
@property (nonatomic, strong) NSMutableArray *arrayCategories;
@property (nonatomic, copy) NSString *topTitle;
@property (nonatomic, copy) NSString *bottomTitle;
@property (nonatomic, assign) CGFloat heightSinglePiece;


- (void)buildPie:(CGFloat)radiusCircle heightSinglePiece:(CGFloat)singlePieceHeight;

@end
