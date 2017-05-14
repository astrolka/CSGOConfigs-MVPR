//
//  CCNewsDescriptionCoreDataModel+CoreDataClass.m
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import "CCNewsDescriptionCoreDataModel+CoreDataClass.h"
#import "CCNewsDescriptionServerModel.h"

@implementation CCNewsDescriptionCoreDataModel

- (void)updateWithServerModel:(CCNewsDescriptionServerModel *)newsDescriptionServerModel {
    self.subtitle = newsDescriptionServerModel.subtitle;
    self.date = newsDescriptionServerModel.date;
    self.author = newsDescriptionServerModel.author;
    self.moreInfoURL = newsDescriptionServerModel.moreInfoURL.absoluteString;
    self.newsID = @(newsDescriptionServerModel.newsID);
}

@end
