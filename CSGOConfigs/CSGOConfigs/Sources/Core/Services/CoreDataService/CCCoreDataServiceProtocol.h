//
//  CCCoreDataServiceProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <AppleGuice/AppleGuiceInjectable.h>

@class CCEventCoreDataModel;
@class CCPlayerPreviewCoreDataModel;
@class CCBannerCoreDataModel;
@class CCTeamCoreDataModel;
@class CCEventServerModel;
@class CCBannerServerModel;
@class CCPlayerPreviewServerModel;
@class CCTeamServerModel;
@class CCPlayerDescriptionServerModel;
@class CCPlayerDescriptionCoreDataModel;
@class CCNewsPreviewCoreDataModel;
@class CCNewsPreviewServerModel;
@class CCNewsDescriptionServerModel;
@class CCNewsDescriptionCoreDataModel;

@protocol CCCoreDataServiceProtocol <AppleGuiceInjectable>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


#pragma mark - NewsDescription

- (void)updateNewsDescription:(CCNewsDescriptionServerModel *)newsDescriptionServerModel;

- (CCNewsDescriptionCoreDataModel *)getNewsDescriptionWithID:(NSInteger)newsID;


#pragma mark - NewsPreview

- (void)updateNewsPreview:(NSArray <CCNewsPreviewServerModel *> *)newsPreview;

- (NSArray <CCNewsPreviewCoreDataModel *> *)getNewsPreview;


#pragma mark - FavoritePlayers

- (BOOL)playerIsFavorite:(NSInteger)playerID;

- (void)addPlayerToFavoritesWithPlayerID:(NSInteger)playerID;

- (void)removePlayerFromFavoritesWithID:(NSInteger)playerID;

- (NSArray *)getUserFavoritePlayersID;


#pragma mark - PlayerDescription

- (void)updatePlayerDescription:(CCPlayerDescriptionServerModel *)playerDescriptionServerModel;

// this method can return nil (similar to another methods when retrun a empty array), it's mean no data about player with this ID
- (CCPlayerDescriptionCoreDataModel *)getPlayerDescriptionWithPlayerID:(NSInteger)playerID;


#pragma mark - PlayersPreview

- (void)updatePlayersPreview:(NSArray <CCPlayerPreviewServerModel *> *)playersPreview;

- (NSArray <CCPlayerPreviewCoreDataModel *> *)getPlayersPreview;

// put in arrayOfID id's of players and i woud return you them
- (NSArray <CCPlayerPreviewCoreDataModel *> *)getPlayersPreviewWithContainsID:(NSArray *)arrayOfID;


#pragma mark - Banners

- (void)updateBanners:(NSArray <CCBannerServerModel *> *)banners;

- (NSArray <CCBannerCoreDataModel *> *)getBanners;


#pragma mark - Teams

- (void)updateTeams:(NSArray <CCTeamServerModel *> *)teams;

- (NSArray <CCTeamCoreDataModel *> *)getTeams;


#pragma mark - Events

- (void)updateEvents:(NSArray <CCEventServerModel *> *)events;

- (NSArray <CCEventCoreDataModel *> *)getEvents;

@end