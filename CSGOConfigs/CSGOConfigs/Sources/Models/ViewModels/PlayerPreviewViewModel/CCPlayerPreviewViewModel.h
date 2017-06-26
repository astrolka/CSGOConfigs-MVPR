//
//  CCPlayerPreviewViewModel.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>
@class CCPlayerPreviewCoreDataModel;
@class CCPlayerPreviewServerModel;

@interface CCPlayerPreviewViewModel : NSObject

@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, assign) NSInteger playerID;
@property (nonatomic, assign) CGFloat imageHeight;

@end



typedef void(^playersDataBlock)(NSArray <CCPlayerPreviewViewModel *> *players);

@interface CCPlayerPreviewViewModelBuilder : NSObject

+ (void)buildWithServerModels:(NSArray <CCPlayerPreviewServerModel *> *)serverModels
               containerWidth:(CGFloat)containerWidth
                   viewModels:(playersDataBlock)viewModels;

+ (void)buildWithCoreDataModels:(NSArray <CCPlayerPreviewCoreDataModel *> *)coreDataModels
                 containerWidth:(CGFloat)containerWidth
                     viewModels:(playersDataBlock)viewModels;

@end


