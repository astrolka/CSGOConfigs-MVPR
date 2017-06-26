//
//  CCCenterButtonView.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 11.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCCenterButtonView.h"
#import "UIColor+CC.h"
#import "UIFont+CC.h"
#import <Masonry/Masonry.h>

@interface CCCenterButtonView ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation CCCenterButtonView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self buttonSetup];
    }
    return self;
}

#pragma mark - Setup UI

- (void)buttonSetup {
    self.button = [[UIButton alloc] initWithFrame:CGRectZero];
    self.button.titleLabel.font = [UIFont cc_regualarFontWithSize:16];
    self.button.backgroundColor = [UIColor cc_themeColor];
    self.button.layer.cornerRadius = 6.f;
    self.button.layer.shadowOffset = CGSizeMake(0, 6);
    self.button.layer.shadowRadius = 4;
    self.button.layer.shadowOpacity = 0.4;
    [self.button addTarget:self action:@selector(actionButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
}

#pragma mark - Public

- (void)setButtonTitle:(NSString *)buttonTitle {
    _buttonTitle = buttonTitle;
    
    [self.button setTitle:buttonTitle forState:UIControlStateNormal];
}

#pragma mark - Action

- (void)actionButtonPressed:(UIButton *)button {
    if (self.pressButton) {
        self.pressButton(self);
    }
}

@end
