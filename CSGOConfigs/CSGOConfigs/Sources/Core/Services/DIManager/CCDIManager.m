//
//  CCDIManager.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 13.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCDIManager.h"
#import <AppleGuice/AppleGuice.h>

#import "CCPlayersServiceProtocol.h"
#import "CCPlayersService.h"

#import "CCRestServiceProtocol.h"
#import "CCRestService.h"

#import "CCLocalStorageServiceProtocol.h"
#import "CCCoreDataService.h"

@implementation CCDIManager

#pragma mark - Public

+ (void)DISetup {
    [AppleGuice startService];
    [self setupImplementations];
}

#pragma mark - Private

+ (void)setupImplementations {
    [AppleGuice setImplementation:[CCPlayersService class] withProtocol:@protocol(CCPlayersServiceProtocol)];
    [AppleGuice setImplementation:[CCRestService class] withProtocol:@protocol(CCRestServiceProtocol)];
    [AppleGuice setImplementation:[CCCoreDataService class] withProtocol:@protocol(CCLocalStorageServiceProtocol)];
}

@end
