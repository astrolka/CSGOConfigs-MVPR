//
//  CCNewsPreviewCoreDataModel+CoreDataClass.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@class CCNewsPreviewServerModel;

NS_ASSUME_NONNULL_BEGIN

@interface CCNewsPreviewCoreDataModel : NSManagedObject

- (void)updateWithServerModel:(CCNewsPreviewServerModel *)newsPreviewServerModel;

@end

NS_ASSUME_NONNULL_END

#import "CCNewsPreviewCoreDataModel+CoreDataProperties.h"
