//
//  CCPlayerPreviewServerModel.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayerPreviewServerModel.h"

@interface CCPlayerPreviewServerModel ()

@property (nonatomic, strong, readwrite) NSString *nickName;
@property (nonatomic, strong, readwrite) NSString *imageSize;
@property (nonatomic, strong, readwrite) NSURL *imageURL;
@property (nonatomic, assign, readwrite) NSInteger playerID;

@end

@implementation CCPlayerPreviewServerModel

#pragma mark - CCServerModelProtocol

- (instancetype)initWithServerResponce:(NSDictionary *)serverResponce {
    self = [super init];
    if (self) {
        self.nickName = serverResponce[@"nickName"];
        self.imageSize = serverResponce[@"imageResolution"];
        self.imageURL = [NSURL URLWithString:serverResponce[@"image"]];
        self.playerID = [serverResponce[@"id"] integerValue];
        self.imageURL = [NSURL URLWithString:@"http://i.imgur.com/UGrKHzp.png"];
    }
    return self;
}

@end
