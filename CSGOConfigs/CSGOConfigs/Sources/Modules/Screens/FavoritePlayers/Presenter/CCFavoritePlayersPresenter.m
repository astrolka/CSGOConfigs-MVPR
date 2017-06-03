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

@interface CCFavoritePlayersPresenter () <CCFavoritePlayersViewActionProtocol>

@property (nonatomic, weak) id <CCFavoritePlayersViewProtocol> view;
@property (nonatomic, weak) id <CCFavoritePlayersRouterProtocol> router;

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



@end
