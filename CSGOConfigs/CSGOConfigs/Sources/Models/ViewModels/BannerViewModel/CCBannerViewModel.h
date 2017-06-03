//
//  CCBannerViewModel.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 02.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CCBannerServerModel;
@class CCBannerCoreDataModel;

@interface CCBannerViewModel : NSObject

@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSInteger playerID;

@end

typedef void(^bannersDataBlock)(NSArray <CCBannerViewModel *> *banners);

@interface CCBannerViewModelBuilder : NSObject

+ (void)buildWithCoreDataModel:(NSArray <CCBannerCoreDataModel *> *)coreDataModel
                     viewModel:(bannersDataBlock)viewModel;

+ (void)buildWithServerModel:(NSArray <CCBannerServerModel *> *)serverModel
                   viewModel:(bannersDataBlock)viewModel;

@end
