//
//  ViewController.m
//  MaskView渐变效果
//
//  Created by wishchen on 15/12/13.
//  Copyright © 2015年 wishchen. All rights reserved.
//

#import "ViewController.h"
#import "UIView+FadeEffict.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setLabel];
    
    [self setImage];
    
    [self setButton];
}


- (void)setLabel
{
    UILabel *label      = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    label.center        = CGPointMake(self.view.center.x, self.view.center.y + 100) ;
    label.textColor     = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font          = [UIFont systemFontOfSize:30];
    label.text          = @"Hello World!!!";
    [label fadeEffectWithDuration:10 FadeMode:UIViewFadeFromLeft];
    [self.view addSubview:label];
}

- (void)setImage
{
    UIImage *img         = [UIImage imageNamed:@"Frog.jpg"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    imgView.frame        = CGRectMake(0, 30, self.view.bounds.size.width, self.view.bounds.size.width);
    imgView.contentMode  = UIViewContentModeScaleAspectFill;
    [imgView fadeEffectWithDuration:6 FadeMode:UIViewFadeFromTopLeft];
    [self.view addSubview:imgView];
}

- (void)setButton
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
    button.center    = CGPointMake(self.view.center.x, self.view.center.y + 250);
    [button setTitle:@"点击消失" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor lightGrayColor]];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)click:(UIButton *)sender
{
    [sender fadeEffectWithDuration:5 FadeMode:UIViewFadeFromRight];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
