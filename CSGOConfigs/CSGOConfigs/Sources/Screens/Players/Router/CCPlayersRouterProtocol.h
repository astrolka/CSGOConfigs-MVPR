//
//  CCPlayersRouterProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 03.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIWindow;
@class UINavigationController;

@protocol CCPlayersRouterProtocol <NSObject>

- (void)goToPlayerDescriptionScreenWithPlayerID:(NSInteger)playerID;

@end
