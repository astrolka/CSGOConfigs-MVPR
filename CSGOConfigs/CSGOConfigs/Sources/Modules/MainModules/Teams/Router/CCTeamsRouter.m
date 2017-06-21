//
//  CCTeamsRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCTeamsRouter.h"
#import "CCTeamsViewController.h"
#import "CCTeamsPresenter.h"
#import "CCRouter+CCPlayerDescriptionScreen.h"
#import "CCBannerRouter.h"
#import "CCRouter+OpenSideMenu.h"

@implementation CCTeamsRouter

- (id <CCTeamsViewProtocol>)buildTeamsModule {
    CCBannerRouter *bannerRouter = [[CCBannerRouter alloc] initWithNavigationController:self.navigationController];
    
    CCTeamsViewController *view = [[CCTeamsViewController alloc] initWithBannerView:[bannerRouter buildBannerModule]];
    CCTeamsPresenter *presenter = [[CCTeamsPresenter alloc] initWithView:view router:self];
    #pragma unused(presenter)
    return view;
}

#pragma mark - CCOpenSideMenuRouterProtocol

- (void)openSideMenu {
    [self cc_openSideMenu];
}

#pragma mark - CCTeamsRouterProtocol

- (void)goToPlayerDescriptionScreenWithPlayerID:(NSUInteger)playerID {
    [self cc_goToPlayerDescriptionScreenWithPlayerID:playerID];
}

@end
