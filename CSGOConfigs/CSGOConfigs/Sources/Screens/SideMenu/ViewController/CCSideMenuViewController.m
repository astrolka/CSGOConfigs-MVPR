//
//  CCSideMenuViewController.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 05.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCSideMenuViewController.h"
#import "CCSideMenuModel.h"
#import "CCSideMenuTableViewCell.h"
#import "UIColor+CC.h"
#import "Masonry.h"

@interface CCSideMenuViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray<CCSideMenuModel*> *sideMenuItems;

@property (strong, nonatomic) UITableView *sideMenuTableView;

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
    CCSideMenuModel *players = [[CCSideMenuModel alloc] initWithTitle:NSLocalizedString(@"players.title", nil) icon:[UIImage imageNamed:@"playerIcon"] appSection:CCSideMenuViewPlayersAppSection];
    CCSideMenuModel *teams = [[CCSideMenuModel alloc] initWithTitle:NSLocalizedString(@"teams.title", nil) icon:[UIImage imageNamed:@"teamIcon"] appSection:CCSideMenuViewTeamsAppSection];
    CCSideMenuModel *favorites = [[CCSideMenuModel alloc] initWithTitle:NSLocalizedString(@"favorites.title", nil) icon:[UIImage imageNamed:@"favoritePlayersIcon"] appSection:CCSideMenuViewFavoritesAppSection];
    CCSideMenuModel *news = [[CCSideMenuModel alloc] initWithTitle:NSLocalizedString(@"news.title", nil) icon:[UIImage imageNamed:@"newsIcon"] appSection:CCSideMenuViewNewsAppSection];
    CCSideMenuModel *map = [[CCSideMenuModel alloc] initWithTitle:NSLocalizedString(@"map_events.title", nil) icon:[UIImage imageNamed:@"mapeventsIcon"] appSection:CCSideMenuViewMapEventsAppSection];
    CCSideMenuModel *skins = [[CCSideMenuModel alloc] initWithTitle:NSLocalizedString(@"skins_price.title", nil) icon:[UIImage imageNamed:@"skinsPriceIcon"] appSection:CCSideMenuViewSkinsAppSection];
    CCSideMenuModel *appTools = [[CCSideMenuModel alloc] initWithTitle:NSLocalizedString(@"app_tools.title", nil) icon:[UIImage imageNamed:@"appToolsIcon"] appSection:CCSideMenuViewToolsAppSection];
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
    [self.viewAction didSelectAppSection:self.sideMenuItems[indexPath.row].appSection];
}

@end
