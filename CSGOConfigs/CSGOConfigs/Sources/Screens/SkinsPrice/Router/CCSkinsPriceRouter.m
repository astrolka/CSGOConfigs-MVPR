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

@implementation CCSkinsPriceRouter

- (id <CCSkinsPriceViewProtocol>)buildSkinsPriceModule {
    CCSkinsPriceViewController *viewController = [[CCSkinsPriceViewController alloc] init];
    CCSkinsPricePresenter *presenter = [[CCSkinsPricePresenter alloc] initWithView:viewController router:self];
    #pragma unused(presenter)
    return viewController;
}

@end
