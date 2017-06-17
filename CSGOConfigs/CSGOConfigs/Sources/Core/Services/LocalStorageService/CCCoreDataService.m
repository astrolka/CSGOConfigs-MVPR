//
//  CCCoreDataService.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 03.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCCoreDataService.h"
#import "AppDelegate.h"
#import "CCLog.h"


@interface CCCoreDataService ()

@property (nonatomic, strong, readwrite) NSPersistentContainer *persistentContainer;

@end

@implementation CCCoreDataService

NSString *const kPersistentContainerName = @"CCConfigs";

#pragma mark - CCCoreDataServiceProtocol

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        CCLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:kPersistentContainerName];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    CCLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    return _persistentContainer;
}

#pragma mark - NewsDescription

- (void)updateNewsDescription:(CCNewsDescriptionServerModel *)newsDescriptionServerModel {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"newsID == %d", newsDescriptionServerModel.newsID];
    NSArray *dataEntity = [self getEntityWithName:NSStringFromClass([CCNewsDescriptionCoreDataModel class]) predicate:predicate];
    if (dataEntity.count > 0) {
        CCNewsDescriptionCoreDataModel *newsDescriptionCoreDataModel = [dataEntity firstObject];
        [newsDescriptionCoreDataModel updateWithServerModel:newsDescriptionServerModel];
        [self updateNewsDescriptionCoreDataModel:newsDescriptionCoreDataModel newDescriptionContent:newsDescriptionServerModel.content];
    } else {
        CCNewsDescriptionCoreDataModel *newsDescriptionCoreDataModel = (CCNewsDescriptionCoreDataModel *)[NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([CCNewsDescriptionCoreDataModel class])
                                                                                                                                        inManagedObjectContext:self.persistentContainer.viewContext];
        [newsDescriptionCoreDataModel updateWithServerModel:newsDescriptionServerModel];
        [self updateNewsDescriptionCoreDataModel:newsDescriptionCoreDataModel newDescriptionContent:newsDescriptionServerModel.content];
    }
    [self save];
}

- (CCNewsDescriptionCoreDataModel *)getNewsDescriptionWithID:(NSInteger)newsID {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"newsID == %d",newsID];
    NSArray *dataEntity = [self getEntityWithName:NSStringFromClass([CCNewsDescriptionCoreDataModel class]) predicate:predicate];
    if (dataEntity.count > 0) {
        CCNewsDescriptionCoreDataModel *newsDescriptionCoreDataModel = [dataEntity firstObject];
        return newsDescriptionCoreDataModel;
    } else {
        return nil;
    }
}

- (void)updateNewsDescriptionCoreDataModel:(CCNewsDescriptionCoreDataModel *)newsDescriptionCoreDataModel
                     newDescriptionContent:(NSArray <CCNewsDescriptionContentServerModel *> *)content {
    [newsDescriptionCoreDataModel.contentNewsRelationship enumerateObjectsUsingBlock:^(CCNewDescriptionContentCoreDataModel * _Nonnull oldNewDescriptionContentCoreDataModel, BOOL * _Nonnull stop) {
        [self.persistentContainer.viewContext deleteObject:oldNewDescriptionContentCoreDataModel];
    }];
    
    [content enumerateObjectsUsingBlock:^(CCNewsDescriptionContentServerModel * _Nonnull newsDescriptionContentServerModel, NSUInteger idx, BOOL * _Nonnull stop) {
        CCNewDescriptionContentCoreDataModel *newDescriptionContentCoreDataModel = (CCNewDescriptionContentCoreDataModel *)[NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([CCNewDescriptionContentCoreDataModel class]) inManagedObjectContext:self.persistentContainer.viewContext];
        [newDescriptionContentCoreDataModel updateWithServerModel:newsDescriptionContentServerModel];
        newDescriptionContentCoreDataModel.descriptionNewsRelationship = newsDescriptionCoreDataModel;
    }];
}


#pragma mark - NewsPreview

