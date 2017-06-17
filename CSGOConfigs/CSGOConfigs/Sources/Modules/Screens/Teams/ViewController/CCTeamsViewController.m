//
//  CCTeamsViewController.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCTeamsViewController.h"
#import "Masonry.h"
#import "UIView+CCSpiner.h"
#import "UIView+CCMessageView.h"
#import "CCTeamsListView.h"
#import "CCBannerView.h"
#import "CCSideMenuFactory.h"

@interface CCTeamsViewController () <CCTeamsListViewActionProtocol>

@property (nonatomic, strong) CCTeamsListView *teamsView;
@property (strong, nonatomic) UIView <CCBannerViewProtocol> *bannerView;

@end

@implementation CCTeamsViewController

@synthesize viewAction;

- (id)initWithBannerView:(UIView <CCBannerViewProtocol> *)bannerView {
    self = [super init];
    if (self) {
        self.bannerView = bannerView;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = NSLocalizedString(@"kTeamsNavigationTitle", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self menuButtonSetup];
    [self bannerViewSetup];
    [self teamsViewSetup];
    [self.viewAction teamsViewDidSet:self];
}

- (void)teamsViewSetup {
    self.teamsView = [[CCTeamsListView alloc] initWithFrame:CGRectZero];
    self.teamsView.viewAction = self;
    
    [self.view addSubview:self.teamsView];
    [self.teamsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.top.equalTo(self.bannerView.mas_bottom);
    }];
}

- (void)bannerViewSetup {
    [self.view addSubview:self.bannerView];
    [self.bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(@100);
    }];
}

- (void)menuButtonSetup {
    self.navigationItem.leftBarButtonItem = [CCSideMenuFactory menuBarButtonWithSelector:@selector(actionOpenSideMenu:) forObject:self];
}

#pragma mark - CCTeamsViewProtocol

- (void)showTeams:(NSArray <CCTeamViewModel *> *)teams {
    [self.teamsView showTeams:teams];
}

#pragma mark - CCTeamsListViewActionProtocol

- (void)teamsListView:(CCTeamsListView *)view didSelectTeamAtIndex:(NSUInteger)teamIndex playerAtIndex:(NSUInteger)playerIndex {
    [self.viewAction teamsView:self didSelectTeamAtIndex:teamIndex playerIndex:playerIndex];
}

- (void)teamsListView:(CCTeamsListView *)view didScrollTeamAtIndex:(NSUInteger)index {
    [self.viewAction teamsView:self didScrollPlayerAtIndex:index];
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

- (void)actionOpenSideMenu:(UIButton *)button {
    [self.viewAction teamsViewDidOpenMenu:self];
}

@end
