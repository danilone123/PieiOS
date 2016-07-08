//
//  PieView.m
//  Cake
//
//  Created by Daniel Velasco on 10/13/14.
//  Copyright (c) 2014 jam. All rights reserved.
//

#import "PieView.h"
#import "CategoryPie.h"

//#define kHeightSinglePiece 40.0f
#define kHeigthTriangle 10.0f
#define kAngleTriangle 5.0f
#define kAngleTriangleLimit 2.0f
#define kSpaceBetweenPiece 3.0f
#define kHeightViewOutsideIpad 30.0f
#define kWidthViewOutsideIpad 50.0f
#define kWidthViewOutsideIphone 40.0f
#define kHeightViewOutsideIphone 20.0f
@interface PieView ()

@property (nonatomic,strong) UILabel *topLabel;
@property (nonatomic, strong) UILabel *bottomLabel;


@end

@implementation PieView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        self.layer.masksToBounds = YES;
        self.arrayCategories = [NSMutableArray array];
        self.topTitle= @"Total";
        self.bottomTitle = @"100%";
        self.heightSinglePiece = 40.0f;
    }
    
    return self;
}

- (BOOL)isRectCovered:(CGRect)rectToCheck
{
    CGRect rectChecked = CGRectNull;
    CGPoint p1 = CGPointMake(rectToCheck.origin.x, rectToCheck.origin.y);
    CGPoint p2 = CGPointMake(rectToCheck.origin.x, rectToCheck.origin.y + rectToCheck.size.height);
    CGPoint p3 = CGPointMake(rectToCheck.origin.x + rectToCheck.size.width, rectToCheck.origin.y + rectToCheck.size.height);
    CGPoint p4 = CGPointMake(rectToCheck.origin.x + rectToCheck.size.width, rectToCheck.origin.y);
   for (CategoryPie *category in self.arrayCategories)
   {
       rectChecked = category.rectImageTitle;
       if (!CGRectIsNull(rectToCheck))
       {
           if (CGRectContainsPoint(rectChecked, p1) || CGRectContainsPoint(rectChecked, p2) || CGRectContainsPoint(rectChecked, p3) || CGRectContainsPoint(rectChecked, p4))
           {
               return TRUE;
           }
       }
   }
    
    return FALSE;
}

