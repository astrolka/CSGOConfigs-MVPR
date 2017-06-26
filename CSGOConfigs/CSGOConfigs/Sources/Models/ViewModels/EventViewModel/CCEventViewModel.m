//
//  CCEventViewModel.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCEventViewModel.h"
#import "CCEventServerModel.h"
#import "CCEventCoreDataModel+CoreDataProperties.h"

@implementation CCEventViewModel

@end



@implementation CCEventViewModelBuilder

#pragma mark - Public

+ (void)buildWithCoreDataModel:(NSArray <CCEventCoreDataModel *> *)coreDataModels
                     viewModel:(eventsDataBlock)viewModels {
    __block NSMutableArray <CCEventViewModel *> *viewModelsData = [[NSMutableArray alloc] init];
    
    const char *classNameChar = [NSStringFromClass([CCEventViewModelBuilder class]) UTF8String];
    dispatch_queue_t queue = dispatch_queue_create(classNameChar, DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        [coreDataModels enumerateObjectsUsingBlock:^(CCEventCoreDataModel *coreDataModel, NSUInteger idx, BOOL * _Nonnull stop) {
            CCEventViewModel *viewModel = [[CCEventViewModel alloc] init];
            viewModel.name = coreDataModel.name;
            viewModel.city = coreDataModel.city;
            viewModel.flagImageURL = [NSURL URLWithString:coreDataModel.flagImageURL];
            viewModel.desctiptionURL = [NSURL URLWithString:coreDataModel.descriptionURL];
            viewModel.date = [self generateStringWithBeginDate:coreDataModel.beginDate finishDate:coreDataModel.finishDate];
            viewModel.logoImageURL = [NSURL URLWithString:coreDataModel.logoImageURL];
            viewModel.prizePool = [NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"events.list.cell.prize_pool", nil), coreDataModel.prizePool];
            [viewModelsData addObject:viewModel];
        }];
    });
    
    dispatch_async(queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            viewModels(viewModelsData);
        });
    });
}

+ (void)buildWithServerModel:(NSArray <CCEventServerModel *> *)serverModels
                   viewModel:(eventsDataBlock)viewModels {
    __block NSMutableArray <CCEventViewModel *> *viewModelsData = [[NSMutableArray alloc] init];
    
    const char *classNameChar = [NSStringFromClass([CCEventViewModelBuilder class]) UTF8String];
    dispatch_queue_t queue = dispatch_queue_create(classNameChar, DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        [serverModels enumerateObjectsUsingBlock:^(CCEventServerModel *serverModel, NSUInteger idx, BOOL * _Nonnull stop) {
            CCEventViewModel *viewModel = [[CCEventViewModel alloc] init];
            viewModel.name = serverModel.name;
            viewModel.city = serverModel.city;
            viewModel.flagImageURL = serverModel.flagImageURL;
            viewModel.desctiptionURL = serverModel.desctiptionURL;
            viewModel.date = [self generateStringWithBeginDate:serverModel.beginDate finishDate:serverModel.finishDate];
            viewModel.logoImageURL = serverModel.logoImageURL;
            viewModel.prizePool = [NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"events.list.cell.prize_pool", nil), serverModel.prizePool];
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

+ (NSString *)generateStringWithBeginDate:(NSDate *)beginDate finishDate:(NSDate *)finishDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yyyy"];
    return [NSString stringWithFormat:@"%@: %@ - %@", NSLocalizedString(@"events.list.cell.date", nil), [dateFormatter stringFromDate:beginDate], [dateFormatter stringFromDate:finishDate]];
}

@end
