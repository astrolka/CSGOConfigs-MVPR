//
//  CCNewsPreviewCoreDataModel+CoreDataClass.m
//  
//
//  Created by Петрічук Олег Аркадійовіч on 27.05.17.
//
//

#import "CCNewsPreviewCoreDataModel+CoreDataClass.h"
#import "CCNewsPreviewServerModel.h"

@implementation CCNewsPreviewCoreDataModel

- (void)updateWithServerModel:(CCNewsPreviewServerModel *)serverModel {
    self.newsID = serverModel.newsID;
    self.title = serverModel.title;
    self.imageURL = serverModel.imageURL.absoluteString;
}


@end