//builds the view that will be the one that the triangle points to
- (void)buildImageAndLabel
{
    CGFloat angleTriangle = 0.0f;
    CGRect firstRect = CGRectNull;
  //  CGFloat widthView = IS_IPAD?kWidthViewOutsideIpad:kWidthViewOutsideIphone;
    CGFloat heightView = IS_IPAD?kHeightViewOutsideIpad:kHeightViewOutsideIphone;
   for (CategoryPie *category in self.arrayCategories)
   {
       [category sizeToFitLabel];
       CGFloat angleToMove = category.anglePie;
       CGFloat angleTemp = angleTriangle + (angleToMove - kSpaceBetweenPiece)/2.0f;
       if (0.0f<=angleTemp && angleTemp <45.0f)//40 , 20
       {
          // CGPoint widthHeight= [category bu]
           CGRect secRect = CGRectMake(category.pointTriangle.x +3 , category.pointTriangle.y - (heightView/2.0), [category getWidthHorizontal], heightView);
            if ([self isRectCovered:secRect ])
            {
                secRect = CGRectMake(category.pointTriangle.x + 3, firstRect.origin.y - firstRect.size.height - 2, [category getWidthHorizontal], heightView);
            }
          
           category.rectImageTitle = secRect;
           UIView *tempView = [[UIView alloc] initWithFrame:category.rectImageTitle];
           tempView.backgroundColor = [UIColor grayColor];
         //  [self addSubview:tempView];
           UIImageView *image = [category buildFrameForImageHorizontal];
           UILabel *lblPercentage = [category buildFrameLabelHorizontal];
          // [lblPercentage sizeToFit];
           //[[UILabel alloc] init];
          // lblPercentage.font = [UIFont fontWithName:@"Helvetica" size:13.0f];
           [self addSubview:lblPercentage];
           [self addSubview:image];
       }
       else if (45<= angleTemp && angleTemp < 135)//20,40
       {
           CGFloat widthTemp = [category getWidthVertical:heightView];
           CGRect secRect = CGRectMake(category.pointTriangle.x -(widthTemp/2.0f) , category.pointTriangle.y - [category getHeightVertical]-3, widthTemp, [category getHeightVertical]);
           if ([self isRectCovered:secRect ])
           {
                secRect = CGRectMake(firstRect.origin.x - widthTemp -3 , category.pointTriangle.y - [category getHeightVertical]-3, widthTemp, [category getHeightVertical]);
           }
           category.rectImageTitle = secRect;
           
           
           UIView *tempView = [[UIView alloc] initWithFrame:category.rectImageTitle];
           tempView.backgroundColor = [UIColor grayColor];
         //  [self addSubview:tempView];
           UIImageView *image = [category buildFrameImageBottomVertical];
           UILabel *lblPercentage = [category buildFrameLabelVerticalTop];//[[UILabel alloc] init];
          // lblPercentage.font = [UIFont fontWithName:@"Helvetica" size:13.0f];
           [self addSubview:lblPercentage];
           [self addSubview:image];
           
       }
       else if (135<= angleTemp && angleTemp < 180)//20,40
       {
           CGFloat widthTemp = [category getWidthVertical:heightView];
           CGRect secRect = CGRectMake(category.pointTriangle.x - widthTemp -3, category.pointTriangle.y - [category getHeightVertical]-3, widthTemp, [category getHeightVertical]);
           if ([self isRectCovered:secRect])
           {
               secRect = CGRectMake(firstRect.origin.x - widthTemp -3 , category.pointTriangle.y - [category getHeightVertical]-3, widthTemp, [category getHeightVertical]);
           }
           category.rectImageTitle = secRect;
           
           UIView *tempView = [[UIView alloc] initWithFrame:category.rectImageTitle];
           tempView.backgroundColor = [UIColor grayColor];
         // [self addSubview:tempView];
           UIImageView *image = [category buildFrameImageBottomVertical];
           UILabel *lblPercentage = [category buildFrameLabelVerticalTop];//[[UILabel alloc] init];
          // lblPercentage.font = [UIFont fontWithName:@"Helvetica" size:13.0f];
           
           //lblPercentage.frame = CGRectMake(secRect.origin.x, secRect.origin.y, secRect.size.width, secRect.size.height-3 - image.frame.size.height);
           [self addSubview:lblPercentage];
           [self addSubview:image];
           
       }

       else if (180<= angleTemp && angleTemp < 225)//20,40
       {
           CGFloat widthTemp = [category getWidthVertical:heightView];
           CGRect secRect = CGRectMake(category.pointTriangle.x - widthTemp -3 , category.pointTriangle.y , widthTemp, [category getHeightVertical]);
           if ([self isRectCovered:secRect])
           {
               secRect = CGRectMake(firstRect.origin.x - widthTemp -3 , category.pointTriangle.y, widthTemp, [category getHeightVertical]);
           }
           category.rectImageTitle = secRect;
           UIView *tempView = [[UIView alloc] initWithFrame:category.rectImageTitle];
           tempView.backgroundColor = [UIColor grayColor];
         //  [self addSubview:tempView];
           UIImageView *image = [category buildFrameImageTopVertical];
           UILabel *lblPercentage = [category buildFrameLabelVerticalBottom];//[[UILabel alloc] init];
         //  lblPercentage.font = [UIFont fontWithName:@"Helvetica" size:13.0f];
           [self addSubview:lblPercentage];
           [self addSubview:image];
           
           
       }
       else if (225<=angleTemp && angleTemp<=360)
       {
           CGFloat widthTemp = [category getWidthVertical:heightView];
           CGRect secRect = CGRectMake(category.pointTriangle.x - (widthTemp/2.0f) , category.pointTriangle.y + 3 , widthTemp, [category getHeightVertical]);
           if ([self isRectCovered:secRect])
           {
               secRect = CGRectMake(firstRect.origin.x + firstRect.size.width +3 , category.pointTriangle.y + 3, widthTemp, [category getHeightVertical]);
           }
           category.rectImageTitle = secRect;
           
           UIView *tempView = [[UIView alloc] initWithFrame:category.rectImageTitle];
           tempView.backgroundColor = [UIColor grayColor];
          // [self addSubview:tempView];
           UIImageView *image = [category buildFrameImageTopVertical];
           UILabel *lblPercentage = [category buildFrameLabelVerticalBottom];//[[UILabel alloc] init];
           //lblPercentage.font = [UIFont fontWithName:@"Helvetica" size:13.0f];
           [self addSubview:lblPercentage];
           [self addSubview:image];
           
           
       }
       UIView *tempView = [[UIView alloc] initWithFrame:category.rectImageTitle];
       tempView.backgroundColor = [UIColor redColor];
     //  [self addSubview:tempView];
       firstRect = category.rectImageTitle;
        angleTriangle += angleToMove;
    }
}

