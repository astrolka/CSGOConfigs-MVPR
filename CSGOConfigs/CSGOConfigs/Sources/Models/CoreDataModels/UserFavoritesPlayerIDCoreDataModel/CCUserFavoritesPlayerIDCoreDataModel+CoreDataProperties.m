//
//  CCUserFavoritesPlayerIDCoreDataModel+CoreDataProperties.m
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import "CCUserFavoritesPlayerIDCoreDataModel+CoreDataProperties.h"

@implementation CCUserFavoritesPlayerIDCoreDataModel (CoreDataProperties)

+ (NSFetchRequest<CCUserFavoritesPlayerIDCoreDataModel *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CCUserFavoritesPlayerIDCoreDataModel"];
}

@dynamic playersIDDataArray;

@end
