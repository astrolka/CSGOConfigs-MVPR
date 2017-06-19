//
//  UIView+CCMessageView.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "UIView+CCMessageView.h"
#import "CCMessageView.h"
#import "UIColor+CC.h"
#import "Masonry.h"

CGFloat const kAnimationDuration = 0.3f;

@implementation UIView (CCMessageView)

- (void)cc_showMessageWithText:(NSString *)text {
    [self cc_showMessageWithText:text andHideAfterDelay:2];
}

- (void)cc_showMessageWithText:(NSString *)text andHideAfterDelay:(CGFloat)seconds {
    CCMessageView *messageView = [[CCMessageView alloc] initWithFrame:CGRectZero];
    messageView.message = text;
    messageView.backgroundColor = [UIColor whiteColor];
    messageView.layer.cornerRadius = 10.f;
    messageView.layer.masksToBounds = YES;
    messageView.layer.borderWidth = 0.5;
    messageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    messageView.alpha = 0;
    
    [self addSubview:messageView];
    [messageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(2);
        make.right.equalTo(self).offset(-2);
        make.bottom.equalTo(self).offset(-4);
    }];
    
    [self cc_showView:messageView];
}

- (void)cc_showView:(UIView *)view {
    [UIView animateWithDuration:kAnimationDuration delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        view.alpha = 1.f;
    } completion:^(BOOL finished) {
        [self cc_hideView:view afterDelay:0.2f];
    }];
}

- (void)cc_hideView:(UIView *)view afterDelay:(CGFloat)seconds {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, seconds * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [view mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(view.bounds.size.height);
        }];
        
        [UIView animateWithDuration:kAnimationDuration animations:^{
            view.alpha = 0.f;
            [self layoutIfNeeded];
        }];
    });
}

@end
