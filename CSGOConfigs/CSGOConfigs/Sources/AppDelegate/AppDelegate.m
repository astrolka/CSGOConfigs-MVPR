//
//  AppDelegate.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 03.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "AppDelegate.h"
#import "CCSideMenuRouter.h"
#import "CCDIManager.h"
#import "CCCoreDataServiceProtocol.h"
#import "CCCoreDataService.h"

@interface AppDelegate ()

@property (nonatomic, strong) id <CCCoreDataServiceProtocol> ioc_coreDataService;

@end

@implementation AppDelegate

+ (void)initialize {
    [CCDIManager DISetup];
}

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self navigationSetup];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self.ioc_coreDataService saveContext];
}

#pragma mark - Private

- (void)navigationSetup {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    CCSideMenuRouter *sideMenuRouter = [[CCSideMenuRouter alloc] init];
    [sideMenuRouter goToAppFromWindow:self.window];
}

@end
