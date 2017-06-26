//
//  CCPlayerDescriptionCoreDataModel+CoreDataClass.m
//  
//
//  Created by Petrychuk Oleg on 27.05.17.
//
//

#import "CCPlayerDescriptionCoreDataModel+CoreDataClass.h"
#import "CCPlayerPreviewCoreDataModel+CoreDataClass.h"
#import "CCPlayerDescriptionServerModel.h"

@implementation CCPlayerDescriptionCoreDataModel

- (void)updateWithServerModel:(CCPlayerDescriptionServerModel *)serverModel andPreviewCoreDataModel:(CCPlayerPreviewCoreDataModel *)playerPreviewCoreDataModel {
    self.playerID = serverModel.playerID;
    self.name = serverModel.name;
    self.surname = serverModel.surname;
    self.teamName = serverModel.teamName;
    self.flagImageURL = serverModel.flagImageURL.absoluteString;
    self.country = serverModel.country;
    self.moreInfoURL = serverModel.moreInfoURL.absoluteString;
    self.mouse = serverModel.mouse;
    self.mousepad = serverModel.mousepad;
    self.monitor = serverModel.monitor;
    self.keyboard = serverModel.keyboard;
    self.headSet = serverModel.headSet;
    self.effectiveDPI = serverModel.effectiveDPI;
    self.gameResolution = serverModel.gameResolution;
    self.windowsSensitivity = serverModel.windowsSensitivity;
    self.pollingRate = serverModel.pollingRate;
    self.downloadURL = serverModel.downloadURL.absoluteString;
    
    playerPreviewCoreDataModel.nickName = serverModel.nickName;
    playerPreviewCoreDataModel.imageURL = serverModel.profileImageURL.absoluteString;
    self.previewRelationship = playerPreviewCoreDataModel;
}


@end
