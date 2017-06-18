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
#import <RESideMenu/RESideMenu.h>

@interface CCNewsPreviewRouter ()

@property (nonatomic, strong) id <CCNewsPreviewViewProtocol> view;

@end

@implementation CCNewsPreviewRouter

#pragma mark - CCNewsPreviewRouterProtocol

- (void)goToNewsDescriptionScreenWithNewsID:(NSUInteger)newsID {
    
}

#pragma mark - CCOpenSideMenuRouterProtocol

- (void)openSideMenu {
    UIViewController *viewController = (UIViewController *)self.view;
    [viewController.sideMenuViewController presentLeftMenuViewController];
}

#pragma mark - BuildModule

- (id <CCNewsPreviewViewProtocol>)buildNewsPreviewModule {
    self.view = [[CCNewsPreviewViewController alloc] init];
    CCNewsPreviewPresenter *presenter = [[CCNewsPreviewPresenter alloc] initWithView:self.view router:self];
    #pragma unused(presenter)
    return self.view;
}

@end
