//
//  UIView+FadeEffict.m
//  MaskView渐变效果
//
//  Created by wishchen on 15/12/13.
//  Copyright © 2015年 wishchen. All rights reserved.
//

#import "UIView+FadeEffict.h"

@implementation UIView (FadeEffict)

- (void)fadeEffectWithDuration:(NSTimeInterval)duration FadeMode:(UIViewFadeMode)fadeMode
{
    CGPoint start = CGPointZero;
    CGPoint end   = CGPointZero;
    CGRect frame  = CGRectZero;
    UIView *mask  = [[UIView alloc] init];
    switch (fadeMode)
    {
        case UIViewFadeFromRight:
            {
                start           = CGPointMake(0, 0);
                end             = CGPointMake(1, 0);
                mask            = [self fadeWithStartPoint:start EndPoint:end];
                frame           = mask.frame;
                frame.origin.x -= frame.size.width;
            }
            break;
        case UIViewFadeFromLeft:
            {
                start           = CGPointMake(1, 0);
                end             = CGPointMake(0, 0);
                mask            = [self fadeWithStartPoint:start EndPoint:end];
                frame           = mask.frame;
                frame.origin.x += frame.size.width;
            }
            break;
        case UIViewFadeFromTop:
            {
                start           = CGPointMake(0, 0);
                end             = CGPointMake(1, 1);
                mask            = [self fadeWithStartPoint:start EndPoint:end];
                frame           = mask.frame;
                frame.origin.y += frame.size.height;
            }
            break;
        case UIViewFadeFromBottum:
            {
                start           = CGPointMake(1, 1);
                end             = CGPointMake(0, 0);
                mask            = [self fadeWithStartPoint:start EndPoint:end];
                frame           = mask.frame;
                frame.origin.y -= frame.size.height;
            }
            break;
        case UIViewFadeFromBottomLeft:
        {
            start           = CGPointMake(0, 1);
            end             = CGPointMake(1, 0);
            mask            = [self fadeWithStartPoint:start EndPoint:end];
            frame           = mask.frame;
            frame.origin.x += frame.size.width;
            frame.origin.y -= frame.size.height;
        }
            break;
        case UIViewFadeFromTopLeft:
        {
            start           = CGPointMake(0, 0);
            end             = CGPointMake(1, 1);
            mask            = [self fadeWithStartPoint:start EndPoint:end];
            frame           = mask.frame;
            frame.origin.x += frame.size.width;
            frame.origin.y += frame.size.height;
        }
            break;
        default:
            break;
    }
    [self fadeWithDuration:duration MaskView:mask NewFrame:frame];
}

- (UIView *)fadeWithStartPoint:(CGPoint)startPoint EndPoint:(CGPoint)endpoint
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame            = self.bounds;
    gradientLayer.colors           = @[(__bridge id)[UIColor clearColor].CGColor,
                                       (__bridge id)[UIColor blackColor].CGColor,
                                       (__bridge id)[UIColor clearColor].CGColor];
    gradientLayer.locations        = @[@0.01,@0.1,@0.9,@0.99];
    gradientLayer.startPoint       = startPoint;
    gradientLayer.endPoint         = endpoint;
    
    UIView *mask                   = [[UIView alloc] initWithFrame:self.bounds];
    [mask.layer addSublayer:gradientLayer];
    self.maskView                  = mask;
    
    return self.maskView;
}

- (void)fadeWithDuration:(NSTimeInterval)duration MaskView:(UIView *)mask NewFrame:(CGRect)frame
{
    [UIView animateWithDuration:duration animations:^{
        mask.frame = frame;
    }];
}
@end
