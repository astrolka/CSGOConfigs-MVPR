//
//  CCEventTableViewCell.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCEventViewModel;

@interface CCEventTableViewCell : UITableViewCell

@property (nonatomic, strong) CCEventViewModel *event;

+ (CGFloat)defaultCellHeight;

@end
