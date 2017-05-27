//
//  CCNewsPreviewCoreDataModel+CoreDataClass.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 27.05.17.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@class CCNewsPreviewServerModel;

NS_ASSUME_NONNULL_BEGIN

@interface CCNewsPreviewCoreDataModel : NSManagedObject

- (void)updateWithServerModel:(CCNewsPreviewServerModel *)serverModel;

@end

NS_ASSUME_NONNULL_END

#import "CCNewsPreviewCoreDataModel+CoreDataProperties.h"
