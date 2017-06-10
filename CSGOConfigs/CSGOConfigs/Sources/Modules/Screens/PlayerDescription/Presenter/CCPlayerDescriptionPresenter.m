//
//  CCPlayerDescriptionPresenter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 11.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayerDescriptionPresenter.h"
#import "CCPlayerDescriptionViewProtocol.h"
#import "CCPlayerDescriptionRouterProtocol.h"
#import "CCPlayersServiceProtocol.h"

@interface CCPlayerDescriptionPresenter ()

@property (nonatomic, strong) id <CCPlayersServiceProtocol> ioc_playersService;

@property (nonatomic, strong) id <CCPlayerDescriptionViewProtocol> view;
@property (nonatomic, strong) id <CCPlayerDescriptionRouterProtocol> router;

@property (nonatomic, assign) NSUInteger playerID;

@end

@implementation CCPlayerDescriptionPresenter

- (instancetype)initWithView:(id <CCPlayerDescriptionViewProtocol>)view router:(id <CCPlayerDescriptionRouterProtocol>)router playerID:(NSUInteger)playerID {
    self = [super init];
    if (self) {
        self.playerID = playerID;
        self.router = router;
        self.view = view;
    }
    return self;
}

@end
