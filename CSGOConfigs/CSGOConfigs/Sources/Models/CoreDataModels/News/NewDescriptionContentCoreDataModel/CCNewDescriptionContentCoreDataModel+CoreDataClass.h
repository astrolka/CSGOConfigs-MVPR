//
//  CCNewDescriptionContentCoreDataModel+CoreDataClass.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@class CCNewsDescriptionContentServerModel;

@class CCNewsDescriptionCoreDataModel;

NS_ASSUME_NONNULL_BEGIN

@interface CCNewDescriptionContentCoreDataModel : NSManagedObject

- (void)updateWithServerModel:(CCNewsDescriptionContentServerModel *)newsDescriptionContentServerModel;

@end

NS_ASSUME_NONNULL_END

#import "CCNewDescriptionContentCoreDataModel+CoreDataProperties.h"
