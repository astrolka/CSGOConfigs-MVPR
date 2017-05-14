//
//  CCPlayerDescriptionCoreDataModel+CoreDataClass.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CCPlayerDescriptionServerModel.h"
#import "CCPlayerPreviewCoreDataModel+CoreDataProperties.h"

@class CCPlayerPreviewCoreDataModel;

NS_ASSUME_NONNULL_BEGIN

@interface CCPlayerDescriptionCoreDataModel : NSManagedObject

- (void)updateWithServerModel:(CCPlayerDescriptionServerModel *)playerPreviewServerModel andPreviewCoreDataModel:(CCPlayerPreviewCoreDataModel *)playerPreviewCoreDataModel;

@end

NS_ASSUME_NONNULL_END

#import "CCPlayerDescriptionCoreDataModel+CoreDataProperties.h"
