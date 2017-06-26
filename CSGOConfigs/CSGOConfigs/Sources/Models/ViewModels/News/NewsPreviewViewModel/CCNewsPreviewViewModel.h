//
//  CCNewsPreviewViewModel.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CCNewsPreviewCoreDataModel;
@class CCNewsPreviewServerModel;
@class CCNewsPreviewViewModel;

@interface CCNewsPreviewViewModel : NSObject

@property (nonatomic, assign) NSUInteger newsID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSURL *imageURL;

@end



typedef void(^viewModelDataBlock)(NSArray <CCNewsPreviewViewModel *> *news);

@interface CCNewsPreviewViewModelBuilder : NSObject

+ (void)buildWithServerModels:(NSArray <CCNewsPreviewServerModel *> *)serverModels
                   viewModels:(viewModelDataBlock)viewModels;

+ (void)buildWithCoreDataModels:(NSArray <CCNewsPreviewCoreDataModel *> *)coreDataModels
                     viewModels:(viewModelDataBlock)viewModels;

@end
