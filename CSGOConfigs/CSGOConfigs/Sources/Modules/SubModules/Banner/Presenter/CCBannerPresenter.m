//
//  CCBannerPresenter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCBannerPresenter.h"
#import "CCBannerViewProtocol.h"
#import "CCBannerRouterProtocol.h"
#import "CCBannerServiceProtocol.h"

@interface CCBannerPresenter () <CCBannerViewActionProtocol>

@property (nonatomic, strong) id<CCBannerViewProtocol> view;
@property (nonatomic, strong) id<CCBannerRouterProtocol> router;

@property (nonatomic, strong) id <CCBannerServiceProtocol> ioc_bannersService;

@property (nonatomic, strong) NSArray <CCBannerViewModel *> *banners;

@end

@implementation CCBannerPresenter

- (instancetype)initWithView:(id<CCBannerViewProtocol>)view router:(id<CCBannerRouterProtocol>)router {
    self = [super init];
    if (self) {
        self.router = router;
        self.view = view;
        self.view.viewAction = self;
    }
    return self;
}

#pragma mark - CCBannerViewActionProtocol

- (void)bannerViewDidSet:(id <CCBannerViewProtocol>)view {
    [self loadBanners];
}

- (void)bannerView:(id <CCBannerViewProtocol>)view didSelectBannerAtIndex:(NSUInteger)index {
    CCBannerViewModel *banner = self.banners[index];
    [self.router goToPlayerDescriptionScreenWithPlayerID:banner.playerID];
}

#pragma mark - Private

- (void)loadBanners {
    [self.view showSpiner];
    [self.ioc_bannersService getBanners:^(NSArray<CCBannerViewModel *> *banners, CGFloat bannerHeight) {
        self.banners = banners;
        [self.view updateBannerHeight:bannerHeight];
        [self.view showBanners:banners];
        [self.view hideSpiner];
    }];
}


@end
