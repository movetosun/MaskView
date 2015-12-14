//
//  UIView+FadeEffict.h
//  MaskView渐变效果
//
//  Created by wishchen on 15/12/13.
//  Copyright © 2015年 wishchen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIViewFadeMode)
{
    UIViewFadeFromRight,        //右到左
    UIViewFadeFromLeft,         //左到右
    UIViewFadeFromTop,          //上到下
    UIViewFadeFromBottum,       //下到上
    UIViewFadeFromTopLeft,      //左上到右下
    UIViewFadeFromBottomLeft    //左下到右上
};

@interface UIView (FadeEffict)

- (void)fadeEffectWithDuration:(NSTimeInterval)duration FadeMode:(UIViewFadeMode)fadeMode;

@end
