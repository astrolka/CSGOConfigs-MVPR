//
//  CCNewsImageContentViewModel.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 19.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsImageContentViewModel.h"
#import <UIKit/UIScreen.h>
#import "CCNewsDescriptionContentServerModel.h"
#import "CCNewDescriptionContentCoreDataModel+CoreDataProperties.h"

@implementation CCNewsImageContentViewModel

@end

// Image always comes with this resoulution
static CGFloat const kServerImageHeight = 533.f;
static CGFloat const kServerImageWidth = 800.f;


@implementation CCNewsImageContentViewModelBuilder

+ (CCNewsImageContentViewModel *)buildWithServerModel:(CCNewsDescriptionContentServerModel *)serverModel {
    CCNewsImageContentViewModel *viewModel = [[CCNewsImageContentViewModel alloc] init];
    viewModel.coverImageURL = serverModel.coverImageURL;
    viewModel.contentHeight = ([UIScreen mainScreen].bounds.size.width * kServerImageHeight) / kServerImageWidth; // better send view width as param
    return viewModel;
}

+ (CCNewsImageContentViewModel *)buildWithCoreDataModel:(CCNewDescriptionContentCoreDataModel *)coreDataModel {
    CCNewsImageContentViewModel *viewModel = [[CCNewsImageContentViewModel alloc] init];
    viewModel.coverImageURL = [NSURL URLWithString:coreDataModel.coverImageURL];
    viewModel.contentHeight = ([UIScreen mainScreen].bounds.size.width * kServerImageHeight) / kServerImageWidth; // better send view width as param
    return viewModel;
}

@end
