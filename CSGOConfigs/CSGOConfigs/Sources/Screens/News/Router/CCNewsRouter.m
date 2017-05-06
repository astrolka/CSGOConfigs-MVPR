//
//  CCNewsRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsRouter.h"
#import "CCNewsPresenter.h"
#import "CCNewsViewController.h"

@implementation CCNewsRouter

- (id <CCNewsViewProtocol>)buildNewsModule {
    CCNewsViewController *viewController = [[CCNewsViewController alloc] init];
    CCNewsPresenter *presenter = [[CCNewsPresenter alloc] initWithView:viewController router:self];
    #pragma unused(presenter)
    return viewController;
}

@end
