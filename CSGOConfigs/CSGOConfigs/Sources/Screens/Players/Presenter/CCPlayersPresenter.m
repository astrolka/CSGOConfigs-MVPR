//
//  CCPlayersPresenter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 03.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayersPresenter.h"
#import "CCPlayersViewProtocol.h"
#import "CCPlayersRouterProtocol.h"

@interface CCPlayersPresenter () <CCPlayersViewActionProtocol>

@property (nonatomic, weak) id <CCPlayersViewProtocol> view;
@property (nonatomic, strong) id <CCPlayersRouterProtocol> router;

@end

@implementation CCPlayersPresenter

- (instancetype)initWithView:(id <CCPlayersViewProtocol>)view router:(id <CCPlayersRouterProtocol>)router {
    self = [super init];
    if (self) {
        self.router = router;
        self.view = view;
        self.view.viewAction = self;
    }
    return self;
}

#pragma mark -CCPlayersViewAction

- (void)makeKek {
    NSLog(@"hello");
}

@end
