//
//  CCPlayerDescriptionCoreDataModel+CoreDataProperties.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import "CCPlayerDescriptionCoreDataModel+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CCPlayerDescriptionCoreDataModel (CoreDataProperties)

+ (NSFetchRequest<CCPlayerDescriptionCoreDataModel *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *country;
@property (nullable, nonatomic, copy) NSString *downloadURL;
@property (nullable, nonatomic, copy) NSString *effectiveDPI;
@property (nullable, nonatomic, copy) NSString *flagImageURL;
@property (nullable, nonatomic, copy) NSString *gameResolution;
@property (nullable, nonatomic, copy) NSString *headSet;
@property (nullable, nonatomic, copy) NSString *keyboard;
@property (nullable, nonatomic, copy) NSString *monitor;
@property (nullable, nonatomic, copy) NSString *moreInfoURL;
@property (nullable, nonatomic, copy) NSString *mouse;
@property (nullable, nonatomic, copy) NSString *mousepad;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSNumber *playerID;
@property (nullable, nonatomic, copy) NSString *pollingRate;
@property (nullable, nonatomic, copy) NSString *surname;
@property (nullable, nonatomic, copy) NSString *teamImageURL;
@property (nullable, nonatomic, copy) NSString *teamName;
@property (nullable, nonatomic, copy) NSString *windowsSensitivity;
@property (nullable, nonatomic, retain) CCPlayerPreviewCoreDataModel *previewRelationship;

@end

NS_ASSUME_NONNULL_END
