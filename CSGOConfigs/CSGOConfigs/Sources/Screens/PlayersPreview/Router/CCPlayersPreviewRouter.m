//
//  CCPlayersPreviewRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayersPreviewRouter.h"
#import "CCPlayersPreviewViewController.h"
#import "CCPlayersPreviewPresenter.h"

@implementation CCPlayersPreviewRouter

- (id <CCPlayersPreviewViewProtocol>)buildPlayersPreviewModule {
    CCPlayersPreviewViewController *viewController = [[CCPlayersPreviewViewController alloc] init];
    CCPlayersPreviewPresenter *presenter = [[CCPlayersPreviewPresenter alloc] initWithView:viewController router:self];
    #pragma unused(presenter)
    return viewController;
}

@end
