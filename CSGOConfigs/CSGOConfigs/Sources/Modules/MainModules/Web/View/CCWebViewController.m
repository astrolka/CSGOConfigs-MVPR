//
//  CCWebViewController.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 22.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCWebViewController.h"
#import "UIView+CCMessageView.h"
#import "UIView+CCSpiner.h"
#import "UIColor+CC.h"
#import "Masonry.h"

@interface CCWebViewController () <UIWebViewDelegate>

@property (nonatomic, strong, readwrite) UIWebView *webView;

@end

@implementation CCWebViewController

@synthesize viewAction;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.title = NSLocalizedString(@"kPlayerNavigationTitle", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self webViewSetup];
    [self toolBarSetup];
    
    [self.viewAction webViewDidSet:self];
}

#pragma mark - UI Setup

- (void)webViewSetup {
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)toolBarSetup {
    UIBarButtonItem *flexibleSpace =  [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *backButton = [self barButtonWithImage:[UIImage imageNamed:@"webBackArrowIcon"] selector:@selector(actionWebBackButton:)];
    UIBarButtonItem *forwardButton = [self barButtonWithImage:[UIImage imageNamed:@"webForwardArrowIcon"] selector:@selector(actionWebForwardButton:)];
    UIBarButtonItem *shareButton = [self barButtonWithImage:[UIImage imageNamed:@"shareWebViewIcon"] selector:@selector(actionShare:)];
    UIBarButtonItem *safariButton = [self barButtonWithImage:[UIImage imageNamed:@"safariIcon"] selector:@selector(actionOpenInSafari:)];
    NSArray *toolBarItems = @[backButton, flexibleSpace, forwardButton, flexibleSpace, shareButton, flexibleSpace, safariButton];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectZero];
    toolBar.items = toolBarItems;
    [self.view addSubview:toolBar];
    [toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.height.equalTo(@44);
    }];
}

- (UIBarButtonItem *)barButtonWithImage:(UIImage *)image selector:(SEL)selector  {
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleDone target:self action:selector];
    button.tintColor = [UIColor cc_themeColor];
    return button;
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

- (void)actionWebBackButton:(UIButton *)button {
    [self.viewAction webViewDidPressWebBackButton:self];
}

- (void)actionWebForwardButton:(UIButton *)button {
    [self.viewAction webViewDidPressWebForwardButton:self];
}

- (void)actionOpenInSafari:(UIButton *)button {
    [self.viewAction webViewDidPressSafariButton:self];
}

- (void)actionShare:(UIButton *)button {
    [self.viewAction webViewDidPressShareButton:self];
}

@end
