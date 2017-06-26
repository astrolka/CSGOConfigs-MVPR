//
//  CCBannerCoreDataModel+CoreDataClass.m
//  
//
//  Created by Petrychuk Oleg on 27.05.17.
//
//

#import "CCBannerCoreDataModel+CoreDataClass.h"
#import "CCBannerServerModel.h"

@implementation CCBannerCoreDataModel

- (void)updateWithServerModel:(CCBannerServerModel *)serverModel {
    self.updateData = serverModel.updateDate;
    self.imageSize = serverModel.imageSize;
    self.imageURL = serverModel.imageURL.absoluteString;
    self.playerID = serverModel.playerID;
}

@end
