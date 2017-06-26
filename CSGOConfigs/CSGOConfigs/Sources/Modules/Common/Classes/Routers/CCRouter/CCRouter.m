//
//  CCRouter.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter.h"

@implementation CCRouter

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController {
    self = [super init];
    if (self) {
        self.navigationController = navigationController;
    }
    return self;
}

@end
