//
//  CCNewDescriptionContentCoreDataModel+CoreDataProperties.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 27.05.17.
//
//

#import "CCNewDescriptionContentCoreDataModel+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CCNewDescriptionContentCoreDataModel (CoreDataProperties)

@property (nullable, nonatomic, copy) NSString *coverImageURL;
@property (nonatomic) int64_t isImage;
@property (nullable, nonatomic, copy) NSString *text;
@property (nullable, nonatomic, retain) CCNewsDescriptionCoreDataModel *descriptionNewsRelationship;

@end

NS_ASSUME_NONNULL_END
