//
//  CCWebViewProtocol.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 22.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCMessageViewProtocol.h"
#import "CCSpinerViewProtocol.h"
@protocol CCWebViewProtocol;
@class UIWebView;

@protocol CCWebViewActionProtocol <NSObject>

- (void)webViewDidSet:(id <CCWebViewProtocol>)view;

- (void)webViewDidPressWebBackButton:(id <CCWebViewProtocol>)view;

- (void)webViewDidPressWebForwardButton:(id <CCWebViewProtocol>)view;

- (void)webViewDidPressShareButton:(id <CCWebViewProtocol>)view;

- (void)webViewDidPressSafariButton:(id <CCWebViewProtocol>)view;

@end

@protocol CCWebViewProtocol <CCSpinerViewProtocol, CCMessageViewProtocol>

@property (nonatomic, strong) id <CCWebViewActionProtocol> viewAction;

@property (nonatomic, strong, readonly) UIWebView *webView;

@end
