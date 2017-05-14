//
//  CCEventCoreDataModel+CoreDataProperties.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import "CCEventCoreDataModel+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CCEventCoreDataModel (CoreDataProperties)

+ (NSFetchRequest<CCEventCoreDataModel *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *beginDate;
@property (nullable, nonatomic, copy) NSString *city;
@property (nullable, nonatomic, copy) NSNumber *countOfTeams;
@property (nullable, nonatomic, copy) NSDate *finishDate;
@property (nullable, nonatomic, copy) NSString *flagImageURL;
@property (nullable, nonatomic, copy) NSNumber *lat;
@property (nullable, nonatomic, copy) NSString *desctiptionURL;
@property (nullable, nonatomic, copy) NSNumber *lng;
@property (nullable, nonatomic, copy) NSString *logoImageURL;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *prizePool;

@end

NS_ASSUME_NONNULL_END
