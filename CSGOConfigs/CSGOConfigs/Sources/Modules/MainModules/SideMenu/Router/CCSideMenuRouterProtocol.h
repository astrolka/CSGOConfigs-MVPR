//
//  CCSideMenuRouterProtocol.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 05.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CCSideMenuRouterProtocol <NSObject>

- (void)goToPlayersPreviewScreen;

- (void)goToTeamsScreen;

- (void)goToFavoritePlayersScreen;

- (void)goToNewsPreviewScreen;

- (void)goToMapEventsScreen;

- (void)goToSkinsScreen;

- (void)goToAppToolsScreen;

@end
