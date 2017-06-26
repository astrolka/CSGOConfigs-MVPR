//
//  CCPlayerPreviewCoreDataModel+CoreDataClass.m
//  
//
//  Created by Petrychuk Oleg on 27.05.17.
//
//

#import "CCPlayerPreviewCoreDataModel+CoreDataClass.h"
#import "CCPlayerDescriptionCoreDataModel+CoreDataClass.h"
#import "CCTeamCoreDataModel+CoreDataClass.h"
#import "CCPlayerPreviewServerModel.h"

@implementation CCPlayerPreviewCoreDataModel

- (void)updateWithServerModel:(CCPlayerPreviewServerModel *)serverModel andPlayerDescriptionCoreDataModel:(CCPlayerDescriptionCoreDataModel *)playerDescriptionCoreDataModel {
    self.nickName = serverModel.nickName;
    self.imageSize = serverModel.imageSize;
    self.imageURL = serverModel.imageURL.absoluteString;
    self.playerID = serverModel.playerID;
    
    playerDescriptionCoreDataModel.previewRelationship = self;
}

- (void)updateWithServerModel:(CCPlayerPreviewServerModel *)serverModel {
    self.nickName = serverModel.nickName;
    self.imageSize = serverModel.imageSize;
    self.imageURL = serverModel.imageURL.absoluteString;
    self.playerID = serverModel.playerID;
}

@end
