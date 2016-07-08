//
//  CategoryPie.m
//  Cake
//
//  Created by Daniel Velasco on 10/13/14.
//  Copyright (c) 2014 jam. All rights reserved.
//

#import "CategoryPie.h"
#define kFontSizeiPad 15.0f
#define kFontSizeiPhone 10.0f
@interface CategoryPie ()

@property (nonatomic,strong) UIImageView *imageIcon;
@property (nonatomic,strong) UILabel *labelIcon;


@end

@implementation CategoryPie

-(id)initWithCategory:(NSString *)imageName colorPie:(UIColor *)color anglePie:(CGFloat)angle  title:(NSString*)title
{
    self = [super init];
    if (self)
    {
        self.nameImage = imageName;
        self.colorPie = color;
        self.anglePie = angle;
        self.titleCategory = title;
        self.rectImageTitle = CGRectNull;
        self.imageIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.nameImage]];
        self.labelIcon = [[UILabel alloc] init];
        self.labelIcon.textColor = self.colorPie;
        self.labelIcon.text = title;
        self.labelIcon.textAlignment = NSTextAlignmentCenter;
        
        if (IS_IPAD)
        {
           self.labelIcon.font = [UIFont fontWithName:@"Helvetica" size:kFontSizeiPad];
        }
        else
        {
            self.labelIcon.font = [UIFont fontWithName:@"Helvetica" size:kFontSizeiPhone];
        }
        
    }
    return self;
}

- (void)setNameImage:(NSString *)nameImage
{
    if (_nameImage != nameImage)
    {
        _nameImage = nameImage;
        self.imageIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:nameImage]];
    }
}

- (void)setTitleCategory:(NSString *)titleCategory
{
    if (_titleCategory!=titleCategory)
    {
        _titleCategory = titleCategory;
        self.labelIcon.text = titleCategory;
    }
}

- (UILabel *)buildFrameLabelHorizontal
{
    self.labelIcon.frame = CGRectMake(self.imageIcon.frame.size.width+ self.rectImageTitle.origin.x + 3, self.rectImageTitle.origin.y, self.rectImageTitle.size.width - 3 - self.imageIcon.frame.size.width, self.rectImageTitle.size.height);
    return self.labelIcon;
}

- (UILabel *)buildFrameLabelVerticalTop
{
  
    self.labelIcon.frame = CGRectMake(self.rectImageTitle.origin.x, self.imageIcon.frame.origin.y -3 - self.labelIcon.frame.size.height, self.labelIcon.frame.size.width, self.labelIcon.frame.size.height);
    return self.labelIcon;
}

- (UILabel *)buildFrameLabelVerticalBottom
{
   // self.labelIcon.frame =CGRectMake(self.rectImageTitle.origin.x, self.rectImageTitle.origin.y + self.imageIcon.frame.size.height + 3, self.rectImageTitle.size.width, self.rectImageTitle.size.height-3 - self.imageIcon.frame.size.height);
   // [self.labelIcon sizeToFit];
    
    self.labelIcon.frame =CGRectMake(self.rectImageTitle.origin.x, self.imageIcon.frame.size.height + self.imageIcon.frame.origin.y + 3, self.labelIcon.frame.size.width, self.labelIcon.frame.size.height);
    
    return self.labelIcon;
}

- (UIImageView *)buildFrameForImageHorizontal
{
    self.imageIcon.frame = CGRectMake(self.rectImageTitle.origin.x, self.rectImageTitle.origin.y + (self.rectImageTitle.size.height/2.0f) - self.imageIcon.frame.size.height/2.0f, self.imageIcon.frame.size.width, self.imageIcon.frame.size.height);
    return  self.imageIcon;
}

- (UIImageView *)buildFrameImageBottomVertical
{
   self.imageIcon.frame =  CGRectMake( self.rectImageTitle.origin.x + (self.rectImageTitle.size.width/2.0f) - (self.imageIcon.frame.size.width/2.0f), self.rectImageTitle.size.height + self.rectImageTitle.origin.y- self.imageIcon.frame.size.height,self.imageIcon.frame.size.width, self.imageIcon.frame.size.height);
    return self.imageIcon;
}

- (UIImageView *)buildFrameImageTopVertical
{
     self.imageIcon.frame = CGRectMake( self.rectImageTitle.origin.x + (self.rectImageTitle.size.width/2.0f) - (self.imageIcon.frame.size.width/2.0f), self.rectImageTitle.origin.y,self.imageIcon.frame.size.width, self.imageIcon.frame.size.height);
    return self.imageIcon;
}

- (CGFloat)getWidthHorizontal
{
    return  self.imageIcon.frame.size.width + 3 + self.labelIcon.frame.size.width;
}

- (CGFloat)getHeightVertical
{
    return  self.imageIcon.frame.size.height + 3 + self.labelIcon.frame.size.height;
}

- (CGFloat)getWidthVertical:(CGFloat)widthLimit
{
    CGFloat width = self.labelIcon.frame.size.width;
    if (widthLimit > width)
    {
        return widthLimit;
    }
    else
    {
        return width;
    }
}

- (void)sizeToFitLabel
{
    [self.labelIcon sizeToFit];
}

@end
