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
    
    [self drawBarGraphWithHeight:170 location:1  rect:rect andRGBColorR:1 G:0 B:0];
    [self drawBarGraphWithHeight:270 location:2  rect:rect andRGBColorR:0 G:1 B:0];
    [self drawBarGraphWithHeight:370 location:3  rect:rect andRGBColorR:0 G:0 B:1];    
}

- (void)drawBarGraphWithHeight:(CGFloat)height location:(int)index rect:(CGRect)rect andRGBColorR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b
{
    CGFloat BarX = 10 + 100 * index;
    CGFloat BarStartY = kRectH - 10;
    CGFloat BarEndY = kRectH - 10 - height;
    CGFloat BarW = 70;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    CGContextMoveToPoint(ctx, BarX, BarStartY);
    CGContextAddLineToPoint(ctx, BarX, BarEndY);
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
    CGContextSetLineWidth(ctx, BarW);
    //    CGContextStrokePath(ctx);
    CGContextReplacePathWithStrokedPath(ctx);
    CGContextClip(ctx);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    const CGFloat components[] = {
        r, g, b, 1,
        1, 1, 1, 1,
        r, g, b, 1
    };
    const CGFloat locations[] ={0, 0.3, 1};
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, 3);
    CGContextDrawLinearGradient(ctx, gradient, CGPointMake(BarX - BarW/2, BarStartY), CGPointMake(BarX + BarW/2, BarStartY), 0);
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradient);
    CGContextRestoreGState(ctx);
}

@end
