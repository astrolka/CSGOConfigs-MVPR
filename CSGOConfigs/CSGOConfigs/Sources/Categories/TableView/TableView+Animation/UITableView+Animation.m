//
//  UIImageView+Animation.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 10.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "UITableView+Animation.h"

@implementation UITableView (Animation)

- (void)cc_fluentReloadData {
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

- (void)cc_dropDownReloadDataInSection:(NSUInteger)section {
    NSRange range = NSMakeRange(section, 1);
    NSIndexSet *sections = [NSIndexSet indexSetWithIndexesInRange:range];
    [self reloadSections:sections withRowAnimation:UITableViewRowAnimationFade];
}

@end
