//
//  CCPlayersViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 03.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCParentViewProtocol.h"

@protocol CCPlayersViewActionProtocol

- (void)makeKek;

@end

@protocol CCPlayersViewProtocol <CCParentViewProtocol>

@property id <CCPlayersViewActionProtocol> viewAction;

//- (void)showPlayers;

@end
