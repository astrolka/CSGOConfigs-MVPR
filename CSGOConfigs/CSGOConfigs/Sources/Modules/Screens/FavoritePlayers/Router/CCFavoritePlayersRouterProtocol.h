//
//  CCFavoritePlayersRouterProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCOpenSideMenuRouterProtocol.h"

@protocol CCFavoritePlayersRouterProtocol <CCOpenSideMenuRouterProtocol>

- (void)goToPlayerDescriptionScreenWithPlayerID:(NSUInteger)playerID;

@end
