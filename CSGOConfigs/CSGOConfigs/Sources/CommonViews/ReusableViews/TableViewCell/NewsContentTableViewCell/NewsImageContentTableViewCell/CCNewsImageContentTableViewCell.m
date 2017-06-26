//
//  CCNewsImageContentTableViewCell.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 19.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsImageContentTableViewCell.h"
#import "CCNewsImageContentViewModel.h"
#import "CCNewsContentViewModel.h"
#import "UIImageView+URL.h"
#import "Masonry.h"

@interface CCNewsImageContentTableViewCell ()

@property (nonatomic, strong) UIImageView *coverImageView;

@end

@implementation CCNewsImageContentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self coverImageViewSetup];
    }
    return self;
}

#pragma mark - UI Setup

- (void)coverImageViewSetup {
    self.coverImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.coverImageView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.coverImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    [self.contentView addSubview:self.coverImageView];
    [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(8, 8, 8, 8));
    }];
}

#pragma mark - Public

- (void)setNewsContentViewModel:(CCNewsContentViewModel *)newsContentViewModel {
    _newsContentViewModel = newsContentViewModel;
    
    [self.coverImageView cc_setImageWithURL:[(CCNewsImageContentViewModel *)newsContentViewModel coverImageURL]];
}

@end
