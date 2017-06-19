//
//  CCMapEventsRouter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter.h"
#import "CCMapEventsRouterProtocol.h"
#import "CCMapEventsViewProtocol.h"

@interface CCMapEventsRouter : CCRouter <CCMapEventsRouterProtocol>

- (id <CCMapEventsViewProtocol>)buildMapEventsModule;

@end
