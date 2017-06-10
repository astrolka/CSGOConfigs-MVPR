//
//  CCTeamsView.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 10.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCTeamViewModel;
@class CCTeamsListView;

@protocol CCTeamsListViewActionProtocol <NSObject>

- (void)teamsListView:(CCTeamsListView *)view didSelectTeamAtIndex:(NSUInteger)teamIndex playerAtIndex:(NSUInteger)playerIndex;

- (void)teamsListView:(CCTeamsListView *)view didScrollTeamAtIndex:(NSUInteger)index;

@end

@interface CCTeamsListView : UIView

@property (nonatomic, weak) id <CCTeamsListViewActionProtocol> viewAction;

- (void)showTeams:(NSArray <CCTeamViewModel *> *)teams;

@end
