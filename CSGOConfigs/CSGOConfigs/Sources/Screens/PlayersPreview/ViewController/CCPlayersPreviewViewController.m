//
//  CCPlayersPreviewViewController.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayersPreviewViewController.h"
#import "CCPlayersListView.h"
#import "Masonry.h"
#import "CCSideMenuFactory.h"

@interface CCPlayersPreviewViewController () <CCPlayersListViewActionProtocol>

@property (strong, nonatomic) CCPlayersListView *playersListView;

@end

CGFloat const kCellSpaces = 6.f;
NSUInteger const kColumnsInSection = 3;

@implementation CCPlayersPreviewViewController

@synthesize viewAction;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"kPlayerNavigationTitle", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    [self playersViewSetup];
    [self menuButtonSetup];
    [self.viewAction playersPreviewViewDidSet:self];
}

- (void)playersViewSetup {
    self.playersListView = [[CCPlayersListView alloc] initWithColumnsInSection:kColumnsInSection cellSpaces:kCellSpaces];
    [self bindNavigationBarToScrollView:self.playersListView.collectionView];
    self.playersListView.viewAction = self;
    
    [self.view addSubview:self.playersListView];
    [self.playersListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(kCellSpaces, 0, kCellSpaces, 0));
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

#pragma mark - CCPlayersListViewActionProtocol

- (void)playersListView:(CCPlayersListView *)view didSelectPlayerAtIndex:(NSUInteger)index {
    [self.viewAction playersPreviewView:self didSelectPlayerAtIndex:index];
}

- (void)playersListView:(CCPlayersListView *)view didScrollPlayerAtIndex:(NSUInteger)index {
    [self.viewAction playersPreviewView:self didScrollPlayerAtIndex:index];
}

#pragma mark - Action

- (void)actionOpenSideMenu:(UIButton *)button {
    [self.viewAction playersPreviewViewDidOpenMenu:self];
}

@end
