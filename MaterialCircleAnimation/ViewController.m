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

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationController.delegate = self;
    self.circleAnimator = [MaterialCircleAnimator new];
    
    [self.button addTarget:self action:@selector(buttonClick:event:) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark - UINavigationControllerDelegate iOS7新增的2个方法
- (id) navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return self.circleAnimator;
    }else if (operation == UINavigationControllerOperationPop){
        return self.circleAnimator;
    }else{ // UINavigationControllerOperationNone
        return nil;
    }
}

- (IBAction) buttonClick:(id)sender event:(UIEvent *)event
{
    CGPoint position = [[[event allTouches] anyObject] locationInView:sender];
    
    //convert to absolute position
    position = [self.button convertPoint:position toView:self.view];
    
    [self.circleAnimator setCenterPoint:position];
    [self.navigationController pushViewController:[self secondViewController] animated:YES];
    
}

- (ViewController2 *)secondViewController {
    static ViewController2 *secondViewController;
    if (secondViewController != nil) {
        return secondViewController;
    }
    secondViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController2"];
    return secondViewController;
}

@end
