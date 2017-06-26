//
//  CCNewsDescriptionRouter.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsDescriptionRouter.h"
#import "CCNewsDescriptionViewController.h"
#import "CCNewsDescriptionViewProtocol.h"
#import "CCNewsDescriptionPresenter.h"
#import "CCRouter+WebScreen.h"

@implementation CCNewsDescriptionRouter

#pragma mark - CCWebRoutingProtocol

- (void)goToWebScreenWithURL:(NSURL *)url {
    [self cc_goToWebScreenWithURL:url];
}

#pragma mark - Public

- (void)goToNewsDescriptionScreenWithNewsID:(NSInteger)newsID {
    UIViewController *viewController = (UIViewController *)[self buildModuleWithNewsID:newsID];
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - Module Build

- (id <CCNewsDescriptionViewProtocol>)buildModuleWithNewsID:(NSInteger)newsID {
    CCNewsDescriptionViewController *view = [[CCNewsDescriptionViewController alloc] init];
    CCNewsDescriptionPresenter *presenter = [[CCNewsDescriptionPresenter alloc] initWithView:view router:self newsID:newsID];
    #pragma unused(presenter)
    return view;
}

@end
