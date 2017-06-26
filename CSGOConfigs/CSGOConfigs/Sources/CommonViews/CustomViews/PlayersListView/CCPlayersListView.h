//
//  CCPlayersListView.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 02.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCPlayersListView;
@class CCPlayerPreviewViewModel;

@protocol CCPlayersListViewActionProtocol <NSObject>

- (void)playersListView:(CCPlayersListView *)view didSelectPlayerAtIndex:(NSUInteger)index;

@optional

- (void)playersListView:(CCPlayersListView *)view didScrollPlayerAtIndex:(NSUInteger)index;

@end

@interface CCPlayersListView : UIView

@property (nonatomic, weak) id <CCPlayersListViewActionProtocol> viewAction;

@property (nonatomic, strong, readonly) UICollectionView *collectionView;

- (instancetype)initWithColumnsInSection:(NSUInteger)columnsInSection cellSpaces:(CGFloat)space;

- (void)showPlayers:(NSArray <CCPlayerPreviewViewModel *> *)players;

@end