- (CGPoint)getPointInCircle:(CGFloat)angle radius:(CGFloat)r center:(CGPoint)cx
{
    angle = [self radians:angle];
    CGPoint p= CGPointMake(0, 0);
    p.x = cx.x + (r * cos(angle));
    p.y = cx.y - (r * sin(angle));
    return p;
}

//avoid problems when the angle is too small
- (void)getCorrectAngles
{
    CGFloat sizeToReduce = 0.0f;
    for(CategoryPie *category in self.arrayCategories)
    {
        CGFloat anglePiece = category.anglePie;
        category.spaceTriangle = kAngleTriangle;
        //making size of the base of triangle smaller.
        //When the angle is smaller than 9, the triangle looks bigger than the angle
        if (anglePiece < 9.0f)
        {
            category.spaceTriangle = kAngleTriangleLimit;
        }
        //when the angle is minor to 6, the black area looks bigger
        if (anglePiece < 6.0f)
        {
            sizeToReduce += (6.0f - category.anglePie);
            category.anglePie = 6.0f;
        }
    }
    
    NSArray *sortedArray;
    sortedArray = [self.arrayCategories sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSNumber *first = [NSNumber  numberWithFloat:[(CategoryPie *)a anglePie]];
        NSNumber *second = [NSNumber  numberWithFloat:[(CategoryPie *)b anglePie]];
        return [first compare:second];
    }];
    CategoryPie *biggestAngle = [sortedArray objectAtIndex:sortedArray.count-1];
    biggestAngle.anglePie -= sizeToReduce;
}


