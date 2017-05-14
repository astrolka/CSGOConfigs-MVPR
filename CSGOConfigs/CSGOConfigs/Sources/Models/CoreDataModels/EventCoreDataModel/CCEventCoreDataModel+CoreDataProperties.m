//
//  CCEventCoreDataModel+CoreDataProperties.m
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
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
@dynamic finishDate;
@dynamic flagImageURL;
@dynamic lat;
@dynamic desctiptionURL;
@dynamic lng;
@dynamic logoImageURL;
@dynamic name;
@dynamic prizePool;

@end
