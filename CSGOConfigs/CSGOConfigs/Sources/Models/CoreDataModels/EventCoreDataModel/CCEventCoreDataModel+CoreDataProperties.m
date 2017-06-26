//
//  CCEventCoreDataModel+CoreDataProperties.m
//  
//
//  Created by Petrychuk Oleg on 27.05.17.
//
//

#import "CCEventCoreDataModel+CoreDataProperties.h"

@implementation CCEventCoreDataModel (CoreDataProperties)

+ (NSFetchRequest<CCEventCoreDataModel *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CCEventCoreDataModel"];
}

@dynamic beginDate;
@dynamic city;
@dynamic countOfTeams;
@dynamic descriptionURL;
@dynamic finishDate;
@dynamic flagImageURL;
@dynamic lat;
@dynamic lng;
@dynamic logoImageURL;
@dynamic name;
@dynamic prizePool;

@end
