//
//  CCNewsDescriptionViewController.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsDescriptionViewController.h"
#import "CCNewsImageContentTableViewCell.h"
#import "CCNewsTextContentTableViewCell.h"
#import "CCNewsImageContentViewModel.h"
#import "CCNewsDescriptionHeaderView.h"
#import "CCNewsTextContentViewModel.h"
#import "CCNewsContentViewModel.h"
#import "UIView+CCMessageView.h"
#import "UIView+CCSpiner.h"
#import "Masonry.h"

@interface CCNewsDescriptionViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *newsTableView;
@property (nonatomic, strong) CCNewsDescriptionHeaderView *newsDescriptionHeaderView;

@property (nonatomic, strong) CCNewsDescriptionViewModel *newsDescriptionViewModel;

@end

@implementation CCNewsDescriptionViewController

@synthesize viewAction;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = NSLocalizedString(@"news_description.title", nil);
    [self newsDescriptionHeaderViewSetup];
    [self tableViewSetup];
    [self.viewAction newsDescriptionViewDidSet:self];
}

#pragma mark - View Setup

- (void)tableViewSetup {
    self.newsTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.newsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.newsTableView.estimatedRowHeight = 300.f;
    self.newsTableView.rowHeight = UITableViewAutomaticDimension;
    self.newsTableView.alpha = 0.f;
    [self.newsTableView registerClass:[CCNewsTextContentTableViewCell class] forCellReuseIdentifier:NSStringFromClass([CCNewsTextContentTableViewCell class])];
    [self.newsTableView registerClass:[CCNewsImageContentTableViewCell class] forCellReuseIdentifier:NSStringFromClass([CCNewsImageContentTableViewCell class])];
    self.newsTableView.dataSource = self;
    self.newsTableView.delegate = self;
    
    [self.view addSubview:self.newsTableView];
    [self.newsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)newsDescriptionHeaderViewSetup {
    __weak typeof(self)weakSelf = self;
    self.newsDescriptionHeaderView = [[CCNewsDescriptionHeaderView alloc] initWithFrame:CGRectZero];
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
    [self.newsTableView reloadData];
    [UIView animateWithDuration:0.3 animations:^{
        self.newsTableView.alpha = 1.f;
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
