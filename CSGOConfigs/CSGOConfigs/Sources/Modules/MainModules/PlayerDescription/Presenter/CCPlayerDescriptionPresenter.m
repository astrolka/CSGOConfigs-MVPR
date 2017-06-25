//
//  CCPlayerDescriptionPresenter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 11.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayerDescriptionPresenter.h"
#import "CCPlayerDescriptionViewProtocol.h"
#import "CCPlayerDescriptionRouterProtocol.h"
#import "CCPlayersServiceProtocol.h"
#import "CCLocalStorageServiceProtocol.h"
#import "CCPlayerDescriptionViewModel.h"
#import "CCEmailInfoFactory.h"
#import "CCViewModelAlert.h"
#import "CCOpenURLServiceProtocol.h"

@interface CCPlayerDescriptionPresenter () <CCPlayerDescriptionViewActionProtocol>

@property (nonatomic, strong) id <CCOpenURLServiceProtocol> ioc_openURLService;
@property (nonatomic, strong) id <CCPlayersServiceProtocol> ioc_playersService;
@property (nonatomic, strong) id <CCLocalStorageServiceProtocol> ioc_localStorageService;

@property (nonatomic, strong) id <CCPlayerDescriptionViewProtocol> view;
@property (nonatomic, strong) id <CCPlayerDescriptionRouterProtocol> router;

@property (nonatomic, strong) CCPlayerDescriptionViewModel *playerDescriptionViewModel;

@property (nonatomic, assign) BOOL playerIsFavorite;
@property (nonatomic, assign) NSUInteger playerID;

@end

@implementation CCPlayerDescriptionPresenter

- (instancetype)initWithView:(id <CCPlayerDescriptionViewProtocol>)view router:(id <CCPlayerDescriptionRouterProtocol>)router playerID:(NSUInteger)playerID {
    self = [super init];
    if (self) {
        self.playerID = playerID;
        self.router = router;
        self.view = view;
        self.view.viewAction = self;
    }
    return self;
}

#pragma mark - CCPlayerDescriptionViewActionProtocol

- (void)playersPreviewViewDidSet:(id <CCPlayerDescriptionViewProtocol>)view {
    [self loadPlayerDescription];
    [self cheakFavoriteStatus];
}

- (void)playersPreviewViewDidPressLoadCFGButton:(id <CCPlayerDescriptionViewProtocol>)view {
     [self.router openEmailScreenWithEmailInfo:[CCEmailInfoFactory emailInfoWihtPlayer:self.playerDescriptionViewModel] withResult:^(CCMailResult result) {
         
     }];
}

- (void)playersPreviewViewDidPressFavoritePlayerButton:(id <CCPlayerDescriptionViewProtocol>)view {
    [self updatePlayerFavoriteStatus];
}

- (void)playersPreviewViewDidPressMoreInfoButton:(id <CCPlayerDescriptionViewProtocol>)view {
    if (self.playerDescriptionViewModel) {
        [self.router goToWebScreenWithURL:self.playerDescriptionViewModel.descriptionURL];
    }
}

- (void)playersPreviewView:(id <CCPlayerDescriptionViewProtocol>)view didSelectSection:(PlayerInfoSectionType)playerInfoSectionType {
    switch (playerInfoSectionType) {
        case PlayerInfoSectionTypeHardwareInformation:
            self.view.hardwareSectionIsOpen = !self.view.hardwareSectionIsOpen;
            break;
        case PlayerInfoSectionTypeSettingsInformation:
            self.view.gameSectionIsOpen = !self.view.gameSectionIsOpen;
            break;
        default:
            break;
    }
    [self.view updateOpenSections];
}

#pragma mark - Private

- (void)loadPlayerDescription {
    [self.view showSpiner];
    [self.ioc_playersService getPlayerDescriptionWithPlayerID:self.playerID data:^(CCPlayerDescriptionViewModel *playerInfoViewModel, BOOL fromServer) {
        [self.view hideSpiner];
        if (playerInfoViewModel) {
            self.playerDescriptionViewModel = playerInfoViewModel;
            [self.view showPlayerInfo:playerInfoViewModel];
            (fromServer) ?: [self.view showMessageWithText:NSLocalizedString(@"", nil)];
        } else {
            [self.view showMessageWithText:NSLocalizedString(@"", nil)];
        }
    }];
}

- (void)cheakFavoriteStatus {
    self.playerIsFavorite = [self.ioc_localStorageService playerIsFavorite:self.playerID];
    [self.view updatePlayerFavoriteStatus:self.playerIsFavorite];
}

- (void)updatePlayerFavoriteStatus {
    if (self.playerIsFavorite) {
        self.playerIsFavorite = NO;
        [self.ioc_localStorageService removePlayerFromFavoritesWithID:self.playerID];
        
    } else {
        self.playerIsFavorite = YES;
        [self.ioc_localStorageService addPlayerToFavoritesWithPlayerID:self.playerID];
        [self.view showMessageWithText:NSLocalizedString(@"", nil)];
    }
    [self.view updatePlayerFavoriteStatus:self.playerIsFavorite];
}

- (void)showNoEmailAccountAlert {
    CCViewModelAlert *alert = [[CCViewModelAlert alloc] initWithTitle:NSLocalizedString(@"", nil) message:NSLocalizedString(@"", nil)];
    [alert addAction:[CCViewModelAlertAction cancelActionWithAction:nil]];
    CCViewModelAlertAction *settingsAlertAction = [[CCViewModelAlertAction alloc] initWithTitle:NSLocalizedString(@"", nil) action:^{
        [self.ioc_openURLService openApplicationSettings];
    }];
    [alert addAction:settingsAlertAction];
    [self.router showViewModelAlert:alert];
}

@end
