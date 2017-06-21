
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
#import <RESideMenu/RESideMenu.h>

@interface CCEventsRouter ()

@property (nonatomic, strong) id <CCEventsViewProtocol> view;

@end

@implementation CCEventsRouter

- (id <CCEventsViewProtocol>)buildEventsModule {
    self.view = [[CCEventsViewController alloc] init];
    CCEventsPresenter *presenter = [[CCEventsPresenter alloc] initWithView:self.view router:self];
    #pragma unused(presenter)
    return self.view;
}

#pragma mark - CCOpenSideMenuRouterProtocol

- (void)openSideMenu {
    UIViewController *viewController = (UIViewController*)self.view;
    [viewController.sideMenuViewController presentLeftMenuViewController];
}

#pragma mark - CCWebRouterProtocol

- (void)goToWebScreenWithURL:(NSURL *)url {
    
}

@end
