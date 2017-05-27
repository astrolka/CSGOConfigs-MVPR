//
//  CCBannerCoreDataModel+CoreDataProperties.m
//  
//
//  Created by Петрічук Олег Аркадійовіч on 27.05.17.
//
//

#import "CCBannerCoreDataModel+CoreDataProperties.h"

@implementation CCBannerCoreDataModel (CoreDataProperties)

+ (NSFetchRequest<CCBannerCoreDataModel *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CCBannerCoreDataModel"];
}

@dynamic imageSize;
@dynamic imageURL;
@dynamic playerID;
@dynamic updateData;

@end
