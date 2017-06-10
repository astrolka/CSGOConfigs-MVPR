//
//  CCBannerView.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 02.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCBannerView.h"
#import "CCBannerViewModel.h"
#import "CCBannerCollectionViewCell.h"
#import "UIColor+CC.h"
#import "UIFont+CC.h"
#import "Masonry.h"

@interface CCBannerView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSArray <CCBannerViewModel *> *banners;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation CCBannerView

#pragma mark - Public

- (instancetype)initWithPageControl:(BOOL)pageControl {
    self = [self initWithFrame:CGRectZero];
    if (self) {
        [self collectionViewSetup];
        (!pageControl) ?: [self pageControlSetup];
    }
    return self;
}

- (void)showBanners:(NSArray <CCBannerViewModel *> *)banners {
    self.banners = banners;
    self.pageControl.numberOfPages = banners.count;
    [self.collectionView reloadData];
}

#pragma mark - Private

- (void)collectionViewSetup {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor cc_themeColor];
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
    if (self.viewAction) {
        self.viewAction(self, indexPath.row);
    }
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

@end
