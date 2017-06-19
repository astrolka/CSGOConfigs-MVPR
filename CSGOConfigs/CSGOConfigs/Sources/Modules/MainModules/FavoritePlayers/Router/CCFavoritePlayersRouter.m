//
//  CCFavoritePlayersRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCFavoritePlayersRouter.h"
#import "CCFavoritePlayersPresenter.h"
#import "CCFavoritePlayersViewController.h"
#import "CCPlayerDescriptionRouter.h"
#import <RESideMenu/RESideMenu.h>

@interface CCFavoritePlayersRouter ()

@property (nonatomic, strong) id <CCFavoritePlayersViewProtocol> view;

@end

@implementation CCFavoritePlayersRouter

- (id <CCFavoritePlayersViewProtocol>)buildFavoritePlayersModule {
    self.view = [[CCFavoritePlayersViewController alloc] init];
    CCFavoritePlayersPresenter *presenter = [[CCFavoritePlayersPresenter alloc] initWithView:self.view router:self];
    #pragma unused(presenter)
    return self.view;
}

#pragma mark - CCOpenSideMenuRouterProtocol

- (void)openSideMenu {
    UIViewController *viewController = (UIViewController*)self.view;
    [viewController.sideMenuViewController presentLeftMenuViewController];
}

#pragma mark - CCFavoritePlayersRouterProtocol

- (void)goToPlayerDescriptionScreenWithPlayerID:(NSUInteger)playerID {
    CCPlayerDescriptionRouter *router = [[CCPlayerDescriptionRouter alloc] initWithNavigationController:self.navigationController];
    [router goToPlayerDescriptionScreenWithPlayerID:playerID];
}

@end
