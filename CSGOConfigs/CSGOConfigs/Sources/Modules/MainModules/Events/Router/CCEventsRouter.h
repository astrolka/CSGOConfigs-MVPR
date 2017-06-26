//
//  CCEventsRouter.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter.h"
#import "CCEventsRouterProtocol.h"
@protocol CCEventsViewProtocol;

@interface CCEventsRouter : CCRouter <CCEventsRouterProtocol>

- (id <CCEventsViewProtocol>)buildModule;

@end
