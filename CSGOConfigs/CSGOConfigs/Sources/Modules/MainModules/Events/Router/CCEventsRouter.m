
//
//  CCEventsRouter.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCEventsRouter.h"
#import "CCEventsViewController.h"
#import "CCRouter+OpenSideMenu.h"
#import "CCRouter+WebScreen.h"
#import "CCEventsPresenter.h"

@implementation CCEventsRouter

#pragma mark - CCOpenSideMenuRoutingProtocol

- (void)openSideMenu {
    [self cc_openSideMenu];
}

#pragma mark - CCWebRoutingProtocol

- (void)goToWebScreenWithURL:(NSURL *)url {
    [self cc_goToWebScreenWithURL:url];
}

#pragma mark - Module Build

- (id <CCEventsViewProtocol>)buildModule {
    CCEventsViewController *view = [[CCEventsViewController alloc] init];
    CCEventsPresenter *presenter = [[CCEventsPresenter alloc] initWithView:view router:self];
    #pragma unused(presenter)
    return view;
}


@end
