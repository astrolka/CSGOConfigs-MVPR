//
//  CCBannerCoreDataModel+CoreDataClass.h
//  
//
//  Created by Petrychuk Oleg on 27.05.17.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@class CCBannerServerModel;

NS_ASSUME_NONNULL_BEGIN

@interface CCBannerCoreDataModel : NSManagedObject

- (void)updateWithServerModel:(CCBannerServerModel *)serverModel;

@end

NS_ASSUME_NONNULL_END

#import "CCBannerCoreDataModel+CoreDataProperties.h"
