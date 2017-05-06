//
//  CCPlayersRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 03.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayersRouter.h"
#import <UIKit/UIWindow.h>
#import "CCPlayersViewController.h"
#import "CCPlayersPresenter.h"
#import "BMYScrollableNavigationBar.h"
#import "CCSideMenuViewController.h"
#import "RESideMenu.h"
#import "CCSideMenuRouter.h"

@implementation CCPlayersRouter 

#pragma mark -CCPlayersRouterProtocol

- (void)goToPlayersViewControllerFromWindow:(UIWindow *)window {
    NSParameterAssert(window);
    
    CCPlayersViewController *playersViewController = [[CCPlayersViewController alloc] init];
    CCPlayersPresenter *playersPresenter = [[CCPlayersPresenter alloc] initWithView:playersViewController router:self];
    #pragma unused(playersPresenter)
    
    CCSideMenuRouter *sideMenuRouter = [[CCSideMenuRouter alloc] init];
    CCSideMenuViewController *sideMenuViewController = [sideMenuRouter sideMenuViewController];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithNavigationBarClass:[BMYScrollableNavigationBar class] toolbarClass:nil];
    [navigationController setViewControllers:@[playersViewController] animated:NO];
    RESideMenu *sideMenu = [[RESideMenu alloc]initWithContentViewController:navigationController
                                                     leftMenuViewController:sideMenuViewController
                                                    rightMenuViewController:nil];
    [sideMenu customSetup];
    window.rootViewController = sideMenu;
    [window makeKeyAndVisible];
}



@end
