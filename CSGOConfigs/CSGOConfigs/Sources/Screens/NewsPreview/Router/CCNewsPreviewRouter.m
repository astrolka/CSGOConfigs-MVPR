//
//  CCNewsPreviewRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsPreviewRouter.h"
#import "CCNewsPreviewViewController.h"
#import "CCNewsPreviewPresenter.h"

@implementation CCNewsPreviewRouter

- (id <CCNewsPreviewViewProtocol>)buildNewsPreviewModule {
    CCNewsPreviewViewController *viewController = [[CCNewsPreviewViewController alloc] init];
    CCNewsPreviewPresenter *presenter = [[CCNewsPreviewPresenter alloc] initWithView:viewController router:self];
    #pragma unused(presenter)
    return viewController;
}

@end
