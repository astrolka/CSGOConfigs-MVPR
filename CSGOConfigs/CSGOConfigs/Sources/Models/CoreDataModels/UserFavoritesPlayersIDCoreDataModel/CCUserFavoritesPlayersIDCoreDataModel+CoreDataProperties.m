//
//  CCUserFavoritesPlayersIDCoreDataModel+CoreDataProperties.m
//  
//
//  Created by Петрічук Олег Аркадійовіч on 27.05.17.
//
//

#import "CCUserFavoritesPlayersIDCoreDataModel+CoreDataProperties.h"

@implementation CCUserFavoritesPlayersIDCoreDataModel (CoreDataProperties)

+ (NSFetchRequest<CCUserFavoritesPlayersIDCoreDataModel *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CCUserFavoritesPlayersIDCoreDataModel"];
}

@dynamic playersIDDataArray;

@end
