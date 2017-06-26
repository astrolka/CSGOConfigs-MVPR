//
//  CCPlayerPreviewCoreDataModel+CoreDataClass.h
//  
//
//  Created by Petrychuk Oleg on 27.05.17.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/NSManagedObject.h>
#import "CCPlayerPreviewServerModel.h"

@class CCPlayerDescriptionCoreDataModel, CCTeamCoreDataModel;

NS_ASSUME_NONNULL_BEGIN

@interface CCPlayerPreviewCoreDataModel : NSManagedObject

- (void)updateWithServerModel:(CCPlayerPreviewServerModel *)serverModel andPlayerDescriptionCoreDataModel:(CCPlayerDescriptionCoreDataModel *)playerDescriptionCoreDataModel;

- (void)updateWithServerModel:(CCPlayerPreviewServerModel *)serverModel;

@end

NS_ASSUME_NONNULL_END

#import "CCPlayerPreviewCoreDataModel+CoreDataProperties.h"
