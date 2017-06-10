//
//  CCBannerCollectionViewCell.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 03.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCBannerCollectionViewCell.h"
#import "UIImageView+URL.h"
#import "CCBannerViewModel.h"
#import "UIColor+CC.h"
#import "UIFont+CC.h"
#import "Masonry.h"

@interface CCBannerCollectionViewCell ()

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation CCBannerCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.contentView.backgroundColor = [UIColor cc_themeColor];
        [self imageViewSetup];
        [self titleLabelSetup];
    }
    return self;
}

- (void)setBanner:(CCBannerViewModel *)banner {
    _banner = banner;
    
    self.titleLabel.text = banner.title;
    [self.imageView cc_setImageWithURL:banner.imageURL];
}

- (void)titleLabelSetup {
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.font = [UIFont cc_regualarFontWithSize:15];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView).offset(8);
        make.top.equalTo(self.contentView).offset(4);
        make.height.equalTo(@20);
    }];
}

- (void)imageViewSetup {
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

@end
