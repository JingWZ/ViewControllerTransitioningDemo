//
//  BLUnfoldTransitioner.h
//  ViewControllerTransitioningDemo
//
//  Created by Jing on 15/6/3.
//  Copyright (c) 2015年 com.jing. All rights reserved.
//


@import UIKit;

@interface BLUnfoldAnimatedTransitioning : NSObject <UIViewControllerAnimatedTransitioning>
@property (assign, nonatomic) CGRect originalFrame;
@end

@interface BLUnfoldTransitioningDelegate : NSObject <UIViewControllerTransitioningDelegate>
@property (assign, nonatomic) CGRect originalFrame;
@end