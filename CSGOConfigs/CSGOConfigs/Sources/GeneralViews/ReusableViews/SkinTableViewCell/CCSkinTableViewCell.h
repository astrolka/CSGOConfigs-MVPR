//
//  CCSkinTableViewCell.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCSkinViewModel;

@interface CCSkinTableViewCell : UITableViewCell

@property (nonatomic, strong) CCSkinViewModel *skin;

+ (CGFloat)defaultCellHeight;

@end
