//
//  CCNewsTextContentViewModel.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 19.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsContentViewModel.h"
#import <CoreGraphics/CGBase.h>
@class CCNewsDescriptionContentServerModel;
@class CCNewDescriptionContentCoreDataModel;

@interface CCNewsTextContentViewModel : CCNewsContentViewModel

@property (nonatomic, strong) NSString *text;

@end



@interface CCNewsTextContentViewModelBuilder : NSObject

+ (CCNewsTextContentViewModel *)buildWithServerModel:(CCNewsDescriptionContentServerModel *)serverModel;

+ (CCNewsTextContentViewModel *)buildWithCoreDataModel:(CCNewDescriptionContentCoreDataModel *)coreDataModel;

@end
