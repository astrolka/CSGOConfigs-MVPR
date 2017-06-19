//
//  CCBannerRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCBannerRouter.h"
#import "CCPlayerDescriptionRouter.h"
#import "CCBannerView.h"
#import "CCBannerPresenter.h"

@implementation CCBannerRouter

- (UIView <CCBannerViewProtocol> *)buildBannerModule {
    CCBannerView *view = [[CCBannerView alloc] initWithFrame:CGRectZero];
    CCBannerPresenter *presenter = [[CCBannerPresenter alloc] initWithView:view router:self];
    #pragma unused(presenter)
    return view;
}

#pragma mark - CCBannerRouterProtocol

- (void)goToPlayerDescriptionScreenWithPlayerID:(NSUInteger)playerID {
    CCPlayerDescriptionRouter *router = [[CCPlayerDescriptionRouter alloc] initWithNavigationController:self.navigationController];
    [router goToPlayerDescriptionScreenWithPlayerID:playerID];
}

@end
