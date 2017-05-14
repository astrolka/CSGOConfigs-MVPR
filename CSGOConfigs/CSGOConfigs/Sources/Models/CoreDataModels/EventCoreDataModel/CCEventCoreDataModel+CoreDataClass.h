//
//  CCEventCoreDataModel+CoreDataClass.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@class CCEventServerModel;

NS_ASSUME_NONNULL_BEGIN

@interface CCEventCoreDataModel : NSManagedObject

- (void)updateWithServerModel:(CCEventServerModel *)eventServerModel;

@end

NS_ASSUME_NONNULL_END

#import "CCEventCoreDataModel+CoreDataProperties.h"
