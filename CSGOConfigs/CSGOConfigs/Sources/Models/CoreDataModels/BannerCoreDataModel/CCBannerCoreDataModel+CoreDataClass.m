//
//  CCBannerCoreDataModel+CoreDataClass.m
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import "CCBannerCoreDataModel+CoreDataClass.h"
#import "CCBannerServerModel.h"

@implementation CCBannerCoreDataModel

- (void)updateWithServerModel:(CCBannerServerModel *)playerPreviewServerModel {
    self.updateDate = playerPreviewServerModel.updateDate;
    self.imageSize = playerPreviewServerModel.imageSize;
    self.imageURL = playerPreviewServerModel.imageURL.absoluteString;
    self.playerID = @(playerPreviewServerModel.playerID);
}

@end
