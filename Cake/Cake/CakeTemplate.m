//
//  CakeTemplate.m
//  Cake
//
//  Created by Daniel Velasco on 10/13/14.
//  Copyright (c) 2014 jam. All rights reserved.
//

#import "CakeTemplate.h"
#import "CategoryPie.h"

#define kHeightSinglePiece 40.0f
#define kHeigthTriangle 10.0f
#define kAngleTriangle 5.0f
#define kAngleTriangleLimit 2.0f
#define kSpaceBetweenPiece 3.0f

@interface CakeTemplate ()

@end

@implementation CakeTemplate

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        self.layer.masksToBounds = YES;
        self.arrayCategories = [NSMutableArray array];
    }
    
    return self;
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
//        if (anglePiece < 6.0f)
//        {
//            sizeToReduce += (6.0f - category.anglePie);
//            category.anglePie = 6.0f;
//        }
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

- (void)buildCenterLabels:(CGFloat)radius
{
    CGFloat kSpaceLabel = 20.0f;
    CGFloat radiusCircleGreen = radius-kHeightSinglePiece-10;
    kSpaceLabel = (radiusCircleGreen*2)>(kSpaceLabel*2)?kSpaceLabel : 10.0f;
    CGPoint centerPoint = CGPointMake(self.frame.size.width/2.0f, self.frame.size.height/2.0f);
    CGFloat heightForTwoLabels = (radiusCircleGreen*2)-(kSpaceLabel*2);
    CGFloat firstHeight = (heightForTwoLabels/2.0)-10.0f;
    CGFloat secondHeight =(heightForTwoLabels/2.0);
    UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(centerPoint.x - radiusCircleGreen + kSpaceLabel, centerPoint.y - radiusCircleGreen + kSpaceLabel, (radiusCircleGreen*2)-(kSpaceLabel*2), firstHeight)];
    topLabel.backgroundColor = [UIColor clearColor];
    topLabel.font =[UIFont fontWithName:@"Helvetica" size:20.0f];
    //114, 144, 124
    topLabel.textColor = [UIColor colorWithRed:114.0/255.0 green:144.0/255.0 blue:124.0/255.0 alpha:1.0f];
    topLabel.text = @"Total";
    topLabel.adjustsFontSizeToFitWidth = YES;
    topLabel.textAlignment = NSTextAlignmentCenter;
    [topLabel sizeToFit];
    [self addSubview:topLabel];
    
     UILabel *bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(centerPoint.x - radiusCircleGreen + kSpaceLabel,topLabel.frame.origin.y + topLabel.frame.size.height , (radiusCircleGreen*2)-(kSpaceLabel*2), secondHeight)];
    bottomLabel.backgroundColor= [UIColor clearColor];
    bottomLabel.font = [UIFont fontWithName:@"Helvetica" size:30.0f];
    bottomLabel.textColor = [UIColor colorWithRed:114.0/255.0 green:144.0/255.0 blue:124.0/255.0 alpha:1.0f];
    bottomLabel.text = @"100 %";
    
   [bottomLabel sizeToFit];
    bottomLabel.textAlignment = NSTextAlignmentCenter;
    bottomLabel.center = CGPointMake(centerPoint.x , centerPoint.y +10);
    topLabel.center = CGPointMake(centerPoint.x , bottomLabel.frame.origin.y - topLabel.frame.size.height/2.0f);
    [self addSubview:bottomLabel];
}

