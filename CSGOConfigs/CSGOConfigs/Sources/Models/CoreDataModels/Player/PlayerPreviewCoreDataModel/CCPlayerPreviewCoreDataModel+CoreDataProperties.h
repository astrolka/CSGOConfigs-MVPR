//
//  CCPlayerPreviewCoreDataModel+CoreDataProperties.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import "CCPlayerPreviewCoreDataModel+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CCPlayerPreviewCoreDataModel (CoreDataProperties)

+ (NSFetchRequest<CCPlayerPreviewCoreDataModel *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *imageSize;
@property (nullable, nonatomic, copy) NSString *imageURL;
@property (nullable, nonatomic, copy) NSString *nickName;
@property (nullable, nonatomic, copy) NSNumber *playerID;
@property (nullable, nonatomic, retain) CCPlayerDescriptionCoreDataModel *descriptionRelationship;
@property (nullable, nonatomic, retain) CCTeamCoreDataModel *teamRelationshep;

@end

NS_ASSUME_NONNULL_END
