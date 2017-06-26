//
//  CCAppToolsRouter.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter.h"
#import "CCAppToolsRouterProtocol.h"
#import "CCAppToolsViewProtocol.h"

@interface CCAppToolsRouter : CCRouter <CCAppToolsRouterProtocol>

- (id <CCAppToolsViewProtocol>)buildModule;

@end
