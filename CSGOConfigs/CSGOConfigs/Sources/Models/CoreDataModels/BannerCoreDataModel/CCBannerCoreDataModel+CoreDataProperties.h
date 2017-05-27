//
//  CCBannerCoreDataModel+CoreDataProperties.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 27.05.17.
//
//

#import "CCBannerCoreDataModel+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CCBannerCoreDataModel (CoreDataProperties)

+ (NSFetchRequest<CCBannerCoreDataModel *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *imageSize;
@property (nullable, nonatomic, copy) NSString *imageURL;
@property (nonatomic) int64_t playerID;
@property (nullable, nonatomic, copy) NSDate *updateData;

@end

NS_ASSUME_NONNULL_END
