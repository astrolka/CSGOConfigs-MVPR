//
//  CCBannerView.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 02.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCBannerView.h"
#import "CCBannerCollectionViewCell.h"
#import "UIView+CCMessageView.h"
#import "CCBannerViewModel.h"
#import "UIView+CCSpiner.h"
#import "UIColor+CC.h"
#import "UIFont+CC.h"
#import "Masonry.h"

@interface CCBannerView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) NSArray <CCBannerViewModel *> *banners;

@end

@implementation CCBannerView

@synthesize viewAction;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self collectionViewSetup];
        [self pageControlSetup];
    }
    return self;
}

- (void)didMoveToSuperview {
    [self.viewAction bannerViewDidSet:self];
}

#pragma mark - UI Setup

- (void)collectionViewSetup {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.backgroundColor = [[UIColor cc_themeColor] colorWithAlphaComponent:0.5];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.layer.cornerRadius = 6.f;
    self.collectionView.layer.masksToBounds = YES;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[CCBannerCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([CCBannerCollectionViewCell class])];
    
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(6, 6, 6, 6));
    }];
}

- (void)pageControlSetup {
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
    self.pageControl.currentPageIndicatorTintColor = [UIColor cc_themeColor];
    self.pageControl.numberOfPages = 0;
    
    [self addSubview:self.pageControl];
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.equalTo(@30);
    }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.banners.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CCBannerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CCBannerCollectionViewCell class])
                                                                                 forIndexPath:indexPath];
    cell.banner = self.banners[indexPath.row];
    return cell;
}

#pragma mark -UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.viewAction bannerView:self didSelectBannerAtIndex:indexPath.row];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.collectionView.bounds.size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.pageControl.currentPage = self.collectionView.contentOffset.x / self.collectionView.bounds.size.width;
}

#pragma mark - CCBannerViewProtocol

- (void)showBanners:(NSArray <CCBannerViewModel *> *)banners {
    self.banners = banners;
    self.pageControl.numberOfPages = banners.count;
    [self.collectionView reloadData];
}

- (void)updateBannerHeight:(CGFloat)height {
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(height));
    }];
    
    [UIView animateWithDuration:0.4 animations:^{
        [self layoutIfNeeded];
    }];
}

#pragma mark - CCSpinerViewProtocol

- (void)showSpiner {
    [self cc_showSpiner];
}

- (void)hideSpiner {
    [self cc_hideSpiner];
}

@end
