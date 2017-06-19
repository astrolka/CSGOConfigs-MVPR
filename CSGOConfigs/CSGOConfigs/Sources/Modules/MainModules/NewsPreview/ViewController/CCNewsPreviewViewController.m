//
//  CCNewsPreviewViewController.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsPreviewViewController.h"
#import "Masonry.h"
#import "CCSideMenuFactory.h"
#import "UIColor+CC.h"
#import "UIView+CCSpiner.h"
#import "UIView+CCMessageView.h"
#import "CCNewsPreviewViewModel.h"
#import "CCNewsPreviewTableViewCell.h"

@interface CCNewsPreviewViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray <CCNewsPreviewViewModel *> *newsDataArray;

@end

@implementation CCNewsPreviewViewController

@synthesize viewAction;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"kPlayerNavigationTitle", nil);
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self tableViewSetup];
    [self refreshControlSetup];
    [self menuButtonSetup];
    self.newsDataArray = [[NSMutableArray alloc] init];
    [self.viewAction newsPreviewViewDidSet:self];
}

#pragma mark - View

- (void)tableViewSetup {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //[self bindNavigationBarToScrollView:self.tableView];
    [self.tableView registerClass:[CCNewsPreviewTableViewCell class] forCellReuseIdentifier:NSStringFromClass([CCNewsPreviewTableViewCell class])];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)refreshControlSetup {
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.tintColor = [UIColor cc_themeColor];
    [self.tableView addSubview:self.refreshControl];
    [self.refreshControl addTarget:self action:@selector(actionRefreshControlUpdated:) forControlEvents:UIControlEventValueChanged];
}

- (void)menuButtonSetup {
    self.navigationItem.leftBarButtonItem = [CCSideMenuFactory menuBarButtonWithSelector:@selector(actionOpenSideMenu:) forObject:self];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CCNewsPreviewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CCNewsPreviewTableViewCell class])];
    cell.news = self.newsDataArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.viewAction newsPreviewView:self didSelectNewsAtIndex:indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 170.f;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [(CCNewsPreviewTableViewCell *)cell updateImageViewCellOffset];
    [self.viewAction newsPreviewView:self didScrollNewsAtIndex:indexPath.row];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.tableView.visibleCells enumerateObjectsUsingBlock:^(CCNewsPreviewTableViewCell *cell, NSUInteger idx, BOOL * _Nonnull stop) {
        [cell updateImageViewCellOffset];
    }];
}

#pragma mark - CCNewsPreviewViewProtocol

- (void)showNewNews:(NSArray <CCNewsPreviewViewModel*> *)news {
    self.newsDataArray = [[NSMutableArray alloc] initWithArray:news];
    [self.tableView reloadData];
    [self scrollToTop];
}

- (void)showMoreNews:(NSArray <CCNewsPreviewViewModel*> *)news {
    [self.newsDataArray addObjectsFromArray:news];
    [self.tableView reloadData];
    [self scrollToTop];
}

#pragma mark - CCSpinerViewProtocol

- (void)showSpiner {
    [self.view cc_showSpiner];
}

- (void)hideSpiner {
    [self.view cc_hideSpiner];
    [self.refreshControl endRefreshing];
}

#pragma mark - CCMessageViewProtocol

- (void)showMessageWithText:(NSString *)text {
    [self.view cc_showMessageWithText:text];
}

#pragma mark - Action

- (void)actionOpenSideMenu:(UIButton *)button {
    [self.viewAction newsPreviewViewDidOpenMenu:self];
}

- (void)actionRefreshControlUpdated:(UIRefreshControl *)refreshControl {
    [self.viewAction newsPreviewViewDidRefreshNews:self];
}

#pragma mark - Private

- (void)scrollToTop {
    [self.tableView setContentOffset:CGPointMake(0.f, -self.navigationController.navigationBar.frame.size.height) animated:YES];
}

@end
