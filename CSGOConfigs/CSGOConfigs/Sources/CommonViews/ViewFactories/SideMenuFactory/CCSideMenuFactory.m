//
//  CCSideMenuFactory.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 02.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCSideMenuFactory.h"
#import <UIKit/UIKit.h>

@implementation CCSideMenuFactory

+ (UIBarButtonItem *)menuBarButtonWithSelector:(SEL)selector forObject:(id)object {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"sideMenuIcon"] forState:UIControlStateNormal];
    if ([object respondsToSelector:selector]) {
        [button addTarget:object action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    [button sizeToFit];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    return barButtonItem;
}

@end
