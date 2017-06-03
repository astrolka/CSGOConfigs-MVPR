//
//  CCBannerViewModel.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 02.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCBannerViewModel.h"
#import "CCBannerServerModel.h"
#import "CCBannerCoreDataModel+CoreDataProperties.h"
#import <CoreGraphics/CGBase.h>

@implementation CCBannerViewModel

@end

@implementation CCBannerViewModelBuilder

typedef NS_ENUM(NSInteger, DAYS) {
    OneDay = 1,
    TwoDays = 2,
    ThreeDays = 3,
    TwoWeaks = 14
};

#pragma mark - Public

+ (void)buildWithCoreDataModel:(NSArray <CCBannerCoreDataModel *> *)coreDataModel
                     viewModel:(bannersDataBlock)viewModel {
    __block NSMutableArray <CCBannerViewModel *> *viewModelsData = [[NSMutableArray alloc] init];
    
    const char *classNameChar = [NSStringFromClass([CCBannerViewModelBuilder class]) UTF8String];
    dispatch_queue_t queue = dispatch_queue_create(classNameChar, DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        [coreDataModel enumerateObjectsUsingBlock:^(CCBannerCoreDataModel *coreDataModel, NSUInteger idx, BOOL * _Nonnull stop) {
            CCBannerViewModel *viewModel = [[CCBannerViewModel alloc] init];
            viewModel.imageURL = [NSURL URLWithString:coreDataModel.imageURL];
            viewModel.playerID = (NSInteger)coreDataModel.playerID;
            viewModel.title = [CCBannerViewModelBuilder generateTitleFromDate:coreDataModel.updateData];
            [viewModelsData addObject:viewModel];
        }];
    });
    
    dispatch_async(queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            viewModel(viewModelsData);
        });
    });
}

+ (void)buildWithServerModel:(NSArray <CCBannerServerModel *> *)serverModel
                   viewModel:(bannersDataBlock)viewModel {
    __block NSMutableArray <CCBannerViewModel *> *viewModelsData = [[NSMutableArray alloc] init];
    
    const char *classNameChar = [NSStringFromClass([CCBannerViewModelBuilder class]) UTF8String];
    dispatch_queue_t queue = dispatch_queue_create(classNameChar, DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        [serverModel enumerateObjectsUsingBlock:^(CCBannerServerModel *serverModel, NSUInteger idx, BOOL * _Nonnull stop) {
            CCBannerViewModel *viewModel = [[CCBannerViewModel alloc] init];
            viewModel.imageURL = serverModel.imageURL;
            viewModel.playerID = (NSInteger)serverModel.playerID;
            viewModel.title = [CCBannerViewModelBuilder generateTitleFromDate:serverModel.updateDate];
            [viewModelsData addObject:viewModel];
        }];
    });
    
    dispatch_async(queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            viewModel(viewModelsData);
        });
    });
}

#pragma mark - Private

+ (NSString *)generateTitleFromDate:(NSDate *)date {
    static CGFloat kSecondsInDay = 86400;
    static NSInteger daysBetweenDates = 0;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yyyy"];
    NSTimeInterval secondsBetweenDates = [[NSDate date] timeIntervalSinceDate:date];
    daysBetweenDates = secondsBetweenDates / kSecondsInDay;
    
    switch (daysBetweenDates) {
        case OneDay:
            return NSLocalizedString(@"kTodayTitle", nil);
        case TwoDays:
            return NSLocalizedString(@"kYesterdayTitle", nil);
        case ThreeDays...TwoWeaks:
            return [NSString stringWithFormat:@"%ld %@",(long)daysBetweenDates, NSLocalizedString(@"kDaysAgoTitle", nil)];
        default:
            return [NSString stringWithFormat:@"%@ %@",[dateFormatter stringFromDate:date], NSLocalizedString(@"kWasUpdateCFGTitle", nil)];
    }
}


@end
