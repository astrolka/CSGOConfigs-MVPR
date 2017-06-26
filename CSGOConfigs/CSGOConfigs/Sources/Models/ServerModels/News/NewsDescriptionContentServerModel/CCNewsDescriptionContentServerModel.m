//
//  CCNewsDescriptionContentServerModel.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsDescriptionContentServerModel.h"

@interface CCNewsDescriptionContentServerModel ()

@property (nonatomic, assign, readwrite) BOOL isImage;
@property (nonatomic, strong, readwrite) NSURL *coverImageURL;
@property (nonatomic, strong, readwrite) NSString *text;

@end

@implementation CCNewsDescriptionContentServerModel

#pragma mark - CCServerModelProtocol

- (instancetype)initWithServerResponce:(NSDictionary *)serverResponce {
    self = [super init];
    if (self) {
        self.isImage = [serverResponce[@"isImage"] boolValue];
        self.coverImageURL = [NSURL URLWithString:serverResponce[@"image"]];
        self.text = serverResponce[@"text"];
    }
    return self;
}

@end
