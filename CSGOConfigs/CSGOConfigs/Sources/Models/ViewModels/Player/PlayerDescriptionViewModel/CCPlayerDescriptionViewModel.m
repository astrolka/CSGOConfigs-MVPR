//
//  CCPlayerDescriptionViewModel.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 20.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayerDescriptionViewModel.h"
#import "CCPlayerDescriptionCoreDataModel+CoreDataProperties.h"
#import "CCPlayerPreviewCoreDataModel+CoreDataProperties.h"
#import "CCPlayerDescriptionServerModel.h"

@implementation CCPlayerDescriptionViewModel

@end

@implementation CCPlayerDescriptionViewModelBuilder

NSString *const kEmptyDataDisplay = @"";  // server can send empty string, so no need to show them ("Name:")

+ (void)buildWithCoreDataModel:(CCPlayerDescriptionCoreDataModel *)coreDataModel
                     viewModel:(playerDataBlock)viewModelData {
    CCPlayerDescriptionViewModel *viewModel = [[CCPlayerDescriptionViewModel alloc] init];
    NSMutableArray *hardwareCharacterictics = [[NSMutableArray alloc] init];
    NSMutableArray *gameSettingCharacterictics = [[NSMutableArray alloc] init];
    
    const char *classNameChar = [NSStringFromClass([CCPlayerDescriptionViewModelBuilder class]) UTF8String];
    dispatch_queue_t queue = dispatch_queue_create(classNameChar, DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        viewModel.playerID = (NSInteger)coreDataModel.playerID;
        viewModel.name = [NSString stringWithFormat:@"%@ \"%@\" %@",coreDataModel.name, coreDataModel.previewRelationship.nickName, coreDataModel.surname];
        viewModel.profileImageURL = [NSURL URLWithString:coreDataModel.previewRelationship.imageURL];
        viewModel.descriptionURL = [NSURL URLWithString:coreDataModel.moreInfoURL];
        
        viewModel.teamName = coreDataModel.teamName;
        viewModel.temaImageURL = [NSURL URLWithString:coreDataModel.teamImageURL];
        
        viewModel.country = coreDataModel.country;
        viewModel.countryImageURL = [NSURL URLWithString:coreDataModel.flagImageURL];
        
        if (![coreDataModel.mouse isEqualToString:kEmptyDataDisplay])
            [hardwareCharacterictics addObject:[NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"", nil), coreDataModel.mouse]];
        
        if (![coreDataModel.mousepad isEqualToString:kEmptyDataDisplay])
            [hardwareCharacterictics addObject:[NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"", nil), coreDataModel.mousepad]];
        
        if (![coreDataModel.monitor isEqualToString:kEmptyDataDisplay])
            [hardwareCharacterictics addObject:[NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"", nil), coreDataModel.monitor]];
        
        if (![coreDataModel.keyboard isEqualToString:kEmptyDataDisplay])
            [hardwareCharacterictics addObject:[NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"", nil), coreDataModel.keyboard]];
        
        if (![coreDataModel.headSet isEqualToString:kEmptyDataDisplay])
            [hardwareCharacterictics addObject:[NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"", nil), coreDataModel.headSet]];
        
        if (![coreDataModel.mouse isEqualToString:kEmptyDataDisplay])
            viewModel.hardwareCharacterictics = [NSArray arrayWithArray:hardwareCharacterictics];
        
        if (![coreDataModel.effectiveDPI isEqualToString:kEmptyDataDisplay])
            [gameSettingCharacterictics addObject:[NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"", nil), coreDataModel.effectiveDPI]];
        
        if (![coreDataModel.gameResolution isEqualToString:kEmptyDataDisplay])
            [gameSettingCharacterictics addObject:[NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"", nil), coreDataModel.gameResolution]];
        
        if (![coreDataModel.windowsSensitivity isEqualToString:kEmptyDataDisplay])
            [gameSettingCharacterictics addObject:[NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"", nil), coreDataModel.windowsSensitivity]];
        
        if (![coreDataModel.pollingRate isEqualToString:kEmptyDataDisplay])
            [gameSettingCharacterictics addObject:[NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"", nil), coreDataModel.pollingRate]];
        viewModel.gameSettingCharacterictics = [NSArray arrayWithArray:gameSettingCharacterictics];
        
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
    
    const char *classNameChar = [NSStringFromClass([CCPlayerDescriptionViewModelBuilder class]) UTF8String];
    dispatch_queue_t queue = dispatch_queue_create(classNameChar, DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        viewModel.playerID = serverModel.playerID;
        viewModel.name = [NSString stringWithFormat:@"%@ \"%@\" %@",serverModel.name, serverModel.nickName, serverModel.surname];
        viewModel.profileImageURL = serverModel.profileImageURL;
        viewModel.descriptionURL = serverModel.moreInfoURL;
        
        viewModel.teamName = serverModel.teamName;
        viewModel.temaImageURL = serverModel.teamImageURL;
        
        viewModel.country = serverModel.country;
        viewModel.countryImageURL = serverModel.flagImageURL;
        
        if (![serverModel.mouse isEqualToString:kEmptyDataDisplay])
            [hardwareCharacterictics addObject:[NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"", nil), serverModel.mouse]];
        
        if (![serverModel.mousepad isEqualToString:kEmptyDataDisplay])
            [hardwareCharacterictics addObject:[NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"", nil), serverModel.mousepad]];
        
        if (![serverModel.monitor isEqualToString:kEmptyDataDisplay])
            [hardwareCharacterictics addObject:[NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"", nil), serverModel.monitor]];
        
        if (![serverModel.keyboard isEqualToString:kEmptyDataDisplay])
            [hardwareCharacterictics addObject:[NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"", nil), serverModel.keyboard]];
        
        if (![serverModel.headSet isEqualToString:kEmptyDataDisplay])
            [hardwareCharacterictics addObject:[NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"", nil), serverModel.headSet]];
        
        if (![serverModel.mouse isEqualToString:kEmptyDataDisplay])
            viewModel.hardwareCharacterictics = [NSArray arrayWithArray:hardwareCharacterictics];
        
        if (![serverModel.effectiveDPI isEqualToString:kEmptyDataDisplay])
            [gameSettingCharacterictics addObject:[NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"", nil), serverModel.effectiveDPI]];
        
        if (![serverModel.gameResolution isEqualToString:kEmptyDataDisplay])
            [gameSettingCharacterictics addObject:[NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"", nil), serverModel.gameResolution]];
        
        if (![serverModel.windowsSensitivity isEqualToString:kEmptyDataDisplay])
            [gameSettingCharacterictics addObject:[NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"", nil), serverModel.windowsSensitivity]];
        
        if (![serverModel.pollingRate isEqualToString:kEmptyDataDisplay])
            [gameSettingCharacterictics addObject:[NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"", nil), serverModel.pollingRate]];
        viewModel.gameSettingCharacterictics = [NSArray arrayWithArray:gameSettingCharacterictics];
        
        viewModel.downloadURL = serverModel.downloadURL;
    });
    
    dispatch_async(queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            viewModelData(viewModel);
        });
    });
}

@end