- (void)buildPie:(CGFloat)radiusCircle heightSinglePiece:(CGFloat)singlePieceHeight
{
    self.heightSinglePiece = singlePieceHeight;
    [self getCorrectAngles];
    [self.layer addSublayer:[self buildCircleLayer:radiusCircle color:[UIColor blackColor] viewFrame:self.frame]];
    CGFloat endAngle = [self radians:360];
    CGFloat angleTriangle = 0;
    
    for (CategoryPie *category in self.arrayCategories)
    {
        CGFloat angleToMove = category.anglePie;//((NSNumber *)[category objectAtIndex:0]).floatValue;
        CGFloat spaceTriangle= category.spaceTriangle;//((NSNumber *)[category objectAtIndex:3]).floatValue;
        CGFloat angleTemp = angleTriangle + (angleToMove - kSpaceBetweenPiece)/2.0f;
        UIColor *colorPieceCake = category.colorPie;//(UIColor *)[category objectAtIndex:1];
        CGFloat startAngle = endAngle - [self radians:angleToMove] + [self radians:kSpaceBetweenPiece];
        [self.layer addSublayer:[self buildLayer:startAngle endAngle:endAngle color:colorPieceCake viewFrame:self.frame radius:radiusCircle]];
        [self.layer addSublayer:[self buildTriangleLayer:angleTemp color:colorPieceCake viewFrame:self.frame radius:radiusCircle angleForTriangle:spaceTriangle category:category]];
        angleTriangle += (angleToMove);
        endAngle = startAngle - [self radians:kSpaceBetweenPiece];
        
        
    }
    
    [self.layer addSublayer:[self buildCircleLayer:radiusCircle-self.heightSinglePiece color:[UIColor blackColor] viewFrame:self.frame]];
    
    [self.layer addSublayer:[self buildCircleLayer:radiusCircle-self.heightSinglePiece-10 color:[UIColor colorWithRed:66.0/255.0 green:134.0/255.0 blue:87.0/255.0 alpha:1.0] viewFrame:self.frame]];
    
    [self buildCenterLabels:radiusCircle];
    [self buildImageAndLabel];
    
}

- (CALayer *)buildTriangleLayer:(CGFloat)angle color:(UIColor*)colorTriangle viewFrame:(CGRect)viewFrame radius:(CGFloat)radius angleForTriangle:(CGFloat)angleTriangle category:(CategoryPie *)category
{
    CGPoint centerPoint = CGPointMake(viewFrame.size.width/2.0f, viewFrame.size.height/2.0f);
    CALayer *sublayer = [CALayer layer];
    sublayer.backgroundColor = colorTriangle.CGColor;
    sublayer.frame = CGRectMake(0, 0, viewFrame.size.width, viewFrame.size.height);
    sublayer.delegate = self.controller;
    CGPoint firstPoint = [self getPointInCircle:angle radius:radius + kHeigthTriangle center:CGPointMake(centerPoint.x, centerPoint.y)];
    category.pointTriangle = firstPoint;
    CGPoint secondPoint =[self getPointInCircle:angle-angleTriangle radius:radius center:CGPointMake(centerPoint.x, centerPoint.y)];
    CGPoint thirdPoint =[self getPointInCircle:angle+angleTriangle radius:radius center:CGPointMake(centerPoint.x, centerPoint.y)];
    
    CGMutablePathRef ctx = CGPathCreateMutable();
    
    CGPathMoveToPoint(ctx, NULL, firstPoint.x, firstPoint.y);
    
    CGPathAddLineToPoint(ctx, NULL,
                         secondPoint.x, secondPoint.y);
    CGPathAddLineToPoint(ctx, NULL,
                         thirdPoint.x, thirdPoint.y);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithCGPath:ctx];
    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.path = path.CGPath;
    sublayer.mask = mask;
    [sublayer setNeedsDisplay];
    return sublayer;
    
}

- (CALayer *)buildCircleLayer:(CGFloat)radio color:(UIColor *) colorCircle viewFrame:(CGRect)frameView
{
    CALayer *sublayer = [CALayer layer];
    sublayer.backgroundColor = colorCircle.CGColor;
    sublayer.shadowOffset = CGSizeMake(0, 3);
    sublayer.shadowRadius = 5.0;
    sublayer.shadowColor = [UIColor blackColor].CGColor;
    sublayer.shadowOpacity = 0.8;
    sublayer.frame = CGRectMake(0, 0, frameView.size.width, frameView.size.height);
    CGMutablePathRef context = CGPathCreateMutable();
    CGPoint centerPoint = CGPointMake(frameView.size.width/2.0f, frameView.size.height/2.0f);
    
    CGPathAddArc(context, NULL, centerPoint.x, centerPoint.y, radio, 0, [self radians:360] , 0);
    CGPathAddLineToPoint(context, NULL, centerPoint.x , centerPoint.y);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithCGPath:context];
    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.path = path.CGPath;
    sublayer.mask = mask;
    
    return  sublayer;
}

