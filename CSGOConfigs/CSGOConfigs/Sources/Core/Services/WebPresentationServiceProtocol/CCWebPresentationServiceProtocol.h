//
//  CCWebPresentationServiceProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 22.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIWebView.h>

/*
 
    This class allow you to work with webview methods/callbacks from Presenter with more comfortable API
    The main idea of the class, that View layer now does't make any 'hard' logic as loading URLs, cheak availability to go to previous page and so on
    (Yes, we steel do all this functions via webView, but not in View class (where is webView)
    In the result View layer does't know uiwebview functions (does't use them), Presenter does't know anything about UIWebView class, but steel can work with web methods via this class
 
*/

typedef void(^webPresentationStartLoadBlock)();
typedef void(^webPresentationFinishLoadBlock)();
typedef void(^webPresentationDidFailLoadBlock)(NSError *error);

@protocol CCWebPresentationServiceProtocol <NSObject>

@property (nonatomic, readonly, getter=canGoBack) BOOL canGoBack;
@property (nonatomic, readonly, getter=canGoForward) BOOL canGoForward;
@property (nonatomic, readonly, getter=isLoading) BOOL loading;

- (void)loadURL:(NSURL *)url startLoad:(webPresentationStartLoadBlock)startLoad finishLoad:(webPresentationFinishLoadBlock)finishLoad failLoad:(webPresentationDidFailLoadBlock)failLoad;

- (void)reload;
- (void)stopLoading;

- (void)goBack;
- (void)goForward;

- (NSURL *)currentURL;

@end
