//
//  CCPlayerDescriptionViewModel.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 20.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayerDescriptionViewModel.h"
#import "CCPlayerDescriptionCoreDataModel+CoreDataProperties.h"
#import "CCPlayerPreviewCoreDataModel+CoreDataProperties.h"
#import "CCPlayerDescriptionServerModel.h"

@implementation CCPlayerDescriptionViewModel

@end

@implementation CCPlayerDescriptionViewModelBuilder

NSString * const kEmptyDataDisplay = @"";  // server can send empty string, so no need show texts like this: "Player name:" (no name)

+ (void)buildWithCoreDataModel:(CCPlayerDescriptionCoreDataModel *)coreDataModel
                     viewModel:(playerDataBlock)viewModelData {
    
    CCPlayerDescriptionViewModel *viewModel = [[CCPlayerDescriptionViewModel alloc] init];
    NSMutableArray *hardwareCharacterictics = [[NSMutableArray alloc] init];
    NSMutableArray *gameSettingCharacterictics = [[NSMutableArray alloc] init];
    
    const char * classNameChar = [NSStringFromClass([CCPlayerDescriptionViewModelBuilder class]) UTF8String];
    dispatch_queue_t queue = dispatch_queue_create(classNameChar, DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        viewModel.playerID = (NSInteger)coreDataModel.playerID;
        viewModel.name = [NSString stringWithFormat:@"%@ \"%@\" %@",coreDataModel.name, coreDataModel.previewRelationship.nickName, coreDataModel.surname];
        viewModel.profileImageURL = [NSURL URLWithString:coreDataModel.previewRelationship.imageURL];
        viewModel.moreInfoLink = [NSURL URLWithString:coreDataModel.moreInfoURL];
        
        viewModel.teamTitle = [NSString stringWithFormat:@"%@:",NSLocalizedString(@"", nil)];
        viewModel.teamName = coreDataModel.teamName;
        viewModel.temaImageLink = [NSURL URLWithString:coreDataModel.teamImageURL];
        
        viewModel.countryTitle = [NSString stringWithFormat:@"%@:",NSLocalizedString(@"", nil)];
        viewModel.country = coreDataModel.country;
        viewModel.flagImageURL = [NSURL URLWithString:coreDataModel.flagImageURL];
        
        viewModel.gameSettingsTitle = NSLocalizedString(@"", nil);
        if (![coreDataModel.mouse isEqualToString:kEmptyDataDisplay])
            [hardwareCharacterictics addObject:[NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"", nil), coreDataModel.mouse]];
        
        if (![coreDataModel.mousepad isEqualToString:kEmptyDataDisplay])
            [hardwareCharacterictics addObject:[NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"", nil), coreDataModel.mousepad]];
        
        if (![coreDataModel.monitor isEqualToString:kEmptyDataDisplay])
            [hardwareCharacterictics addObject:[NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"", nil), coreDataModel.monitor]];
        
        if (![coreDataModel.keyboard isEqualToString:kEmptyDataDisplay])
            [hardwareCharacterictics addObject:[NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"", nil), coreDataModel.keyboard]];
        
        if (![coreDataModel.headSet isEqualToString:kEmptyDataDisplay])
            [hardwareCharacterictics addObject:[NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"", nil), coreDataModel.headSet]];
        
        if (![coreDataModel.mouse isEqualToString:kEmptyDataDisplay])
            viewModel.hardwareCharacterictics = [NSArray arrayWithArray:hardwareCharacterictics];
        
        viewModel.hardwareTitle = NSLocalizedString(@"",nil);
        if (![coreDataModel.effectiveDPI isEqualToString:kEmptyDataDisplay])
            [gameSettingCharacterictics addObject:[NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"", nil), coreDataModel.effectiveDPI]];
        
        if (![coreDataModel.gameResolution isEqualToString:kEmptyDataDisplay])
            [gameSettingCharacterictics addObject:[NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"", nil), coreDataModel.gameResolution]];
        
        if (![coreDataModel.windowsSensitivity isEqualToString:kEmptyDataDisplay])
            [gameSettingCharacterictics addObject:[NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"", nil), coreDataModel.windowsSensitivity]];
        
        if (![coreDataModel.pollingRate isEqualToString:kEmptyDataDisplay])
            [gameSettingCharacterictics addObject:[NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"", nil), coreDataModel.pollingRate]];
        viewModel.gameSettingCharacterictics = [NSArray arrayWithArray:gameSettingCharacterictics];
        
        viewModel.moreInfoTitle = NSLocalizedString(@"", nil);
        viewModel.downloadTitle = NSLocalizedString(@"",nil);
        viewModel.downloadURL = [NSURL URLWithString:coreDataModel.downloadURL];
    });
    
    dispatch_async(queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            viewModelData(viewModel);
        });
    });
}

