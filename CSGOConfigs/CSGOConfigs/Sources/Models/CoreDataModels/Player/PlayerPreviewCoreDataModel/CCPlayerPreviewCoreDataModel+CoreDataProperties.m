//
//  CCPlayerPreviewCoreDataModel+CoreDataProperties.m
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import "CCPlayerPreviewCoreDataModel+CoreDataProperties.h"

@implementation CCPlayerPreviewCoreDataModel (CoreDataProperties)

+ (NSFetchRequest<CCPlayerPreviewCoreDataModel *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CCPlayerPreviewCoreDataModel"];
}

@dynamic imageSize;
@dynamic imageURL;
@dynamic nickName;
@dynamic playerID;
@dynamic descriptionRelationship;
@dynamic teamRelationshep;

@end
