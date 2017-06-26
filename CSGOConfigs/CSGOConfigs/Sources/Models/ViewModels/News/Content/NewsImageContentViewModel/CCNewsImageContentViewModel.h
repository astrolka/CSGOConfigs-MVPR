//
//  CCNewsImageContentViewModel.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 19.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsContentViewModel.h"
#import <CoreGraphics/CGBase.h>
@class CCNewsDescriptionContentServerModel;
@class CCNewDescriptionContentCoreDataModel;

@interface CCNewsImageContentViewModel : CCNewsContentViewModel

@property (nonatomic, strong) NSURL *coverImageURL;
@property (nonatomic, assign) CGFloat contentHeight;

@end



@interface CCNewsImageContentViewModelBuilder : NSObject

+ (CCNewsImageContentViewModel *)buildWithServerModel:(CCNewsDescriptionContentServerModel *)serverModel;

+ (CCNewsImageContentViewModel *)buildWithCoreDataModel:(CCNewDescriptionContentCoreDataModel *)coreDataModel;

@end
