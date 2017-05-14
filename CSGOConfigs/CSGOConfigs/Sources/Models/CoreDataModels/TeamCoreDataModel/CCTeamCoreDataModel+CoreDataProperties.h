//
//  CCTeamCoreDataModel+CoreDataProperties.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import "CCTeamCoreDataModel+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CCTeamCoreDataModel (CoreDataProperties)

+ (NSFetchRequest<CCTeamCoreDataModel *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *imageURL;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSNumber *teamID;
@property (nullable, nonatomic, retain) NSSet<CCPlayerPreviewCoreDataModel *> *playerRelationship;

@end

@interface CCTeamCoreDataModel (CoreDataGeneratedAccessors)

- (void)addPlayerRelationshipObject:(CCPlayerPreviewCoreDataModel *)value;
- (void)removePlayerRelationshipObject:(CCPlayerPreviewCoreDataModel *)value;
- (void)addPlayerRelationship:(NSSet<CCPlayerPreviewCoreDataModel *> *)values;
- (void)removePlayerRelationship:(NSSet<CCPlayerPreviewCoreDataModel *> *)values;

@end

NS_ASSUME_NONNULL_END
