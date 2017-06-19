//
//  CCBannerViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>
#import "CCBannerViewModel.h"
#import "CCSpinerViewProtocol.h"
@protocol CCBannerViewProtocol;

@protocol CCBannerViewActionProtocol <NSObject>

- (void)bannerViewDidSet:(id <CCBannerViewProtocol>)view;

- (void)bannerView:(id <CCBannerViewProtocol>)view didSelectBannerAtIndex:(NSUInteger)bannerIndex;

@end

@protocol CCBannerViewProtocol <CCSpinerViewProtocol>

@property (nonatomic, strong) id <CCBannerViewActionProtocol> viewAction;

- (void)showBanners:(NSArray <CCBannerViewModel *> *)banners;

- (void)updateBannerHeight:(CGFloat)height;

@end
