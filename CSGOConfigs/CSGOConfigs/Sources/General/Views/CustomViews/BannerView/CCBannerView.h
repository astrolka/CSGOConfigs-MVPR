//
//  CCBannerView.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 02.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCBannerViewProtocol.h"
@class CCBannerView;
@class CCBannerViewModel;

@interface CCBannerView : UIView <CCBannerViewProtocol>

- (void)showBanners:(NSArray <CCBannerViewModel *> *)banners;

@end
