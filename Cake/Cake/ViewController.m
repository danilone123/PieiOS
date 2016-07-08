//
//  ViewController.m
//  Cake
//
//  Created by Daniel Velasco on 10/11/14.
//  Copyright (c) 2014 jam. All rights reserved.
//

#import "ViewController.h"
#import "CakeTemplate.h"
#import "CategoryPie.h"
#import "PieView.h"
#define kHeightSinglePiece 40.0f
#define kHeigthTriangle 10.0f
#define kAngleTriangle 5.0f
#define kSpaceBetweenPiece 3.0f
@interface ViewController ()
@property (weak, nonatomic) IBOutlet PieView *viewCake;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   // [self buildcc:self.viewCake radiusCircle:110];
   /* NSArray *category1 = [NSArray arrayWithObjects:[NSNumber numberWithFloat:60],[UIColor redColor],@"People and culture",nil];
    
    NSArray *category2 = [NSArray arrayWithObjects:[NSNumber numberWithFloat:80],[UIColor purpleColor],@"Geography",nil];
    
    NSArray *category3 = [NSArray arrayWithObjects:[NSNumber numberWithFloat:70],[UIColor greenColor],@"Books",nil];
    
    NSArray *category4 = [NSArray arrayWithObjects:[NSNumber numberWithFloat:142],[UIColor orangeColor],@"People",nil];
    
    NSArray *category5 = [NSArray arrayWithObjects:[NSNumber numberWithFloat:8],[UIColor blueColor],@"People",nil];
    CategoryPie *pie1 = [[CategoryPie alloc] initWithCategory:@"empty" colorPie:[UIColor redColor] anglePie:90.0f title:@"People and culture"];
    CategoryPie *pie2 = [[CategoryPie alloc] initWithCategory:@"empty" colorPie:[UIColor purpleColor] anglePie:50.0f title:@"People and culture"];
    CategoryPie *pie3 = [[CategoryPie alloc] initWithCategory:@"empty" colorPie:[UIColor greenColor] anglePie:70.0f title:@"People and culture"];
    CategoryPie *pie4 = [[CategoryPie alloc] initWithCategory:@"empty" colorPie:[UIColor orangeColor] anglePie:137.0f title:@"People and culture"];
    CategoryPie *pie5 = [[CategoryPie alloc] initWithCategory:@"empty" colorPie:[UIColor blueColor] anglePie:8.0f title:@"People and culture"];
    CategoryPie *pie6 = [[CategoryPie alloc] initWithCategory:@"empty" colorPie:[UIColor grayColor] anglePie:5.0f title:@"People and culture"];
    */
    
    CategoryPie *pie1 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor redColor] anglePie:4.0f title:@"60.12%"];
    CategoryPie *pie2 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor purpleColor] anglePie:10.0f title:@"60%"];
    CategoryPie *pie22 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor greenColor] anglePie:10.0f title:@"60%"];
    CategoryPie *pie23 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor grayColor] anglePie:10.0f title:@"60%"];
    CategoryPie *pie24 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor grayColor] anglePie:5.0f title:@"60%"];
    CategoryPie *pie241 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor grayColor] anglePie:5.0f title:@"60%"];
     CategoryPie *pie25 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor purpleColor] anglePie:2.0f title:@"00.00%"];
    
     CategoryPie *pie3 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor purpleColor] anglePie:54.0f title:@"60%"];
    CategoryPie *pie33 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor purpleColor] anglePie:10.0f title:@"60%"];
    CategoryPie *pie333 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor purpleColor] anglePie:10.0f title:@"60%"];
     CategoryPie *pie3333 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor purpleColor] anglePie:10.0f title:@"60%"];
    CategoryPie *pie33333 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor blueColor] anglePie:10.0f title:@"60%"];
     CategoryPie *pie40 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor yellowColor] anglePie:20.0f title:@"60%"];
      CategoryPie *pie401 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor yellowColor] anglePie:10.0f title:@"60%"];
     CategoryPie *pie4 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor greenColor] anglePie:40.0f title:@"60%"];
    CategoryPie *pie44 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor greenColor] anglePie:5.0f title:@"60%"];
    CategoryPie *pie444 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor blueColor] anglePie:5.0f title:@"5%"];
    CategoryPie *pie4444 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor blueColor] anglePie:10.0f title:@"60.12%"];
    
     CategoryPie *pie44445 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor blueColor] anglePie:10.0f title:@"50%"];
    
    CategoryPie *pie5 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor orangeColor] anglePie:87.0f title:@"60%"];
    
     CategoryPie *pie6 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor blueColor] anglePie:8.0f title:@"60%"];
     CategoryPie *pie7 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor grayColor] anglePie:5.0f title:@"60%"];
    CategoryPie *pie8 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor grayColor] anglePie:5.0f title:@"60%"];
     CategoryPie *pie9 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor brownColor] anglePie:15.0f title:@"60%"];

