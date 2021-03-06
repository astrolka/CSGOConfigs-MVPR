//
//  CCPlayersPreviewPresenter.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayersPreviewPresenter.h"
#import "CCPlayerPreviewViewModel.h"

@interface CCPlayersPreviewPresenter ()

@property (nonatomic, weak) id <CCPlayersPreviewViewProtocol> view;
@property (nonatomic, strong) id <CCPlayersPreviewRouterProtocol> router;

@property (nonatomic, strong) NSMutableArray <CCPlayerPreviewViewModel *> *players;
@property (nonatomic, assign) NSUInteger countOfPlayersOnServer; // pagination logic

@end

static CGFloat const kLoadingLimit = 6.f;

@implementation CCPlayersPreviewPresenter

- (instancetype)initWithView:(id <CCPlayersPreviewViewProtocol>)view router:(id <CCPlayersPreviewRouterProtocol>)router {
    self = [super init];
    if (self) {
        self.router = router;
        self.view = view;
        self.view.viewAction = self;
        
        self.countOfPlayersOnServer = 0;
        self.players = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - CCPlayersPreviewViewActionProtocol

- (void)playersPreviewViewDidSet:(id <CCPlayersPreviewViewProtocol>)view {
    [self loadPlayersWithSpiner:YES];
}

- (void)playersPreviewViewDidOpenMenu:(id <CCPlayersPreviewViewProtocol>)view {
    [self.router openSideMenu];
}

- (void)playersPreviewView:(id <CCPlayersPreviewViewProtocol>)view didSelectPlayerAtIndex:(NSUInteger)index {
    CCPlayerPreviewViewModel *player = self.players[index];
    [self.router goToPlayerDescriptionScreenWithPlayerID:player.playerID];
}

- (void)playersPreviewView:(id<CCPlayersPreviewViewProtocol>)view didScrollPlayerAtIndex:(NSUInteger)index {
    if (index == self.players.count - kLoadingLimit) {
        [self loadPlayersWithSpiner:NO];
    }
}

#pragma mark - Private

- (void)loadPlayersWithSpiner:(BOOL)spiner {
    if (self.players.count == 0 || self.players.count < self.countOfPlayersOnServer) {
        if (spiner) {
            [self.view showSpiner];
        }
        
        [self.ioc_playersService getPlayersPreviewWithOffset:self.players.count containerWidth:[self.view cellContainerWidth] data:^(NSArray<CCPlayerPreviewViewModel *> *players, BOOL fromServer, NSInteger countOfPlayersOnServer) {
            self.countOfPlayersOnServer = countOfPlayersOnServer;
            [self.players addObjectsFromArray:players];
            [self.view showPlayers:players];
            [self.view hideSpiner];
            (fromServer) ?: [self.view showMessageWithText:NSLocalizedString(@"message.offline_mode", nil)];
        }];
    }
}

@end
