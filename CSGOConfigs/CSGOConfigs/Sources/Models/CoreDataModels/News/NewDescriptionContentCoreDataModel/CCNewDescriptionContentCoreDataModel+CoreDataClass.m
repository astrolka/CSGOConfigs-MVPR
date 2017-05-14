//
//  CCNewDescriptionContentCoreDataModel+CoreDataClass.m
//  
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//
//

#import "CCNewDescriptionContentCoreDataModel+CoreDataClass.h"
#import "CCNewsDescriptionContentServerModel.h"

@implementation CCNewDescriptionContentCoreDataModel

- (void)updateWithServerModel:(CCNewsDescriptionContentServerModel *)newsDescriptionContentServerModel {
    // don't try use absoluteString, crush with empty string
    self.coverImageURL = [NSString stringWithFormat:@"%@",newsDescriptionContentServerModel.coverImageURL];
    self.text = newsDescriptionContentServerModel.text;
    self.isImage = @(newsDescriptionContentServerModel.isImage);
}

@end
