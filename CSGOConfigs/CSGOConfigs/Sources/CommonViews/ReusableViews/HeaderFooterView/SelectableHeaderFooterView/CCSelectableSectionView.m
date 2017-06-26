//
//  CCSelectableSectionView.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 11.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCSelectableSectionView.h"
#import "UIColor+CC.h"
#import "UIFont+CC.h"
#import "Masonry.h"

@interface CCSelectableSectionView ()

@property (nonatomic, strong) UILabel *titleLabelz;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation CCSelectableSectionView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self lineViewSetup];
        [self titleLabelSetup];
        [self selectButtonSetup];
    }
    return self;
}

#pragma mark - UI Setup

- (void)lineViewSetup {
    self.lineView = [[UIView alloc] initWithFrame:CGRectZero];
    self.lineView.backgroundColor = [UIColor cc_themeColor];
    self.lineView.layer.cornerRadius = 2;
    self.lineView.layer.masksToBounds = YES;

    [self.contentView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(8);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@4);
        make.width.equalTo(@12);
    }];
}

- (void)titleLabelSetup {
    self.titleLabelz = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabelz.textColor = [UIColor cc_themeColor];
    self.titleLabelz.font = [UIFont cc_regualarFontWithSize:16];
    
    [self.contentView addSubview:self.titleLabelz];
    [self.titleLabelz mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lineView.mas_right).offset(8);
        make.right.equalTo(self.contentView).offset(-8);
        make.centerY.equalTo(self.contentView);
    }];
}

- (void)selectButtonSetup {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
    [button setTitle:nil forState:UIControlStateNormal];
    [button addTarget:self action:@selector(actionPressButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

#pragma mark - Action

- (void)actionPressButton:(UIButton *)button {
    if (self.pressSection) {
        self.pressSection(self);
    }
}

#pragma mark - Public

- (void)setTitle:(NSString *)title {
    _title = title;
    
    self.titleLabelz.text = title;
}

@end
