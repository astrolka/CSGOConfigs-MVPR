//
//  CCSkinTableViewCell.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCSkinTableViewCell.h"
#import "CCSkinViewModel.h"
#import "UIImageView+URL.h"
#import "UIFont+CC.h"
#import "Masonry.h"

@interface CCSkinTableViewCell ()

@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *exteriorLabel;
@property (nonatomic, strong) UILabel *priceLabel;

@end

@implementation CCSkinTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self coverImageViewSetup];
        [self nameLabelSetup];
        self.exteriorLabel = [self subStyleLabelWithTopView:self.nameLabel];
        self.priceLabel = [self subStyleLabelWithTopView:self.exteriorLabel];
    }
    return self;
}

#pragma mark - UI Setup

- (void)coverImageViewSetup {
    self.coverImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    
    [self.contentView addSubview:self.coverImageView];
    [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(8);
        make.bottom.equalTo(self.contentView).offset(-8);
        make.width.equalTo(@100);
    }];
}

- (void)nameLabelSetup {
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.nameLabel.font = [UIFont cc_regualarFontWithSize:16];
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    
    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(8);
        make.left.equalTo(self.coverImageView.mas_right).offset(8);
        make.right.equalTo(self.contentView).offset(-8);
    }];
}

- (UILabel *)subStyleLabelWithTopView:(UIView *)topView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = [UIFont cc_regualarFontWithSize:15];
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor darkGrayColor];
    
    [self.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView.mas_bottom).offset(8);
        make.left.equalTo(self.coverImageView.mas_right).offset(8);
        make.right.equalTo(self.contentView).offset(-8);
    }];
    
    return label;
}

#pragma mark - Public

-(void)setSkin:(CCSkinViewModel *)skin {
    _skin = skin;
    
    self.nameLabel.text = skin.name;
    self.exteriorLabel.text = skin.exterior;
    self.priceLabel.text = skin.price;
    [self.coverImageView cc_setImageWithURL:skin.coverImageURL];
}

+ (CGFloat)defaultCellHeight {
    return 88.f;
}

@end
