//
//  CCNewsPreviewRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsPreviewRouter.h"
#import "CCNewsPreviewViewController.h"
#import "CCNewsPreviewPresenter.h"
#import "CCNewsDescriptionRouter.h"
#import "CCRouter+OpenSideMenu.h"

@implementation CCNewsPreviewRouter

#pragma mark - CCNewsPreviewRouterProtocol

- (void)goToNewsDescriptionScreenWithNewsID:(NSUInteger)newsID {
    CCNewsDescriptionRouter *newsDescriptionRouter = [[CCNewsDescriptionRouter alloc] initWithNavigationController:self.navigationController];
    [newsDescriptionRouter goToNewsDescriptionScreenWithNewsID:newsID];
}

#pragma mark - CCOpenSideMenuRouterProtocol

- (void)openSideMenu {
    [self cc_openSideMenu];
}

#pragma mark - BuildModule

- (id <CCNewsPreviewViewProtocol>)buildNewsPreviewModule {
    CCNewsPreviewViewController *view = [[CCNewsPreviewViewController alloc] init];
    CCNewsPreviewPresenter *presenter = [[CCNewsPreviewPresenter alloc] initWithView:view router:self];
    #pragma unused(presenter)
    return view;
}

@end
