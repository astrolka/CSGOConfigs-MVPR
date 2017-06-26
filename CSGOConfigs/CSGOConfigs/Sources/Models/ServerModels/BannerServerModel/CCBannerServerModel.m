//
//  CCBannerServerModel.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCBannerServerModel.h"

@interface CCBannerServerModel ()

@property (nonatomic, strong, readwrite) NSDate *updateDate;
@property (nonatomic, strong, readwrite) NSString *imageSize;
@property (nonatomic, strong, readwrite) NSURL *imageURL;
@property (nonatomic, assign, readwrite) NSInteger playerID;

@end

@implementation CCBannerServerModel

#pragma mark - CCServerModelProtocol

- (instancetype)initWithServerResponce:(NSDictionary *)serverResponce {
    self = [super init];
    if (self) {
        self.imageSize = serverResponce[@"imageResolution"];
        self.imageURL = [NSURL URLWithString:serverResponce[@"imageLink"]];
        self.playerID = [serverResponce[@"id"] integerValue];
        self.updateDate = [NSDate dateWithTimeIntervalSince1970:[serverResponce[@"date"] doubleValue]];
    }
    return self;
}

@end
