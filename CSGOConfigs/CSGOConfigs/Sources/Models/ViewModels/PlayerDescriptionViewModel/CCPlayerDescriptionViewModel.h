//
//  CCPlayerDescriptionViewModel.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 20.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>
@class CCPlayerDescriptionCoreDataModel;
@class CCPlayerDescriptionServerModel;

@interface CCPlayerDescriptionViewModel : NSObject

@property (nonatomic, assign) NSInteger playerID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSURL *profileImageURL;

@property (nonatomic, strong) NSString *teamTitle;
@property (nonatomic, strong) NSString *teamName;
@property (nonatomic, strong) NSURL *temaImageLink;

@property (nonatomic, strong) NSString *countryTitle;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSURL *flagImageURL;

@property (nonatomic, strong) NSString *moreInfoTitle;
@property (nonatomic, strong) NSURL *moreInfoLink;

@property (nonatomic, strong) NSString *hardwareTitle;
@property (nonatomic, strong) NSArray <NSString *> *hardwareCharacterictics;

@property (nonatomic, strong) NSString *gameSettingsTitle;
@property (nonatomic, strong) NSArray <NSString *> *gameSettingCharacterictics;

@property (nonatomic, strong) NSString *downloadTitle;
@property (nonatomic, strong) NSURL *downloadURL;

@end

typedef void(^playerDataBlock)(CCPlayerDescriptionViewModel *player);

@interface CCPlayerDescriptionViewModelBuilder : NSObject

+ (void)buildWithCoreDataModel:(CCPlayerDescriptionCoreDataModel *)coreDataModel
                     viewModel:(playerDataBlock)viewModel;

+ (void)buildWithServerModel:(CCPlayerDescriptionServerModel *)serverModel
                   viewModel:(playerDataBlock)viewModel;

@end
