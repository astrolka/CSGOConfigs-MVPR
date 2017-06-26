//
//  CCUserFavoritesPlayersIDCoreDataModel+CoreDataProperties.m
//  
//
//  Created by Petrychuk Oleg on 27.05.17.
//
//

#import "CCUserFavoritesPlayersIDCoreDataModel+CoreDataProperties.h"

@implementation CCUserFavoritesPlayersIDCoreDataModel (CoreDataProperties)

+ (NSFetchRequest<CCUserFavoritesPlayersIDCoreDataModel *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CCUserFavoritesPlayersIDCoreDataModel"];
}

@dynamic playersIDDataArray;

@end
