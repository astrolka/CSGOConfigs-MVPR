//
//  CCNewsPreviewCoreDataModel+CoreDataProperties.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import "CCNewsPreviewCoreDataModel+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CCNewsPreviewCoreDataModel (CoreDataProperties)

+ (NSFetchRequest<CCNewsPreviewCoreDataModel *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *imageURL;
@property (nullable, nonatomic, copy) NSNumber *newsID;
@property (nullable, nonatomic, copy) NSString *title;

@end

NS_ASSUME_NONNULL_END
