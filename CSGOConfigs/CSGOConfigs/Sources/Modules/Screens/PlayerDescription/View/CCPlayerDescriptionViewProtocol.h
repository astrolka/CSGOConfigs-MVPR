//
//  CCPlayerDescriptionViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 11.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCSpinerViewProtocol.h"
#import "CCMessageViewProtocol.h"
@class CCPlayerDescriptionViewModel;
@protocol CCPlayerDescriptionViewProtocol;

typedef NS_ENUM(NSInteger, PlayerInfoSectionType) {
    PlayerInfoSectionTypePersonalInformation,
    PlayerInfoSectionTypeHardwareInformation,
    PlayerInfoSectionTypeSettingsInformation,
    PlayerInfoSectionTypeDownloadCFG
};

@protocol CCPlayerDescriptionViewActionProtocol <NSObject>

- (void)playersPreviewViewDidSet:(id <CCPlayerDescriptionViewProtocol>)view;

- (void)playersPreviewViewDidPressLoadCFGButton:(id <CCPlayerDescriptionViewProtocol>)view;

- (void)playersPreviewViewDidPressFavoritePlayerButton:(id <CCPlayerDescriptionViewProtocol>)view;

- (void)playersPreviewViewDidPressMoreInfoButton:(id <CCPlayerDescriptionViewProtocol>)view;

- (void)playersPreviewView:(id <CCPlayerDescriptionViewProtocol>)view didSelectSection:(PlayerInfoSectionType)playerInfoSectionType;

@end

@protocol CCPlayerDescriptionViewProtocol <CCSpinerViewProtocol, CCMessageViewProtocol>

@property (nonatomic, strong) id <CCPlayerDescriptionViewActionProtocol> viewAction;

@property (nonatomic, assign) BOOL hardwareSectionIsOpen;
@property (nonatomic, assign) BOOL gameSectionIsOpen;

- (void)updatePlayerFavoriteStatus:(BOOL)favorite;

- (void)showPlayerInfo:(CCPlayerDescriptionViewModel *)playerDescriptionViewModel;

- (void)updateOpenSections;

@end


