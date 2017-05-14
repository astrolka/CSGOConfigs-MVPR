//
//  CCNewsDescriptionCoreDataModel+CoreDataProperties.m
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import "CCNewsDescriptionCoreDataModel+CoreDataProperties.h"

@implementation CCNewsDescriptionCoreDataModel (CoreDataProperties)

+ (NSFetchRequest<CCNewsDescriptionCoreDataModel *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CCNewsDescriptionCoreDataModel"];
}

@dynamic author;
@dynamic date;
@dynamic moreInfoURL;
@dynamic newsID;
@dynamic subtitle;
@dynamic contentNewsRelationship;

@end
