//
//  ViewController.h
//  MaterialCircleAnimation
//
//  Created by tindle on 15/4/29.
//  Copyright (c) 2015年 tindle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MaterialCircleAnimator.h"

@interface ViewController : UIViewController <UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *button;

@property (nonatomic, strong) MaterialCircleAnimator *circleAnimator;

- (IBAction)showCircle:(id)sender;

@end

