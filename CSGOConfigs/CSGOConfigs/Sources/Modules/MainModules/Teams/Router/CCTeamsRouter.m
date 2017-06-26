//
//  CCTeamsRouter.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCTeamsRouter.h"
#import "CCRouter+CCPlayerDescriptionScreen.h"
#import "CCTeamsViewController.h"
#import "CCRouter+OpenSideMenu.h"
#import "CCTeamsPresenter.h"
#import "CCBannerRouter.h"

@implementation CCTeamsRouter

#pragma mark - CCOpenSideMenuRoutingProtocol

- (void)openSideMenu {
    [self cc_openSideMenu];
}

#pragma mark - CCTeamsRouterProtocol

- (void)goToPlayerDescriptionScreenWithPlayerID:(NSUInteger)playerID {
    [self cc_goToPlayerDescriptionScreenWithPlayerID:playerID];
}

#pragma mark - Module Build

- (id <CCTeamsViewProtocol>)buildModule {
    CCBannerRouter *bannerRouter = [[CCBannerRouter alloc] initWithNavigationController:self.navigationController];
    CCTeamsViewController *view = [[CCTeamsViewController alloc] initWithBannerView:[bannerRouter buildModule]];
    CCTeamsPresenter *presenter = [[CCTeamsPresenter alloc] initWithView:view router:self];
    #pragma unused(presenter)
    return view;
}

@end
