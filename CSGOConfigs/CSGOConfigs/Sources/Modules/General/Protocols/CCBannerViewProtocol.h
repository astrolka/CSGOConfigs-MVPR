//
//  CCBannerViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 10.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCBannerViewModel.h"

@protocol CCBannerViewProtocol <NSObject>

- (void)showBanners:(NSArray <CCBannerViewModel *> *)banners;

- (void)updateBannerHeight:(CGFloat)height;

@end
