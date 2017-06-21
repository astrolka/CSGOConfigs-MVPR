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
#import "CCRouter+CCPlayerDescriptionScreen.h"
#import "CCRouter+OpenSideMenu.h"

@implementation CCFavoritePlayersRouter

- (id <CCFavoritePlayersViewProtocol>)buildFavoritePlayersModule {
    CCFavoritePlayersViewController *view = [[CCFavoritePlayersViewController alloc] init];
    CCFavoritePlayersPresenter *presenter = [[CCFavoritePlayersPresenter alloc] initWithView:view router:self];
    #pragma unused(presenter)
    return view;
}

#pragma mark - CCOpenSideMenuRouterProtocol

- (void)openSideMenu {
    [self cc_openSideMenu];
}

#pragma mark - CCPlayerDescriptionRouterProtocol

- (void)goToPlayerDescriptionScreenWithPlayerID:(NSUInteger)playerID {
    [self cc_goToPlayerDescriptionScreenWithPlayerID:playerID];
}

@end
