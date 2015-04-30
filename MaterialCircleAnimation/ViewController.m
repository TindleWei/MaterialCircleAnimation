//
//  ViewController.m
//  MaterialCircleAnimation
//
//  Created by tindle on 15/4/29.
//  Copyright (c) 2015年 tindle. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.delegate = self;
    // 设置转场动画
    self.circleAnimator = [MaterialCircleAnimator new];
}

#pragma mark - UINavigationControllerDelegate iOS7新增的2个方法
// 动画特效
- (id) navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return self.circleAnimator;
    }else{
        return nil;
    }
}

- (IBAction)showCircle:(id)sender {

    
    ViewController2 *secondViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController2"];
//    secondViewController.navigationController.delegate = self;
    
    [self.navigationController pushViewController:secondViewController animated:YES];
    
}

@end
