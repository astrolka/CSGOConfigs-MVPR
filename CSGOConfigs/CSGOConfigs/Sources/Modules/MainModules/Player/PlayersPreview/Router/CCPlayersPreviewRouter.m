//
//  CCPlayersPreviewRouter.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayersPreviewRouter.h"
#import "CCRouter+CCPlayerDescriptionScreen.h"
#import "CCPlayersPreviewViewController.h"
#import "CCPlayersPreviewPresenter.h"
#import "CCRouter+OpenSideMenu.h"
#import "CCBannerRouter.h"

@implementation CCPlayersPreviewRouter

#pragma mark - CCOpenSideMenuRoutingProtocol

- (void)openSideMenu {
    [self cc_openSideMenu];
}

#pragma mark - CCPlayerDescriptionRoutingProtocol

- (void)goToPlayerDescriptionScreenWithPlayerID:(NSUInteger)playerID {
    [self cc_goToPlayerDescriptionScreenWithPlayerID:playerID];
}

#pragma mark - Module Build

- (id <CCPlayersPreviewViewProtocol>)buildModule {
    CCBannerRouter *bannerRouter = [[CCBannerRouter alloc] initWithNavigationController:self.navigationController];
    CCPlayersPreviewViewController *view = [[CCPlayersPreviewViewController alloc] initWithBannerView:[bannerRouter buildModule]];
    CCPlayersPreviewPresenter *presenter = [[CCPlayersPreviewPresenter alloc] initWithView:view router:self];
    #pragma unused(presenter)
    return view;
}

@end
