//
//  CCTeamsViewController.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCTeamsViewController.h"
#import "UITableView+Animation.h"
#import "UIView+CCMessageView.h"
#import "CCTeamTableViewCell.h"
#import "CCSideMenuFactory.h"
#import "UIView+CCSpiner.h"
#import "CCBannerView.h"
#import "Masonry.h"

@interface CCTeamsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UIView <CCBannerViewProtocol> *bannerView;

@property (nonatomic, strong) UITableView *teamsTableView;

@property (nonatomic, strong) NSArray <CCTeamViewModel *> *teams;

@end

@implementation CCTeamsViewController

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

    self.title = NSLocalizedString(@"kTeamsNavigationTitle", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self menuButtonSetup];
    [self bannerViewSetup];
    [self teamsTableViewSetup];
    [self.viewAction teamsViewDidSet:self];
}

#pragma mark - UI Setup

- (void)teamsTableViewSetup {
    self.teamsTableView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.teamsTableView.allowsSelection = NO;
    self.teamsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.teamsTableView registerClass:[CCTeamTableViewCell class] forCellReuseIdentifier:NSStringFromClass([CCTeamTableViewCell class])];
    self.teamsTableView.dataSource = self;
    self.teamsTableView.delegate = self;
    
    [self.view addSubview:self.teamsTableView];
    [self.teamsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.top.equalTo(self.bannerView.mas_bottom);
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

#pragma mark - CCTeamsViewProtocol

- (void)showTeams:(NSArray <CCTeamViewModel *> *)teams {
    self.teams = teams;
    [self.teamsTableView cc_fluentReloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.teams.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CCTeamTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CCTeamTableViewCell class])];
    cell.team = self.teams[indexPath.row];
    cell.viewAction = ^(CCTeamTableViewCell *cell, NSUInteger playerIndex) {
        [self.viewAction teamsView:self didSelectTeamAtIndex:indexPath.row playerIndex:playerIndex];
    };
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140.f;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.viewAction teamsView:self didScrollPlayerAtIndex:indexPath.row];
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
    [self.viewAction teamsViewDidOpenMenu:self];
}

@end
