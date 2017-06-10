//
//  CCTeamsRouterProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCOpenSideMenuRouterProtocol.h"

@protocol CCTeamsRouterProtocol <CCOpenSideMenuRouterProtocol>

- (void)goToPlayerDescriptionScreenWithPlayerID:(NSUInteger)playerID;

@end
