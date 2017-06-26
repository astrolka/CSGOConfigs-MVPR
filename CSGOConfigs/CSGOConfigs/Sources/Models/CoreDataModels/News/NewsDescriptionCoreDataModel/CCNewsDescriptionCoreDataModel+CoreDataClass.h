//
//  CCNewsDescriptionCoreDataModel+CoreDataClass.h
//  
//
//  Created by Petrychuk Oleg on 27.05.17.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/NSManagedObject.h>
@class CCNewsDescriptionServerModel;
@class CCNewDescriptionContentCoreDataModel;

NS_ASSUME_NONNULL_BEGIN

@interface CCNewsDescriptionCoreDataModel : NSManagedObject

- (void)updateWithServerModel:(CCNewsDescriptionServerModel *)serverModel;

@end

NS_ASSUME_NONNULL_END

#import "CCNewsDescriptionCoreDataModel+CoreDataProperties.h"
