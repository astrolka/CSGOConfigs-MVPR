//
//  CCAppToolsPresenter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCAppToolsPresenter.h"
#import "CCAppToolsViewProtocol.h"
#import "CCAppToolsRouterProtocol.h"

@interface CCAppToolsPresenter () <CCAppToolsViewActionProtocol>

@property (nonatomic, weak) id <CCAppToolsViewProtocol> view;
@property (nonatomic, strong) id <CCAppToolsRouterProtocol> router;

@end

@implementation CCAppToolsPresenter

- (instancetype)initWithView:(id <CCAppToolsViewProtocol>)view router:(id <CCAppToolsRouterProtocol>)router {
    self = [super init];
    if (self) {
        self.view = view;
        self.view.viewAction = self;
        self.router = router;
    }
    return self;
}

#pragma mark - CCAppToolsViewActionProtocol

- (void)appToolsViewDidOpenMenu:(id <CCAppToolsViewProtocol>)view {
    [self.router openSideMenu];
}

- (void)appToolsViewDidSelectClearCache:(id <CCAppToolsViewProtocol>)view {
    [self.view updateAppCache:@"xyq"];
}

- (void)appToolsViewDidSelectDonate:(id <CCAppToolsViewProtocol>)view {
    
}

- (void)appToolsViewDidSelectContactWithDeveloper:(id <CCAppToolsViewProtocol>)view {
    
}

- (void)appToolsViewDidSelectShareApp:(id <CCAppToolsViewProtocol>)view {
    
}

- (void)appToolsViewDidSelectRateApp:(id <CCAppToolsViewProtocol>)view {
    
}

@end
