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
#import "CCPlayersServiceProtocol.h"
#import "CCRestServiceProtocol.h"

@interface CCPlayersPreviewPresenter () <CCPlayersPreviewViewActionProtocol>

@property (nonatomic, weak) id <CCPlayersPreviewViewProtocol> view;
@property (nonatomic, strong) id <CCPlayersPreviewRouterProtocol> router;
@property (nonatomic, strong) id <CCPlayersServiceProtocol> ioc_playersService;

@end

@implementation CCPlayersPreviewPresenter

- (instancetype)initWithView:(id <CCPlayersPreviewViewProtocol>)view router:(id <CCPlayersPreviewRouterProtocol>)router {
    self = [super init];
    if (self) {
        self.view = view;
        self.view.viewAction = self;
        self.router = router;
        [self lol];
    }
    return self;
}

#pragma mark - CCPlayersPreviewViewActionProtocol

- (void)playersPreviewView:(id <CCPlayersPreviewViewProtocol>)view didSelectPlayerAtIndex:(NSInteger)index {
    
    
}

#pragma mark - Private

- (void)lol {
    
    [self.ioc_playersService getPlayersPreviewWithOffset:30 containerWidth:320 data:^(NSArray<CCPlayerPreviewViewModel *> *players, BOOL fromServer, NSInteger countOfPlayersOnServer) {
        
    }];
}

@end