- (void)updateNewsPreview:(NSArray <CCNewsPreviewServerModel *> *)newsPreview {
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:NSStringFromClass([CCNewsPreviewServerModel class]) inManagedObjectContext:self.persistentContainer.viewContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    [newsPreview enumerateObjectsUsingBlock:^(CCNewsPreviewServerModel * _Nonnull newsPreviewServerModel, NSUInteger idx, BOOL * _Nonnull stop) {
        CCNewsPreviewCoreDataModel *newsPreviewCoreDataModel = [self getNewsPreviewWithID:newsPreviewServerModel.newsID];
        if (!newsPreviewCoreDataModel) {
            CCNewsPreviewCoreDataModel *newsPreviewCoreDataModel = (CCNewsPreviewCoreDataModel *)[NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([CCNewsPreviewCoreDataModel class])
                                                                                                                               inManagedObjectContext:self.persistentContainer.viewContext];
            [newsPreviewCoreDataModel updateWithServerModel:newsPreviewServerModel];
            
        } else {
            [newsPreviewCoreDataModel updateWithServerModel:newsPreviewServerModel];
        }
    }];
    
    [self save];
}

- (NSArray <CCNewsPreviewCoreDataModel *> *)getNewsPreview {
    return [self getEntityWithName:NSStringFromClass([CCNewsPreviewCoreDataModel class]) predicate:nil];
}

- (CCNewsPreviewCoreDataModel *)getNewsPreviewWithID:(NSInteger)newsID {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"newsID == %d",newsID];
    NSArray *dataEntity = [self getEntityWithName:NSStringFromClass([CCNewsPreviewCoreDataModel class]) predicate:predicate];
    return dataEntity.count ? [dataEntity firstObject] : nil;
}


#pragma mark - FavoritePlayers

- (BOOL)playerIsFavorite:(NSInteger)playerID {
    NSArray *dataEntity = [self getEntityWithName:NSStringFromClass([CCUserFavoritesPlayersIDCoreDataModel class]) predicate:nil];
    if (dataEntity.count > 0) {
        CCUserFavoritesPlayersIDCoreDataModel *userFavoritesPlayerIDCoreDataModel = [dataEntity firstObject];
        NSArray *favoritePlayersID = [NSKeyedUnarchiver unarchiveObjectWithData:userFavoritesPlayerIDCoreDataModel.playersIDDataArray];
        return [favoritePlayersID containsObject:@(playerID)];
    } else {
        return NO;
    }
}

- (void)addPlayerToFavoritesWithPlayerID:(NSInteger)playerID {
    NSArray *dataEntity = [self getEntityWithName:NSStringFromClass([CCUserFavoritesPlayersIDCoreDataModel class]) predicate:nil];
    if (dataEntity.count == 0) {
        NSArray *array = @[@(playerID)];
        [self updateUserFavoritesPlayersWithArray:array];
    } else {
        CCUserFavoritesPlayersIDCoreDataModel *userFavoritesPlayerIDCoreDataModel = [dataEntity firstObject];
        NSMutableArray * playersIDArray = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:userFavoritesPlayerIDCoreDataModel.playersIDDataArray]];
        [playersIDArray addObject:@(playerID)];
        [self updateUserFavoritesPlayersWithArray:playersIDArray];
    }
}

- (void)removePlayerFromFavoritesWithID:(NSInteger)playerID {
    NSArray *dataEntity = [self getEntityWithName:NSStringFromClass([CCUserFavoritesPlayersIDCoreDataModel class]) predicate:nil];
    CCUserFavoritesPlayersIDCoreDataModel *userFavoritesPlayerIDCoreDataModel = [dataEntity firstObject];
    NSMutableArray *playersIDArray = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:userFavoritesPlayerIDCoreDataModel.playersIDDataArray]];
    [playersIDArray removeObject:@(playerID)];
    [self updateUserFavoritesPlayersWithArray:playersIDArray];
}

- (void)updateUserFavoritesPlayersWithArray:(NSArray *)newPlayersID {
    [self deleteAllObjectsFromEntity:NSStringFromClass([CCUserFavoritesPlayersIDCoreDataModel class])];
    CCUserFavoritesPlayersIDCoreDataModel *playerDescriptionCoreDataModel = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([CCUserFavoritesPlayersIDCoreDataModel class])
                                                                                                          inManagedObjectContext:self.persistentContainer.viewContext];
    NSData *dataArray = [NSKeyedArchiver archivedDataWithRootObject:newPlayersID];
    playerDescriptionCoreDataModel.playersIDDataArray = dataArray;
    [self save];
}

