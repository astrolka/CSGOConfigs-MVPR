//
//  UIImageView+Animation.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 10.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "UIImageView+Animation.h"

@implementation UITableView (Animation)

- (void)reloadDataWithAnimation:(CCAnimationType)animation {
    switch (animation) {
        case CCAnimationTypeFluentlyUp:
            [self cc_fluentlyUpReload];
            break;
        default:
            [self reloadData];
            break;
    }
}

- (void)cc_fluentlyUpReload {
    [self reloadData];
    
    [self.visibleCells enumerateObjectsUsingBlock:^(UITableViewCell *cell, NSUInteger idx, BOOL * _Nonnull stop) {
        cell.transform = CGAffineTransformMakeTranslation(0, self.bounds.size.height);
    }];
    
    __block NSInteger delayCounter = 0.f;
    [self.visibleCells enumerateObjectsUsingBlock:^(UITableViewCell *cell, NSUInteger idx, BOOL * _Nonnull stop) {
        [UIView animateWithDuration:1.75f
                              delay:delayCounter * 0.05
             usingSpringWithDamping:0.8
              initialSpringVelocity:0
                            options:UIViewAnimationOptionCurveEaseInOut animations:^{
                                cell.transform = CGAffineTransformIdentity;
                            } completion:nil];
        
        delayCounter += 1.f;
    }];
}

@end
