//
//  CCPlayersListView.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 02.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayersListView.h"
#import "PDKTCollectionViewWaterfallLayout.h"
#import "CCPlayerPreviewCollectionViewCell.h"
#import "CCPlayerPreviewViewModel.h"
#import "Masonry.h"

@interface CCPlayersListView () <UICollectionViewDataSource, UICollectionViewDelegate, PDKTCollectionViewWaterfallLayoutDelegate>

@property (nonatomic, strong, readwrite) UICollectionView *collectionView;

@property (nonatomic, assign) CGFloat cellSpaces;
@property (nonatomic, assign) NSUInteger columnsInSection;

@property (nonatomic, strong) NSMutableArray <CCPlayerPreviewViewModel *> *players;

@end

@implementation CCPlayersListView

@synthesize viewAction;

- (instancetype)initWithColumnsInSection:(NSUInteger)columnsInSection cellSpaces:(CGFloat)space {
    self = [self initWithFrame:CGRectZero];
    if (self) {
        self.columnsInSection = columnsInSection;
        self.cellSpaces = space;
        self.players = [[NSMutableArray alloc] init];
        [self collectionViewSetup];
    }
    return self;
}

#pragma mark - UI Setup

- (void)collectionViewSetup {
    PDKTCollectionViewWaterfallLayout *layout = [[PDKTCollectionViewWaterfallLayout alloc] init];
    layout.delegate = self;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[CCPlayerPreviewCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([CCPlayerPreviewCollectionViewCell class])];
    
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(0, self.cellSpaces, self.cellSpaces, self.cellSpaces));
    }];
}

#pragma mark - CCPlayersViewProtocol

- (void)showPlayers:(NSArray <CCPlayerPreviewViewModel *> *)players {
    [self.players addObjectsFromArray:players];
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.players.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CCPlayerPreviewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CCPlayerPreviewCollectionViewCell class])
                                                                                        forIndexPath:indexPath];
    cell.player = self.players[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.viewAction respondsToSelector:@selector(playersListView:didScrollPlayerAtIndex:)]) {
        [self.viewAction playersListView:self didScrollPlayerAtIndex:indexPath.row];
    }
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.viewAction playersListView:self didSelectPlayerAtIndex:indexPath.row];
}

#pragma mark - PDKTCollectionViewWaterfallLayoutDelegate

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(PDKTCollectionViewWaterfallLayout *)collectionViewLayout heightItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.players[indexPath.row].imageHeight + [CCPlayerPreviewCollectionViewCell cellHeightWithoutImageView];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(PDKTCollectionViewWaterfallLayout *)collectionViewLayout itemSpacingInSection:(NSUInteger)section {
    return self.cellSpaces;
}

- (NSUInteger)collectionView:(UICollectionView *)collectionView layout:(PDKTCollectionViewWaterfallLayout *)collectionViewLayout numberOfColumnsInSection:(NSUInteger)section {
    return self.columnsInSection;
}

- (BOOL)shouldStickHeaderToTopInSection:(NSUInteger)section {
    return NO;
}

@end
