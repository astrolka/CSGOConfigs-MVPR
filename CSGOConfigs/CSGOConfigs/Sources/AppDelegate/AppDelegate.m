//
//  AppDelegate.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 03.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "AppDelegate.h"
#import "CCDIManager.h"
#import "CCSideMenuRouter.h"
#import "CCLocalStorageServiceProtocol.h"

@interface AppDelegate ()

@property (nonatomic, strong) id <CCLocalStorageServiceProtocol> ioc_coreDataService;

@end

@implementation AppDelegate

+ (void)initialize {
    [CCDIManager DISetup];
}

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self navigationSetup];
    for (NSString *familyName in [UIFont familyNames]){
        NSLog(@"Family name: %@", familyName);
        for (NSString *fontName in [UIFont fontNamesForFamilyName:familyName]) {
            NSLog(@"--Font name: %@", fontName);
        }
    }
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self.ioc_coreDataService saveContext];
}

#pragma mark - Private

- (void)navigationSetup {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    CCSideMenuRouter *sideMenuRouter = [[CCSideMenuRouter alloc] init];
    [sideMenuRouter goToAppFromWindow:self.window];
}

@end