- (NSArray *)getUserFavoritePlayersID {
    NSArray *dataEntity = [self getEntityWithName:NSStringFromClass([CCUserFavoritesPlayersIDCoreDataModel class]) predicate:nil];
    if (dataEntity.count > 0) {
        CCUserFavoritesPlayersIDCoreDataModel *userFavoritesPlayerIDCoreDataModel = [dataEntity firstObject];
        NSArray *userFavoritePlayersID = [NSKeyedUnarchiver unarchiveObjectWithData:userFavoritesPlayerIDCoreDataModel.playersIDDataArray];
        return userFavoritePlayersID;
    } else {
        return @[];
    }
}

- (NSArray <CCPlayerPreviewCoreDataModel *> *)getFavoritePlayersPreviewWithIDs:(NSArray *)playersID {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(playerID IN %@) AND (imageSize != nil)",playersID];
    return [self getEntityWithName:NSStringFromClass([CCPlayerPreviewCoreDataModel class]) predicate:predicate];
}


#pragma mark - PlayerDescription

- (void)updatePlayerDescription:(CCPlayerDescriptionServerModel *)playerDescriptionServerModel {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"playerID == %d",playerDescriptionServerModel.playerID];
    NSArray *entityData = [self getEntityWithName:NSStringFromClass([CCPlayerDescriptionCoreDataModel class]) predicate:predicate];
    CCPlayerPreviewCoreDataModel *playerPreviewCoreDataModel = [self getPlayerPreviewWithID:playerDescriptionServerModel.playerID];
    if (entityData.count > 0) {
        CCPlayerDescriptionCoreDataModel *playerDescriptionCoreDataModel = [entityData firstObject];
        [playerDescriptionCoreDataModel updateWithServerModel:playerDescriptionServerModel andPreviewCoreDataModel:playerPreviewCoreDataModel];
    } else {
        CCPlayerDescriptionCoreDataModel * playerDescriptionCoreDataModel = (CCPlayerDescriptionCoreDataModel *)[NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([CCPlayerDescriptionCoreDataModel class])
                                                                                                                                              inManagedObjectContext:self.persistentContainer.viewContext];
        [playerDescriptionCoreDataModel updateWithServerModel:playerDescriptionServerModel andPreviewCoreDataModel:playerPreviewCoreDataModel];
    }
    [self save];
}

- (CCPlayerDescriptionCoreDataModel *)getPlayerDescriptionWithPlayerID:(NSInteger)playerID {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"playerID == %d",playerID];
    NSArray * dataEntity = [self getEntityWithName:NSStringFromClass([CCPlayerDescriptionCoreDataModel class]) predicate:predicate];
    if (dataEntity.count > 0) {
        CCPlayerDescriptionCoreDataModel *playerDescriptionCoreDataModel = [dataEntity firstObject];
        return playerDescriptionCoreDataModel;
    } else {
        return nil;
    }
}


#pragma mark - PlayersPreview

- (NSArray <CCPlayerPreviewCoreDataModel *> *)getPlayersPreviewWithContainsID:(NSArray *)arrayOfID {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(playerID IN %@) AND (imageSize != nil)",arrayOfID];
    return [self getEntityWithName:NSStringFromClass([CCPlayerPreviewCoreDataModel class]) predicate:predicate];
}

