//
//  CCWebRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 22.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCWebRouter.h"
#import "CCWebViewController.h"
#import "CCWebPresenter.h"
#import "CCWebPresentationService.h"

@interface CCWebRouter ()

@end

@implementation CCWebRouter

#pragma mark - Public

- (void)gotToWebScreenWithURL:(NSURL *)url {
    UIViewController *viewController = (UIViewController *)[self buildModuleWithURL:url];
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - Module build

- (id <CCWebViewProtocol>)buildModuleWithURL:(NSURL *)url {
    CCWebViewController *view = [[CCWebViewController alloc] init];
    CCWebPresentationService *webPresentationService = [[CCWebPresentationService alloc] initWithWebView:view.webView];
    CCWebPresenter *presenter = [[CCWebPresenter alloc] initWithURL:url view:view router:self webPresentationService:webPresentationService];
    #pragma unused(presenter)
    return view;
}



@end
