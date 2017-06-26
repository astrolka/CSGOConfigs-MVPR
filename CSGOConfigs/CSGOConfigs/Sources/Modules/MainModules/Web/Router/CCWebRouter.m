//
//  CCWebRouter.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 22.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCWebRouter.h"
#import "CCRouter+ShareActivityPresenter.h"
#import "CCWebPresentationService.h"
#import "CCWebViewController.h"
#import "CCWebPresenter.h"

@interface CCWebRouter ()

@end

@implementation CCWebRouter

#pragma mark - Public

- (void)gotToWebScreenWithURL:(NSURL *)url {
    UIViewController *viewController = (UIViewController *)[self buildModuleWithURL:url];
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - CCShareRoutingProtocol

- (void)openShareScreenWithShareInfo:(CCShareInfo *)shareInfo {
    [self cc_presentShareActivityViewControllerWithShareInfo:shareInfo];
}

#pragma mark - Module Build

- (id <CCWebViewProtocol>)buildModuleWithURL:(NSURL *)url {
    CCWebViewController *view = [[CCWebViewController alloc] init];
    CCWebPresentationService *webPresentationService = [[CCWebPresentationService alloc] initWithWebView:view.webView];
    CCWebPresenter *presenter = [[CCWebPresenter alloc] initWithURL:url view:view router:self webPresentationService:webPresentationService];
    #pragma unused(presenter)
    return view;
}



@end