+ (void)buildWithServerModel:(CCPlayerDescriptionServerModel *)serverModel
                   viewModel:(playerDataBlock)viewModelData {
    
    CCPlayerDescriptionViewModel *viewModel = [[CCPlayerDescriptionViewModel alloc] init];
    NSMutableArray *hardwareCharacterictics = [[NSMutableArray alloc] init];
    NSMutableArray *gameSettingCharacterictics = [[NSMutableArray alloc] init];
    
    const char * classNameChar = [NSStringFromClass([CCPlayerDescriptionViewModelBuilder class]) UTF8String];
    dispatch_queue_t queue = dispatch_queue_create(classNameChar, DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        viewModel.playerID = serverModel.playerID;
        viewModel.name = [NSString stringWithFormat:@"%@ \"%@\" %@",serverModel.name, serverModel.nickName, serverModel.surname];
        viewModel.profileImageURL = serverModel.profileImageURL;
        viewModel.moreInfoLink = serverModel.moreInfoURL;
        
        viewModel.teamTitle = [NSString stringWithFormat:@"%@:",NSLocalizedString(@"", nil)];
        viewModel.teamName = serverModel.teamName;
        viewModel.temaImageLink = serverModel.teamImageURL;
        
        viewModel.countryTitle = [NSString stringWithFormat:@"%@:",NSLocalizedString(@"", nil)];
        viewModel.country = serverModel.country;
        viewModel.flagImageURL = serverModel.flagImageURL;
        
        viewModel.gameSettingsTitle = NSLocalizedString(@"", nil);
        if (![serverModel.mouse isEqualToString:kEmptyDataDisplay])
            [hardwareCharacterictics addObject:[NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"", nil), serverModel.mouse]];
        
        if (![serverModel.mousepad isEqualToString:kEmptyDataDisplay])
            [hardwareCharacterictics addObject:[NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"", nil), serverModel.mousepad]];
        
        if (![serverModel.monitor isEqualToString:kEmptyDataDisplay])
            [hardwareCharacterictics addObject:[NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"", nil), serverModel.monitor]];
        
        if (![serverModel.keyboard isEqualToString:kEmptyDataDisplay])
            [hardwareCharacterictics addObject:[NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"", nil), serverModel.keyboard]];
        
        if (![serverModel.headSet isEqualToString:kEmptyDataDisplay])
            [hardwareCharacterictics addObject:[NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"", nil), serverModel.headSet]];
        
        if (![serverModel.mouse isEqualToString:kEmptyDataDisplay])
            viewModel.hardwareCharacterictics = [NSArray arrayWithArray:hardwareCharacterictics];
        
        viewModel.hardwareTitle = NSLocalizedString(@"",nil);
        if (![serverModel.effectiveDPI isEqualToString:kEmptyDataDisplay])
            [gameSettingCharacterictics addObject:[NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"", nil), serverModel.effectiveDPI]];
        
        if (![serverModel.gameResolution isEqualToString:kEmptyDataDisplay])
            [gameSettingCharacterictics addObject:[NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"", nil), serverModel.gameResolution]];
        
        if (![serverModel.windowsSensitivity isEqualToString:kEmptyDataDisplay])
            [gameSettingCharacterictics addObject:[NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"", nil), serverModel.windowsSensitivity]];
        
        if (![serverModel.pollingRate isEqualToString:kEmptyDataDisplay])
            [gameSettingCharacterictics addObject:[NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"", nil), serverModel.pollingRate]];
        viewModel.gameSettingCharacterictics = [NSArray arrayWithArray:gameSettingCharacterictics];
        
        viewModel.moreInfoTitle = NSLocalizedString(@"", nil);
        viewModel.downloadTitle = NSLocalizedString(@"",nil);
        viewModel.downloadURL = serverModel.downloadURL;
    });
    
    dispatch_async(queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            viewModelData(viewModel);
        });
    });
}

@end
