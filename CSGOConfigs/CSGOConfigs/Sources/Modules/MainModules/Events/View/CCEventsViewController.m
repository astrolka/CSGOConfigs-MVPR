//
//  CCEventsViewController.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCEventsViewController.h"

@interface CCEventsViewController ()

@end

@implementation CCEventsViewController

@synthesize viewAction;

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
}

#pragma mark - CCEventsViewProtocol

- (void)showListEvents:(NSArray <CCEventViewModel *> *)events {
    
}

- (void)showMapEvents:(NSArray <CCAnnotationEventViewModel *> *)events {
    
}

@end
