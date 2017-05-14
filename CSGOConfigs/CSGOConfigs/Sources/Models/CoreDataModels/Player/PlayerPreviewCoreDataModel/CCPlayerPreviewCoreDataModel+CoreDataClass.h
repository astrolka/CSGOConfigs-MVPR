//
//  CCPlayerPreviewCoreDataModel+CoreDataClass.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@class CCPlayerPreviewServerModel;

@class CCPlayerDescriptionCoreDataModel, CCTeamCoreDataModel;

NS_ASSUME_NONNULL_BEGIN

@interface CCPlayerPreviewCoreDataModel : NSManagedObject

- (void)updateWithServerModel:(CCPlayerPreviewServerModel *)playerPreviewServerModel andPlayerDescriptionCoreDataModel:(CCPlayerDescriptionCoreDataModel *)playerDescriptionCoreDataModel;

- (void)updateWithServerModel:(CCPlayerPreviewServerModel *)playerPreviewServerModel;

@end

NS_ASSUME_NONNULL_END

#import "CCPlayerPreviewCoreDataModel+CoreDataProperties.h"
