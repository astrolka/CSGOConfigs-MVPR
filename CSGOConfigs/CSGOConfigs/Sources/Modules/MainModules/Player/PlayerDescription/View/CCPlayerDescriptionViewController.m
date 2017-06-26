//
//  CCPlayerDescriptionViewController.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 11.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayerDescriptionViewController.h"
#import "CCPlayerDescriptionViewModel.h"
#import "CCPlayerInfoTableViewCell.h"
#import "CCPlayerPersonalInfoView.h"
#import "CCSelectableSectionView.h"
#import "UITableView+Animation.h"
#import "UIView+CCMessageView.h"
#import "CCCenterButtonView.h"
#import "UIView+CCSpiner.h"
#import "Masonry.h"

@interface CCPlayerDescriptionViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *playerTableView;

@property (nonatomic, strong) UIButton *favoritePlayerButton;

@property (strong, nonatomic) CCPlayerDescriptionViewModel *playerDescriptionViewModel;

@end

@implementation CCPlayerDescriptionViewController

@synthesize viewAction;
@synthesize hardwareSectionIsOpen;
@synthesize gameSectionIsOpen;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = NSLocalizedString(@"kPlayerNavigationTitle", nil);
    [self tableViewSetup];
    [self favoriteButtonSetup];
    
    [self.viewAction playersPreviewViewDidSet:self];
}

#pragma mark - UI Setup

- (void)tableViewSetup {
    self.playerTableView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.playerTableView.allowsSelection = NO;
    self.playerTableView.alpha = 0.f;
    self.playerTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.playerTableView.dataSource = self;
    self.playerTableView.delegate = self;
    [self.playerTableView registerClass:[CCPlayerInfoTableViewCell class] forCellReuseIdentifier:NSStringFromClass([CCPlayerInfoTableViewCell class])];
    [self.playerTableView registerClass:[CCPlayerPersonalInfoView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([CCPlayerPersonalInfoView class])];
    [self.playerTableView registerClass:[CCCenterButtonView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([CCCenterButtonView class])];
    [self.playerTableView registerClass:[CCSelectableSectionView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([CCSelectableSectionView class])];
    
    [self.view addSubview:self.playerTableView];
    [self.playerTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)favoriteButtonSetup {
    self.favoritePlayerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.favoritePlayerButton setImage:[UIImage imageNamed:@"removePlayerFavoritesIcon"] forState:UIControlStateNormal];
    [self.favoritePlayerButton addTarget:self action:@selector(actionFavoritePlayerButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.favoritePlayerButton sizeToFit];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.favoritePlayerButton];
    self.navigationItem.rightBarButtonItem = barButtonItem;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case PlayerInfoSectionTypeHardwareInformation:
            return self.hardwareSectionIsOpen ? self.playerDescriptionViewModel.hardwareCharacterictics.count : 0;
        case PlayerInfoSectionTypeSettingsInformation:
            return self.gameSectionIsOpen ? self.playerDescriptionViewModel.gameSettingCharacterictics.count : 0;
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CCPlayerInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CCPlayerInfoTableViewCell class])];
    switch (indexPath.section) {
        case PlayerInfoSectionTypeHardwareInformation:
            cell.title = self.playerDescriptionViewModel.hardwareCharacterictics[indexPath.row];
            return cell;
        case PlayerInfoSectionTypeSettingsInformation:
            cell.title = self.playerDescriptionViewModel.gameSettingCharacterictics[indexPath.row];
            return cell;
        default:
            return nil;
    }
}

#pragma mark -UITableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    switch (section) {
        case PlayerInfoSectionTypePersonalInformation: {
                CCPlayerPersonalInfoView *playerDescriptionHeaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass
([CCPlayerPersonalInfoView class])];
                [playerDescriptionHeaderView updateWithViewModel:self.playerDescriptionViewModel];
                playerDescriptionHeaderView.moreInfoButton =  ^(CCPlayerPersonalInfoView *playerPersonalInfoView) {
                    [self.viewAction playersPreviewViewDidPressMoreInfoButton:self];
                };
                return playerDescriptionHeaderView;
        }
            
        case PlayerInfoSectionTypeHardwareInformation: {
                CCSelectableSectionView *selectableHeaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([CCSelectableSectionView class])];
                selectableHeaderView.title = NSLocalizedString(@"sdfsdf", nil);
                selectableHeaderView.pressSection = ^(CCSelectableSectionView *selectableSectionView) {
                    [self.viewAction playersPreviewView:self didSelectSection:section];
                };
                return selectableHeaderView;
        }
            
        case PlayerInfoSectionTypeSettingsInformation: {
                CCSelectableSectionView *selectableHeaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([CCSelectableSectionView class])];
                selectableHeaderView.title = NSLocalizedString(@"sdfsdf", nil);
                selectableHeaderView.pressSection = ^(CCSelectableSectionView *selectableSectionView) {
                    [self.viewAction playersPreviewView:self didSelectSection:section];
                };
                return selectableHeaderView;
        }
            
        default:
            return nil;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    switch (section) {
        case PlayerInfoSectionTypeDownloadCFG: {
            CCCenterButtonView *buttonFooterView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([CCCenterButtonView class])];
            buttonFooterView.buttonTitle = NSLocalizedString(@"dfsd", nil);
            buttonFooterView.pressButton = ^(CCCenterButtonView *centerButtonView) {
                [self.viewAction playersPreviewViewDidPressLoadCFGButton:self];
            };
            return buttonFooterView;
        }
        default:
            return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    switch (section) {
        case PlayerInfoSectionTypePersonalInformation:
            return 180.f;
        case PlayerInfoSectionTypeHardwareInformation:
        case PlayerInfoSectionTypeSettingsInformation:
            return 44.f;
        default:
            return CGFLOAT_MIN;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    switch (section) {
        case PlayerInfoSectionTypeDownloadCFG:
            return 60.f;
        default:
            return CGFLOAT_MIN;
    }
}

#pragma mark - CCPlayerDescriptionViewProtocol

- (void)showPlayerInfo:(CCPlayerDescriptionViewModel *)playerDescriptionViewModel {
    self.playerDescriptionViewModel = playerDescriptionViewModel;
    [self.playerTableView reloadData];
    [UIView animateWithDuration:0.3 animations:^{
        self.playerTableView.alpha = 1.f;
    }];
}

- (void)updateOpenSections {
    //TODO: Add animation
    [self.playerTableView reloadData];
}

- (void)updatePlayerFavoriteStatus:(BOOL)favorite {
    if (favorite) {
        [self.favoritePlayerButton setImage:[UIImage imageNamed:@"removePlayerFavoritesIcon"] forState:UIControlStateNormal];
    } else {
        [self.favoritePlayerButton setImage:[UIImage imageNamed:@"addPlayerFavoritesIcon"] forState:UIControlStateNormal];
    }
}

#pragma mark - CCSpinerViewProtocol

- (void)showSpiner {
    [self.view cc_showSpiner];
}

- (void)hideSpiner {
    [self.view cc_hideSpiner];
}

#pragma mark - CCMessageViewProtocol

- (void)showMessageWithText:(NSString *)text {
    [self.view cc_showMessageWithText:text];
}

#pragma mark - Action 

- (void)actionFavoritePlayerButton:(UIButton *)button {
    [self.viewAction playersPreviewViewDidPressFavoritePlayerButton:self];
}

@end
