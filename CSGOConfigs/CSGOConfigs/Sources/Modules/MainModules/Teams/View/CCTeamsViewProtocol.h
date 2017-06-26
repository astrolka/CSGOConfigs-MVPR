//
//  CCTeamsViewProtocol.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCMessageViewProtocol.h"
#import "CCSpinerViewProtocol.h"
#import "CCBannerViewProtocol.h"
#import "CCTeamViewModel.h"
@protocol CCTeamsViewProtocol;
@class UIView;

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
