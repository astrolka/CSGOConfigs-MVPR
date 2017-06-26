//
//  CCTextViewAlertController.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCTextViewAlertController.h"
#import "CCAlertButtonsContainerView.h"
#import "CCAlertControllerAnimator.h"
#import "CCViewModelAlertAction.h"
#import "UIFont+CC.h"
#import "Masonry.h"

@interface CCTextViewAlertController () <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) UIView *alertView;

@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, strong) CCAlertButtonsContainerView *buttonsContainerView;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

@property (nonatomic, strong) CCAlertControllerAnimator *animator;

@end

@implementation CCTextViewAlertController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self;
        self.animator = [CCAlertControllerAnimator new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.4];
    [self setupAlertView];
    [self setupTitleView];
    [self setupButtonsContainerView];
    [self setupContentView];
}

#pragma mark - Setup UI

- (void)setupAlertView {
    self.alertView = [[UIView alloc] init];
    self.alertView.layer.cornerRadius = 13.f;
    self.alertView.clipsToBounds = YES;
    self.alertView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.alertView];
    [self.alertView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.left.equalTo(self.view).offset(25);
        make.right.equalTo(self.view).offset(-25);
    }];
}

- (void)setupTitleView {
    self.titleView = [[UIView alloc] init];
    self.titleView.backgroundColor = [UIColor clearColor];
    
    [self.alertView addSubview:self.titleView];
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.alertView);
        make.height.greaterThanOrEqualTo(@44);
    }];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.text = self.alertTitle;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont cc_regualarFontWithSize:17];
    
    [self.titleView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView).offset(21.5);
        make.right.equalTo(self.titleView).offset(-20);
        make.left.equalTo(self.titleView).offset(20);
        make.bottom.equalTo(self.titleView).offset(-8);
    }];
}

- (void)setupButtonsContainerView {
    self.buttonsContainerView = [[CCAlertButtonsContainerView alloc] initWithInterButtonSeparatorLayer:YES];
    self.buttonsContainerView.backgroundColor = [UIColor clearColor];
    
    [self.alertView addSubview:self.buttonsContainerView];
    [self.buttonsContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.alertView);
        make.height.equalTo(@44);
    }];
    
    self.leftButton = [self buttonWithAlertAction:self.leftButtonAction];
    
    [self.buttonsContainerView addSubview:self.leftButton];
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self.buttonsContainerView);
        make.width.equalTo(self.buttonsContainerView.mas_width).multipliedBy(0.5);
    }];
    
    self.rightButton = [self buttonWithAlertAction:self.rightButtonAction];
    
    [self.buttonsContainerView addSubview:self.rightButton];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(self.buttonsContainerView);
        make.width.equalTo(self.buttonsContainerView.mas_width).multipliedBy(0.5);
    }];
}

- (void)setupContentView {
    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = [UIColor clearColor];
    
    [self.alertView addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.equalTo(self.alertView);
        make.top.equalTo(self.titleView.mas_bottom);
        make.bottom.equalTo(self.buttonsContainerView.mas_top);
    }];
    
    self.textView = [UITextView new];
    self.textView.textAlignment = NSTextAlignmentCenter;
    self.textView.backgroundColor = [UIColor clearColor];
    self.textView.scrollEnabled = NO;
    self.textView.editable = NO;
    self.textView.selectable = YES;
    self.textView.font = [UIFont cc_regualarFontWithSize:13];
    self.textView.text = self.alertText;
    self.textView.attributedText = self.attributedAlertText;
    
    [self.contentView addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
        make.size.equalTo(self.contentView).sizeOffset(CGSizeMake(-40, 0));
    }];
}

#pragma mark - Accessors

- (void)setLeftButtonAction:(CCViewModelAlertAction *)leftButtonAction {
    _leftButtonAction = leftButtonAction;
    [self configureButton:self.leftButton withAlertAction:leftButtonAction];
}

- (void)setRightButtonAction:(CCViewModelAlertAction *)rightButtonAction {
    _rightButtonAction = rightButtonAction;
    [self configureButton:self.rightButton withAlertAction:rightButtonAction];
}

- (void)setAlertText:(NSString *)alertText {
    _alertText = alertText;
    self.textView.text = alertText;
}

- (void)setAttributedAlertText:(NSAttributedString *)attributedAlertText {
    _attributedAlertText = attributedAlertText;
    self.textView.attributedText = attributedAlertText;
}

- (void)setAlertTitle:(NSString *)alertTitle {
    _alertTitle = alertTitle;
    self.titleLabel.text = alertTitle;
}

#pragma mark - Private

- (void)buttonTapped:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if (button == self.leftButton && self.leftButtonAction.action != nil) {
        self.leftButtonAction.action();
    } else if (button == self.rightButton && self.rightButtonAction.action != nil) {
        self.rightButtonAction.action();
    }
}

- (UIButton *)buttonWithAlertAction:(CCViewModelAlertAction *)alertAction {
    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = [UIColor clearColor];
    [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self configureButton:button withAlertAction:alertAction];
    return button;
}

- (void)configureButton:(UIButton *)button withAlertAction:(CCViewModelAlertAction *)alertAction {
    [button setTitle:alertAction.title forState:UIControlStateNormal];
    switch ((UIAlertActionStyle)alertAction.style) {
        case UIAlertActionStyleCancel:
            button.titleLabel.font = [UIFont cc_regualarFontWithSize:17];
            [button setTitleColor:[self iosAlertButtonsColor] forState:UIControlStateNormal];
            break;
            
        case UIAlertActionStyleDefault:
            button.titleLabel.font = [UIFont cc_regualarFontWithSize:17];
            [button setTitleColor:[self iosAlertButtonsColor] forState:UIControlStateNormal];
            break;
            
        case UIAlertActionStyleDestructive:
            button.titleLabel.font = [UIFont cc_regualarFontWithSize:17];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            break;
    }
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.animator.presenting = NO;
    return self.animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    self.animator.presenting = YES;
    return self.animator;
}

#pragma mark - Private

- (UIColor *)iosAlertButtonsColor {
    return [UIColor colorWithRed:0.f green:122.f/255.f blue:1.f/255.f alpha:1.f];
}

@end