- (void)updatePlayersPreview:(NSArray <CCPlayerPreviewServerModel *> *)playersPreview {
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:NSStringFromClass([CCPlayerPreviewCoreDataModel class])
                                                         inManagedObjectContext:self.persistentContainer.viewContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    [playersPreview enumerateObjectsUsingBlock:^(CCPlayerPreviewServerModel * _Nonnull playerPreviewServerModel, NSUInteger idx, BOOL * _Nonnull stop) {
        CCPlayerPreviewCoreDataModel *playerPreviewCoreDataModel = [self getPlayerPreviewWithID:playerPreviewServerModel.playerID];
        CCPlayerDescriptionCoreDataModel *playerDescriptionCoreDataModel = [self getPlayerDescriptionWithPlayerID:playerPreviewServerModel.playerID];
        if (!playerPreviewCoreDataModel) {
            CCPlayerPreviewCoreDataModel *playerPreviewCoreDataModel = (CCPlayerPreviewCoreDataModel *)[NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([CCPlayerPreviewCoreDataModel class])
                                                                                                                                     inManagedObjectContext:self.persistentContainer.viewContext];
            [playerPreviewCoreDataModel updateWithServerModel:playerPreviewServerModel andPlayerDescriptionCoreDataModel:playerDescriptionCoreDataModel];
        } else {
            [playerPreviewCoreDataModel updateWithServerModel:playerPreviewServerModel andPlayerDescriptionCoreDataModel:playerDescriptionCoreDataModel];
        }

    }];
    
    [self save];
}

- (NSArray <CCPlayerPreviewCoreDataModel *> *)getPlayersPreview {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"imageSize != nil"]; // Players from team have imageSize nil
    return [self getEntityWithName:NSStringFromClass([CCPlayerPreviewCoreDataModel class]) predicate:predicate];
}

- (CCPlayerPreviewCoreDataModel *)getPlayerPreviewWithID:(NSInteger)playerID {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(playerID == %d) AND (imageSize != nil)", playerID];
    NSArray *entityData = [self getEntityWithName:NSStringFromClass([CCPlayerPreviewCoreDataModel class]) predicate:predicate];
    if (entityData.count > 0) {
        CCPlayerPreviewCoreDataModel * playerPreviewCoreDataModel = [entityData firstObject];
        return playerPreviewCoreDataModel;
    } else {
        return nil;
    }
}


#pragma mark - Banners

- (void)updateBanners:(NSArray <CCBannerServerModel *> *)banners {
    [self deleteAllObjectsFromEntity:NSStringFromClass([CCBannerCoreDataModel class])];
    
    [banners enumerateObjectsUsingBlock:^(CCBannerServerModel * _Nonnull bannerServerModel, NSUInteger idx, BOOL * _Nonnull stop) {
        CCBannerCoreDataModel *bannerCoreDataModel = (CCBannerCoreDataModel *)[NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([CCBannerCoreDataModel class])
                                                                                                            inManagedObjectContext:self.persistentContainer.viewContext];
        [bannerCoreDataModel updateWithServerModel:bannerServerModel];
    }];
    
    [self save];
}

- (NSArray <CCBannerCoreDataModel *> *)getBanners {
    return [self getEntityWithName:NSStringFromClass([CCBannerCoreDataModel class]) predicate:nil];
}


#pragma mark - Teams

- (void)updateTeams:(NSArray <CCTeamServerModel *> *)teams {
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:NSStringFromClass([CCTeamCoreDataModel class])
                                                         inManagedObjectContext:self.persistentContainer.viewContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    __block NSPredicate *predicate = nil;
    __block NSError *error = nil;
    __block NSArray *matchingData = nil;
    
    [teams enumerateObjectsUsingBlock:^(CCTeamServerModel * _Nonnull teamServerModel, NSUInteger idx, BOOL * _Nonnull stop) {
        predicate = [NSPredicate predicateWithFormat:@"teamID == %d",teamServerModel.teamID];
        [request setPredicate:predicate];
        matchingData = [self.persistentContainer.viewContext executeFetchRequest:request error:&error];
        if (error) {
            CCLog(@"CoreDataManager request get object with player ID: %@, error: %@",teamServerModel.teamID, error);
        } else {
            if (matchingData.count > 0) {
                CCTeamCoreDataModel *teamCoreDataModel = [matchingData firstObject];
                [teamCoreDataModel updateWithServerModel:teamServerModel];
                [self updatePlayersInTeamCoreDataModel:teamCoreDataModel players:teamServerModel.players];
            } else {
                
                CCTeamCoreDataModel * teamCoreDataModel = (CCTeamCoreDataModel *)[NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([CCTeamCoreDataModel class])
                                                                                                               inManagedObjectContext:self.persistentContainer.viewContext];
                [teamCoreDataModel updateWithServerModel:teamServerModel];
                [self updatePlayersInTeamCoreDataModel:teamCoreDataModel players:teamServerModel.players];
            }
        }
    }];
    
    [self save];
}

