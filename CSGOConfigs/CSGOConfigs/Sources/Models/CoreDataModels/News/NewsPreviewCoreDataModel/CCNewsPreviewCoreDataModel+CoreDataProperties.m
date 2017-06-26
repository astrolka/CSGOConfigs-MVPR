//
//  CCNewsPreviewCoreDataModel+CoreDataProperties.m
//  
//
//  Created by Petrychuk Oleg on 27.05.17.
//
//

#import "CCNewsPreviewCoreDataModel+CoreDataProperties.h"

@implementation CCNewsPreviewCoreDataModel (CoreDataProperties)

+ (NSFetchRequest<CCNewsPreviewCoreDataModel *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CCNewsPreviewCoreDataModel"];
}

@dynamic imageURL;
@dynamic newsID;
@dynamic title;

@end
