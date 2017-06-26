//
//  CCPlayerDescriptionServerModel.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayerDescriptionServerModel.h"

@interface CCPlayerDescriptionServerModel ()

@property (nonatomic, assign, readwrite) NSInteger playerID;
@property (nonatomic, strong, readwrite) NSString *nickName;
@property (nonatomic, strong, readwrite) NSString *name;
@property (nonatomic, strong, readwrite) NSString *surname;
@property (nonatomic, strong, readwrite) NSURL * profileImageURL;

@property (nonatomic, strong, readwrite) NSString *teamName;
@property (nonatomic, strong, readwrite) NSURL *teamImageURL;

@property (nonatomic, strong, readwrite) NSURL *flagImageURL;
@property (nonatomic, strong, readwrite) NSString *country;

@property (nonatomic, strong, readwrite) NSURL *moreInfoURL;

@property (nonatomic, strong, readwrite) NSString *mouse;
@property (nonatomic, strong, readwrite) NSString *mousepad;
@property (nonatomic, strong, readwrite) NSString *monitor;
@property (nonatomic, strong, readwrite) NSString *keyboard;
@property (nonatomic, strong, readwrite) NSString *headSet;

@property (nonatomic, strong, readwrite) NSString *effectiveDPI;
@property (nonatomic, strong, readwrite) NSString *gameResolution;
@property (nonatomic, strong, readwrite) NSString *windowsSensitivity;
@property (nonatomic, strong, readwrite) NSString *pollingRate;

@property (nonatomic, strong, readwrite) NSURL * downloadURL;

@end

@implementation CCPlayerDescriptionServerModel

#pragma mark - CCServerModelProtocol

- (instancetype)initWithServerResponce:(NSDictionary *)serverResponce {
    self = [super init];
    if (self) {
        self.playerID = [serverResponce[@"id"] integerValue];
        self.nickName = serverResponce[@"nick"];
        self.name = serverResponce[@"name"];
        self.surname = serverResponce[@"surName"];
        self.teamName = serverResponce[@"team"];
        self.teamImageURL = [NSURL URLWithString:serverResponce[@"teamImage"]];
        self.profileImageURL = [NSURL URLWithString:serverResponce[@"image"]];
        self.flagImageURL = [NSURL URLWithString:serverResponce[@"flagImage"]];
        self.country = serverResponce[@"country"];
        self.moreInfoURL = [NSURL URLWithString:serverResponce[@"moreInfoLink"]];
        
        self.mouse = serverResponce[@"mouse"];
        self.mousepad = serverResponce[@"mousepad"];
        self.monitor = serverResponce[@"monitor"];
        self.keyboard = serverResponce[@"keyboard"];
        self.headSet = serverResponce[@"headSet"];
        
        self.effectiveDPI = serverResponce[@"Effective DPI"];
        self.gameResolution = serverResponce[@"InGameResolution"];
        self.windowsSensitivity = serverResponce[@"windowsSen"];
        self.pollingRate = serverResponce[@"PollingRate"];
        
        self.downloadURL = [NSURL URLWithString:serverResponce[@"downloadLink"]];
    }
    return self;
}

@end
