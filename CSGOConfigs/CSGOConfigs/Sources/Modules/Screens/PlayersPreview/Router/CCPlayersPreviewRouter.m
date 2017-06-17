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
#import "CCPlayerDescriptionRouter.h"
#import "CCBannerRouter.h"
#import <RESideMenu/RESideMenu.h>

@interface CCPlayersPreviewRouter ()

@property (nonatomic, strong) id <CCPlayersPreviewViewProtocol> view;

@end

@implementation CCPlayersPreviewRouter

- (id <CCPlayersPreviewViewProtocol>)buildPlayersPreviewModule {
    CCBannerRouter *bannerRouter = [[CCBannerRouter alloc] initWithNavigationController:self.navigationController];
    
    self.view = [[CCPlayersPreviewViewController alloc] initWithBannerView:[bannerRouter buildBannerModule]];
    CCPlayersPreviewPresenter *presenter = [[CCPlayersPreviewPresenter alloc] initWithView:self.view router:self];
    #pragma unused(presenter)
    return self.view;
}

#pragma mark - CCOpenSideMenuRouterProtocol

- (void)openSideMenu {
    UIViewController *viewController = (UIViewController *)self.view;
    [viewController.sideMenuViewController presentLeftMenuViewController];
}

#pragma mark - CCPlayersPreviewRouterProtocol

- (void)goToPlayerDescriptionScreenWithPlayerID:(NSUInteger)playerID {
    CCPlayerDescriptionRouter *router = [[CCPlayerDescriptionRouter alloc] initWithNavigationController:self.navigationController];
    [router goToPlayerDescriptionScreenWithPlayerID:playerID];
}

@end
