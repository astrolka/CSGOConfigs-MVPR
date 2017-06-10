//
//  CCTeamsServiceProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 10.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCTeamViewModel.h"
@protocol CCTeamsServiceProtocol;


typedef void(^teamsDataBlock)(NSArray <CCTeamViewModel *> *teams, BOOL fromServer, NSInteger countOfPlayersOnServer);

@protocol CCTeamsServiceProtocol <NSObject>

- (void)getTeamsWithOffset:(NSInteger)offset data:(teamsDataBlock)teams;

@end
