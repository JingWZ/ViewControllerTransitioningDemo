//
//  ViewController.m
//  ViewControllerTransitioningDemo
//
//  Created by Jing on 15/6/3.
//  Copyright (c) 2015年 com.jing. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "BLUnfoldTransitioner.h"

@interface ViewController ()

@property (strong, nonatomic) UIControl *customView;
@property (strong, nonatomic) SecondViewController *secondVC;
@property (strong, nonatomic) BLUnfoldTransitioningDelegate *unfoldTransioningDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self configureCustomView];
}

- (void)configureCustomView {
    
    CGFloat viewWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat customViewWidth = 80.0;
    self.customView = [[UIControl alloc] initWithFrame:CGRectMake(viewWidth - customViewWidth - 10.0, 200.0, customViewWidth, customViewWidth)];
    [self.customView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:self.customView];
    
    [self.customView addTarget:self action:@selector(customViewTouched) forControlEvents:UIControlEventTouchUpInside];
}

- (void)customViewTouched {
    
    self.unfoldTransioningDelegate.originalFrame = self.customView.frame;
    [self presentViewController:self.secondVC animated:YES completion:NULL];
}

- (SecondViewController *)secondVC {
    
    if (_secondVC == nil) {
        _secondVC = [[SecondViewController alloc] init];
        _secondVC.modalTransitionStyle = UIModalPresentationCustom;
        _secondVC.transitioningDelegate = self.unfoldTransioningDelegate;
    }
    return _secondVC;
}

- (BLUnfoldTransitioningDelegate *)unfoldTransioningDelegate {
    
    if (_unfoldTransioningDelegate == nil) {
        _unfoldTransioningDelegate =  [[BLUnfoldTransitioningDelegate alloc] init];
    }
    return _unfoldTransioningDelegate;
}

@end
