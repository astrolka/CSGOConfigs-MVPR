//
//  CCSkinsPriceRouter.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCSkinsPriceRouter.h"
#import "CCSkinsPriceViewController.h"
#import "CCSkinsPricePresenter.h"
#import "CCRouter+OpenSideMenu.h"

@implementation CCSkinsPriceRouter

#pragma mark - CCOpenSideMenuRoutingProtocol

- (void)openSideMenu {
    [self cc_openSideMenu];
}

#pragma mark - Module Build

- (id <CCSkinsPriceViewProtocol>)buildModule {
    CCSkinsPriceViewController *view = [[CCSkinsPriceViewController alloc] init];
    CCSkinsPricePresenter *presenter = [[CCSkinsPricePresenter alloc] initWithView:view router:self];
    #pragma unused(presenter)
    return view;
}

@end
