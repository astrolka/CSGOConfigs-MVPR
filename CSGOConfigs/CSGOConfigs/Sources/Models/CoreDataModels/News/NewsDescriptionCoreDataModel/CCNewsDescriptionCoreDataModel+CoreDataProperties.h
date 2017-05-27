//
//  CCNewsDescriptionCoreDataModel+CoreDataProperties.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 27.05.17.
//
//

#import "CCNewsDescriptionCoreDataModel+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CCNewsDescriptionCoreDataModel (CoreDataProperties)

@property (nullable, nonatomic, copy) NSString *author;
@property (nullable, nonatomic, copy) NSDate *date;
@property (nullable, nonatomic, copy) NSString *descriptionURL;
@property (nonatomic) int64_t newsID;
@property (nullable, nonatomic, copy) NSString *subtitle;
@property (nullable, nonatomic, retain) NSSet<CCNewDescriptionContentCoreDataModel *> *contentNewsRelationship;

@end

@interface CCNewsDescriptionCoreDataModel (CoreDataGeneratedAccessors)

- (void)addContentNewsRelationshipObject:(CCNewDescriptionContentCoreDataModel *)value;
- (void)removeContentNewsRelationshipObject:(CCNewDescriptionContentCoreDataModel *)value;
- (void)addContentNewsRelationship:(NSSet<CCNewDescriptionContentCoreDataModel *> *)values;
- (void)removeContentNewsRelationship:(NSSet<CCNewDescriptionContentCoreDataModel *> *)values;

@end

NS_ASSUME_NONNULL_END
