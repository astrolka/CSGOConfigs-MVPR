//
//  CCFavoritePlayersRouter.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCFavoritePlayersRouter.h"
#import "CCRouter+CCPlayerDescriptionScreen.h"
#import "CCFavoritePlayersViewController.h"
#import "CCFavoritePlayersPresenter.h"
#import "CCRouter+OpenSideMenu.h"

@implementation CCFavoritePlayersRouter

#pragma mark - CCOpenSideMenuRoutingProtocol

- (void)openSideMenu {
    [self cc_openSideMenu];
}

#pragma mark - CCPlayerDescriptionRoutingProtocol

- (void)goToPlayerDescriptionScreenWithPlayerID:(NSUInteger)playerID {
    [self cc_goToPlayerDescriptionScreenWithPlayerID:playerID];
}

#pragma mark - Module Build

- (id <CCFavoritePlayersViewProtocol>)buildModule {
    CCFavoritePlayersViewController *view = [[CCFavoritePlayersViewController alloc] init];
    CCFavoritePlayersPresenter *presenter = [[CCFavoritePlayersPresenter alloc] initWithView:view router:self];
    #pragma unused(presenter)
    return view;
}

@end
