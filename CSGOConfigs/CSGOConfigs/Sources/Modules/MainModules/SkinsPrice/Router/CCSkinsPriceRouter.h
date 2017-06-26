//
//  CCSkinsPriceRouter.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter.h"
#import "CCSkinsPriceViewProtocol.h"
#import "CCSkinsPriceRouterProtocol.h"

@interface CCSkinsPriceRouter : CCRouter <CCSkinsPriceRouterProtocol>

- (id <CCSkinsPriceViewProtocol>)buildModule;

@end
