//
//  CCWebPresenter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 22.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCWebPresenter.h"
#import "CCWebPresentationServiceProtocol.h"
#import "CCWebViewProtocol.h"
#import "CCWebRouterProtocol.h"
#import "CCWebPresentationServiceProtocol.h"

@interface CCWebPresenter () <CCWebViewActionProtocol>

@property (nonatomic, strong) id <CCWebPresentationServiceProtocol> webPresentationService;

@property (nonatomic, strong) NSURL *url;

@property (nonatomic, strong) id <CCWebViewProtocol> view;
@property (nonatomic, strong) id <CCWebRouterProtocol> router;

@end

@implementation CCWebPresenter

- (instancetype)initWithURL:(NSURL *)url view:(id<CCWebViewProtocol>)view router:(id<CCWebRouterProtocol>)router webPresentationService:(id<CCWebPresentationServiceProtocol>)webPresentationService {
    self = [super init];
    if (self) {
        self.url = url;
        self.webPresentationService = webPresentationService;
        self.router = router;
        self.view = view;
        self.view.viewAction = self;
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
    
}

- (void)webViewDidPressSafariButton:(id <CCWebViewProtocol>)view {
    
}

@end
