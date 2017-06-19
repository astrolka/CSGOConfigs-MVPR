//
//  CCNewsImageContentTableViewCell.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 19.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsContentTableViewCell.h"
@class CCNewsContentViewModel;

@interface CCNewsImageContentTableViewCell : CCNewsContentTableViewCell

@property (nonatomic, strong) CCNewsContentViewModel *newsContentViewModel;

@end
