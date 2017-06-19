//
//  CCNewsPreviewViewModel.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsPreviewViewModel.h"
#import "CCNewsPreviewServerModel.h"
#import "CCNewsPreviewCoreDataModel+CoreDataProperties.h"

@implementation CCNewsPreviewViewModel

@end

@implementation CCNewsPreviewViewModelBuilder

+ (void)buildWithServerModels:(NSArray<CCNewsPreviewServerModel *> *)serverModels viewModels:(viewModelDataBlock)viewModels {
    __block NSMutableArray <CCNewsPreviewViewModel *> *viewModelsData = [[NSMutableArray alloc] init];
    
    const char *classNameChar = [NSStringFromClass([CCNewsPreviewViewModelBuilder class]) UTF8String];
    dispatch_queue_t queue = dispatch_queue_create(classNameChar, DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        [serverModels enumerateObjectsUsingBlock:^(CCNewsPreviewServerModel *serverModel, NSUInteger idx, BOOL * _Nonnull stop) {
            CCNewsPreviewViewModel *viewModel = [[CCNewsPreviewViewModel alloc] init];
            viewModel.title = serverModel.title;
            viewModel.imageURL = serverModel.imageURL;
            viewModel.newsID = serverModel.newsID;
            [viewModelsData addObject:viewModel];
        }];
    });
    
    dispatch_async(queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            viewModels((NSArray *)viewModelsData);
        });
    });
}

+ (void)buildWithCoreDataModels:(NSArray<CCNewsPreviewCoreDataModel *> *)coreDataModels viewModels:(viewModelDataBlock)viewModels {
    __block NSMutableArray <CCNewsPreviewViewModel *> *viewModelsData = [[NSMutableArray alloc] init];
    
    const char *classNameChar = [NSStringFromClass([CCNewsPreviewViewModelBuilder class]) UTF8String];
    dispatch_queue_t queue = dispatch_queue_create(classNameChar, DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        [coreDataModels enumerateObjectsUsingBlock:^(CCNewsPreviewCoreDataModel *coreDataModel, NSUInteger idx, BOOL * _Nonnull stop) {
            CCNewsPreviewViewModel *viewModel = [[CCNewsPreviewViewModel alloc] init];
            viewModel.title = coreDataModel.title;
            viewModel.imageURL = [NSURL URLWithString:coreDataModel.imageURL];
            viewModel.newsID = (NSUInteger)coreDataModel.newsID;
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
