//
//  CCNewsPreviewCoreDataModel+CoreDataClass.m
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import "CCNewsPreviewCoreDataModel+CoreDataClass.h"
#import "CCNewsPreviewServerModel.h"

@implementation CCNewsPreviewCoreDataModel

- (void)updateWithServerModel:(CCNewsPreviewServerModel *)newsPreviewServerModel {
    self.newsID = @(newsPreviewServerModel.newsID);
    self.title = newsPreviewServerModel.title;
    self.imageURL = newsPreviewServerModel.imageURL.absoluteString;
}

@end
