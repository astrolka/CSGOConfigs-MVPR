//
//  CCPlayersPreviewPresenter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayersPreviewPresenter.h"
#import "CCPlayersPreviewViewProtocol.h"
#import "CCPlayersPreviewRouterProtocol.h"
#import "CCOpenSideMenuRouterProtocol.h"
#import "CCPlayersServiceProtocol.h"
#import "CCRestServiceProtocol.h"
#import "CCPlayerPreviewViewModel.h"
#import "CCBannerViewModel.h"

@interface CCPlayersPreviewPresenter () <CCPlayersPreviewViewActionProtocol>

@property (nonatomic, weak) id <CCPlayersPreviewViewProtocol> view;
@property (nonatomic, strong) id <CCPlayersPreviewRouterProtocol, CCOpenSideMenuRouterProtocol> router;
@property (nonatomic, strong) id <CCPlayersServiceProtocol> ioc_playersService;

@property (nonatomic, strong) NSMutableArray <CCPlayerPreviewViewModel *> *players;
@property (nonatomic, assign) NSUInteger countOfPlayersOnServer; // pagination logic

@property (nonatomic, strong) NSArray <CCBannerViewModel *> *banners;

@end

CGFloat const kLoadingLimit = 6.f;

@implementation CCPlayersPreviewPresenter

- (instancetype)initWithView:(id <CCPlayersPreviewViewProtocol>)view router:(id <CCPlayersPreviewRouterProtocol, CCOpenSideMenuRouterProtocol>)router {
    self = [super init];
    if (self) {
        self.view = view;
        self.view.viewAction = self;
        self.router = router;
        
        self.countOfPlayersOnServer = 0;
        self.players = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - CCPlayersPreviewViewActionProtocol

- (void)playersPreviewViewDidSet:(id <CCPlayersPreviewViewProtocol>)view {
    [self loadPlayers];
    [self loadBanners];
}

- (void)playersPreviewViewDidOpenMenu:(id <CCPlayersPreviewViewProtocol>)view {
    [self.router openSideMenu];
}

- (void)playersPreviewView:(id <CCPlayersPreviewViewProtocol>)view didSelectPlayerAtIndex:(NSUInteger)index {
    
}

- (void)playersPreviewView:(id<CCPlayersPreviewViewProtocol>)view didScrollPlayerAtIndex:(NSUInteger)index {
    if (index == self.players.count - kLoadingLimit) {
        [self loadPlayers];
    }
}

#pragma mark - Private

- (void)loadPlayers {
    if (self.players.count == 0 || self.players.count < self.countOfPlayersOnServer) {
        [self.ioc_playersService getPlayersPreviewWithOffset:self.players.count containerWidth:[self.view cellContainerWidth] data:^(NSArray<CCPlayerPreviewViewModel *> *players, BOOL fromServer, NSInteger countOfPlayersOnServer) {
            self.countOfPlayersOnServer = countOfPlayersOnServer;
            [self.players addObjectsFromArray:players];
            [self.view showPlayers:players];
        }];
    }
}

- (void)loadBanners {
    CCBannerViewModel *vi = [[CCBannerViewModel alloc] init];
    vi.title = @"dsfsdfsdfsdf";
    vi.imageURL = [NSURL URLWithString:@"https://images-na.ssl-images-amazon.com/images/G/01/img15/pet-products/small-tiles/23695_pets_vertical_store_dogs_small_tile_8._CB312176604_.jpg"];
    vi.playerID = 3;
    [self.view showBanners:@[vi, vi]];
    
}

@end
