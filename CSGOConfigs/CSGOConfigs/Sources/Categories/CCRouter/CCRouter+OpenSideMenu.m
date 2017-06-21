//
//  CCRouter+OpenSideMenu.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter+OpenSideMenu.h"
#import <UIKit/UIViewController.h>
#import <RESideMenu/RESideMenu.h>

@implementation CCRouter (OpenSideMenu)

- (void)cc_openSideMenu {
    UIViewController *viewController = self.navigationController.topViewController;
    [viewController.sideMenuViewController presentLeftMenuViewController];
}


@end
