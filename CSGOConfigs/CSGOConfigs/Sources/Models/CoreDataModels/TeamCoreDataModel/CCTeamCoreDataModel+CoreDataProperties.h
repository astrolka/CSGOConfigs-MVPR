//
//  CCTeamCoreDataModel+CoreDataProperties.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 27.05.17.
//
//

#import "CCTeamCoreDataModel+CoreDataClass.h"
#import "CCPlayerPreviewCoreDataModel+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface CCTeamCoreDataModel (CoreDataProperties)

@property (nullable, nonatomic, copy) NSString *imageURL;
@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int64_t teamID;
@property (nullable, nonatomic, retain) NSSet<CCPlayerPreviewCoreDataModel *> *playerRelationship;

@end

@interface CCTeamCoreDataModel (CoreDataGeneratedAccessors)

//- (void)addPlayerRelationshipObject:(CCPlayerPreviewCoreDataModel *)value;
//- (void)removePlayerRelationshipObject:(CCPlayerPreviewCoreDataModel *)value;
//- (void)addPlayerRelationship:(NSSet<CCPlayerPreviewCoreDataModel *> *)values;
//- (void)removePlayerRelationship:(NSSet<CCPlayerPreviewCoreDataModel *> *)values;

@end

NS_ASSUME_NONNULL_END
