//
//  CCPlayerDescriptionRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 11.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayerDescriptionRouter.h"
#import "CCPlayerDescriptionViewController.h"
#import "CCPlayerDescriptionPresenter.h"
#import "CCRouter+WebScreen.h"

@implementation CCPlayerDescriptionRouter

#pragma mark - CCWebRoutingProtocol

- (void)goToWebScreenWithURL:(NSURL *)url {
    [self cc_goToWebScreenWithURL:url];
}

- (void)goToPlayerDescriptionScreenWithPlayerID:(NSUInteger)playerID {
    CCPlayerDescriptionViewController *view = [[CCPlayerDescriptionViewController alloc] init];
    CCPlayerDescriptionPresenter *presenter = [[CCPlayerDescriptionPresenter alloc] initWithView:view router:self playerID:playerID];
    #pragma unused(presenter)
    [self.navigationController pushViewController:view animated:YES];
}

@end
