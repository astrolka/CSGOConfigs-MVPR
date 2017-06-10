//
//  CCTeamsView.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 10.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCTeamsListView.h"
#import "Masonry.h"
#import "CCTeamTableViewCell.h"
#import "CCTeamViewModel.h"
#import "UIImageView+Animation.h"

@interface CCTeamsListView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray <CCTeamViewModel *> *teams;

@end

@implementation CCTeamsListView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self tableViewSetup];
    }
    return self;
}

#pragma mark - Subviews

- (void)tableViewSetup {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.tableView.allowsSelection = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[CCTeamTableViewCell class] forCellReuseIdentifier:NSStringFromClass([CCTeamTableViewCell class])];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

#pragma mark - Public

- (void)showTeams:(NSArray <CCTeamViewModel *> *)teams {
    self.teams = teams;
    [self.tableView reloadDataWithAnimation:CCAnimationTypeFluentlyUp];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.teams.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CCTeamTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CCTeamTableViewCell class])];
    cell.team = self.teams[indexPath.row];
    cell.viewAction = ^(CCTeamTableViewCell *cell, NSUInteger playerIndex) {
        [self.viewAction teamsListView:self didSelectTeamAtIndex:indexPath.row playerAtIndex:playerIndex];
    };
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140.f;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.viewAction teamsListView:self didScrollTeamAtIndex:indexPath.row];
}


@end
