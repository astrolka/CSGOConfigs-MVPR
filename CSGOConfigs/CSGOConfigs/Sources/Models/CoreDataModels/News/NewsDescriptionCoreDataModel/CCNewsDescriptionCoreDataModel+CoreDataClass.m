//
//  CCNewsDescriptionCoreDataModel+CoreDataClass.m
//  
//
//  Created by Petrychuk Oleg on 27.05.17.
//
//

#import "CCNewsDescriptionCoreDataModel+CoreDataClass.h"
#import "CCNewDescriptionContentCoreDataModel+CoreDataClass.h"
#import "CCNewsDescriptionServerModel.h"

@implementation CCNewsDescriptionCoreDataModel

- (void)updateWithServerModel:(CCNewsDescriptionServerModel *)serverModel {
    self.subtitle = serverModel.subtitle;
    self.date = serverModel.date;
    self.author = serverModel.author;
    self.descriptionURL = serverModel.descriptionURL.absoluteString;
    self.newsID = serverModel.newsID;
}

@end
