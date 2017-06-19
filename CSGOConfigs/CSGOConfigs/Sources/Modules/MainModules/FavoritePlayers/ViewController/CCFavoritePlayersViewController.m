//
//  CCFavoritePlayersViewController.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCFavoritePlayersViewController.h"
#import "CCBannerView.h"
#import "CCPlayersListView.h"
#import "Masonry.h"
#import "CCSideMenuFactory.h"
#import "UIColor+CC.h"
#import "UIFont+CC.h"

@interface CCFavoritePlayersViewController () <CCPlayersListViewActionProtocol>

@property (strong, nonatomic) CCPlayersListView *playersListView;

@end

static const CGFloat kCellSpaces = 6.f;
static const NSUInteger kColumnsInSection = 3;

@implementation CCFavoritePlayersViewController

@synthesize viewAction;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"kPlayerNavigationTitle", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self noFavoritePlayersLabelSetup];
    [self playersViewSetup];
    [self menuButtonSetup];
    [self.viewAction favoritePlayersViewDidSet:self];
}

- (void)playersViewSetup {
    self.playersListView = [[CCPlayersListView alloc] initWithColumnsInSection:kColumnsInSection cellSpaces:kCellSpaces];
    self.playersListView.hidden = YES;
    [self bindNavigationBarToScrollView:self.playersListView.collectionView];
    self.playersListView.viewAction = self;
    
    [self.view addSubview:self.playersListView];
    [self.playersListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.top.equalTo(self.view).offset(kCellSpaces);
    }];
}

- (void)noFavoritePlayersLabelSetup {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = NSLocalizedString(@"kNoFavoritePlayersLabel", nil);
    label.textColor = [UIColor cc_themeColor];
    label.font = [UIFont cc_regualarFontWithSize:20];
    
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}

- (void)menuButtonSetup {
    self.navigationItem.leftBarButtonItem = [CCSideMenuFactory menuBarButtonWithSelector:@selector(actionOpenSideMenu:) forObject:self];
}

#pragma mark - CCPlayersPreviewViewProtocol

- (void)showPlayers:(NSArray <CCPlayerPreviewViewModel *> *)players {
    self.playersListView.hidden = NO;
    [self.playersListView showPlayers:players];
}

- (CGFloat)cellContainerWidth {
    CGFloat allSpaces = kColumnsInSection * kCellSpaces;
    CGFloat containerWidth = (self.view.bounds.size.width - allSpaces) / kColumnsInSection;
    return containerWidth;
}

#pragma mark - CCPlayersListViewActionProtocol

- (void)playersListView:(CCPlayersListView *)view didSelectPlayerAtIndex:(NSUInteger)index {
    [self.viewAction favoritePlayersView:self didSelectPlayerAtIndex:index];
}

#pragma mark - Action

- (void)actionOpenSideMenu:(UIButton *)button {
    [self.viewAction favoritePlayersViewDidOpenMenu:self];
}

@end
