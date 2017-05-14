//
//  CCNewsDescriptionCoreDataModel+CoreDataClass.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@class CCNewDescriptionContentCoreDataModel;
@class CCNewsDescriptionServerModel;

NS_ASSUME_NONNULL_BEGIN

@interface CCNewsDescriptionCoreDataModel : NSManagedObject

- (void)updateWithServerModel:(CCNewsDescriptionServerModel *)newsDescriptionServerModel;

@end

NS_ASSUME_NONNULL_END

#import "CCNewsDescriptionCoreDataModel+CoreDataProperties.h"
