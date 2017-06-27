//
//  CCEventsService.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCEventsService.h"
#import "CCRestServiceProtocol.h"
#import "CCLocalStorageServiceProtocol.h"
#import "CCEventServerModel.h"
#import "CCEventCoreDataModel+CoreDataProperties.h"

@interface CCEventsService ()

@property (nonatomic, strong) id <CCRestServiceProtocol> ioc_restService;
@property (nonatomic, strong) id <CCLocalStorageServiceProtocol> ioc_localStorageService;

@end

@implementation CCEventsService

#pragma mark - CCEventsServiceProtocol

- (void)getEvents:(serviceEventsDataBlock)eventsBlock {
    [self.ioc_restService makeGETRequestWithURL:[NSURL URLWithString:@"eventsData.json"] onSucess:^(NSDictionary *eventsResponce) {
        NSArray <CCEventServerModel *> *serverModels = [self parseEventsResponce:eventsResponce[@"data"]];
        
        [self.ioc_localStorageService updateEvents:serverModels];
        
        [CCEventViewModelBuilder buildWithServerModel:serverModels viewModel:^(NSArray<CCEventViewModel *> *events) {
            [CCAnnotationEventViewModelBuildr buildWithServerModel:serverModels viewModel:^(NSArray<CCAnnotationEventViewModel *> *annotationEvents) {
                eventsBlock(events, annotationEvents, YES);
            }];
        }];
    } onFailure:^(NSError *error) {
        NSArray <CCEventCoreDataModel *> *coreDataModels = [self.ioc_localStorageService getEvents];
        
        [CCEventViewModelBuilder buildWithCoreDataModel:coreDataModels viewModel:^(NSArray<CCEventViewModel *> *events) {
            [CCAnnotationEventViewModelBuildr buildWithCoreDataModel:coreDataModels viewModel:^(NSArray<CCAnnotationEventViewModel *> *annotationEvents) {
                eventsBlock(events, annotationEvents, NO);
            }];
        }];
    }];
}

- (NSArray <CCEventServerModel *> *)parseEventsResponce:(NSArray *)responce {
    NSMutableArray <CCEventServerModel *> *serverModels = [[NSMutableArray alloc] init];
    [responce enumerateObjectsUsingBlock:^(NSDictionary *responce, NSUInteger idx, BOOL * _Nonnull stop) {
        CCEventServerModel *serverModel = [[CCEventServerModel alloc] initWithServerResponce:responce];
        [serverModels addObject:serverModel];
    }];
    return serverModels;
}

@end
