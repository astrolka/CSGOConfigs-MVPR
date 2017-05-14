//
//  CCNewDescriptionContentCoreDataModel+CoreDataProperties.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import "CCNewDescriptionContentCoreDataModel+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CCNewDescriptionContentCoreDataModel (CoreDataProperties)

+ (NSFetchRequest<CCNewDescriptionContentCoreDataModel *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *coverImageURL;
@property (nullable, nonatomic, copy) NSNumber *isImage;
@property (nullable, nonatomic, copy) NSString *text;
@property (nullable, nonatomic, retain) CCNewsDescriptionCoreDataModel *descriptionNewsRelationship;

@end

NS_ASSUME_NONNULL_END
