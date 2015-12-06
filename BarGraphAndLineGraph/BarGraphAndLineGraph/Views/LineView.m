//
//  LineView.m
//  BarGraphAndLineGraph
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 Sky-jay. All rights reserved.
//

#import "LineView.h"

#define kRectW rect.size.width
#define kRectH rect.size.height
#define kLeftMargin 20
#define kBottomMargin 20

@implementation LineView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self drawCoordinateSystemWithRect:rect];
    [self drawLineWithRect:rect];
}

- (void)drawCoordinateSystemWithRect:(CGRect)rect
{
    //Draw CoordinateSystem
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    CGContextMoveToPoint(ctx, kLeftMargin, 10);
    CGContextAddLineToPoint(ctx, kLeftMargin, kRectH - kBottomMargin);
    CGContextAddLineToPoint(ctx, kRectW - 10, kRectH - kBottomMargin);
    CGContextSetRGBStrokeColor(ctx, 0, 0, 0, 1);
    
    CGContextStrokePath(ctx);
    
    //Draw SubLine
    for (int i = 7; i > 0; i--) {
        CGContextMoveToPoint(ctx, kLeftMargin, kRectH - kBottomMargin - i * 50);
        CGContextAddLineToPoint(ctx, kRectW - 10, kRectH - kBottomMargin - i * 50);
        const CGFloat lengths[] = {5, 5};
        CGContextSetLineDash(ctx, 0, lengths, 2);
        [[UIColor grayColor] setStroke];
        CGContextStrokePath(ctx);
    }
    for (int i = 6; i > 0; i--) {
        CGContextMoveToPoint(ctx, kLeftMargin + i * 50, kBottomMargin);
        CGContextAddLineToPoint(ctx, kLeftMargin + i * 50, kRectH - kBottomMargin);
        const CGFloat lengths[] = {5, 5};
        CGContextSetLineDash(ctx, 0, lengths, 2);
        [[UIColor grayColor] setStroke];
        CGContextStrokePath(ctx);
    }
    for (int i = 0; i < 7; i++) {
        CGFloat strW = 45;
        CGFloat strH = 20;
        CGFloat strX = kLeftMargin + i * 50 - strW / 2 ;
        CGFloat strY = kRectH - strH;
        NSString *str = [NSString stringWithFormat:@"12/0%d",i];
        NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor greenColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:17]};
        [str drawInRect:CGRectMake(strX, strY, strW, strH) withAttributes:dict];
    }
    
    CGContextRestoreGState(ctx);
}

- (void)drawLineWithRect:(CGRect)rect
{
    UIImage *image = [UIImage imageNamed:@"Little"];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(ctx, kLeftMargin + 0 * 50, kRectH - kBottomMargin - 100);
    [image drawInRect:CGRectMake(kLeftMargin + 0 * 50 - 4, kRectH - kBottomMargin - 100 - 4, 8, 8)];
    
    CGContextAddLineToPoint(ctx, kLeftMargin + 1 * 50, kRectH - kBottomMargin - 150);
    [image drawInRect:CGRectMake(kLeftMargin + 1 * 50 - 4, kRectH - kBottomMargin - 150 - 4, 8, 8)];
    CGContextAddLineToPoint(ctx, kLeftMargin + 2 * 50, kRectH - kBottomMargin - 100);
    [image drawInRect:CGRectMake(kLeftMargin + 2 * 50 - 4, kRectH - kBottomMargin - 100 - 4, 8, 8)];
    CGContextAddLineToPoint(ctx, kLeftMargin + 3 * 50, kRectH - kBottomMargin - 200);
    [image drawInRect:CGRectMake(kLeftMargin + 3 * 50 - 4, kRectH - kBottomMargin - 200 - 4, 8, 8)];
    CGContextAddLineToPoint(ctx, kLeftMargin + 4 * 50, kRectH - kBottomMargin - 200);
    [image drawInRect:CGRectMake(kLeftMargin + 4 * 50 - 4, kRectH - kBottomMargin - 200 - 4, 8, 8)];
    CGContextAddLineToPoint(ctx, kLeftMargin + 5 * 50, kRectH - kBottomMargin - 250);
    [image drawInRect:CGRectMake(kLeftMargin + 5 * 50 - 4, kRectH - kBottomMargin - 250 - 4, 8, 8)];
    CGContextAddLineToPoint(ctx, kLeftMargin + 6 * 50, kRectH - kBottomMargin - 350);
    [image drawInRect:CGRectMake(kLeftMargin + 6 * 50 - 4, kRectH - kBottomMargin - 350 - 4, 8, 8)];
    CGContextStrokePath(ctx);
}

@end
