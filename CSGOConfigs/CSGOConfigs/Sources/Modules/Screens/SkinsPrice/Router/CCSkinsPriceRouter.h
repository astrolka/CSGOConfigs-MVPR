//
//  CCSkinsPriceRouter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter.h"
#import "CCSkinsPriceRouterProtocol.h"
#import "CCSkinsPriceViewProtocol.h"

@interface CCSkinsPriceRouter : CCRouter <CCSkinsPriceRouterProtocol>

- (id <CCSkinsPriceViewProtocol>)buildSkinsPriceModule;

@end
