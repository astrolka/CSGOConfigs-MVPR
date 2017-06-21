//
//  CCSkinsPriceRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCSkinsPriceRouter.h"
#import "CCSkinsPriceViewController.h"
#import "CCSkinsPricePresenter.h"
#import "CCRouter+OpenSideMenu.h"

@implementation CCSkinsPriceRouter

#pragma mark - CCOpenSideMenuRouterProtocol

- (void)openSideMenu {
    [self cc_openSideMenu];
}

- (id <CCSkinsPriceViewProtocol>)buildSkinsPriceModule {
    CCSkinsPriceViewController *view = [[CCSkinsPriceViewController alloc] init];
    CCSkinsPricePresenter *presenter = [[CCSkinsPricePresenter alloc] initWithView:view router:self];
    #pragma unused(presenter)
    return view;
}

@end
