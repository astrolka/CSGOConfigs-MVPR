//
//  CCSideMenuModel.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCSideMenuModel.h"

@implementation CCSideMenuModel

- (instancetype)initWithTitle:(NSString *)title icon:(UIImage *)icon appSection:(CCSideMenuViewAppSections)appSection {
    self = [super init];
    if (self) {
        self.title = title;
        self.icon = icon;
        self.appSection = appSection;
    }
    return self;
}

@end
