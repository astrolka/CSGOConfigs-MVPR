//
//  CCPlayersService.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 13.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCLocalStorageServiceProtocol.h"
#import "CCPlayersServiceProtocol.h"
#import "CCRestServiceProtocol.h"

@interface CCPlayersService : NSObject <CCPlayersServiceProtocol>

@property (nonatomic, strong) id <CCRestServiceProtocol> ioc_restService;
@property (nonatomic, strong) id <CCLocalStorageServiceProtocol> ioc_localStorageService;

@end
