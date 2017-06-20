//
//  CCEventsPresenter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCEventsPresenter.h"
#import "CCEventsViewProtocol.h"
#import "CCEventsRouterProtocol.h"

@interface CCEventsPresenter () <CCEventsViewActionProtocol>

@property (nonatomic, strong) id <CCEventsViewProtocol> view;
@property (nonatomic, strong) id <CCEventsRouterProtocol> router;

@end

@implementation CCEventsPresenter

- (instancetype)initWithView:(id <CCEventsViewProtocol>)view router:(id <CCEventsRouterProtocol>)router {
    self = [super init];
    if (self) {
        self.router = router;
        self.view = view;
        self.view.viewAction = self;
    }
    return self;
}

#pragma mark - CCEventsViewActionProtocol



@end
