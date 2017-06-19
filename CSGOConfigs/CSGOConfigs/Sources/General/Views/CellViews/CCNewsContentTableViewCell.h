//
//  CCNewsContentTableViewCell.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 19.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCNewsContentViewModel;

@interface CCNewsContentTableViewCell : UITableViewCell

@property (nonatomic, strong) CCNewsContentViewModel *newsContentViewModel;

@end
