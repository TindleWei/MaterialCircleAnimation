//
//  ViewController2.m
//  MaterialCircleAnimation
//
//  Created by tindle on 15/4/29.
//  Copyright (c) 2015年 tindle. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@implementation ViewController2

-(void)viewDidLoad
{
    self.navigationController.delegate = self;
    self.circleAnimator = [MaterialCircleAnimator new];
    [self.button addTarget:self action:@selector(clickBack:event:) forControlEvents:UIControlEventTouchUpInside];
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

- (IBAction)clickBack:(id)sender event:(UIEvent *)event
{
    CGPoint position = [[[event allTouches] anyObject] locationInView:sender];
    //convert to absolute position
    position = [self.button convertPoint:position toView:self.view];
    
    NSLog(@"position 2:  %f, %f",position.x, position.y);
    [self.circleAnimator setCenterPoint:position];
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
