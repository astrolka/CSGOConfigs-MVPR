//
//  CCPlayersPreviewRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayersPreviewRouter.h"
#import "CCPlayersPreviewViewController.h"
#import "CCPlayersPreviewPresenter.h"
#import <RESideMenu/RESideMenu.h>

@interface CCPlayersPreviewRouter ()

@property (nonatomic, strong) CCPlayersPreviewViewController *viewController;

@end

@implementation CCPlayersPreviewRouter

- (id <CCPlayersPreviewViewProtocol>)buildPlayersPreviewModule {
    self.viewController = [[CCPlayersPreviewViewController alloc] init];
    CCPlayersPreviewPresenter *presenter = [[CCPlayersPreviewPresenter alloc] initWithView:self.viewController router:self];
    #pragma unused(presenter)
    return self.viewController;
}

#pragma mark - CCOpenSideMenuRouterProtocol

- (void)openSideMenu {
    [self.viewController.sideMenuViewController presentLeftMenuViewController];
}

@end
