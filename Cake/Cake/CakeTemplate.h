//
//  CakeTemplate.h
//  Cake
//
//  Created by Daniel Velasco on 10/13/14.
//  Copyright (c) 2014 jam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CakeTemplate : UIView
@property (nonatomic, strong) id controller;
@property (nonatomic, strong) NSMutableArray *arrayCategories;
@property (nonatomic, copy) NSString *topTitle;
@property (nonatomic, copy) NSString *bottomTitle;

- (void)buildPie:(CGFloat)radiusCircle;
@end
