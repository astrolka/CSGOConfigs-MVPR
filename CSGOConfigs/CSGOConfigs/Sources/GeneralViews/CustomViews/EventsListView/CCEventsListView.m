//
//  CCEventsListView.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCEventsListView.h"
#import "CCEventTableViewCell.h"
#import "CCEventViewModel.h"
#import "CCEventTableViewCell.h"
#import "CCEventViewModel.h"
#import "Masonry.h"

@interface CCEventsListView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray <CCEventViewModel *> *events;

@end

@implementation CCEventsListView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self tableViewSetup];
    }
    return self;
}

#pragma mark - View

- (void)tableViewSetup {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.tableView registerClass:[CCEventTableViewCell class] forCellReuseIdentifier:NSStringFromClass([CCEventTableViewCell class])];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.events.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CCEventTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CCEventTableViewCell class])];
    cell.event = self.events[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.viewAction eventsListView:self didSelectEventAtIndex:indexPath.row];
}

#pragma mark - Public

- (void)showEvents:(NSArray <CCEventViewModel *> *)events {
    self.events = events;
    [self.tableView reloadData];
}

@end
