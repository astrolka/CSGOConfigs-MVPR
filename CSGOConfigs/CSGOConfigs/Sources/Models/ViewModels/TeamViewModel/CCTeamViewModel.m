//
//  CCTeamViewModel.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 10.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCTeamViewModel.h"
#import "CCTeamServerModel.h"
#import "CCTeamCoreDataModel+CoreDataProperties.h"
#import "CCPlayerPreviewViewModel.h"

@implementation CCTeamViewModel

@end



static CGFloat const kNoNeedSize = 0.f;

@implementation CCTeamViewModelBuilder

+ (void)buildWithServerModels:(NSArray <CCTeamServerModel *> *)serverModels
                   viewModels:(teamsDataBlock)viewModels {
    __block NSMutableArray <CCTeamViewModel *> *viewModelsData = [[NSMutableArray alloc] init];
    
    const char *classNameChar = [NSStringFromClass([CCTeamViewModelBuilder class]) UTF8String];
    dispatch_queue_t queue = dispatch_queue_create(classNameChar, DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        [serverModels enumerateObjectsUsingBlock:^(CCTeamServerModel *serverModel, NSUInteger idx, BOOL * _Nonnull stop) {
            CCTeamViewModel *viewModel = [[CCTeamViewModel alloc] init];
            viewModel.name = serverModel.name;
            viewModel.imageURL = serverModel.imageURL;
            viewModel.teamID = serverModel.teamID;
        
            [CCPlayerPreviewViewModelBuilder buildWithServerModels:serverModel.players containerWidth:kNoNeedSize viewModels:^(NSArray<CCPlayerPreviewViewModel *> *players) {
                viewModel.players = players;
            }];
    
            [viewModelsData addObject:viewModel];
        }];
    });
    
    dispatch_async(queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            viewModels((NSArray *)viewModelsData);
        });
    });
}

+ (void)buildWithCoreDataModels:(NSArray <CCTeamCoreDataModel *> *)coreDataModels
                     viewModels:(teamsDataBlock)viewModels {
    __block NSMutableArray <CCTeamViewModel *> *viewModelsData = [[NSMutableArray alloc] init];
    
    const char *classNameChar = [NSStringFromClass([CCTeamViewModelBuilder class]) UTF8String];
    dispatch_queue_t queue = dispatch_queue_create(classNameChar, DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        [coreDataModels enumerateObjectsUsingBlock:^(CCTeamCoreDataModel *coreDataModel, NSUInteger idx, BOOL * _Nonnull stop) {
            CCTeamViewModel *viewModel = [[CCTeamViewModel alloc] init];
            viewModel.name = coreDataModel.name;
            viewModel.imageURL = [NSURL URLWithString:coreDataModel.imageURL];
            viewModel.teamID = (NSUInteger)coreDataModel.teamID;
            
            [CCPlayerPreviewViewModelBuilder buildWithCoreDataModels:(NSArray *)coreDataModel.playerRelationship containerWidth:kNoNeedSize viewModels:^(NSArray<CCPlayerPreviewViewModel *> *players) {
                viewModel.players = players;
            }];
            
            [viewModelsData addObject:viewModel];
        }];
    });
    
    dispatch_async(queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            viewModels((NSArray *)viewModelsData);
        });
    });
}

@end
