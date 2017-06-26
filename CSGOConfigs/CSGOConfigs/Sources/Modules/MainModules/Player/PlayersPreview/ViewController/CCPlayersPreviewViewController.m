//
//  CCPlayersPreviewViewController.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayersPreviewViewController.h"
#import "UIView+CCMessageView.h"
#import "CCPlayersListView.h"
#import "CCSideMenuFactory.h"
#import "UIView+CCSpiner.h"
#import "CCBannerView.h"
#import "Masonry.h"

@interface CCPlayersPreviewViewController () <CCPlayersListViewActionProtocol>

@property (strong, nonatomic) CCPlayersListView *playersListView;
@property (strong, nonatomic) UIView <CCBannerViewProtocol> *bannerView;

@end

static CGFloat const kCellSpaces = 6.f;
static NSUInteger const kColumnsInSection = 3;

@implementation CCPlayersPreviewViewController

@synthesize viewAction;

- (id)initWithBannerView:(UIView <CCBannerViewProtocol> *)bannerView {
    self = [super init];
    if (self) {
        self.bannerView = bannerView;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"kPlayerNavigationTitle", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self bannerViewSetup];
    [self playersViewSetup];
    [self menuButtonSetup];
    
    [self.viewAction playersPreviewViewDidSet:self];
}

#pragma mark - View Setup

- (void)playersViewSetup {
    self.playersListView = [[CCPlayersListView alloc] initWithColumnsInSection:kColumnsInSection cellSpaces:kCellSpaces];
    //[self bindNavigationBarToScrollView:self.playersListView.collectionView];
    self.playersListView.viewAction = self;
    
    [self.view addSubview:self.playersListView];
    [self.playersListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bannerView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(kCellSpaces);
    }];
}

- (void)bannerViewSetup {
    [self.view addSubview:self.bannerView];
    [self.bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(@100);
    }];
}

- (void)menuButtonSetup {
    self.navigationItem.leftBarButtonItem = [CCSideMenuFactory menuBarButtonWithSelector:@selector(actionOpenSideMenu:) forObject:self];
}

#pragma mark - CCPlayersPreviewViewProtocol

- (void)showPlayers:(NSArray <CCPlayerPreviewViewModel *> *)players {
    [self.playersListView showPlayers:players];
}

- (CGFloat)cellContainerWidth {
    CGFloat allSpaces = kColumnsInSection * kCellSpaces;
    CGFloat containerWidth = (self.view.bounds.size.width - allSpaces) / kColumnsInSection;
    return containerWidth;
}

#pragma mark - CCBannerViewProtocol

- (void)updateBannerHeight:(CGFloat)height {
    [self.bannerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(@(height));
    }];
    
    [UIView animateWithDuration:0.4 animations:^{
        self.bannerView.alpha = 1.f;
        [self.view layoutIfNeeded];
    }];
}

#pragma mark - CCPlayersListViewActionProtocol

- (void)playersListView:(CCPlayersListView *)view didSelectPlayerAtIndex:(NSUInteger)index {
    [self.viewAction playersPreviewView:self didSelectPlayerAtIndex:index];
}

- (void)playersListView:(CCPlayersListView *)view didScrollPlayerAtIndex:(NSUInteger)index {
    [self.viewAction playersPreviewView:self didScrollPlayerAtIndex:index];
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

- (void)actionOpenSideMenu:(UIButton *)button {
    [self.viewAction playersPreviewViewDidOpenMenu:self];
}

@end
