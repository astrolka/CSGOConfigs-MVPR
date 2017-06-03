//
//  CCPlayerPreviewViewModel.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayerPreviewViewModel.h"
#import "CCPlayerPreviewServerModel.h"
#import "CCPlayerPreviewCoreDataModel+CoreDataProperties.h"

@implementation CCPlayerPreviewViewModel

@end

NSString * const kPlayerPreviewImageSizeSeparateChar = @"x";  // responce format: "320x640"

@implementation CCPlayerPreviewViewModelBuilder

#pragma mark - Public

+ (void)buildWithServerModels:(NSArray <CCPlayerPreviewServerModel *> *)serverModels
               containerWidth:(CGFloat)containerWidth
                   viewModels:(playersDataBlock)viewModels {
    __block NSMutableArray <CCPlayerPreviewViewModel *> *viewModelsData = [[NSMutableArray alloc] init];
    
    const char *classNameChar = [NSStringFromClass([CCPlayerPreviewViewModelBuilder class]) UTF8String];
    dispatch_queue_t queue = dispatch_queue_create(classNameChar, DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        [serverModels enumerateObjectsUsingBlock:^(CCPlayerPreviewServerModel *serverModel, NSUInteger idx, BOOL * _Nonnull stop) {
            CCPlayerPreviewViewModel *viewModel = [[CCPlayerPreviewViewModel alloc]init];
            viewModel.nickName = serverModel.nickName;
            viewModel.imageURL = serverModel.imageURL;
            viewModel.playerID = serverModel.playerID;
            viewModel.imageHeight = [self calculateImageHeightForImageSize:serverModel.imageSize containerWidth:containerWidth];
            [viewModelsData addObject:viewModel];
        }];
    });
    
    dispatch_async(queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            viewModels(viewModelsData);
        });
    });
}

+ (void)buildWithCoreDataModels:(NSArray <CCPlayerPreviewCoreDataModel *> *)coreDataModels
                 containerWidth:(CGFloat)containerWidth
                     viewModels:(playersDataBlock)viewModels {
    __block NSMutableArray <CCPlayerPreviewViewModel *> *viewModelsData = [[NSMutableArray alloc] init];
    
    const char *classNameChar = [NSStringFromClass([CCPlayerPreviewViewModelBuilder class]) UTF8String];
    dispatch_queue_t queue = dispatch_queue_create(classNameChar, DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        [coreDataModels enumerateObjectsUsingBlock:^(CCPlayerPreviewCoreDataModel *coreDataModel, NSUInteger idx, BOOL * _Nonnull stop) {
            CCPlayerPreviewViewModel *viewModel = [[CCPlayerPreviewViewModel alloc]init];
            viewModel.nickName = coreDataModel.nickName;
            viewModel.imageURL = [NSURL URLWithString:coreDataModel.imageURL];
            viewModel.playerID = (NSInteger)coreDataModel.playerID;
            viewModel.imageHeight = [self calculateImageHeightForImageSize:coreDataModel.imageSize containerWidth:containerWidth];
            [viewModelsData addObject:viewModel];
        }];
    });
    
    dispatch_async(queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            viewModels(viewModelsData);
        });
    });
}

#pragma mark - Private

+ (CGFloat)calculateImageHeightForImageSize:(NSString *)imageSize containerWidth:(CGFloat)containerWidth {
    NSArray *separateImageSizeArray = [imageSize componentsSeparatedByString:kPlayerPreviewImageSizeSeparateChar];
    NSString *serverImageHeightStr = [separateImageSizeArray lastObject];
    NSString *serverImageWidthStr = [separateImageSizeArray firstObject];
    if (!serverImageHeightStr) {
        return 0.f;
    } else {
        return (serverImageHeightStr.floatValue * containerWidth) / serverImageWidthStr.floatValue;
    }
}

@end
