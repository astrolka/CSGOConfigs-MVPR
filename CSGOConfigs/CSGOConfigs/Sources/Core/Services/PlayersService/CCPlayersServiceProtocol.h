//
//  CCPlayersServiceProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 13.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppleGuice/AppleGuiceInjectable.h>
#import <CoreGraphics/CGBase.h>
@class CCPlayerPreviewViewModel;
@class CCPlayerDescriptionViewModel;

typedef void(^playersPreviewDataBlock)(NSArray <CCPlayerPreviewViewModel *> *players, BOOL fromServer, NSInteger countOfPlayersOnServer);

typedef void(^favoritePlayersPreviewDataBlock)(NSArray <CCPlayerPreviewViewModel *> *players);

typedef void(^playerDescriptionDataBlock)(CCPlayerDescriptionViewModel *player, BOOL fromServer);

@protocol CCPlayersServiceProtocol <AppleGuiceInjectable>

- (void)getPlayersPreviewWithOffset:(NSInteger)offset containerWidth:(CGFloat)containerWidth data:(playersPreviewDataBlock)players;

- (void)getFavoritePlayersPreviewWithContainerWidth:(CGFloat)containerWidth data:(favoritePlayersPreviewDataBlock)players;

- (void)getPlayerDescriptionWithPlayerID:(NSInteger)playerID data:(playerDescriptionDataBlock)player;

- (void)addPlayerToFavoritesWithPlayerID:(NSInteger)playerID;

- (void)removePlayerFromFavoritesWithPlayerID:(NSInteger)playerID;

- (BOOL)playerIsFavorite:(NSInteger)playerID;

@end
