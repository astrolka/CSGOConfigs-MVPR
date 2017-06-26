//
//  CCEventCoreDataModel+CoreDataProperties.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 27.05.17.
//
//

#import "CCEventCoreDataModel+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface CCEventCoreDataModel (CoreDataProperties)

+ (NSFetchRequest<CCEventCoreDataModel *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *beginDate;
@property (nullable, nonatomic, copy) NSString *city;
@property (nonatomic) int64_t countOfTeams;
@property (nullable, nonatomic, copy) NSString *descriptionURL;
@property (nullable, nonatomic, copy) NSDate *finishDate;
@property (nullable, nonatomic, copy) NSString *flagImageURL;
@property (nonatomic) int64_t lat;
@property (nonatomic) int64_t lng;
@property (nullable, nonatomic, copy) NSString *logoImageURL;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *prizePool;

@end

NS_ASSUME_NONNULL_END
