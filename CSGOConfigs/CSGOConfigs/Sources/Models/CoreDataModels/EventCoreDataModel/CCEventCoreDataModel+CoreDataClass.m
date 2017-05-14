//
//  CCEventCoreDataModel+CoreDataClass.m
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import "CCEventCoreDataModel+CoreDataClass.h"
#import "CCEventServerModel.h"

@implementation CCEventCoreDataModel

- (void)updateWithServerModel:(CCEventServerModel *)eventServerModel {
    self.name = eventServerModel.name;
    self.city = eventServerModel.city;
    self.flagImageURL = eventServerModel.flagImageURL.absoluteString;
    self.desctiptionURL = eventServerModel.desctiptionURL.absoluteString;
    self.beginDate = eventServerModel.beginDate;
    self.finishDate = eventServerModel.finishDate;
    self.logoImageURL = eventServerModel.logoImageURL.absoluteString;
    self.prizePool = eventServerModel.prizePool;
    self.countOfTeams = @(eventServerModel.countOfTeams);
    self.lat = @(eventServerModel.lat);
    self.lng = @(eventServerModel.lng);
}


@end
