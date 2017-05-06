//
//  CCPlayersRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 03.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayersRouter.h"
#import "CCPlayersPresenter.h"

@interface CCPlayersRouter ()

@end

@implementation CCPlayersRouter 

#pragma mark - Public

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController {
    self = [super init];
    if (self) {
        self.navigationController = navigationController;
    }
    return self;
}

#pragma mark - CCPlayersRouterProtocol

- (void)goToPlayerDescriptionScreenWithPlayerID:(NSInteger)playerID {
    
    
}

- (id <CCPlayersViewProtocol>)buildPlayersModule; {
    CCPlayersViewController *viewController = [[CCPlayersViewController alloc] init];
    CCPlayersPresenter *presenter = [[CCPlayersPresenter alloc] initWithView:viewController router:self];
    #pragma unused(presenter)
    return viewController;
}

@end
