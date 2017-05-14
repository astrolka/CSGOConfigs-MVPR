//
//  CCEventServerModel.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCEventServerModel.h"

@interface CCEventServerModel ()

@property (nonatomic, strong, readwrite) NSString *name;
@property (nonatomic, strong, readwrite) NSString *city;
@property (nonatomic, strong, readwrite) NSURL *flagImageURL;
@property (nonatomic, strong, readwrite) NSURL *desctiptionURL;
@property (nonatomic, strong, readwrite) NSDate *beginDate;
@property (nonatomic, strong, readwrite) NSDate *finishDate;
@property (nonatomic, strong, readwrite) NSURL *logoImageURL;
@property (nonatomic, strong, readwrite) NSString *prizePool;
@property (nonatomic, assign, readwrite) NSInteger countOfTeams;
@property (nonatomic, assign, readwrite) CGFloat lat;
@property (nonatomic, assign, readwrite) CGFloat lng;

@end

@implementation CCEventServerModel

#pragma mark - CCServerModelProtocol

- (instancetype)initWithServerResponce:(NSDictionary *)serverResponce {
    self = [super init];
    if (self) {
        self.name = serverResponce[@"name"];
        self.city = serverResponce[@"cityName"];
        self.flagImageURL = [NSURL URLWithString:serverResponce[@"flagImage"]];
        self.logoImageURL = [NSURL URLWithString:serverResponce[@"eventLogo"]];
        self.prizePool = serverResponce[@"prizePool"];
        self.desctiptionURL = [NSURL URLWithString:serverResponce[@"link"]];
        self.lat = [serverResponce[@"lat"] floatValue];
        self.lng = [serverResponce[@"lng"] floatValue];
        self.countOfTeams = [serverResponce[@"countOfTeams"] integerValue];
        self.beginDate = [NSDate dateWithTimeIntervalSince1970:[serverResponce[@"dateStart"] doubleValue]];
        self.finishDate = [NSDate dateWithTimeIntervalSince1970:[serverResponce[@"dateEnd"] doubleValue]];
    }
    return self;
}

@end
