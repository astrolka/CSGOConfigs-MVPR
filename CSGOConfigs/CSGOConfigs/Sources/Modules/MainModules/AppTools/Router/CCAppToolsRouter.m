//
//  CCAppToolsRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCAppToolsRouter.h"
#import "CCAppToolsViewController.h"
#import "CCAppToolsPresenter.h"

@implementation CCAppToolsRouter

- (id <CCAppToolsViewProtocol>)buildAppToolsModule {
    CCAppToolsViewController *view = [[CCAppToolsViewController alloc] init];
    CCAppToolsPresenter *presenter = [[CCAppToolsPresenter alloc] initWithView:view router:self];
    #pragma unused(presenter)
    return view;
}

@end
