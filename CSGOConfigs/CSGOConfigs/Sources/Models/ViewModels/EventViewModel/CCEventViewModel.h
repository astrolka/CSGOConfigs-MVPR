//
//  CCEventViewModel.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CCEventCoreDataModel;
@class CCEventServerModel;

@interface CCEventViewModel : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSURL *flagImageURL;
@property (strong, nonatomic) NSURL *desctiptionURL;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSURL *logoImageURL;
@property (strong, nonatomic) NSString *prizePool;

@end



typedef void(^eventsDataBlock)(NSArray <CCEventViewModel *> *events);

@interface CCEventViewModelBuilder : NSObject

+ (void)buildWithCoreDataModel:(NSArray <CCEventCoreDataModel *> *)coreDataModels
                     viewModel:(eventsDataBlock)viewModel;

+ (void)buildWithServerModel:(NSArray <CCEventServerModel *> *)serverModels
                   viewModel:(eventsDataBlock)viewModel;

@end
