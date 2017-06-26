//
//  CCNewsPreviewServerModel.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsPreviewServerModel.h"

@interface CCNewsPreviewServerModel ()

@property (nonatomic, strong, readwrite) NSString *title;
@property (nonatomic, assign, readwrite) NSInteger newsID;
@property (nonatomic, strong, readwrite) NSURL *imageURL;

@end

@implementation CCNewsPreviewServerModel

#pragma mark - CCServerModelProtocol

- (instancetype)initWithServerResponce:(NSDictionary *)serverResponce {
    self = [super init];
    if (self) {
        self.title = serverResponce[@"title"];
        self.newsID = [serverResponce[@"id"] integerValue];
        self.imageURL = [NSURL URLWithString:serverResponce[@"image"]];
    }
    return self;
}

@end
