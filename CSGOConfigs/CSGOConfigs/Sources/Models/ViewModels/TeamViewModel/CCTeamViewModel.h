//
//  CCTeamViewModel.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 10.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCPlayerPreviewViewModel.h"
@class CCTeamCoreDataModel;
@class CCTeamServerModel;

@interface CCTeamViewModel : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSURL *imageURL;
@property (assign, nonatomic) NSInteger teamID;
@property (strong, nonatomic) NSArray <CCPlayerPreviewViewModel *> * players;

@end



typedef void(^viewModelDataBlock)(NSArray <CCTeamViewModel *> *teams);

@interface CCTeamViewModelBuilder : NSObject

+ (void)buildWithServerModels:(NSArray <CCTeamServerModel *> *)serverModels
                   viewModels:(viewModelDataBlock)viewModels;

+ (void)buildWithCoreDataModels:(NSArray <CCTeamCoreDataModel *> *)coreDataModels
                     viewModels:(viewModelDataBlock)viewModels;

@end
