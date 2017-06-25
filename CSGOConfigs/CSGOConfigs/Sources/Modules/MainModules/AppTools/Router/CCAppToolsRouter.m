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
#import "CCRouter+OpenSideMenu.h"
#import "CCMailScreenRouting.h"
#import "CCRouter+ViewModelAlertPresenter.h"

@implementation CCAppToolsRouter

#pragma mark - CCViewModelAlertRoutingProtocol

- (void)showViewModelAlert:(CCViewModelAlert *)viewModelAlert {
    [self cc_presentViewModelAlert:viewModelAlert];
}

#pragma mark - CCMailScreenRoutingProtocol

- (void)openEmailScreenWithEmailInfo:(CCEmailInfo *)emailInfo withResult:(mailResultBlock)result {
    CCMailScreenRouting *emailRouter = [[CCMailScreenRouting alloc] initWithNavigationController:self.navigationController];
    [emailRouter openEmailScreenWithEmailInfo:emailInfo withResult:^(CCMailResult emailRouterResult) {
        result(emailRouterResult);
    }];
}

#pragma mark - CCOpenSideMenuRoutingProtocol

- (void)openSideMenu {
    [self cc_openSideMenu];
}

- (id <CCAppToolsViewProtocol>)buildAppToolsModule {
    CCAppToolsViewController *view = [[CCAppToolsViewController alloc] init];
    CCAppToolsPresenter *presenter = [[CCAppToolsPresenter alloc] initWithView:view router:self];
    #pragma unused(presenter)
    return view;
}

@end
