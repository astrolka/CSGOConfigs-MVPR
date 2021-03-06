//
//  CCSideMenuRouter.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 05.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCSideMenuRouter.h"
#import <UIKit/UIWindow.h>
#import "BMYScrollableNavigationBar.h"
#import "CCSideMenuViewController.h"
#import "CCSideMenuPresenter.h"
#import "RESideMenu.h"
#import "UIColor+CC.h"

#import "CCFavoritePlayersRouter.h"
#import "CCPlayersPreviewRouter.h"
#import "CCNewsPreviewRouter.h"
#import "CCSkinsPriceRouter.h"
#import "CCAppToolsRouter.h"
#import "CCEventsRouter.h"
#import "CCTeamsRouter.h"

@interface CCSideMenuRouter ()

@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, weak) id <CCSideMenuViewProtocol> sideMenuView;

@end

@implementation CCSideMenuRouter

#pragma mark - Public

- (void)goToAppFromWindow:(UIWindow *)window {
    NSParameterAssert(window);

    self.sideMenuView = [self buildModule];
    self.navigationController = [[UINavigationController alloc] initWithNavigationBarClass:[BMYScrollableNavigationBar class] toolbarClass:nil];
    CCPlayersPreviewRouter *playersRouter = [[CCPlayersPreviewRouter alloc] initWithNavigationController:self.navigationController];
    id <CCPlayersPreviewViewProtocol> playersView = [playersRouter buildModule];
    [self.navigationController setViewControllers:@[playersView] animated:NO];
    RESideMenu *sideMenu = [[RESideMenu alloc] initWithContentViewController:self.navigationController
                                                      leftMenuViewController:(UIViewController *)self.sideMenuView
                                                     rightMenuViewController:nil];
    window.rootViewController = sideMenu;
    [self navigationBarSetup];
    [window makeKeyAndVisible];
}

#pragma mark - CCSideMenuRouterProtocol

- (void)goToPlayersPreviewScreen {
    CCPlayersPreviewRouter *router = [[CCPlayersPreviewRouter alloc] initWithNavigationController:self.navigationController];
    id <CCPlayersPreviewViewProtocol> view = [router buildModule];
    [self goToViewController:(UIViewController *)view];
}

- (void)goToTeamsScreen {
    CCTeamsRouter *router = [[CCTeamsRouter alloc] initWithNavigationController:self.navigationController];
    id <CCTeamsViewProtocol> view = [router buildModule];
    [self goToViewController:(UIViewController *)view];
}

- (void)goToFavoritePlayersScreen {
    CCFavoritePlayersRouter *router = [[CCFavoritePlayersRouter alloc] initWithNavigationController:self.navigationController];
    id <CCFavoritePlayersViewProtocol> view = [router buildModule];
    [self goToViewController:(UIViewController *)view];
}

- (void)goToNewsPreviewScreen {
    CCNewsPreviewRouter *router = [[CCNewsPreviewRouter alloc] initWithNavigationController:self.navigationController];
    id <CCNewsPreviewViewProtocol> view = [router buildModule];
    [self goToViewController:(UIViewController *)view];
}

- (void)goToMapEventsScreen {
    CCEventsRouter *router = [[CCEventsRouter alloc] initWithNavigationController:self.navigationController];
    id <CCEventsViewProtocol> view = [router buildModule];
    [self goToViewController:(UIViewController *)view];
}

- (void)goToSkinsScreen {
    CCSkinsPriceRouter *router = [[CCSkinsPriceRouter alloc] initWithNavigationController:self.navigationController];
    id <CCSkinsPriceViewProtocol> view = [router buildModule];
    [self goToViewController:(UIViewController *)view];
}

- (void)goToAppToolsScreen {
    CCAppToolsRouter *router = [[CCAppToolsRouter alloc] initWithNavigationController:self.navigationController];
    id <CCAppToolsViewProtocol> view = [router buildModule];
    [self goToViewController:(UIViewController *)view];
}

#pragma mark - Private

- (void)goToViewController:(UIViewController *)viewController {
    [self.navigationController setViewControllers:@[viewController]];
    CCSideMenuViewController *sideMenuViewController = (CCSideMenuViewController *)self.sideMenuView;
    [sideMenuViewController.sideMenuViewController setContentViewController:self.navigationController animated:YES];
    [sideMenuViewController.sideMenuViewController hideMenuViewController];
}

#pragma mark - Module Build

- (id <CCSideMenuViewProtocol>)buildModule {
    CCSideMenuViewController *viewController = [[CCSideMenuViewController alloc] init];
    CCSideMenuPresenter *presenter = [[CCSideMenuPresenter alloc] initWithView:viewController router:self];
    #pragma unused(presenter)
    return viewController;
}

#pragma mark - Private

- (void)navigationBarSetup {
    // Router can setup his "navigation" components
    [[UINavigationBar appearance] setBarTintColor:[UIColor cc_themeColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
}

@end
