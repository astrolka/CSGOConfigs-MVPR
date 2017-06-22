//
//  UIView+CCSpiner.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "UIView+CCSpiner.h"
#import "DGActivityIndicatorView.h"
#import "UIColor+CC.h"
#import "Masonry.h"

@implementation UIView (CCSpiner)

- (void)cc_showSpiner {
    if (![self cc_findSpinerView]) {
        static CGFloat spinerSize = 30.f;
        DGActivityIndicatorView *spinerView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeBallClipRotate
                                                                                  tintColor:[UIColor cc_themeColor]
                                                                                       size:spinerSize];
        spinerView.layer.zPosition = 101;
        
        [self addSubview:spinerView];
        [spinerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.width.equalTo(@(spinerSize));
            make.height.equalTo(@(spinerSize));
        }];
        [spinerView startAnimating];
    }
}

- (void)cc_hideSpiner {
    DGActivityIndicatorView *spinerView = [self cc_findSpinerView];
    [spinerView stopAnimating];
}

- (DGActivityIndicatorView *)cc_findSpinerView {
    __block DGActivityIndicatorView *spinerView = nil;
    [self.subviews enumerateObjectsUsingBlock:^(UIView * subView, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([subView isKindOfClass:[DGActivityIndicatorView class]]) {
            spinerView = (DGActivityIndicatorView *)subView;
            *stop = YES;
        }
    }];
    return spinerView;
}


@end
