//
//  CCAppToolsViewController.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCAppToolsViewController.h"
#import "UIView+CCMessageView.h"
#import "CCSettingsDataSource.h"
#import "CCSideMenuFactory.h"
#import "CCStaticTableView.h"
#import "Masonry.h"

@interface CCAppToolsViewController ()

@property (nonatomic, strong) CCStaticTableView *appStaticTableView;

@property (nonatomic, strong) CCSettingsDataSource *settingsDataSource;
@property (nonatomic, strong) CCSettingsRowDataSource *cacheRow;

@end

@implementation CCAppToolsViewController

@synthesize viewAction;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"app_tools.title", nil);
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self menuButtonSetup];
    [self dataSourceSetup];
    [self appStaticTableViewSetup];
    
    [self.viewAction appToolsViewDidSet:self];
}

#pragma mark - UI Setup

- (void)menuButtonSetup {
    self.navigationItem.leftBarButtonItem = [CCSideMenuFactory menuBarButtonWithSelector:@selector(actionOpenSideMenu:) forObject:self];
}

- (void)appStaticTableViewSetup {
    self.appStaticTableView = [[CCStaticTableView alloc] initWithDataSource:self.settingsDataSource];
    
    [self.view addSubview:self.appStaticTableView];
    [self.appStaticTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - DataSource

- (void)dataSourceSetup {
    self.settingsDataSource = [[CCSettingsDataSource alloc] initWithSections:@[[self storageSectionSetup], [self socailSectionSetup]]];
}

- (CCSettingsSectionDataSource *)storageSectionSetup {
    self.cacheRow = [[CCSettingsRowDataSource alloc] initWithImage:[UIImage imageNamed:@"appToolCache"] title:NSLocalizedString(@"app_tools.cell.clear_cache", nil) detail:nil];
    __weak __typeof(self)wself = self;
    self.cacheRow.selectAction = ^() {
        [wself.viewAction appToolsViewDidSelectClearCache:wself];
    };
    
    CCSettingsSectionDataSource *storageSection = [[CCSettingsSectionDataSource alloc] initWithRows:@[self.cacheRow]];
    return storageSection;
}

- (CCSettingsSectionDataSource *)socailSectionSetup {
    CCSettingsRowDataSource *donateRow = [[CCSettingsRowDataSource alloc] initWithImage:[UIImage imageNamed:@"appToolDonate"] title:NSLocalizedString(@"app_tools.cell.donate", nil) detail:nil];
    donateRow.selectAction = ^() {
        [self.viewAction appToolsViewDidSelectDonate:self];
    };
    
    CCSettingsRowDataSource *shareRow = [[CCSettingsRowDataSource alloc] initWithImage:[UIImage imageNamed:@"appToolShare"] title:NSLocalizedString(@"app_tools.cell.share", nil) detail:nil];
    shareRow.selectAction = ^() {
        [self.viewAction appToolsViewDidSelectShareApp:self];
    };
    
    CCSettingsRowDataSource *rateAppRow = [[CCSettingsRowDataSource alloc] initWithImage:[UIImage imageNamed:@"appToolRateApp"] title:NSLocalizedString(@"app_tools.cell.rate_app", nil) detail:nil];
    rateAppRow.selectAction = ^() {
        [self.viewAction appToolsViewDidSelectRateApp:self];
    };
    
    CCSettingsRowDataSource *contactWithDevRow = [[CCSettingsRowDataSource alloc] initWithImage:[UIImage imageNamed:@"appToolContact"] title:NSLocalizedString(@"app_tools.cell.contact_with_dev", nil) detail:nil];
    contactWithDevRow.selectAction = ^() {
        [self.viewAction appToolsViewDidSelectContactWithDeveloper:self];
    };
    
    CCSettingsSectionDataSource *socialSection = [[CCSettingsSectionDataSource alloc] initWithRows:@[donateRow, shareRow, rateAppRow, contactWithDevRow]];
    return socialSection;
}

#pragma mark - CCAppToolsViewProtocol

- (void)updateAppCache:(NSString *)cache {
    self.cacheRow.detail = cache;
    [self.appStaticTableView updateDataSource:self.settingsDataSource];
}

#pragma mark - CCMessageViewProtocol

- (void)showMessageWithText:(NSString *)text {
    [self.view cc_showMessageWithText:text];
}

#pragma mark - Action

- (void)actionOpenSideMenu:(UIButton *)button {
    [self.viewAction appToolsViewDidOpenMenu:self];
}

@end
