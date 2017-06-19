//
//  CCFavoritePlayersPresenter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCFavoritePlayersPresenter.h"
#import "CCFavoritePlayersViewProtocol.h"
#import "CCFavoritePlayersRouterProtocol.h"
#import "CCPlayerPreviewViewModel.h"
#import "CCPlayersServiceProtocol.h"

@interface CCFavoritePlayersPresenter () <CCFavoritePlayersViewActionProtocol>

@property (nonatomic, strong) id <CCFavoritePlayersViewProtocol> view;
@property (nonatomic, strong) id <CCFavoritePlayersRouterProtocol> router;

@property (nonatomic, strong) id <CCPlayersServiceProtocol> ioc_playersService;

@property (nonatomic, strong) NSArray <CCPlayerPreviewViewModel *> *players;

@end

@implementation CCFavoritePlayersPresenter

- (instancetype)initWithView:(id <CCFavoritePlayersViewProtocol>)view router:(id <CCFavoritePlayersRouterProtocol>)router {
    self = [super init];
    if (self) {
        self.view = view;
        self.view.viewAction = self;
        self.router = router;
    }
    return self;
}

#pragma mark - CCFavoritePlayersViewActionProtocol

- (void)favoritePlayersViewDidSet:(id <CCFavoritePlayersViewProtocol>)view {
    [self loadFavoritePlayers];
}

- (void)favoritePlayersViewDidOpenMenu:(id <CCFavoritePlayersViewProtocol>)view {
    [self.router openSideMenu];
}

- (void)favoritePlayersView:(id <CCFavoritePlayersViewProtocol>)view didSelectPlayerAtIndex:(NSUInteger)index {
    CCPlayerPreviewViewModel *player = self.players[index];
    [self.router goToPlayerDescriptionScreenWithPlayerID:player.playerID];
}

#pragma mark - Private

- (void)loadFavoritePlayers {
    [self.ioc_playersService getFavoritePlayersPreviewWithContainerWidth:[self.view cellContainerWidth] data:^(NSArray<CCPlayerPreviewViewModel *> *players) {
        if (players.count) {
            self.players = players;
            [self.view showPlayers:players];
        }
    }];
}

@end
