//
//  CCAppToolsViewController.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCAppToolsViewController.h"
#import "Masonry.h"
#import "UIView+CCMessageView.h"
#import "CCSideMenuFactory.h"
#import "CCSettingsView.h"
#import "CCSettingsDataSource.h"

@interface CCAppToolsViewController ()

@property (nonatomic, strong) CCSettingsView *appSettingsView;

@property (nonatomic, strong) CCSettingsDataSource *settingsDataSource;
@property (nonatomic, strong) CCSettingsRowDataSource *cacheRow;

@end

@implementation CCAppToolsViewController

@synthesize viewAction;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"kPlayerNavigationTitle", nil);
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self menuButtonSetup];
    [self dataSourceSetup];
    [self appSettingsViewSetup];
}

#pragma mark - View

- (void)menuButtonSetup {
    self.navigationItem.leftBarButtonItem = [CCSideMenuFactory menuBarButtonWithSelector:@selector(actionOpenSideMenu:) forObject:self];
}

- (void)appSettingsViewSetup {
    self.appSettingsView = [[CCSettingsView alloc] initWithDataSource:self.settingsDataSource];
    
    [self.view addSubview:self.appSettingsView];
    [self.appSettingsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - DataSource

- (void)dataSourceSetup {
    self.settingsDataSource = [[CCSettingsDataSource alloc] initWithSections:@[[self storageSectionSetup], [self socailSectionSetup]]];
}

- (CCSettingsSectionDataSource *)storageSectionSetup {
    self.cacheRow = [[CCSettingsRowDataSource alloc] initWithImage:[UIImage imageNamed:@"appToolCache"] title:NSLocalizedString(@"hello", nil) detail:nil];
    __weak __typeof(self)wself = self;
    self.cacheRow.selectAction = ^() {
        [wself.viewAction appToolsViewDidSelectClearCache:wself];
    };
    
    CCSettingsSectionDataSource *storageSection = [[CCSettingsSectionDataSource alloc] initWithRows:@[self.cacheRow]];
    storageSection.headerTitle = NSLocalizedString(@"q", nil);
    return storageSection;
}

- (CCSettingsSectionDataSource *)socailSectionSetup {
    CCSettingsRowDataSource *donateRow = [[CCSettingsRowDataSource alloc] initWithImage:[UIImage imageNamed:@"appToolDonate"] title:NSLocalizedString(@"hello", nil) detail:nil];
    donateRow.selectAction = ^() {
        [self.viewAction appToolsViewDidSelectDonate:self];
    };
    
    CCSettingsRowDataSource *shareRow = [[CCSettingsRowDataSource alloc] initWithImage:[UIImage imageNamed:@"appToolShare"] title:NSLocalizedString(@"hello", nil) detail:nil];
    shareRow.selectAction = ^() {
        [self.viewAction appToolsViewDidSelectShareApp:self];
    };
    
    CCSettingsRowDataSource *rateAppRow = [[CCSettingsRowDataSource alloc] initWithImage:[UIImage imageNamed:@"appToolRateApp"] title:NSLocalizedString(@"hello", nil) detail:nil];
    rateAppRow.selectAction = ^() {
        [self.viewAction appToolsViewDidSelectRateApp:self];
    };
    
    CCSettingsRowDataSource *contactWithDevRow = [[CCSettingsRowDataSource alloc] initWithImage:[UIImage imageNamed:@"appToolContact"] title:NSLocalizedString(@"", nil) detail:nil];
    contactWithDevRow.selectAction = ^() {
        [self.viewAction appToolsViewDidSelectContactWithDeveloper:self];
    };
    
    CCSettingsSectionDataSource *socialSection = [[CCSettingsSectionDataSource alloc] initWithRows:@[donateRow, shareRow, rateAppRow, contactWithDevRow]];
    socialSection.headerTitle = NSLocalizedString(@"", nil);
    return socialSection;
}

#pragma mark - CCAppToolsViewProtocol

- (void)updateAppCache:(NSString *)cache {
    self.cacheRow.detail = cache;
    [self.appSettingsView updateDataSource:self.settingsDataSource];
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
