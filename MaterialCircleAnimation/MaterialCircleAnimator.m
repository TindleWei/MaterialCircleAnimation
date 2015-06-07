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

-(void) setCenterPoint:(CGPoint)originalPoint{
    _centerPoint = originalPoint;
//    NSLog(@"CGPoint center: %f, %f", _centerPoint.x, _centerPoint.y);
}


- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.7;
}


- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    self.transitionContext = transitionContext;
    UIView* containerView = [transitionContext containerView];
    UIViewController *fromViewController = (UIViewController *)[transitionContext viewControllerForKey:(UITransitionContextFromViewControllerKey)];
    UIViewController *toViewController = (UIViewController *)[transitionContext viewControllerForKey:(UITransitionContextToViewControllerKey)];

    [containerView addSubview:toViewController.view];
    
    
    NSLog(@"animateTransition:  %f, %f",_centerPoint.x, _centerPoint.y);
    
    CGRect centerRect = CGRectMake(_centerPoint.x-5, _centerPoint.y-5, 10, 10);
    
    UIBezierPath* circleMaskPathInitial = [UIBezierPath bezierPathWithOvalInRect:
                                           centerRect];
    CGPoint extremePoint = CGPointMake(_centerPoint.x, _centerPoint.y -  CGRectGetHeight(toViewController.view.bounds));
    CGFloat radius = sqrt((extremePoint.x * extremePoint.x) + (extremePoint.y * extremePoint.y));
    UIBezierPath* circleMaskPathFinal = [UIBezierPath bezierPathWithOvalInRect:
                                         CGRectInset(centerRect, -radius, -radius)];
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
