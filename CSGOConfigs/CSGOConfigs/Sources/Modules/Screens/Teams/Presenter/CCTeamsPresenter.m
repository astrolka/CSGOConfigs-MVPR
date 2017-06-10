//
//  CCTeamsPresenter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCTeamsPresenter.h"
#import "CCTeamsViewProtocol.h"
#import "CCTeamsRouterProtocol.h"
#import "CCTeamsServiceProtocol.h"
#import "CCBannerServiceProtocol.h"

@interface CCTeamsPresenter () <CCTeamsViewActionProtocol>

@property (nonatomic, strong) id <CCTeamsServiceProtocol> ioc_teamsService;
@property (nonatomic, strong) id <CCBannerServiceProtocol> ioc_bannersService;

@property (nonatomic, weak) id <CCTeamsViewProtocol> view;
@property (nonatomic, strong) id <CCTeamsRouterProtocol> router;

@property (nonatomic, strong) NSMutableArray <CCTeamViewModel *> *teams;
@property (nonatomic, assign) NSUInteger countOfTeamsOnServer; // pagination logic

@property (nonatomic, strong) NSArray <CCBannerViewModel *> *banners;

@end

@implementation CCTeamsPresenter

static const NSInteger kLoadingLimitd = 6;

- (instancetype)initWithView:(id <CCTeamsViewProtocol>)view router:(id <CCTeamsRouterProtocol>)router {
    self = [super init];
    if (self) {
        self.view = view;
        self.view.viewAction = self;
        self.router = router;
        self.countOfTeamsOnServer = 0;
        self.teams = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - CCTeamsViewActionProtocol

- (void)teamsViewDidSet:(id <CCTeamsViewProtocol>)view {
    [self loadBanners];
    [self loadTeamsWithSpiner:YES];
}

- (void)teamsViewDidOpenMenu:(id <CCTeamsViewProtocol>)view {
    [self.router openSideMenu];
}

- (void)teamsView:(id <CCTeamsViewProtocol>)view didSelectBannerAtIndex:(NSUInteger)index {
    CCBannerViewModel *banner = self.banners[index];
    [self.router goToPlayerDescriptionScreenWithPlayerID:banner.playerID];
}

- (void)teamsView:(id <CCTeamsViewProtocol>)view didSelectTeamAtIndex:(NSUInteger)teamIndex playerIndex:(NSUInteger)playerIndex {
    CCTeamViewModel *team = self.teams[teamIndex];
    CCPlayerPreviewViewModel *player = team.players[playerIndex];
    [self.router goToPlayerDescriptionScreenWithPlayerID:player.playerID];
}

- (void)teamsView:(id <CCTeamsViewProtocol>)view didScrollPlayerAtIndex:(NSUInteger)index {
    if (index == self.teams.count - kLoadingLimitd) {
        [self loadTeamsWithSpiner:NO];
    }
}

#pragma mark - Private

- (void)loadTeamsWithSpiner:(BOOL)spiner {
    if (self.teams.count == 0 || self.teams.count < self.countOfTeamsOnServer) {
        !(spiner) ?: [self.view showSpiner];
        [self.ioc_teamsService getTeamsWithOffset:self.teams.count data:^(NSArray<CCTeamViewModel *> *teams, BOOL fromServer, NSInteger countOfPlayersOnServer) {
            [self.teams addObjectsFromArray:teams];
            [self.view showTeams:self.teams];
            [self.view hideSpiner];
            (fromServer) ?: [self.view showMessageWithText:@"hello"];
        }];
    }
}

- (void)loadBanners {
    [self.ioc_bannersService getBanners:^(NSArray<CCBannerViewModel *> *banners, CGFloat bannerHeight) {
        self.banners = banners;
        [self.view updateBannerHeight:bannerHeight];
        [self.view showBanners:banners];
    }];
}

@end
