//
//  CCSideMenuTableViewCell.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCSideMenuTableViewCell.h"
#import "CCSideMenuModel.h"
#import "UIColor+CC.h"
#import "UIFont+CC.h"
#import "Masonry.h"

@interface CCSideMenuTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *iconImageView;

@end

@implementation CCSideMenuTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor cc_themeColor];
        [self setupIconImageView];
        [self setupTitleLabel];
    }
    return self;
}

#pragma mark - UI Setup

- (void)setupTitleLabel {
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont cc_regualarFontWithSize:16];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(10);
        make.right.equalTo(self.contentView).offset(-8);
        make.height.equalTo(@25);
        make.centerY.equalTo(self.contentView);
    }];
}

- (void)setupIconImageView {
    self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.iconImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    [self.contentView addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(8);
        make.centerY.equalTo(self.contentView);
        make.height.width.equalTo(@25);
    }];
}

#pragma mark - Public

- (void)setSideMenuModel:(CCSideMenuModel *)sideMenuModel {
    _sideMenuModel = sideMenuModel;
    
    self.titleLabel.text = sideMenuModel.title;
    self.iconImageView.image = sideMenuModel.icon;
}

+ (CGFloat)defaultCellHeight {
    return 50.f;
}

@end
