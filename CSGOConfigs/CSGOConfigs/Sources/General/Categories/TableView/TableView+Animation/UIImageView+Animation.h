//
//  UIImageView+Animation.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 10.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Animation)

typedef enum {
    CCAnimationTypeFluentlyUp
} CCAnimationType;

- (void)reloadDataWithAnimation:(CCAnimationType)animation;

@end
