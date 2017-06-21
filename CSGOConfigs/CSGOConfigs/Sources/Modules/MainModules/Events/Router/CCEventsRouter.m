
//
//  CCEventsRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCEventsRouter.h"
#import "CCEventsViewController.h"
#import "CCEventsPresenter.h"
#import "CCRouter+OpenSideMenu.h"
#import "CCRouter+WebScreen.h"

@implementation CCEventsRouter

- (id <CCEventsViewProtocol>)buildEventsModule {
    CCEventsViewController *view = [[CCEventsViewController alloc] init];
    CCEventsPresenter *presenter = [[CCEventsPresenter alloc] initWithView:view router:self];
    #pragma unused(presenter)
    return view;
}

#pragma mark - CCOpenSideMenuRouterProtocol

- (void)openSideMenu {
    [self cc_openSideMenu];
}

#pragma mark - CCWebRouterProtocol

- (void)goToWebScreenWithURL:(NSURL *)url {
    [self cc_goToWebScreenWithURL:url];
}

@end
