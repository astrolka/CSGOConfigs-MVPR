//
//  CCLocalStorageServiceProtocol.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 02.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <AppleGuice/AppleGuiceInjectable.h>

#import "CCEventCoreDataModel+CoreDataProperties.h"
#import "CCPlayerPreviewCoreDataModel+CoreDataProperties.h"
#import "CCBannerCoreDataModel+CoreDataProperties.h"
#import "CCTeamCoreDataModel+CoreDataProperties.h"
#import "CCNewsDescriptionCoreDataModel+CoreDataProperties.h"
#import "CCPlayerDescriptionCoreDataModel+CoreDataProperties.h"
#import "CCNewsPreviewCoreDataModel+CoreDataProperties.h"
#import "CCEventServerModel.h"
#import "CCBannerServerModel.h"
#import "CCPlayerPreviewServerModel.h"
#import "CCTeamServerModel.h"
#import "CCPlayerDescriptionServerModel.h"
#import "CCNewsPreviewServerModel.h"
#import "CCNewsDescriptionServerModel.h"
#import "CCNewsDescriptionCoreDataModel+CoreDataClass.h"
#import "CCNewDescriptionContentCoreDataModel+CoreDataClass.h"
#import "CCUserFavoritesPlayersIDCoreDataModel+CoreDataClass.h"

/*
 
    Work with local storage, now it's works via CoreData and all methods returns NSManagedObject objects, what is bad, cuz we can't move to another DataBase (about this problem you can read in Rambler&Co blogs)
    TODO: Make methods цршср returns PONSO object with data
 
*/

@protocol CCLocalStorageServiceProtocol <AppleGuiceInjectable>

#pragma mark - Base

- (void)saveContext;

#pragma mark - NewsDescription

- (void)updateNewsDescription:(CCNewsDescriptionServerModel *)newsDescription;

- (CCNewsDescriptionCoreDataModel *)getNewsDescriptionWithID:(NSInteger)newsID;

#pragma mark - NewsPreview

- (void)updateNewsPreview:(NSArray <CCNewsPreviewServerModel *> *)newsPreview;

- (NSArray <CCNewsPreviewCoreDataModel *> *)getNewsPreview;

#pragma mark - FavoritePlayers

- (BOOL)playerIsFavorite:(NSInteger)playerID;

- (void)addPlayerToFavoritesWithPlayerID:(NSInteger)playerID;

- (void)removePlayerFromFavoritesWithID:(NSInteger)playerID;

- (NSArray *)getUserFavoritePlayersID;

- (NSArray <CCPlayerPreviewCoreDataModel *> *)getFavoritePlayersPreviewWithIDs:(NSArray *)playersIDs;

#pragma mark - PlayerDescription

- (void)updatePlayerDescription:(CCPlayerDescriptionServerModel *)playerDescriptionServerModel;

- (CCPlayerDescriptionCoreDataModel *)getPlayerDescriptionWithPlayerID:(NSInteger)playerID;

#pragma mark - PlayersPreview

- (void)updatePlayersPreview:(NSArray <CCPlayerPreviewServerModel *> *)playersPreview;

- (NSArray <CCPlayerPreviewCoreDataModel *> *)getPlayersPreview;

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

#pragma mark - ImageCache

- (void)clearImagesCache;

- (NSUInteger)getImageCacheSize;

@end
