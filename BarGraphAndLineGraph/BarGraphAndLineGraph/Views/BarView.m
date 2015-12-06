//
//  BarView.m
//  BarGraphAndLineGraph
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 Sky-jay. All rights reserved.
//

#import "BarView.h"

#define kRectW rect.size.width
#define kRectH rect.size.height

@implementation BarView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self drawCoordinateSystemWithRect:rect];
}

- (void)drawCoordinateSystemWithRect:(CGRect)rect
{
    //Draw CoordinateSystem
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    CGContextMoveToPoint(ctx, 10, 10);
    CGContextAddLineToPoint(ctx, 10, kRectH - 10);
    CGContextAddLineToPoint(ctx, kRectW - 10, kRectH - 10);
    CGContextSetRGBStrokeColor(ctx, 0, 0, 0, 1);
    
    CGContextStrokePath(ctx);
    
    //Draw SubLine
    for (int i = 7; i > 0; i--) {
        CGContextMoveToPoint(ctx, 10, kRectH - 10 - i * 50);
        CGContextAddLineToPoint(ctx, kRectW - 10, kRectH - 10 - i *50);
        const CGFloat lengths[] = {5, 5};
        CGContextSetLineDash(ctx, 0, lengths, 2);
        [[UIColor grayColor] setStroke];
        CGContextStrokePath(ctx);
    }
    for (int i = 3; i > 0; i--) {
        CGContextMoveToPoint(ctx, 10 + i *100, 10);
        CGContextAddLineToPoint(ctx, 10 + i * 100, kRectH - 10);
        const CGFloat lengths[] = {5, 5};
        CGContextSetLineDash(ctx, 0, lengths, 2);
        [[UIColor grayColor] setStroke];
        CGContextStrokePath(ctx);
    }
    CGContextRestoreGState(ctx);
    
}

@end
