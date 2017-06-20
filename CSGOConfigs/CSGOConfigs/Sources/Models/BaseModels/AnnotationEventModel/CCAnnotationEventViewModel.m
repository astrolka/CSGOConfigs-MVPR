//
//  CCAnnotationEventViewModel.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCAnnotationEventViewModel.h"
#import "CCEventCoreDataModel+CoreDataProperties.h"
#import "CCEventServerModel.h"

@implementation CCAnnotationEventViewModel

@end



@implementation CCAnnotationEventViewModelBuildr

+ (void)buildWithCoreDataModel:(NSArray <CCEventCoreDataModel *> *)coreDataModels
                     viewModel:(annotationEventsDataBlock)viewModels {
    __block NSMutableArray <CCAnnotationEventViewModel *> *viewModelsData = [[NSMutableArray alloc] init];
    
    const char *classNameChar = [NSStringFromClass([CCAnnotationEventViewModelBuildr class]) UTF8String];
    dispatch_queue_t queue = dispatch_queue_create(classNameChar, DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        [coreDataModels enumerateObjectsUsingBlock:^(CCEventCoreDataModel *coreDataModel, NSUInteger idx, BOOL * _Nonnull stop) {
            CCAnnotationEventViewModel *viewModel = [[CCAnnotationEventViewModel alloc] init];
            viewModel.coordinate = CLLocationCoordinate2DMake(coreDataModel.lat, coreDataModel.lng);
            viewModel.title = coreDataModel.name;
            viewModel.subtitle = [NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"", nil), coreDataModel.city];
            viewModel.desctiptionURL = [NSURL URLWithString:coreDataModel.descriptionURL];
            viewModel.logoImageURL = [NSURL URLWithString:coreDataModel.logoImageURL];
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
                   viewModel:(annotationEventsDataBlock)viewModels {
    __block NSMutableArray <CCAnnotationEventViewModel *> *viewModelsData = [[NSMutableArray alloc] init];
    
    const char *classNameChar = [NSStringFromClass([CCAnnotationEventViewModelBuildr class]) UTF8String];
    dispatch_queue_t queue = dispatch_queue_create(classNameChar, DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        [serverModels enumerateObjectsUsingBlock:^(CCEventServerModel *serverModel, NSUInteger idx, BOOL * _Nonnull stop) {
            CCAnnotationEventViewModel *viewModel = [[CCAnnotationEventViewModel alloc] init];
            viewModel.coordinate = CLLocationCoordinate2DMake(serverModel.lat, serverModel.lng);
            viewModel.title = serverModel.name;
            viewModel.subtitle = [NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"", nil), serverModel.city];
            viewModel.desctiptionURL = serverModel.desctiptionURL;
            viewModel.logoImageURL = serverModel.logoImageURL;
            [viewModelsData addObject:viewModel];
        }];
    });
    
    dispatch_async(queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            viewModels(viewModelsData);
        });
    });
}

@end
