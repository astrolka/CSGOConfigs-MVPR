//
//  CCPlayersRouterProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 03.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIWindow;

@protocol CCPlayersRouterProtocol <NSObject>

- (void)goToPlayersViewControllerFromWindow:(UIWindow *)window;

@end