- (NSArray <CCTeamCoreDataModel *> *)getTeams {
    return [self getEntityWithName:NSStringFromClass([CCTeamCoreDataModel class]) predicate:nil];
}

- (void)updatePlayersInTeamCoreDataModel:(CCTeamCoreDataModel *)team players:(NSArray <CCPlayerPreviewServerModel *> *)players {
    
    [team.playerRelationship enumerateObjectsUsingBlock:^(CCPlayerPreviewCoreDataModel * _Nonnull oldPlayer, BOOL * _Nonnull stop) {
        [self.persistentContainer.viewContext deleteObject:oldPlayer];
    }];

    [players enumerateObjectsUsingBlock:^(CCPlayerPreviewServerModel * _Nonnull playerPreviewServerModel, NSUInteger idx, BOOL * _Nonnull stop) {
        CCPlayerPreviewCoreDataModel *playerPreviewCoreDataModel = (CCPlayerPreviewCoreDataModel *)[NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([CCPlayerPreviewCoreDataModel class])
                                                                                                                                 inManagedObjectContext:self.persistentContainer.viewContext];
        [playerPreviewCoreDataModel updateWithServerModel:playerPreviewServerModel];
        playerPreviewCoreDataModel.teamRelationshep = team;
    }];
}

#pragma mark - Events

- (void)updateEvents:(NSArray <CCEventServerModel *> *)events {
    [self deleteAllObjectsFromEntity:NSStringFromClass([CCEventCoreDataModel class])];
    
    [events enumerateObjectsUsingBlock:^(CCEventServerModel * _Nonnull eventServerModel, NSUInteger idx, BOOL * _Nonnull stop) {
        CCEventCoreDataModel * eventCoreDataModel = (CCEventCoreDataModel *)[NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([CCEventCoreDataModel class])
                                                                                                          inManagedObjectContext:self.persistentContainer.viewContext];
        [eventCoreDataModel updateWithServerModel:eventServerModel];
    }];
    
    [self save];
}

- (NSArray <CCEventCoreDataModel *> *)getEvents {
    return [self getEntityWithName:NSStringFromClass([CCEventCoreDataModel class]) predicate:nil];
}

#pragma mark -Private

- (void)save {
    NSError *error = nil;
    [self.persistentContainer.viewContext save:&error];
    if (error)
        CCLog(@"CoreDataManager request save error: %@", error);
}

- (NSArray *)getEntityWithName:(NSString *)entityName predicate:(NSPredicate *)predicate {
    
    if (self.persistentContainer) {
        
        
        
    }
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:entityName
                                                         inManagedObjectContext:self.persistentContainer.viewContext];
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    if (predicate)
        [request setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *matchingData = [self.persistentContainer.viewContext executeFetchRequest:request error:&error];
    
    if (error)
        CCLog(@"CoreDataManager request getEntityWithName error: %@",error);
    
    return matchingData;
}

- (void)deleteAllObjectsFromEntity:(NSString *)entytiName {
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:entytiName
                                                         inManagedObjectContext:self.persistentContainer.viewContext];
    NSFetchRequest *request = [NSFetchRequest new];
    [request setEntity:entityDescription];
    
    NSError *error = nil;
    NSArray *matchingData = [self.persistentContainer.viewContext executeFetchRequest:request error:&error];
    
    if (matchingData.count > 0) {
        [matchingData enumerateObjectsUsingBlock:^(NSManagedObject * _Nonnull managedObject, NSUInteger idx, BOOL * _Nonnull stop) {
             [self.persistentContainer.viewContext deleteObject:managedObject];
        }];
        [self.persistentContainer.viewContext save:&error];
        if (error)
            CCLog(@"CoreDataManager request deleteAllObjectsFromEntity error: %@",error);
    }
}
                                            
@end
