//
//  CCPlayerDescriptionCoreDataModel+CoreDataClass.m
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import "CCPlayerDescriptionCoreDataModel+CoreDataClass.h"
#import "CCPlayerDescriptionServerModel.h"
#import "CCPlayerPreviewCoreDataModel+CoreDataProperties.h"

@implementation CCPlayerDescriptionCoreDataModel

- (void)updateWithServerModel:(CCPlayerDescriptionServerModel *)playerPreviewServerModel andPreviewCoreDataModel:(CCPlayerPreviewCoreDataModel *)playerPreviewCoreDataModel {
    self.playerID = @(playerPreviewServerModel.playerID);
    self.name = playerPreviewServerModel.name;
    self.surname = playerPreviewServerModel.surname;
    self.teamName = playerPreviewServerModel.teamName;
    self.flagImageURL = playerPreviewServerModel.flagImageURL.absoluteString;
    self.country = playerPreviewServerModel.country;
    self.moreInfoURL = playerPreviewServerModel.moreInfoURL.absoluteString;
    self.mouse = playerPreviewServerModel.mouse;
    self.mousepad = playerPreviewServerModel.mousepad;
    self.monitor = playerPreviewServerModel.monitor;
    self.keyboard = playerPreviewServerModel.keyboard;
    self.headSet = playerPreviewServerModel.headSet;
    self.effectiveDPI = playerPreviewServerModel.effectiveDPI;
    self.gameResolution = playerPreviewServerModel.gameResolution;
    self.windowsSensitivity = playerPreviewServerModel.windowsSensitivity;
    self.pollingRate = playerPreviewServerModel.pollingRate;
    self.downloadURL = playerPreviewServerModel.downloadURL.absoluteString;
    
    playerPreviewCoreDataModel.nickName = playerPreviewServerModel.nickName;
    playerPreviewCoreDataModel.imageURL = playerPreviewServerModel.profileImageURL.absoluteString;
    
    self.previewRelationship = playerPreviewCoreDataModel;
}

@end
