//
//  CCStaticTableView.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 26.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCStaticTableView.h"
#import "CCSettingsDataSource.h"
#import "UIFont+CC.h"
#import "Masonry.h"

@interface CCStaticTableView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong, readwrite) UITableView *tableView;

@property (nonatomic, strong) CCSettingsDataSource *dataSource;

@end

@implementation CCStaticTableView

- (instancetype)initWithDataSource:(CCSettingsDataSource *)dataSource {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.dataSource = dataSource;
        [self tableViewSetup];
    }
    return self;
}

#pragma mark - Setup UI

- (void)tableViewSetup {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

#pragma mark - Public

- (void)updateDataSource:(CCSettingsDataSource *)dataSource {
    self.dataSource = dataSource;
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataSource numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.dataSource cellForRowAtIndexPath:indexPath];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.dataSource titleForHeaderInSection:section];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return [self.dataSource titleForFooterInSection:section];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.dataSource didSelectRowAtIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.dataSource heightForRowAtIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [self.dataSource heightForHeaderInSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return [self.dataSource heightForFooterInSection:section];
}

@end
