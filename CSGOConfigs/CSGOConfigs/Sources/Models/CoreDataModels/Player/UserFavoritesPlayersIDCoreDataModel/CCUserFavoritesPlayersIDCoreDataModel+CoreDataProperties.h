//
//  CCUserFavoritesPlayersIDCoreDataModel+CoreDataProperties.h
//  
//
//  Created by Petrychuk Oleg on 27.05.17.
//
//

#import "CCUserFavoritesPlayersIDCoreDataModel+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface CCUserFavoritesPlayersIDCoreDataModel (CoreDataProperties)

+ (NSFetchRequest<CCUserFavoritesPlayersIDCoreDataModel *> *)fetchRequest;

@property (nullable, nonatomic, retain) NSData *playersIDDataArray;

@end

NS_ASSUME_NONNULL_END
