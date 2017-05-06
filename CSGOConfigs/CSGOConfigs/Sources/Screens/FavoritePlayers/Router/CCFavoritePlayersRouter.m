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

@implementation CCFavoritePlayersRouter

- (id <CCFavoritePlayersViewProtocol>)buildFavoritePlayersModule {
    CCFavoritePlayersViewController *viewController = [[CCFavoritePlayersViewController alloc] init];
    CCFavoritePlayersPresenter *presenter = [[CCFavoritePlayersPresenter alloc] initWithView:viewController router:self];
    #pragma unused(presenter)
    return viewController;
}

@end