-(CALayer *)buildLayer:(CGFloat)startAngle endAngle :(CGFloat)endAngle color:(UIColor *)colorLayer viewFrame:(CGRect)frameView radius:(CGFloat)radius
{
    CGMutablePathRef context = CGPathCreateMutable();
    CGPoint centerPoint = CGPointMake(frameView.size.width/2.0f, frameView.size.height/2.0f);
    CGPathAddArc(context, NULL, centerPoint.x, centerPoint.y, radius,startAngle , endAngle , 0);
    CGPathAddLineToPoint(context, NULL, centerPoint.x, centerPoint.y);
    CALayer *sublayer = [CALayer layer];
    sublayer.delegate = self.controller;
    sublayer.backgroundColor = colorLayer.CGColor;
    
    sublayer.frame = CGRectMake(0, 0, frameView.size.width, frameView.size.height);
    UIBezierPath *path = [UIBezierPath bezierPathWithCGPath:context];
    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.path = path.CGPath;
    sublayer.mask = mask;
    [sublayer setNeedsDisplay];
    return  sublayer;
}

//uses other logic to draw the pie. it will have the correct angles but the separation
//between pies will be different.
-(CALayer *)buildLayer:(CGFloat)startAngle endAngle :(CGFloat)endAngle color:(UIColor *)colorLayer viewFrame:(CGRect)frameView radius:(CGFloat)radius angleToMove:(CGFloat)angleToMove
{
    
    CGMutablePathRef context = CGPathCreateMutable();
    CGPoint centerPoint = CGPointMake(frameView.size.width/2.0f, frameView.size.height/2.0f);
    CGPoint p = [self getPointInCircle:angleToMove radius:10 center:centerPoint];
    CGPathAddArc(context, NULL, p.x, p.y, radius,startAngle , endAngle , 0);
    CGPathAddLineToPoint(context, NULL, p.x, p.y);
    CALayer *sublayer = [CALayer layer];
    sublayer.delegate = self.controller;
    sublayer.backgroundColor = colorLayer.CGColor;
    
    sublayer.frame = CGRectMake(0, 0, frameView.size.width, frameView.size.height);
    UIBezierPath *path = [UIBezierPath bezierPathWithCGPath:context];
    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.path = path.CGPath;
    sublayer.mask = mask;
    [sublayer setNeedsDisplay];
    return  sublayer;
}

- (void)buildPieWithCorrectangles:(CGFloat)radiusCircle
{
    [self getCorrectAngles];
    [self.layer addSublayer:[self buildCircleLayer:radiusCircle color:[UIColor blackColor] viewFrame:self.frame]];
    CGFloat endAngle = [self radians:360];
    CGFloat angleTriangle = 0;
    
    for (CategoryPie *category in self.arrayCategories)
    {
        CGFloat angleToMove = category.anglePie;//((NSNumber *)[category objectAtIndex:0]).floatValue;
        CGFloat spaceTriangle= category.spaceTriangle;//((NSNumber *)[category objectAtIndex:3]).floatValue;
        CGFloat angleTemp = angleTriangle + (angleToMove - 0)/2.0f;
        UIColor *colorPieceCake = category.colorPie;//(UIColor *)[category objectAtIndex:1];
        CGFloat startAngle = endAngle - [self radians:angleToMove] ;//+ [self radians:kSpaceBetweenPiece];
        
        [self.layer addSublayer:[self buildLayer:startAngle endAngle:endAngle color:colorPieceCake viewFrame:self.frame radius:radiusCircle angleToMove:angleTemp]];
      //  [self.layer addSublayer:[self buildTriangleLayer:angleTemp color:colorPieceCake viewFrame:self.frame radius:radiusCircle angleForTriangle:spaceTriangle]];
        angleTriangle += (angleToMove);
        endAngle = startAngle;//-[self radians:kSpaceBetweenPiece];
        
        
    }
    
      // [self.layer addSublayer:[self buildCircleLayer:radiusCircle-kHeightSinglePiece color:[UIColor blackColor] viewFrame:self.frame]];
    
    [self.layer addSublayer:[self buildCircleLayer:/*radiusCircle-kHeightSinglePiece-10*/10 color:[UIColor colorWithRed:66.0/255.0 green:134.0/255.0 blue:87.0/255.0 alpha:1.0] viewFrame:self.frame]];
    
    //  [self buildCenterLabels:radiusCircle];
    
}

