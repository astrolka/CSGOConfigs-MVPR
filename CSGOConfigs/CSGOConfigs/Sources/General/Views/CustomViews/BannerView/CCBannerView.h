//
//  CCBannerView.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 02.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCBannerView;
@class CCBannerViewModel;

typedef void(^didSelectBannerAtIndex)(CCBannerView *bannerView, NSUInteger index);

@interface CCBannerView : UIView

@property (nonatomic, copy) didSelectBannerAtIndex viewAction;

- (instancetype)initWithPageControl:(BOOL)pageControl;

- (void)showBanners:(NSArray <CCBannerViewModel *> *)banners;

@end
