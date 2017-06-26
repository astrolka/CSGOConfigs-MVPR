//
//  CCTeamCoreDataModel+CoreDataClass.m
//  
//
//  Created by Petrychuk Oleg on 27.05.17.
//
//

#import "CCTeamCoreDataModel+CoreDataClass.h"
#import "CCPlayerPreviewCoreDataModel+CoreDataClass.h"
#import "CCTeamServerModel.h"

@implementation CCTeamCoreDataModel

- (void)updateWithServerModel:(CCTeamServerModel *)serverModel {
    self.imageURL = serverModel.imageURL.absoluteString;
    self.name = serverModel.name;
    self.teamID = serverModel.teamID;
}

@end
