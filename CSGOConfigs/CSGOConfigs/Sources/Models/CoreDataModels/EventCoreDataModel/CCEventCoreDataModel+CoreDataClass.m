//
//  CCEventCoreDataModel+CoreDataClass.m
//  
//
//  Created by Петрічук Олег Аркадійовіч on 27.05.17.
//
//

#import "CCEventCoreDataModel+CoreDataClass.h"
#import "CCEventServerModel.h"

@implementation CCEventCoreDataModel

- (void)updateWithServerModel:(CCEventServerModel *)serverModel {
    self.name = serverModel.name;
    self.city = serverModel.city;
    self.flagImageURL = serverModel.flagImageURL.absoluteString;
    self.descriptionURL = serverModel.desctiptionURL.absoluteString;
    self.beginDate = serverModel.beginDate;
    self.finishDate = serverModel.finishDate;
    self.logoImageURL = serverModel.logoImageURL.absoluteString;
    self.prizePool = serverModel.prizePool;
    self.countOfTeams = serverModel.countOfTeams;
    self.lat = serverModel.lat;
    self.lng = serverModel.lng;
}

@end
