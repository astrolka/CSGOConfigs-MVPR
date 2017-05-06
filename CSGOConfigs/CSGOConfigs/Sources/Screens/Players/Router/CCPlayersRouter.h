//
//  CCPlayersRouter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 03.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter.h"
#import "CCPlayersRouterProtocol.h"
#import "CCPlayersViewController.h"

@interface CCPlayersRouter : CCRouter <CCPlayersRouterProtocol>

- (id <CCPlayersViewProtocol>)buildPlayersModule;

@end
