//
//  CCTeamsRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCTeamsRouter.h"
#import "CCTeamsViewController.h"
#import "CCTeamsPresenter.h"
#import <RESideMenu/RESideMenu.h>

@interface CCTeamsRouter ()

@property (nonatomic, strong) CCTeamsViewController *viewController;

@end

@implementation CCTeamsRouter

- (id <CCTeamsViewProtocol>)buildTeamsModule {
    self.viewController = [[CCTeamsViewController alloc] init];
    CCTeamsPresenter *presenter = [[CCTeamsPresenter alloc] initWithView:self.viewController router:self];
    #pragma unused(presenter)
    return self.viewController;
}

#pragma mark - CCOpenSideMenuRouterProtocol

- (void)openSideMenu {
    [self.viewController.sideMenuViewController presentLeftMenuViewController];
}


@end
