//
//  CCPlayersViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 03.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCViewControllerProtocol.h"

@protocol CCPlayersViewActionProtocol

- (void)makeKek;

@end

@protocol CCPlayersViewProtocol <CCViewControllerProtocol>

@property (nonatomic, strong) id <CCPlayersViewActionProtocol> viewAction;

//- (void)showPlayers;

@end
