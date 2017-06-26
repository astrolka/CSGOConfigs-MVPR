//
//  CCBannerViewProtocol.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>
#import "CCSpinerViewProtocol.h"
#import "CCBannerViewModel.h"
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
