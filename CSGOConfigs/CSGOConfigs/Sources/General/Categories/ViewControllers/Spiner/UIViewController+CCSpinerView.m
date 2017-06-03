//
//  UIViewController+CCSpinerView.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 03.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "UIViewController+CCSpinerView.h"
#import "DGActivityIndicatorView.h"
#import "UIColor+CC.h"
#import "Masonry.h"

@implementation UIViewController (CCSpinerView)

- (void)cc_showSpiner {
    static CGFloat spinerSize = 30.f;
    DGActivityIndicatorView *spinerView = [[DGActivityIndicatorView alloc]initWithType:DGActivityIndicatorAnimationTypeBallClipRotate
                                                                             tintColor:[UIColor cc_themeColor]
                                                                                  size:spinerSize];
    spinerView.layer.zPosition = 101;
    
    [self.view addSubview:spinerView];
    [spinerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(@(spinerSize));
        make.height.equalTo(@(spinerSize));
    }];
    [spinerView startAnimating];
}

- (void)cc_hideSpiner {
    [self.view.subviews enumerateObjectsUsingBlock:^(UIView * subView, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([subView isKindOfClass:[DGActivityIndicatorView class]]) {
            [(DGActivityIndicatorView *)subView stopAnimating];
            *stop = YES;
        }
    }];
}

@end
