//
//  CCBannerServiceProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 03.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppleGuice/AppleGuiceInjectable.h>
#import "CCBannerViewModel.h"
#import <CoreGraphics/CGBase.h>

typedef void(^bannerDataBlock)(NSArray <CCBannerViewModel *> * banners, CGFloat bannerHeight);

@protocol CCBannerServiceProtocol <AppleGuiceInjectable>

- (void)getBanners:(bannerDataBlock)banners;

@end
