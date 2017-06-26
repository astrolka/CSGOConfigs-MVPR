//
//  CCWebPresentationService.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 22.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCWebPresentationService.h"
#import <UIKit/UIWebView.h>
#import "CCLog.h"

@interface CCWebPresentationService () <UIWebViewDelegate>

@property (nonatomic, readwrite) BOOL canGoBack;
@property (nonatomic, readwrite) BOOL canGoForward;
@property (nonatomic, readwrite) BOOL loading;

@property (nonatomic, strong) UIWebView *webView;

@property (nonatomic, copy) webPresentationStartLoadBlock startLoadBlock;
@property (nonatomic, copy) webPresentationFinishLoadBlock finishLoadBlock;
@property (nonatomic, copy) webPresentationDidFailLoadBlock failLoadBlock;

@end

@implementation CCWebPresentationService

- (instancetype)initWithWebView:(UIWebView *)webView {
    NSParameterAssert(webView);
    self = [super init];
    if (self) {
        self.webView = webView;
        self.webView.delegate = self;
    }
    return self;
}

#pragma mark - CCWebPresentationServiceProtocol

- (void)loadURL:(NSURL *)url startLoad:(webPresentationStartLoadBlock)startLoad finishLoad:(webPresentationFinishLoadBlock)finishLoad failLoad:(webPresentationDidFailLoadBlock)failLoad {
    self.startLoadBlock = startLoad;
    self.finishLoadBlock = finishLoad;
    self.failLoadBlock = failLoad;
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)reload {
    [self.webView reload];
}

- (void)stopLoading {
    [self.webView stopLoading];
}

- (void)goBack {
    [self.webView goBack];
}

- (void)goForward {
    [self.webView goForward];
}

- (BOOL)isLoading {
    return self.webView.isLoading;
}

- (BOOL)canGoBack {
    return self.webView.canGoBack;
}

- (BOOL)canGoForward {
    return self.webView.canGoForward;
}

- (NSURL *)currentURL {
    return self.webView.request.URL;
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    if (self.startLoadBlock) {
        self.startLoadBlock();
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    if (self.finishLoadBlock) {
        self.finishLoadBlock();
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    CCLog(@"WebPresentationService did fail load with error: %@", error);
    if (self.failLoadBlock) {
        self.failLoadBlock(error);
    }
}

@end
