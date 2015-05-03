//
//  MaterialCircleAnimator.h
//  MaterialCircleAnimation
//
//  Created by tindle on 15/4/29.
//  Copyright (c) 2015年 tindle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

enum AnimationType
{
    AnimationTypePresent,
    AnimationTypeDismiss
};

@interface MaterialCircleAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, weak) IBOutlet id<UIViewControllerContextTransitioning> transitionContext;

@property (nonatomic) enum      AnimationType type;

@property (nonatomic) CGPoint centerPoint;

-(void)setCenterPoint:(CGPoint)originalPoint;

@end
