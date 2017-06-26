//
//  CCTeamsServiceProtocol.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 10.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppleGuice/AppleGuiceInjectable.h>
#import "CCTeamViewModel.h"
@protocol CCTeamsServiceProtocol;

typedef void(^serviceTeamsDataBlock)(NSArray <CCTeamViewModel *> *teams, BOOL fromServer, NSInteger countOfPlayersOnServer);

@protocol CCTeamsServiceProtocol <AppleGuiceInjectable>

- (void)getTeamsWithOffset:(NSInteger)offset data:(serviceTeamsDataBlock)teams;

@end
