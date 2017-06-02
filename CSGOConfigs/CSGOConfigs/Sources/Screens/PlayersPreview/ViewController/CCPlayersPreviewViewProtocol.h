//
//  CCPlayersPreviewViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>
@protocol CCPlayersPreviewViewProtocol;
@class CCPlayerPreviewViewModel;

@protocol CCPlayersPreviewViewActionProtocol <NSObject>

- (void)playersPreviewViewDidSet:(id <CCPlayersPreviewViewProtocol>)view;

- (void)playersPreviewViewDidOpenMenu:(id <CCPlayersPreviewViewProtocol>)view;

- (void)playersPreviewView:(id <CCPlayersPreviewViewProtocol>)view didSelectPlayerAtIndex:(NSUInteger)index;

- (void)playersPreviewView:(id <CCPlayersPreviewViewProtocol>)view didScrollPlayerAtIndex:(NSUInteger)index;

@end

@protocol CCPlayersPreviewViewProtocol <NSObject>

@property (nonatomic, strong) id <CCPlayersPreviewViewActionProtocol> viewAction;

- (CGFloat)cellContainerWidth;

- (void)showPlayers:(NSArray <CCPlayerPreviewViewModel *> *)players;

@end
