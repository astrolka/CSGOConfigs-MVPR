//
//  CCNewsDescriptionViewModel.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsDescriptionViewModel.h"
#import "CCNewsDescriptionServerModel.h"
#import "CCNewsDescriptionCoreDataModel+CoreDataProperties.h"
#import "CCNewDescriptionContentCoreDataModel+CoreDataProperties.h"
#import "CCNewsContentViewModel.h"
#import "CCNewsTextContentViewModel.h"
#import "CCNewsImageContentViewModel.h"

@implementation CCNewsDescriptionViewModel

@end



@implementation CCNewsDescriptionViewModelBuilder

#pragma mark - Public

+ (void)buildWithServerModels:(CCNewsDescriptionServerModel *)serverModel
                   viewModels:(newsDescriptionDataBlock)viewModel {
    __block CCNewsDescriptionViewModel *newsViewModel = [[CCNewsDescriptionViewModel alloc] init];
    
    const char *classNameChar = [NSStringFromClass([CCNewsDescriptionViewModelBuilder class]) UTF8String];
    dispatch_queue_t queue = dispatch_queue_create(classNameChar, DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        newsViewModel.newsID = serverModel.newsID;
        newsViewModel.subtitle = serverModel.subtitle;
        newsViewModel.author = [NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"", nil), serverModel.author];
        newsViewModel.descriptionURL = serverModel.descriptionURL;
        newsViewModel.date = [self dateStringFromDate:serverModel.date];
        
        // content
        NSMutableArray <CCNewsContentViewModel *> *contentViewModels = [[NSMutableArray alloc] init];
        [serverModel.content enumerateObjectsUsingBlock:^(CCNewsDescriptionContentServerModel *serverModel, NSUInteger idx, BOOL * _Nonnull stop) {
            
            // TODO: Make wrap NSEnum content type (can't do it now, cuz wrong responce)
            if (serverModel.isImage) {
                [contentViewModels addObject:[CCNewsImageContentViewModelBuilder buildWithServerModel:serverModel]];
            } else {
                [contentViewModels addObject:[CCNewsTextContentViewModelBuilder buildWithServerModel:serverModel]];
            }
        }];
        newsViewModel.content = contentViewModels;
    });
    
    dispatch_async(queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            viewModel(newsViewModel);
        });
    });
}

+ (void)buildWithCoreDataModels:(CCNewsDescriptionCoreDataModel *)coreDataModels
                     viewModels:(newsDescriptionDataBlock)viewModel {
    __block CCNewsDescriptionViewModel *newsViewModel = [[CCNewsDescriptionViewModel alloc] init];
    
    const char *classNameChar = [NSStringFromClass([CCNewsDescriptionViewModelBuilder class]) UTF8String];
    dispatch_queue_t queue = dispatch_queue_create(classNameChar, DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        newsViewModel.newsID = (NSInteger)coreDataModels.newsID;
        newsViewModel.subtitle = coreDataModels.subtitle;
        newsViewModel.author = [NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"", nil), coreDataModels.author];
        newsViewModel.descriptionURL = [NSURL URLWithString:coreDataModels.descriptionURL];
        newsViewModel.date = [self dateStringFromDate:coreDataModels.date];
        
        // content
        NSMutableArray <CCNewsContentViewModel *> *contentViewModels = [[NSMutableArray alloc] init];
        [coreDataModels.contentNewsRelationship enumerateObjectsUsingBlock:^(CCNewDescriptionContentCoreDataModel *coreDataModel, BOOL * _Nonnull stop) {

            // TODO: Make wrap NSEnum content type (can't do it now, cuz wrong responce)
            if (coreDataModel.isImage) {
                [contentViewModels addObject:[CCNewsImageContentViewModelBuilder buildWithCoreDataModel:coreDataModel]];
            } else {
                [contentViewModels addObject:[CCNewsTextContentViewModelBuilder buildWithCoreDataModel:coreDataModel]];
            }
        }];
        newsViewModel.content = contentViewModels;
    });
    
    dispatch_async(queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            viewModel(newsViewModel);
        });
    });
}

#pragma mark - Private

+ (NSString *)dateStringFromDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yyyy"];
    return [NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"", nil), [dateFormatter stringFromDate:date]];
}

@end
