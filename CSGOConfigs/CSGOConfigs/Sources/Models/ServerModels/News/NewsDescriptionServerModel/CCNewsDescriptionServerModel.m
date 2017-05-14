//
//  CCNewsDescriptionServerModel.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsDescriptionServerModel.h"

@interface CCNewsDescriptionServerModel ()

@property (nonatomic, assign, readwrite) NSInteger newsID;
@property (nonatomic, strong, readwrite) NSString *subtitle;
@property (nonatomic, strong, readwrite) NSDate *date;
@property (nonatomic, strong, readwrite) NSString *author;
@property (nonatomic, strong, readwrite) NSURL *moreInfoURL;

@property (nonatomic, strong, readwrite) NSArray <CCNewsDescriptionContentServerModel *> *content;

@end

@implementation CCNewsDescriptionServerModel

#pragma mark - CCServerModelProtocol

- (instancetype)initWithServerResponce:(NSDictionary *)serverResponce {
    self = [super init];
    if (self) {
        self.newsID = [serverResponce[@"id"] integerValue];
        self.subtitle = serverResponce[@"subtitle"];
        self.date = [NSDate dateWithTimeIntervalSince1970:[serverResponce[@"date"] doubleValue]];
        self.author = serverResponce[@"author"];
        self.moreInfoURL = [NSURL URLWithString:serverResponce[@"link"]];
        
        NSMutableArray <CCNewsDescriptionContentServerModel *> *content = [[NSMutableArray alloc] init];
        NSArray *contentResponceArray = serverResponce[@"content"];
        [contentResponceArray enumerateObjectsUsingBlock:^(id  _Nonnull contentDict, NSUInteger idx, BOOL * _Nonnull stop) {
            CCNewsDescriptionContentServerModel *newsDescriptionContentServerModel = [[CCNewsDescriptionContentServerModel alloc]initWithServerResponce:contentDict];
            [content addObject:newsDescriptionContentServerModel];
        }];
        self.content = [NSArray arrayWithArray:content];
    }
    return self;
}

@end
