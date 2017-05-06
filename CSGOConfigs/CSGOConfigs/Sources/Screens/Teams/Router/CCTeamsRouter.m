//
//  CCTeamsRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCTeamsRouter.h"
#import "CCTeamsViewController.h"
#import "CCTeamsPresenter.h"

@implementation CCTeamsRouter

- (id <CCTeamsViewProtocol>)buildTeamsModule {
    CCTeamsViewController *viewController = [[CCTeamsViewController alloc] init];
    CCTeamsPresenter *presenter = [[CCTeamsPresenter alloc] initWithView:viewController router:self];
    #pragma unused(presenter)
    return viewController;
}

@end
