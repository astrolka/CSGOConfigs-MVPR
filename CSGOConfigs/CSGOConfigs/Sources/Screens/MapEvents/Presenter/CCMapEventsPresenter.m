//
//  CCMapEventsPresenter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCMapEventsPresenter.h"
#import "CCMapEventsViewProtocol.h"
#import "CCMapEventsRouterProtocol.h"

@interface CCMapEventsPresenter () <CCMapEventsViewActionProtocol>

@property (nonatomic, weak) id <CCMapEventsViewProtocol> view;
@property (nonatomic, strong) id <CCMapEventsRouterProtocol> router;

@end

@implementation CCMapEventsPresenter

- (instancetype)initWithView:(id <CCMapEventsViewProtocol>)view router:(id <CCMapEventsRouterProtocol>)router {
    self = [super init];
    if (self) {
        self.view = view;
        self.view.viewAction = self;
        self.router = router;
    }
    return self;
}

#pragma mark - CCMapEventsViewActionProtocol

@end
