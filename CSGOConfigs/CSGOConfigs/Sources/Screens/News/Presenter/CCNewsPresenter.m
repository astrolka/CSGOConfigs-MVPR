//
//  CCNewsPresenter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsPresenter.h"
#import "CCNewsViewProtocol.h"
#import "CCNewsRouterProtocol.h"

@interface CCNewsPresenter () <CCNewsViewActionProtocol>

@property (nonatomic, weak) id <CCNewsViewProtocol> view;
@property (nonatomic, strong) id <CCNewsRouterProtocol> router;

@end

@implementation CCNewsPresenter

- (instancetype)initWithView:(id <CCNewsViewProtocol>)view router:(id <CCNewsRouterProtocol>)router {
    self = [super init];
    if (self) {
        self.view = view;
        self.view.viewAction = self;
        self.router = router;
    }
    return self;
}

#pragma mark - CCNewsViewActionProtocol

@end
