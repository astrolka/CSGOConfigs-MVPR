//
//  CCSideMenuRouter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 05.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCSideMenuRouterProtocol.h"
@class CCSideMenuViewController;

@interface CCSideMenuRouter : NSObject <CCSideMenuRouterProtocol>

- (CCSideMenuViewController *)sideMenuViewController;

@end
