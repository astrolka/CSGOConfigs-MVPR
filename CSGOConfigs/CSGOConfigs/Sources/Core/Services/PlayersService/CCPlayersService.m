//
//  CCPlayersService.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 13.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayersService.h"
#import "CCRestServiceProtocol.h"
#import "CCCoreDataServiceProtocol.h"
#import "CCPlayerPreviewServerModel.h"
#import "CCPlayerPreviewViewModel.h"
#import "CCPlayerDescriptionServerModel.h"
#import "CCPlayerDescriptionViewModel.h"

@interface CCPlayersService ()

@property (strong, nonatomic) id <CCRestServiceProtocol> ioc_restService;
@property (strong, nonatomic) id <CCCoreDataServiceProtocol> ioc_coreDataService;

@end

@implementation CCPlayersService

#pragma mark - CCPlayersServiceProtocol

- (void)getPlayersPreviewWithOffset:(NSInteger)offset containerWidth:(CGFloat)containerWidth data:(playersPreviewDataBlock)players {
    NSString *paramsURL = [NSString stringWithFormat:@"playersData/playersData%ld.json",(long)offset];
    [self.ioc_restService makeGETRequestWithURL:[NSURL URLWithString:paramsURL] onSucess:^(NSDictionary *responce) {
        NSArray <CCPlayerPreviewServerModel *> *serverModels  = [self parsePlayersPreviewWithResponce:responce[@"players"]];
        NSInteger countOfPlayersOnServer = [responce[@"countOfPlayers"] integerValue];
        
        [self.ioc_coreDataService updatePlayersPreview:serverModels];
        
        [CCPlayerPreviewViewModelBuilder buildWithServerModels:serverModels containerWidth:containerWidth viewModels:^(NSArray<CCPlayerPreviewViewModel *> *viewModels) {
            players(viewModels, YES, countOfPlayersOnServer);
        }];
    } onFailure:^(NSError *error) {
        NSArray <CCPlayerPreviewCoreDataModel *> *coreDataModels = [self.ioc_coreDataService getPlayersPreview];
        
        [CCPlayerPreviewViewModelBuilder buildWithCoreDataModels:coreDataModels containerWidth:containerWidth viewModels:^(NSArray<CCPlayerPreviewViewModel *> *viewModels) {
            players(viewModels, NO, 0); // 0 - we got all data
        }];
    }];
}

- (void)getFavoritePlayersPreviewWithContainerWidth:(CGFloat)containerWidth data:(favoritePlayersPreviewDataBlock)players {
    NSArray *favoritePlayersIDs = [self.ioc_coreDataService getUserFavoritePlayersID];
    NSArray *favoritePlayers = [self.ioc_coreDataService getFavoritePlayersPreviewWithIDs:favoritePlayersIDs];
    
    [CCPlayerPreviewViewModelBuilder buildWithCoreDataModels:favoritePlayers containerWidth:containerWidth viewModels:^(NSArray<CCPlayerPreviewViewModel *> *favoritePlayers) {
        players(favoritePlayers);
    }];
}

- (void)getDescriptionAboutPlayerWithPlayerID:(NSInteger)playerID data:(playerDescriptionDataBlock)player {
    NSString *paramsURL = [NSString stringWithFormat:@"playerDescriptionData/playerID%ld.json",(long)playerID];
    [self.ioc_restService makeGETRequestWithURL:[NSURL URLWithString:paramsURL] onSucess:^(id responce) {
        CCPlayerDescriptionServerModel *serverModel = [[CCPlayerDescriptionServerModel alloc] initWithServerResponce:responce];
        
        [self.ioc_coreDataService updatePlayerDescription:serverModel];
        
        [CCPlayerDescriptionViewModelBuilder buildWithServerModel:serverModel viewModel:^(CCPlayerDescriptionViewModel *viewModel) {
            player(viewModel, YES);
        }];
    } onFailure:^(NSError *error) {
        CCPlayerDescriptionCoreDataModel *coreDataModel = [self.ioc_coreDataService getPlayerDescriptionWithPlayerID:playerID];
        
        [CCPlayerDescriptionViewModelBuilder buildWithCoreDataModel:coreDataModel viewModel:^(CCPlayerDescriptionViewModel *viewModel) {
            player(viewModel, NO);
        }];
    }];
}

- (BOOL)playerIsFavorite:(NSInteger)playerID {
    return [self.ioc_coreDataService playerIsFavorite:playerID];
}

- (void)addPlayerToFavoritesWithPlayerID:(NSInteger)playerID {
    [self.ioc_coreDataService addPlayerToFavoritesWithPlayerID:playerID];
}

- (void)removePlayerFromFavoritesWithPlayerID:(NSInteger)playerID {
    [self.ioc_coreDataService removePlayerFromFavoritesWithID:playerID];
}

#pragma mark - Private

- (NSArray <CCPlayerPreviewServerModel *> *)parsePlayersPreviewWithResponce:(NSArray *)responce {
    NSMutableArray <CCPlayerPreviewServerModel *> *serverModels  = [[NSMutableArray alloc] init];
    [responce enumerateObjectsUsingBlock:^(NSDictionary *playerResponce, NSUInteger idx, BOOL * _Nonnull stop) {
        CCPlayerPreviewServerModel *serverModel = [[CCPlayerPreviewServerModel alloc] initWithServerResponce:playerResponce];
        [serverModels addObject:serverModel];
    }];
    return serverModels;
}

@end
