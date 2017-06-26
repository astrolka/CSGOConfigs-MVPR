//
//  CCAppToolsPresenter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCAppToolsPresenter.h"
#import "CCLocalStorageServiceProtocol.h"
#import "CCAppToolsRouterProtocol.h"
#import "CCOpenURLServiceProtocol.h"
#import "CCAppToolsViewProtocol.h"
#import "CCEmailInfoFactory.h"
#import "CCShareInfoFactory.h"
#import "CCViewModelAlert.h"

@interface CCAppToolsPresenter () <CCAppToolsViewActionProtocol>

@property (nonatomic, strong) id <CCLocalStorageServiceProtocol> ioc_localStorageService;
@property (nonatomic, strong) id <CCOpenURLServiceProtocol> ioc_openURLService;

@property (nonatomic, weak) id <CCAppToolsViewProtocol> view;
@property (nonatomic, strong) id <CCAppToolsRouterProtocol> router;

@end

@implementation CCAppToolsPresenter

- (instancetype)initWithView:(id <CCAppToolsViewProtocol>)view router:(id <CCAppToolsRouterProtocol>)router {
    self = [super init];
    if (self) {
        self.router = router;
        self.view = view;
        self.view.viewAction = self;
    }
    return self;
}

#pragma mark - CCAppToolsViewActionProtocol

- (void)appToolsViewDidSet:(id <CCAppToolsViewProtocol>)view {
    [self updateCacheSize];
}

- (void)appToolsViewDidOpenMenu:(id <CCAppToolsViewProtocol>)view {
    [self.router openSideMenu];
}

- (void)appToolsViewDidSelectClearCache:(id <CCAppToolsViewProtocol>)view {
    [self.ioc_localStorageService clearImagesCache];
    [self.view showMessageWithText:NSLocalizedString(@"", nil)];
}

- (void)appToolsViewDidSelectDonate:(id <CCAppToolsViewProtocol>)view {
    [self.ioc_openURLService openWebURL:[NSURL URLWithString:@"https://steamcommunity.com/tradeoffer/new/?partner=76158124&token=jIuWTN4y"]];
}

- (void)appToolsViewDidSelectContactWithDeveloper:(id <CCAppToolsViewProtocol>)view {
    [self.router openEmailScreenWithEmailInfo:[CCEmailInfoFactory emailInfoForContactWithDeveloper] withResult:^(CCMailResult result) {
        if (result == CCMailResultNoAccount) {
            [self showNoEmailAccountAlert];
        }
    }];
}

- (void)appToolsViewDidSelectShareApp:(id <CCAppToolsViewProtocol>)view {
    [self.router openShareScreenWithShareInfo:[CCShareInfoFactory appShareInfo]];
}

- (void)appToolsViewDidSelectRateApp:(id <CCAppToolsViewProtocol>)view {
    [self.ioc_openURLService openWebURL:[NSURL URLWithString:@""]];
}

#pragma mark - Private

- (void)showNoEmailAccountAlert {
    CCViewModelAlert *alert = [[CCViewModelAlert alloc] initWithTitle:NSLocalizedString(@"", nil) message:NSLocalizedString(@"", nil)];
    [alert addAction:[CCViewModelAlertAction cancelActionWithAction:nil]];
    CCViewModelAlertAction *settingsAlertAction = [[CCViewModelAlertAction alloc] initWithTitle:NSLocalizedString(@"", nil) action:^{
        [self.ioc_openURLService openApplicationSettings];
    }];
    [alert addAction:settingsAlertAction];
    [self.router showViewModelAlert:alert];
}

- (void)updateCacheSize {
    NSUInteger cacheSizeInt = [self.ioc_localStorageService getImageCacheSize];
    if (cacheSizeInt == 0) {
        [self.view updateAppCache:NSLocalizedString(@"", nil)];
    } else {
        CGFloat cacheSizeFloat = (CGFloat)cacheSizeInt / 1000000;
        [self.view updateAppCache:[NSString stringWithFormat:@"%.02f M", cacheSizeFloat]];
    }
}

@end
