//
//  CCPlayerPreviewServerModel.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayerPreviewServerModel.h"

@interface CCPlayerPreviewServerModel ()

@property (nonatomic, assign, readwrite) NSString *nickName;
@property (nonatomic, assign, readwrite) NSString *imageSize;
@property (nonatomic, assign, readwrite) NSURL *imageURL;
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
    }
    return self;
}

@end
