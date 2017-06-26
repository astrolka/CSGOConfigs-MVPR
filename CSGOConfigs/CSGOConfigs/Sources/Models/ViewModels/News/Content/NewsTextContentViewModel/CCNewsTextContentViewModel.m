//
//  CCNewsTextContentViewModel.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 19.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsTextContentViewModel.h"
#import "CCNewsDescriptionContentServerModel.h"
#import "CCNewDescriptionContentCoreDataModel+CoreDataProperties.h"

@implementation CCNewsTextContentViewModel

@end



@implementation CCNewsTextContentViewModelBuilder

+ (CCNewsTextContentViewModel *)buildWithServerModel:(CCNewsDescriptionContentServerModel *)serverModel {
    CCNewsTextContentViewModel *viewModel = [[CCNewsTextContentViewModel alloc] init];
    viewModel.text = serverModel.text;
    return viewModel;
}

+ (CCNewsTextContentViewModel *)buildWithCoreDataModel:(CCNewDescriptionContentCoreDataModel *)coreDataModel {
    CCNewsTextContentViewModel *viewModel = [[CCNewsTextContentViewModel alloc] init];
    viewModel.text = coreDataModel.text;
    return viewModel;
}

@end
