//
//  AppDelegate.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 03.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "AppDelegate.h"
#import "CCPlayersRouter.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self navigationSetup];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // SAVE CONTEXT
}

#pragma mark -Private

- (void)navigationSetup {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    CCPlayersRouter *playersRouter = [[CCPlayersRouter alloc] init];
    [playersRouter goToPlayersViewControllerFromWindow:self.window];
}

@end
