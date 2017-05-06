//
//  CCSideMenuRouterProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 05.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CCSideMenuRouterProtocol <NSObject>

- (void)goToPlayersScreen;

- (void)goToTeamsScreen;

- (void)goToFavoritePlayersScreen;

- (void)goToNewsScreen;

- (void)goToMapEventsScreen;

- (void)goToSkinsScreen;

- (void)goToAppToolsScreen;

@end
