//
//  CCBannerCoreDataModel+CoreDataProperties.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import "CCBannerCoreDataModel+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CCBannerCoreDataModel (CoreDataProperties)

+ (NSFetchRequest<CCBannerCoreDataModel *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *updateDate;
@property (nullable, nonatomic, copy) NSString *imageSize;
@property (nullable, nonatomic, copy) NSString *imageURL;
@property (nullable, nonatomic, copy) NSNumber *playerID;

@end

NS_ASSUME_NONNULL_END
