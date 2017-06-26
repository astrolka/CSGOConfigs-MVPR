//
//  CCAlertControllerAnimator.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCAlertControllerAnimator.h"

@interface CCAlertControllerAnimator ()


@end

@implementation CCAlertControllerAnimator

static CGFloat const kAnimationDuration = 0.3;

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return kAnimationDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = transitionContext.containerView;
    
    UIViewController *animatingVC = self.isPresenting ? toVC : fromVC;
    UIView *animatingView = animatingVC.view;
    animatingView.frame = [transitionContext finalFrameForViewController:toVC];
    
    if (self.isPresenting) {
        [containerView addSubview:animatingView];
        animatingView.transform = CGAffineTransformMakeScale(1.2, 1.2);
        animatingView.alpha = 0.5;
        [UIView animateWithDuration:kAnimationDuration animations:^{
            animatingView.transform = CGAffineTransformMakeScale(1, 1);
            animatingView.alpha = 1.0;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:finished];
        }];
    } else {
        [UIView animateWithDuration:kAnimationDuration animations:^{
            animatingView.alpha = 0.0;
        } completion:^(BOOL finished) {
            if (finished) {
                [animatingView removeFromSuperview];
            }
            [transitionContext completeTransition:finished];
        }];
    }
}

@end
