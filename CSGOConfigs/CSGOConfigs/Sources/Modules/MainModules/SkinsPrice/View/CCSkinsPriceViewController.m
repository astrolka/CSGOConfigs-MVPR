//
//  CCSkinsPriceViewController.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCSkinsPriceViewController.h"
#import "UIView+CCMessageView.h"
#import "CCSkinTableViewCell.h"
#import "CCSkinViewModel.h"
#import "UIView+CCSpiner.h"
#import "Masonry.h"

@interface CCSkinsPriceViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *skinsTableView;

@property (nonatomic, strong) NSMutableArray <CCSkinViewModel *> *skins;

@property (nonatomic, strong) UIButton *connectButton;

@end

@implementation CCSkinsPriceViewController

@synthesize viewAction;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.skins = [[NSMutableArray alloc] init];
    self.title = NSLocalizedString(@"kPlayerNavigationTitle", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self sknisTableViewSetup];
    [self connectButtonSetup];
    
    [self.viewAction skinsPriceViewDidSet:self];
}

#pragma mark - UI Setup

- (void)sknisTableViewSetup {
    self.skinsTableView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.skinsTableView.allowsSelection = NO;
    self.skinsTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.skinsTableView registerClass:[CCSkinTableViewCell class] forCellReuseIdentifier:NSStringFromClass([CCSkinTableViewCell class])];
    self.skinsTableView.dataSource = self;
    self.skinsTableView.delegate = self;
    
    [self.view addSubview:self.skinsTableView];
    [self.skinsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)connectButtonSetup {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"updateIcon"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(actionConnect:) forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = barButtonItem;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.skins.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CCSkinTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CCSkinTableViewCell class])];
    cell.skin = self.skins[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [CCSkinTableViewCell defaultCellHeight];
}

#pragma mark - CCSkinsPriceViewProtocol

- (void)showNewSkin:(CCSkinViewModel *)skin {
    [self.skins insertObject:skin atIndex:0];
    [self.skinsTableView reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 1)] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)connectionButtonEnabled:(BOOL)enabled {
    self.navigationItem.rightBarButtonItem.enabled = enabled;
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

- (void)actionConnect:(UIButton *)button {
    [self.viewAction skinsPriceViewDidPressConnect:self];
}

@end
