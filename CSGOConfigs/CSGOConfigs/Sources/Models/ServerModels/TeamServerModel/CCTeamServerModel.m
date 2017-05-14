//
//  CCTeamServerModel.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCTeamServerModel.h"

@interface CCTeamServerModel ()

@property (nonatomic, strong, readwrite) NSString *name;
@property (nonatomic, strong, readwrite) NSURL *imageURL;
@property (nonatomic, assign, readwrite) NSInteger teamID;
@property (nonatomic, strong, readwrite) NSArray <CCPlayerPreviewServerModel *> *players;

@end

@implementation CCTeamServerModel

#pragma mark - CCServerModelProtocol

- (instancetype)initWithServerResponce:(NSDictionary *)serverResponce {
    self = [super init];
    if (self) {
        self.imageURL = [NSURL URLWithString:serverResponce[@"image"]];
        self.name = serverResponce[@"teamName"];
        self.teamID = [serverResponce[@"id"] integerValue];
        
        NSMutableArray <CCPlayerPreviewServerModel *> *players = [[NSMutableArray alloc] init];
        NSArray * playersResponceArray = serverResponce[@"players"];
        [playersResponceArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSDictionary * singlePlayerResponce = playersResponceArray[idx];
            CCPlayerPreviewServerModel * playerPreviewServerModel = [[CCPlayerPreviewServerModel alloc] initWithServerResponce:singlePlayerResponce];
            [players addObject:playerPreviewServerModel];
        }];
        self.players = [NSArray arrayWithArray:players];
    }
    return self;
}

@end
