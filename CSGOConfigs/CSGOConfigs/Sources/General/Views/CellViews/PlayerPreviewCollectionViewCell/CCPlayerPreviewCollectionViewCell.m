//
//  CCPlayerPreviewCollectionViewCell.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 02.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayerPreviewCollectionViewCell.h"
#import "UIImageView+URL.h"
#import "CCPlayerPreviewViewModel.h"
#import "UIColor+CC.h"
#import "UIFont+CC.h"
#import "Masonry.h"

@interface CCPlayerPreviewCollectionViewCell ()

@property (nonatomic, strong) UILabel *nickNameLabel;
@property (nonatomic, strong) UIImageView *profileImageView;

@end

@implementation CCPlayerPreviewCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.layer.cornerRadius = 6.f;
        self.contentView.layer.masksToBounds = YES;
        self.contentView.backgroundColor = [UIColor cc_themeColor];
        [self nickLabelSetup];
        [self profileImageViewSetup];
    }
    return self;
}

#pragma mark - Public

+ (CGFloat)cellHeightWithoutImageView {
    return 35.f;
}

- (void)setPlayer:(CCPlayerPreviewViewModel *)player {
    _player = player;
    
    self.nickNameLabel.text = player.nickName;
    [self.profileImageView cc_setImageWithURL:player.imageURL];
}

#pragma mark - Private

- (void)nickLabelSetup {
    self.nickNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.nickNameLabel.textColor = [UIColor whiteColor];
    self.nickNameLabel.textAlignment = NSTextAlignmentCenter;
    self.nickNameLabel.font = [UIFont cc_regualarFontWithSize:16];
    
    [self.contentView addSubview:self.nickNameLabel];
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.contentView);
        make.height.mas_equalTo([CCPlayerPreviewCollectionViewCell cellHeightWithoutImageView]);
    }];
}

- (void)profileImageViewSetup {
    self.profileImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.profileImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    [self.contentView addSubview:self.profileImageView];
    [self.profileImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.nickNameLabel.mas_top);
    }];
}

@end
