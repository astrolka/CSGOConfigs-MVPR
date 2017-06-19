//
//  CCNewsService.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsService.h"
#import "CCRestServiceProtocol.h"
#import "CCLocalStorageServiceProtocol.h"
#import "CCNewsPreviewCoreDataModel+CoreDataProperties.h"

@interface CCNewsService ()

@property (nonatomic, strong) id <CCRestServiceProtocol> ioc_restService;
@property (nonatomic, strong) id <CCLocalStorageServiceProtocol> ioc_localStorageService;

@end

@implementation CCNewsService

#pragma mark - CCNewsServiceProtocol

- (void)getNewsPreviewWithOffset:(NSUInteger) offset data:(newsPreviewDataBlock)news {
    NSString *paramsURL = [NSString stringWithFormat:@"newsPreviewData/newsPreviewData%ld.json",(long)offset];
    
    [self.ioc_restService makeGETRequestWithURL:[NSURL URLWithString:paramsURL] onSucess:^(NSDictionary *responce) {
        NSArray <CCNewsPreviewServerModel *> *serverModels = [self parseTeamsWithResponce:responce[@"news"]];
        
        [self.ioc_localStorageService updateNewsPreview:serverModels];
        
        [CCNewsPreviewViewModelBuilder buildWithServerModels:serverModels viewModels:^(NSArray<CCNewsPreviewViewModel *> *viewModels) {
            news(viewModels, YES, [responce[@"countOfNews"] integerValue]);
        }];
        
    } onFailure:^(NSError *error) {
        NSArray <CCNewsPreviewCoreDataModel *> *coreDataModels = [self.ioc_localStorageService getNewsPreview];
        
        [CCNewsPreviewViewModelBuilder buildWithCoreDataModels:coreDataModels viewModels:^(NSArray<CCNewsPreviewViewModel *> *viewModels) {
            news(viewModels, NO, 0); // 0 - we got all data
        }];
    }];
}

- (void)getNewsDescriptionWithNewsID:(NSInteger)newsID data:(serviceNewsDescriptionDataBlock)newsDescription {
    NSString *paramsURL = [NSString stringWithFormat:@"newsDescriptionData/newsID%ld.json",(long)newsID];
    [self.ioc_restService makeGETRequestWithURL:[NSURL URLWithString:paramsURL] onSucess:^(NSDictionary *responce) {
        CCNewsDescriptionServerModel *serverModel = [[CCNewsDescriptionServerModel alloc] initWithServerResponce:responce];
        
        [self.ioc_localStorageService updateNewsDescription:serverModel];
        
        [CCNewsDescriptionViewModelBuilder buildWithServerModels:serverModel viewModels:^(CCNewsDescriptionViewModel *viewModel) {
            newsDescription(viewModel, YES);
        }];
    } onFailure:^(NSError *error) {
        CCNewsDescriptionCoreDataModel *coreDataModel = [self.ioc_localStorageService getNewsDescriptionWithID:newsID];
        
        [CCNewsDescriptionViewModelBuilder buildWithCoreDataModels:coreDataModel viewModels:^(CCNewsDescriptionViewModel *viewModel) {
            newsDescription(viewModel, NO);
        }];
    }];
}

#pragma mark - Private

- (NSArray <CCNewsPreviewServerModel *> *)parseTeamsWithResponce:(NSArray *)responce {
    NSMutableArray <CCNewsPreviewServerModel *> *serverModels  = [[NSMutableArray alloc] init];
    [responce enumerateObjectsUsingBlock:^(NSDictionary *newsResponce, NSUInteger idx, BOOL * _Nonnull stop) {
        CCNewsPreviewServerModel *serverModel = [[CCNewsPreviewServerModel alloc] initWithServerResponce:newsResponce];
        [serverModels addObject:serverModel];
    }];
    return serverModels;
}

@end
