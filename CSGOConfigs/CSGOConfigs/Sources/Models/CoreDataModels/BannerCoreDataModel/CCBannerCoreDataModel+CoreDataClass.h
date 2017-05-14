//
//  CCBannerCoreDataModel+CoreDataClass.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@class CCBannerServerModel;

NS_ASSUME_NONNULL_BEGIN

@interface CCBannerCoreDataModel : NSManagedObject

- (void)updateWithServerModel:(CCBannerServerModel *)playerPreviewServerModel;

@end

NS_ASSUME_NONNULL_END

#import "CCBannerCoreDataModel+CoreDataProperties.h"
