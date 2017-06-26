//
//  CCNewsDescriptionHeaderView.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 19.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsDescriptionHeaderView.h"
#import "CCNewsDescriptionViewModel.h"
#import "UIColor+CC.h"
#import "UIFont+CC.h"
#import "Masonry.h"

@interface CCNewsDescriptionHeaderView ()

@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *authorLabel;

@end

@implementation CCNewsDescriptionHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self subtitleLabelSetup];
        [self dateLabelSetup];
        [self authorLabelSetup];
        [self descriptionButtonSetup];
    }
    return self;
}

#pragma mark - UI Setup

- (void)subtitleLabelSetup {
    self.subtitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.subtitleLabel.numberOfLines = 0;
    self.subtitleLabel.font = [UIFont cc_regualarFontWithSize:16];
    
    [self.contentView addSubview:self.subtitleLabel];
    [self.subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(8);
        make.right.equalTo(self.contentView).offset(8);
    }];
}

- (void)dateLabelSetup {
    self.dateLabel = [self subtitleStyleLabelWithTopView:self.subtitleLabel];
}

- (void)authorLabelSetup {
    self.authorLabel = [self subtitleStyleLabelWithTopView:self.dateLabel];
}

- (void)descriptionButtonSetup {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
    button.backgroundColor = [UIColor cc_themeColor];
    button.titleLabel.font = [UIFont cc_mediumFontWithSize:16];
    button.titleLabel.textColor = [UIColor whiteColor];
    [button addTarget:self action:@selector(actionDescription:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(8);
        make.right.equalTo(self.contentView).offset(-8);
        make.top.equalTo(self.authorLabel.mas_bottom).offset(8);
        make.height.equalTo(@44);
    }];
}

- (UILabel *)subtitleStyleLabelWithTopView:(UIView *)topView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.textColor = [UIColor darkGrayColor];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont cc_mediumFontWithSize:15];
    
    [self.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(8);
        make.right.equalTo(self.contentView).offset(-8);
        make.top.equalTo(topView.mas_bottom).offset(8);
        make.height.equalTo(@17);
    }];
    
    return label;
}

#pragma mark - Public

- (void)setNewsDescriptionViewModel:(CCNewsDescriptionViewModel *)newsDescriptionViewModel {
    _newsDescriptionViewModel = newsDescriptionViewModel;
    
    self.subtitleLabel.text = newsDescriptionViewModel.subtitle;
    self.dateLabel.text = newsDescriptionViewModel.date;
    self.authorLabel.text = newsDescriptionViewModel.author;
}

#pragma mark - Action 

- (void)actionDescription:(UIButton *)button {
    if (self.pressDescriptionButton) {
        self.pressDescriptionButton(self);
    }
}

@end
