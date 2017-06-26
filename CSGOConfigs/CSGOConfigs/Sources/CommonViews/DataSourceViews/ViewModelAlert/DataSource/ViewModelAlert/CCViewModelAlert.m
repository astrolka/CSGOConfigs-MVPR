//
//  CCViewModelAlert.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCViewModelAlert.h"

@interface CCViewModelAlert ()

@property (nonatomic, strong, readwrite) NSMutableArray <CCViewModelAlertAction *> *actions;

@end

@implementation CCViewModelAlert

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message {
    self = [super init];
    if (self) {
        self.style = CCViewModelAlertStyleAlert;
        self.title = title;
        self.message = message;
        self.actions = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addAction:(CCViewModelAlertAction *)action {
    NSParameterAssert(action);
    [self.actions addObject:action];
}

@end
