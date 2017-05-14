//
//  CCPlayerDescriptionCoreDataModel+CoreDataProperties.m
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import "CCPlayerDescriptionCoreDataModel+CoreDataProperties.h"

@implementation CCPlayerDescriptionCoreDataModel (CoreDataProperties)

+ (NSFetchRequest<CCPlayerDescriptionCoreDataModel *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CCPlayerDescriptionCoreDataModel"];
}

@dynamic country;
@dynamic downloadURL;
@dynamic effectiveDPI;
@dynamic flagImageURL;
@dynamic gameResolution;
@dynamic headSet;
@dynamic keyboard;
@dynamic monitor;
@dynamic moreInfoURL;
@dynamic mouse;
@dynamic mousepad;
@dynamic name;
@dynamic playerID;
@dynamic pollingRate;
@dynamic surname;
@dynamic teamImageURL;
@dynamic teamName;
@dynamic windowsSensitivity;
@dynamic previewRelationship;

@end