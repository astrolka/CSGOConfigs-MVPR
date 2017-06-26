//
//  CCPlayerDescriptionCoreDataModel+CoreDataClass.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 27.05.17.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/NSManagedObject.h>
@class CCPlayerDescriptionServerModel;
@class CCPlayerPreviewCoreDataModel;

NS_ASSUME_NONNULL_BEGIN

@interface CCPlayerDescriptionCoreDataModel : NSManagedObject

- (void)updateWithServerModel:(CCPlayerDescriptionServerModel *)serverModel andPreviewCoreDataModel:(CCPlayerPreviewCoreDataModel *)playerPreviewCoreDataModel;

@end

NS_ASSUME_NONNULL_END

#import "CCPlayerDescriptionCoreDataModel+CoreDataProperties.h"
