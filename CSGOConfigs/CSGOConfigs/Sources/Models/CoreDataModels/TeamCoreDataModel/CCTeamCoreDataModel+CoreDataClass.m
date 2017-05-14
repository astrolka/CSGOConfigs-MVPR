//
//  CCTeamCoreDataModel+CoreDataClass.m
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import "CCTeamCoreDataModel+CoreDataClass.h"
#import "CCTeamServerModel.h"

@implementation CCTeamCoreDataModel

- (void)updateWithServerModel:(CCTeamServerModel *)teamServerModel {
    self.imageURL = teamServerModel.imageURL.absoluteString;
    self.name = teamServerModel.name;
    self.teamID = @(teamServerModel.teamID);
}

@end
