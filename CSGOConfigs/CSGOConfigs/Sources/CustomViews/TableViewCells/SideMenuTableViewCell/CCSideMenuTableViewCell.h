//
//  CCSideMenuTableViewCell.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCSideMenuModel;

@interface CCSideMenuTableViewCell : UITableViewCell

@property (nonatomic, strong) CCSideMenuModel *sideMenuModel;

+ (CGFloat)defaultCellHeight;

@end
