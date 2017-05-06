//
//  CCMapEventsRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCMapEventsRouter.h"
#import "CCMapEventsPresenter.h"
#import "CCMapEventsViewController.h"

@implementation CCMapEventsRouter

- (id <CCMapEventsViewProtocol>)buildMapEventsModule {
    CCMapEventsViewController *mapEventsViewController = [[CCMapEventsViewController alloc] init];
    CCMapEventsPresenter *presenter = [[CCMapEventsPresenter alloc] initWithView:mapEventsViewController router:self];
    #pragma unused(presenter)
    return mapEventsViewController;
}

@end
