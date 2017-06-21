//
//  CCEventTableViewCell.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCEventTableViewCell.h"
#import "CCEventViewModel.h"
#import "UIImageView+URL.h"
#import "UIColor+CC.h"
#import "UIFont+CC.h"
#import "Masonry.h"

@interface CCEventTableViewCell ()

@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *cityTitleLabel;
@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) UIImageView *flagImageView;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *prizePoolLabel;

@end

@implementation CCEventTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self logoImageViewSetup];
        [self nameLabelSetup];
        [self cityTitleLabelSetup];
        [self flagImageViewSetup];
        [self cityLabelSetup];
        [self dateLabelSetup];
        [self prizePoolLabelSetup];
    }
    return self;
}

#pragma mark - View

- (void)logoImageViewSetup {
    self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.logoImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.contentView addSubview:self.logoImageView];
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(8);
        make.height.width.equalTo(@20);
    }];
}

- (void)nameLabelSetup {
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.nameLabel.font = [UIFont systemFontOfSize:16];
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    
    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.logoImageView.mas_right).offset(5);
        make.right.equalTo(self.contentView).offset(-8);
        make.top.equalTo(self.contentView).offset(8);
        make.height.equalTo(self.logoImageView.mas_height);
    }];
}

- (void)cityTitleLabelSetup {
    self.cityTitleLabel = [self subStyleLabel];
    self.cityTitleLabel.text = NSLocalizedString(@"", nil);
    self.cityTitleLabel.text = @"dfsdf";
    
    [self.contentView addSubview:self.cityTitleLabel];
    [self.cityTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(8);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(8);
        make.width.equalTo(@65);
    }];
}

- (void)flagImageViewSetup {
    self.flagImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    
    [self.contentView addSubview:self.flagImageView];
    [self.flagImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cityTitleLabel.mas_right).offset(5);
        make.centerY.equalTo(self.cityTitleLabel.mas_centerY);
        make.width.equalTo(@18);
        make.height.equalTo(@12);
    }];
}

- (void)cityLabelSetup {
    self.cityLabel = [self subStyleLabel];
    
    [self.contentView addSubview:self.cityLabel];
    [self.cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.flagImageView.mas_right).offset(5);
        make.right.equalTo(self.contentView).offset(-8);
        make.centerY.equalTo(self.cityTitleLabel.mas_centerY);
    }];
}

- (void)dateLabelSetup {
    self.dateLabel = [self subStyleLabel];
    
    [self.contentView addSubview:self.dateLabel];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(8);
        make.top.equalTo(self.cityLabel.mas_bottom).offset(8);
        make.right.equalTo(self.contentView).offset(-8);
    }];
}

- (void)prizePoolLabelSetup {
    self.prizePoolLabel = [self subStyleLabel];
    
    [self.contentView addSubview:self.prizePoolLabel];
    [self.prizePoolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(8);
        make.top.equalTo(self.dateLabel.mas_bottom).offset(8);
        make.right.equalTo(self.contentView).offset(-8);
        //make.height.equalTo(@19);
    }];
}

- (UILabel *)subStyleLabel {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor darkGrayColor];
    label.font = [UIFont cc_regualarFontWithSize:15];
    return label;
}

#pragma mark - Public

- (void)setEvent:(CCEventViewModel *)event {
    _event = event;
    
    self.nameLabel.text = event.name;
    self.cityLabel.text = event.city;
    self.dateLabel.text = event.date;
    self.prizePoolLabel.text = event.prizePool;
    [self.logoImageView cc_setImageWithURL:event.logoImageURL];
    [self.flagImageView cc_setImageWithURL:event.flagImageURL];
}

+ (CGFloat)defaultCellHeight {
    return 113.f;
}

@end
