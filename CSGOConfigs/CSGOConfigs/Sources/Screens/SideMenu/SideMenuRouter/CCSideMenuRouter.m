//
//  CCSideMenuRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 05.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCSideMenuRouter.h"
#import "CCSideMenuViewController.h"
#import "CCSideMenuPresenter.h"

@implementation CCSideMenuRouter

- (CCSideMenuViewController *)sideMenuViewController {
    CCSideMenuViewController *viewController = [[CCSideMenuViewController alloc] init];
    CCSideMenuPresenter *presenter = [[CCSideMenuPresenter alloc] initWithView:viewController router:self];
    #pragma unused(presenter)
    return viewController;
}

@end
