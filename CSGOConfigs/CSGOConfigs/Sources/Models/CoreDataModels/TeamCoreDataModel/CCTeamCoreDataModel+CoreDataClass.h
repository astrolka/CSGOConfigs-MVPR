//
//  CCTeamCoreDataModel+CoreDataClass.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@class CCTeamServerModel;

@class CCPlayerPreviewCoreDataModel;

NS_ASSUME_NONNULL_BEGIN

@interface CCTeamCoreDataModel : NSManagedObject

- (void)updateWithServerModel:(CCTeamServerModel *)teamServerModel;

@end

NS_ASSUME_NONNULL_END

#import "CCTeamCoreDataModel+CoreDataProperties.h"
