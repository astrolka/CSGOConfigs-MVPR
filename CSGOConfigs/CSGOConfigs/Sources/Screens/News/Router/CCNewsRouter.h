//
//  CCNewsRouter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter.h"
#import "CCNewsRouterProtocol.h"
#import "CCNewsViewProtocol.h"

@interface CCNewsRouter : CCRouter <CCNewsRouterProtocol>

- (id <CCNewsViewProtocol>)buildNewsModule;

@end
