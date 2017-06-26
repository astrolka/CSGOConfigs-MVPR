//
//  CCTeamTableViewCell.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 10.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCTeamTableViewCell;
@class CCTeamViewModel;

typedef void(^didSelectPlayerAtIndex)(CCTeamTableViewCell *cell, NSUInteger index);

@interface CCTeamTableViewCell : UITableViewCell

@property (nonatomic, copy) didSelectPlayerAtIndex viewAction;

@property (nonatomic, strong) CCTeamViewModel *team;

@end
