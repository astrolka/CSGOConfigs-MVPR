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
#import "CCPlayerDescriptionRouter.h"
#import "CCBannerRouter.h"
#import <RESideMenu/RESideMenu.h>

@interface CCTeamsRouter ()

@property (nonatomic, strong) id <CCTeamsViewProtocol> view;

@end

@implementation CCTeamsRouter

- (id <CCTeamsViewProtocol>)buildTeamsModule {
    CCBannerRouter *bannerRouter = [[CCBannerRouter alloc] initWithNavigationController:self.navigationController];
    
    self.view = [[CCTeamsViewController alloc] initWithBannerView:[bannerRouter buildBannerModule]];
    CCTeamsPresenter *presenter = [[CCTeamsPresenter alloc] initWithView:self.view router:self];
    #pragma unused(presenter)
    return self.view;
}

#pragma mark - CCOpenSideMenuRouterProtocol

- (void)openSideMenu {
    UIViewController *viewController = (UIViewController *)self.view;
    [viewController.sideMenuViewController presentLeftMenuViewController];
}

#pragma mark - CCTeamsRouterProtocol

- (void)goToPlayerDescriptionScreenWithPlayerID:(NSUInteger)playerID {
    CCPlayerDescriptionRouter *router = [[CCPlayerDescriptionRouter alloc] initWithNavigationController:self.navigationController];
    [router goToPlayerDescriptionScreenWithPlayerID:playerID];
}

@end