- (CGFloat)radians:(CGFloat)degrees
{
    return degrees * M_PI/180;
}
#pragma mark - center text

- (void)buildCenterLabels:(CGFloat)radius
{
    CGFloat kSpaceLabel = 20.0f;
    CGFloat radiusCircleGreen = radius-self.heightSinglePiece-10;
    kSpaceLabel = (radiusCircleGreen*2)>(kSpaceLabel*2)?kSpaceLabel : 10.0f;
    CGPoint centerPoint = CGPointMake(self.frame.size.width/2.0f, self.frame.size.height/2.0f);
    CGFloat heightForTwoLabels = (radiusCircleGreen*2)-(kSpaceLabel*2);
    CGFloat firstHeight = (heightForTwoLabels/2.0)-10.0f;
    CGFloat secondHeight =(heightForTwoLabels/2.0);
    self.topLabel = [[UILabel alloc] initWithFrame:CGRectMake(centerPoint.x - radiusCircleGreen + kSpaceLabel, centerPoint.y - radiusCircleGreen + kSpaceLabel, (radiusCircleGreen*2)-(kSpaceLabel*2), firstHeight)];
    self.topLabel.backgroundColor = [UIColor clearColor];
    self.topLabel.font = [UIFont fontWithName:@"Helvetica" size:20.0f];
    
    self.topLabel.textColor = [UIColor colorWithRed:114.0/255.0 green:144.0/255.0 blue:124.0/255.0 alpha:1.0f];
    self.topLabel.text = self.topTitle;
    self.topLabel.adjustsFontSizeToFitWidth = YES;
    self.topLabel.textAlignment = NSTextAlignmentCenter;
    [self.topLabel sizeToFit];
    [self addSubview:self.topLabel];
    
    self.bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(centerPoint.x - radiusCircleGreen + kSpaceLabel,self.topLabel.frame.origin.y + self.topLabel.frame.size.height , (radiusCircleGreen*2)-(kSpaceLabel*2), secondHeight)];
    self.bottomLabel.backgroundColor= [UIColor clearColor];
    self.bottomLabel.font = [UIFont fontWithName:@"Helvetica" size:30.0f];
    self.bottomLabel.textColor = [UIColor colorWithRed:114.0/255.0 green:144.0/255.0 blue:124.0/255.0 alpha:1.0f];
    self.bottomLabel.text = self.bottomTitle;
    
    [self.bottomLabel sizeToFit];
    self.bottomLabel.textAlignment = NSTextAlignmentCenter;
    self.bottomLabel.center = CGPointMake(centerPoint.x , centerPoint.y +10);
    self.topLabel.center = CGPointMake(centerPoint.x , self.bottomLabel.frame.origin.y - self.topLabel.frame.size.height/2.0f);
    [self addSubview:self.bottomLabel];
}


- (void)setTopTitle:(NSString *)topTitle
{
    if (_topTitle != topTitle)
    {
        _topTitle = topTitle;
        self.topLabel.text= topTitle;
    }
}

- (void)setBottomTitle:(NSString *)bottomTitle
{
    if (_bottomTitle != bottomTitle)
    {
        _bottomTitle = bottomTitle;
        self.bottomLabel.text = bottomTitle;
    }
}


@end
