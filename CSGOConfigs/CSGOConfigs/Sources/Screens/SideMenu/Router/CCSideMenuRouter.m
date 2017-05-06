//
//  CCSideMenuRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 05.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCSideMenuRouter.h"
#import <UIKit/UIWindow.h>
#import "BMYScrollableNavigationBar.h"
#import "CCSideMenuViewController.h"
#import "CCSideMenuPresenter.h"
#import "RESideMenu.h"

#import "CCPlayersRouter.h"
#import "CCAppToolsRouter.h"
#import "CCFavoritePlayersRouter.h"
#import "CCMapEventsRouter.h"
#import "CCNewsRouter.h"
#import "CCSkinsPriceRouter.h"
#import "CCTeamsRouter.h"

@interface CCSideMenuRouter ()

@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, weak) id <CCSideMenuViewProtocol> sideMenuView;

@end

@implementation CCSideMenuRouter

#pragma mark - Public

- (void)goToAppFromWindow:(UIWindow *)window {
    NSParameterAssert(window);
    
    CCPlayersRouter *playersRouter = [[CCPlayersRouter alloc] init];
    id <CCPlayersViewProtocol> playersView = [playersRouter buildPlayersModule];
    self.sideMenuView = [self buildSideMenuModule];
    
    self.navigationController = [[UINavigationController alloc] initWithNavigationBarClass:[BMYScrollableNavigationBar class] toolbarClass:nil];
    [self.navigationController setViewControllers:@[playersView] animated:NO];
    RESideMenu *sideMenu = [[RESideMenu alloc] initWithContentViewController:self.navigationController
                                                      leftMenuViewController:(UIViewController *)self.sideMenuView
                                                     rightMenuViewController:nil];
    window.rootViewController = sideMenu;
    [window makeKeyAndVisible];
}

#pragma mark - CCSideMenuRouterProtocol

- (void)goToPlayersScreen {
    CCPlayersRouter *router = [[CCPlayersRouter alloc] initWithNavigationController:self.navigationController];
    id <CCPlayersViewProtocol> view = [router buildPlayersModule];
    [self goToViewController:(UIViewController *)view];
}

- (void)goToTeamsScreen {
    CCTeamsRouter *router = [[CCTeamsRouter alloc] initWithNavigationController:self.navigationController];
    id <CCTeamsViewProtocol> view = [router buildTeamsModule];
    [self goToViewController:(UIViewController *)view];
}

- (void)goToFavoritePlayersScreen {
    CCFavoritePlayersRouter *router = [[CCFavoritePlayersRouter alloc] initWithNavigationController:self.navigationController];
    id <CCFavoritePlayersViewProtocol> view = [router buildFavoritePlayersModule];
    [self goToViewController:(UIViewController *)view];
}

- (void)goToNewsScreen {
    CCNewsRouter *router = [[CCNewsRouter alloc] initWithNavigationController:self.navigationController];
    id <CCNewsViewProtocol> view = [router buildNewsModule];
    [self goToViewController:(UIViewController *)view];
}

- (void)goToMapEventsScreen {
    CCMapEventsRouter *router = [[CCMapEventsRouter alloc] initWithNavigationController:self.navigationController];
    id <CCMapEventsViewProtocol> view = [router buildMapEventsModule];
    [self goToViewController:(UIViewController *)view];
}

- (void)goToSkinsScreen {
    CCSkinsPriceRouter *router = [[CCSkinsPriceRouter alloc] initWithNavigationController:self.navigationController];
    id <CCSkinsPriceViewProtocol> view = [router buildSkinsPriceModule];
    [self goToViewController:(UIViewController *)view];
}

- (void)goToAppToolsScreen {
    CCAppToolsRouter *router = [[CCAppToolsRouter alloc] initWithNavigationController:self.navigationController];
    id <CCAppToolsViewProtocol> view = [router buildAppToolsModule];
    [self goToViewController:(UIViewController *)view];
}

#pragma mark - Private

- (void)goToViewController:(UIViewController *)viewController {
    [self.navigationController setViewControllers:@[viewController]];
    CCSideMenuViewController *sideMenuViewController = (CCSideMenuViewController *)self.sideMenuView;
    [sideMenuViewController.sideMenuViewController setContentViewController:self.navigationController animated:YES];
    [sideMenuViewController.sideMenuViewController hideMenuViewController];
}

- (id <CCSideMenuViewProtocol>)buildSideMenuModule {
    CCSideMenuViewController *viewController = [[CCSideMenuViewController alloc] init];
    CCSideMenuPresenter *presenter = [[CCSideMenuPresenter alloc] initWithView:viewController router:self];
    #pragma unused(presenter)
    return viewController;
}

@end
