
//
//  CCEventsRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCEventsRouter.h"
#import "CCEventsViewController.h"
#import "CCEventsPresenter.h"

@interface CCEventsRouter ()

@end

@implementation CCEventsRouter

- (id <CCEventsViewProtocol>)buildMapEventsModule {
    CCEventsViewController *mapEventsViewController = [[CCEventsViewController alloc] init];
    CCEventsPresenter *presenter = [[CCEventsPresenter alloc] initWithView:mapEventsViewController router:self];
    #pragma unused(presenter)
    return mapEventsViewController;
}

@end
