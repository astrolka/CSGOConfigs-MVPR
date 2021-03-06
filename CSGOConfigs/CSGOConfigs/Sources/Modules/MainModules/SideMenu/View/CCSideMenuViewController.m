//
//  CCSideMenuViewController.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 05.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCSideMenuViewController.h"
#import "CCSideMenuTableViewCell.h"
#import "CCSideMenuModel.h"
#import "UIColor+CC.h"
#import "Masonry.h"

@interface CCSideMenuViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *sideMenuTableView;

@property (strong, nonatomic) NSArray<CCSideMenuModel*> *sideMenuItems;

@end

@implementation CCSideMenuViewController

@synthesize viewAction;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor cc_themeColor];
    [self dataSourceSetup];
    [self sideMenuTableViewSetup];
}

- (void)dataSourceSetup {
    CCSideMenuModel *players = [[CCSideMenuModel alloc] initWithTitle:NSLocalizedString(@"side_menu.cell.title.players", nil) icon:[UIImage imageNamed:@"playerIcon"] appSection:CCSideMenuViewPlayersAppSection];
    CCSideMenuModel *teams = [[CCSideMenuModel alloc] initWithTitle:NSLocalizedString(@"side_menu.cell.title.teams", nil) icon:[UIImage imageNamed:@"teamIcon"] appSection:CCSideMenuViewTeamsAppSection];
    CCSideMenuModel *favorites = [[CCSideMenuModel alloc] initWithTitle:NSLocalizedString(@"side_menu.cell.title.favorite_players", nil) icon:[UIImage imageNamed:@"favoritePlayersIcon"] appSection:CCSideMenuViewFavoritesAppSection];
    CCSideMenuModel *news = [[CCSideMenuModel alloc] initWithTitle:NSLocalizedString(@"side_menu.cell.title.news", nil) icon:[UIImage imageNamed:@"newsIcon"] appSection:CCSideMenuViewNewsAppSection];
    CCSideMenuModel *map = [[CCSideMenuModel alloc] initWithTitle:NSLocalizedString(@"side_menu.cell.title.events", nil) icon:[UIImage imageNamed:@"mapeventsIcon"] appSection:CCSideMenuViewMapEventsAppSection];
    CCSideMenuModel *skins = [[CCSideMenuModel alloc] initWithTitle:NSLocalizedString(@"side_menu.cell.title.skins_price", nil) icon:[UIImage imageNamed:@"skinsPriceIcon"] appSection:CCSideMenuViewSkinsAppSection];
    CCSideMenuModel *appTools = [[CCSideMenuModel alloc] initWithTitle:NSLocalizedString(@"side_menu.cell.title.app_tools", nil) icon:[UIImage imageNamed:@"appToolsIcon"] appSection:CCSideMenuViewToolsAppSection];
    self.sideMenuItems = @[ players, teams, favorites, news, map, skins, appTools ];
}

- (void)sideMenuTableViewSetup {
    self.sideMenuTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.sideMenuTableView.backgroundColor = [UIColor cc_themeColor];
    self.sideMenuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.sideMenuTableView.scrollEnabled = NO;
    self.sideMenuTableView.dataSource = self;
    self.sideMenuTableView.delegate = self;
    [self.sideMenuTableView registerClass:[CCSideMenuTableViewCell self] forCellReuseIdentifier:NSStringFromClass([CCSideMenuTableViewCell class])];
    
    CGFloat tableViewHeight = self.sideMenuItems.count * [CCSideMenuTableViewCell defaultCellHeight];
    [self.view addSubview:self.sideMenuTableView];
    [self.sideMenuTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).offset(4);
        make.height.mas_equalTo(tableViewHeight);
        make.centerY.equalTo(self.view);
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sideMenuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CCSideMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CCSideMenuTableViewCell class])];
    cell.sideMenuModel = self.sideMenuItems[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [CCSideMenuTableViewCell defaultCellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.viewAction didSelectAppSection:self.sideMenuItems[indexPath.row].appSection];
}

@end
