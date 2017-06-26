//
//  CCPlayerDescriptionRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 11.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayerDescriptionRouter.h"
#import "CCPlayerDescriptionViewController.h"
#import "CCRouter+ViewModelAlertPresenter.h"
#import "CCPlayerDescriptionPresenter.h"
#import "CCMailScreenRouting.h"
#import "CCRouter+WebScreen.h"

@implementation CCPlayerDescriptionRouter

#pragma mark - CCViewModelAlertRoutingProtocol

- (void)showViewModelAlert:(CCViewModelAlert *)viewModelAlert {
    [self cc_presentViewModelAlert:viewModelAlert];
}

#pragma mark - CCMailScreenRoutingProtocol

- (void)openEmailScreenWithEmailInfo:(CCEmailInfo *)emailInfo withResult:(mailResultBlock)result {
    CCMailScreenRouting *mailRouter = [[CCMailScreenRouting alloc] initWithNavigationController:self.navigationController];
    [mailRouter openEmailScreenWithEmailInfo:emailInfo withResult:^(CCMailResult mailRouterResult) {
        result(mailRouterResult);
    }];
}

#pragma mark - CCWebRoutingProtocol

- (void)goToWebScreenWithURL:(NSURL *)url {
    [self cc_goToWebScreenWithURL:url];
}

#pragma mark - Public

- (void)goToPlayerDescriptionScreenWithPlayerID:(NSUInteger)playerID {
    CCPlayerDescriptionViewController *view = [[CCPlayerDescriptionViewController alloc] init];
    CCPlayerDescriptionPresenter *presenter = [[CCPlayerDescriptionPresenter alloc] initWithView:view router:self playerID:playerID];
    #pragma unused(presenter)
    [self.navigationController pushViewController:view animated:YES];
}

@end
