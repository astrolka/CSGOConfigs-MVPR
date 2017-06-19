//
//  CCNewsPreviewTableViewCell.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsPreviewTableViewCell.h"
#import "CCNewsPreviewViewModel.h"
#import "UIColor+CC.h"
#import "UIImageView+URL.h"
#import "UIFont+CC.h"
#import "Masonry.h"

@interface CCNewsPreviewTableViewCell ()

@property (nonatomic, strong) UIImageView *imageViewz;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation CCNewsPreviewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self imageViewzSetup];
        [self titleLabelSetup];
    }
    return self;
}

#pragma mark - View

- (void)imageViewzSetup {
    self.imageViewz = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.imageViewz.contentMode = UIViewContentModeCenter;
    self.imageViewz.clipsToBounds = YES;
    
    [self.contentView addSubview:self.imageViewz];
    [self.imageViewz mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

- (void)titleLabelSetup {
    UIView *titleContainerView = [[UIView alloc] initWithFrame:CGRectZero];
    titleContainerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    
    [self.contentView addSubview:titleContainerView];
    [titleContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.contentView);
        make.height.equalTo(@35);
    }];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont cc_regualarFontWithSize:16];
    
    [titleContainerView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleContainerView).offset(8);
        make.right.equalTo(titleContainerView).offset(-8);
        make.top.bottom.equalTo(titleContainerView);
    }];
}

#pragma mark - ParallaxEffect

- (void)setImageOffset:(CGPoint)imageOffset {
    CGRect frame = self.imageViewz.frame;
    frame.origin = imageOffset;
    self.imageViewz.frame = frame;
}

- (void)updateImageViewCellOffset {
    UITableView *tableView = (UITableView *)self.superview.superview;
    CGFloat imageOverflowHeight = self.imageViewz.image.size.height - self.imageViewz.bounds.size.height;
    CGFloat cellOffset = self.frame.origin.y - tableView.contentOffset.y;
    CGFloat maxOffset = tableView.frame.size.height - self.frame.size.height;
    CGFloat verticalOffset = imageOverflowHeight * (0.5f - cellOffset / maxOffset);
    self.imageOffset = CGPointMake(0.f, verticalOffset);
}

#pragma mark - Public

- (void)setNews:(CCNewsPreviewViewModel *)news {
    _news = news;
    
    self.titleLabel.text = news.title;
    [self.imageViewz cc_setImageWithURL:news.imageURL];
}

@end
