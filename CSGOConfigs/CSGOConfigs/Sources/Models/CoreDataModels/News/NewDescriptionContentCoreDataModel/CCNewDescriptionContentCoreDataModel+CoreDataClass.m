//
//  CCNewDescriptionContentCoreDataModel+CoreDataClass.m
//  
//
//  Created by Петрічук Олег Аркадійовіч on 27.05.17.
//
//

#import "CCNewDescriptionContentCoreDataModel+CoreDataClass.h"
#import "CCNewsDescriptionCoreDataModel+CoreDataClass.h"
#import "CCNewsDescriptionContentServerModel.h"

@implementation CCNewDescriptionContentCoreDataModel

- (void)updateWithServerModel:(CCNewsDescriptionContentServerModel *)serverModel {
    // don't try use absoluteString, crush with empty string
    self.coverImageURL = [NSString stringWithFormat:@"%@",serverModel.coverImageURL];
    self.text = serverModel.text;
    self.isImage = serverModel.isImage;
}

@end
