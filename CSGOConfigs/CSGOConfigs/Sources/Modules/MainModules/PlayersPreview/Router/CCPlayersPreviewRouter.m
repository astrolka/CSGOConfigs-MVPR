//
//  CCPlayersPreviewRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayersPreviewRouter.h"
#import "CCPlayersPreviewViewController.h"
#import "CCPlayersPreviewPresenter.h"
#import "CCRouter+CCPlayerDescriptionScreen.h"
#import "CCBannerRouter.h"
#import "CCRouter+OpenSideMenu.h"

@implementation CCPlayersPreviewRouter

- (id <CCPlayersPreviewViewProtocol>)buildPlayersPreviewModule {
    CCBannerRouter *bannerRouter = [[CCBannerRouter alloc] initWithNavigationController:self.navigationController];
    
    CCPlayersPreviewViewController *view = [[CCPlayersPreviewViewController alloc] initWithBannerView:[bannerRouter buildBannerModule]];
    CCPlayersPreviewPresenter *presenter = [[CCPlayersPreviewPresenter alloc] initWithView:view router:self];
    #pragma unused(presenter)
    return view;
}

#pragma mark - CCOpenSideMenuRoutingProtocol

- (void)openSideMenu {
    [self cc_openSideMenu];
}

#pragma mark - CCPlayerDescriptionRoutingProtocol

- (void)goToPlayerDescriptionScreenWithPlayerID:(NSUInteger)playerID {
    [self cc_goToPlayerDescriptionScreenWithPlayerID:playerID];
}

@end
