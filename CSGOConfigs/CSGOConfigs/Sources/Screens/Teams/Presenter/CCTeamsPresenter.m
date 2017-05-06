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

@interface CCTeamsPresenter () <CCTeamsViewActionProtocol>

@property (nonatomic, weak) id <CCTeamsViewProtocol> view;
@property (nonatomic, strong) id <CCTeamsRouterProtocol> router;

@end

@implementation CCTeamsPresenter

- (instancetype)initWithView:(id <CCTeamsViewProtocol>)view router:(id <CCTeamsRouterProtocol>)router {
    self = [super init];
    if (self) {
        self.view = view;
        self.view.viewAction = self;
        self.router = router;
    }
    return self;
}

#pragma mark - CCTeamsViewActionProtocol



@end
