//
//  CategoryPie.h
//  Cake
//
//  Created by Daniel Velasco on 10/13/14.
//  Copyright (c) 2014 jam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryPie : NSObject

@property (nonatomic ,copy) NSString *titleCategory;
@property (nonatomic, copy) NSString *nameImage;
@property (assign) CGFloat anglePie;
@property (assign) CGFloat spaceTriangle;
@property (nonatomic, strong) UIColor *colorPie;
@property (assign) CGRect rectImageTitle;
@property (assign) CGPoint pointTriangle;

-(id)initWithCategory:(NSString *)imageName colorPie:(UIColor *)color anglePie:(CGFloat)angle title:(NSString*)title;
- (UIImageView *)buildFrameForImageHorizontal;
- (UIImageView *)buildFrameImageBottomVertical;
- (UIImageView *)buildFrameImageTopVertical;
- (UILabel *)buildFrameLabelHorizontal;
- (UILabel *)buildFrameLabelVerticalTop;
- (UILabel *)buildFrameLabelVerticalBottom;
- (CGFloat)getWidthHorizontal;
- (CGFloat)getHeightVertical;
- (CGFloat)getWidthVertical:(CGFloat)widthLimit;
- (void)sizeToFitLabel;
@end
