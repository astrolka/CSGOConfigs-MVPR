//
//  CCPlayerPreviewCoreDataModel+CoreDataClass.m
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import "CCPlayerPreviewCoreDataModel+CoreDataClass.h"
#import "CCPlayerPreviewServerModel.h"
#import "CCPlayerDescriptionCoreDataModel+CoreDataProperties.h"

@implementation CCPlayerPreviewCoreDataModel


- (void)updateWithServerModel:(CCPlayerPreviewServerModel *)playerPreviewServerModel andPlayerDescriptionCoreDataModel:(CCPlayerDescriptionCoreDataModel *)playerDescriptionCoreDataModel {
    self.nickName = playerPreviewServerModel.nickName;
    self.imageSize = playerPreviewServerModel.imageSize;
    self.imageURL = playerPreviewServerModel.imageURL.absoluteString;
    self.playerID = @(playerPreviewServerModel.playerID);
    
    playerDescriptionCoreDataModel.previewRelationship = self;
}

- (void)updateWithServerModel:(CCPlayerPreviewServerModel *)playerPreviewServerModel {
    self.nickName = playerPreviewServerModel.nickName;
    self.imageSize = playerPreviewServerModel.imageSize;
    self.imageURL = playerPreviewServerModel.imageURL.absoluteString;
    self.playerID = @(playerPreviewServerModel.playerID);
}


@end
