//
//  CCNewDescriptionContentCoreDataModel+CoreDataProperties.m
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import "CCNewDescriptionContentCoreDataModel+CoreDataProperties.h"

@implementation CCNewDescriptionContentCoreDataModel (CoreDataProperties)

+ (NSFetchRequest<CCNewDescriptionContentCoreDataModel *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CCNewDescriptionContentCoreDataModel"];
}

@dynamic coverImageURL;
@dynamic isImage;
@dynamic text;
@dynamic descriptionNewsRelationship;

@end