- (void)buildPie:(CGFloat)radiusCircle
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
        [self.layer addSublayer:[self buildTriangleLayer:angleTemp color:colorPieceCake viewFrame:self.frame radius:radiusCircle angleForTriangle:spaceTriangle]];
        angleTriangle += (angleToMove);
        endAngle = startAngle;//-[self radians:kSpaceBetweenPiece];
        
        
    }
    
    //  [self buildTriangleLayer:30];
    //
    //    CGFloat endAngle = [self radians:360];
    //    CGFloat startAngle = endAngle - [self radians:60] + [self radians:3];
    //
    //    [self.viewCake.layer addSublayer:[self buildLayer:startAngle endAngle:endAngle color:[UIColor redColor]]];
    //    endAngle = startAngle -[self radians:3];
    //    startAngle = endAngle  - [self radians:80] + [self radians:3];
    //    [self.viewCake.layer addSublayer:[self buildLayer:startAngle endAngle:endAngle color:[UIColor yellowColor]]];
    //
    //    endAngle = startAngle - [self radians:3];
    //    startAngle = endAngle - [self radians:70] + [self radians:3];
    //    [self.viewCake.layer addSublayer:[self buildLayer:startAngle endAngle:endAngle color:[UIColor redColor]]];
    //
    //    endAngle = startAngle - [self radians:3];
    //    startAngle = endAngle - [self radians:40] + [self radians:3];
    //    [self.viewCake.layer addSublayer:[self buildLayer:startAngle endAngle:endAngle color:[UIColor orangeColor]]];
    //
    //    endAngle = startAngle - [self radians:3];
    //    startAngle = endAngle - [self radians:110] + [self radians:3];
    //    [self.viewCake.layer addSublayer:[self buildLayer:startAngle endAngle:endAngle color:[UIColor blueColor]]];
    
   // [self.layer addSublayer:[self buildCircleLayer:radiusCircle-kHeightSinglePiece color:[UIColor blackColor] viewFrame:self.frame]];
    
    [self.layer addSublayer:[self buildCircleLayer:/*radiusCircle-kHeightSinglePiece-10*/10 color:[UIColor colorWithRed:66.0/255.0 green:134.0/255.0 blue:87.0/255.0 alpha:1.0] viewFrame:self.frame]];
    
  //  [self buildCenterLabels:radiusCircle];
   
}

- (CALayer *)buildTriangleLayer:(CGFloat)angle color:(UIColor*)colorTriangle viewFrame:(CGRect)viewFrame radius:(CGFloat)radius angleForTriangle:(CGFloat)angleTriangle
{
    CGPoint centerPoint = CGPointMake(viewFrame.size.width/2.0f, viewFrame.size.height/2.0f);
    CALayer *sublayer = [CALayer layer];
    sublayer.backgroundColor = colorTriangle.CGColor;
    sublayer.frame = CGRectMake(0, 0, viewFrame.size.width, viewFrame.size.height);
    sublayer.delegate = self.controller;
    CGPoint firstPoint = [self getPointInCircle:angle radius:radius + kHeigthTriangle center:CGPointMake(centerPoint.x, centerPoint.y)];
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

void MyDrawColoredPatternPie (void *info, CGContextRef context) {
    
    CGColorRef dotColor = [UIColor colorWithRed:255.0/255.0 green:254/255.0f blue:254.0/255.0 alpha:0.5].CGColor; //[UIColor colorWithHue:1 saturation:1 brightness:0.07 alpha:1.0].CGColor;
    CGColorRef shadowColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.1].CGColor;
    
    CGContextSetFillColorWithColor(context, dotColor);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 1), 1, shadowColor);
    CGContextAddRect(context, CGRectMake(0, 0, 3, 3));
    //CGContextAddArc(context, 3, 3, 4, 0, radians(360), 0);
    CGContextFillPath(context);
}


- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)context {
    
    static const CGPatternCallbacks callbacks = { 0, &MyDrawColoredPatternPie, NULL };
    
    CGContextSaveGState(context);
    CGColorSpaceRef patternSpace = CGColorSpaceCreatePattern(NULL);
    CGContextSetFillColorSpace(context, patternSpace);
    CGColorSpaceRelease(patternSpace);
    
    CGPatternRef pattern = CGPatternCreate(NULL,
                                           layer.bounds,
                                           CGAffineTransformIdentity,
                                           8,
                                           8,
                                           kCGPatternTilingConstantSpacing,
                                           true,
                                           &callbacks);
    CGFloat alpha = 1.0;
    CGContextSetFillPattern(context, pattern, &alpha);
    CGPatternRelease(pattern);
    CGContextFillRect(context, layer.bounds);
    CGContextRestoreGState(context);
}

- (CGFloat)radians:(CGFloat)degrees
{
    return degrees * M_PI/180;
}

@end
