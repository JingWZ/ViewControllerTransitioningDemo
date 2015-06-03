//
//  BLUnfoldTransitioner.m
//  ViewControllerTransitioningDemo
//
//  Created by Jing on 15/6/3.
//  Copyright (c) 2015年 com.jing. All rights reserved.
//

#define K_Animation_Duration 1.25

#import "BLUnfoldTransitioner.h"

@implementation BLUnfoldAnimatedTransitioning

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = [toVC view];
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toView];
    
    
    UIViewController *animatingVC = toVC;
    UIView *animatingView = [animatingVC view];
    
    [animatingView setFrame:self.originalFrame];
    
    [UIView animateWithDuration:K_Animation_Duration animations:^{
        [animatingView setFrame:[transitionContext finalFrameForViewController:animatingVC]];
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return K_Animation_Duration;
}

@end

@implementation BLUnfoldTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    BLUnfoldAnimatedTransitioning *animatedTransitioning = [[BLUnfoldAnimatedTransitioning alloc] init];
    animatedTransitioning.originalFrame = self.originalFrame;
    return animatedTransitioning;
}

@end
