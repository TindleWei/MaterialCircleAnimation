//
//  MaterialCircleAnimator.m
//  MaterialCircleAnimation
//
//  Created by tindle on 15/4/29.
//  Copyright (c) 2015年 tindle. All rights reserved.
//

#import "MaterialCircleAnimator.h"
#import "ViewController.h"
#import "ViewController2.h"

@implementation MaterialCircleAnimator


- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    return 1.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    self.transitionContext = transitionContext;
    UIView* containerView = [transitionContext containerView];
    ViewController *fromViewController = (ViewController *)[transitionContext viewControllerForKey:(UITransitionContextFromViewControllerKey)];
    UIViewController *toViewController = (UIViewController *)[transitionContext viewControllerForKey:(UITransitionContextToViewControllerKey)];
    UIButton* button = fromViewController.button;
    
    [containerView addSubview:toViewController.view];
    
    UIBezierPath* circleMaskPathInitial = [UIBezierPath bezierPathWithOvalInRect:
     button.frame];
    CGPoint extremePoint = CGPointMake([button center].x, [button center].y -  CGRectGetHeight(toViewController.view.bounds));
    CGFloat radius = sqrt(extremePoint.x * extremePoint.x) + (extremePoint.y * extremePoint.y);
    UIBezierPath* circleMaskPathFinal = [UIBezierPath bezierPathWithOvalInRect:
                                        CGRectInset(button.frame, -radius, -radius)];
    
    CAShapeLayer* maskLayer = [CAShapeLayer new];
    maskLayer.path = circleMaskPathFinal.CGPath;
    toViewController.view.layer.mask = maskLayer;
    
    CABasicAnimation* maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.fromValue = (__bridge id)(circleMaskPathInitial.CGPath);
    maskLayerAnimation.toValue = (__bridge id)([circleMaskPathFinal CGPath]);
    maskLayerAnimation.duration = [self transitionDuration: transitionContext];
    maskLayerAnimation.delegate = self;
    [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
    [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
}


@end
