//
//  CCTeamsService.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 10.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCTeamsService.h"
#import "CCRestServiceProtocol.h"
#import "CCLocalStorageServiceProtocol.h"
#import "CCTeamServerModel.h"
#import "CCTeamViewModel.h"
#import "CCTeamCoreDataModel+CoreDataProperties.h"

@interface CCTeamsService ()

@property (strong, nonatomic) id <CCRestServiceProtocol> ioc_restService;
@property (strong, nonatomic) id <CCLocalStorageServiceProtocol> ioc_localStorageService;

@end

@implementation CCTeamsService

#pragma mark - CCTeamsServiceProtocol

- (void)getTeamsWithOffset:(NSInteger)offset data:(serviceTeamsDataBlock)teams {
    NSString *paramsURL = [NSString stringWithFormat:@"teamsData/teamsData%ld.json",(long)offset];
    
    [self.ioc_restService makeGETRequestWithURL:[NSURL URLWithString:paramsURL] onSucess:^(NSDictionary *responce) {
        NSArray <CCTeamServerModel *> *serverModels = [self parseTeamsWithResponce:responce[@"teams"]];
        
        [self.ioc_localStorageService updateTeams:serverModels];
        
        [CCTeamViewModelBuilder buildWithServerModels:serverModels viewModels:^(NSArray<CCTeamViewModel *> *viewModels) {
            teams(viewModels, YES, [responce[@"countOfPlayers"] integerValue]);
        }];
    } onFailure:^(NSError *error) {
        NSArray <CCTeamCoreDataModel *> *coreDataModels = [self.ioc_localStorageService getTeams];
        
        [CCTeamViewModelBuilder buildWithCoreDataModels:coreDataModels viewModels:^(NSArray<CCTeamViewModel *> *viewModels) {
            teams(viewModels, NO, 0); // 0 - we got all data
        }];
    }];
}

#pragma mark - Private

- (NSArray <CCTeamServerModel *> *)parseTeamsWithResponce:(NSArray *)responce {
    NSMutableArray <CCTeamServerModel *> *serverModels  = [[NSMutableArray alloc] init];
    [responce enumerateObjectsUsingBlock:^(NSDictionary *teamResponce, NSUInteger idx, BOOL * _Nonnull stop) {
        CCTeamServerModel *serverModel = [[CCTeamServerModel alloc] initWithServerResponce:teamResponce];
        [serverModels addObject:serverModel];
    }];
    return serverModels;
}

@end
