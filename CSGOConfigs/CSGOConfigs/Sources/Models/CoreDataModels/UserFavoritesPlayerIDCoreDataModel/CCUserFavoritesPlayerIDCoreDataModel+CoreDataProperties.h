//
//  CCUserFavoritesPlayerIDCoreDataModel+CoreDataProperties.h
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import "CCUserFavoritesPlayerIDCoreDataModel+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CCUserFavoritesPlayerIDCoreDataModel (CoreDataProperties)

+ (NSFetchRequest<CCUserFavoritesPlayerIDCoreDataModel *> *)fetchRequest;

@property (nullable, nonatomic, retain) NSData *playersIDDataArray;

@end

NS_ASSUME_NONNULL_END
