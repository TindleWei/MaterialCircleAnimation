##New UIView Block Animation Methods in iOS 7 

###Keyframe Animations

The new `animateKeyframesWithDuration` is to `CAKeyframeAnimation` just as `animateWithDuration` is to `CABasicAnimation`. 

###Spring Animations
````
[UIView animateWithDuration:duration delay:delay
usingSpringWithDamping:damping 
initialSpringVelocity:velocity options:options animations:^{
    //Animations
} completion:^(BOOL finished) {
    //Completion Block
}];
````

###Customizing UIViewController Transitions
+ UIViewController
	+ presentViewController
+ UITabBarController
	+ setSelectedViewController
	+ setSelectedIndex
+ UINavigationController
	+ pushViewController
	+ popViewController
	+ setViewControllers

###The Core: Animation Controllers

````
-(void)animateTransition:(id)transitionContext {
    //Get references to the view hierarchy
    UIView *containerView = [transitionContext containerView];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    if (self.type == AnimationTypePresent) {
        //Add 'to' view to the hierarchy with 0.0 scale
        toViewController.view.transform = CGAffineTransformMakeScale(0.0, 0.0);
        [containerView insertSubview:toViewController.view aboveSubview:fromViewController.view];
 
        //Scale the 'to' view to to its final position
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    } else if (self.type == AnimationTypeDismiss) {
        //Add 'to' view to the hierarchy
        [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
 
        //Scale the 'from' view down until it disappears
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromViewController.view.transform = CGAffineTransformMakeScale(0.0, 0.0);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
}
 
-(NSTimeInterval)transitionDuration:(id)transitionContext {
    return 0.4;
}
````


###References sites:

1.  [blog1](https://www.captechconsulting.com/blogs/ios-7-tutorial-series-custom-navigation-transitions--more)  
2.  [blog2](http://www.raywenderlich.com/86521/how-to-make-a-view-controller-transition-animation-like-in-the-ping-app)
3.  [blog3](http://onevcat.com/2013/10/vc-transition-in-ios7/)
4.  [blog4](http://objectivetoast.com/2014/03/17/custom-transitions-on-ios/)


