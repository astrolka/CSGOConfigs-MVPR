//
//  CCViewModelAlertAction.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCViewModelAlertAction.h"

@implementation CCViewModelAlertAction

- (instancetype)initWithTitle:(NSString *)title action:(CCViewModelAlertActionBlock)action {
    self = [super init];
    if (self) {
        self.title = title;
        self.action = action;
    }
    return self;
}

+ (instancetype)cancelActionWithAction:(CCViewModelAlertActionBlock)action {
    CCViewModelAlertAction *alertAction = [[self alloc] initWithTitle:NSLocalizedString(@"", nil) action:action];
    return alertAction;
}

@end
