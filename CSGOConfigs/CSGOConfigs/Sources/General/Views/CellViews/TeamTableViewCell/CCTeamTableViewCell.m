//
//  CCTeamTableViewCell.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 10.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCTeamTableViewCell.h"
#import "CCTeamViewModel.h"
#import "CCPlayerPreviewCollectionViewCell.h"
#import "UIColor+CC.h"
#import "UIFont+CC.h"
#import "Masonry.h"
#import "UIImageView+URL.h"

@interface CCTeamTableViewCell () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UIView *titleContainerView;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation CCTeamTableViewCell

CGFloat const kTitleHeaderHeight = 35.f;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self titleContainerViewSetup];
        [self iconImageViewSetup];
        [self titleLabelSetup];
        [self collectionViewSetup];
    }
    return self;
}

#pragma mark - View

- (void)titleContainerViewSetup {
    self.titleContainerView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self.contentView addSubview:self.titleContainerView];
    [self.titleContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.contentView);
        make.height.equalTo(@(kTitleHeaderHeight));
    }];
}

- (void)titleLabelSetup {
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabel.font = [UIFont cc_mediumFontWithSize:15];
    self.titleLabel.textColor = [UIColor cc_themeColor];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    [self.titleContainerView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(6);
        make.top.right.bottom.equalTo(self.titleContainerView);
    }];
}

- (void)iconImageViewSetup {
    self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.titleContainerView addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleContainerView).offset(8);
        make.bottom.equalTo(self.titleContainerView).offset(-8);
        make.left.equalTo(self.titleContainerView).offset(8);
        make.width.equalTo(self.iconImageView.mas_height);
    }];
}

- (void)collectionViewSetup {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = layout.minimumInteritemSpacing = 8;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.layer.cornerRadius = 6.f;
    self.collectionView.layer.masksToBounds = YES;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[CCPlayerPreviewCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([CCPlayerPreviewCollectionViewCell class])];
    
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleContainerView.mas_bottom);
        make.right.bottom.equalTo(self.contentView).offset(-8);
        make.left.equalTo(self.contentView).offset(8);
    }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.team.players.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CCPlayerPreviewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CCPlayerPreviewCollectionViewCell class])
                                                                                        forIndexPath:indexPath];
    cell.player = self.team.players[indexPath.row];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.viewAction) {
        self.viewAction(self, indexPath.row);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(80, self.collectionView.bounds.size.height);
}

#pragma mark - Public

- (void)setTeam:(CCTeamViewModel *)team {
    _team = team;
    
    self.titleLabel.text = team.name;
    [self.iconImageView cc_setImageWithURL:team.imageURL];
    [self.collectionView reloadData];
}

@end
