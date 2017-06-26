//
//  CCNewDescriptionContentCoreDataModel+CoreDataClass.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 27.05.17.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/NSManagedObject.h>
@class CCNewsDescriptionContentServerModel;
@class CCNewsDescriptionCoreDataModel;

NS_ASSUME_NONNULL_BEGIN

@interface CCNewDescriptionContentCoreDataModel : NSManagedObject

- (void)updateWithServerModel:(CCNewsDescriptionContentServerModel *)serverModel;

@end

NS_ASSUME_NONNULL_END

#import "CCNewDescriptionContentCoreDataModel+CoreDataProperties.h"
