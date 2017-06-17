//
//  CCPlayerInfoTableViewCell.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 17.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayerInfoTableViewCell.h"
#import "UIColor+CC.h"
#import "UIFont+CC.h"
#import "Masonry.h"

@interface CCPlayerInfoTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabelz;
@property (nonatomic, strong) UIView *pointView;

@end

@implementation CCPlayerInfoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self pointViewSetup];
        [self titleLabelSetup];
    }
    return self;
}

#pragma mark - View

- (void)pointViewSetup {
    self.pointView = [[UIView alloc] initWithFrame:CGRectZero];
    self.pointView.backgroundColor = [UIColor cc_themeColor];
    self.pointView.layer.cornerRadius = 3.f;
    self.pointView.layer.masksToBounds = YES;
    
    [self.contentView addSubview:self.pointView];
    [self.pointView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(8);
        make.centerY.equalTo(self.contentView);
        make.height.width.equalTo(@6);
    }];
}

- (void)titleLabelSetup {
    self.titleLabelz = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabelz.textColor = [UIColor cc_themeColor];
    self.titleLabelz.font = [UIFont cc_regualarFontWithSize:16];
    
    [self.contentView addSubview:self.titleLabelz];
    [self.titleLabelz mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.pointView.mas_right).offset(8);
        make.right.equalTo(self.contentView).offset(-8);
        make.centerY.equalTo(self.contentView);
    }];
}

#pragma mark - Public

- (void)setTitle:(NSString *)title {
    _title = title;
    
    self.titleLabelz.text = title;
}

@end
