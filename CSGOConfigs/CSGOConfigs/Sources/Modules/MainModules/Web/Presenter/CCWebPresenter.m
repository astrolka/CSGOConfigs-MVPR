//
//  CCWebPresenter.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 22.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCWebPresenter.h"
#import "CCWebPresentationServiceProtocol.h"
#import "CCOpenURLServiceProtocol.h"
#import "CCWebRouterProtocol.h"
#import "CCWebViewProtocol.h"

@interface CCWebPresenter () <CCWebViewActionProtocol>

@property (nonatomic, strong) id <CCOpenURLServiceProtocol> ioc_openURLService;
@property (nonatomic, strong) id <CCWebPresentationServiceProtocol> webPresentationService;

@property (nonatomic, strong) id <CCWebViewProtocol> view;
@property (nonatomic, strong) id <CCWebRouterProtocol> router;

@property (nonatomic, strong) NSURL *url;

@end

@implementation CCWebPresenter

- (instancetype)initWithURL:(NSURL *)url view:(id<CCWebViewProtocol>)view router:(id<CCWebRouterProtocol>)router webPresentationService:(id<CCWebPresentationServiceProtocol>)webPresentationService {
    self = [super init];
    if (self) {
        self.router = router;
        self.view = view;
        self.view.viewAction = self;
        
        self.url = url;
        self.webPresentationService = webPresentationService;
    }
    return self;
}

#pragma mark - CCWebViewActionProtocol

- (void)webViewDidSet:(id <CCWebViewProtocol>)view {
    [self.webPresentationService loadURL:self.url startLoad:^{
        [self.view showSpiner];
    } finishLoad:^{
        [self.view hideSpiner];
    } failLoad:^(NSError *error) {
        [self.view hideSpiner];
        [self.view showMessageWithText:NSLocalizedString(@"", nil)];
    }];
}

- (void)webViewDidPressWebBackButton:(id <CCWebViewProtocol>)view {
    [self.webPresentationService goBack];
}

- (void)webViewDidPressWebForwardButton:(id <CCWebViewProtocol>)view {
    [self.webPresentationService goForward];
}

- (void)webViewDidPressShareButton:(id <CCWebViewProtocol>)view {
    CCShareInfo *shareInfo = [[CCShareInfo alloc] init];
    shareInfo.url = [self.webPresentationService currentURL];
    [self.router openShareScreenWithShareInfo:shareInfo];
}

- (void)webViewDidPressSafariButton:(id <CCWebViewProtocol>)view {
    [self.ioc_openURLService openWebURL:[self.webPresentationService currentURL]];
}

@end
