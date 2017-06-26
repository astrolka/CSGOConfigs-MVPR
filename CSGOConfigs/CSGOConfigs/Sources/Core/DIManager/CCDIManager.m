//
//  CCDIManager.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 13.05.17.
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

#import "CCBannerServiceProtocol.h"
#import "CCBannerService.h"

#import "CCTeamsServiceProtocol.h"
#import "CCTeamsService.h"

#import "CCNewsServiceProtocol.h"
#import "CCNewsService.h"

#import "CCEventsServiceProtocol.h"
#import "CCEventsService.h"

#import "CCWebSocketServiceProtocol.h"
#import "CCWebSocketService.h"

#import "CCSkinsServiceProtocol.h"
#import "CCSkinsService.h"

#import "CCOpenURLServiceProtocol.h"
#import "CCOpenURLService.h"

@implementation CCDIManager

#pragma mark - Public

+ (void)DISetup {
    [AppleGuice startService];
    
    [AppleGuice setImplementation:[CCPlayersService class] withProtocol:@protocol(CCPlayersServiceProtocol)];
    [AppleGuice setImplementation:[CCRestService class] withProtocol:@protocol(CCRestServiceProtocol)];
    [AppleGuice setImplementation:[CCCoreDataService class] withProtocol:@protocol(CCLocalStorageServiceProtocol)];
    [AppleGuice setImplementation:[CCBannerService class] withProtocol:@protocol(CCBannerServiceProtocol)];
    [AppleGuice setImplementation:[CCTeamsService class] withProtocol:@protocol(CCTeamsServiceProtocol)];
    [AppleGuice setImplementation:[CCNewsService class] withProtocol:@protocol(CCNewsServiceProtocol)];
    [AppleGuice setImplementation:[CCEventsService class] withProtocol:@protocol(CCEventsServiceProtocol)];
    [AppleGuice setImplementation:[CCWebSocketService class] withProtocol:@protocol(CCWebSocketServiceProtocol)];
    [AppleGuice setImplementation:[CCSkinsService class] withProtocol:@protocol(CCSkinsServiceProtocol)];
    [AppleGuice setImplementation:[CCOpenURLService class] withProtocol:@protocol(CCOpenURLServiceProtocol)];
}

@end
