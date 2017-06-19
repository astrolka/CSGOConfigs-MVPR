//
//  CCTeamsViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCTeamViewModel.h"
#import "CCSpinerViewProtocol.h"
#import "CCMessageViewProtocol.h"
#import "CCBannerViewProtocol.h"
@class UIView;
@protocol CCTeamsViewProtocol;

@protocol CCTeamsViewActionProtocol <NSObject>

- (void)teamsViewDidSet:(id <CCTeamsViewProtocol>)view;

- (void)teamsViewDidOpenMenu:(id <CCTeamsViewProtocol>)view;

- (void)teamsView:(id <CCTeamsViewProtocol>)view didSelectTeamAtIndex:(NSUInteger)teamIndex playerIndex:(NSUInteger)playerIndex;

- (void)teamsView:(id <CCTeamsViewProtocol>)view didScrollPlayerAtIndex:(NSUInteger)index;

@end

@protocol CCTeamsViewProtocol <CCSpinerViewProtocol, CCMessageViewProtocol>

@property (nonatomic, strong) id <CCTeamsViewActionProtocol> viewAction;

- (id)initWithBannerView:(UIView <CCBannerViewProtocol> *)bannerView;

- (void)showTeams:(NSArray <CCTeamViewModel *> *)teams;

@end
