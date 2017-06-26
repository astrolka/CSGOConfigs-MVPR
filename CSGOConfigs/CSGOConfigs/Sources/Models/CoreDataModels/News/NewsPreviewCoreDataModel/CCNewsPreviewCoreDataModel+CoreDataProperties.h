//
//  CCNewsPreviewCoreDataModel+CoreDataProperties.h
//  
//
//  Created by Petrychuk Oleg on 27.05.17.
//
//

#import "CCNewsPreviewCoreDataModel+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface CCNewsPreviewCoreDataModel (CoreDataProperties)

+ (NSFetchRequest<CCNewsPreviewCoreDataModel *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *imageURL;
@property (nonatomic) int64_t newsID;
@property (nullable, nonatomic, copy) NSString *title;

@end

NS_ASSUME_NONNULL_END
