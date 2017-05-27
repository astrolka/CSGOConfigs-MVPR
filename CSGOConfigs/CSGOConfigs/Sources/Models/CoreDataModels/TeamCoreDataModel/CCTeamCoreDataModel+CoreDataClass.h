//
//  CCTeamCoreDataModel+CoreDataClass.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 27.05.17.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/NSManagedObject.h>
@class CCTeamServerModel;

NS_ASSUME_NONNULL_BEGIN

@interface CCTeamCoreDataModel : NSManagedObject

- (void)updateWithServerModel:(CCTeamServerModel *)serverModel;

@end

NS_ASSUME_NONNULL_END

#import "CCTeamCoreDataModel+CoreDataProperties.h"
