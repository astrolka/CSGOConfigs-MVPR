//
//  CCNewsDescriptionViewModel.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>
@class CCNewsDescriptionServerModel;
@class CCNewsDescriptionCoreDataModel;
@class CCNewsContentViewModel;

@interface CCNewsDescriptionViewModel : NSObject

@property (nonatomic, assign) NSInteger newsID;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSURL *descriptionURL;

@property (nonatomic, strong) NSArray <CCNewsContentViewModel *> *content;

@end



typedef void(^newsDescriptionDataBlock)(CCNewsDescriptionViewModel *viewModel);

@interface CCNewsDescriptionViewModelBuilder : NSObject

+ (void)buildWithServerModels:(CCNewsDescriptionServerModel *)serverModels
                   viewModels:(newsDescriptionDataBlock)viewModels;

+ (void)buildWithCoreDataModels:(CCNewsDescriptionCoreDataModel *)coreDataModels
                     viewModels:(newsDescriptionDataBlock)viewModels;

@end
