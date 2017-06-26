//
//  CCFavoritePlayersViewProtocol.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCPlayerPreviewViewModel.h"
@protocol CCFavoritePlayersViewProtocol;

@protocol CCFavoritePlayersViewActionProtocol <NSObject>

- (void)favoritePlayersViewDidSet:(id <CCFavoritePlayersViewProtocol>)view;

- (void)favoritePlayersViewDidOpenMenu:(id <CCFavoritePlayersViewProtocol>)view;

- (void)favoritePlayersView:(id <CCFavoritePlayersViewProtocol>)view didSelectPlayerAtIndex:(NSUInteger)index;

@end

@protocol CCFavoritePlayersViewProtocol <NSObject>

@property (nonatomic, strong) id <CCFavoritePlayersViewActionProtocol> viewAction;

- (void)showPlayers:(NSArray <CCPlayerPreviewViewModel *> *)players;

- (CGFloat)cellContainerWidth;

@end
