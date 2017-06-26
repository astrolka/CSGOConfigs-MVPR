//
//  CCPlayerPersonalInfoView.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 11.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayerPersonalInfoView.h"
#import "CCPlayerDescriptionViewModel.h"
#import "UIImageView+URL.h"
#import "UIColor+CC.h"
#import "UIFont+CC.h"
#import "Masonry.h"

@interface CCPlayerPersonalInfoView ()

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIView *profileImageContainerView;
@property (nonatomic, strong) UIImageView *profileImageView;

@property (nonatomic, strong) UIView *teamContainerView;
@property (nonatomic, strong) UILabel *teamTitleLabel;
@property (nonatomic, strong) UILabel *teamLabel;
@property (nonatomic, strong) UIImageView *teamImageView;

@property (nonatomic, strong) UIView *countryContainerView;
@property (nonatomic, strong) UILabel *countryTitleLabel;
@property (nonatomic, strong) UILabel *countryLabel;
@property (nonatomic, strong) UIImageView *countryImageView;

@end

@implementation CCPlayerPersonalInfoView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self profileImageViewSetup];
        [self nameLabelSetup];
        [self teamViewsSetup];
        [self countryViewsSetup];
        [self moreInfoButtonSetup];
    }
    return self;
}

#pragma mark - Setup UI

- (void)profileImageViewSetup {
    self.profileImageContainerView = [[UIView alloc] initWithFrame:CGRectZero];
    self.profileImageContainerView.layer.cornerRadius = 8.f;
    self.profileImageContainerView.layer.masksToBounds = YES;
    
    [self addSubview:self.profileImageContainerView];
    [self.profileImageContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(8);
        make.bottom.equalTo(self).offset(-8);
        make.width.equalTo(@120);
    }];
    
    
    self.profileImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.profileImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    [self.profileImageContainerView addSubview:self.profileImageView];
    [self.profileImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.profileImageContainerView);
    }];
}

- (void)nameLabelSetup {
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.nameLabel.textColor = [UIColor cc_themeColor];
    self.nameLabel.font = [UIFont cc_regualarFontWithSize:16];

    [self addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.profileImageContainerView.mas_right).offset(8);
        make.right.equalTo(self).offset(-8);
        make.top.equalTo(self).offset(8);
    }];
}

- (void)teamViewsSetup {
    self.teamContainerView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self addSubview:self.teamContainerView];
    [self.teamContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.profileImageContainerView.mas_right).offset(8);
        make.right.equalTo(self).offset(-8);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(8);
        make.height.equalTo(@20);
    }];
    
    self.teamTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.teamTitleLabel.font = [UIFont cc_regualarFontWithSize:16];
    self.teamTitleLabel.textColor = [UIColor cc_themeColor];
    
    [self.teamContainerView addSubview:self.teamTitleLabel];
    [self.teamTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.teamContainerView.mas_left);
        make.width.greaterThanOrEqualTo(@30);
        make.top.bottom.equalTo(self.teamContainerView);
    }];
    
    self.teamImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    
    [self.teamContainerView addSubview:self.teamImageView];
    [self.teamImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.teamTitleLabel.mas_right).offset(2);
        make.top.bottom.equalTo(self.teamContainerView);
        make.width.equalTo(@16);
    }];
    
    self.teamLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.teamLabel.font = [UIFont cc_regualarFontWithSize:16];
    self.teamLabel.textColor = [UIColor cc_themeColor];
    
    [self.teamContainerView addSubview:self.teamLabel];
    [self.teamLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.teamImageView.mas_right).offset(4);
        make.top.bottom.right.equalTo(self.teamContainerView);
    }];
}

- (void)countryViewsSetup {
    self.countryContainerView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self addSubview:self.countryContainerView];
    [self.countryContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.profileImageContainerView.mas_right).offset(8);
        make.right.equalTo(self).offset(-8);
        make.top.equalTo(self.teamContainerView.mas_bottom).offset(8);
        make.height.equalTo(@20);
    }];
    
    self.countryTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.countryTitleLabel.font = [UIFont cc_regualarFontWithSize:16];
    self.countryTitleLabel.textColor = [UIColor cc_themeColor];
    
    [self.countryContainerView addSubview:self.countryTitleLabel];
    [self.countryTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.countryContainerView.mas_left);
        make.width.greaterThanOrEqualTo(@30);
        make.top.bottom.equalTo(self.countryContainerView);
    }];
    
    self.countryImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    
    [self.countryContainerView addSubview:self.countryImageView];
    [self.countryImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.countryTitleLabel.mas_right).offset(2);
        make.height.equalTo(@11);
        make.width.equalTo(@17);
        make.centerY.equalTo(self.countryContainerView);
    }];
    
    self.countryLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.countryLabel.font = [UIFont cc_regualarFontWithSize:16];
    self.countryLabel.textColor = [UIColor cc_themeColor];
    
    [self.countryContainerView addSubview:self.countryLabel];
    [self.countryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.countryImageView.mas_right).offset(4);
        make.top.bottom.right.equalTo(self.countryContainerView);
    }];
}

- (void)moreInfoButtonSetup {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
    button.backgroundColor = [UIColor cc_themeColor];
    button.titleLabel.textColor = [UIColor whiteColor];
    button.titleLabel.font = [UIFont cc_regualarFontWithSize:16];
    [button addTarget:self action:@selector(actionMoreInfo:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:NSLocalizedString(@"", nil) forState:UIControlStateNormal];
    button.layer.cornerRadius = 6.f;
    button.layer.shadowOffset = CGSizeMake(0, 6);
    button.layer.shadowRadius = 4;
    button.layer.shadowOpacity = 0.4;
    
    [self addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.profileImageContainerView.mas_right).offset(8);
        make.right.bottom.equalTo(self).offset(-8);
        make.height.equalTo(@44);
    }];
}

#pragma mark - Public

- (void)updateWithViewModel:(CCPlayerDescriptionViewModel *)viewModel {
    self.nameLabel.text = viewModel.name;
    [self.profileImageView cc_setImageWithURL:viewModel.profileImageURL];
    
    self.teamTitleLabel.text = [NSString stringWithFormat:@"%@:", NSLocalizedString(@"", nil)];;
    self.teamLabel.text = viewModel.teamName;
    [self.teamImageView cc_setImageWithURL:viewModel.temaImageURL];
    
    self.countryTitleLabel.text = [NSString stringWithFormat:@"%@:", NSLocalizedString(@"", nil)];
    self.countryLabel.text = viewModel.country;
    [self.countryImageView cc_setImageWithURL:viewModel.countryImageURL];
}

#pragma mark - Action

- (void)actionMoreInfo:(UIButton *)button {
    if (self.moreInfoButton) {
        self.moreInfoButton(self);
    }
}

@end
