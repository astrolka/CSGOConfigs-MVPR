//
//  CCSideMenuRouter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 05.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCSideMenuRouterProtocol.h"

@class UIWindow;
@class CCSideMenuViewController;

@interface CCSideMenuRouter : NSObject <CCSideMenuRouterProtocol>

- (void)goToAppFromWindow:(UIWindow *)window;

@end
