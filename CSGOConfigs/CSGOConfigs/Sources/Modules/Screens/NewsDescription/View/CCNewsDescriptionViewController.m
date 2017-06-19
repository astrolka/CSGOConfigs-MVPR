//
//  CCNewsDescriptionViewController.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsDescriptionViewController.h"
#import "Masonry.h"
#import "UIView+CCSpiner.h"
#import "UIView+CCMessageView.h"
#import "CCNewsContentViewModel.h"
#import "CCNewsTextContentViewModel.h"
#import "CCNewsImageContentViewModel.h"
#import "CCNewsTextContentTableViewCell.h"
#import "CCNewsImageContentTableViewCell.h"
#import "CCNewsDescriptionHeaderView.h"

@interface CCNewsDescriptionViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CCNewsDescriptionHeaderView *newsDescriptionHeaderView;

@property (nonatomic, strong) CCNewsDescriptionViewModel *newsDescriptionViewModel;

@end

@implementation CCNewsDescriptionViewController

@synthesize viewAction;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = NSLocalizedString(@"sdf", nil);
    [self newsDescriptionHeaderViewSetup];
    [self tableViewSetup];
    [self.viewAction newsDescriptionViewDidSet:self];
}

#pragma mark - View

- (void)tableViewSetup {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedRowHeight = 300.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.alpha = 0.f;
    [self.tableView registerClass:[CCNewsTextContentTableViewCell class] forCellReuseIdentifier:NSStringFromClass([CCNewsTextContentTableViewCell class])];
    [self.tableView registerClass:[CCNewsImageContentTableViewCell class] forCellReuseIdentifier:NSStringFromClass([CCNewsImageContentTableViewCell class])];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)newsDescriptionHeaderViewSetup {
    self.newsDescriptionHeaderView = [[CCNewsDescriptionHeaderView alloc] initWithFrame:CGRectZero];
    __weak typeof(self)weakSelf = self;
    self.newsDescriptionHeaderView.pressDescriptionButton = ^(CCNewsDescriptionHeaderView *newsDescriptionHeaderView) {
        [weakSelf.viewAction newsDescriptionViewDidPressMoreInfoButton:weakSelf];
    };
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsDescriptionViewModel.content.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CCNewsContentViewModel *newsContentViewModel = self.newsDescriptionViewModel.content[indexPath.row];
    if ([newsContentViewModel isKindOfClass:[CCNewsTextContentViewModel class]]) {
        CCNewsTextContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CCNewsTextContentTableViewCell class])];
        cell.newsContentViewModel = newsContentViewModel;
        return cell;
    } else if ([newsContentViewModel isKindOfClass:[CCNewsImageContentViewModel class]]) {
        CCNewsImageContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CCNewsImageContentTableViewCell class])];
        cell.newsContentViewModel = newsContentViewModel;
        return cell;
    } else {
        return nil;
    }
}

#pragma mark - UITableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.newsDescriptionHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 200.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CCNewsContentViewModel *newsContentViewModel = self.newsDescriptionViewModel.content[indexPath.row];
    if ([newsContentViewModel isKindOfClass:[CCNewsTextContentViewModel class]]) {
        return UITableViewAutomaticDimension;
    } else if ([newsContentViewModel isKindOfClass:[CCNewsImageContentViewModel class]]) {
        return [(CCNewsImageContentViewModel *)newsContentViewModel contentHeight];
    }
    return CGFLOAT_MIN;
}

#pragma mark - CCNewsDescriptionViewProtocol

- (void)showNewsDescription:(CCNewsDescriptionViewModel *)viewModel {
    self.newsDescriptionViewModel = viewModel;
    self.newsDescriptionHeaderView.newsDescriptionViewModel = viewModel;
    [self.tableView reloadData];
    [UIView animateWithDuration:0.3 animations:^{
        self.tableView.alpha = 1.f;
    }];
}

#pragma mark - CCMessageViewProtocol

- (void)showMessageWithText:(NSString *)text {
    [self.view cc_showMessageWithText:text];
}

#pragma mark - CCSpinerViewProtocol

- (void)showSpiner {
    [self.view cc_showSpiner];
}

- (void)hideSpiner {
    [self.view cc_hideSpiner];
}

@end
