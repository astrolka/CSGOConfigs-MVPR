//
//  CCTeamCoreDataModel+CoreDataProperties.m
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import "CCTeamCoreDataModel+CoreDataProperties.h"

@implementation CCTeamCoreDataModel (CoreDataProperties)

+ (NSFetchRequest<CCTeamCoreDataModel *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CCTeamCoreDataModel"];
}

@dynamic imageURL;
@dynamic name;
@dynamic teamID;
@dynamic playerRelationship;

@end
