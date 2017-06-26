//
//  CCEventCoreDataModel+CoreDataClass.h
//  
//
//  Created by Petrychuk Oleg on 27.05.17.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@class CCEventServerModel;

NS_ASSUME_NONNULL_BEGIN

@interface CCEventCoreDataModel : NSManagedObject

- (void)updateWithServerModel:(CCEventServerModel *)serverModel;

@end

NS_ASSUME_NONNULL_END

#import "CCEventCoreDataModel+CoreDataProperties.h"
