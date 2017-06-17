//
//  CCPlayersPreviewViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>
#import "CCSpinerViewProtocol.h"
#import "CCMessageViewProtocol.h"
#import "CCBannerViewProtocol.h"
#import "CCBannerViewProtocol.h"
@class UIView;
@class CCPlayerPreviewViewModel;
@class CCBannerViewModel;
@protocol CCPlayersPreviewViewProtocol;

@protocol CCPlayersPreviewViewActionProtocol <NSObject>

- (void)playersPreviewViewDidSet:(id <CCPlayersPreviewViewProtocol>)view;

- (void)playersPreviewViewDidOpenMenu:(id <CCPlayersPreviewViewProtocol>)view;

- (void)playersPreviewView:(id <CCPlayersPreviewViewProtocol>)view didSelectPlayerAtIndex:(NSUInteger)index;

- (void)playersPreviewView:(id <CCPlayersPreviewViewProtocol>)view didScrollPlayerAtIndex:(NSUInteger)index;

@end

@protocol CCPlayersPreviewViewProtocol <CCSpinerViewProtocol, CCMessageViewProtocol>

@property (nonatomic, strong) id <CCPlayersPreviewViewActionProtocol> viewAction;

- (id)initWithBannerView:(UIView <CCBannerViewProtocol> *)bannerView;

- (void)showPlayers:(NSArray <CCPlayerPreviewViewModel *> *)players;

- (CGFloat)cellContainerWidth;

@end
