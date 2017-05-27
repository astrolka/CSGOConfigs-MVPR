//
//  CCPlayerPreviewCoreDataModel+CoreDataProperties.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 27.05.17.
//
//

#import "CCPlayerPreviewCoreDataModel+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CCPlayerPreviewCoreDataModel (CoreDataProperties)

@property (nullable, nonatomic, copy) NSString *imageSize;
@property (nullable, nonatomic, copy) NSString *imageURL;
@property (nullable, nonatomic, copy) NSString *nickName;
@property (nonatomic) int64_t playerID;
@property (nullable, nonatomic, retain) CCPlayerDescriptionCoreDataModel *descriptionRelationship;
@property (nullable, nonatomic, retain) CCTeamCoreDataModel *teamRelationshep;

@end

NS_ASSUME_NONNULL_END