//     CategoryPie *pie1 = [[CategoryPie alloc] initWithCategory:@"icon_cat_people_places_cult" colorPie:[UIColor redColor] anglePie:60.0f title:@"60%"];
//    CategoryPie *pie2 = [[CategoryPie alloc] initWithCategory:@"icon_cat_science_tech" colorPie:[UIColor blueColor] anglePie:40.0f title:@"40%"];
//       CategoryPie *pie3= [[CategoryPie alloc] initWithCategory:@"icon_cat_visualart_nature" colorPie:[UIColor orangeColor] anglePie:100.0f title:@"99%"];
//       CategoryPie *pie4 = [[CategoryPie alloc] initWithCategory:@"icon_cat_vocab_language" colorPie:[UIColor grayColor] anglePie:50.0f title:@"20%"];
//       CategoryPie *pie5 = [[CategoryPie alloc] initWithCategory:@"icon_cat_vocab_language" colorPie:[UIColor blueColor] anglePie:110.0f title:@"10%"];
   
    
    NSMutableArray *testArray =[NSMutableArray arrayWithObjects:pie1,pie2,pie22,pie23,pie24,pie241,pie25,pie3,pie33,pie333,pie3333,pie33333,pie40,pie401,pie4,pie44,pie444,pie4444,pie44445,pie5,pie6,pie7,pie8,pie9, nil]; //[NSMutableArray arrayWithObjects:pie1,pie2,pie3,pie4,pie5, nil];//
    [self.viewCake setController:self];
    [self.viewCake setBottomTitle:@"40%%"];
    [self.viewCake setTopTitle:@"lalala"];
    [self.viewCake setArrayCategories:testArray];
    [self.viewCake buildPie:90 heightSinglePiece:25];
    [self.viewCake setNeedsDisplay];
}

/*
- (void)buildcc :(UIView *)viewToBuild radiusCircle:(CGFloat)radiusCircle
{
    NSArray *category1 = [NSArray arrayWithObjects:[NSNumber numberWithFloat:60],[UIColor redColor],@"People and culture",nil];
    
     NSArray *category2 = [NSArray arrayWithObjects:[NSNumber numberWithFloat:80],[UIColor purpleColor],@"Geography",nil];
    
    NSArray *category3 = [NSArray arrayWithObjects:[NSNumber numberWithFloat:70],[UIColor greenColor],@"Books",nil];
    
    NSArray *category4 = [NSArray arrayWithObjects:[NSNumber numberWithFloat:148],[UIColor orangeColor],@"People",nil];
    
    NSArray *category5 = [NSArray arrayWithObjects:[NSNumber numberWithFloat:2],[UIColor blueColor],@"People",nil];
    
    NSMutableArray *anglesAndOptionsArray = [NSMutableArray arrayWithObjects:category1,category2,category3,category4,category5, nil];
    
    [viewToBuild.layer addSublayer:[self buildCircleLayer:radiusCircle color:[UIColor blackColor] view:viewToBuild]];
    CGFloat endAngle = [self radians:360];
    CGFloat angleTriangle = 0;
    
    for (NSArray *category in anglesAndOptionsArray)
    {
        CGFloat angleToMove = ((NSNumber *)[category objectAtIndex:0]).floatValue;
       // angleTriangle +=  (angleToMove/2.0f);
        CGFloat angleTemp = angleTriangle + (angleToMove - kSpaceBetweenPiece)/2.0f;
        UIColor *colorPieceCake = (UIColor *)[category objectAtIndex:1];
        CGFloat startAngle = endAngle - [self radians:angleToMove] + [self radians:kSpaceBetweenPiece];
        [self.viewCake.layer addSublayer:[self buildLayer:startAngle endAngle:endAngle color:colorPieceCake viewToBuild:self.viewCake radius:radiusCircle]];
        [viewToBuild.layer addSublayer:[self buildTriangleLayer:angleTemp color:colorPieceCake view:viewToBuild radius:radiusCircle]];
        angleTriangle += (angleToMove);
        endAngle = startAngle -[self radians:kSpaceBetweenPiece];
        
        
    }
    
    
  
    
    [viewToBuild.layer addSublayer:[self buildCircleLayer:radiusCircle-kHeightSinglePiece color:[UIColor blackColor] view:viewToBuild]];
    [viewToBuild.layer addSublayer:[self buildCircleLayer:radiusCircle-kHeightSinglePiece-10 color:[UIColor colorWithRed:151.0/255.0 green:175.0/255.0 blue:158.0/255.0 alpha:1.0] view:viewToBuild]];
   // self.viewCake.transform = CGAffineTransformMakeRotation(200);
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    tempView.backgroundColor= [UIColor brownColor];
    
   // [self.viewCake addSubview:tempView];
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
    lbl.textColor = [UIColor redColor];
    lbl.text = @"lalalal";
    [tempView addSubview:lbl];
    
}*/

void MyDrawColoredPattern (void *info, CGContextRef context) {
    
    CGColorRef dotColor = [UIColor colorWithRed:255.0/255.0 green:254/255.0f blue:254.0/255.0 alpha:0.5].CGColor; //[UIColor colorWithHue:1 saturation:1 brightness:0.07 alpha:1.0].CGColor;
    CGColorRef shadowColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.1].CGColor;
    
    CGContextSetFillColorWithColor(context, dotColor);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 1), 1, shadowColor);
    CGContextAddRect(context, CGRectMake(0, 0, 3, 3));
    //CGContextAddArc(context, 3, 3, 4, 0, radians(360), 0);
    CGContextFillPath(context);
    
//    CGContextAddArc(context, 16, 16, 4, 0, radians(360), 0);
//    CGContextFillPath(context);
    
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)context {
    
  //  CGColorRef bgColor = [UIColor redColor].CGColor;//[UIColor colorWithHue:0.6 saturation:1.0 brightness:1.0 alpha:1.0].CGColor;
   // CGContextSetFillColorWithColor(context, bgColor);
   // CGContextFillRect(context, layer.bounds);
    
    static const CGPatternCallbacks callbacks = { 0, &MyDrawColoredPattern, NULL };
    
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
